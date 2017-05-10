Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 64F1271AE6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 14:13:28 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 10 May 2017 07:13:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1167201679"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 10 May 2017 07:13:29 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 17:13:25 +0300
Message-Id: <fd686cc4aaa30349a4d5b586d7f780e4a68c15f9.1494425038.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
References: <cover.1494425038.git.alexander.kanavin@linux.intel.com>
Subject: [RFC PATCH 07/10] apr-util: add support for openssl 1.1 via backported patch
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
X-List-Received-Date: Wed, 10 May 2017 14:13:28 -0000

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 .../recipes-support/apr/apr-util/openssl-1.1.patch | 253 +++++++++++++++++++++
 meta/recipes-support/apr/apr-util_1.5.4.bb         |   1 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-support/apr/apr-util/openssl-1.1.patch

diff --git a/meta/recipes-support/apr/apr-util/openssl-1.1.patch b/meta/recipes-support/apr/apr-util/openssl-1.1.patch
new file mode 100644
index 00000000000..891c14183a8
--- /dev/null
+++ b/meta/recipes-support/apr/apr-util/openssl-1.1.patch
@@ -0,0 +1,253 @@
+# commit f163d8b5af9185de80d24b4dd13951dd64872aa6
+# Author: Rainer Jung <rjung@apache.org>
+# Date:   Sun Feb 7 14:40:46 2016 +0000
+# 
+#     Add support for OpenSSL 1.1.0:
+#     - Switch configure test for OpenSSL libcrypto
+#       from BN_init() to BN_new().
+#       - BN_init() is gone in OpenSSL 1.1.0.
+#         BN_new() exists at least since 0.9.8.
+#     - use OPENSSL_malloc_init() instead of
+#       CRYPTO_malloc_init
+#     - make cipherCtx a pointer. Type EVP_CIPHER_CTX
+#       is now opaque.
+#       - use EVP_CIPHER_CTX_new() in init() functions
+#         if initialised flag is not set (and set flag)
+#       - use EVP_CIPHER_CTX_free() in cleanup function
+#     - Improve reuse cleanup
+#       - call EVP_CIPHER_CTX_reset() resp.
+#         EVP_CIPHER_CTX_cleanup() in finish functions
+#       - call EVP_CIPHER_CTX_reset() resp.
+#         EVP_CIPHER_CTX_cleanup() when Update fails
+#     Backport of r1728958 and r1728963 from trunk.
+#     
+#     
+#     git-svn-id: https://svn.apache.org/repos/asf/apr/apr-util/branches/1.5.x@1728969 13f79535-47bb-0310-9956-ffa450edef68
+#
+
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+Upstream-Status: Backport 
+diff --git a/build/crypto.m4 b/build/crypto.m4
+index 9f9be6f..57884e3 100644
+--- a/build/crypto.m4
++++ b/build/crypto.m4
+@@ -88,7 +88,7 @@ AC_DEFUN([APU_CHECK_CRYPTO_OPENSSL], [
+   [
+     if test "$withval" = "yes"; then
+       AC_CHECK_HEADERS(openssl/x509.h, [openssl_have_headers=1])
+-      AC_CHECK_LIB(crypto, BN_init, AC_CHECK_LIB(ssl, SSL_accept, [openssl_have_libs=1],,-lcrypto))
++      AC_CHECK_LIB(crypto, BN_new, AC_CHECK_LIB(ssl, SSL_accept, [openssl_have_libs=1],,-lcrypto))
+       if test "$openssl_have_headers" != "0" && test "$openssl_have_libs" != "0"; then
+         apu_have_openssl=1
+       fi
+@@ -104,7 +104,7 @@ AC_DEFUN([APU_CHECK_CRYPTO_OPENSSL], [
+ 
+       AC_MSG_NOTICE(checking for openssl in $withval)
+       AC_CHECK_HEADERS(openssl/x509.h, [openssl_have_headers=1])
+-      AC_CHECK_LIB(crypto, BN_init, AC_CHECK_LIB(ssl, SSL_accept, [openssl_have_libs=1],,-lcrypto))
++      AC_CHECK_LIB(crypto, BN_new, AC_CHECK_LIB(ssl, SSL_accept, [openssl_have_libs=1],,-lcrypto))
+       if test "$openssl_have_headers" != "0" && test "$openssl_have_libs" != "0"; then
+         apu_have_openssl=1
+         APR_ADDTO(APRUTIL_LDFLAGS, [-L$withval/lib])
+@@ -113,7 +113,7 @@ AC_DEFUN([APU_CHECK_CRYPTO_OPENSSL], [
+ 
+       if test "$apu_have_openssl" != "1"; then
+         AC_CHECK_HEADERS(openssl/x509.h, [openssl_have_headers=1])
+-        AC_CHECK_LIB(crypto, BN_init, AC_CHECK_LIB(ssl, SSL_accept, [openssl_have_libs=1],,-lcrypto))
++        AC_CHECK_LIB(crypto, BN_new, AC_CHECK_LIB(ssl, SSL_accept, [openssl_have_libs=1],,-lcrypto))
+         if test "$openssl_have_headers" != "0" && test "$openssl_have_libs" != "0"; then
+           apu_have_openssl=1
+           APR_ADDTO(APRUTIL_LDFLAGS, [-L$withval/lib])
+diff --git a/crypto/apr_crypto_openssl.c b/crypto/apr_crypto_openssl.c
+index 0740f93..7d61fca 100644
+--- a/crypto/apr_crypto_openssl.c
++++ b/crypto/apr_crypto_openssl.c
+@@ -64,7 +64,7 @@ struct apr_crypto_block_t {
+     apr_pool_t *pool;
+     const apr_crypto_driver_t *provider;
+     const apr_crypto_t *f;
+-    EVP_CIPHER_CTX cipherCtx;
++    EVP_CIPHER_CTX *cipherCtx;
+     int initialised;
+     int ivSize;
+     int blockSize;
+@@ -111,7 +111,11 @@ static apr_status_t crypto_shutdown_helper(void *data)
+ static apr_status_t crypto_init(apr_pool_t *pool, const char *params,
+         const apu_err_t **result)
+ {
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
+     CRYPTO_malloc_init();
++#else
++    OPENSSL_malloc_init();
++#endif
+     ERR_load_crypto_strings();
+     /* SSL_load_error_strings(); */
+     OpenSSL_add_all_algorithms();
+@@ -134,7 +138,7 @@ static apr_status_t crypto_block_cleanup(apr_crypto_block_t *ctx)
+ {
+ 
+     if (ctx->initialised) {
+-        EVP_CIPHER_CTX_cleanup(&ctx->cipherCtx);
++        EVP_CIPHER_CTX_free(ctx->cipherCtx);
+         ctx->initialised = 0;
+     }
+ 
+@@ -491,8 +495,10 @@ static apr_status_t crypto_block_encrypt_init(apr_crypto_block_t **ctx,
+             apr_pool_cleanup_null);
+ 
+     /* create a new context for encryption */
+-    EVP_CIPHER_CTX_init(&block->cipherCtx);
+-    block->initialised = 1;
++    if (!block->initialised) {
++        block->cipherCtx = EVP_CIPHER_CTX_new();
++        block->initialised = 1;
++    }
+ 
+     /* generate an IV, if necessary */
+     usedIv = NULL;
+@@ -519,16 +525,16 @@ static apr_status_t crypto_block_encrypt_init(apr_crypto_block_t **ctx,
+ 
+     /* set up our encryption context */
+ #if CRYPTO_OPENSSL_CONST_BUFFERS
+-    if (!EVP_EncryptInit_ex(&block->cipherCtx, key->cipher, config->engine,
++    if (!EVP_EncryptInit_ex(block->cipherCtx, key->cipher, config->engine,
+             key->key, usedIv)) {
+ #else
+-        if (!EVP_EncryptInit_ex(&block->cipherCtx, key->cipher, config->engine, (unsigned char *) key->key, (unsigned char *) usedIv)) {
++        if (!EVP_EncryptInit_ex(block->cipherCtx, key->cipher, config->engine, (unsigned char *) key->key, (unsigned char *) usedIv)) {
+ #endif
+         return APR_EINIT;
+     }
+ 
+     /* Clear up any read padding */
+-    if (!EVP_CIPHER_CTX_set_padding(&block->cipherCtx, key->doPad)) {
++    if (!EVP_CIPHER_CTX_set_padding(block->cipherCtx, key->doPad)) {
+         return APR_EPADDING;
+     }
+ 
+@@ -582,11 +588,16 @@ static apr_status_t crypto_block_encrypt(unsigned char **out,
+     }
+ 
+ #if CRYPT_OPENSSL_CONST_BUFFERS
+-    if (!EVP_EncryptUpdate(&ctx->cipherCtx, (*out), &outl, in, inlen)) {
++    if (!EVP_EncryptUpdate(ctx->cipherCtx, (*out), &outl, in, inlen)) {
+ #else
+-    if (!EVP_EncryptUpdate(&ctx->cipherCtx, (*out), &outl,
++    if (!EVP_EncryptUpdate(ctx->cipherCtx, (*out), &outl,
+             (unsigned char *) in, inlen)) {
+ #endif
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++        EVP_CIPHER_CTX_cleanup(ctx->cipherCtx);
++#else
++        EVP_CIPHER_CTX_reset(ctx->cipherCtx);
++#endif
+         return APR_ECRYPT;
+     }
+     *outlen = outl;
+@@ -616,14 +627,22 @@ static apr_status_t crypto_block_encrypt(unsigned char **out,
+ static apr_status_t crypto_block_encrypt_finish(unsigned char *out,
+         apr_size_t *outlen, apr_crypto_block_t *ctx)
+ {
++    apr_status_t rc = APR_SUCCESS;
+     int len = *outlen;
+ 
+-    if (EVP_EncryptFinal_ex(&ctx->cipherCtx, out, &len) == 0) {
+-        return APR_EPADDING;
++    if (EVP_EncryptFinal_ex(ctx->cipherCtx, out, &len) == 0) {
++        rc = APR_EPADDING;
++    }
++    else {
++        *outlen = len;
+     }
+-    *outlen = len;
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++    EVP_CIPHER_CTX_cleanup(ctx->cipherCtx);
++#else
++    EVP_CIPHER_CTX_reset(ctx->cipherCtx);
++#endif
+ 
+-    return APR_SUCCESS;
++    return rc;
+ 
+ }
+ 
+@@ -662,8 +681,10 @@ static apr_status_t crypto_block_decrypt_init(apr_crypto_block_t **ctx,
+             apr_pool_cleanup_null);
+ 
+     /* create a new context for encryption */
+-    EVP_CIPHER_CTX_init(&block->cipherCtx);
+-    block->initialised = 1;
++    if (!block->initialised) {
++        block->cipherCtx = EVP_CIPHER_CTX_new();
++        block->initialised = 1;
++    }
+ 
+     /* generate an IV, if necessary */
+     if (key->ivSize) {
+@@ -674,16 +695,16 @@ static apr_status_t crypto_block_decrypt_init(apr_crypto_block_t **ctx,
+ 
+     /* set up our encryption context */
+ #if CRYPTO_OPENSSL_CONST_BUFFERS
+-    if (!EVP_DecryptInit_ex(&block->cipherCtx, key->cipher, config->engine,
++    if (!EVP_DecryptInit_ex(block->cipherCtx, key->cipher, config->engine,
+             key->key, iv)) {
+ #else
+-        if (!EVP_DecryptInit_ex(&block->cipherCtx, key->cipher, config->engine, (unsigned char *) key->key, (unsigned char *) iv)) {
++        if (!EVP_DecryptInit_ex(block->cipherCtx, key->cipher, config->engine, (unsigned char *) key->key, (unsigned char *) iv)) {
+ #endif
+         return APR_EINIT;
+     }
+ 
+     /* Clear up any read padding */
+-    if (!EVP_CIPHER_CTX_set_padding(&block->cipherCtx, key->doPad)) {
++    if (!EVP_CIPHER_CTX_set_padding(block->cipherCtx, key->doPad)) {
+         return APR_EPADDING;
+     }
+ 
+@@ -737,11 +758,16 @@ static apr_status_t crypto_block_decrypt(unsigned char **out,
+     }
+ 
+ #if CRYPT_OPENSSL_CONST_BUFFERS
+-    if (!EVP_DecryptUpdate(&ctx->cipherCtx, *out, &outl, in, inlen)) {
++    if (!EVP_DecryptUpdate(ctx->cipherCtx, *out, &outl, in, inlen)) {
+ #else
+-    if (!EVP_DecryptUpdate(&ctx->cipherCtx, *out, &outl, (unsigned char *) in,
++    if (!EVP_DecryptUpdate(ctx->cipherCtx, *out, &outl, (unsigned char *) in,
+             inlen)) {
+ #endif
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++        EVP_CIPHER_CTX_cleanup(ctx->cipherCtx);
++#else
++        EVP_CIPHER_CTX_reset(ctx->cipherCtx);
++#endif
+         return APR_ECRYPT;
+     }
+     *outlen = outl;
+@@ -771,15 +797,22 @@ static apr_status_t crypto_block_decrypt(unsigned char **out,
+ static apr_status_t crypto_block_decrypt_finish(unsigned char *out,
+         apr_size_t *outlen, apr_crypto_block_t *ctx)
+ {
+-
++    apr_status_t rc = APR_SUCCESS;
+     int len = *outlen;
+ 
+-    if (EVP_DecryptFinal_ex(&ctx->cipherCtx, out, &len) == 0) {
+-        return APR_EPADDING;
++    if (EVP_DecryptFinal_ex(ctx->cipherCtx, out, &len) == 0) {
++        rc = APR_EPADDING;
+     }
+-    *outlen = len;
++    else {
++        *outlen = len;
++    }
++#if OPENSSL_VERSION_NUMBER < 0x10100000L
++    EVP_CIPHER_CTX_cleanup(ctx->cipherCtx);
++#else
++    EVP_CIPHER_CTX_reset(ctx->cipherCtx);
++#endif
+ 
+-    return APR_SUCCESS;
++    return rc;
+ 
+ }
+ 
diff --git a/meta/recipes-support/apr/apr-util_1.5.4.bb b/meta/recipes-support/apr/apr-util_1.5.4.bb
index 2b8676fef33..64f4d94d8b6 100644
--- a/meta/recipes-support/apr/apr-util_1.5.4.bb
+++ b/meta/recipes-support/apr/apr-util_1.5.4.bb
@@ -13,6 +13,7 @@ SRC_URI = "${APACHE_MIRROR}/apr/${BPN}-${PV}.tar.gz \
            file://configfix.patch \
            file://configure_fixes.patch \
            file://run-ptest \
+           file://openssl-1.1.patch \
 "
 
 SRC_URI[md5sum] = "866825c04da827c6e5f53daff5569f42"
-- 
2.11.0


