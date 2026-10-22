Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.19670.1792664543516077464
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 03:22:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@arm.com header.s=foss header.b=SULwtsbB;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 907F21595
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 03:22:19 -0700 (PDT)
Received: from cesw-amp-gbt-1s-m12830-04.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 658A03F7B4
	for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 03:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1792664542; bh=wfL/nEeti7dGbTA2dLt9KRUmCXyuo5JlnN980nCBwQU=;
	h=From:To:Subject:Date:From;
	b=SULwtsbB8QOwQh4c5nnZ3D3xDcIWwmDwpvCFs3hsmDnlAna75MjBdjF0PMylJxXdS
	 ksylwrGb13M5U5d60PRgCdP5nEtalmuVJd6cYD+YvvLHrV1yr9Sc36GD2M2z0IMBx9
	 GUOKSfXTKLUOSelVpSaNWm50LkDkwmbo+L1k7sqU=
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] python3: upgrade 3.14.7 -> 3.14.9
Date: Thu, 22 Oct 2026 11:22:17 +0100
Message-ID: <20261022102217.2857809-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-ARM-No-Footer: NoDisclaimer
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 10:22:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248437
Content-Type: text/plain; charset="utf-8"

The release notes are long[1] but the highlight is upgrading the bundled
pip wheel to 26.2.2, as pip bundles certifi which needed upgrading due
to the eMudhra intermediate CA compromise.

[1] https://docs.python.org/release/3.14.9/whatsnew/changelog.html
[2] https://emudhra.we-have-a-problem.com

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...shebang-overflow-on-python-config.py.patch |  2 +-
 ...-use-prefix-value-from-build-configu.patch |  2 +-
 ...-qemu-wrapper-when-gathering-profile.patch |  2 +-
 ...146207-Add-support-for-OpenSSL-4.0.0.patch | 29 +++++++++----------
 ...Update-_ssl._SSLSocket-for-OpenSSL-4.patch | 18 ++++++------
 ...utdown-test-in-test_ssl.test_got_eof.patch |  2 +-
 .../python/python3/makerace.patch             |  2 +-
 .../{python3_3.14.7.bb =3D> python3_3.14.9.bb}  |  2 +-
 8 files changed, 28 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D> python3_3.14=
.9.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-over=
flow-on-python-config.py.patch b/meta/recipes-devtools/python/python3/000=
1-Avoid-shebang-overflow-on-python-config.py.patch
index 7a605383647..7cacaf0ff37 100644
--- a/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on=
-python-config.py.patch
+++ b/meta/recipes-devtools/python/python3/0001-Avoid-shebang-overflow-on=
-python-config.py.patch
@@ -19,7 +19,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index e946018..345ed29 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2835,6 +2835,8 @@ python-config: $(srcdir)/Misc/python-config.in Mis=
c/python-config.sh
+@@ -2839,6 +2839,8 @@ python-config: $(srcdir)/Misc/python-config.in Mis=
c/python-config.sh
  	@ # Substitution happens here, as the completely-expanded BINDIR
  	@ # is not available in configure
  	sed -e "s,@EXENAME@,$(EXENAME)," < $(srcdir)/Misc/python-config.in >py=
thon-config.py
diff --git a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-u=
se-prefix-value-from-build-configu.patch b/meta/recipes-devtools/python/p=
ython3/0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch
index 60391e726bd..580d38a4031 100644
--- a/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-pref=
ix-value-from-build-configu.patch
+++ b/meta/recipes-devtools/python/python3/0001-Lib-sysconfig.py-use-pref=
ix-value-from-build-configu.patch
@@ -21,7 +21,7 @@ diff --git a/Lib/sysconfig/__init__.py b/Lib/sysconfig/=
__init__.py
 index 0a8bcc0..a2341f2 100644
 --- a/Lib/sysconfig/__init__.py
 +++ b/Lib/sysconfig/__init__.py
-@@ -538,12 +538,12 @@ def _init_config_vars():
+@@ -539,12 +539,12 @@ def _init_config_vars():
      _CONFIG_VARS['py_version'] =3D _PY_VERSION
      _CONFIG_VARS['py_version_short'] =3D _PY_VERSION_SHORT
      _CONFIG_VARS['py_version_nodot'] =3D _PY_VERSION_SHORT_NO_DOT
