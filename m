Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17223.1793294284221985917
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 10:18:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=fiShPkOJ;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-256628-20261029171802a97afc59b900020793-lo9gcl@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20261029171802a97afc59b900020793
        for <openembedded-core@lists.openembedded.org>;
        Thu, 29 Oct 2026 18:18:02 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=Sux8UJSP3ZnfWywvC2xl7mmFfMVmsR32Ywcao8UAKkE=;
 b=fiShPkOJdW5VtYbLDpEz6wjTX1QL8ckDHTv9pBg0yPlPU/r2UGIGogYhhlC8bZYvW31gWP
 BbUVT+OSpCXvyCrkgV3gqsJuA44Tea12jHzm20C09gE9qP2WTc+L5EBkOsFsIj231BP73rg+
 kkpOeFoaYvbKMvH0Fk8oq0PmobfQ0hOd7TTruHhfwC1+Pi1GRTcteKqD+dnbV6cRl5Koqv9o
 IMNeFAdOhuNwkX7nlxPDe9/LmK0aboWVsjiFEDeTDoE0p4vqbbiHlL1q9gHTRIimQSA4hUlG
 /p53PV0UC0uALgPi0rfLSMBgkj/oHsYsb+IXLBERVtmvT0X1/Q2hgb1Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [blacksail][PATCH 2/8] python3: upgrade 3.14.9 -> 3.14.10
Date: Thu, 29 Oct 2026 18:17:00 +0100
Message-ID: <20261029171709.2842512-2-peter.marko@siemens.com>
In-Reply-To: <20261029171709.2842512-1-peter.marko@siemens.com>
References: <20261029171709.2842512-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 17:18:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248958
Content-Type: text/plain; charset="utf-8"

From: Peter Marko <peter.marko@siemens.com>

This is an expedited security release to address the compromised eMudhra
intermediate CA keys. These keys are now blocked by the ssl module as a
last resort against their use. Normal uses of pip, including to upgrade
pip itself, are now safe from attacks based on those compromised keys,
even if pip hasn't been updated yet.

Release information: [1]
Security content in this release
* CVE-2026-115557 gh-160040: Distrust compromised eMudhra intermediate CA keys
* CVE-2026-114583 gh-160097: Reject links replacing the destination in tarfile.tar_filter
* gh-160300: Reject cookies with a negative version in http.cookiejar

[1] https://www.python.org/downloads/release/python-31410/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(From OE-Core rev: 4041f4a2e031f76e5a90207e855c735fd14259b1)
Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  2 +-
 ...est_sysconfig-for-posix_user-purelib.patch |  2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 22 +++++++++----------
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 18 +++++++--------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.14.9.bb => python3_3.14.10.bb} |  2 +-
 8 files changed, 26 insertions(+), 26 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.9.bb => python3_3.14.10.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
index 7cacaf0ff3..79fee9803f 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
+@@ -2844,6 +2844,8 @@ python-config: $(srcdir)/Misc/python-config.in Misc/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >python-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index 4e41b04a3b..d3f46c372a 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -863,8 +863,7 @@ profile-run-stamp:
+@@ -864,8 +864,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
index 5509b7475a..0864f23926 100644
--- a/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
+++ b/meta/recipes-devtools/python/python3/0001-Update-test_sysconfig-for-posix_user-purelib.patch
@@ -25,7 +25,7 @@ diff --git a/Lib/test/test_sysconfig.py b/Lib/test/test_sysconfig.py
 index 1fe4b68..383142a 100644
 --- a/Lib/test/test_sysconfig.py
 +++ b/Lib/test/test_sysconfig.py
-@@ -434,7 +434,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
+@@ -435,7 +435,7 @@ class TestSysConfig(unittest.TestCase, VirtualEnvironmentMixin):
                  expected = os.path.normpath(global_path.replace(base, user, 1))
                  # bpo-44860: platlib of posix_user doesn't use sys.platlibdir,
                  # whereas posix_prefix does.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
index 8bb4a4c905..37f55de65c 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for-OpenSSL-4.0.0.patch
@@ -32,7 +32,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index dc795c6bd8a..61355927296 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -424,7 +424,7 @@ class BasicSocketTests(unittest.TestCase):
+@@ -439,7 +439,7 @@ class BasicSocketTests(unittest.TestCase):
          ssl.OP_NO_COMPRESSION
          self.assertEqual(ssl.HAS_SNI, True)
          self.assertEqual(ssl.HAS_ECDH, True)
