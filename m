Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17220.1793294270044661793
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:17:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=EWE5pot7;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261029171746689d5e48d100020778-8__mnp@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261029171746689d5e48d100020778
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:17:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=2Qn8DVZERaQFjt2pmD11nayK9dHNIYVag7BXR53O1DA=;
 b=EWE5pot7BCXUw8sei17mIDRc/FBPugyPcm4STyMxGo7PD/opRNoXy9HkB0chmWaDlUmIDy
 ZuLSQBiMcmE4luPc6fyuBzcUs4hFMYH1YccUgLR0Q5vcQ8x0q6/UK9tXvLGYu1ANMVYWHu7a
 8xIz7p4mCH8rgzAsHvRch7ltNlgMyQMygZ1SAMOpA+oqizRJFhxTpTcB5ZuDwOO3cJNaap8+
 +I/OlOrCERFGreJL060NfNtqFQLigz0NH5s1Ho4qr+V5IhY3sWqvysgvqsaSq7DmZGtbkhAp
 OPMG4P/j/Fs2rib/Regpgv0dN8Jcd1Q4YIhsTl3e2e6vldZp40vOw9Rw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 1/8] python3: upgrade 3.14.7 -> 3.14.9
Date: Thu, 29 Oct 2026 18:16:59 +0100
Message-ID: <20261029171709.2842512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248957
Content-Type: text/plain; charset="utf-8"

From: Ross Burton <ross.burton@arm.com>

The release notes are long[1] but the highlight is upgrading the bundled
pip wheel to 26.2.2, as pip bundles certifi which needed upgrading due
to the eMudhra intermediate CA compromise.

[1] https://docs.python.org/release/3.14.9/whatsnew/changelog.html
[2] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 526baf80188308bc1e65b09ccb41186772cd6336)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 29 +++++++++----------
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 18 ++++++------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.14.7.bb => python3_3.14.9.bb}  |  2 +-
 8 files changed, 28 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb => python3_3.14.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7a60538364..7cacaf0ff3 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726b..580d38a403 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/__init__.py
 index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -538,12 +538,12 @@ def _init_config_vars():
+@@ -539,12 +539,12 @@ def _init_config_vars():
      _CONFIG_VARS['py_version'] = _PY_VERSION
      _CONFIG_VARS['py_version_short'] = _PY_VERSION_SHORT
      _CONFIG_VARS['py_version_nodot'] = _PY_VERSION_SHORT_NO_DOT
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e..4e41b04a3b 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -861,8 +861,7 @@ profile-run-stamp:
+@@ -863,8 +863,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
index bef6044358..8bb4a4c905 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
@@ -32,7 +32,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index dc795c6bd8a..61355927296 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -395,7 +395,7 @@ def test_constants(self):
+@@ -424,7 +424,7 @@ class BasicSocketTests(unittest.TestCase):
          ssl.OP_NO_COMPRESSION
          self.assertEqual(ssl.HAS_SNI, True)
          self.assertEqual(ssl.HAS_ECDH, True)
@@ -41,7 +41,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertEqual(ssl.HAS_TLSv1_3, True)
          ssl.OP_NO_SSLv2
          ssl.OP_NO_SSLv3
-@@ -586,11 +586,11 @@ def test_openssl_version(self):
+@@ -615,11 +615,11 @@ class BasicSocketTests(unittest.TestCase):
          # Some sanity checks follow
          # >= 1.1.1
          self.assertGreaterEqual(n, 0x10101000)
@@ -56,7 +56,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertGreaterEqual(minor, 0)
          self.assertLess(minor, 256)
          self.assertGreaterEqual(fix, 0)
-@@ -656,12 +656,14 @@ def test_openssl111_deprecations(self):
+@@ -685,12 +685,14 @@ class BasicSocketTests(unittest.TestCase):
              ssl.OP_NO_TLSv1_2,
              ssl.OP_NO_TLSv1_3
          ]
@@ -77,7 +77,7 @@ index dc795c6bd8a..61355927296 100644
          versions = [
              ssl.TLSVersion.SSLv3,
              ssl.TLSVersion.TLSv1,
-@@ -1205,6 +1207,7 @@ def test_min_max_version(self):
+@@ -1184,6 +1186,7 @@ class ContextTests(unittest.TestCase):
                  ssl.TLSVersion.TLSv1,
                  ssl.TLSVersion.TLSv1_1,
                  ssl.TLSVersion.TLSv1_2,
@@ -85,7 +85,7 @@ index dc795c6bd8a..61355927296 100644
                  ssl.TLSVersion.SSLv3,
              }
          )
-@@ -1218,7 +1221,7 @@ def test_min_max_version(self):
+@@ -1197,7 +1200,7 @@ class ContextTests(unittest.TestCase):
          with self.assertRaises(ValueError):
              ctx.minimum_version = 42
  
@@ -94,7 +94,7 @@ index dc795c6bd8a..61355927296 100644
              ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
  
              self.assertIn(
-@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
+@@ -1749,23 +1752,24 @@ class ContextTests(unittest.TestCase):
          self.assertFalse(ctx.check_hostname)
          self._assert_context_options(ctx)
  
@@ -130,7 +130,7 @@ index dc795c6bd8a..61355927296 100644
  
          ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
          self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
+@@ -3863,10 +3867,10 @@ class ThreadedTests(unittest.TestCase):
                             client_options=ssl.OP_NO_TLSv1_2)
  
          try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1.2')
