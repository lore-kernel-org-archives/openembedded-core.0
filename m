Return-Path: <Tudor.Florea@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id EC07E6080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Nov 2015 13:58:46 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 18 Nov 2015 14:58:43 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4200)	id 6A08428FA83;
	Wed, 18 Nov 2015 14:58:43 +0100 (CET)
From: Tudor Florea <tudor.florea@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Nov 2015 14:58:41 +0100
Message-ID: <1447855121-21568-2-git-send-email-tudor.florea@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1447855121-21568-1-git-send-email-tudor.florea@enea.com>
References: <1447855121-21568-1-git-send-email-tudor.florea@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX08.enea.se: tudor.florea@enea.com does not
	designate permitted sender hosts)
Subject: [dizzy] [PATCH 2/2] python: Backport CVE-2013-1752 remaining patches
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Nov 2015 13:58:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This back ported patch fixes CVE-2013-1752 for ftplib, imaplib, nntplib and=
 poplib

Signed-off-by: Tudor Florea <tudor.florea@enea.com>
---
 .../python-2.7.3-CVE-2013-1752-ftplib-fix.patch    | 149 +++++++++++++++++=
++++
 .../python-2.7.3-CVE-2013-1752-imaplib-fix.patch   |  37 +++++
 .../python-2.7.3-CVE-2013-1752-nntplib-fix.patch   | 105 +++++++++++++++
 .../python-2.7.3-CVE-2013-1752-poplib-fix.patch    |  90 +++++++++++++
 meta/recipes-devtools/python/python_2.7.3.bb       |   4 +
 5 files changed, 385 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-ftplib-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-imaplib-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-nntplib-fix.patch
 create mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-poplib-fix.patch

diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752=
-ftplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-ftplib-fix.patch
new file mode 100644
index 0000000..97c890e
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-ftplib=
-fix.patch
@@ -0,0 +1,149 @@
+
+# HG changeset patch
+# User Serhiy Storchaka <storchaka@gmail.com>
+# Date 1382277427 -10800
+# Node ID 44ac81e6d584758ee56a865a7c18d82505be0643
+# Parent  625ece68d79a27d376889579c414ed4b2d8a2649
+Issue #16038: CVE-2013-1752: ftplib: Limit amount of data read by
+limiting the call to readline().  Original patch by Micha=C5=82
+Jastrz=C4=99bski and Giampaolo Rodola.
+
+diff --git a/Lib/ftplib.py b/Lib/ftplib.py
+--- a/Lib/ftplib.py
++++ b/Lib/ftplib.py
+@@ -55,6 +55,8 @@ MSG_OOB =3D 0x1                          =20
+=20
+ # The standard FTP server control port
+ FTP_PORT =3D 21
++# The sizehint parameter passed to readline() calls
++MAXLINE =3D 8192
+=20
+=20
+ # Exception raised when an error or invalid response is received
+@@ -101,6 +103,7 @@ class FTP:
+     debugging =3D 0
+     host =3D ''
+     port =3D FTP_PORT
++    maxline =3D MAXLINE
+     sock =3D None
+     file =3D None
+     welcome =3D None
+@@ -180,7 +183,9 @@ class FTP:
+     # Internal: return one line from the server, stripping CRLF.
+     # Raise EOFError if the connection is closed
+     def getline(self):
+-        line =3D self.file.readline()
++        line =3D self.file.readline(self.maxline + 1)
++        if len(line) > self.maxline:
++            raise Error("got more than %d bytes" % self.maxline)
+         if self.debugging > 1:
+             print '*get*', self.sanitize(line)
+         if not line: raise EOFError
+@@ -432,7 +437,9 @@ class FTP:
+         conn =3D self.transfercmd(cmd)
+         fp =3D conn.makefile('rb')
+         while 1:
+-            line =3D fp.readline()
++            line =3D fp.readline(self.maxline + 1)
++            if len(line) > self.maxline:
++                raise Error("got more than %d bytes" % self.maxline)
+             if self.debugging > 2: print '*retr*', repr(line)
+             if not line:
+                 break
+@@ -485,7 +492,9 @@ class FTP:
+         self.voidcmd('TYPE A')
+         conn =3D self.transfercmd(cmd)
+         while 1:
+-            buf =3D fp.readline()
++            buf =3D fp.readline(self.maxline + 1)
++            if len(buf) > self.maxline:
++                raise Error("got more than %d bytes" % self.maxline)
+             if not buf: break
+             if buf[-2:] !=3D CRLF:
+                 if buf[-1] in CRLF: buf =3D buf[:-1]
+@@ -710,7 +719,9 @@ else:
+             fp =3D conn.makefile('rb')
+             try:
+                 while 1:
+-                    line =3D fp.readline()
++                    line =3D fp.readline(self.maxline + 1)
++                    if len(line) > self.maxline:
++                        raise Error("got more than %d bytes" % self.maxli=
ne)
+                     if self.debugging > 2: print '*retr*', repr(line)
+                     if not line:
+                         break
+@@ -748,7 +759,9 @@ else:
+             conn =3D self.transfercmd(cmd)
+             try:
+                 while 1:
+-                    buf =3D fp.readline()
++                    buf =3D fp.readline(self.maxline + 1)
++                    if len(buf) > self.maxline:
++                        raise Error("got more than %d bytes" % self.maxli=
ne)
+                     if not buf: break
+                     if buf[-2:] !=3D CRLF:
+                         if buf[-1] in CRLF: buf =3D buf[:-1]
+@@ -905,7 +918,9 @@ class Netrc:
+         fp =3D open(filename, "r")
+         in_macro =3D 0
+         while 1:
+-            line =3D fp.readline()
++            line =3D fp.readline(self.maxline + 1)
++            if len(line) > self.maxline:
++                raise Error("got more than %d bytes" % self.maxline)
+             if not line: break
+             if in_macro and line.strip():
+                 macro_lines.append(line)
+diff --git a/Lib/test/test_ftplib.py b/Lib/test/test_ftplib.py
+--- a/Lib/test/test_ftplib.py
++++ b/Lib/test/test_ftplib.py
+@@ -65,6 +65,7 @@ class DummyFTPHandler(asynchat.async_cha
+         self.last_received_data =3D ''
+         self.next_response =3D ''
+         self.rest =3D None
++        self.next_retr_data =3D RETR_DATA
+         self.push('220 welcome')
+=20
+     def collect_incoming_data(self, data):
+@@ -189,7 +190,7 @@ class DummyFTPHandler(asynchat.async_cha
+             offset =3D int(self.rest)
+         else:
+             offset =3D 0
+-        self.dtp.push(RETR_DATA[offset:])
++        self.dtp.push(self.next_retr_data[offset:])
+         self.dtp.close_when_done()
+         self.rest =3D None
+=20
+@@ -203,6 +204,11 @@ class DummyFTPHandler(asynchat.async_cha
+         self.dtp.push(NLST_DATA)
+         self.dtp.close_when_done()
+=20
++    def cmd_setlongretr(self, arg):
++        # For testing. Next RETR will return long line.
++        self.next_retr_data =3D 'x' * int(arg)
++        self.push('125 setlongretr ok')
++
+=20
+ class DummyFTPServer(asyncore.dispatcher, threading.Thread):
+=20
+@@ -558,6 +564,20 @@ class TestFTPClass(TestCase):
+         # IPv4 is in use, just make sure send_epsv has not been used
+         self.assertEqual(self.server.handler.last_received_cmd, 'pasv')
+=20
++    def test_line_too_long(self):
++        self.assertRaises(ftplib.Error, self.client.sendcmd,
++                          'x' * self.client.maxline * 2)
++
++    def test_retrlines_too_long(self):
++        self.client.sendcmd('SETLONGRETR %d' % (self.client.maxline * 2))
++        received =3D []
++        self.assertRaises(ftplib.Error,
++                          self.client.retrlines, 'retr', received.append)
++
++    def test_storlines_too_long(self):
++        f =3D StringIO.StringIO('x' * self.client.maxline * 2)
++        self.assertRaises(ftplib.Error, self.client.storlines, 'stor', f)
++
+=20
+ class TestIPv6Environment(TestCase):
+=20
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752=
-imaplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2=
013-1752-imaplib-fix.patch
new file mode 100644
index 0000000..f4bd84d
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-imapli=
b-fix.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Backport
+
+CVE-2013-1752: Change use of readline in imaplib module to limit line leng=
th. Patch by Emil Lind.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+diff -r ce583eb0bec2 Lib/imaplib.py
+--- a/Lib/imaplib.py	Thu Feb 21 20:17:54 2013 +0200
++++ b/Lib/imaplib.py	Tue Feb 26 22:36:52 2013 +0100
+@@ -35,6 +35,15 @@
+ IMAP4_SSL_PORT =3D 993
+ AllowedVersions =3D ('IMAP4REV1', 'IMAP4')        # Most recent first
+=20
++# Maximal line length when calling readline(). This is to prevent
++# reading arbitrary length lines. RFC 3501 and 2060 (IMAP 4rev1)
++# don't specify a line length. RFC 2683 however suggests limiting client
++# command lines to 1000 octets and server command lines to 8000 octets.
++# We have selected 10000 for some extra margin and since that is supposed=
ly
++# also what UW and Panda IMAP does.
++_MAXLINE =3D 10000
++
++
+ #       Commands
+=20
+ Commands =3D {
+@@ -237,7 +246,10 @@
+=20
+     def readline(self):
+         """Read line from remote."""
+-        return self.file.readline()
++        line =3D self.file.readline(_MAXLINE + 1)
++        if len(line) > _MAXLINE:
++            raise self.error("got more than %d bytes" % _MAXLINE)=20
++        return line
+=20
+=20
+     def send(self, data):
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752=
-nntplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2=
013-1752-nntplib-fix.patch
new file mode 100644
index 0000000..443e137
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-nntpli=
b-fix.patch
@@ -0,0 +1,105 @@
+Upstream-Status: Backport
+
+CVE-2013-1752: nntplib: Limit maximum line lengths to 2048 to prevent=20
+readline() calls from consuming too much memory.=20
+Patch by Jyrki Pulliainen.
+
+Signed-off-by: Tudor Florea <tudor.florea@enea.com>
+
+diff -r 936621d33c38 Lib/nntplib.py
+--- a/Lib/nntplib.py	Wed Feb 20 18:19:55 2013 -0500
++++ b/Lib/nntplib.py	Mon Sep 30 23:42:09 2013 +0200
+@@ -37,6 +37,13 @@
+            "error_reply","error_temp","error_perm","error_proto",
+            "error_data",]
+=20
++# maximal line length when calling readline(). This is to prevent
++# reading arbitrary length lines. RFC 3977 limits NNTP line length to
++# 512 characters, including CRLF. We have selected 2048 just to be on
++# the safe side.
++_MAXLINE =3D 2048
++
++
+ # Exceptions raised when an error or invalid response is received
+ class NNTPError(Exception):
+     """Base class for all nntplib exceptions"""
+@@ -200,7 +207,9 @@
+     def getline(self):
+         """Internal: return one line from the server, stripping CRLF.
+         Raise EOFError if the connection is closed."""
+-        line =3D self.file.readline()
++        line =3D self.file.readline(_MAXLINE + 1)
++        if len(line) > _MAXLINE:
++            raise NNTPProtocolError('line too long')
+         if self.debugging > 1:
+             print '*get*', repr(line)
+         if not line: raise EOFError
+diff -r 936621d33c38 Lib/test/test_nntplib.py
+--- /dev/null	Thu Jan 01 00:00:00 1970 +0000
++++ b/Lib/test/test_nntplib.py	Mon Sep 30 23:42:09 2013 +0200
+@@ -0,0 +1,65 @@
++import socket
++import threading
++import nntplib
++import time
++
++from unittest import TestCase
++from test import test_support
++
++HOST =3D test_support.HOST
++
++
++def server(evt, serv, evil=3DFalse):
++    serv.listen(5)
++    try:
++        conn, addr =3D serv.accept()
++    except socket.timeout:
++        pass
++    else:
++        if evil:
++            conn.send("1 I'm too long response" * 3000 + "\n")
++        else:
++            conn.send("1 I'm OK response\n")
++        conn.close()
++    finally:
++        serv.close()
++        evt.set()
++
++
++class BaseServerTest(TestCase):
++    def setUp(self):
++        self.evt =3D threading.Event()
++        self.sock =3D socket.socket(socket.AF_INET, socket.SOCK_STREAM)
++        self.sock.settimeout(3)
++        self.port =3D test_support.bind_port(self.sock)
++        threading.Thread(
++            target=3Dserver,
++            args=3D(self.evt, self.sock, self.evil)).start()
++        time.sleep(.1)
++
++    def tearDown(self):
++        self.evt.wait()
++
++
++class ServerTests(BaseServerTest):
++    evil =3D False
++
++    def test_basic_connect(self):
++        nntp =3D nntplib.NNTP('localhost', self.port)
++        nntp.sock.close()
++
++
++class EvilServerTests(BaseServerTest):
++    evil =3D True
++
++    def test_too_long_line(self):
++        self.assertRaises(nntplib.NNTPProtocolError,
++                          nntplib.NNTP, 'localhost', self.port)
++
++
++def test_main(verbose=3DNone):
++    test_support.run_unittest(EvilServerTests)
++    test_support.run_unittest(ServerTests)
++
++if __name__ =3D=3D '__main__':
++    test_main()
diff --git a/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752=
-poplib-fix.patch b/meta/recipes-devtools/python/python/python-2.7.3-CVE-20=
13-1752-poplib-fix.patch
new file mode 100644
index 0000000..15a5a2c
--- /dev/null
+++ b/meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-poplib=
-fix.patch
@@ -0,0 +1,90 @@
+diff --git a/Lib/poplib.py b/Lib/poplib.py
+--- a/Lib/poplib.py
++++ b/Lib/poplib.py
+@@ -27,16 +27,22 @@ POP3_PORT =3D 110
+ # POP SSL PORT
+ POP3_SSL_PORT =3D 995
+=20
+ # Line terminators (we always output CRLF, but accept any of CRLF, LFCR, =
LF)
+ CR =3D '\r'
+ LF =3D '\n'
+ CRLF =3D CR+LF
+=20
++# maximal line length when calling readline(). This is to prevent
++# reading arbitrary length lines. RFC 1939 limits POP3 line length to
++# 512 characters, including CRLF. We have selected 2048 just to be on
++# the safe side.
++_MAXLINE =3D 2048
++
+=20
+ class POP3:
+=20
+     """This class supports both the minimal and optional command sets.
+     Arguments can be strings or integers (where appropriate)
+     (e.g.: retr(1) and retr('1') both work equally well.
+=20
+     Minimal Command Set:
+@@ -98,17 +104,19 @@ class POP3:
+         self._putline(line)
+=20
+=20
+     # Internal: return one line from the server, stripping CRLF.
+     # This is where all the CPU time of this module is consumed.
+     # Raise error_proto('-ERR EOF') if the connection is closed.
+=20
+     def _getline(self):
+-        line =3D self.file.readline()
++        line =3D self.file.readline(_MAXLINE + 1)
++        if len(line) > _MAXLINE:
++            raise error_proto('line too long')
+         if self._debugging > 1: print '*get*', repr(line)
+         if not line: raise error_proto('-ERR EOF')
+         octets =3D len(line)
+         # server can send any combination of CR & LF
+         # however, 'readline()' returns lines ending in LF
+         # so only possibilities are ...LF, ...CRLF, CR...LF
+         if line[-2:] =3D=3D CRLF:
+             return line[:-2], octets
+@@ -360,16 +368,18 @@ else:
+             self.buffer +=3D localbuf
+=20
+         def _getline(self):
+             line =3D ""
+             renewline =3D re.compile(r'.*?\n')
+             match =3D renewline.match(self.buffer)
+             while not match:
+                 self._fillBuffer()
++                if len(self.buffer) > _MAXLINE:
++                    raise error_proto('line too long')
+                 match =3D renewline.match(self.buffer)
+             line =3D match.group(0)
+             self.buffer =3D renewline.sub('' ,self.buffer, 1)
+             if self._debugging > 1: print '*get*', repr(line)
+=20
+             octets =3D len(line)
+             if line[-2:] =3D=3D CRLF:
+                 return line[:-2], octets
+diff --git a/Lib/test/test_poplib.py b/Lib/test/test_poplib.py
+--- a/Lib/test/test_poplib.py
++++ b/Lib/test/test_poplib.py
+@@ -193,16 +193,20 @@ class TestPOP3Class(TestCase):
+     def test_retr(self):
+         expected =3D ('+OK 116 bytes',
+                     ['From: postmaster@python.org', 'Content-Type: text/p=
lain',
+                      'MIME-Version: 1.0', 'Subject: Dummy',
+                      '', 'line1', 'line2', 'line3'],
+                     113)
+         self.assertEqual(self.client.retr('foo'), expected)
+=20
++    def test_too_long_lines(self):
++        self.assertRaises(poplib.error_proto, self.client._shortcmd,
++                          'echo +%s' % ((poplib._MAXLINE + 10) * 'a'))
++
+     def test_dele(self):
+         self.assertOK(self.client.dele('foo'))
+=20
+     def test_noop(self):
+         self.assertOK(self.client.noop())
+=20
+     def test_rpop(self):
+         self.assertOK(self.client.rpop('foo'))
diff --git a/meta/recipes-devtools/python/python_2.7.3.bb b/meta/recipes-de=
vtools/python/python_2.7.3.bb
index d603587..9cfe0b4 100644
--- a/meta/recipes-devtools/python/python_2.7.3.bb
+++ b/meta/recipes-devtools/python/python_2.7.3.bb
@@ -41,6 +41,10 @@ SRC_URI +=3D "\
   file://python-2.7.3-CVE-2014-7185.patch \
   file://python2.7.3-nossl3.patch \
   file://python-2.7.3-CVE-2013-1752-httplib-fix.patch \
+  file://python-2.7.3-CVE-2013-1752-ftplib-fix.patch \
+  file://python-2.7.3-CVE-2013-1752-imaplib-fix.patch \
+  file://python-2.7.3-CVE-2013-1752-nntplib-fix.patch \
+  file://python-2.7.3-CVE-2013-1752-poplib-fix.patch \
 "
=20
 S =3D "${WORKDIR}/Python-${PV}"
--=20
1.9.1


