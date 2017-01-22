Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D3C466076F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 22 Jan 2017 07:12:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v0M7ChqC006035
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 23:12:45 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.294.0;
	Sat, 21 Jan 2017 23:12:43 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 22 Jan 2017 02:12:40 -0500
Message-ID: <2063e2e996b41b766289b946d6585202094c211a.1485068874.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1485068874.git.dengke.du@windriver.com>
References: <cover.1485068874.git.dengke.du@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 1/1] openssh: upgrade to 7.4p1
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
X-List-Received-Date: Sun, 22 Jan 2017 07:12:45 -0000
Content-Type: text/plain

1. Drop CVE patch: fix-CVE-2016-8858.patch, because the version 7.4p1 have
   been fixed it.

2. Rebase the remaining patchs on the version 7.4p1.

Signed-off-by: Dengke Du <dengke.du@windriver.com>
---
 .../openssh/openssh/fix-CVE-2016-8858.patch        | 39 ----------------------
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 39 +++++++++++-----------
 ...h-7.1p1-conditional-compile-des-in-pkcs11.patch | 12 +++----
 .../openssh/{openssh_7.3p1.bb => openssh_7.4p1.bb} |  5 ++-
 4 files changed, 28 insertions(+), 67 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.3p1.bb => openssh_7.4p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch b/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
deleted file mode 100644
index b26ee81..0000000
--- a/meta/recipes-connectivity/openssh/openssh/fix-CVE-2016-8858.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Fix CVE-2016-8858 of openssh
-
-Backport patch from upstream and drop the change of comment which can NOT be applied.
-
-Upstream-Status: Backport [ https://anongit.mindrot.org/openssh.git/commit/?id=ec165c3 ]
-CVE: CVE-2016-8858
-
-Signed-off-by: Kai Kang <kai.kang@windriver.com>
----
-From ec165c392ca54317dbe3064a8c200de6531e89ad Mon Sep 17 00:00:00 2001
-From: "markus@openbsd.org" <markus@openbsd.org>
-Date: Mon, 10 Oct 2016 19:28:48 +0000
-Subject: [PATCH] upstream commit
-
-Unregister the KEXINIT handler after message has been
-received. Otherwise an unauthenticated peer can repeat the KEXINIT and cause
-allocation of up to 128MB -- until the connection is closed. Reported by
-shilei-c at 360.cn
-
-Upstream-ID: 43649ae12a27ef94290db16d1a98294588b75c05
----
- kex.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/kex.c b/kex.c
-index 3f97f8c..6a94bc5 100644
---- a/kex.c
-+++ b/kex.c
-@@ -481,6 +481,7 @@ kex_input_kexinit(int type, u_int32_t seq, void *ctxt)
- 	if (kex == NULL)
- 		return SSH_ERR_INVALID_ARGUMENT;
- 
-+	ssh_dispatch_set(ssh, SSH2_MSG_KEXINIT, NULL);
- 	ptr = sshpkt_ptr(ssh, &dlen);
- 	if ((r = sshbuf_put(kex->peer, ptr, dlen)) != 0)
- 		return r;
--- 
-2.10.1
-
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
index 2773c14..1098b97 100644
--- a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
@@ -1,18 +1,19 @@
-From d7eb26785ad4f25fb09fae46726ab8ca3fe16921 Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Mon, 22 Aug 2016 14:11:16 +0300
-Subject: [PATCH] Remove des in cipher.
+From 27740c918fe5d78441bcf69e7d2eefb23ddeca4c Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 19 Jan 2017 03:00:08 -0500
+Subject: [PATCH 1/3] Remove des in cipher.
 
 Upstream-Status: Pending
 
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
 Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  cipher.c | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)
 
 diff --git a/cipher.c b/cipher.c
-index 031bda9..6cd667a 100644
+index 2def333..59f6792 100644
 --- a/cipher.c
 +++ b/cipher.c
 @@ -53,8 +53,10 @@
@@ -25,8 +26,8 @@ index 031bda9..6cd667a 100644
 +#endif /* OPENSSL_NO_DES */
  #endif
  
