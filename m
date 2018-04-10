Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	by mail.openembedded.org (Postfix) with ESMTP id 2C46D7480A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 12:14:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Apr 2018 05:14:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,431,1517904000"; d="scan'208";a="32526539"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 10 Apr 2018 05:14:07 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 15:07:44 +0300
Message-Id: <20180410120747.41814-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
In-Reply-To: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
References: <20180410120747.41814-1-alexander.kanavin@linux.intel.com>
Subject: [RFC][PATCH 2/5] cryptodev-tests: port to openssl 1.1
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
X-List-Received-Date: Tue, 10 Apr 2018 12:14:07 -0000

This leaves openssh as the only recipe that requires openssl 1.0 (or libressl).

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../cryptodev/cryptodev-tests_1.9.bb               |   3 +-
 .../files/0001-Port-tests-to-openssl-1.1.patch     | 103 +++++++++++++++++++++
 2 files changed, 105 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch

diff --git a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
index 9afb3de217e..617db6cdd31 100644
--- a/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
+++ b/meta/recipes-kernel/cryptodev/cryptodev-tests_1.9.bb
@@ -2,10 +2,11 @@ require cryptodev.inc
 
 SUMMARY = "A test suite for /dev/crypto device driver"
 
-DEPENDS += "openssl10"
+DEPENDS += "openssl"
 
 SRC_URI += " \
 file://0001-Add-the-compile-and-install-rules-for-cryptodev-test.patch \
+file://0001-Port-tests-to-openssl-1.1.patch \
 "
 
 EXTRA_OEMAKE='KERNEL_DIR="${STAGING_EXECPREFIXDIR}" PREFIX="${D}"'
diff --git a/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
new file mode 100644
index 00000000000..c9691265f6c
--- /dev/null
+++ b/meta/recipes-kernel/cryptodev/files/0001-Port-tests-to-openssl-1.1.patch
@@ -0,0 +1,103 @@
+From 2fe4bdeb8cdd0b0f46d9caed807812855d51ea56 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Wed, 28 Mar 2018 20:11:05 +0300
+Subject: [PATCH] Port tests to openssl 1.1
+
+Upstream-Status: Accepted [https://github.com/cryptodev-linux/cryptodev-linux/pull/36]
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ tests/openssl_wrapper.c | 33 +++++++++++++++++++++++++++++++++
+ 1 file changed, 33 insertions(+)
+
+diff --git a/tests/openssl_wrapper.c b/tests/openssl_wrapper.c
+index 038c58f..dea2496 100644
+--- a/tests/openssl_wrapper.c
++++ b/tests/openssl_wrapper.c
+@@ -4,6 +4,7 @@
+ #include <openssl/aes.h>
+ #include <openssl/evp.h>
+ #include <openssl/hmac.h>
++#include <openssl/opensslv.h>
+ 
+ //#define DEBUG
+ 
+@@ -23,10 +24,17 @@ enum ctx_type {
+ 	ctx_type_md,
+ };
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++union openssl_ctx {
++	HMAC_CTX *hmac;
++	EVP_MD_CTX *md;
++};
++#else
+ union openssl_ctx {
+ 	HMAC_CTX hmac;
+ 	EVP_MD_CTX md;
+ };
++#endif
+ 
+ struct ctx_mapping {
+ 	__u32 ses;
+@@ -63,6 +71,16 @@ static void remove_mapping(__u32 ses)
+ 	switch (mapping->type) {
+ 	case ctx_type_none:
+ 		break;
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++	case ctx_type_hmac:
++		dbgp("%s: calling HMAC_CTX_free\n", __func__);
++		HMAC_CTX_free(mapping->ctx.hmac);
++		break;
++	case ctx_type_md:
++		dbgp("%s: calling EVP_MD_CTX_free\n", __func__);
++		EVP_MD_CTX_free(mapping->ctx.md);
++		break;
++#else
+ 	case ctx_type_hmac:
+ 		dbgp("%s: calling HMAC_CTX_cleanup\n", __func__);
+ 		HMAC_CTX_cleanup(&mapping->ctx.hmac);
+@@ -71,6 +89,7 @@ static void remove_mapping(__u32 ses)
+ 		dbgp("%s: calling EVP_MD_CTX_cleanup\n", __func__);
+ 		EVP_MD_CTX_cleanup(&mapping->ctx.md);
+ 		break;
++#endif
+ 	}
+ 	memset(mapping, 0, sizeof(*mapping));
+ }
+@@ -127,10 +146,17 @@ static int openssl_hmac(struct session_op *sess, struct crypt_op *cop)
+ 
+ 		mapping->ses = sess->ses;
+ 		mapping->type = ctx_type_hmac;
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++		ctx = mapping->ctx.hmac;
++
++		dbgp("calling HMAC_CTX_new");
++		ctx = HMAC_CTX_new();
++#else
+ 		ctx = &mapping->ctx.hmac;
+ 
+ 		dbgp("calling HMAC_CTX_init");
+ 		HMAC_CTX_init(ctx);
++#endif
+ 		dbgp("calling HMAC_Init_ex");
+ 		if (!HMAC_Init_ex(ctx, sess->mackey, sess->mackeylen,
+ 				sess_to_evp_md(sess), NULL)) {
+@@ -172,10 +198,17 @@ static int openssl_md(struct session_op *sess, struct crypt_op *cop)
+ 
+ 		mapping->ses = sess->ses;
+ 		mapping->type = ctx_type_md;
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L
++		ctx = mapping->ctx.md;
++
++		dbgp("calling EVP_MD_CTX_new");
++		ctx = EVP_MD_CTX_new();
++#else
+ 		ctx = &mapping->ctx.md;
+ 
+ 		dbgp("calling EVP_MD_CTX_init");
+ 		EVP_MD_CTX_init(ctx);
++#endif
+ 		dbgp("calling EVP_DigestInit");
+ 		EVP_DigestInit(ctx, sess_to_evp_md(sess));
+ 	}
-- 
2.16.1


