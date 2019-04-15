Return-Path: <vernon.mauery@linux.intel.com>
X-Greylist: delayed 571 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 15 Apr 2019 20:23:27 UTC
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 12B036C23A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2019 20:23:27 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 13:13:57 -0700
X-IronPort-AV: E=Sophos;i="5.60,354,1549958400"; d="scan'208";a="291798868"
Received: from vmauery-desk.jf.intel.com ([10.7.150.62])
	by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES128-GCM-SHA256;
	15 Apr 2019 13:13:57 -0700
From: Vernon Mauery <vernon.mauery@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Apr 2019 13:13:48 -0700
Message-Id: <20190415201348.19946-1-vernon.mauery@linux.intel.com>
X-Mailer: git-send-email 2.17.1
Cc: Vernon Mauery <vernon.mauery@linux.intel.com>
Subject: [PATCH] Update ipmitool to use new active source
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
X-List-Received-Date: Mon, 15 Apr 2019 20:23:28 -0000

The ipmitool project has moved from sourceforge to github and is under
new management. This updates the source so that it pulls directly from
git rather than a tarball. Eventually, once the next release is tagged,
the new SRCREV can be updated to that. But for now, the project is under
active development and could probably benefit from periodic updates
anyway.

The SRCREV and SRC_URI links point to code that already has been patched
to work with the new openssl 1.1 APIs, so the patch is no longer needed.

Signed-off-by: Vernon Mauery <vernon.mauery@linux.intel.com>
---
 .../0001-Migrate-to-openssl-1.1.patch         | 152 ------------------
 .../{ipmitool_1.8.18.bb => ipmitool_git.bb}   |   9 +-
 2 files changed, 3 insertions(+), 158 deletions(-)
 delete mode 100644 meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
 rename meta-oe/recipes-kernel/ipmitool/{ipmitool_1.8.18.bb => ipmitool_git.bb} (80%)

diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch b/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
deleted file mode 100644
index 394aa16ad..000000000
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool/0001-Migrate-to-openssl-1.1.patch
+++ /dev/null
@@ -1,152 +0,0 @@
-From c9dcb6afef9c343d070aaff208d11a997a45a105 Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Wed, 5 Sep 2018 22:19:38 -0700
-Subject: [PATCH] Migrate to openssl 1.1
-
-Upstream-Status: Backport [https://sourceforge.net/p/ipmitool/source/ci/1664902525a1c3771b4d8b3ccab7ea1ba6b2bdd1/]
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- src/plugins/lanplus/lanplus_crypt_impl.c | 50 ++++++++++++++----------
- 1 file changed, 29 insertions(+), 21 deletions(-)
-
-diff --git a/src/plugins/lanplus/lanplus_crypt_impl.c b/src/plugins/lanplus/lanplus_crypt_impl.c
-index d5fac37..9652a5e 100644
---- a/src/plugins/lanplus/lanplus_crypt_impl.c
-+++ b/src/plugins/lanplus/lanplus_crypt_impl.c
-@@ -164,11 +164,7 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 							uint8_t       * output,
- 							uint32_t        * bytes_written)
- {
--	EVP_CIPHER_CTX ctx;
--	EVP_CIPHER_CTX_init(&ctx);
--	EVP_EncryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
--	EVP_CIPHER_CTX_set_padding(&ctx, 0);
--	
-+	EVP_CIPHER_CTX *ctx = NULL;
- 
- 	*bytes_written = 0;
- 
-@@ -182,6 +178,14 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 		printbuf(input, input_length, "encrypting this data");
- 	}
- 
-+	ctx = EVP_CIPHER_CTX_new();
-+	if (ctx == NULL) {
-+		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
-+		return;
-+	}
-+	EVP_CIPHER_CTX_init(ctx);
-+	EVP_EncryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
-+	EVP_CIPHER_CTX_set_padding(ctx, 0);
- 
- 	/*
- 	 * The default implementation adds a whole block of padding if the input
-@@ -191,28 +195,28 @@ lanplus_encrypt_aes_cbc_128(const uint8_t * iv,
- 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
- 
- 
--	if(!EVP_EncryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
-+	if(!EVP_EncryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
- 	{
- 		/* Error */
- 		*bytes_written = 0;
--		return;
- 	}
- 	else
- 	{
- 		uint32_t tmplen;
- 
--		if(!EVP_EncryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
-+		if(!EVP_EncryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
- 		{
-+			/* Error */
- 			*bytes_written = 0;
--			return; /* Error */
- 		}
- 		else
- 		{
- 			/* Success */
- 			*bytes_written += tmplen;
--			EVP_CIPHER_CTX_cleanup(&ctx);
- 		}
- 	}
-+	/* performs cleanup and free */
-+	EVP_CIPHER_CTX_free(ctx);
- }
- 
- 
-@@ -239,11 +243,7 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 							uint8_t       * output,
- 							uint32_t        * bytes_written)
- {
--	EVP_CIPHER_CTX ctx;
--	EVP_CIPHER_CTX_init(&ctx);
--	EVP_DecryptInit_ex(&ctx, EVP_aes_128_cbc(), NULL, key, iv);
--	EVP_CIPHER_CTX_set_padding(&ctx, 0);
--
-+	EVP_CIPHER_CTX *ctx = NULL;
- 
- 	if (verbose >= 5)
- 	{
-@@ -252,12 +252,20 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 		printbuf(input, input_length, "decrypting this data");
- 	}
- 
--
- 	*bytes_written = 0;
- 
- 	if (input_length == 0)
- 		return;
- 
-+	ctx = EVP_CIPHER_CTX_new();
-+	if (ctx == NULL) {
-+		lprintf(LOG_DEBUG, "ERROR: EVP_CIPHER_CTX_new() failed");
-+		return;
-+	}
-+	EVP_CIPHER_CTX_init(ctx);
-+	EVP_DecryptInit_ex(ctx, EVP_aes_128_cbc(), NULL, key, iv);
-+	EVP_CIPHER_CTX_set_padding(ctx, 0);
-+
- 	/*
- 	 * The default implementation adds a whole block of padding if the input
- 	 * data is perfectly aligned.  We would like to keep that from happening.
-@@ -266,33 +274,33 @@ lanplus_decrypt_aes_cbc_128(const uint8_t * iv,
- 	assert((input_length % IPMI_CRYPT_AES_CBC_128_BLOCK_SIZE) == 0);
- 
- 
--	if (!EVP_DecryptUpdate(&ctx, output, (int *)bytes_written, input, input_length))
-+	if (!EVP_DecryptUpdate(ctx, output, (int *)bytes_written, input, input_length))
- 	{
- 		/* Error */
- 		lprintf(LOG_DEBUG, "ERROR: decrypt update failed");
- 		*bytes_written = 0;
--		return;
- 	}
- 	else
- 	{
- 		uint32_t tmplen;
- 
--		if (!EVP_DecryptFinal_ex(&ctx, output + *bytes_written, (int *)&tmplen))
-+		if (!EVP_DecryptFinal_ex(ctx, output + *bytes_written, (int *)&tmplen))
- 		{
-+			/* Error */
- 			char buffer[1000];
- 			ERR_error_string(ERR_get_error(), buffer);
- 			lprintf(LOG_DEBUG, "the ERR error %s", buffer);
- 			lprintf(LOG_DEBUG, "ERROR: decrypt final failed");
- 			*bytes_written = 0;
--			return; /* Error */
- 		}
- 		else
- 		{
- 			/* Success */
- 			*bytes_written += tmplen;
--			EVP_CIPHER_CTX_cleanup(&ctx);
- 		}
- 	}
-+	/* performs cleanup and free */
-+	EVP_CIPHER_CTX_free(ctx);
- 
- 	if (verbose >= 5)
- 	{
diff --git a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb b/meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
similarity index 80%
rename from meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
rename to meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
index b7f1aa914..cf6b9065d 100644
--- a/meta-oe/recipes-kernel/ipmitool/ipmitool_1.8.18.bb
+++ b/meta-oe/recipes-kernel/ipmitool/ipmitool_git.bb
@@ -14,7 +14,7 @@ Log (SEL), printing Field Replaceable Unit (FRU) information, reading and \
 setting LAN configuration, and chassis power control. \
 "
 
-HOMEPAGE = "http://ipmitool.sourceforge.net/"
+HOMEPAGE = "https://github.com/ipmitool/ipmitool"
 SECTION = "kernel/userland"
 
 LICENSE = "BSD-3-Clause"
@@ -22,11 +22,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=9aa91e13d644326bf281924212862184"
 
 DEPENDS = "openssl readline ncurses"
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/ipmitool/ipmitool-${PV}.tar.bz2 \
-           file://0001-Migrate-to-openssl-1.1.patch \
-           "
-SRC_URI[md5sum] = "bab7ea104c7b85529c3ef65c54427aa3"
-SRC_URI[sha256sum] = "0c1ba3b1555edefb7c32ae8cd6a3e04322056bc087918f07189eeedfc8b81e01"
+SRC_URI = "git://github.com/ipmitool/ipmitool.git;protocol=https"
+SRCREV = "b0d84e0f15b2120eaf9fe1301cf02c24eebcfb37"
 
 inherit autotools
 
-- 
2.17.1


