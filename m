Return-Path: <maxin.john@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4641671B8E
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 11:29:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 23 Oct 2016 04:29:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,388,1473145200"; d="scan'208";a="1048765147"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 23 Oct 2016 04:29:19 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 7E6856A4080
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Oct 2016 04:28:45 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 23 Oct 2016 14:29:49 +0300
Message-Id: <1477222197-3698-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
References: <1477222197-3698-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 02/10] neon: Upgrade 0.30.1 -> 0.30.2
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
X-List-Received-Date: Sun, 23 Oct 2016 11:29:18 -0000

Remove "gnutls_4.3_fixup.patch" since fix for PKCS#11 support under
GnuTLS 3.x is included in version 0.30.2

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 .../neon/neon/gnutls_4.3_fixup.patch               | 68 ----------------------
 .../neon/{neon_0.30.1.bb => neon_0.30.2.bb}        |  6 +-
 2 files changed, 3 insertions(+), 71 deletions(-)
 delete mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
 rename meta/recipes-support/neon/{neon_0.30.1.bb => neon_0.30.2.bb} (87%)

diff --git a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
deleted file mode 100644
index 459f5e3..0000000
--- a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-replace deprecated GnuTLS functions with newer ones if available 
-
-Upstream-Status: Pending
-
-Signed-off-by: Armin Kuster <akuster808@gmail.com>
-
-Index: neon-0.30.1/macros/neon.m4
-===================================================================
---- neon-0.30.1.orig/macros/neon.m4
-+++ neon-0.30.1/macros/neon.m4
-@@ -987,6 +987,10 @@ gnutls)
-                   gnutls_certificate_get_x509_cas \
-                   gnutls_x509_crt_sign2])
- 
-+   # gnutls 4.3 check
-+   AC_CHECK_LIB(gnutls, gnutls_global_init)
-+   AC_CHECK_FUNCS(gnutls_certificate_set_retrieve_function,,)
-+
-    # fail if gnutls_x509_crt_sign2 is not found (it was introduced in 1.2.0, which is required)
-    if test x${ac_cv_func_gnutls_x509_crt_sign2} != xyes; then
-        AC_MSG_ERROR([GnuTLS version predates gnutls_x509_crt_sign2, newer version required (at least 1.2.0)])
-Index: neon-0.30.1/src/ne_gnutls.c
-===================================================================
---- neon-0.30.1.orig/src/ne_gnutls.c
-+++ neon-0.30.1/src/ne_gnutls.c
-@@ -553,7 +553,13 @@ dup_error:
- static int provide_client_cert(gnutls_session_t session,
-                                const gnutls_datum_t *req_ca_rdn, int nreqs,
-                                const gnutls_pk_algorithm_t *sign_algos,
--                               int sign_algos_length, gnutls_retr_st *st)
-+                               int sign_algos_length,
-+#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
-+    gnutls_retr2_st* st
-+#else
-+    gnutls_retr_st *st
-+#endif
-+    )
- {
-     ne_session *sess = gnutls_session_get_ptr(session);
-     
-@@ -617,8 +623,11 @@ static int provide_client_cert(gnutls_se
- #endif
-             ) {
-             NE_DEBUG(NE_DBG_SSL, "Supplying client certificate.\n");
--
-+#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
-+            st->cert_type = type;
-+#else
-             st->type = type;
-+#endif
-             st->ncerts = 1;
-             st->cert.x509 = &sess->client_cert->cert.subject;
-             st->key.x509 = sess->client_cert->pkey;
-@@ -649,8 +658,14 @@ ne_ssl_context *ne_ssl_context_create(in
-     ne_ssl_context *ctx = ne_calloc(sizeof *ctx);
-     gnutls_certificate_allocate_credentials(&ctx->cred);
-     if (flags == NE_SSL_CTX_CLIENT) {
-+
-+#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
-+        gnutls_certificate_set_retrieve_function(ctx->cred,
-+                                                       provide_client_cert);
-+#else
-         gnutls_certificate_client_set_retrieve_function(ctx->cred,
-                                                         provide_client_cert);
-+#endif
-     }
-     gnutls_certificate_set_verify_flags(ctx->cred, 
-                                         GNUTLS_VERIFY_ALLOW_X509_V1_CA_CRT);
diff --git a/meta/recipes-support/neon/neon_0.30.1.bb b/meta/recipes-support/neon/neon_0.30.2.bb
similarity index 87%
rename from meta/recipes-support/neon/neon_0.30.1.bb
rename to meta/recipes-support/neon/neon_0.30.2.bb
index b6cfd50..5792c56 100644
--- a/meta/recipes-support/neon/neon_0.30.1.bb
+++ b/meta/recipes-support/neon/neon_0.30.2.bb
@@ -7,10 +7,10 @@ LIC_FILES_CHKSUM = "file://src/COPYING.LIB;md5=f30a9716ef3762e3467a2f62bf790f0a
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch \
-           file://gnutls_4.3_fixup.patch"
+          "
 
-SRC_URI[md5sum] = "231adebe5c2f78fded3e3df6e958878e"
-SRC_URI[sha256sum] = "00c626c0dc18d094ab374dbd9a354915bfe4776433289386ed489c2ec0845cdd"
+SRC_URI[md5sum] = "e28d77bf14032d7f5046b3930704ef41"
+SRC_URI[sha256sum] = "db0bd8cdec329b48f53a6f00199c92d5ba40b0f015b153718d1b15d3d967fbca"
 
 inherit autotools binconfig-disabled lib_package pkgconfig
 
-- 
2.4.0


