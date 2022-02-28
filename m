Return-Path: <chee.yang.lee@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E74BC433EF
	for <webhook@archiver.kernel.org>; Mon, 28 Feb 2022 03:40:35 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.16230.1646019633714561008
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Feb 2022 19:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=j9EsgaxU;
 spf=pass (domain: intel.com, ip: 192.55.52.115,
 mailfrom: chee.yang.lee@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646019633; x=1677555633;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/o/SxMeuB2FjfuLj6zAuFmrltRocvLC8vPuBTkXWCYg=;
  b=j9EsgaxU/RohDCxaukja8pQxWNpeNp9XkoAWJ6yzSbih/nVjF88FQ5EU
   hejShvJKdpcUpIi2g7EeSvy3CP8JrH9+mlL8AOL4SGB7AdZ7J2ygX9tuN
   Ac6U88KnuSOyZ+TavuMsfJq37IsAH0KO6jvD0g4MkaabN3xcHir5v+kw+
   glpW9YCl4ffvPg8Tt0RoVo2A7OJu5jEdeLaFHNwCNADeJaN3labURbpde
   5wIzBQ3KIveMTJJlITDhANs5pA6BwfcoYum/MMjX9SlcLki13KXROgzgF
   Vl9jlsuvhkxmT69ZS2xdlWy3HwOk7y5l1g6PNqn3+X6gfkz9B5puexAkh
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10271"; a="252988312"
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="252988312"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2022 19:40:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,142,1643702400";
   d="scan'208";a="509942094"
Received: from cheeyang-desk1.png.intel.com ([10.158.87.104])
  by orsmga006.jf.intel.com with ESMTP; 27 Feb 2022 19:40:31 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][hardknott 1/3] ruby : update to 3.0.3
Date: Mon, 28 Feb 2022 11:38:37 +0800
Message-Id: <20220228033839.2386940-1-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 28 Feb 2022 03:40:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162448

From: Lee Chee Yang <chee.yang.lee@intel.com>

Do not tweak a file that is no longer installed.

Ruby 3.0.3 includes security fixes.
CVE-2021-41817: Regular Expression Denial of Service Vulnerability of Date Parsing Methods
CVE-2021-41816: Buffer Overrun in CGI.escape_html
CVE-2021-41819: Cookie Prefix Spoofing in CGI::Cookie.parse

Ruby 3.0.2 release includes security fixes.
CVE-2021-31810: Trusting FTP PASV responses vulnerability in Net::FTP
CVE-2021-32066: A StartTLS stripping vulnerability in Net::IMAP
CVE-2021-31799: A command injection vulnerability in RDoc

