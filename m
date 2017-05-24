Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	by mail.openembedded.org (Postfix) with ESMTP id CEE9F780A8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 20:46:17 +0000 (UTC)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 3wY4Dp2d8Hz1qtHW;
	Wed, 24 May 2017 22:46:18 +0200 (CEST)
Received: from localhost (dynscan01.mnet-online.de [192.168.6.70])
	by mail.m-online.net (Postfix) with ESMTP id 3wY4Dp1zsnz3hmm5;
	Wed, 24 May 2017 22:46:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan01.mail.m-online.net [192.168.6.70]) (amavisd-new,
	port 10024)
	with ESMTP id Bnlyv4zmaCyr; Wed, 24 May 2017 22:46:17 +0200 (CEST)
X-Auth-Info: BdlsGaCZBP0KyHyoCWbdb6zH21BXWpQ0HA1l/9YArl0=
Received: from chi.lan (unknown [195.140.253.167])
	by mail.mnet-online.de (Postfix) with ESMTPA;
	Wed, 24 May 2017 22:46:16 +0200 (CEST)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 May 2017 22:46:15 +0200
Message-Id: <20170524204615.2748-1-marex@denx.de>
X-Mailer: git-send-email 2.11.0
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] u-boot: Fix build with OpenSSL 1.1.x
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
X-List-Received-Date: Wed, 24 May 2017 20:46:19 -0000

Pick two patches from the U-Boot ML fixing build with OpenSSL 1.1.x .

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Denys Dmytriyenko <denis@denix.org>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Ross Burton <ross.burton@intel.com>
---
 .../0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch    | 158 +++++++++++++++++++++
 ...ols-kwbimage-fix-build-with-OpenSSL-1.1.x.patch | 101 +++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc  |   6 +-
 3 files changed, 264 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch
 create mode 100644 meta/recipes-bsp/u-boot/files/0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch

diff --git a/meta/recipes-bsp/u-boot/files/0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch b/meta/recipes-bsp/u-boot/files/0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch
new file mode 100644
index 0000000000..309cbbbc05
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch
@@ -0,0 +1,158 @@
+From 59be82ef7e7ec4be6e1597d8aef65dd3d8c3a0d9 Mon Sep 17 00:00:00 2001
+From: Jelle van der Waa <jelle@vdwaa.nl>
+Date: Mon, 8 May 2017 21:31:19 +0200
+Subject: [PATCH 1/2] rsa: Fix build with OpenSSL 1.1.x
+
+The rsa_st struct has been made opaque in 1.1.x, add forward compatible
+code to access the n, e, d members of rsa_struct.
+
+EVP_MD_CTX_cleanup has been removed in 1.1.x and EVP_MD_CTX_reset should be
+called to reinitialise an already created structure.
+---
+ lib/rsa/rsa-sign.c | 44 ++++++++++++++++++++++++++++++++++++++------
+ 1 file changed, 38 insertions(+), 6 deletions(-)
+
+diff --git a/lib/rsa/rsa-sign.c b/lib/rsa/rsa-sign.c
+index 8c6637e328..1da4ef7fff 100644
+--- a/lib/rsa/rsa-sign.c
++++ b/lib/rsa/rsa-sign.c
+@@ -9,6 +9,7 @@
+ #include <string.h>
+ #include <image.h>
+ #include <time.h>
++#include <openssl/bn.h>
+ #include <openssl/rsa.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+@@ -20,6 +21,19 @@
+ #define HAVE_ERR_REMOVE_THREAD_STATE
+ #endif
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++static void RSA_get0_key(const RSA *r,
++                 const BIGNUM **n, const BIGNUM **e, const BIGNUM **d)
++{
++   if (n != NULL)
++       *n = r->n;
++   if (e != NULL)
++       *e = r->e;
++   if (d != NULL)
++       *d = r->d;
++}
++#endif
++
+ static int rsa_err(const char *msg)
+ {
+ 	unsigned long sslErr = ERR_get_error();
+@@ -286,16 +300,22 @@ static int rsa_init(void)
+ {
+ 	int ret;
+ 
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	ret = SSL_library_init();
++#else
++	ret = OPENSSL_init_ssl(0, NULL);
++#endif
+ 	if (!ret) {
+ 		fprintf(stderr, "Failure to init SSL library\n");
+ 		return -1;
+ 	}
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	SSL_load_error_strings();
+ 
+ 	OpenSSL_add_all_algorithms();
+ 	OpenSSL_add_all_digests();
+ 	OpenSSL_add_all_ciphers();
++#endif
+ 
+ 	return 0;
+ }
+@@ -335,12 +355,15 @@ err_set_rsa:
+ err_engine_init:
+ 	ENGINE_free(e);
+ err_engine_by_id:
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	ENGINE_cleanup();
++#endif
+ 	return ret;
+ }
+ 
+ static void rsa_remove(void)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+ 	CRYPTO_cleanup_all_ex_data();
+ 	ERR_free_strings();
+ #ifdef HAVE_ERR_REMOVE_THREAD_STATE
+@@ -349,6 +372,7 @@ static void rsa_remove(void)
+ 	ERR_remove_state(0);
+ #endif
+ 	EVP_cleanup();
++#endif
+ }
+ 
+ static void rsa_engine_remove(ENGINE *e)
+@@ -409,7 +433,11 @@ static int rsa_sign_with_key(RSA *rsa, struct checksum_algo *checksum_algo,
+ 		ret = rsa_err("Could not obtain signature");
+ 		goto err_sign;
+ 	}
+-	EVP_MD_CTX_cleanup(context);
++	#if OPENSSL_VERSION_NUMBER < 0x10100000L
++		EVP_MD_CTX_cleanup(context);
++	#else
++		EVP_MD_CTX_reset(context);
++	#endif
+ 	EVP_MD_CTX_destroy(context);
+ 	EVP_PKEY_free(key);
+ 
+@@ -479,6 +507,7 @@ static int rsa_get_exponent(RSA *key, uint64_t *e)
+ {
+ 	int ret;
+ 	BIGNUM *bn_te;
++	const BIGNUM *key_e;
+ 	uint64_t te;
+ 
+ 	ret = -EINVAL;
+@@ -487,17 +516,18 @@ static int rsa_get_exponent(RSA *key, uint64_t *e)
+ 	if (!e)
+ 		goto cleanup;
+ 
+-	if (BN_num_bits(key->e) > 64)
++	RSA_get0_key(key, NULL, &key_e, NULL);
++	if (BN_num_bits(key_e) > 64)
+ 		goto cleanup;
+ 
+-	*e = BN_get_word(key->e);
++	*e = BN_get_word(key_e);
+ 
+-	if (BN_num_bits(key->e) < 33) {
++	if (BN_num_bits(key_e) < 33) {
+ 		ret = 0;
+ 		goto cleanup;
+ 	}
+ 
+-	bn_te = BN_dup(key->e);
++	bn_te = BN_dup(key_e);
+ 	if (!bn_te)
+ 		goto cleanup;
+ 
+@@ -527,6 +557,7 @@ int rsa_get_params(RSA *key, uint64_t *exponent, uint32_t *n0_invp,
+ {
+ 	BIGNUM *big1, *big2, *big32, *big2_32;
+ 	BIGNUM *n, *r, *r_squared, *tmp;
++	const BIGNUM *key_n;
+ 	BN_CTX *bn_ctx = BN_CTX_new();
+ 	int ret = 0;
+ 
+@@ -548,7 +579,8 @@ int rsa_get_params(RSA *key, uint64_t *exponent, uint32_t *n0_invp,
+ 	if (0 != rsa_get_exponent(key, exponent))
+ 		ret = -1;
+ 
+-	if (!BN_copy(n, key->n) || !BN_set_word(big1, 1L) ||
++	RSA_get0_key(key, &key_n, NULL, NULL);
++	if (!BN_copy(n, key_n) || !BN_set_word(big1, 1L) ||
+ 	    !BN_set_word(big2, 2L) || !BN_set_word(big32, 32L))
+ 		ret = -1;
+ 
+-- 
+2.11.0
+
diff --git a/meta/recipes-bsp/u-boot/files/0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch b/meta/recipes-bsp/u-boot/files/0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch
new file mode 100644
index 0000000000..21b6f054a3
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch
@@ -0,0 +1,101 @@
+From 65030804dc57f3488e4ffe21e72fc65cd245cb98 Mon Sep 17 00:00:00 2001
+From: Jelle van der Waa <jelle@vdwaa.nl>
+Date: Mon, 8 May 2017 21:31:20 +0200
+Subject: [PATCH 2/2] tools: kwbimage fix build with OpenSSL 1.1.x
+
+The rsa_st struct has been made opaque in 1.1.x, add forward compatible
+code to access the n, e, d members of rsa_struct.
+
+EVP_MD_CTX_cleanup has been removed in 1.1.x and EVP_MD_CTX_reset should be
+called to reinitialise an already created structure.
+
+Signed-off-by: Jelle van der Waa <jelle@vdwaa.nl>
+---
+ tools/kwbimage.c | 36 ++++++++++++++++++++++++++++++------
+ 1 file changed, 30 insertions(+), 6 deletions(-)
+
+diff --git a/tools/kwbimage.c b/tools/kwbimage.c
+index 2c637c7446..8c0e730e7b 100644
+--- a/tools/kwbimage.c
++++ b/tools/kwbimage.c
+@@ -18,10 +18,30 @@
+ #include "kwbimage.h"
+ 
+ #ifdef CONFIG_KWB_SECURE
++#include <openssl/bn.h>
+ #include <openssl/rsa.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+ #include <openssl/evp.h>
++
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++static void RSA_get0_key(const RSA *r,
++                 const BIGNUM **n, const BIGNUM **e, const BIGNUM **d)
++{
++   if (n != NULL)
++       *n = r->n;
++   if (e != NULL)
++       *e = r->e;
++   if (d != NULL)
++       *d = r->d;
++}
++
++#else
++void EVP_MD_CTX_cleanup(EVP_MD_CTX *ctx)
++{
++	EVP_MD_CTX_reset(ctx);
++}
++#endif
+ #endif
+ 
+ static struct image_cfg_element *image_cfg;
+@@ -470,12 +490,16 @@ static int kwb_export_pubkey(RSA *key, struct pubkey_der_v1 *dst, FILE *hashf,
+ 			     char *keyname)
+ {
+ 	int size_exp, size_mod, size_seq;
++	const BIGNUM *key_e, *key_n;
+ 	uint8_t *cur;
+ 	char *errmsg = "Failed to encode %s\n";
+ 
+-	if (!key || !key->e || !key->n || !dst) {
++	RSA_get0_key(key, NULL, &key_e, NULL);
++	RSA_get0_key(key, &key_n, NULL, NULL);
++
++	if (!key || !key_e || !key_n || !dst) {
+ 		fprintf(stderr, "export pk failed: (%p, %p, %p, %p)",
+-			key, key->e, key->n, dst);
++			key, key_e, key_n, dst);
+ 		fprintf(stderr, errmsg, keyname);
+ 		return -EINVAL;
+ 	}
+@@ -490,8 +514,8 @@ static int kwb_export_pubkey(RSA *key, struct pubkey_der_v1 *dst, FILE *hashf,
+ 	 * do the encoding manually.
+ 	 */
+ 
+-	size_exp = BN_num_bytes(key->e);
+-	size_mod = BN_num_bytes(key->n);
++	size_exp = BN_num_bytes(key_e);
++	size_mod = BN_num_bytes(key_n);
+ 	size_seq = 4 + size_mod + 4 + size_exp;
+ 
+ 	if (size_mod > 256) {
+@@ -520,14 +544,14 @@ static int kwb_export_pubkey(RSA *key, struct pubkey_der_v1 *dst, FILE *hashf,
+ 	*cur++ = 0x82;
+ 	*cur++ = (size_mod >> 8) & 0xFF;
+ 	*cur++ = size_mod & 0xFF;
+-	BN_bn2bin(key->n, cur);
++	BN_bn2bin(key_n, cur);
+ 	cur += size_mod;
+ 	/* Exponent */
+ 	*cur++ = 0x02;		/* INTEGER */
+ 	*cur++ = 0x82;
+ 	*cur++ = (size_exp >> 8) & 0xFF;
+ 	*cur++ = size_exp & 0xFF;
+-	BN_bn2bin(key->e, cur);
++	BN_bn2bin(key_e, cur);
+ 
+ 	if (hashf) {
+ 		struct hash_v1 pk_hash;
+-- 
+2.11.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc b/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
index 3719aee52d..62eda44877 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common_2017.05.inc
@@ -9,6 +9,10 @@ PE = "1"
 # repo during parse
 SRCREV = "64c4ffa9fa223f7ae8640f9c8f3044bfa0e3bfda"
 
-SRC_URI = "git://git.denx.de/u-boot.git"
+SRC_URI = " \
+	git://git.denx.de/u-boot.git \
+	file://0001-rsa-Fix-build-with-OpenSSL-1.1.x.patch \
+	file://0002-tools-kwbimage-fix-build-with-OpenSSL-1.1.x.patch \
+	"
 
 S = "${WORKDIR}/git"
-- 
2.11.0


