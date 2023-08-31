Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 511C5C83F32
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 10:02:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.13398.1693476166032881384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 31 Aug 2023 03:02:46 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0821C15;
	Thu, 31 Aug 2023 03:03:24 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id DBF263F64C;
	Thu, 31 Aug 2023 03:02:44 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH 1/2] glib-networking: enable build with GnuTLS if PKCS#11 was disabled
Date: Thu, 31 Aug 2023 11:02:42 +0100
Message-Id: <20230831100243.3946833-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 31 Aug 2023 10:02:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186967

From: Ross Burton <ross.burton@arm.com>

If GnuTLS is built without PKCS#11 support then glib-networking will
fail to build the tests. Backport a patch to fix this issue.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...sable-PKCS-11-tests-if-not-available.patch | 113 ++++++++++++++++++
 .../glib-networking/glib-networking_2.76.1.bb |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/000=
1-tls-tests-disable-PKCS-11-tests-if-not-available.patch

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-tls-t=
ests-disable-PKCS-11-tests-if-not-available.patch b/meta/recipes-core/gli=
b-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-=
available.patch
new file mode 100644
index 00000000000..7b003588c88
--- /dev/null
+++ b/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-di=
sable-PKCS-11-tests-if-not-available.patch
@@ -0,0 +1,113 @@
+From 04728a5b73e870b4695c5e7ba42fa41c00471944 Mon Sep 17 00:00:00 2001
+From: Ross Burton <ross.burton@arm.com>
+Date: Fri, 12 May 2023 20:19:35 +0100
+Subject: [PATCH] tls/tests: disable PKCS#11 tests if not available
+
+GnuTLS can be built without PKCS#11, which means the symbols
+gnutls_pkcs11_init and gnutls_pkcs11_add_provider are not part of the
+library.
+
+If these symbols don't exist in GnuTLS then we can't add a mock pkcs#11
+provider for testing, and several tests which need the mock provider
+will fail.
+
+Solve this by checking for the symbols at build time and disabling the
+provider and tests which need it.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ meson.build             |  4 ++++
+ tls/tests/certificate.c | 11 +++++++----
+ tls/tests/connection.c  |  4 +++-
+ 3 files changed, 14 insertions(+), 5 deletions(-)
+
+diff --git a/meson.build b/meson.build
+index 0fa9027..d2a023a 100644
+--- a/meson.build
++++ b/meson.build
+@@ -84,6 +84,10 @@ gnutls_dep =3D dependency('gnutls', version: '>=3D 3.=
7.4', required: get_option('gnu
+=20
+ if gnutls_dep.found()
+   backends +=3D ['gnutls']
++  # test-specific, maybe move to tls/tests
++  if cc.has_function('gnutls_pkcs11_init', prefix: '#include <gnutls/pk=
cs11.h>', dependencies: gnutls_dep)
++    config_h.set10('HAVE_GNUTLS_PKCS11', true)
++  endif
+ endif
+=20
+ # *** Checks for OpenSSL    ***
+diff --git a/tls/tests/certificate.c b/tls/tests/certificate.c
+index e820ba1..dd2412b 100644
+--- a/tls/tests/certificate.c
++++ b/tls/tests/certificate.c
+@@ -24,6 +24,7 @@
+  * Author: Stef Walter <stefw@collabora.co.uk>
+  */
+=20
++#include "config.h"
+ #include "certificate.h"
+=20
+ #include <gio/gio.h>
+@@ -911,7 +912,7 @@ int
+ main (int   argc,
+       char *argv[])
+ {
+-#ifdef BACKEND_IS_GNUTLS
++#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
+   char *module_path;
+ #endif
+=20
+@@ -921,7 +922,7 @@ main (int   argc,
+   g_setenv ("GIO_USE_TLS", BACKEND, TRUE);
+   g_assert_cmpint (g_ascii_strcasecmp (G_OBJECT_TYPE_NAME (g_tls_backen=
d_get_default ()), "GTlsBackend" BACKEND), =3D=3D, 0);
+=20
+-#ifdef BACKEND_IS_GNUTLS
++#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
+   module_path =3D g_test_build_filename (G_TEST_BUILT, "mock-pkcs11.so"=
, NULL);
+   g_assert_true (g_file_test (module_path, G_FILE_TEST_EXISTS));
+=20
+@@ -942,12 +943,14 @@ main (int   argc,
+               setup_certificate, test_create_certificate_with_issuer, t=
eardown_certificate);
+   g_test_add ("/tls/" BACKEND "/certificate/create-with-garbage-input",=
 TestCertificate, NULL,
+               setup_certificate, test_create_certificate_with_garbage_i=
nput, teardown_certificate);
+-  g_test_add ("/tls/" BACKEND "/certificate/pkcs11", TestCertificate, N=
ULL,
+-              setup_certificate, test_create_certificate_pkcs11, teardo=
wn_certificate);
+   g_test_add ("/tls/" BACKEND "/certificate/private-key", TestCertifica=
te, NULL,
+               setup_certificate, test_private_key, teardown_certificate=
);
++#if HAVE_GNUTLS_PKCS11
++  g_test_add ("/tls/" BACKEND "/certificate/pkcs11", TestCertificate, N=
ULL,
++              setup_certificate, test_create_certificate_pkcs11, teardo=
wn_certificate);
+   g_test_add ("/tls/" BACKEND "/certificate/private-key-pkcs11", TestCe=
rtificate, NULL,
+               setup_certificate, test_private_key_pkcs11, teardown_cert=
ificate);
++#endif
+=20
+   g_test_add_func ("/tls/" BACKEND "/certificate/create-chain", test_cr=
eate_certificate_chain);
+   g_test_add_func ("/tls/" BACKEND "/certificate/create-no-chain", test=
_create_certificate_no_chain);
+diff --git a/tls/tests/connection.c b/tls/tests/connection.c
+index 17efe1b..62a7fbb 100644
+--- a/tls/tests/connection.c
++++ b/tls/tests/connection.c
+@@ -3376,7 +3376,7 @@ main (int   argc,
+=20
+   g_assert_true (g_ascii_strcasecmp (G_OBJECT_TYPE_NAME (g_tls_backend_=
get_default ()), "GTlsBackend" BACKEND) =3D=3D 0);
+=20
+-#ifdef BACKEND_IS_GNUTLS
++#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
+   module_path =3D g_test_build_filename (G_TEST_BUILT, "mock-pkcs11.so"=
, NULL);
+   g_assert_true (g_file_test (module_path, G_FILE_TEST_EXISTS));
+=20
+@@ -3438,8 +3438,10 @@ main (int   argc,
+               setup_connection, test_client_auth_request_fail, teardown=
_connection);
+   g_test_add ("/tls/" BACKEND "/connection/client-auth-request-none", T=
estConnection, NULL,
+               setup_connection, test_client_auth_request_none, teardown=
_connection);
++#if HAVE_GNUTLS_PKCS11
+   g_test_add ("/tls/" BACKEND "/connection/client-auth-pkcs11", TestCon=
nection, NULL,
+               setup_connection, test_client_auth_pkcs11_connection, tea=
rdown_connection);
++#endif
+   g_test_add ("/tls/" BACKEND "/connection/no-database", TestConnection=
, NULL,
+               setup_connection, test_connection_no_database, teardown_c=
onnection);
+   g_test_add ("/tls/" BACKEND "/connection/failed", TestConnection, NUL=
L,
+--=20
+2.34.1
+
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb =
b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
index 8e7290cdbb1..66b6a78a531 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
@@ -30,6 +30,7 @@ inherit gnomebase gettext upstream-version-is-even gio-=
module-cache ptest-gnome
=20
 SRC_URI +=3D "file://run-ptest"
 SRC_URI +=3D "file://eagain.patch"
+SRC_URI +=3D "file://0001-tls-tests-disable-PKCS-11-tests-if-not-availab=
le.patch"
=20
 FILES:${PN} +=3D "\
                 ${libdir}/gio/modules/libgio*.so \
--=20
2.34.1


