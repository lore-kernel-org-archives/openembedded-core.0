Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id 109D5605B3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jun 2015 05:37:26 +0000 (UTC)
Received: by pacyx8 with SMTP id yx8so45301725pac.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Jun 2015 22:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=Vw/2/Vyy3cNK2FyokJ1rMaQHcs+rB0O4hJiokoARToA=;
	b=uMkZ6lsip9s354rhw61DLuVP2F3P2hBtupp5w2uK/NyDXBybZ1nQAu84+H7ENKgaQH
	c6OINvkR4+VdvVlBR+BN7ih9ugCkqDRl3PRl59tW3SA0E0O9yjUJdQCIBsKiBoc3wkAp
	Xqusf3nnCP2BkXYNIozb8wYxhWhVKuJSRTkIe1GWGq1kRh4cq2kJ+3+RmXaQv6U4IOEi
	MhzcJzfsLdZtQghl+MC3mumja3oUQ6NkLJ7qP4xM5HLNSP3Yh7fT7pA5k8Yn9yfSP6bV
	I+lIfjnGj6/wM3s2JwOHui3rCZ4Z/lAT+c2MYWa4MFCbTXPY6X/BC39EVbwlFCmTikhq
	BBZA==
X-Received: by 10.68.167.66 with SMTP id zm2mr37354881pbb.164.1434260247499;
	Sat, 13 Jun 2015 22:37:27 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id g2sm8253328pdh.11.2015.06.13.22.37.24
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 13 Jun 2015 22:37:25 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Jun 2015 22:37:14 -0700
Message-Id: <23d1ae7639536401db6389ff93a5cb0a6e6f290c.1434259784.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <cover.1434259784.git.akuster808@gmail.com>
References: <cover.1434259784.git.akuster808@gmail.com>
In-Reply-To: <cover.1434259784.git.akuster808@gmail.com>
References: <cover.1434259784.git.akuster808@gmail.com>
Subject: [PATCH 3/3] neon: fix compat issues with gnutls 4.3
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
X-List-Received-Date: Sun, 14 Jun 2015 05:37:26 -0000

V2: fix missing 4.3 work around

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../neon/neon/gnutls_4.3_fixup.patch               | 68 ++++++++++++++++++++++
 meta/recipes-support/neon/neon_0.30.1.bb           |  3 +-
 2 files changed, 70 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch

diff --git a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
new file mode 100644
index 0000000..a76560a
--- /dev/null
+++ b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
@@ -0,0 +1,68 @@
+replace deprecated GnuTLS functions with newer ones if available 
+
+Upstream Status: Pending
+
+Signed-off-by: Armin Kuster <akuster808@gmail.com>
+
+Index: neon-0.30.1/macros/neon.m4
+===================================================================
+--- neon-0.30.1.orig/macros/neon.m4
++++ neon-0.30.1/macros/neon.m4
+@@ -987,6 +987,10 @@ gnutls)
+                   gnutls_certificate_get_x509_cas \
+                   gnutls_x509_crt_sign2])
+ 
++   # gnutls 4.3 check
++   AC_CHECK_LIB(gnutls, gnutls_global_init)
++   AC_CHECK_FUNCS(gnutls_certificate_set_retrieve_function,,)
++
+    # fail if gnutls_x509_crt_sign2 is not found (it was introduced in 1.2.0, which is required)
+    if test x${ac_cv_func_gnutls_x509_crt_sign2} != xyes; then
+        AC_MSG_ERROR([GnuTLS version predates gnutls_x509_crt_sign2, newer version required (at least 1.2.0)])
+Index: neon-0.30.1/src/ne_gnutls.c
+===================================================================
+--- neon-0.30.1.orig/src/ne_gnutls.c
++++ neon-0.30.1/src/ne_gnutls.c
+@@ -553,7 +553,13 @@ dup_error:
+ static int provide_client_cert(gnutls_session_t session,
+                                const gnutls_datum_t *req_ca_rdn, int nreqs,
+                                const gnutls_pk_algorithm_t *sign_algos,
+-                               int sign_algos_length, gnutls_retr_st *st)
++                               int sign_algos_length,
++#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
++    gnutls_retr2_st* st
++#else
++    gnutls_retr_st *st
++#endif
++    )
+ {
+     ne_session *sess = gnutls_session_get_ptr(session);
+     
+@@ -617,8 +623,11 @@ static int provide_client_cert(gnutls_se
+ #endif
+             ) {
+             NE_DEBUG(NE_DBG_SSL, "Supplying client certificate.\n");
+-
++#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
++            st->cert_type = type;
++#else
+             st->type = type;
++#endif
+             st->ncerts = 1;
+             st->cert.x509 = &sess->client_cert->cert.subject;
+             st->key.x509 = sess->client_cert->pkey;
+@@ -649,8 +658,14 @@ ne_ssl_context *ne_ssl_context_create(in
+     ne_ssl_context *ctx = ne_calloc(sizeof *ctx);
+     gnutls_certificate_allocate_credentials(&ctx->cred);
+     if (flags == NE_SSL_CTX_CLIENT) {
++
++#if HAVE_GNUTLS_CERTIFICATE_SET_RETRIEVE_FUNCTION
++        gnutls_certificate_set_retrieve_function(ctx->cred,
++                                                       provide_client_cert);
++#else
+         gnutls_certificate_client_set_retrieve_function(ctx->cred,
+                                                         provide_client_cert);
++#endif
+     }
+     gnutls_certificate_set_verify_flags(ctx->cred, 
+                                         GNUTLS_VERIFY_ALLOW_X509_V1_CA_CRT);
diff --git a/meta/recipes-support/neon/neon_0.30.1.bb b/meta/recipes-support/neon/neon_0.30.1.bb
index fd170bc..0244314 100644
--- a/meta/recipes-support/neon/neon_0.30.1.bb
+++ b/meta/recipes-support/neon/neon_0.30.1.bb
@@ -10,7 +10,8 @@ DEPENDS_class-native = "zlib-native libxml2-native expat-native gnutls-native"
 BBCLASSEXTEND = "native"
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
-           file://pkgconfig.patch"
+           file://pkgconfig.patch \
+           file://gnutls_4.3_fixup.patch"
 SRC_URI[md5sum] = "231adebe5c2f78fded3e3df6e958878e"
 SRC_URI[sha256sum] = "00c626c0dc18d094ab374dbd9a354915bfe4776433289386ed489c2ec0845cdd"
 
-- 
2.3.5


