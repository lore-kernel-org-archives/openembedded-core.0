Return-Path: <anuj.mittal@intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 1041971A74
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 12:56:38 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Sep 2018 05:56:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,364,1531810800"; d="scan'208";a="88108046"
Received: from mjamduna-mobl4.gar.corp.intel.com (HELO
	anmitta2-MOBL1.png.intel.com) ([10.255.164.232])
	by fmsmga004.fm.intel.com with ESMTP; 12 Sep 2018 05:56:36 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Sep 2018 20:56:32 +0800
Message-Id: <20180912125632.21152-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180912125632.21152-1-anuj.mittal@intel.com>
References: <20180912125632.21152-1-anuj.mittal@intel.com>
Subject: [PATCH 2/2] python3{, -native}: backport openssl 1.1.x compatibility changes
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
X-List-Received-Date: Wed, 12 Sep 2018 12:56:38 -0000

Backport changes from 3.7/3.6 to fix failing python3 ssl test suite.

Fixes [YOCTO #12919]

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../python/python3-native_3.5.6.bb            |   5 +
 ...ontext-has-improved-default-settings.patch | 272 ++++++++++++++++++
 ...S-1.3-cipher-suites-and-OP_NO_TLSv1_.patch | 227 +++++++++++++++
 ...for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch | 173 +++++++++++
 ....3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch | 110 +++++++
 ...ALPN-changes-for-OpenSSL-1.1.0f-2305.patch |  68 +++++
 meta/recipes-devtools/python/python3_3.5.6.bb |   5 +
 7 files changed, 860 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
 create mode 100644 meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
 create mode 100644 meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
 create mode 100644 meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
 create mode 100644 meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch

diff --git a/meta/recipes-devtools/python/python3-native_3.5.6.bb b/meta/recipes-devtools/python/python3-native_3.5.6.bb
index 46b3cf398d..847d001fce 100644
--- a/meta/recipes-devtools/python/python3-native_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3-native_3.5.6.bb
@@ -24,6 +24,11 @@ file://setup.py-check-cross_compiling-when-get-FLAGS.patch \
 file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
 file://support_SOURCE_DATE_EPOCH_in_py_compile.patch \
 file://regen-all.patch \
+file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
+file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
+file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
+file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
+file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
 "
 
 SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
diff --git a/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch b/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
new file mode 100644
index 0000000000..321b4afa12
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0001-Issue-28043-SSLContext-has-improved-default-settings.patch
@@ -0,0 +1,272 @@
+From 758e7463c104f71b810c8588166747eeab6148d7 Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Sat, 10 Sep 2016 22:43:48 +0200
+Subject: [PATCH 1/4] Issue 28043: SSLContext has improved default settings
+
+The options OP_NO_COMPRESSION, OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE, OP_SINGLE_ECDH_USE, OP_NO_SSLv2 (except for PROTOCOL_SSLv2), and OP_NO_SSLv3 (except for PROTOCOL_SSLv3) are set by default. The initial cipher suite list contains only HIGH ciphers, no NULL ciphers and MD5 ciphers (except for PROTOCOL_SSLv2).
+
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/358cfd426ccc0fcd6a7940d306602138e76420ae]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Doc/library/ssl.rst  |  9 ++++++-
+ Lib/ssl.py           | 30 +++++----------------
+ Lib/test/test_ssl.py | 62 +++++++++++++++++++++++---------------------
+ Modules/_ssl.c       | 31 ++++++++++++++++++++++
+ 4 files changed, 78 insertions(+), 54 deletions(-)
+
+diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
+index a2f008346b..14f2d68217 100644
+--- a/Doc/library/ssl.rst
++++ b/Doc/library/ssl.rst
+@@ -1151,7 +1151,14 @@ to speed up repeated connections from the same clients.
+ 
+    .. versionchanged:: 3.5.3
+ 
+-      :data:`PROTOCOL_TLS` is the default value.
++      The context is created with secure default values. The options
++      :data:`OP_NO_COMPRESSION`, :data:`OP_CIPHER_SERVER_PREFERENCE`,
++      :data:`OP_SINGLE_DH_USE`, :data:`OP_SINGLE_ECDH_USE`,
++      :data:`OP_NO_SSLv2` (except for :data:`PROTOCOL_SSLv2`),
++      and :data:`OP_NO_SSLv3` (except for :data:`PROTOCOL_SSLv3`) are
++      set by default. The initial cipher suite list contains only ``HIGH``
++      ciphers, no ``NULL`` ciphers and no ``MD5`` ciphers (except for
++      :data:`PROTOCOL_SSLv2`).
+ 
+ 
+ :class:`SSLContext` objects have the following methods and attributes:
+diff --git a/Lib/ssl.py b/Lib/ssl.py
+index e1913904f3..4d302a78fa 100644
+--- a/Lib/ssl.py
++++ b/Lib/ssl.py
+@@ -446,32 +446,16 @@ def create_default_context(purpose=Purpose.SERVER_AUTH, *, cafile=None,
+     if not isinstance(purpose, _ASN1Object):
+         raise TypeError(purpose)
+ 
++    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
++    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_ECDH_USE
++    # by default.
+     context = SSLContext(PROTOCOL_TLS)
+ 
+-    # SSLv2 considered harmful.
+-    context.options |= OP_NO_SSLv2
+-
+-    # SSLv3 has problematic security and is only required for really old
+-    # clients such as IE6 on Windows XP
+-    context.options |= OP_NO_SSLv3
+-
+-    # disable compression to prevent CRIME attacks (OpenSSL 1.0+)
+-    context.options |= getattr(_ssl, "OP_NO_COMPRESSION", 0)
+-
+     if purpose == Purpose.SERVER_AUTH:
+         # verify certs and host name in client mode
+         context.verify_mode = CERT_REQUIRED
+         context.check_hostname = True
+     elif purpose == Purpose.CLIENT_AUTH:
+-        # Prefer the server's ciphers by default so that we get stronger
+-        # encryption
+-        context.options |= getattr(_ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
+-
+-        # Use single use keys in order to improve forward secrecy
+-        context.options |= getattr(_ssl, "OP_SINGLE_DH_USE", 0)
+-        context.options |= getattr(_ssl, "OP_SINGLE_ECDH_USE", 0)
+-
+-        # disallow ciphers with known vulnerabilities
+         context.set_ciphers(_RESTRICTED_SERVER_CIPHERS)
+ 
+     if cafile or capath or cadata:
+@@ -497,12 +481,10 @@ def _create_unverified_context(protocol=PROTOCOL_TLS, *, cert_reqs=None,
+     if not isinstance(purpose, _ASN1Object):
+         raise TypeError(purpose)
+ 
++    # SSLContext sets OP_NO_SSLv2, OP_NO_SSLv3, OP_NO_COMPRESSION,
++    # OP_CIPHER_SERVER_PREFERENCE, OP_SINGLE_DH_USE and OP_SINGLE_ECDH_USE
++    # by default.
+     context = SSLContext(protocol)
+-    # SSLv2 considered harmful.
+-    context.options |= OP_NO_SSLv2
+-    # SSLv3 has problematic security and is only required for really old
+-    # clients such as IE6 on Windows XP
+-    context.options |= OP_NO_SSLv3
+ 
+     if cert_reqs is not None:
+         context.verify_mode = cert_reqs
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index ffb7314f57..f91af7bd05 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -73,6 +73,12 @@ NULLBYTECERT = data_file("nullbytecert.pem")
+ DHFILE = data_file("dh1024.pem")
+ BYTES_DHFILE = os.fsencode(DHFILE)
+ 
++# Not defined in all versions of OpenSSL
++OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
++OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
++OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
++OP_CIPHER_SERVER_PREFERENCE = getattr(ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
++
+ 
+ def handle_error(prefix):
+     exc_format = ' '.join(traceback.format_exception(*sys.exc_info()))
+@@ -839,8 +845,9 @@ class ContextTests(unittest.TestCase):
+         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
+         # OP_ALL | OP_NO_SSLv2 | OP_NO_SSLv3 is the default value
+         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
+-        if not IS_LIBRESSL and ssl.OPENSSL_VERSION_INFO >= (1, 1, 0):
+-            default |= ssl.OP_NO_COMPRESSION
++        # SSLContext also enables these by default
++        default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
++                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
+         self.assertEqual(default, ctx.options)
+         ctx.options |= ssl.OP_NO_TLSv1
+         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
+@@ -1205,16 +1212,29 @@ class ContextTests(unittest.TestCase):
+             stats["x509"] += 1
+             self.assertEqual(ctx.cert_store_stats(), stats)
+ 
++    def _assert_context_options(self, ctx):
++        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
++        if OP_NO_COMPRESSION != 0:
++            self.assertEqual(ctx.options & OP_NO_COMPRESSION,
++                             OP_NO_COMPRESSION)
++        if OP_SINGLE_DH_USE != 0:
++            self.assertEqual(ctx.options & OP_SINGLE_DH_USE,
++                             OP_SINGLE_DH_USE)
++        if OP_SINGLE_ECDH_USE != 0:
++            self.assertEqual(ctx.options & OP_SINGLE_ECDH_USE,
++                             OP_SINGLE_ECDH_USE)
++        if OP_CIPHER_SERVER_PREFERENCE != 0:
++            self.assertEqual(ctx.options & OP_CIPHER_SERVER_PREFERENCE,
++                             OP_CIPHER_SERVER_PREFERENCE)
++
+     def test_create_default_context(self):
+         ctx = ssl.create_default_context()
++
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
+         self.assertTrue(ctx.check_hostname)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
+-        self.assertEqual(
+-            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
+-            getattr(ssl, "OP_NO_COMPRESSION", 0),
+-        )
++        self._assert_context_options(ctx)
++
+ 
+         with open(SIGNING_CA) as f:
+             cadata = f.read()
+@@ -1222,40 +1242,24 @@ class ContextTests(unittest.TestCase):
+                                          cadata=cadata)
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
+-        self.assertEqual(
+-            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
+-            getattr(ssl, "OP_NO_COMPRESSION", 0),
+-        )
++        self._assert_context_options(ctx)
+ 
+         ctx = ssl.create_default_context(ssl.Purpose.CLIENT_AUTH)
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
+-        self.assertEqual(
+-            ctx.options & getattr(ssl, "OP_NO_COMPRESSION", 0),
+-            getattr(ssl, "OP_NO_COMPRESSION", 0),
+-        )
+-        self.assertEqual(
+-            ctx.options & getattr(ssl, "OP_SINGLE_DH_USE", 0),
+-            getattr(ssl, "OP_SINGLE_DH_USE", 0),
+-        )
+-        self.assertEqual(
+-            ctx.options & getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
+-            getattr(ssl, "OP_SINGLE_ECDH_USE", 0),
+-        )
++        self._assert_context_options(ctx)
+ 
+     def test__create_stdlib_context(self):
+         ctx = ssl._create_stdlib_context()
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
+         self.assertFalse(ctx.check_hostname)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
++        self._assert_context_options(ctx)
+ 
+         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1)
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
++        self._assert_context_options(ctx)
+ 
+         ctx = ssl._create_stdlib_context(ssl.PROTOCOL_TLSv1,
+                                          cert_reqs=ssl.CERT_REQUIRED,
+@@ -1263,12 +1267,12 @@ class ContextTests(unittest.TestCase):
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLSv1)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_REQUIRED)
+         self.assertTrue(ctx.check_hostname)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
++        self._assert_context_options(ctx)
+ 
+         ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
+         self.assertEqual(ctx.protocol, ssl.PROTOCOL_SSLv23)
+         self.assertEqual(ctx.verify_mode, ssl.CERT_NONE)
+-        self.assertEqual(ctx.options & ssl.OP_NO_SSLv2, ssl.OP_NO_SSLv2)
++        self._assert_context_options(ctx)
+ 
+     def test_check_hostname(self):
+         ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
+diff --git a/Modules/_ssl.c b/Modules/_ssl.c
+index 86482677ae..0d5c121d2c 100644
+--- a/Modules/_ssl.c
++++ b/Modules/_ssl.c
+@@ -2330,6 +2330,7 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_version)
+     PySSLContext *self;
+     long options;
+     SSL_CTX *ctx = NULL;
++    int result;
+ #if defined(SSL_MODE_RELEASE_BUFFERS)
+     unsigned long libver;
+ #endif
+@@ -2393,8 +2394,38 @@ _ssl__SSLContext_impl(PyTypeObject *type, int proto_version)
+         options |= SSL_OP_NO_SSLv2;
+     if (proto_version != PY_SSL_VERSION_SSL3)
+         options |= SSL_OP_NO_SSLv3;
++    /* Minimal security flags for server and client side context.
++     * Client sockets ignore server-side parameters. */
++#ifdef SSL_OP_NO_COMPRESSION
++    options |= SSL_OP_NO_COMPRESSION;
++#endif
++#ifdef SSL_OP_CIPHER_SERVER_PREFERENCE
++    options |= SSL_OP_CIPHER_SERVER_PREFERENCE;
++#endif
++#ifdef SSL_OP_SINGLE_DH_USE
++    options |= SSL_OP_SINGLE_DH_USE;
++#endif
++#ifdef SSL_OP_SINGLE_ECDH_USE
++    options |= SSL_OP_SINGLE_ECDH_USE;
++#endif
+     SSL_CTX_set_options(self->ctx, options);
+ 
++    /* A bare minimum cipher list without completly broken cipher suites.
++     * It's far from perfect but gives users a better head start. */
++    if (proto_version != PY_SSL_VERSION_SSL2) {
++        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL:!MD5");
++    } else {
++        /* SSLv2 needs MD5 */
++        result = SSL_CTX_set_cipher_list(ctx, "HIGH:!aNULL:!eNULL");
++    }
++    if (result == 0) {
++        Py_DECREF(self);
++        ERR_clear_error();
++        PyErr_SetString(PySSLErrorObject,
++                        "No cipher can be selected.");
++        return NULL;
++    }
++
+ #if defined(SSL_MODE_RELEASE_BUFFERS)
+     /* Set SSL_MODE_RELEASE_BUFFERS. This potentially greatly reduces memory
+        usage for no cost at all. However, don't do this for OpenSSL versions
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch b/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
new file mode 100644
index 0000000000..d48cad7586
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch
@@ -0,0 +1,227 @@
+From e950ea68dab006944af194c9910b8f2341d1437d Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Thu, 7 Sep 2017 20:23:52 -0700
+Subject: [PATCH] bpo-29136: Add TLS 1.3 cipher suites and OP_NO_TLSv1_3
+ (GH-1363) (#3444)
+
+* bpo-29136: Add TLS 1.3 support
+
+TLS 1.3 introduces a new, distinct set of cipher suites. The TLS 1.3
+cipher suites don't overlap with cipher suites from TLS 1.2 and earlier.
+Since Python sets its own set of permitted ciphers, TLS 1.3 handshake
+will fail as soon as OpenSSL 1.1.1 is released. Let's enable the common
+AES-GCM and ChaCha20 suites.
+
+Additionally the flag OP_NO_TLSv1_3 is added. It defaults to 0 (no op) with
+OpenSSL prior to 1.1.1. This allows applications to opt-out from TLS 1.3
+now.
+
+Signed-off-by: Christian Heimes <christian@python.org>.
+(cherry picked from commit cb5b68abdeb1b1d56c581d5b4d647018703d61e3)
+
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/cb5b68abdeb1b1d56c581d5b4d647018703d61e3]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Doc/library/ssl.rst                           | 21 ++++++++++++++
+ Lib/ssl.py                                    |  7 +++++
+ Lib/test/test_ssl.py                          | 29 ++++++++++++++++++-
+ .../2017-09-04-16-39-49.bpo-29136.vSn1oR.rst  |  1 +
+ Modules/_ssl.c                                | 13 +++++++++
+ 5 files changed, 70 insertions(+), 1 deletion(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
+
+diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
+index 14f2d68217..29c5e94cf6 100644
+--- a/Doc/library/ssl.rst
++++ b/Doc/library/ssl.rst
+@@ -285,6 +285,11 @@ purposes.
+ 
+      3DES was dropped from the default cipher string.
+ 
++   .. versionchanged:: 3.7
++
++     TLS 1.3 cipher suites TLS_AES_128_GCM_SHA256, TLS_AES_256_GCM_SHA384,
++     and TLS_CHACHA20_POLY1305_SHA256 were added to the default cipher string.
++
+ 
+ Random generation
+ ^^^^^^^^^^^^^^^^^
+@@ -719,6 +724,16 @@ Constants
+ 
+    .. versionadded:: 3.4
+ 
++.. data:: OP_NO_TLSv1_3
++
++   Prevents a TLSv1.3 connection. This option is only applicable in conjunction
++   with :const:`PROTOCOL_TLS`. It prevents the peers from choosing TLSv1.3 as
++   the protocol version. TLS 1.3 is available with OpenSSL 1.1.1 or later.
++   When Python has been compiled against an older version of OpenSSL, the
++   flag defaults to *0*.
++
++   .. versionadded:: 3.7
++
+ .. data:: OP_CIPHER_SERVER_PREFERENCE
+ 
+    Use the server's cipher ordering preference, rather than the client's.
+@@ -783,6 +798,12 @@ Constants
+ 
+    .. versionadded:: 3.3
+ 
++.. data:: HAS_TLSv1_3
++
++   Whether the OpenSSL library has built-in support for the TLS 1.3 protocol.
++
++   .. versionadded:: 3.7
++
+ .. data:: CHANNEL_BINDING_TYPES
+ 
+    List of supported TLS channel binding types.  Strings in this list
+diff --git a/Lib/ssl.py b/Lib/ssl.py
+index 4d302a78fa..f233e72e1f 100644
+--- a/Lib/ssl.py
++++ b/Lib/ssl.py
+@@ -122,6 +122,7 @@ _import_symbols('OP_')
+ _import_symbols('ALERT_DESCRIPTION_')
+ _import_symbols('SSL_ERROR_')
+ _import_symbols('VERIFY_')
++from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN, HAS_TLSv1_3
+ 
+ from _ssl import HAS_SNI, HAS_ECDH, HAS_NPN, HAS_ALPN
+ 
+@@ -162,6 +163,7 @@ else:
+ # (OpenSSL's default setting is 'DEFAULT:!aNULL:!eNULL')
+ # Enable a better set of ciphers by default
+ # This list has been explicitly chosen to:
++#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
+ #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
+ #   * Prefer ECDHE over DHE for better performance
+ #   * Prefer AEAD over CBC for better performance and security
+@@ -173,6 +175,8 @@ else:
+ #   * Disable NULL authentication, NULL encryption, 3DES and MD5 MACs
+ #     for security reasons
+ _DEFAULT_CIPHERS = (
++    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
++    'TLS13-AES-128-GCM-SHA256:'
+     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
+     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
+     '!aNULL:!eNULL:!MD5:!3DES'
+@@ -180,6 +184,7 @@ _DEFAULT_CIPHERS = (
+ 
+ # Restricted and more secure ciphers for the server side
+ # This list has been explicitly chosen to:
++#   * TLS 1.3 ChaCha20 and AES-GCM cipher suites
+ #   * Prefer cipher suites that offer perfect forward secrecy (DHE/ECDHE)
+ #   * Prefer ECDHE over DHE for better performance
+ #   * Prefer AEAD over CBC for better performance and security
+@@ -190,6 +195,8 @@ _DEFAULT_CIPHERS = (
+ #   * Disable NULL authentication, NULL encryption, MD5 MACs, DSS, RC4, and
+ #     3DES for security reasons
+ _RESTRICTED_SERVER_CIPHERS = (
++    'TLS13-AES-256-GCM-SHA384:TLS13-CHACHA20-POLY1305-SHA256:'
++    'TLS13-AES-128-GCM-SHA256:'
+     'ECDH+AESGCM:ECDH+CHACHA20:DH+AESGCM:DH+CHACHA20:ECDH+AES256:DH+AES256:'
+     'ECDH+AES128:DH+AES:ECDH+HIGH:DH+HIGH:RSA+AESGCM:RSA+AES:RSA+HIGH:'
+     '!aNULL:!eNULL:!MD5:!DSS:!RC4:!3DES'
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index f91af7bd05..1acc12ec2d 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -150,6 +150,13 @@ class BasicSocketTests(unittest.TestCase):
+             ssl.OP_NO_COMPRESSION
+         self.assertIn(ssl.HAS_SNI, {True, False})
+         self.assertIn(ssl.HAS_ECDH, {True, False})
++        ssl.OP_NO_SSLv2
++        ssl.OP_NO_SSLv3
++        ssl.OP_NO_TLSv1
++        ssl.OP_NO_TLSv1_3
++    if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
++            ssl.OP_NO_TLSv1_1
++            ssl.OP_NO_TLSv1_2
+ 
+     def test_str_for_enums(self):
+         # Make sure that the PROTOCOL_* constants have enum-like string
+@@ -3028,12 +3035,33 @@ else:
+                     self.assertEqual(s.version(), 'TLSv1')
+                 self.assertIs(s.version(), None)
+ 
++        @unittest.skipUnless(ssl.HAS_TLSv1_3,
++                             "test requires TLSv1.3 enabled OpenSSL")
++        def test_tls1_3(self):
++            context = ssl.SSLContext(ssl.PROTOCOL_TLS)
++            context.load_cert_chain(CERTFILE)
++            # disable all but TLS 1.3
++            context.options |= (
++                ssl.OP_NO_TLSv1 | ssl.OP_NO_TLSv1_1 | ssl.OP_NO_TLSv1_2
++            )
++            with ThreadedEchoServer(context=context) as server:
++                with context.wrap_socket(socket.socket()) as s:
++                    s.connect((HOST, server.port))
++                    self.assertIn(s.cipher()[0], [
++                        'TLS13-AES-256-GCM-SHA384',
++                        'TLS13-CHACHA20-POLY1305-SHA256',
++                        'TLS13-AES-128-GCM-SHA256',
++                    ])
++
+         @unittest.skipUnless(ssl.HAS_ECDH, "test requires ECDH-enabled OpenSSL")
+         def test_default_ecdh_curve(self):
+             # Issue #21015: elliptic curve-based Diffie Hellman key exchange
+             # should be enabled by default on SSL contexts.
+             context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
+             context.load_cert_chain(CERTFILE)
++            # TLSv1.3 defaults to PFS key agreement and no longer has KEA in
++            # cipher name.
++            context.options |= ssl.OP_NO_TLSv1_3
+             # Prior to OpenSSL 1.0.0, ECDH ciphers have to be enabled
+             # explicitly using the 'ECCdraft' cipher alias.  Otherwise,
+             # our default cipher list should prefer ECDH-based ciphers
+@@ -3394,7 +3422,6 @@ else:
+                         s.sendfile(file)
+                         self.assertEqual(s.recv(1024), TEST_DATA)
+ 
+-
+ def test_main(verbose=False):
+     if support.verbose:
+         import warnings
+diff --git a/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
+new file mode 100644
+index 0000000000..e76997ef83
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2017-09-04-16-39-49.bpo-29136.vSn1oR.rst
+@@ -0,0 +1 @@
++Add TLS 1.3 cipher suites and OP_NO_TLSv1_3.
+diff --git a/Modules/_ssl.c b/Modules/_ssl.c
+index 0d5c121d2c..c71d89607c 100644
+--- a/Modules/_ssl.c
++++ b/Modules/_ssl.c
+@@ -4842,6 +4842,11 @@ PyInit__ssl(void)
+ #if HAVE_TLSv1_2
+     PyModule_AddIntConstant(m, "OP_NO_TLSv1_1", SSL_OP_NO_TLSv1_1);
+     PyModule_AddIntConstant(m, "OP_NO_TLSv1_2", SSL_OP_NO_TLSv1_2);
++#endif
++#ifdef SSL_OP_NO_TLSv1_3
++    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", SSL_OP_NO_TLSv1_3);
++#else
++    PyModule_AddIntConstant(m, "OP_NO_TLSv1_3", 0);
+ #endif
+     PyModule_AddIntConstant(m, "OP_CIPHER_SERVER_PREFERENCE",
+                             SSL_OP_CIPHER_SERVER_PREFERENCE);
+@@ -4890,6 +4895,14 @@ PyInit__ssl(void)
+     Py_INCREF(r);
+     PyModule_AddObject(m, "HAS_ALPN", r);
+ 
++#if defined(TLS1_3_VERSION) && !defined(OPENSSL_NO_TLS1_3)
++    r = Py_True;
++#else
++    r = Py_False;
++#endif
++    Py_INCREF(r);
++    PyModule_AddObject(m, "HAS_TLSv1_3", r);
++
+     /* Mappings for error codes */
+     err_codes_to_names = PyDict_New();
+     err_names_to_codes = PyDict_New();
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch b/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
new file mode 100644
index 0000000000..56d591d1b5
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch
@@ -0,0 +1,173 @@
+From 170a614904febd14ff6cfd7a75c9bccc114b3948 Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Tue, 14 Aug 2018 16:56:32 +0200
+Subject: [PATCH] bpo-32947: Fixes for TLS 1.3 and OpenSSL 1.1.1 (GH-8761)
+
+Backport of TLS 1.3 related fixes from 3.7.
+
+Misc fixes and workarounds for compatibility with OpenSSL 1.1.1 from git
+master and TLS 1.3 support. With OpenSSL 1.1.1, Python negotiates TLS 1.3 by
+default. Some test cases only apply to TLS 1.2.
+
+OpenSSL 1.1.1 has added a new option OP_ENABLE_MIDDLEBOX_COMPAT for TLS
+1.3. The feature is enabled by default for maximum compatibility with
+broken middle boxes. Users should be able to disable the hack and CPython's test suite needs
+it to verify default options
+
+Signed-off-by: Christian Heimes <christian@python.org>
+
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/2a4ee8aa01d61b6a9c8e9c65c211e61bdb471826]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Doc/library/ssl.rst                           |  9 ++++++
+ Lib/test/test_asyncio/test_events.py          |  6 +++-
+ Lib/test/test_ssl.py                          | 29 +++++++++++++++----
+ .../2018-08-14-08-57-01.bpo-32947.mqStVW.rst  |  2 ++
+ Modules/_ssl.c                                |  4 +++
+ 5 files changed, 44 insertions(+), 6 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
+
+diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
+index 29c5e94cf6..f63a3deec5 100644
+--- a/Doc/library/ssl.rst
++++ b/Doc/library/ssl.rst
+@@ -757,6 +757,15 @@ Constants
+ 
+    .. versionadded:: 3.3
+ 
++.. data:: OP_ENABLE_MIDDLEBOX_COMPAT
++
++   Send dummy Change Cipher Spec (CCS) messages in TLS 1.3 handshake to make
++   a TLS 1.3 connection look more like a TLS 1.2 connection.
++
++   This option is only available with OpenSSL 1.1.1 and later.
++
++   .. versionadded:: 3.6.7
++
+ .. data:: OP_NO_COMPRESSION
+ 
+    Disable compression on the SSL channel.  This is useful if the application
+diff --git a/Lib/test/test_asyncio/test_events.py b/Lib/test/test_asyncio/test_events.py
+index 492a84a231..6f208474b9 100644
+--- a/Lib/test/test_asyncio/test_events.py
++++ b/Lib/test/test_asyncio/test_events.py
+@@ -1169,7 +1169,11 @@ class EventLoopTestsMixin:
+                     self.loop.run_until_complete(f_c)
+ 
+         # close connection
+-        proto.transport.close()
++        # transport may be None with TLS 1.3, because connection is
++        # interrupted, server is unable to send session tickets, and
++        # transport is closed.
++        if proto.transport is not None:
++            proto.transport.close()
+         server.close()
+ 
+     def test_legacy_create_server_ssl_match_failed(self):
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index 1acc12ec2d..a2e1d32a62 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -78,6 +78,7 @@ OP_NO_COMPRESSION = getattr(ssl, "OP_NO_COMPRESSION", 0)
+ OP_SINGLE_DH_USE = getattr(ssl, "OP_SINGLE_DH_USE", 0)
+ OP_SINGLE_ECDH_USE = getattr(ssl, "OP_SINGLE_ECDH_USE", 0)
+ OP_CIPHER_SERVER_PREFERENCE = getattr(ssl, "OP_CIPHER_SERVER_PREFERENCE", 0)
++OP_ENABLE_MIDDLEBOX_COMPAT = getattr(ssl, "OP_ENABLE_MIDDLEBOX_COMPAT", 0)
+ 
+ 
+ def handle_error(prefix):
+@@ -155,8 +156,8 @@ class BasicSocketTests(unittest.TestCase):
+         ssl.OP_NO_TLSv1
+         ssl.OP_NO_TLSv1_3
+     if ssl.OPENSSL_VERSION_INFO >= (1, 0, 1):
+-            ssl.OP_NO_TLSv1_1
+-            ssl.OP_NO_TLSv1_2
++        ssl.OP_NO_TLSv1_1
++        ssl.OP_NO_TLSv1_2
+ 
+     def test_str_for_enums(self):
+         # Make sure that the PROTOCOL_* constants have enum-like string
+@@ -854,7 +855,8 @@ class ContextTests(unittest.TestCase):
+         default = (ssl.OP_ALL | ssl.OP_NO_SSLv2 | ssl.OP_NO_SSLv3)
+         # SSLContext also enables these by default
+         default |= (OP_NO_COMPRESSION | OP_CIPHER_SERVER_PREFERENCE |
+-                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE)
++                    OP_SINGLE_DH_USE | OP_SINGLE_ECDH_USE |
++                    OP_ENABLE_MIDDLEBOX_COMPAT)
+         self.assertEqual(default, ctx.options)
+         ctx.options |= ssl.OP_NO_TLSv1
+         self.assertEqual(default | ssl.OP_NO_TLSv1, ctx.options)
+@@ -1860,11 +1862,26 @@ else:
+                         self.sock, server_side=True)
+                     self.server.selected_npn_protocols.append(self.sslconn.selected_npn_protocol())
+                     self.server.selected_alpn_protocols.append(self.sslconn.selected_alpn_protocol())
+-                except (ssl.SSLError, ConnectionResetError) as e:
++                except (ConnectionResetError, BrokenPipeError) as e:
+                     # We treat ConnectionResetError as though it were an
+                     # SSLError - OpenSSL on Ubuntu abruptly closes the
+                     # connection when asked to use an unsupported protocol.
+                     #
++                    # BrokenPipeError is raised in TLS 1.3 mode, when OpenSSL
++                    # tries to send session tickets after handshake.
++                    # https://github.com/openssl/openssl/issues/6342
++                    self.server.conn_errors.append(str(e))
++                    if self.server.chatty:
++                        handle_error(
++                            "\n server:  bad connection attempt from " + repr(
++                                self.addr) + ":\n")
++                    self.running = False
++                    self.close()
++                    return False
++                except (ssl.SSLError, OSError) as e:
++                    # OSError may occur with wrong protocols, e.g. both
++                    # sides use PROTOCOL_TLS_SERVER.
++                    #
+                     # XXX Various errors can have happened here, for example
+                     # a mismatching protocol version, an invalid certificate,
+                     # or a low-level bug. This should be made more discriminating.
+@@ -2974,7 +2991,7 @@ else:
+                 # Block on the accept and wait on the connection to close.
+                 evt.set()
+                 remote, peer = server.accept()
+-                remote.recv(1)
++                remote.send(remote.recv(4))
+ 
+             t = threading.Thread(target=serve)
+             t.start()
+@@ -2982,6 +2999,8 @@ else:
+             evt.wait()
+             client = context.wrap_socket(socket.socket())
+             client.connect((host, port))
++            client.send(b'data')
++            client.recv()
+             client_addr = client.getsockname()
+             client.close()
+             t.join()
+diff --git a/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
+new file mode 100644
+index 0000000000..28de360c36
+--- /dev/null
++++ b/Misc/NEWS.d/next/Library/2018-08-14-08-57-01.bpo-32947.mqStVW.rst
+@@ -0,0 +1,2 @@
++Add OP_ENABLE_MIDDLEBOX_COMPAT and test workaround for TLSv1.3 for future
++compatibility with OpenSSL 1.1.1.
+diff --git a/Modules/_ssl.c b/Modules/_ssl.c
+index c71d89607c..eb123a87ba 100644
+--- a/Modules/_ssl.c
++++ b/Modules/_ssl.c
+@@ -4858,6 +4858,10 @@ PyInit__ssl(void)
+     PyModule_AddIntConstant(m, "OP_NO_COMPRESSION",
+                             SSL_OP_NO_COMPRESSION);
+ #endif
++#ifdef SSL_OP_ENABLE_MIDDLEBOX_COMPAT
++    PyModule_AddIntConstant(m, "OP_ENABLE_MIDDLEBOX_COMPAT",
++                            SSL_OP_ENABLE_MIDDLEBOX_COMPAT);
++#endif
+ 
+ #if HAVE_SNI
+     r = Py_True;
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch b/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
new file mode 100644
index 0000000000..b97d5501e1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch
@@ -0,0 +1,110 @@
+From 0c9354362bfa5f90fbea8ff8237a1f1f5dba686f Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Wed, 12 Sep 2018 15:20:31 +0800
+Subject: [PATCH] bpo-33570: TLS 1.3 ciphers for OpenSSL 1.1.1 (GH-6976)
+
+Change TLS 1.3 cipher suite settings for compatibility with OpenSSL
+1.1.1-pre6 and newer. OpenSSL 1.1.1 will have TLS 1.3 cipers enabled by
+default.
+
+Also update multissltests and Travis config to test with latest OpenSSL.
+
+Signed-off-by: Christian Heimes <christian@python.org>
+(cherry picked from commit e8eb6cb7920ded66abc5d284319a8539bdc2bae3)
+
+Co-authored-by: Christian Heimes <christian@python.org
+
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/3e630c541b35c96bfe5619165255e559f577ee71]
+
+Tweaked patch to not take changes for multissltests and Travis config.
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Lib/test/test_ssl.py | 51 ++++++++++++++++++++++----------------------
+ 1 file changed, 26 insertions(+), 25 deletions(-)
+
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index a2e1d32a62..c484ead5ff 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -3024,17 +3024,21 @@ else:
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
+-                with context.wrap_socket(socket.socket()) as s:
++        def test_no_shared_ciphers(self):
++            server_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
++            server_context.load_cert_chain(SIGNED_CERTFILE)
++            client_context = ssl.SSLContext(ssl.PROTOCOL_SSLv23)
++            client_context.verify_mode = ssl.CERT_REQUIRED
++            client_context.check_hostname = True
++
++            client_context.set_ciphers("AES128")
++            server_context.set_ciphers("AES256")
++            # OpenSSL enables all TLS 1.3 ciphers, enforce TLS 1.2 for test
++            client_context.options |= ssl.OP_NO_TLSv1_3
++            with ThreadedEchoServer(context=server_context) as server:
++                with client_context.wrap_socket(
++                        socket.socket(),
++                        server_hostname="localhost") as s:
+                     with self.assertRaises(OSError):
+                         s.connect((HOST, server.port))
+             self.assertIn("no shared cipher", str(server.conn_errors[0]))
+@@ -3067,9 +3071,9 @@ else:
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
+@@ -3391,22 +3395,19 @@ else:
+             client_context = ssl.SSLContext(ssl.PROTOCOL_TLSv1)
+             client_context.verify_mode = ssl.CERT_REQUIRED
+             client_context.load_verify_locations(SIGNING_CA)
+-            if ssl.OPENSSL_VERSION_INFO >= (1, 0, 2):
+-                client_context.set_ciphers("AES128:AES256")
+-                server_context.set_ciphers("AES256")
+-                alg1 = "AES256"
+-                alg2 = "AES-256"
+-            else:
+-                client_context.set_ciphers("AES:3DES")
+-                server_context.set_ciphers("3DES")
+-                alg1 = "3DES"
+-                alg2 = "DES-CBC3"
++            client_context.set_ciphers("AES128:AES256")
++            server_context.set_ciphers("AES256")
++            expected_algs = [
++                "AES256", "AES-256",
++                 # TLS 1.3 ciphers are always enabled
++                 "TLS_CHACHA20", "TLS_AES",
++            ]
+ 
+             stats = server_params_test(client_context, server_context)
+             ciphers = stats['server_shared_ciphers'][0]
+             self.assertGreater(len(ciphers), 0)
+             for name, tls_version, bits in ciphers:
+-                if not alg1 in name.split("-") and alg2 not in name:
++                if not any (alg in name for alg in expected_algs):
+                     self.fail(name)
+ 
+         def test_read_write_after_close_raises_valuerror(self):
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch b/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
new file mode 100644
index 0000000000..d609847204
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch
@@ -0,0 +1,68 @@
+From 7b40cb7293cb14e5c7c8ed123efaf9acb33edae2 Mon Sep 17 00:00:00 2001
+From: Christian Heimes <christian@python.org>
+Date: Tue, 15 Aug 2017 10:33:43 +0200
+Subject: [PATCH] bpo-30714: ALPN changes for OpenSSL 1.1.0f (#2305)
+
+OpenSSL 1.1.0 to 1.1.0e aborted the handshake when server and client
+could not agree on a protocol using ALPN. OpenSSL 1.1.0f changed that.
+The most recent version now behaves like OpenSSL 1.0.2 again. The ALPN
+callback can pretend to not been set.
+
+See https://github.com/openssl/openssl/pull/3158 for more details
+
+Signed-off-by: Christian Heimes <christian@python.org>
+
+Upstream-Status: Backport
+[https://github.com/python/cpython/commit/7b40cb7293cb14e5c7c8ed123efaf9acb33edae2]
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ Doc/library/ssl.rst                                          | 5 +++--
+ Lib/test/test_ssl.py                                         | 5 +++--
+ .../next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst      | 2 ++
+ 3 files changed, 8 insertions(+), 4 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
+
+diff --git a/Doc/library/ssl.rst b/Doc/library/ssl.rst
+index 729a239a1b..0a09e7e9d4 100644
+--- a/Doc/library/ssl.rst
++++ b/Doc/library/ssl.rst
+@@ -1447,8 +1447,9 @@ to speed up repeated connections from the same clients.
+    This method will raise :exc:`NotImplementedError` if :data:`HAS_ALPN` is
+    False.
+ 
+-   OpenSSL 1.1.0+ will abort the handshake and raise :exc:`SSLError` when
+-   both sides support ALPN but cannot agree on a protocol.
++   OpenSSL 1.1.0 to 1.1.0e will abort the handshake and raise :exc:`SSLError`
++   when both sides support ALPN but cannot agree on a protocol. 1.1.0f+
++   behaves like 1.0.2, :meth:`SSLSocket.selected_alpn_protocol` returns None.
+ 
+    .. versionadded:: 3.5
+ 
+diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
+index d960d82065..104b7f377a 100644
+--- a/Lib/test/test_ssl.py
++++ b/Lib/test/test_ssl.py
+@@ -3268,8 +3268,9 @@ if _have_threads:
+                 except ssl.SSLError as e:
+                     stats = e
+ 
+-                if expected is None and IS_OPENSSL_1_1:
+-                    # OpenSSL 1.1.0 raises handshake error
++                if (expected is None and IS_OPENSSL_1_1
++                        and ssl.OPENSSL_VERSION_INFO < (1, 1, 0, 6)):
++                    # OpenSSL 1.1.0 to 1.1.0e raises handshake error
+                     self.assertIsInstance(stats, ssl.SSLError)
+                 else:
+                     msg = "failed trying %s (s) and %s (c).\n" \
+diff --git a/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
+new file mode 100644
+index 0000000000..88394e585c
+--- /dev/null
++++ b/Misc/NEWS.d/next/Tests/2017-07-25-15-27-44.bpo-30715.Sp7bTF.rst
+@@ -0,0 +1,2 @@
++Address ALPN callback changes for OpenSSL 1.1.0f. The latest version behaves
++like OpenSSL 1.0.2 and no longer aborts handshake.
+-- 
+2.17.1
+
diff --git a/meta/recipes-devtools/python/python3_3.5.6.bb b/meta/recipes-devtools/python/python3_3.5.6.bb
index 13599c9216..17f379441e 100644
--- a/meta/recipes-devtools/python/python3_3.5.6.bb
+++ b/meta/recipes-devtools/python/python3_3.5.6.bb
@@ -42,6 +42,11 @@ SRC_URI += "\
             file://float-endian.patch \
             file://ftplib.patch \
             file://signal.patch \
+            file://0001-Issue-28043-SSLContext-has-improved-default-settings.patch \
+            file://0002-bpo-29136-Add-TLS-1.3-cipher-suites-and-OP_NO_TLSv1_.patch \
+            file://0003-bpo-32947-Fixes-for-TLS-1.3-and-OpenSSL-1.1.1-GH-876.patch \
+            file://0004-bpo-33570-TLS-1.3-ciphers-for-OpenSSL-1.1.1-GH-6976.patch \
+            file://0005-bpo-30714-ALPN-changes-for-OpenSSL-1.1.0f-2305.patch \
            "
 SRC_URI[md5sum] = "f5a99f765e765336a3ebbb2a24ca2be3"
 SRC_URI[sha256sum] = "f55cde04f521f273c7cba08912921cc5642cfc15ca7b22d5829f0aff4371155f"
-- 
2.17.1