@@ -41,7 +41,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertEqual(ssl.HAS_TLSv1_3, True)
          ssl.OP_NO_SSLv2
          ssl.OP_NO_SSLv3
-@@ -615,11 +615,11 @@ class BasicSocketTests(unittest.TestCase):
+@@ -630,11 +630,11 @@ class BasicSocketTests(unittest.TestCase):
          # Some sanity checks follow
          # >= 1.1.1
          self.assertGreaterEqual(n, 0x10101000)
@@ -56,7 +56,7 @@ index dc795c6bd8a..61355927296 100644
          self.assertGreaterEqual(minor, 0)
          self.assertLess(minor, 256)
          self.assertGreaterEqual(fix, 0)
-@@ -685,12 +685,14 @@ class BasicSocketTests(unittest.TestCase):
+@@ -700,12 +700,14 @@ class BasicSocketTests(unittest.TestCase):
              ssl.OP_NO_TLSv1_2,
              ssl.OP_NO_TLSv1_3
          ]
@@ -77,7 +77,7 @@ index dc795c6bd8a..61355927296 100644
          versions = [
              ssl.TLSVersion.SSLv3,
              ssl.TLSVersion.TLSv1,
-@@ -1184,6 +1186,7 @@ class ContextTests(unittest.TestCase):
+@@ -1199,6 +1201,7 @@ class ContextTests(unittest.TestCase):
                  ssl.TLSVersion.TLSv1,
                  ssl.TLSVersion.TLSv1_1,
                  ssl.TLSVersion.TLSv1_2,
@@ -85,7 +85,7 @@ index dc795c6bd8a..61355927296 100644
                  ssl.TLSVersion.SSLv3,
              }
          )
-@@ -1197,7 +1200,7 @@ class ContextTests(unittest.TestCase):
+@@ -1212,7 +1215,7 @@ class ContextTests(unittest.TestCase):
          with self.assertRaises(ValueError):
              ctx.minimum_version = 42
  
@@ -94,7 +94,7 @@ index dc795c6bd8a..61355927296 100644
              ctx = ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
  
              self.assertIn(
-@@ -1749,23 +1752,24 @@ class ContextTests(unittest.TestCase):
+@@ -1764,23 +1767,24 @@ class ContextTests(unittest.TestCase):
          self.assertFalse(ctx.check_hostname)
          self._assert_context_options(ctx)
  
@@ -130,7 +130,7 @@ index dc795c6bd8a..61355927296 100644
  
          ctx = ssl._create_stdlib_context(purpose=ssl.Purpose.CLIENT_AUTH)
          self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3863,10 +3867,10 @@ class ThreadedTests(unittest.TestCase):
+@@ -3908,10 +3912,10 @@ class ThreadedTests(unittest.TestCase):
                             client_options=ssl.OP_NO_TLSv1_2)
  
          try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLSv1.2')
