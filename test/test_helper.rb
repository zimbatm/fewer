require 'fewer'
require 'fileutils'
require 'pathname'
require 'test/unit'

require 'rubygems'
require 'active_support/core_ext/array/extract_options'
require 'leftright' if RUBY_VERSION < '1.9'
require 'less'
require 'mocha'
require 'rack/test'

require 'fakefs'

class FakeFS::File
  def self.join(*parts)
    RealFile.join(parts)
  end
end

module TestHelper
  private
    def decode(encoded)
      Fewer::Serializer.decode(fs, encoded)
    end

    def encode(paths)
      Fewer::Serializer.encode(fs, paths)
    end

    def fs(path = '')
      root = File.expand_path('../fs', __FILE__)
      FileUtils.mkdir_p(root)
      File.join(root, path)
    end

    def touch(path)
      pathed = fs(path)
      FileUtils.touch(pathed)
      pathed
    end
end
