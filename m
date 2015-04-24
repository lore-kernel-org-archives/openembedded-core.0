Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 85C7273D83
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 07:54:21 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t3O7sMWI021396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 00:54:23 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 24 Apr 2015 00:54:22 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 00:54:15 -0700
Message-ID: <37a627a95603fd8448407997c07a73a86fd2ae62.1429861978.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1429861978.git.liezhi.yang@windriver.com>
References: <cover.1429861978.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] openssl: remove 3 patches
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
X-List-Received-Date: Fri, 24 Apr 2015 07:54:23 -0000
Content-Type: text/plain

Removed:
 - openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
 - upgate-vegsion-script-for-1.0.2.patch
   Since they are already in the source.
 - make-targets.patch
   It removed test dir from DIRS, which is not needed any more since we
   need build it.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>

init

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../openssl/openssl/debian/make-targets.patch      |   15 -----
 ...NULL-pointer-dereference-in-dh_pub_encode.patch |   26 --------
 .../openssl/update-version-script-for-1.0.2.patch  |   66 --------------------
 3 files changed, 107 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/update-version-script-for-1.0.2.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch b/meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch
deleted file mode 100644
index ee0a62c..0000000
--- a/meta/recipes-connectivity/openssl/openssl/debian/make-targets.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-Upstream-Status: Backport [debian]
-
-Index: openssl-1.0.1/Makefile.org
-===================================================================
---- openssl-1.0.1.orig/Makefile.org	2012-03-17 09:41:07.000000000 +0000
-+++ openssl-1.0.1/Makefile.org	2012-03-17 09:41:21.000000000 +0000
-@@ -135,7 +135,7 @@
- 
- BASEADDR=
- 
--DIRS=   crypto ssl engines apps test tools
-+DIRS=   crypto ssl engines apps tools
- ENGDIRS= ccgost
- SHLIBDIRS= crypto ssl
- 
diff --git a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch b/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
deleted file mode 100644
index d7047bb..0000000
--- a/meta/recipes-connectivity/openssl/openssl/openssl-avoid-NULL-pointer-dereference-in-dh_pub_encode.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-openssl: avoid NULL pointer dereference in dh_pub_encode()/dsa_pub_encode()
-
-We should avoid accessing the pointer if ASN1_STRING_new()
-allocates memory failed.
-
-Upstream-Status: Submitted
-http://www.mail-archive.com/openssl-dev@openssl.org/msg32859.html
-
-Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
----
-Index: openssl-1.0.2/crypto/dh/dh_ameth.c
-===================================================================
---- openssl-1.0.2.orig/crypto/dh/dh_ameth.c
-+++ openssl-1.0.2/crypto/dh/dh_ameth.c
-@@ -161,6 +161,11 @@ static int dh_pub_encode(X509_PUBKEY *pk
-     dh = pkey->pkey.dh;
- 
-     str = ASN1_STRING_new();
-+    if (!str) {
-+        DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
-+        goto err;
-+    }
-+
-     str->length = i2d_dhp(pkey, dh, &str->data);
-     if (str->length <= 0) {
-         DHerr(DH_F_DH_PUB_ENCODE, ERR_R_MALLOC_FAILURE);
diff --git a/meta/recipes-connectivity/openssl/openssl/update-version-script-for-1.0.2.patch b/meta/recipes-connectivity/openssl/openssl/update-version-script-for-1.0.2.patch
deleted file mode 100644
index fcfccfa..0000000
--- a/meta/recipes-connectivity/openssl/openssl/update-version-script-for-1.0.2.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-Index: openssl-1.0.2/openssl.ld
-===================================================================
---- openssl-1.0.2.orig/openssl.ld
-+++ openssl-1.0.2/openssl.ld
-@@ -4618,3 +4618,61 @@ OPENSSL_1.0.1d {
- 		CRYPTO_memcmp;
- } OPENSSL_1.0.1;
- 
-+OPENSSL_1.0.2 {
-+	global:
-+		ASN1_TIME_diff;
-+		CMS_RecipientInfo_get0_pkey_ctx;
-+		CMS_RecipientInfo_kari_get0_ctx;
-+		CMS_SignerInfo_get0_pkey_ctx;
-+		DH_get_1024_160;
-+		DH_get_2048_224;
-+		DH_get_2048_256;
-+		DTLS_client_method;
-+		DTLS_server_method;
-+		DTLSv1_2_client_method;
-+		DTLSv1_2_server_method;
-+		EC_curve_nid2nist;
-+		EC_curve_nist2nid;
-+		EVP_aes_128_cbc_hmac_sha256;
-+		EVP_aes_128_wrap;
-+		EVP_aes_192_wrap;
-+		EVP_aes_256_cbc_hmac_sha256;
-+		EVP_aes_256_wrap;
-+		EVP_des_ede3_wrap;
-+		OCSP_REQ_CTX_http;
-+		OCSP_REQ_CTX_new;
-+		PEM_write_bio_DHxparams;
-+		SSL_CIPHER_find;
-+		SSL_CONF_CTX_finish;
-+		SSL_CONF_CTX_free;
-+		SSL_CONF_CTX_new;
-+		SSL_CONF_CTX_set_flags;
-+		SSL_CONF_CTX_set_ssl_ctx;
-+		SSL_CONF_cmd;
-+		SSL_CONF_cmd_argv;
-+		SSL_CTX_add_client_custom_ext;
-+		SSL_CTX_add_server_custom_ext;
-+		SSL_CTX_set_alpn_protos;
-+		SSL_CTX_set_alpn_select_cb;
-+		SSL_CTX_set_cert_cb;
-+		SSL_CTX_use_serverinfo_file;
-+		SSL_certs_clear;
-+		SSL_check_chain;
-+		SSL_get0_alpn_selected;
-+		SSL_get_shared_sigalgs;
-+		SSL_get_sigalgs;
-+		SSL_is_server;
-+		X509_CRL_diff;
-+		X509_CRL_http_nbio;
-+		X509_STORE_set_lookup_crls_cb;
-+		X509_VERIFY_PARAM_set1_email;
-+		X509_VERIFY_PARAM_set1_host;
-+		X509_VERIFY_PARAM_set1_ip_asc;
-+		X509_chain_check_suiteb;
-+		X509_chain_up_ref;
-+		X509_check_email;
-+		X509_check_host;
-+		X509_check_ip_asc;
-+		X509_get_signature_nid;
-+		X509_http_nbio;
-+} OPENSSL_1.0.1d;
-- 
1.7.9.5