Signed-off-by: Lee Chee Yang <chee.yang.lee@intel.com>
---
 .../ruby/ruby/CVE-2021-31799.patch            |  57 ----
 .../ruby/ruby/CVE-2021-31810.patch            | 258 ------------------
 .../ruby/ruby/CVE-2021-32066.patch            | 102 -------
 .../ruby/{ruby_3.0.1.bb => ruby_3.0.3.bb}     |   7 +-
 4 files changed, 1 insertion(+), 423 deletions(-)
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
 delete mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
 rename meta/recipes-devtools/ruby/{ruby_3.0.1.bb => ruby_3.0.3.bb} (90%)

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
deleted file mode 100644
index 83064e85ab..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2021-31799.patch
+++ /dev/null
@@ -1,57 +0,0 @@
-From b1c73f239fe9af97de837331849f55d67c27561e Mon Sep 17 00:00:00 2001
-From: aycabta <aycabta@gmail.com>
-Date: Sun, 2 May 2021 20:52:23 +0900
-Subject: [PATCH] [ruby/rdoc] Use File.open to fix the OS Command Injection
- vulnerability in CVE-2021-31799
-
-https://github.com/ruby/rdoc/commit/a7f5d6ab88
-
-CVE: CVE-2021-31799
-
-Upstream-Status: Backport[https://github.com/ruby/ruby/commit/b1c73f239fe9af97de837331849f55d67c27561e]
-
-Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
----
- lib/rdoc/rdoc.rb            |  2 +-
- test/rdoc/test_rdoc_rdoc.rb | 12 ++++++++++++
- 2 files changed, 13 insertions(+), 1 deletion(-)
-
-diff --git a/lib/rdoc/rdoc.rb b/lib/rdoc/rdoc.rb
-index 680a8612f7..904625f105 100644
---- a/lib/rdoc/rdoc.rb
-+++ b/lib/rdoc/rdoc.rb
-@@ -444,7 +444,7 @@ def remove_unparseable files
-     files.reject do |file, *|
-       file =~ /\.(?:class|eps|erb|scpt\.txt|svg|ttf|yml)$/i or
-         (file =~ /tags$/i and
--         open(file, 'rb') { |io|
-+         File.open(file, 'rb') { |io|
-            io.read(100) =~ /\A(\f\n[^,]+,\d+$|!_TAG_)/
-          })
-     end
-diff --git a/test/rdoc/test_rdoc_rdoc.rb b/test/rdoc/test_rdoc_rdoc.rb
-index 3910dd4656..a83d5a1b88 100644
---- a/test/rdoc/test_rdoc_rdoc.rb
-+++ b/test/rdoc/test_rdoc_rdoc.rb
-@@ -456,6 +456,18 @@ def test_remove_unparseable_tags_vim
-     end
-   end
- 
-+  def test_remove_unparseable_CVE_2021_31799
-+    temp_dir do
-+      file_list = ['| touch evil.txt && echo tags']
-+      file_list.each do |f|
-+        FileUtils.touch f
-+      end
-+
-+      assert_equal file_list, @rdoc.remove_unparseable(file_list)
-+      assert_equal file_list, Dir.children('.')
-+    end
-+  end
-+
-   def test_setup_output_dir
-     Dir.mktmpdir {|d|
-       path = File.join d, 'testdir'
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
deleted file mode 100644
index 69d774e0b7..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
+++ /dev/null
@@ -1,258 +0,0 @@
-From 8cebc092cd18f4cfb669f66018ea8ffc6f408584 Mon Sep 17 00:00:00 2001
-From: Yusuke Endoh <mame@ruby-lang.org>
-Date: Wed, 7 Jul 2021 11:57:15 +0900
-Subject: [PATCH] Ignore IP addresses in PASV responses by default, and add new
- option use_pasv_ip
-
-This fixes CVE-2021-31810.
-Reported by Alexandr Savca.
-
-Co-authored-by: Shugo Maeda <shugo@ruby-lang.org>
-
-CVE: CVE-2021-31810
-
-Upstream-Status: Backport
-[https://github.com/ruby/ruby/commit/bf4d05173c7cf04d8892e4b64508ecf7902717cd]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/net/ftp.rb           |  15 +++-
- test/net/ftp/test_ftp.rb | 159 ++++++++++++++++++++++++++++++++++++++-
- 2 files changed, 170 insertions(+), 4 deletions(-)
-
-diff --git a/lib/net/ftp.rb b/lib/net/ftp.rb
-index 88e8655..d6f5cc3 100644
---- a/lib/net/ftp.rb
-+++ b/lib/net/ftp.rb
-@@ -98,6 +98,10 @@ module Net
-     # When +true+, the connection is in passive mode.  Default: +true+.
-     attr_accessor :passive
- 
-+    # When +true+, use the IP address in PASV responses.  Otherwise, it uses
-+    # the same IP address for the control connection.  Default: +false+.
-+    attr_accessor :use_pasv_ip
-+
-     # When +true+, all traffic to and from the server is written
-     # to +$stdout+.  Default: +false+.
-     attr_accessor :debug_mode
-@@ -206,6 +210,9 @@ module Net
-     #                          handshake.
-     #                          See Net::FTP#ssl_handshake_timeout for
-     #                          details.  Default: +nil+.
-+    # use_pasv_ip::  When +true+, use the IP address in PASV responses.
-+    #                Otherwise, it uses the same IP address for the control
-+    #                connection.  Default: +false+.
-     # debug_mode::  When +true+, all traffic to and from the server is
-     #               written to +$stdout+.  Default: +false+.
-     #
-@@ -266,6 +273,7 @@ module Net
-       @open_timeout = options[:open_timeout]
-       @ssl_handshake_timeout = options[:ssl_handshake_timeout]
-       @read_timeout = options[:read_timeout] || 60
-+      @use_pasv_ip = options[:use_pasv_ip] || false
-       if host
-         connect(host, options[:port] || FTP_PORT)
-         if options[:username]
-@@ -1371,7 +1379,12 @@ module Net
-         raise FTPReplyError, resp
-       end
-       if m = /\((?<host>\d+(?:,\d+){3}),(?<port>\d+,\d+)\)/.match(resp)
--        return parse_pasv_ipv4_host(m["host"]), parse_pasv_port(m["port"])
-+        if @use_pasv_ip
-+          host = parse_pasv_ipv4_host(m["host"])
-+        else
-+          host = @bare_sock.remote_address.ip_address
-+        end
-+        return host, parse_pasv_port(m["port"])
-       else
-         raise FTPProtoError, resp
-       end
-diff --git a/test/net/ftp/test_ftp.rb b/test/net/ftp/test_ftp.rb
-index 023e794..243d4ad 100644
---- a/test/net/ftp/test_ftp.rb
-+++ b/test/net/ftp/test_ftp.rb
-@@ -61,7 +61,7 @@ class FTPTest < Test::Unit::TestCase
-   end
- 
-   def test_parse227
--    ftp = Net::FTP.new
-+    ftp = Net::FTP.new(nil, use_pasv_ip: true)
-     host, port = ftp.send(:parse227, "227 Entering Passive Mode (192,168,0,1,12,34)")
-     assert_equal("192.168.0.1", host)
-     assert_equal(3106, port)
-@@ -80,6 +80,14 @@ class FTPTest < Test::Unit::TestCase
-     assert_raise(Net::FTPProtoError) do
-       ftp.send(:parse227, "227 ) foo bar (")
-     end
-+
-+    ftp = Net::FTP.new
-+    sock = OpenStruct.new
-+    sock.remote_address = OpenStruct.new
-+    sock.remote_address.ip_address = "10.0.0.1"
-+    ftp.instance_variable_set(:@bare_sock, sock)
-+    host, port = ftp.send(:parse227, "227 Entering Passive Mode (192,168,0,1,12,34)")
-+    assert_equal("10.0.0.1", host)
-   end
- 
-   def test_parse228
-@@ -2474,10 +2482,155 @@ EOF
-     end
-   end
- 
-+  def test_ignore_pasv_ip
-+    commands = []
-+    binary_data = (0..0xff).map {|i| i.chr}.join * 4 * 3
-+    server = create_ftp_server(nil, "127.0.0.1") { |sock|
-+      sock.print("220 (test_ftp).\r\n")
-+      commands.push(sock.gets)
-+      sock.print("331 Please specify the password.\r\n")
-+      commands.push(sock.gets)
-+      sock.print("230 Login successful.\r\n")
-+      commands.push(sock.gets)
-+      sock.print("200 Switching to Binary mode.\r\n")
-+      line = sock.gets
-+      commands.push(line)
-+      data_server = TCPServer.new("127.0.0.1", 0)
-+      port = data_server.local_address.ip_port
-+      sock.printf("227 Entering Passive Mode (999,0,0,1,%s).\r\n",
-+                  port.divmod(256).join(","))
-+      commands.push(sock.gets)
-+      sock.print("150 Opening BINARY mode data connection for foo (#{binary_data.size} bytes)\r\n")
-+      conn = data_server.accept
-+      binary_data.scan(/.{1,1024}/nm) do |s|
-+        conn.print(s)
-+      end
-+      conn.shutdown(Socket::SHUT_WR)
-+      conn.read
-+      conn.close
-+      data_server.close
-+      sock.print("226 Transfer complete.\r\n")
-+    }
-+    begin
-+      begin
-+        ftp = Net::FTP.new
-+        ftp.passive = true
-+        ftp.read_timeout *= 5 if defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? # for --jit-wait
-+        ftp.connect("127.0.0.1", server.port)
-+        ftp.login
-+        assert_match(/\AUSER /, commands.shift)
-+        assert_match(/\APASS /, commands.shift)
-+        assert_equal("TYPE I\r\n", commands.shift)
-+        buf = ftp.getbinaryfile("foo", nil)
-+        assert_equal(binary_data, buf)
-+        assert_equal(Encoding::ASCII_8BIT, buf.encoding)
-+        assert_equal("PASV\r\n", commands.shift)
-+        assert_equal("RETR foo\r\n", commands.shift)
-+        assert_equal(nil, commands.shift)
-+      ensure
-+        ftp.close if ftp
-+      end
-+    ensure
-+      server.close
-+    end
-+  end
-+
-+  def test_use_pasv_ip
-+    commands = []
-+    binary_data = (0..0xff).map {|i| i.chr}.join * 4 * 3
-+    server = create_ftp_server(nil, "127.0.0.1") { |sock|
-+      sock.print("220 (test_ftp).\r\n")
-+      commands.push(sock.gets)
-+      sock.print("331 Please specify the password.\r\n")
-+      commands.push(sock.gets)
-+      sock.print("230 Login successful.\r\n")
-+      commands.push(sock.gets)
-+      sock.print("200 Switching to Binary mode.\r\n")
-+      line = sock.gets
-+      commands.push(line)
-+      data_server = TCPServer.new("127.0.0.1", 0)
-+      port = data_server.local_address.ip_port
-+      sock.printf("227 Entering Passive Mode (127,0,0,1,%s).\r\n",
-+                  port.divmod(256).join(","))
-+      commands.push(sock.gets)
-+      sock.print("150 Opening BINARY mode data connection for foo (#{binary_data.size} bytes)\r\n")
-+      conn = data_server.accept
-+      binary_data.scan(/.{1,1024}/nm) do |s|
-+        conn.print(s)
-+      end
-+      conn.shutdown(Socket::SHUT_WR)
-+      conn.read
-+      conn.close
-+      data_server.close
-+      sock.print("226 Transfer complete.\r\n")
-+    }
-+    begin
-+      begin
-+        ftp = Net::FTP.new
-+        ftp.passive = true
-+        ftp.use_pasv_ip = true
-+        ftp.read_timeout *= 5 if defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? # for --jit-wait
-+        ftp.connect("127.0.0.1", server.port)
-+        ftp.login
-+        assert_match(/\AUSER /, commands.shift)
-+        assert_match(/\APASS /, commands.shift)
-+        assert_equal("TYPE I\r\n", commands.shift)
-+        buf = ftp.getbinaryfile("foo", nil)
-+        assert_equal(binary_data, buf)
-+        assert_equal(Encoding::ASCII_8BIT, buf.encoding)
-+        assert_equal("PASV\r\n", commands.shift)
-+        assert_equal("RETR foo\r\n", commands.shift)
-+        assert_equal(nil, commands.shift)
-+      ensure
-+        ftp.close if ftp
-+      end
-+    ensure
-+      server.close
-+    end
-+  end
-+
-+  def test_use_pasv_invalid_ip
-+    commands = []
-+    binary_data = (0..0xff).map {|i| i.chr}.join * 4 * 3
-+    server = create_ftp_server(nil, "127.0.0.1") { |sock|
-+      sock.print("220 (test_ftp).\r\n")
-+      commands.push(sock.gets)
-+      sock.print("331 Please specify the password.\r\n")
-+      commands.push(sock.gets)
-+      sock.print("230 Login successful.\r\n")
-+      commands.push(sock.gets)
-+      sock.print("200 Switching to Binary mode.\r\n")
-+      line = sock.gets
-+      commands.push(line)
-+      sock.print("227 Entering Passive Mode (999,0,0,1,48,57).\r\n")
-+      commands.push(sock.gets)
-+    }
-+    begin
-+      begin
-+        ftp = Net::FTP.new
-+        ftp.passive = true
-+        ftp.use_pasv_ip = true
-+        ftp.read_timeout *= 5 if defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? # for --jit-wait
-+        ftp.connect("127.0.0.1", server.port)
-+        ftp.login
-+        assert_match(/\AUSER /, commands.shift)
-+        assert_match(/\APASS /, commands.shift)
-+        assert_equal("TYPE I\r\n", commands.shift)
-+        assert_raise(SocketError) do
-+          ftp.getbinaryfile("foo", nil)
-+        end
-+      ensure
-+        ftp.close if ftp
-+      end
-+    ensure
-+      server.close
-+    end
-+  end
-+
-   private
- 
--  def create_ftp_server(sleep_time = nil)
--    server = TCPServer.new(SERVER_ADDR, 0)
-+  def create_ftp_server(sleep_time = nil, addr = SERVER_ADDR)
-+    server = TCPServer.new(addr, 0)
-     @thread = Thread.start do
-       if sleep_time
-         sleep(sleep_time)
--- 
-2.17.1
-
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
deleted file mode 100644
index b78a74a4b5..0000000000
--- a/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
+++ /dev/null
@@ -1,102 +0,0 @@
-From e2ac25d0eb66de99f098d6669cf4f06796aa6256 Mon Sep 17 00:00:00 2001
-From: Shugo Maeda <shugo@ruby-lang.org>
-Date: Tue, 11 May 2021 10:31:27 +0900
-Subject: [PATCH] Fix StartTLS stripping vulnerability
-
-This fixes CVE-2021-32066.
-Reported by Alexandr Savca in <https://hackerone.com/reports/1178562>.
-
-CVE: CVE-2021-32066
-
-Upstream-Status: Backport
-[https://github.com/ruby/ruby/commit/e2ac25d0eb66de99f098d6669cf4f06796aa6256]
-
-Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
----
- lib/net/imap.rb            |  8 +++++++-
- test/net/imap/test_imap.rb | 31 +++++++++++++++++++++++++++++++
- 2 files changed, 38 insertions(+), 1 deletion(-)
-
-diff --git a/lib/net/imap.rb b/lib/net/imap.rb
-index 505b4c8950..d45304f289 100644
---- a/lib/net/imap.rb
-+++ b/lib/net/imap.rb
-@@ -1218,12 +1218,14 @@ def get_tagged_response(tag, cmd)
-       end
-       resp = @tagged_responses.delete(tag)
-       case resp.name
-+      when /\A(?:OK)\z/ni
-+        return resp
-       when /\A(?:NO)\z/ni
-         raise NoResponseError, resp
-       when /\A(?:BAD)\z/ni
-         raise BadResponseError, resp
-       else
--        return resp
-+        raise UnknownResponseError, resp
-       end
-     end
- 
-@@ -3719,6 +3721,10 @@ class BadResponseError < ResponseError
-     class ByeResponseError < ResponseError
-     end
- 
-+    # Error raised upon an unknown response from the server.
-+    class UnknownResponseError < ResponseError
-+    end
-+
-     RESPONSE_ERRORS = Hash.new(ResponseError)
-     RESPONSE_ERRORS["NO"] = NoResponseError
-     RESPONSE_ERRORS["BAD"] = BadResponseError
-diff --git a/test/net/imap/test_imap.rb b/test/net/imap/test_imap.rb
-index 8b924b524e..85fb71d440 100644
---- a/test/net/imap/test_imap.rb
-+++ b/test/net/imap/test_imap.rb
-@@ -127,6 +127,16 @@ def test_starttls
-         imap.disconnect
-       end
-     end
-+
-+    def test_starttls_stripping
-+      starttls_stripping_test do |port|
-+        imap = Net::IMAP.new("localhost", :port => port)
-+        assert_raise(Net::IMAP::UnknownResponseError) do
-+          imap.starttls(:ca_file => CA_FILE)
-+        end
-+        imap
-+      end
-+    end
-   end
- 
-   def start_server
-@@ -834,6 +844,27 @@ def starttls_test
-     end
-   end
- 
-+  def starttls_stripping_test
-+    server = create_tcp_server
-+    port = server.addr[1]
-+    start_server do
-+      sock = server.accept
-+      begin
-+        sock.print("* OK test server\r\n")
-+        sock.gets
-+        sock.print("RUBY0001 BUG unhandled command\r\n")
-+      ensure
-+        sock.close
-+        server.close
-+      end
-+    end
-+    begin
-+      imap = yield(port)
-+    ensure
-+      imap.disconnect if imap && !imap.disconnected?
-+    end
-+  end
-+
-   def create_tcp_server
-     return TCPServer.new(server_addr, 0)
-   end
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.1.bb b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
similarity index 90%
rename from meta/recipes-devtools/ruby/ruby_3.0.1.bb
rename to meta/recipes-devtools/ruby/ruby_3.0.3.bb
index a348946972..a781f69534 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.3.bb
@@ -6,16 +6,13 @@ SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
-           file://CVE-2021-31810.patch \
-           file://CVE-2021-32066.patch \
-           file://CVE-2021-31799.patch \
            file://0003-rdoc-build-reproducible-documentation.patch \
            file://0004-lib-mkmf.rb-sort-list-of-object-files-in-generated-M.patch \
            file://0005-Mark-Gemspec-reproducible-change-fixing-784225-too.patch \
            file://0006-Make-gemspecs-reproducible.patch \
            "
 
-SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
+SRC_URI[sha256sum] = "3586861cb2df56970287f0fd83f274bd92058872d830d15570b36def7f1a92ac"
 
 PACKAGECONFIG ??= ""
 PACKAGECONFIG += "${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)}"
@@ -81,8 +78,6 @@ do_install_ptest () {
         -i ${D}${PTEST_PATH}/test/erb/test_erb_command.rb
 
     cp -r ${S}/include ${D}/${libdir}/ruby/
-    test_case_rb=`grep rubygems/test_case.rb ${B}/.installed.list`
-    sed -i -e 's:../../../test/:../../../ptest/test/:g' ${D}/$test_case_rb
 }
 
 PACKAGES =+ "${PN}-ri-docs ${PN}-rdoc"
-- 
2.25.1


