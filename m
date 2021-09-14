Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web10.7233.1631610106526275315
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Sep 2021 02:01:46 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: mingli.yu@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18E91j3F024608
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 02:01:45 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18E91jCJ026421
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Sep 2021 02:01:45 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Tue, 14 Sep 2021 02:01:44 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Tue, 14 Sep 2021 02:01:44 -0700
From: "Yu, Mingli" <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH 1/2] ruby: Security fixes for CVE-2021-31810/CVE-2021-32066
Date: Tue, 14 Sep 2021 16:57:17 +0800
Message-ID: <20210914085718.1198-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id 18E91j3F024608
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

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
client and the registry to block the StartTLS command, aka a =E2=80=9CSta=
rtTLS
stripping attack.=E2=80=9D

References:
https://www.ruby-lang.org/en/news/2021/07/07/trusting-pasv-responses-in-n=
et-ftp/
https://www.ruby-lang.org/en/news/2021/07/07/starttls-stripping-in-net-im=
ap/

Patches from:
https://github.com/ruby/ruby/commit/bf4d05173c7cf04d8892e4b64508ecf790271=
7cd
https://github.com/ruby/ruby/commit/e2ac25d0eb66de99f098d6669cf4f06796aa6=
256

Signed-off-by: Yi Zhao <yi.zhao@windriver.com>
---
 .../ruby/ruby/CVE-2021-31810.patch            | 258 ++++++++++++++++++
 .../ruby/ruby/CVE-2021-32066.patch            | 102 +++++++
 meta/recipes-devtools/ruby/ruby_3.0.1.bb      |   2 +
 3 files changed, 362 insertions(+)
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch

diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2021-31810.patch
new file mode 100644
index 0000000000..69d774e0b7
--- /dev/null
+++ b/meta/recipes-devtools/ruby/ruby/CVE-2021-31810.patch
@@ -0,0 +1,258 @@
+From 8cebc092cd18f4cfb669f66018ea8ffc6f408584 Mon Sep 17 00:00:00 2001
+From: Yusuke Endoh <mame@ruby-lang.org>
+Date: Wed, 7 Jul 2021 11:57:15 +0900
+Subject: [PATCH] Ignore IP addresses in PASV responses by default, and a=
dd new
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
+[https://github.com/ruby/ruby/commit/bf4d05173c7cf04d8892e4b64508ecf7902=
717cd]
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
+=20
++    # When +true+, use the IP address in PASV responses.  Otherwise, it=
 uses
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
++    #                Otherwise, it uses the same IP address for the con=
trol
++    #                connection.  Default: +false+.
+     # debug_mode::  When +true+, all traffic to and from the server is
+     #               written to +$stdout+.  Default: +false+.
+     #
+@@ -266,6 +273,7 @@ module Net
+       @open_timeout =3D options[:open_timeout]
+       @ssl_handshake_timeout =3D options[:ssl_handshake_timeout]
+       @read_timeout =3D options[:read_timeout] || 60
++      @use_pasv_ip =3D options[:use_pasv_ip] || false
+       if host
+         connect(host, options[:port] || FTP_PORT)
+         if options[:username]
+@@ -1371,7 +1379,12 @@ module Net
+         raise FTPReplyError, resp
+       end
+       if m =3D /\((?<host>\d+(?:,\d+){3}),(?<port>\d+,\d+)\)/.match(res=
p)
+-        return parse_pasv_ipv4_host(m["host"]), parse_pasv_port(m["port=
"])
++        if @use_pasv_ip
++          host =3D parse_pasv_ipv4_host(m["host"])
++        else
++          host =3D @bare_sock.remote_address.ip_address
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
+=20
+   def test_parse227
+-    ftp =3D Net::FTP.new
++    ftp =3D Net::FTP.new(nil, use_pasv_ip: true)
+     host, port =3D ftp.send(:parse227, "227 Entering Passive Mode (192,=
168,0,1,12,34)")
+     assert_equal("192.168.0.1", host)
+     assert_equal(3106, port)
+@@ -80,6 +80,14 @@ class FTPTest < Test::Unit::TestCase
+     assert_raise(Net::FTPProtoError) do
+       ftp.send(:parse227, "227 ) foo bar (")
+     end
++
++    ftp =3D Net::FTP.new
++    sock =3D OpenStruct.new
++    sock.remote_address =3D OpenStruct.new
++    sock.remote_address.ip_address =3D "10.0.0.1"
++    ftp.instance_variable_set(:@bare_sock, sock)
++    host, port =3D ftp.send(:parse227, "227 Entering Passive Mode (192,=
168,0,1,12,34)")
++    assert_equal("10.0.0.1", host)
+   end
+=20
+   def test_parse228
+@@ -2474,10 +2482,155 @@ EOF
+     end
+   end
+=20
++  def test_ignore_pasv_ip
++    commands =3D []
++    binary_data =3D (0..0xff).map {|i| i.chr}.join * 4 * 3
++    server =3D create_ftp_server(nil, "127.0.0.1") { |sock|
++      sock.print("220 (test_ftp).\r\n")
++      commands.push(sock.gets)
++      sock.print("331 Please specify the password.\r\n")
++      commands.push(sock.gets)
++      sock.print("230 Login successful.\r\n")
++      commands.push(sock.gets)
++      sock.print("200 Switching to Binary mode.\r\n")
++      line =3D sock.gets
++      commands.push(line)
++      data_server =3D TCPServer.new("127.0.0.1", 0)
++      port =3D data_server.local_address.ip_port
++      sock.printf("227 Entering Passive Mode (999,0,0,1,%s).\r\n",
++                  port.divmod(256).join(","))
++      commands.push(sock.gets)
++      sock.print("150 Opening BINARY mode data connection for foo (#{bi=
nary_data.size} bytes)\r\n")
++      conn =3D data_server.accept
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
++        ftp =3D Net::FTP.new
++        ftp.passive =3D true
++        ftp.read_timeout *=3D 5 if defined?(RubyVM::MJIT) && RubyVM::MJ=
IT.enabled? # for --jit-wait
++        ftp.connect("127.0.0.1", server.port)
++        ftp.login
++        assert_match(/\AUSER /, commands.shift)
++        assert_match(/\APASS /, commands.shift)
++        assert_equal("TYPE I\r\n", commands.shift)
++        buf =3D ftp.getbinaryfile("foo", nil)
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
++    commands =3D []
++    binary_data =3D (0..0xff).map {|i| i.chr}.join * 4 * 3
++    server =3D create_ftp_server(nil, "127.0.0.1") { |sock|
++      sock.print("220 (test_ftp).\r\n")
++      commands.push(sock.gets)
++      sock.print("331 Please specify the password.\r\n")
++      commands.push(sock.gets)
++      sock.print("230 Login successful.\r\n")
++      commands.push(sock.gets)
++      sock.print("200 Switching to Binary mode.\r\n")
++      line =3D sock.gets
++      commands.push(line)
++      data_server =3D TCPServer.new("127.0.0.1", 0)
++      port =3D data_server.local_address.ip_port
++      sock.printf("227 Entering Passive Mode (127,0,0,1,%s).\r\n",
++                  port.divmod(256).join(","))
++      commands.push(sock.gets)
++      sock.print("150 Opening BINARY mode data connection for foo (#{bi=
nary_data.size} bytes)\r\n")
++      conn =3D data_server.accept
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
++        ftp =3D Net::FTP.new
++        ftp.passive =3D true
++        ftp.use_pasv_ip =3D true
++        ftp.read_timeout *=3D 5 if defined?(RubyVM::MJIT) && RubyVM::MJ=
IT.enabled? # for --jit-wait
++        ftp.connect("127.0.0.1", server.port)
++        ftp.login
++        assert_match(/\AUSER /, commands.shift)
++        assert_match(/\APASS /, commands.shift)
++        assert_equal("TYPE I\r\n", commands.shift)
++        buf =3D ftp.getbinaryfile("foo", nil)
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
++    commands =3D []
++    binary_data =3D (0..0xff).map {|i| i.chr}.join * 4 * 3
++    server =3D create_ftp_server(nil, "127.0.0.1") { |sock|
++      sock.print("220 (test_ftp).\r\n")
++      commands.push(sock.gets)
++      sock.print("331 Please specify the password.\r\n")
++      commands.push(sock.gets)
++      sock.print("230 Login successful.\r\n")
++      commands.push(sock.gets)
++      sock.print("200 Switching to Binary mode.\r\n")
++      line =3D sock.gets
++      commands.push(line)
++      sock.print("227 Entering Passive Mode (999,0,0,1,48,57).\r\n")
++      commands.push(sock.gets)
++    }
++    begin
++      begin
++        ftp =3D Net::FTP.new
++        ftp.passive =3D true
++        ftp.use_pasv_ip =3D true
++        ftp.read_timeout *=3D 5 if defined?(RubyVM::MJIT) && RubyVM::MJ=
IT.enabled? # for --jit-wait
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
+=20
+-  def create_ftp_server(sleep_time =3D nil)
+-    server =3D TCPServer.new(SERVER_ADDR, 0)
++  def create_ftp_server(sleep_time =3D nil, addr =3D SERVER_ADDR)
++    server =3D TCPServer.new(addr, 0)
+     @thread =3D Thread.start do
+       if sleep_time
+         sleep(sleep_time)
+--=20
+2.17.1
+
diff --git a/meta/recipes-devtools/ruby/ruby/CVE-2021-32066.patch b/meta/=
recipes-devtools/ruby/ruby/CVE-2021-32066.patch
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
+[https://github.com/ruby/ruby/commit/e2ac25d0eb66de99f098d6669cf4f06796a=
a6256]
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
+       resp =3D @tagged_responses.delete(tag)
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
+=20
+@@ -3719,6 +3721,10 @@ class BadResponseError < ResponseError
+     class ByeResponseError < ResponseError
+     end
+=20
++    # Error raised upon an unknown response from the server.
++    class UnknownResponseError < ResponseError
++    end
++
+     RESPONSE_ERRORS =3D Hash.new(ResponseError)
+     RESPONSE_ERRORS["NO"] =3D NoResponseError
+     RESPONSE_ERRORS["BAD"] =3D BadResponseError
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
++        imap =3D Net::IMAP.new("localhost", :port =3D> port)
++        assert_raise(Net::IMAP::UnknownResponseError) do
++          imap.starttls(:ca_file =3D> CA_FILE)
++        end
++        imap
++      end
++    end
+   end
+=20
+   def start_server
+@@ -834,6 +844,27 @@ def starttls_test
+     end
+   end
+=20
++  def starttls_stripping_test
++    server =3D create_tcp_server
++    port =3D server.addr[1]
++    start_server do
++      sock =3D server.accept
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
++      imap =3D yield(port)
++    ensure
++      imap.disconnect if imap && !imap.disconnected?
++    end
++  end
++
+   def create_tcp_server
+     return TCPServer.new(server_addr, 0)
+   end
+--=20
+2.25.1
+
diff --git a/meta/recipes-devtools/ruby/ruby_3.0.1.bb b/meta/recipes-devt=
ools/ruby/ruby_3.0.1.bb
index 944cb81c1d..ae953a0a89 100644
--- a/meta/recipes-devtools/ruby/ruby_3.0.1.bb
+++ b/meta/recipes-devtools/ruby/ruby_3.0.1.bb
@@ -6,6 +6,8 @@ SRC_URI +=3D " \
            file://remove_has_include_macros.patch \
            file://run-ptest \
            file://0001-template-Makefile.in-do-not-write-host-cross-cc-i=
tem.patch \
+           file://CVE-2021-31810.patch \
+           file://CVE-2021-32066.patch \
            "
=20
 SRC_URI[sha256sum] =3D "369825db2199f6aeef16b408df6a04ebaddb664fb9af0ec8=
c686b0ce7ab77727"
--=20
2.32.0

