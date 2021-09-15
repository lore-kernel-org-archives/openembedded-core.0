Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by mx.groups.io with SMTP id smtpd.web08.3933.1631747749606685057
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Sep 2021 16:15:50 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.120, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="220565478"
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="220565478"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,296,1624345200"; 
   d="scan'208";a="433597279"
Received: from chgan-mobl.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.238.104])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2021 16:15:47 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 01/17] ruby: Security fixes for CVE-2021-31810/CVE-2021-32066
Date: Thu, 16 Sep 2021 07:15:25 +0800
Message-Id: <e14761916290c01683d72eb8e3de530f944fdfab.1631747352.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1631747352.git.anuj.mittal@intel.com>
References: <cover.1631747352.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Yi Zhao <yi.zhao@windriver.com>

CVE-2021-31810:
A malicious FTP server can use the PASV response to trick Net::FTP into
connecting back to a given IP address and port. This potentially makes
Net::FTP extract information about services that are otherwise private
and not disclosed (e.g., the attacker can conduct port scans and service
banner extractions).

CVE-2021-32066:
Net::IMAP does not raise an exception when StartTLS fails with an
unknown response, which might allow man-in-the-middle attackers to
bypass the TLS protections by leveraging a network position between the
client and the registry to block the StartTLS command, aka a “StartTLS
stripping attack.”

References:
https://www.ruby-lang.org/en/news/2021/07/07/trusting-pasv-responses-in-net-ftp/
https://www.ruby-lang.org/en/news/2021/07/07/starttls-stripping-in-net-imap/

Patches from:
https://github.com/ruby/ruby/commit/bf4d05173c7cf04d8892e4b64508ecf7902717cd
https://github.com/ruby/ruby/commit/e2ac25d0eb66de99f098d6669cf4f06796aa6256

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../ruby/ruby/CVE-2021-31810.patch            | 258 ++++++++++++++++++
 .../ruby/ruby/CVE-2021-32066.patch            | 102 +++++++
 meta/recipes-devtools/ruby/ruby_3.0.1.bb      |   2 +
 3 files changed, 362 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
