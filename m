Return-Path: <akuster808@gmail.com>
Received: from mail-qk0-f171.google.com (mail-qk0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id 960B9757EB
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jun 2015 19:37:14 +0000 (UTC)
Received: by qkx62 with SMTP id 62so29423433qkx.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Jun 2015 12:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=2fduK5/jINLXCpm0etWs9tZuilEoQ4WUKShmsLPIBmk=;
	b=g11M0BKV3X1BBWumMJPUpmUzm6t95EaO5ooXT4GxzQcz7+16vqbHRSdtch4pbLibGq
	Xg1UwxQYIMe/CJLIFIcXPDbKdLgOBPHzuZUdhS3fDs2x/q2wsLD51SqXQi9zR4NHk6qi
	lkWWKP9H8CsRpbsqSr/xcsu003sOipvEAHecZJ87L/4e37Jq6IGWMwhSTMv+zPqpkIET
	7NfCkBsQdFUb6DgVJC8+faGCzhdF+d8bb5gV3yeeZdB4ACA4PiGRONwHkGhAAJA4Ggu/
	fUcsIJudWtfrtQuxRDF4i3gcfv9VsWJ4pFO466yAMNXjqbmtJzO0wPfRLAsFGB4fiJhw
	ur9A==
X-Received: by 10.55.17.79 with SMTP id b76mr74181156qkh.70.1433446635732;
	Thu, 04 Jun 2015 12:37:15 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id r88sm2891057qkh.12.2015.06.04.12.37.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Jun 2015 12:37:14 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id DE326FC91F2; Thu,  4 Jun 2015 12:37:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jun 2015 12:37:08 -0700
Message-Id: <f1d8a6d07dbe8a5093fb327bccd2b4744b570b1f.1433446500.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
In-Reply-To: <cover.1433446500.git.akuster808@gmail.com>
References: <cover.1433446500.git.akuster808@gmail.com>
Subject: [PATCH 3/3] neon: build fix
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
X-List-Received-Date: Thu, 04 Jun 2015 19:37:19 -0000

fixup to allow building with api changes in gnutls.

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../neon/neon/gnutls_4.3_fixup.patch               | 53 ++++++++++++++++++++++
 meta/recipes-support/neon/neon_0.30.1.bb           |  3 +-
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch

diff --git a/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
new file mode 100644
index 0000000..0020330
--- /dev/null
+++ b/meta/recipes-support/neon/neon/gnutls_4.3_fixup.patch
@@ -0,0 +1,53 @@
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
diff --git a/meta/recipes-support/neon/neon_0.30.1.bb b/meta/recipes-support/neon/neon_0.30.1.bb
index 9245244..bac5bac 100644
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
1.9.1


