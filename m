Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 99C7760234
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Oct 2018 05:09:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	03 Oct 2018 22:09:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.54,338,1534834800"; d="scan'208";a="97283813"
Received: from anmitta2-mobl1.png.intel.com ([10.221.21.255])
	by orsmga002.jf.intel.com with ESMTP; 03 Oct 2018 22:09:21 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Oct 2018 13:09:16 +0800
Message-Id: <20181004050917.16006-1-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH 1/2] python: fix failing ssl tests
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
X-List-Received-Date: Thu, 04 Oct 2018 05:09:22 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Backport two and pick some other in-review patches from Ubuntu to fix
ssl test failures because of OpenSSL 1.1.x changes.

Fixes [YOCTO #12788]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/python/python.inc       |   8 +-
 ...st_ssl-when-a-filename-cannot-be-enc.patch |  57 +++++++++
 ...3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch | 120 ++++++++++++++++++
 ...ssing-closing-wrapper-in-test_tls1_3.patch |  37 ++++++
 ...st_ssl.test_options-to-account-for-O.patch |  37 ++++++
 ...st_default_ecdh_curve-needs-no-tlsv1.patch |  34 +++++
 6 files changed, 292 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
 create mode 100644 meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
 create mode 100644 meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
 create mode 100644 meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
 create mode 100644 meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch

diff --git a/meta/recipes-devtools/python/python.inc b/meta/recipes-devtools/python/python.inc
index 901acd0219..66923678b1 100644
--- a/meta/recipes-devtools/python/python.inc
+++ b/meta/recipes-devtools/python/python.inc
@@ -7,7 +7,13 @@ INC_PR = "r1"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=f257cc14f81685691652a3d3e1b5d754"
 
-SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz"
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch \
+           file://0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch \
+           file://0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch \
+           file://0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch \
+           file://0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch \
+           "
 
 SRC_URI[md5sum] = "a80ae3cc478460b922242f43a1b4094d"
 SRC_URI[sha256sum] = "22d9b1ac5b26135ad2b8c2901a9413537e08749a753356ee913c84dbd2df5574"
diff --git a/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch b/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
new file mode 100644
index 0000000000..776bbdcf7a
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-bpo-33354-Fix-test_ssl-when-a-filename-cannot-be-enc.patch
@@ -0,0 +1,57 @@
+From 19f6bd06af3c7fc0db5f96878aaa68f5589ff13e Mon Sep 17 00:00:00 2001
+From: Pablo Galindo <Pablogsal@gmail.com>
+Date: Thu, 24 May 2018 23:20:44 +0100
+Subject: [PATCH] bpo-33354: Fix test_ssl when a filename cannot be encoded
+ (GH-6613)
+
+Skip test_load_dh_params() of test_ssl when Python filesystem encoding
+cannot encode the provided path.
+
+Upstream-Status:
+Backport[https://github.com/python/cpython/commit/19f6bd06af3c7fc0db5f96878aaa68f5589ff13e]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/test/test_ssl.py                                     | 9 ++++++++-
+ .../next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst  | 2 ++
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index b59fe73f04..7ced90fdf6 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -989,6 +989,13 @@ class ContextTests(unittest.TestCase):
+ 
+ 
+     def test_load_dh_params(self):
++        filename = u'dhpäräm.pem'
++        fs_encoding = sys.getfilesystemencoding()
++        try:
++            filename.encode(fs_encoding)
++        except UnicodeEncodeError:
++            self.skipTest("filename %r cannot be encoded to the filesystem encoding %r" % (filename, fs_encoding))
++
+         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
+         ctx.load_dh_params(DHFILE)
+         if os.name != 'nt':
+@@ -1001,7 +1008,7 @@ class ContextTests(unittest.TestCase):
+         with self.assertRaises(ssl.SSLError) as cm:
+             ctx.load_dh_params(CERTFILE)
+         with support.temp_dir() as d:
+-            fname = os.path.join(d, u'dhpäräm.pem')
++            fname = os.path.join(d, filename)
+             shutil.copy(DHFILE, fname)
+             ctx.load_dh_params(fname)
+ 
+diff --git a/Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst b/Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst
+new file mode 100644
+index 0000000000..c66cecac32
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2018-04-26-22-39-17.bpo-33354.g35-44.rst
+@@ -0,0 +1,2 @@
++Skip ``test_ssl.test_load_dh_params`` when Python filesystem encoding cannot encode the
++provided path.
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch b/meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
new file mode 100644
index 0000000000..1f70562fc0
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0001-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976-.patch
@@ -0,0 +1,120 @@
+From a333351592f097220fc862911b34d3a300f0985e Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Wed, 15 Aug 2018 09:07:28 +0200
+Subject: [PATCH 1/4] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)
+ (GH-8760)
+
+Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
+1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
+default.
+
+Also update multissltests to test with latest OpenSSL.
+
+Signed-off-by: Christian Heimes <christian@python.org>.
+(cherry picked from commit 3e630c541b35c96bfe5619165255e559f577ee71)
+
+Co-authored-by: Christian Heimes <christian@python.org>
+
+Upstream-Status: Accepted [https://github.com/python/cpython/pull/8771]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Doc/library/ssl.rst                           |  8 ++--
+ Lib/test/test_ssl.py                          | 37 +++++++++++--------
+ .../2018-05-18-21-50-47.bpo-33570.7CZy4t.rst  |  3 ++
+ 3 files changed, 27 insertions(+), 21 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst
+
+diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
+index 0421031772..7c7c85b833 100644
+--- a/Doc/library/ssl.rst
++++ b/Doc/library/ssl.rst
+@@ -294,11 +294,6 @@ purposes.
+ 
+      3DES was dropped from the default cipher string.
+ 
+-   .. versionchanged:: 2.7.15
+-
+-     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
+-     and TLS_CHACHA20_POLY1305_SHA256 were added to the default cipher string.
+-
+ .. function:: _https_verify_certificates(enable=True)
+ 
+    Specifies whether or not server certificates are verified when creating
+@@ -1179,6 +1174,9 @@ to speed up repeated connections from the same clients.
+       when connected, the :meth:`SSLSocket.cipher` method of SSL sockets will
+       give the currently selected cipher.
+ 
++      OpenSSL 1.1.1 has TLS 1.3 cipher suites enabled by default. The suites
++      cannot be disabled with :meth:`~SSLContext.set_ciphers`.
++
+ .. method:: SSLContext.set_alpn_protocols(protocols)
+ 
+    Specify which protocols the socket should advertise during the SSL/TLS
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index dc14e22ad1..f51572e319 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -2772,19 +2772,24 @@ else:
+                     sock.do_handshake()
+                 self.assertEqual(cm.exception.errno, errno.ENOTCONN)
+ 
+-        def test_default_ciphers(self):
+-            context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
+-            try:
+-                # Force a set of weak ciphers on our client context
+-                context.set_ciphers("DES")
+-            except ssl.SSLError:
+-                self.skipTest("no DES cipher available")
+-            with ThreadedEchoServer(CERTFILE,
+-                                    ssl_version=ssl.PROTOCOL_SSLv23,
+-                                    chatty=False) as server:
+-                with closing(context.wrap_socket(socket.socket())) as s:
+-                    with self.assertRaises(ssl.SSLError):
+-                        s.connect((HOST, server.port))
++        def test_no_shared_ciphers(self):
++            server_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
++            server_context.load_cert_chain(SIGNED_CERTFILE)
++            client_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
++            client_context.verify_mode = ssl.CERT_REQUIRED
++            client_context.check_hostname = True
++
++            # OpenSSL enables all TLS 1.3 ciphers, enforce TLS 1.2 for test
++            client_context.options |= ssl.OP_NO_TLSv1_3
++            # Force different suites on client and master
++            client_context.set_ciphers("AES128")
++            server_context.set_ciphers("AES256")
++            with ThreadedEchoServer(context=server_context) as server:
++                s = client_context.wrap_socket(
++                        socket.socket(),
++                        server_hostname="localhost")
++                with self.assertRaises(ssl.SSLError):
++                    s.connect((HOST, server.port))
+             self.assertIn("no shared cipher", str(server.conn_errors[0]))
+ 
+         def test_version_basic(self):
+@@ -2815,9 +2820,9 @@ else:
+                 with context.wrap_socket(socket.socket()) as s:
+                     s.connect((HOST, server.port))
+                     self.assertIn(s.cipher()[0], [
+-                        'TLS13-AES-256-GCM-SHA384',
+-                        'TLS13-CHACHA20-POLY1305-SHA256',
+-                        'TLS13-AES-128-GCM-SHA256',
++                        'TLS_AES_256_GCM_SHA384',
++                        'TLS_CHACHA20_POLY1305_SHA256',
++                        'TLS_AES_128_GCM_SHA256',
+                     ])
+ 
+         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
+diff --git a/Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst b/Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst
+new file mode 100644
+index 0000000000..bd719a47e8
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2018-05-18-21-50-47.bpo-33570.7CZy4t.rst
+@@ -0,0 +1,3 @@
++Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
++1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
++default.
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch b/meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
new file mode 100644
index 0000000000..96882712e9
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0002-bpo-34818-Add-missing-closing-wrapper-in-test_tls1_3.patch
@@ -0,0 +1,37 @@
+From 0e1f3856a7e1511fb64d99646c54ddf3897cd444 Mon Sep 17 00:00:00 2001
+From: Dimitri John Ledkov <xnox@ubuntu.com>
+Date: Fri, 28 Sep 2018 14:15:52 +0100
+Subject: [PATCH 2/4] bpo-34818: Add missing closing() wrapper in test_tls1_3.
+
+Python 2.7 socket classes do not implement context manager protocol,
+hence closing() is required around it. Resolves testcase error
+traceback.
+
+Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
+
+https://bugs.python.org/issue34818
+
+Patch taken from Ubuntu.
+
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/9622]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/test/test_ssl.py | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index f51572e319..7a14053cee 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -2817,7 +2817,7 @@ else:
+                 ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2
+             )
+             with ThreadedEchoServer(context=context) as server:
+-                with context.wrap_socket(socket.socket()) as s:
++                with closing(context.wrap_socket(socket.socket())) as s:
+                     s.connect((HOST, server.port))
+                     self.assertIn(s.cipher()[0], [
+                         'TLS_AES_256_GCM_SHA384',
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch b/meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
new file mode 100644
index 0000000000..77016cb430
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0003-bpo-34834-Fix-test_ssl.test_options-to-account-for-O.patch
@@ -0,0 +1,37 @@
+From 8b06d56d26eee289fec22b9b72ab4c7cc3d6c482 Mon Sep 17 00:00:00 2001
+From: Dimitri John Ledkov <xnox@ubuntu.com>
+Date: Fri, 28 Sep 2018 16:34:16 +0100
+Subject: [PATCH 3/4] bpo-34834: Fix test_ssl.test_options to account for
+ OP_ENABLE_MIDDLEBOX_COMPAT.
+
+Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
+
+https://bugs.python.org/issue34834
+
+Patch taken from Ubuntu.
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/9624]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/test/test_ssl.py | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index 7a14053cee..efc906a5ba 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -777,6 +777,11 @@ class ContextTests(unittest.TestCase):
+         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
+         if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 0):
+             default |= ssl.OP_NO_COMPRESSION
++        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 1):
++            # define MIDDLEBOX constant, as python2.7 does not know about it
++            # but it is used by default.
++            OP_ENABLE_MIDDLEBOX_COMPAT = 1048576L
++            default |= OP_ENABLE_MIDDLEBOX_COMPAT
+         self.assertEqual(default, ctx.options)
+         ctx.options |= ssl.OP_NO_TLSv1
+         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch b/meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
new file mode 100644
index 0000000000..39e1bcfc86
--- /dev/null
+++ b/meta/recipes-devtools/python/python/0004-bpo-34836-fix-test_default_ecdh_curve-needs-no-tlsv1.patch
@@ -0,0 +1,34 @@
+From 946a7969345c6697697effd226ec396d3fea05b7 Mon Sep 17 00:00:00 2001
+From: Dimitri John Ledkov <xnox@ubuntu.com>
+Date: Fri, 28 Sep 2018 17:30:19 +0100
+Subject: [PATCH 4/4] bpo-34836: fix test_default_ecdh_curve, needs no tlsv1.3.
+
+Signed-off-by: Dimitri John Ledkov <xnox@ubuntu.com>
+
+https://bugs.python.org/issue34836
+
+Patch taken from Ubuntu.
+Upstream-Status: Submitted [https://github.com/python/cpython/pull/9626]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/test/test_ssl.py | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index efc906a5ba..4a3286cd5f 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -2836,6 +2836,9 @@ else:
+             # should be enabled by default on SSL contexts.
+             context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
+             context.load_cert_chain(CERTFILE)
++            # TLSv1.3 defaults to PFS key agreement and no longer has KEA in
++            # cipher name.
++            context.options |= ssl.OP_NO_TLSv1_3
+             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enabled
+             # explicitly using the 'ECCdraft' cipher alias.  Otherwise,
+             # our default cipher list should prefer ECDH-based ciphers
+-- 
+2.17.1
+
-- 
2.17.1