new file mode 100644
index 0000000000..69d774e0b7
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
@@ -0,0 +1,258 @@
+From 8cebc092cd18f4cfb669f66018ea8ffc6f408584 Mon Sep 17 00:00:00 2001
+From: Yusuke Endoh <mame@ruby-lang.org>
+Date: Wed, 7 Jul 2021 11:57:15 +0900
+Subject: [PATCH] Ignore IP addresses in PASV responses by default, and add new
+ option use_pasv_ip
+
+This fixes CVE-2021-31810.
+Reported by Alexandr Savca.
+
+Co-authored-by: Shugo Maeda <shugo@ruby-lang.org>
+
+CVE: CVE-2021-31810
+
+Upstream-Status: Backport
+[https://github.com/ruby/ruby/commit/bf4d05173c7cf04d8892e4b64508ecf7902717cd]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/net/ftp.rb           |  15 +++-
+ test/net/ftp/test_ftp.rb | 159 ++++++++++++++++++++++++++++++++++++++-
+ 2 files changed, 170 insertions(+), 4 deletions(-)
+
+diff --git a/lib/net/ftp.rb b/lib/net/ftp.rb
+index 88e8655..d6f5cc3 100644
+--- a/lib/net/ftp.rb
++++ b/lib/net/ftp.rb
+@@ -98,6 +98,10 @@ module Net
+     # When +true+, the connection is in passive mode.  Default: +true+.
+     attr_accessor :passive
+ 
++    # When +true+, use the IP address in PASV responses.  Otherwise, it uses
++    # the same IP address for the control connection.  Default: +false+.
++    attr_accessor :use_pasv_ip
++
+     # When +true+, all traffic to and from the server is written
+     # to +$stdout+.  Default: +false+.
+     attr_accessor :debug_mode
+@@ -206,6 +210,9 @@ module Net
+     #                          handshake.
+     #                          See Net::FTP#ssl_handshake_timeout for
+     #                          details.  Default: +nil+.
++    # use_pasv_ip::  When +true+, use the IP address in PASV responses.
++    #                Otherwise, it uses the same IP address for the control
++    #                connection.  Default: +false+.
+     # debug_mode::  When +true+, all traffic to and from the server is
+     #               written to +$stdout+.  Default: +false+.
+     #
+@@ -266,6 +273,7 @@ module Net
+       @open_timeout = options[:open_timeout]
+       @ssl_handshake_timeout = options[:ssl_handshake_timeout]
+       @read_timeout = options[:read_timeout] || 60
++      @use_pasv_ip = options[:use_pasv_ip] || false
+       if host
+         connect(host, options[:port] || FTP_PORT)
+         if options[:username]
+@@ -1371,7 +1379,12 @@ module Net
+         raise FTPReplyError, resp
+       end
+       if m = /\((?<host>\d+(?:,\d+){3}),(?<port>\d+,\d+)\)/.match(resp)
+-        return parse_pasv_ipv4_host(m["host"]), parse_pasv_port(m["port"])
++        if @use_pasv_ip
++          host = parse_pasv_ipv4_host(m["host"])
++        else
++          host = @bare_sock.remote_address.ip_address
++        end
++        return host, parse_pasv_port(m["port"])
+       else
+         raise FTPProtoError, resp
+       end
+diff --git a/test/net/ftp/test_ftp.rb b/test/net/ftp/test_ftp.rb
+index 023e794..243d4ad 100644
+--- a/test/net/ftp/test_ftp.rb
++++ b/test/net/ftp/test_ftp.rb
+@@ -61,7 +61,7 @@ class FTPTest < Test::Unit::TestCase
+   end
+ 
+   def test_parse227
+-    ftp = Net::FTP.new
++    ftp = Net::FTP.new(nil, use_pasv_ip: true)
+     host, port = ftp.send(:parse227, "227 Entering Passive Mode (192,168,0,1,12,34)")
+     assert_equal("192.168.0.1", host)
+     assert_equal(3106, port)
+@@ -80,6 +80,14 @@ class FTPTest < Test::Unit::TestCase
+     assert_raise(Net::FTPProtoError) do
+       ftp.send(:parse227, "227 ) foo bar (")
+     end
++
++    ftp = Net::FTP.new
++    sock = OpenStruct.new
++    sock.remote_address = OpenStruct.new
++    sock.remote_address.ip_address = "10.0.0.1"
++    ftp.instance_variable_set(:@bare_sock, sock)
++    host, port = ftp.send(:parse227, "227 Entering Passive Mode (192,168,0,1,12,34)")
++    assert_equal("10.0.0.1", host)
+   end
+ 
+   def test_parse228
+@@ -2474,10 +2482,155 @@ EOF
+     end
+   end
+ 
++  def test_ignore_pasv_ip
++    commands = []
++    binary_data = (0..0xff).map {|i| i.chr}.join * 4 * 3
++    server = create_ftp_server(nil, "127.0.0.1") { |sock|
++      sock.print("220 (test_ftp).\r\n")
++      commands.push(sock.gets)
++      sock.print("331 Please specify the password.\r\n")
++      commands.push(sock.gets)
++      sock.print("230 Login successful.\r\n")
++      commands.push(sock.gets)
++      sock.print("200 Switching to Binary mode.\r\n")
++      line = sock.gets
++      commands.push(line)
++      data_server = TCPServer.new("127.0.0.1", 0)
++      port = data_server.local_address.ip_port
++      sock.printf("227 Entering Passive Mode (999,0,0,1,%s).\r\n",
++                  port.divmod(256).join(","))
++      commands.push(sock.gets)
++      sock.print("150 Opening BINARY mode data connection for foo (#{binary_data.size} bytes)\r\n")
++      conn = data_server.accept
++      binary_data.scan(/.{1,1024}/nm) do |s|
++        conn.print(s)
++      end
++      conn.shutdown(Socket::SHUT_WR)
++      conn.read
++      conn.close
++      data_server.close
++      sock.print("226 Transfer complete.\r\n")
++    }
++    begin
++      begin
++        ftp = Net::FTP.new
++        ftp.passive = true
++        ftp.read_timeout *= 5 if defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? # for --jit-wait
++        ftp.connect("127.0.0.1", server.port)
++        ftp.login
++        assert_match(/\AUSER /, commands.shift)
++        assert_match(/\APASS /, commands.shift)
++        assert_equal("TYPE I\r\n", commands.shift)
++        buf = ftp.getbinaryfile("foo", nil)
++        assert_equal(binary_data, buf)
++        assert_equal(Encoding::ASCII_8BIT, buf.encoding)
++        assert_equal("PASV\r\n", commands.shift)
++        assert_equal("RETR foo\r\n", commands.shift)
++        assert_equal(nil, commands.shift)
++      ensure
++        ftp.close if ftp
++      end
++    ensure
++      server.close
++    end
++  end
++
++  def test_use_pasv_ip
++    commands = []
++    binary_data = (0..0xff).map {|i| i.chr}.join * 4 * 3
++    server = create_ftp_server(nil, "127.0.0.1") { |sock|
++      sock.print("220 (test_ftp).\r\n")
++      commands.push(sock.gets)
++      sock.print("331 Please specify the password.\r\n")
++      commands.push(sock.gets)
++      sock.print("230 Login successful.\r\n")
++      commands.push(sock.gets)
++      sock.print("200 Switching to Binary mode.\r\n")
++      line = sock.gets
++      commands.push(line)
++      data_server = TCPServer.new("127.0.0.1", 0)
++      port = data_server.local_address.ip_port
++      sock.printf("227 Entering Passive Mode (127,0,0,1,%s).\r\n",
++                  port.divmod(256).join(","))
++      commands.push(sock.gets)
++      sock.print("150 Opening BINARY mode data connection for foo (#{binary_data.size} bytes)\r\n")
++      conn = data_server.accept
++      binary_data.scan(/.{1,1024}/nm) do |s|
++        conn.print(s)
++      end
++      conn.shutdown(Socket::SHUT_WR)
++      conn.read
++      conn.close
++      data_server.close
++      sock.print("226 Transfer complete.\r\n")
++    }
++    begin
++      begin
++        ftp = Net::FTP.new
++        ftp.passive = true
++        ftp.use_pasv_ip = true
++        ftp.read_timeout *= 5 if defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? # for --jit-wait
++        ftp.connect("127.0.0.1", server.port)
++        ftp.login
++        assert_match(/\AUSER /, commands.shift)
++        assert_match(/\APASS /, commands.shift)
++        assert_equal("TYPE I\r\n", commands.shift)
++        buf = ftp.getbinaryfile("foo", nil)
++        assert_equal(binary_data, buf)
++        assert_equal(Encoding::ASCII_8BIT, buf.encoding)
++        assert_equal("PASV\r\n", commands.shift)
++        assert_equal("RETR foo\r\n", commands.shift)
++        assert_equal(nil, commands.shift)
++      ensure
++        ftp.close if ftp
++      end
++    ensure
++      server.close
++    end
++  end
++
++  def test_use_pasv_invalid_ip
++    commands = []
++    binary_data = (0..0xff).map {|i| i.chr}.join * 4 * 3
++    server = create_ftp_server(nil, "127.0.0.1") { |sock|
++      sock.print("220 (test_ftp).\r\n")
++      commands.push(sock.gets)
++      sock.print("331 Please specify the password.\r\n")
++      commands.push(sock.gets)
++      sock.print("230 Login successful.\r\n")
++      commands.push(sock.gets)
++      sock.print("200 Switching to Binary mode.\r\n")
++      line = sock.gets
++      commands.push(line)
++      sock.print("227 Entering Passive Mode (999,0,0,1,48,57).\r\n")
++      commands.push(sock.gets)
++    }
++    begin
++      begin
++        ftp = Net::FTP.new
++        ftp.passive = true
++        ftp.use_pasv_ip = true
++        ftp.read_timeout *= 5 if defined?(RubyVM::MJIT) && RubyVM::MJIT.enabled? # for --jit-wait
++        ftp.connect("127.0.0.1", server.port)
++        ftp.login
++        assert_match(/\AUSER /, commands.shift)
++        assert_match(/\APASS /, commands.shift)
++        assert_equal("TYPE I\r\n", commands.shift)
++        assert_raise(SocketError) do
++          ftp.getbinaryfile("foo", nil)
++        end
++      ensure
++        ftp.close if ftp
++      end
++    ensure
++      server.close
++    end
++  end
++
+   private
+ 
+-  def create_ftp_server(sleep_time = nil)
+-    server = TCPServer.new(SERVER_ADDR, 0)
++  def create_ftp_server(sleep_time = nil, addr = SERVER_ADDR)
++    server = TCPServer.new(addr, 0)
+     @thread = Thread.start do
+       if sleep_time
+         sleep(sleep_time)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch b/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
new file mode 100644
index 0000000000..b78a74a4b5
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch
@@ -0,0 +1,102 @@
+From e2ac25d0eb66de99f098d6669cf4f06796aa6256 Mon Sep 17 00:00:00 2001
+From: Shugo Maeda <shugo@ruby-lang.org>
+Date: Tue, 11 May 2021 10:31:27 +0900
+Subject: [PATCH] Fix StartTLS stripping vulnerability
+
+This fixes CVE-2021-32066.
+Reported by Alexandr Savca in <https://hackerone.com/reports/1178562>.
+
+CVE: CVE-2021-32066
+
+Upstream-Status: Backport
+[https://github.com/ruby/ruby/commit/e2ac25d0eb66de99f098d6669cf4f06796aa6256]
+
+Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
+---
+ lib/net/imap.rb            |  8 +++++++-
+ test/net/imap/test_imap.rb | 31 +++++++++++++++++++++++++++++++
+ 2 files changed, 38 insertions(+), 1 deletion(-)
+
+diff --git a/lib/net/imap.rb b/lib/net/imap.rb
+index 505b4c8950..d45304f289 100644
+--- a/lib/net/imap.rb
++++ b/lib/net/imap.rb
+@@ -1218,12 +1218,14 @@ def get_tagged_response(tag, cmd)
+       end
+       resp = @tagged_responses.delete(tag)
+       case resp.name
++      when /\A(?:OK)\z/ni
++        return resp
+       when /\A(?:NO)\z/ni
+         raise NoResponseError, resp
+       when /\A(?:BAD)\z/ni
+         raise BadResponseError, resp
+       else
+-        return resp
++        raise UnknownResponseError, resp
+       end
+     end
+ 
+@@ -3719,6 +3721,10 @@ class BadResponseError < ResponseError
+     class ByeResponseError < ResponseError
+     end
+ 
++    # Error raised upon an unknown response from the server.
++    class UnknownResponseError < ResponseError
++    end
++
+     RESPONSE_ERRORS = Hash.new(ResponseError)
+     RESPONSE_ERRORS["NO"] = NoResponseError
+     RESPONSE_ERRORS["BAD"] = BadResponseError
+diff --git a/test/net/imap/test_imap.rb b/test/net/imap/test_imap.rb
+index 8b924b524e..85fb71d440 100644
+--- a/test/net/imap/test_imap.rb
++++ b/test/net/imap/test_imap.rb
+@@ -127,6 +127,16 @@ def test_starttls
+         imap.disconnect
+       end
+     end
++
++    def test_starttls_stripping
++      starttls_stripping_test do |port|
++        imap = Net::IMAP.new("localhost", :port => port)
++        assert_raise(Net::IMAP::UnknownResponseError) do
++          imap.starttls(:ca_file => CA_FILE)
++        end
++        imap
++      end
++    end
+   end
+ 
+   def start_server
+@@ -834,6 +844,27 @@ def starttls_test
+     end
+   end
+ 
++  def starttls_stripping_test
++    server = create_tcp_server
++    port = server.addr[1]
++    start_server do
++      sock = server.accept
++      begin
++        sock.print("* OK test server\r\n")
++        sock.gets
++        sock.print("RUBY0001 BUG unhandled command\r\n")
++      ensure
++        sock.close
++        server.close
++      end
++    end
++    begin
++      imap = yield(port)
++    ensure
++      imap.disconnect if imap && !imap.disconnected?
++    end
++  end
++
+   def create_tcp_server
+     return TCPServer.new(server_addr, 0)
+   end
+-- 
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.1.bb b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
index 944cb81c1d..ae953a0a89 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
@@ -6,6 +6,8 @@ SRC_URI += " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-item.patch \
+           file://CVE-2021-31810.patch \
+           file://CVE-2021-32066.patch \
            "
 
 SRC_URI[sha256sum] = "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8c686b0ce7ab77727"
-- 
2.31.1