@@ -147,7 +147,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index b45295b4c0c..6f75af86113 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -135,6 +135,17 @@ static void _PySSLFixErrno(void) {
+@@ -136,6 +136,17 @@ static void _PySSLFixErrno(void) {
  #error Unsupported OpenSSL version
  #endif
  
@@ -165,7 +165,7 @@ index b45295b4c0c..6f75af86113 100644
  /* OpenSSL API 1.1.0+ does not include version methods */
  #ifndef OPENSSL_NO_SSL3_METHOD
  extern const SSL_METHOD *SSLv3_method(void);
-@@ -1134,7 +1145,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
+@@ -1137,7 +1148,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJECT *name, int no_name)
  
  static PyObject *
  _create_tuple_for_attribute(_sslmodulestate *state,
@@ -174,7 +174,7 @@ index b45295b4c0c..6f75af86113 100644
  {
      Py_ssize_t buflen;
      PyObject *pyattr;
-@@ -1163,16 +1174,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
+@@ -1166,16 +1177,16 @@ _create_tuple_for_attribute(_sslmodulestate *state,
  }
  
  static PyObject *
@@ -195,7 +195,7 @@ index b45295b4c0c..6f75af86113 100644
      int index_counter;
      int rdn_level = -1;
      int retcode;
-@@ -6530,9 +6541,15 @@ sslmodule_init_constants(PyObject *m)
+@@ -6599,9 +6610,15 @@ sslmodule_init_constants(PyObject *m)
      ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
      ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
      ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
index 1005fcf3ec..1b9a7fc942 100644
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
+++ b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index 965dbc36f096499..03d9e3f9e5e96b5 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -2994,6 +2994,36 @@ class ThreadedEchoServer(threading.Thread):
+@@ -3039,6 +3039,36 @@ class ThreadedEchoServer(threading.Thread):
      def stop(self):
          self.active = False
  
@@ -65,7 +65,7 @@ index 965dbc36f096499..03d9e3f9e5e96b5 100644
  class AsyncoreEchoServer(threading.Thread):
  
      # this one's based on asyncore.dispatcher
-@@ -5035,6 +5065,58 @@ class ThreadedTests(unittest.TestCase):
+@@ -5079,6 +5109,58 @@ class ThreadedTests(unittest.TestCase):
                      if cm.exc_value is not None:
                          raise cm.exc_value
  
@@ -141,7 +141,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index 1603d0ffd559559..376df32b7cb4bd6 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -351,6 +351,16 @@ typedef struct {
+@@ -352,6 +352,16 @@ typedef struct {
       * and shutdown methods check for chained exceptions.
       */
      PyObject *exc;
@@ -158,7 +158,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  } PySSLSocket;
  
  #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -498,6 +508,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
+@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
      PyObject *init_value, *msg, *key;
      PyUnicodeWriter *writer = NULL;
  
@@ -169,7 +169,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      if (errcode != 0) {
          int lib, reason;
  
-@@ -653,6 +667,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
+@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
      return -1;
  }
  
@@ -188,7 +188,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  static PyObject *
  PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
  {
-@@ -900,6 +926,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
+@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObject *sock,
      self->server_hostname = NULL;
      self->err = err;
      self->exc = NULL;
@@ -196,7 +196,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  
      /* Make sure the SSL error state is initialized */
      ERR_clear_error();
-@@ -1040,6 +1067,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
+@@ -1043,6 +1070,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *self)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
@@ -208,7 +208,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout = GET_SOCKET_TIMEOUT(sock);
      has_timeout = (timeout > 0);
      if (has_timeout) {
-@@ -2505,6 +2537,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_buffer *b)
+@@ -2514,6 +2546,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_buffer *b)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
  
@@ -220,7 +220,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout = GET_SOCKET_TIMEOUT(sock);
      has_timeout = (timeout > 0);
      if (has_timeout) {
-@@ -2645,6 +2682,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssize_t len,
+@@ -2654,6 +2691,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_ssize_t len,
          Py_INCREF(sock);
      }
  
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
index c42b336798..59742290e8 100644
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
+++ b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.patch
@@ -24,7 +24,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.py
 index 03d9e3f9e5e96b5..6445f122b4272be 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -5108,14 +5108,6 @@ class ThreadedTests(unittest.TestCase):
+@@ -5152,14 +5152,6 @@ class ThreadedTests(unittest.TestCase):
                  sslsock.do_handshake()
  
              self.assertEqual(sslsock.pending(), 0)
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/recipes-devtools/python/python3/makerace.patch
index b589dfb346..7167d5b4e8 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=-j0
+@@ -2750,7 +2750,7 @@ COMPILEALL_OPTS=-j0
  TEST_MODULES=@TEST_MODULES@
  
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.9.bb b/meta/recipes-devtools/python/python3_3.14.10.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.9.bb
rename to meta/recipes-devtools/python/python3_3.14.10.bb
index e6fa2bd111..3dd0962ad9 100644
--- a/meta/recipes-devtools/python/python3_3.14.9.bb
+++ b/meta/recipes-devtools/python/python3_3.14.10.bb
@@ -30,7 +30,7 @@ SRC_URI:append:class-native = " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
            "
 
-SRC_URI[sha256sum] = "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694122cf97ffacd1e53"
+SRC_URI[sha256sum] = "de414a57119abef52784d8993e341d53aed635fc2b05c2607d9f98a2c5b72032"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