- struct sshcipher {
-@@ -79,15 +81,19 @@ struct sshcipher {
+ struct sshcipher_ctx {
+@@ -88,15 +90,19 @@ struct sshcipher {
  
  static const struct sshcipher ciphers[] = {
  #ifdef WITH_SSH1
@@ -39,14 +40,14 @@ index 031bda9..6cd667a 100644
  # endif /* OPENSSL_NO_BF */
  #endif /* WITH_SSH1 */
  #ifdef WITH_OPENSSL
- 	{ "none",	SSH_CIPHER_NONE, 8, 0, 0, 0, 0, 0, EVP_enc_null },
 +#ifndef OPENSSL_NO_DES
+ 	{ "none",	SSH_CIPHER_NONE, 8, 0, 0, 0, 0, 0, EVP_enc_null },
  	{ "3des-cbc",	SSH_CIPHER_SSH2, 8, 24, 0, 0, 0, 1, EVP_des_ede3_cbc },
 +#endif /* OPENSSL_NO_DES */
  # ifndef OPENSSL_NO_BF
  	{ "blowfish-cbc",
  			SSH_CIPHER_SSH2, 8, 16, 0, 0, 0, 1, EVP_bf_cbc },
-@@ -171,8 +177,10 @@ cipher_keylen(const struct sshcipher *c)
+@@ -180,8 +186,10 @@ cipher_keylen(const struct sshcipher *c)
  u_int
  cipher_seclen(const struct sshcipher *c)
  {
@@ -57,7 +58,7 @@ index 031bda9..6cd667a 100644
  	return cipher_keylen(c);
  }
  
-@@ -209,11 +217,13 @@ u_int
+@@ -230,11 +238,13 @@ u_int
  cipher_mask_ssh1(int client)
  {
  	u_int mask = 0;
@@ -71,7 +72,7 @@ index 031bda9..6cd667a 100644
  	return mask;
  }
  
-@@ -553,7 +563,9 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
+@@ -606,7 +616,9 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
  	switch (c->number) {
  #ifdef WITH_OPENSSL
  	case SSH_CIPHER_SSH2:
@@ -79,20 +80,20 @@ index 031bda9..6cd667a 100644
  	case SSH_CIPHER_DES:
 +#endif /* OPENSSL_NO_DES */
  	case SSH_CIPHER_BLOWFISH:
- 		evplen = EVP_CIPHER_CTX_iv_length(&cc->evp);
+ 		evplen = EVP_CIPHER_CTX_iv_length(cc->evp);
  		if (evplen == 0)
-@@ -576,8 +588,10 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
+@@ -629,8 +641,10 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
  		break;
  #endif
  #ifdef WITH_SSH1
 +#ifndef OPENSSL_NO_DES
  	case SSH_CIPHER_3DES:
- 		return ssh1_3des_iv(&cc->evp, 0, iv, 24);
+ 		return ssh1_3des_iv(cc->evp, 0, iv, 24);
 +#endif /* OPENSSL_NO_DES */
  #endif
  	default:
  		return SSH_ERR_INVALID_ARGUMENT;
-@@ -601,7 +615,9 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
+@@ -654,7 +668,9 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
  	switch (c->number) {
  #ifdef WITH_OPENSSL
  	case SSH_CIPHER_SSH2:
@@ -100,19 +101,19 @@ index 031bda9..6cd667a 100644
  	case SSH_CIPHER_DES:
 +#endif /* OPENSSL_NO_DES */
  	case SSH_CIPHER_BLOWFISH:
- 		evplen = EVP_CIPHER_CTX_iv_length(&cc->evp);
+ 		evplen = EVP_CIPHER_CTX_iv_length(cc->evp);
  		if (evplen <= 0)
-@@ -616,8 +632,10 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
+@@ -675,8 +691,10 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
  		break;
  #endif
  #ifdef WITH_SSH1
 +#ifndef OPENSSL_NO_DES
  	case SSH_CIPHER_3DES:
- 		return ssh1_3des_iv(&cc->evp, 1, (u_char *)iv, 24);
+ 		return ssh1_3des_iv(cc->evp, 1, (u_char *)iv, 24);
 +#endif /* OPENSSL_NO_DES */
  #endif
  	default:
  		return SSH_ERR_INVALID_ARGUMENT;
 -- 
-2.1.4
+2.8.1
 
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
index 815af42..47dc73b 100644
--- a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-pkcs11.patch
@@ -1,12 +1,12 @@
-From 04cfd84423f693d879dc3ffebb0f6fe2680c254f Mon Sep 17 00:00:00 2001
-From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Fri, 18 Mar 2016 15:59:21 +0800
-Subject: [PATCH 3/3] remove des in pkcs11.
+From e816fc06e4f8070b09e677ead4d21768784e4c99 Mon Sep 17 00:00:00 2001
+From: Dengke Du <dengke.du@windriver.com>
+Date: Thu, 19 Jan 2017 03:21:40 -0500
+Subject: [PATCH 2/3] remove des in pkcs11.
 
 Upstream-Status: Pending
 
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-
+Signed-off-by: Dengke Du <dengke.du@windriver.com>
 ---
  pkcs11.h | 8 ++++++++
  1 file changed, 8 insertions(+)
@@ -66,5 +66,5 @@ index b01d58f..98b36e6 100644
  #define CKM_PBE_SHA1_RC2_40_CBC		(0x3ab)
  #define CKM_PKCS5_PBKD2			(0x3b0)
 -- 
-1.9.1
+2.8.1
 
diff --git a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_7.3p1.bb
rename to meta/recipes-connectivity/openssh/openssh_7.4p1.bb
index 94eb0ed..3b3d667 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.4p1.bb
@@ -25,13 +25,12 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            file://fix-potential-signed-overflow-in-pointer-arithmatic.patch \
-           file://fix-CVE-2016-8858.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "dfadd9f035d38ce5d58a3bf130b86d08"
-SRC_URI[sha256sum] = "3ffb989a6dcaa69594c3b550d4855a5a2e1718ccdde7f5e36387b424220fbecc"
+SRC_URI[md5sum] = "b2db2a83caf66a208bb78d6d287cdaa3"
+SRC_URI[sha256sum] = "1b1fc4a14e2024293181924ed24872e6f2e06293f3e8926a376b8aec481f19d1"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.8.1


