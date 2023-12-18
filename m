Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F39E5C46CD7
	for <webhook@archiver.kernel.org>; Mon, 18 Dec 2023 14:47:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by mx.groups.io with SMTP id smtpd.web11.45511.1702910852353229137
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Dec 2023 06:47:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=ddUTwxmg;
 spf=pass (domain: intel.com, ip: 198.175.65.11, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702910858; x=1734446858;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=tWIGExGo2zb3SgG1tzzHqStCHWJk/CBOfALfa2cFi1A=;
  b=ddUTwxmgl1R7QMhcUOIxT95b755kDroo1WYpTnsB8UEr5VO0iRPDPxXH
   skWMwD2F4i9ffnt6k4pmAinBvESJPNF07mZjOIP7+mNQmHNxGhwBvC5QZ
   GWDQdemJMey85OzdZRn0i/xJVeJr7TX6T+0Z7EhVstIAcVZN8U/F+TLdj
   btRxUVYSR0gCZSxFLFE9tsQtjINfI5o0OKJaSgqr570iofE07htgFhAyv
   ufY/jlrerOv8LZkEIC/j1n9S7d5jMbibBfCOTaNXafV6ESBSyeIhX1Mxi
   g5K18fDzbc1a+Evn9AsMMuJOBCSBDhjqqA085/77paENafjaW314CZA74
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="2350882"
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="2350882"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,285,1695711600"; 
   d="scan'208";a="23802903"
Received: from jsuah-mobl.gar.corp.intel.com (HELO anmitta2-mobl3.intel.com) ([10.215.240.31])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2023 06:47:38 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 5/9] glib-networking: upgrade 2.76.1 -> 2.78.0
Date: Mon, 18 Dec 2023 22:47:20 +0800
Message-ID: <20231218144724.7794-5-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231218144724.7794-1-anuj.mittal@intel.com>
References: <20231218144724.7794-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Dec 2023 14:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/192650

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...sable-PKCS-11-tests-if-not-available.patch | 113 ------------------
 .../glib-networking/eagain.patch              |  20 +++-
 ...ng_2.76.1.bb => glib-networking_2.78.0.bb} |   3 +-
 3 files changed, 15 insertions(+), 121 deletions(-)
 delete mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch
 rename meta/recipes-core/glib-networking/{glib-networking_2.76.1.bb => glib-networking_2.78.0.bb} (92%)