@@ -147,7 +147,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index b45295b4c0c..6f75af86113 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
+@@ -135,6 +135,17 @@ static void _PySSLFixErrno(void) {
  #error Unsupported OpenSSL version
  #endif
  
@@ -165,7 +165,7 @@ index b45295b4c0c..6f75af86113 100644
  /* OpenSSL API 1.1.0+ does not include version methods */
  #ifndef OPENSSL_NO_SSL3_METHOD
  extern const SSL_METHOD *SSLv3_method(void);
-@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
+@@ -1134,7 +1145,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
  
  static PyObject *
  _create_tuple_for_attribute(_sslmodulestate *state,
@@ -174,7 +174,7 @@ index b45295b4c0c..6f75af86113 100644
  {
      Py_ssize_t buflen;
      PyObject *pyattr;
-@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
+@@ -1163,16 +1174,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
  }
  
  static PyObject *
@@ -195,7 +195,7 @@ index b45295b4c0c..6f75af86113 100644
      int index_counter;
      int rdn_level = -1;
      int retcode;
-@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
+@@ -6530,9 +6541,15 @@ sslmodule_init_constants(PyObject *m)
      ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
      ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
      ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
@@ -229,7 +229,7 @@ diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/multissltests.py
 index 3b4507c6771..48207e5330f 100755
 --- a/Tools/ssl/multissltests.py
 +++ b/Tools/ssl/multissltests.py
-@@ -429,9 +429,11 @@ def _post_install(self):
+@@ -422,9 +422,11 @@ class BuildOpenSSL(AbstractBuilder):
      def _post_install(self):
          if self.version.startswith("3."):
              self._post_install_3xx()
@@ -242,7 +242,7 @@ index 3b4507c6771..48207e5330f 100755
              config_args += ("enable-fips",)
          super()._build_src(config_args)
  
-@@ -447,6 +449,9 @@ def _post_install_3xx(self):
+@@ -440,6 +442,9 @@ class BuildOpenSSL(AbstractBuilder):
              lib64 = self.lib_dir + "64"
              os.symlink(lib64, self.lib_dir)
  
@@ -252,6 +252,3 @@ index 3b4507c6771..48207e5330f 100755
      @property
      def short_version(self):
          """Short version for OpenSSL download URL"""
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
index 587f141dd4..1005fcf3ec 100644
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
+++ b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index 965dbc36f096499..03d9e3f9e5e96b5 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -2711,6 +2711,36 @@ def close(self):
+@@ -2994,6 +2994,36 @@ class ThreadedEchoServer(threading.Thread):
      def stop(self):
          self.active = False
  
@@ -65,7 +65,7 @@ index 965dbc36f096499..03d9e3f9e5e96b5 100644
  class AsyncoreEchoServer(threading.Thread):
  
      # this one's based on asyncore.dispatcher
-@@ -4747,6 +4777,58 @@ def background(sock):
+@@ -5035,6 +5065,58 @@ class ThreadedTests(unittest.TestCase):
                      if cm.exc_value is not None:
                          raise cm.exc_value
  
@@ -141,7 +141,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index 1603d0ffd559559..376df32b7cb4bd6 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -352,6 +352,16 @@ typedef struct {
+@@ -351,6 +351,16 @@ typedef struct {
       * and shutdown methods check for chained exceptions.
       */
      PyObject *exc;
@@ -158,7 +158,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  } PySSLSocket;
  
  #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
+@@ -498,6 +508,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
      PyObject *init_value, *msg, *key;
      PyUnicodeWriter *writer = NULL;
  
@@ -169,7 +169,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      if (errcode != 0) {
          int lib, reason;
  
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
+@@ -653,6 +667,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
      return -1;
  }
  
@@ -188,7 +188,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  static PyObject *
  PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
  {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
+@@ -900,6 +926,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
      self->server_hostname = NULL;
      self->err = err;
      self->exc = NULL;
@@ -196,7 +196,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  
      /* Make sure the SSL error state is initialized */
      ERR_clear_error();
-@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
+@@ -1040,6 +1067,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
@@ -208,7 +208,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout = GET_SOCKET_TIMEOUT(sock);
      has_timeout = (timeout > 0);
      if (has_timeout) {
-@@ -2504,6 +2536,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_buffer *b)
+@@ -2505,6 +2537,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_buffer *b)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
@@ -220,7 +220,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout = GET_SOCKET_TIMEOUT(sock);
      has_timeout = (timeout > 0);
      if (has_timeout) {
-@@ -2644,6 +2681,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssize_t len,
+@@ -2645,6 +2682,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssize_t len,
          Py_INCREF(sock);
      }
  
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
index af067f549c..c42b336798 100644
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
+++ b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
@@ -24,7 +24,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index 03d9e3f9e5e96b5..6445f122b4272be 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -4820,14 +4820,6 @@ def test_got_eof(self):
+@@ -5108,14 +5108,6 @@ class ThreadedTests(unittest.TestCase):
                  sslsock.do_handshake()
  
              self.assertEqual(sslsock.pending(), 0)
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index 248a521118..b589dfb346 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=-j0
+@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipes-devtools/python/python3_3.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.9.bb
index f917edebd8..e6fa2bd111 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
+SRC_URI[sha256sum] = "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
