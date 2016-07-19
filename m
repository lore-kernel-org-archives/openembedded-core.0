Return-Path: <Mingli.Yu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B1BAD60746
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 07:15:34 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6J7FYfg001751
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 00:15:34 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Tue, 19 Jul 2016 00:15:33 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 15:13:09 +0800
Message-ID: <1468912389-23529-1-git-send-email-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] openssh: conditional compile DES code.
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
X-List-Received-Date: Tue, 19 Jul 2016 07:15:34 -0000
Content-Type: text/plain

After openssl disabled DES, openssh fails to build
for some DES codes are not wrapped in conditional
compile statement "#ifndef OPENSSL_NO_DES" and "#endif".

Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 116 +++++++++++++++++++++
 ...h-7.1p1-conditional-compile-des-in-pkcs11.patch |  70 +++++++++++++
 meta/recipes-connectivity/openssh/openssh_7.2p2.bb |   2 +
 3 files changed, 188 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
 create mode 100644 meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
new file mode 100644
index 0000000..26193c2
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
@@ -0,0 +1,116 @@
+From 1cd94ed4750d5392cf3c09ed64d2c162a0833bdb Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 18 Mar 2016 15:49:31 +0800
+Subject: [PATCH 2/3] remove des in cipher.
+
+Upstream-status: Pending
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+
+---
+ cipher.c | 18 ++++++++++++++++++
+ 1 file changed, 18 insertions(+)
+
+diff --git a/cipher.c b/cipher.c
+index 02dae6f..63d3c29 100644
+--- a/cipher.c
++++ b/cipher.c
+@@ -53,8 +53,10 @@
+ 
+ #ifdef WITH_SSH1
+ extern const EVP_CIPHER *evp_ssh1_bf(void);
++#ifndef OPENSSL_NO_DES
+ extern const EVP_CIPHER *evp_ssh1_3des(void);
+ extern int ssh1_3des_iv(EVP_CIPHER_CTX *, int, u_char *, int);
++#endif /* OPENSSL_NO_DES */
+ #endif
+ 
+ struct sshcipher {
+@@ -79,13 +81,17 @@ struct sshcipher {
+ 
+ static const struct sshcipher ciphers[] = {
+ #ifdef WITH_SSH1
++#ifndef OPENSSL_NO_DES
+ 	{ "des",	SSH_CIPHER_DES, 8, 8, 0, 0, 0, 1, EVP_des_cbc },
+ 	{ "3des",	SSH_CIPHER_3DES, 8, 16, 0, 0, 0, 1, evp_ssh1_3des },
++#endif /* OPENSSL_NO_DES */
+ 	{ "blowfish",	SSH_CIPHER_BLOWFISH, 8, 32, 0, 0, 0, 1, evp_ssh1_bf },
+ #endif /* WITH_SSH1 */
+ #ifdef WITH_OPENSSL
+ 	{ "none",	SSH_CIPHER_NONE, 8, 0, 0, 0, 0, 0, EVP_enc_null },
++#ifndef OPENSSL_NO_DES
+ 	{ "3des-cbc",	SSH_CIPHER_SSH2, 8, 24, 0, 0, 0, 1, EVP_des_ede3_cbc },
++#endif /* OPENSSL_NO_DES */
+ 	{ "blowfish-cbc",
+ 			SSH_CIPHER_SSH2, 8, 16, 0, 0, 0, 1, EVP_bf_cbc },
+ 	{ "cast128-cbc",
+@@ -163,8 +169,10 @@ cipher_keylen(const struct sshcipher *c)
+ u_int
+ cipher_seclen(const struct sshcipher *c)
+ {
++#ifndef OPENSSL_NO_DES
+ 	if (strcmp("3des-cbc", c->name) == 0)
+ 		return 14;
++#endif /* OPENSSL_NO_DES */
+ 	return cipher_keylen(c);
+ }
+ 
+@@ -201,11 +209,13 @@ u_int
+ cipher_mask_ssh1(int client)
+ {
+ 	u_int mask = 0;
++#ifndef OPENSSL_NO_DES
+ 	mask |= 1 << SSH_CIPHER_3DES;		/* Mandatory */
+ 	mask |= 1 << SSH_CIPHER_BLOWFISH;
+ 	if (client) {
+ 		mask |= 1 << SSH_CIPHER_DES;
+ 	}
++#endif /*OPENSSL_NO_DES*/
+ 	return mask;
+ }
+ 
+@@ -546,7 +556,9 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
+ 	switch (c->number) {
+ #ifdef WITH_OPENSSL
+ 	case SSH_CIPHER_SSH2:
++#ifndef OPENSSL_NO_DES
+ 	case SSH_CIPHER_DES:
++#endif /* OPENSSL_NO_DES */
+ 	case SSH_CIPHER_BLOWFISH:
+ 		evplen = EVP_CIPHER_CTX_iv_length(&cc->evp);
+ 		if (evplen == 0)
+@@ -569,8 +581,10 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
+ 		break;
+ #endif
+ #ifdef WITH_SSH1
++#ifndef OPENSSL_NO_DES
+ 	case SSH_CIPHER_3DES:
+ 		return ssh1_3des_iv(&cc->evp, 0, iv, 24);
++#endif /* OPENSSL_NO_DES */
+ #endif
+ 	default:
+ 		return SSH_ERR_INVALID_ARGUMENT;
+@@ -594,7 +608,9 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
+ 	switch (c->number) {
+ #ifdef WITH_OPENSSL
+ 	case SSH_CIPHER_SSH2:
++#ifndef OPENSSL_NO_DES
+ 	case SSH_CIPHER_DES:
++#endif /* OPENSSL_NO_DES */
+ 	case SSH_CIPHER_BLOWFISH:
+ 		evplen = EVP_CIPHER_CTX_iv_length(&cc->evp);
+ 		if (evplen <= 0)
+@@ -609,8 +625,10 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
+ 		break;
+ #endif
+ #ifdef WITH_SSH1
++#ifndef OPENSSL_NO_DES
+ 	case SSH_CIPHER_3DES:
+ 		return ssh1_3des_iv(&cc->evp, 1, (u_char *)iv, 24);
++#endif /* OPENSSL_NO_DES */
+ #endif
+ 	default:
+ 		return SSH_ERR_INVALID_ARGUMENT;
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
new file mode 100644
index 0000000..bd02028
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
@@ -0,0 +1,70 @@
+From 04cfd84423f693d879dc3ffebb0f6fe2680c254f Mon Sep 17 00:00:00 2001
+From: Haiqing Bai <Haiqing.Bai@windriver.com>
+Date: Fri, 18 Mar 2016 15:59:21 +0800
+Subject: [PATCH 3/3] remove des in pkcs11.
+
+Upstream-status: Pending
+
+Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
+
+---
+ pkcs11.h | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/pkcs11.h b/pkcs11.h
+index b01d58f..98b36e6 100644
+--- a/pkcs11.h
++++ b/pkcs11.h
+@@ -342,9 +342,11 @@ typedef unsigned long ck_key_type_t;
+ #define CKK_GENERIC_SECRET	(0x10)
+ #define CKK_RC2			(0x11)
+ #define CKK_RC4			(0x12)
++#ifndef OPENSSL_NO_DES
+ #define CKK_DES			(0x13)
+ #define CKK_DES2		(0x14)
+ #define CKK_DES3		(0x15)
++#endif /* OPENSSL_NO_DES */
+ #define CKK_CAST		(0x16)
+ #define CKK_CAST3		(0x17)
+ #define CKK_CAST128		(0x18)
+@@ -512,6 +514,7 @@ typedef unsigned long ck_mechanism_type_t;
+ #define CKM_RC2_CBC_PAD			(0x105)
+ #define CKM_RC4_KEY_GEN			(0x110)
+ #define CKM_RC4				(0x111)
++#ifndef OPENSSL_NO_DES
+ #define CKM_DES_KEY_GEN			(0x120)
+ #define CKM_DES_ECB			(0x121)
+ #define CKM_DES_CBC			(0x122)
+@@ -525,6 +528,7 @@ typedef unsigned long ck_mechanism_type_t;
+ #define CKM_DES3_MAC			(0x134)
+ #define CKM_DES3_MAC_GENERAL		(0x135)
+ #define CKM_DES3_CBC_PAD		(0x136)
++#endif /* OPENSSL_NO_DES */
+ #define CKM_CDMF_KEY_GEN		(0x140)
+ #define CKM_CDMF_ECB			(0x141)
+ #define CKM_CDMF_CBC			(0x142)
+@@ -610,8 +614,10 @@ typedef unsigned long ck_mechanism_type_t;
+ #define CKM_MD5_KEY_DERIVATION		(0x390)
+ #define CKM_MD2_KEY_DERIVATION		(0x391)
+ #define CKM_SHA1_KEY_DERIVATION		(0x392)
++#ifndef OPENSSL_NO_DES
+ #define CKM_PBE_MD2_DES_CBC		(0x3a0)
+ #define CKM_PBE_MD5_DES_CBC		(0x3a1)
++#endif /* OPENSSL_NO_DES */
+ #define CKM_PBE_MD5_CAST_CBC		(0x3a2)
+ #define CKM_PBE_MD5_CAST3_CBC		(0x3a3)
+ #define CKM_PBE_MD5_CAST5_CBC		(0x3a4)
+@@ -620,8 +626,10 @@ typedef unsigned long ck_mechanism_type_t;
+ #define CKM_PBE_SHA1_CAST128_CBC	(0x3a5)
+ #define CKM_PBE_SHA1_RC4_128		(0x3a6)
+ #define CKM_PBE_SHA1_RC4_40		(0x3a7)
++#ifndef OPENSSL_NO_DES
+ #define CKM_PBE_SHA1_DES3_EDE_CBC	(0x3a8)
+ #define CKM_PBE_SHA1_DES2_EDE_CBC	(0x3a9)
++#endif /* OPENSSL_NO_DES */
+ #define CKM_PBE_SHA1_RC2_128_CBC	(0x3aa)
+ #define CKM_PBE_SHA1_RC2_40_CBC		(0x3ab)
+ #define CKM_PKCS5_PBKD2			(0x3b0)
+-- 
+1.9.1
+
diff --git a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
index 01b5d50..21eefab 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
@@ -23,6 +23,8 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
            file://CVE-2015-8325.patch \
+           file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
+           file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
-- 
2.8.1