diff --git a/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch b/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch
deleted file mode 100644
index 7b003588c88..00000000000
--- a/meta/recipes-core/glib-networking/glib-networking/0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch
+++ /dev/null
@@ -1,113 +0,0 @@
-From 04728a5b73e870b4695c5e7ba42fa41c00471944 Mon Sep 17 00:00:00 2001
-From: Ross Burton <ross.burton@arm.com>
-Date: Fri, 12 May 2023 20:19:35 +0100
-Subject: [PATCH] tls/tests: disable PKCS#11 tests if not available
-
-GnuTLS can be built without PKCS#11, which means the symbols
-gnutls_pkcs11_init and gnutls_pkcs11_add_provider are not part of the
-library.
-
-If these symbols don't exist in GnuTLS then we can't add a mock pkcs#11
-provider for testing, and several tests which need the mock provider
-will fail.
-
-Solve this by checking for the symbols at build time and disabling the
-provider and tests which need it.
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- meson.build             |  4 ++++
- tls/tests/certificate.c | 11 +++++++----
- tls/tests/connection.c  |  4 +++-
- 3 files changed, 14 insertions(+), 5 deletions(-)
-
-diff --git a/meson.build b/meson.build
-index 0fa9027..d2a023a 100644
---- a/meson.build
-+++ b/meson.build
-@@ -84,6 +84,10 @@ gnutls_dep = dependency('gnutls', version: '>= 3.7.4', required: get_option('gnu
- 
- if gnutls_dep.found()
-   backends += ['gnutls']
-+  # test-specific, maybe move to tls/tests
-+  if cc.has_function('gnutls_pkcs11_init', prefix: '#include <gnutls/pkcs11.h>', dependencies: gnutls_dep)
-+    config_h.set10('HAVE_GNUTLS_PKCS11', true)
-+  endif
- endif
- 
- # *** Checks for OpenSSL    ***
-diff --git a/tls/tests/certificate.c b/tls/tests/certificate.c
-index e820ba1..dd2412b 100644
---- a/tls/tests/certificate.c
-+++ b/tls/tests/certificate.c
-@@ -24,6 +24,7 @@
-  * Author: Stef Walter <stefw@collabora.co.uk>
-  */
- 
-+#include "config.h"
- #include "certificate.h"
- 
- #include <gio/gio.h>
-@@ -911,7 +912,7 @@ int
- main (int   argc,
-       char *argv[])
- {
--#ifdef BACKEND_IS_GNUTLS
-+#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
-   char *module_path;
- #endif
- 
-@@ -921,7 +922,7 @@ main (int   argc,
-   g_setenv ("GIO_USE_TLS", BACKEND, TRUE);
-   g_assert_cmpint (g_ascii_strcasecmp (G_OBJECT_TYPE_NAME (g_tls_backend_get_default ()), "GTlsBackend" BACKEND), ==, 0);
- 
--#ifdef BACKEND_IS_GNUTLS
-+#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
-   module_path = g_test_build_filename (G_TEST_BUILT, "mock-pkcs11.so", NULL);
-   g_assert_true (g_file_test (module_path, G_FILE_TEST_EXISTS));
- 
-@@ -942,12 +943,14 @@ main (int   argc,
-               setup_certificate, test_create_certificate_with_issuer, teardown_certificate);
-   g_test_add ("/tls/" BACKEND "/certificate/create-with-garbage-input", TestCertificate, NULL,
-               setup_certificate, test_create_certificate_with_garbage_input, teardown_certificate);
--  g_test_add ("/tls/" BACKEND "/certificate/pkcs11", TestCertificate, NULL,
--              setup_certificate, test_create_certificate_pkcs11, teardown_certificate);
-   g_test_add ("/tls/" BACKEND "/certificate/private-key", TestCertificate, NULL,
-               setup_certificate, test_private_key, teardown_certificate);
-+#if HAVE_GNUTLS_PKCS11
-+  g_test_add ("/tls/" BACKEND "/certificate/pkcs11", TestCertificate, NULL,
-+              setup_certificate, test_create_certificate_pkcs11, teardown_certificate);
-   g_test_add ("/tls/" BACKEND "/certificate/private-key-pkcs11", TestCertificate, NULL,
-               setup_certificate, test_private_key_pkcs11, teardown_certificate);
-+#endif
- 
-   g_test_add_func ("/tls/" BACKEND "/certificate/create-chain", test_create_certificate_chain);
-   g_test_add_func ("/tls/" BACKEND "/certificate/create-no-chain", test_create_certificate_no_chain);
-diff --git a/tls/tests/connection.c b/tls/tests/connection.c
-index 17efe1b..62a7fbb 100644
---- a/tls/tests/connection.c
-+++ b/tls/tests/connection.c
-@@ -3376,7 +3376,7 @@ main (int   argc,
- 
-   g_assert_true (g_ascii_strcasecmp (G_OBJECT_TYPE_NAME (g_tls_backend_get_default ()), "GTlsBackend" BACKEND) == 0);
- 
--#ifdef BACKEND_IS_GNUTLS
-+#if defined(BACKEND_IS_GNUTLS) && HAVE_GNUTLS_PKCS11
-   module_path = g_test_build_filename (G_TEST_BUILT, "mock-pkcs11.so", NULL);
-   g_assert_true (g_file_test (module_path, G_FILE_TEST_EXISTS));
- 
-@@ -3438,8 +3438,10 @@ main (int   argc,
-               setup_connection, test_client_auth_request_fail, teardown_connection);
-   g_test_add ("/tls/" BACKEND "/connection/client-auth-request-none", TestConnection, NULL,
-               setup_connection, test_client_auth_request_none, teardown_connection);
-+#if HAVE_GNUTLS_PKCS11
-   g_test_add ("/tls/" BACKEND "/connection/client-auth-pkcs11", TestConnection, NULL,
-               setup_connection, test_client_auth_pkcs11_connection, teardown_connection);
-+#endif
-   g_test_add ("/tls/" BACKEND "/connection/no-database", TestConnection, NULL,
-               setup_connection, test_connection_no_database, teardown_connection);
-   g_test_add ("/tls/" BACKEND "/connection/failed", TestConnection, NULL,
--- 
-2.34.1
-
diff --git a/meta/recipes-core/glib-networking/glib-networking/eagain.patch b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
index ee5b6a7beb9..062fc0191bb 100644
--- a/meta/recipes-core/glib-networking/glib-networking/eagain.patch
+++ b/meta/recipes-core/glib-networking/glib-networking/eagain.patch
@@ -1,4 +1,8 @@
-In autobuilder testing we regularly see glib-networking ptest fail with:
+From 025bb39dfdb81dd2852deaefea228b197ef3cd8d Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 6 May 2023 12:18:50 +0100
+Subject: [PATCH] In autobuilder testing we regularly see glib-networking ptest
+ fail with:
 
 GLib-Net:ERROR:/usr/src/debug/glib-networking/2.74.0-r0/tls/tests/connection.c:1944:simul_read_thread: assertion failed (error == NULL): Resource temporarily unavailable (g-io-error-quark, 27)
 Bail out! GLib-Net:ERROR:/usr/src/debug/glib-networking/2.74.0-r0/tls/tests/connection.c:1944:simul_read_thread: assertion failed (error == NULL): Resource temporarily unavailable (g-io-error-quark, 27)
@@ -12,11 +16,15 @@ Upstream-Status: Pending [testing to see if patch resolves the issue]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 
-Index: glib-networking-2.74.0/tls/tests/connection.c
-===================================================================
---- glib-networking-2.74.0.orig/tls/tests/connection.c
-+++ glib-networking-2.74.0/tls/tests/connection.c
-@@ -1941,6 +1941,10 @@ simul_read_thread (gpointer user_data)
+---
+ tls/tests/connection.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/tls/tests/connection.c b/tls/tests/connection.c
+index 62a7fbb..3447c80 100644
+--- a/tls/tests/connection.c
++++ b/tls/tests/connection.c
+@@ -2210,6 +2210,10 @@ simul_read_thread (gpointer user_data)
                                     test->buf + test->nread,
                                     MIN (TEST_DATA_LENGTH / 2, TEST_DATA_LENGTH - test->nread),
                                     NULL, &error);
diff --git a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
similarity index 92%
rename from meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
rename to meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
index 0f8822e1603..68f9a2ed783 100644
--- a/meta/recipes-core/glib-networking/glib-networking_2.76.1.bb
+++ b/meta/recipes-core/glib-networking/glib-networking_2.78.0.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
 SECTION = "libs"
 DEPENDS = "glib-2.0-native glib-2.0"
 
-SRC_URI[archive.sha256sum] = "5c698a9994dde51efdfb1026a56698a221d6250e89dc50ebcddda7b81480a42b"
+SRC_URI[archive.sha256sum] = "52fe4ce93f7dc51334b102894599858d23c8a65ac4a1110b30920565d68d3aba"
 
 # Upstream note that for the openssl backend, half the tests where this backend don't return
 # the expected error code or don't work as expected so default to gnutls
@@ -31,7 +31,6 @@ inherit gnomebase gettext upstream-version-is-even gio-module-cache ptest-gnome
 
 SRC_URI += "file://run-ptest"
 SRC_URI += "file://eagain.patch"
-SRC_URI += "file://0001-tls-tests-disable-PKCS-11-tests-if-not-available.patch"
 
 FILES:${PN} += "\
                 ${libdir}/gio/modules/libgio*.so \
-- 
2.43.0