diff --git a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-q=
emu-wrapper-when-gathering-profile.patch b/meta/recipes-devtools/python/p=
ython3/0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch
index c7f14cad1e0..4e41b04a3bb 100644
--- a/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wra=
pper-when-gathering-profile.patch
+++ b/meta/recipes-devtools/python/python3/0001-Makefile.pre-use-qemu-wra=
pper-when-gathering-profile.patch
@@ -18,7 +18,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index 526d500..a7e536d 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -861,8 +861,7 @@ profile-run-stamp:
+@@ -863,8 +863,7 @@ profile-run-stamp:
  	# enabled.
  	$(MAKE) profile-gen-stamp
  	# Next, run the profile task to generate the profile information.
diff --git a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-supp=
ort-for-OpenSSL-4.0.0.patch b/meta/recipes-devtools/python/python3/0001-g=
h-146207-Add-support-for-OpenSSL-4.0.0.patch
index bef60443585..8bb4a4c9057 100644
--- a/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for=
-OpenSSL-4.0.0.patch
+++ b/meta/recipes-devtools/python/python3/0001-gh-146207-Add-support-for=
-OpenSSL-4.0.0.patch
@@ -32,7 +32,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.p=
y
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
          # >=3D 1.1.1
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
          versions =3D [
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
              ctx.minimum_version =3D 42
 =20
@@ -94,7 +94,7 @@ index dc795c6bd8a..61355927296 100644
              ctx =3D ssl.SSLContext(ssl.PROTOCOL_TLSv1_1)
 =20
              self.assertIn(
-@@ -1675,23 +1678,24 @@ def test__create_stdlib_context(self):
+@@ -1749,23 +1752,24 @@ class ContextTests(unittest.TestCase):
          self.assertFalse(ctx.check_hostname)
          self._assert_context_options(ctx)
 =20
@@ -130,7 +130,7 @@ index dc795c6bd8a..61355927296 100644
 =20
          ctx =3D ssl._create_stdlib_context(purpose=3Dssl.Purpose.CLIENT=
_AUTH)
          self.assertEqual(ctx.protocol, ssl.PROTOCOL_TLS_SERVER)
-@@ -3654,10 +3658,10 @@ def test_protocol_tlsv1_2(self):
+@@ -3863,10 +3867,10 @@ class ThreadedTests(unittest.TestCase):
                             client_options=3Dssl.OP_NO_TLSv1_2)
 =20
          try_protocol_combo(ssl.PROTOCOL_TLS, ssl.PROTOCOL_TLSv1_2, 'TLS=
v1.2')
@@ -147,7 +147,7 @@ diff --git a/Modules/_ssl.c b/Modules/_ssl.c
 index b45295b4c0c..6f75af86113 100644
 --- a/Modules/_ssl.c
 +++ b/Modules/_ssl.c
-@@ -164,6 +164,17 @@ static void _PySSLFixErrno(void) {
+@@ -135,6 +135,17 @@ static void _PySSLFixErrno(void) {
  #error Unsupported OpenSSL version
  #endif
 =20
@@ -165,7 +165,7 @@ index b45295b4c0c..6f75af86113 100644
  /* OpenSSL API 1.1.0+ does not include version methods */
  #ifndef OPENSSL_NO_SSL3_METHOD
  extern const SSL_METHOD *SSLv3_method(void);
-@@ -1151,7 +1162,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJ=
ECT *name, int no_name)
+@@ -1134,7 +1145,7 @@ _asn1obj2py(_sslmodulestate *state, const ASN1_OBJ=
ECT *name, int no_name)
 =20
  static PyObject *
  _create_tuple_for_attribute(_sslmodulestate *state,
@@ -174,7 +174,7 @@ index b45295b4c0c..6f75af86113 100644
  {
      Py_ssize_t buflen;
      PyObject *pyattr;
-@@ -1180,16 +1191,16 @@ _create_tuple_for_attribute(_sslmodulestate *sta=
te,
+@@ -1163,16 +1174,16 @@ _create_tuple_for_attribute(_sslmodulestate *sta=
te,
  }
 =20
  static PyObject *
@@ -195,7 +195,7 @@ index b45295b4c0c..6f75af86113 100644
      int index_counter;
      int rdn_level =3D -1;
      int retcode;
-@@ -6967,9 +6978,15 @@ sslmodule_init_constants(PyObject *m)
+@@ -6530,9 +6541,15 @@ sslmodule_init_constants(PyObject *m)
      ADD_INT_CONST("PROTOCOL_TLS", PY_SSL_VERSION_TLS);
      ADD_INT_CONST("PROTOCOL_TLS_CLIENT", PY_SSL_VERSION_TLS_CLIENT);
      ADD_INT_CONST("PROTOCOL_TLS_SERVER", PY_SSL_VERSION_TLS_SERVER);
@@ -229,7 +229,7 @@ diff --git a/Tools/ssl/multissltests.py b/Tools/ssl/m=
ultissltests.py
 index 3b4507c6771..48207e5330f 100755
 --- a/Tools/ssl/multissltests.py
 +++ b/Tools/ssl/multissltests.py
-@@ -429,9 +429,11 @@ def _post_install(self):
+@@ -422,9 +422,11 @@ class BuildOpenSSL(AbstractBuilder):
      def _post_install(self):
          if self.version.startswith("3."):
              self._post_install_3xx()
@@ -242,7 +242,7 @@ index 3b4507c6771..48207e5330f 100755
              config_args +=3D ("enable-fips",)
          super()._build_src(config_args)
 =20
-@@ -447,6 +449,9 @@ def _post_install_3xx(self):
+@@ -440,6 +442,9 @@ class BuildOpenSSL(AbstractBuilder):
              lib64 =3D self.lib_dir + "64"
              os.symlink(lib64, self.lib_dir)
 =20
@@ -252,6 +252,3 @@ index 3b4507c6771..48207e5330f 100755
      @property
      def short_version(self):
          """Short version for OpenSSL download URL"""
---=20
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_=
ssl._SSLSocket-for-OpenSSL-4.patch b/meta/recipes-devtools/python/python3=
/0002-gh-148292-Update-_ssl._SSLSocket-for-OpenSSL-4.patch
index 587f141dd4c..1005fcf3ec4 100644
--- a/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SS=
LSocket-for-OpenSSL-4.patch
+++ b/meta/recipes-devtools/python/python3/0002-gh-148292-Update-_ssl._SS=
LSocket-for-OpenSSL-4.patch
@@ -28,7 +28,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.p=
y
 index 965dbc36f096499..03d9e3f9e5e96b5 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -2711,6 +2711,36 @@ def close(self):
+@@ -2994,6 +2994,36 @@ class ThreadedEchoServer(threading.Thread):
      def stop(self):
          self.active =3D False
 =20
@@ -65,7 +65,7 @@ index 965dbc36f096499..03d9e3f9e5e96b5 100644
  class AsyncoreEchoServer(threading.Thread):
 =20
      # this one's based on asyncore.dispatcher
-@@ -4747,6 +4777,58 @@ def background(sock):
+@@ -5035,6 +5065,58 @@ class ThreadedTests(unittest.TestCase):
                      if cm.exc_value is not None:
                          raise cm.exc_value
 =20
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
 =20
  #define PySSLSocket_CAST(op)    ((PySSLSocket *)(op))
-@@ -499,6 +509,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
+@@ -498,6 +508,10 @@ fill_and_set_sslerror(_sslmodulestate *state,
      PyObject *init_value, *msg, *key;
      PyUnicodeWriter *writer =3D NULL;
 =20
@@ -169,7 +169,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      if (errcode !=3D 0) {
          int lib, reason;
 =20
-@@ -654,6 +668,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
+@@ -653,6 +667,18 @@ PySSL_ChainExceptions(PySSLSocket *sslsock) {
      return -1;
  }
 =20
@@ -188,7 +188,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
  static PyObject *
  PySSL_SetError(PySSLSocket *sslsock, const char *filename, int lineno)
  {
-@@ -901,6 +927,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObj=
ect *sock,
+@@ -900,6 +926,7 @@ newPySSLSocket(PySSLContext *sslctx, PySocketSockObj=
ect *sock,
      self->server_hostname =3D NULL;
      self->err =3D err;
      self->exc =3D NULL;
@@ -196,7 +196,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
 =20
      /* Make sure the SSL error state is initialized */
      ERR_clear_error();
-@@ -1041,6 +1068,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *se=
lf)
+@@ -1040,6 +1067,11 @@ _ssl__SSLSocket_do_handshake_impl(PySSLSocket *se=
lf)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
 =20
@@ -208,7 +208,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout =3D GET_SOCKET_TIMEOUT(sock);
      has_timeout =3D (timeout > 0);
      if (has_timeout) {
-@@ -2504,6 +2536,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_=
buffer *b)
+@@ -2505,6 +2537,11 @@ _ssl__SSLSocket_write_impl(PySSLSocket *self, Py_=
buffer *b)
          BIO_set_nbio(SSL_get_wbio(self->ssl), nonblocking);
      }
 =20
@@ -220,7 +220,7 @@ index 1603d0ffd559559..376df32b7cb4bd6 100644
      timeout =3D GET_SOCKET_TIMEOUT(sock);
      has_timeout =3D (timeout > 0);
      if (has_timeout) {
-@@ -2644,6 +2681,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_s=
size_t len,
+@@ -2645,6 +2682,11 @@ _ssl__SSLSocket_read_impl(PySSLSocket *self, Py_s=
size_t len,
          Py_INCREF(sock);
      }
 =20
diff --git a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-s=
hutdown-test-in-test_ssl.test_got_eof.patch b/meta/recipes-devtools/pytho=
n/python3/0003-gh-148292-Remove-shutdown-test-in-test_ssl.test_got_eof.pa=
tch
index af067f549c4..c42b336798c 100644
--- a/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown=
-test-in-test_ssl.test_got_eof.patch
+++ b/meta/recipes-devtools/python/python3/0003-gh-148292-Remove-shutdown=
-test-in-test_ssl.test_got_eof.patch
@@ -24,7 +24,7 @@ diff --git a/Lib/test/test_ssl.py b/Lib/test/test_ssl.p=
y
 index 03d9e3f9e5e96b5..6445f122b4272be 100644
 --- a/Lib/test/test_ssl.py
 +++ b/Lib/test/test_ssl.py
-@@ -4820,14 +4820,6 @@ def test_got_eof(self):
+@@ -5108,14 +5108,6 @@ class ThreadedTests(unittest.TestCase):
                  sslsock.do_handshake()
 =20
              self.assertEqual(sslsock.pending(), 0)
diff --git a/meta/recipes-devtools/python/python3/makerace.patch b/meta/r=
ecipes-devtools/python/python3/makerace.patch
index 248a521118c..b589dfb3460 100644
--- a/meta/recipes-devtools/python/python3/makerace.patch
+++ b/meta/recipes-devtools/python/python3/makerace.patch
@@ -20,7 +20,7 @@ diff --git a/Makefile.pre.in b/Makefile.pre.in
 index a7e536d..e946018 100644
 --- a/Makefile.pre.in
 +++ b/Makefile.pre.in
-@@ -2741,7 +2741,7 @@ COMPILEALL_OPTS=3D-j0
+@@ -2745,7 +2745,7 @@ COMPILEALL_OPTS=3D-j0
  TEST_MODULES=3D@TEST_MODULES@
 =20
  .PHONY: libinstall
diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb b/meta/recipe=
s-devtools/python/python3_3.14.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.14.7.bb
rename to meta/recipes-devtools/python/python3_3.14.9.bb
index f917edebd86..e6fa2bd111e 100644
--- a/meta/recipes-devtools/python/python3_3.14.7.bb
+++ b/meta/recipes-devtools/python/python3_3.14.9.bb
@@ -30,7 +30,7 @@ SRC_URI:append:class-native =3D " \
            file://0001-Lib-sysconfig.py-use-prefix-value-from-build-conf=
igu.patch \
            "
=20
-SRC_URI[sha256sum] =3D "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e=
252c11a66be27f81"
+SRC_URI[sha256sum] =3D "e02d9ac21cebda6e46435369744a92c65cc7cd8669697694=
122cf97ffacd1e53"
=20
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
--=20
2.43.0

