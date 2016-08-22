Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id F19EA7328A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Aug 2016 12:23:28 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 22 Aug 2016 05:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,559,1464678000"; d="scan'208";a="751984601"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Aug 2016 05:23:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Aug 2016 15:23:15 +0300
Message-Id: <c87f21005468394388554efad65b94fc02404c85.1471868237.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
References: <7b711df547a725dd97f54a6c3524b7e505a2330d.1471868237.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1471868237.git.jussi.kukkonen@intel.com>
References: <cover.1471868237.git.jussi.kukkonen@intel.com>
Subject: [PATCH 9/9] openssh: Upgrade 7.2p2 -> 7.3p1
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
X-List-Received-Date: Mon, 22 Aug 2016 12:23:29 -0000

Remove CVE-2015-8325.patch as it's included upstream. Rebase another
patch.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../openssh/openssh/CVE-2015-8325.patch            | 39 ----------------------
 ...h-7.1p1-conditional-compile-des-in-cipher.patch | 30 +++++++++--------
 .../openssh/{openssh_7.2p2.bb => openssh_7.3p1.bb} |  5 ++-
 3 files changed, 18 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
 rename meta/recipes-connectivity/openssh/{openssh_7.2p2.bb => openssh_7.3p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
deleted file mode 100644
index 2263897..0000000
--- a/meta/recipes-connectivity/openssh/openssh/CVE-2015-8325.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 85bdcd7c92fe7ff133bbc4e10a65c91810f88755 Mon Sep 17 00:00:00 2001
-From: Damien Miller <djm@mindrot.org>
-Date: Wed, 13 Apr 2016 10:39:57 +1000
-Subject: ignore PAM environment vars when UseLogin=yes
-
-If PAM is configured to read user-specified environment variables
-and UseLogin=yes in sshd_config, then a hostile local user may
-attack /bin/login via LD_PRELOAD or similar environment variables
-set via PAM.
-
-CVE-2015-8325, found by Shayan Sadigh, via Colin Watson
-
-
-
-https://anongit.mindrot.org/openssh.git/commit/session.c?id=85bdcd7c92fe7ff133bbc4e10a65c91810f88755
-
-CVE: CVE-2015-8325
-Upstream-Status: Backport
-Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
----
- session.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/session.c b/session.c
-index 4859245..4653b09 100644
---- a/session.c
-+++ b/session.c
-@@ -1322,7 +1322,7 @@ do_setup_env(Session *s, const char *shell)
- 	 * Pull in any environment variables that may have
- 	 * been set by PAM.
- 	 */
--	if (options.use_pam) {
-+	if (options.use_pam && !options.use_login) {
- 		char **p;
- 
- 		p = fetch_pam_child_environment();
--- 
-cgit v0.11.2
-
diff --git a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
index 2e59589..2773c14 100644
--- a/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
+++ b/meta/recipes-connectivity/openssh/openssh/openssh-7.1p1-conditional-compile-des-in-cipher.patch
@@ -1,18 +1,18 @@
-From 1cd94ed4750d5392cf3c09ed64d2c162a0833bdb Mon Sep 17 00:00:00 2001
+From d7eb26785ad4f25fb09fae46726ab8ca3fe16921 Mon Sep 17 00:00:00 2001
 From: Haiqing Bai <Haiqing.Bai@windriver.com>
-Date: Fri, 18 Mar 2016 15:49:31 +0800
-Subject: [PATCH 2/3] remove des in cipher.
+Date: Mon, 22 Aug 2016 14:11:16 +0300
+Subject: [PATCH] Remove des in cipher.
 
 Upstream-Status: Pending
 
 Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
-
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
 ---
  cipher.c | 18 ++++++++++++++++++
  1 file changed, 18 insertions(+)
 
 diff --git a/cipher.c b/cipher.c
-index 02dae6f..63d3c29 100644
+index 031bda9..6cd667a 100644
 --- a/cipher.c
 +++ b/cipher.c
 @@ -53,8 +53,10 @@
@@ -26,7 +26,7 @@ index 02dae6f..63d3c29 100644
  #endif
  
  struct sshcipher {
-@@ -79,13 +81,17 @@ struct sshcipher {
+@@ -79,15 +81,19 @@ struct sshcipher {
  
  static const struct sshcipher ciphers[] = {
  #ifdef WITH_SSH1
@@ -34,17 +34,19 @@ index 02dae6f..63d3c29 100644
  	{ "des",	SSH_CIPHER_DES, 8, 8, 0, 0, 0, 1, EVP_des_cbc },
  	{ "3des",	SSH_CIPHER_3DES, 8, 16, 0, 0, 0, 1, evp_ssh1_3des },
 +#endif /* OPENSSL_NO_DES */
+ # ifndef OPENSSL_NO_BF
  	{ "blowfish",	SSH_CIPHER_BLOWFISH, 8, 32, 0, 0, 0, 1, evp_ssh1_bf },
+ # endif /* OPENSSL_NO_BF */
  #endif /* WITH_SSH1 */
  #ifdef WITH_OPENSSL
  	{ "none",	SSH_CIPHER_NONE, 8, 0, 0, 0, 0, 0, EVP_enc_null },
 +#ifndef OPENSSL_NO_DES
  	{ "3des-cbc",	SSH_CIPHER_SSH2, 8, 24, 0, 0, 0, 1, EVP_des_ede3_cbc },
 +#endif /* OPENSSL_NO_DES */
+ # ifndef OPENSSL_NO_BF
  	{ "blowfish-cbc",
  			SSH_CIPHER_SSH2, 8, 16, 0, 0, 0, 1, EVP_bf_cbc },
- 	{ "cast128-cbc",
-@@ -163,8 +169,10 @@ cipher_keylen(const struct sshcipher *c)
+@@ -171,8 +177,10 @@ cipher_keylen(const struct sshcipher *c)
  u_int
  cipher_seclen(const struct sshcipher *c)
  {
@@ -55,7 +57,7 @@ index 02dae6f..63d3c29 100644
  	return cipher_keylen(c);
  }
  
-@@ -201,11 +209,13 @@ u_int
+@@ -209,11 +217,13 @@ u_int
  cipher_mask_ssh1(int client)
  {
  	u_int mask = 0;
@@ -69,7 +71,7 @@ index 02dae6f..63d3c29 100644
  	return mask;
  }
  
-@@ -546,7 +556,9 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
+@@ -553,7 +563,9 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
  	switch (c->number) {
  #ifdef WITH_OPENSSL
  	case SSH_CIPHER_SSH2:
@@ -79,7 +81,7 @@ index 02dae6f..63d3c29 100644
  	case SSH_CIPHER_BLOWFISH:
  		evplen = EVP_CIPHER_CTX_iv_length(&cc->evp);
  		if (evplen == 0)
-@@ -569,8 +581,10 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
+@@ -576,8 +588,10 @@ cipher_get_keyiv(struct sshcipher_ctx *cc, u_char *iv, u_int len)
  		break;
  #endif
  #ifdef WITH_SSH1
@@ -90,7 +92,7 @@ index 02dae6f..63d3c29 100644
  #endif
  	default:
  		return SSH_ERR_INVALID_ARGUMENT;
-@@ -594,7 +608,9 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
+@@ -601,7 +615,9 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
  	switch (c->number) {
  #ifdef WITH_OPENSSL
  	case SSH_CIPHER_SSH2:
@@ -100,7 +102,7 @@ index 02dae6f..63d3c29 100644
  	case SSH_CIPHER_BLOWFISH:
  		evplen = EVP_CIPHER_CTX_iv_length(&cc->evp);
  		if (evplen <= 0)
-@@ -609,8 +625,10 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
+@@ -616,8 +632,10 @@ cipher_set_keyiv(struct sshcipher_ctx *cc, const u_char *iv)
  		break;
  #endif
  #ifdef WITH_SSH1
@@ -112,5 +114,5 @@ index 02dae6f..63d3c29 100644
  	default:
  		return SSH_ERR_INVALID_ARGUMENT;
 -- 
-1.9.1
+2.1.4
 
diff --git a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_7.2p2.bb
rename to meta/recipes-connectivity/openssh/openssh_7.3p1.bb
index 3df825b..b319726 100644
--- a/meta/recipes-connectivity/openssh/openssh_7.2p2.bb
+++ b/meta/recipes-connectivity/openssh/openssh_7.3p1.bb
@@ -22,15 +22,14 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://volatiles.99_sshd \
            file://add-test-support-for-busybox.patch \
            file://run-ptest \
-           file://CVE-2015-8325.patch \
            file://openssh-7.1p1-conditional-compile-des-in-cipher.patch \
            file://openssh-7.1p1-conditional-compile-des-in-pkcs11.patch \
            "
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "13009a9156510d8f27e752659075cced"
-SRC_URI[sha256sum] = "a72781d1a043876a224ff1b0032daa4094d87565a68528759c1c2cab5482548c"
+SRC_URI[md5sum] = "dfadd9f035d38ce5d58a3bf130b86d08"
+SRC_URI[sha256sum] = "3ffb989a6dcaa69594c3b550d4855a5a2e1718ccdde7f5e36387b424220fbecc"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.1.4


