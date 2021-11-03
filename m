Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B00AAC433FE
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 12:34:32 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web08.6722.1635942871237070087
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 05:34:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=kU0mSxXT;
 spf=pass (domain: gmail.com, ip: 209.85.221.43,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f43.google.com with SMTP id i5so3354949wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 05:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nAhjCYCp4f7cT5uLL6185G+tvprUSnuwpMpJRYDAloQ=;
        b=kU0mSxXT0M/YwqMvFsv9Iw5uofgqIF3IlKLPwU7wY0gdF+14WYtv3NmyydoTOveQeR
         c6X9AT48JmRv1YT0vEryzKSDj3R+ilIKsNtTnmBWrdJ+ZHutp9qWkuWFiSloieoewwy8
         Xdu4yZ/LPb/M0qNG5Iui0KSil3n5sxcEpjPAWGJfPQFF/nL6n7oYla8bOdzkenylt3fy
         1URZykt3Tox8NwS2RWb1jQdyfYKGKtvDKURDv8+9wvIL+qpxPL5+bqCAC8xL36KeIEJZ
         urlfLzI6MYqKD6dhrGLbplIWumFo+/oPAwqwGbczEXYqz/GD40Ewi6yeOAlFl1O8wIOC
         pIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nAhjCYCp4f7cT5uLL6185G+tvprUSnuwpMpJRYDAloQ=;
        b=iVfy/0o09co4VcN9PbPsutz6KxVYeXHPmd1TtauHrixGQ6577Zt2Zr0TfzygnNHwsM
         Wsqrkg7xyc1C05T8ivdEh/GioHIbDfTUpPCSt0m5wdTByYg238mMIQ0X7R7LN2XhbEn+
         ZKdQXwqI1x4xLpKPJ5OwYTSJwpw/8ffcWjqQBmLVBvS2oobSfXL7PKPnvMt2Q3KM5Bij
         QNaDPy2MQPU+SXricbxdWBUuNGNSCyZnJrA3G/L1fG4snxbYM/ajI1izY+0NdJXoh7rx
         YM7dAzoJAv/j/0k88Wde8bUKRI6N3ox2z37F209fY/Jh5pMP8Z7aWb+047ABKtfAy03X
         EzVQ==
X-Gm-Message-State: AOAM5331VdNOL/TnyfAf/QVREfY8o74wNcy+qOHIzmyLfj6Hq3rpK4yv
	gDp7860jjLAFIZJHKbuWO+rqioZrj+eD6Q==
X-Google-Smtp-Source: 
 ABdhPJxYBKY0Ar45snAhv7lC7usb2JH2D36C9Ol3ggSxOOF58LW3WFXXa8JnV0MeBdz3O4Khql+50w==
X-Received: by 2002:adf:df0c:: with SMTP id
 y12mr14160436wrl.168.1635942869341;
        Wed, 03 Nov 2021 05:34:29 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.144])
        by smtp.gmail.com with ESMTPSA id
 z7sm5029982wmi.33.2021.11.03.05.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 05:34:29 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [dunfell][meta-oe][PATCH] nss: add a patch for CVE-2020-12403
Date: Wed,  3 Nov 2021 13:34:20 +0100
Message-Id: <20211103123420.297271-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 12:34:32 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157828

From the description:
  A flaw was found in the way CHACHA20-POLY1305 was implemented in
  NSS in versions before 3.55. When using multi-part Chacha20,
  it could cause out-of-bounds reads.

The fix includes two patches: one checking the length, and the
other disabling the multi-part ChaCha20.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../nss/nss/CVE-2020-12403.patch              | 68 +++++++++++++
 .../nss/nss/CVE-2020-12403_2.patch            | 96 +++++++++++++++++++
 meta-oe/recipes-support/nss/nss_3.51.1.bb     |  2 +
 3 files changed, 166 insertions(+)
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12403.patch
 create mode 100644 meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch

diff --git a/meta-oe/recipes-support/nss/nss/CVE-2020-12403.patch b/meta-oe/recipes-support/nss/nss/CVE-2020-12403.patch
new file mode 100644
index 000000000..3ed8faf52
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2020-12403.patch
@@ -0,0 +1,68 @@
+From c6c2243be1a1359b4f22ffa51a90e84dc43b98d0 Mon Sep 17 00:00:00 2001
+From: Marta Rybczynska <marta.rybczynska@huawei.com>
+Date: Wed, 3 Nov 2021 12:12:37 +0100
+Subject: [PATCH] nss: fix CVE-2020-12403
+
+# HG changeset patch
+# User Benjamin Beurdouche <bbeurdouche@mozilla.com>
+# Date 1595031218 0
+# Node ID c25adfdfab34ddb08d3262aac3242e3399de1095
+# Parent  f282556e6cc7715f5754aeaadda6f902590e7e38
+Bug 1636771 - Fix incorrect call to Chacha20Poly1305 by PKCS11. r=jcj,kjacobs,rrelyea
+
+Differential Revision: https://phabricator.services.mozilla.com/D74801
+
+Upstream-Status: Backport
+
+CVE: CVE-2020-12403
+
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ .../pk11_gtest/pk11_chacha20poly1305_unittest.cc      | 11 +++++++++--
+ nss/lib/freebl/chacha20poly1305.c                     |  2 +-
+ 2 files changed, 10 insertions(+), 3 deletions(-)
+
+diff --git a/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc b/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc
+index 2663441..a461977 100644
+--- a/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc
++++ b/nss/gtests/pk11_gtest/pk11_chacha20poly1305_unittest.cc
+@@ -44,7 +44,7 @@ class Pkcs11ChaCha20Poly1305Test
+     SECItem params = {siBuffer, reinterpret_cast<unsigned char*>(&aead_params),
+                       sizeof(aead_params)};
+ 
+-    // Encrypt with bad parameters.
++    // Encrypt with bad parameters (TagLen is too long).
+     unsigned int encrypted_len = 0;
+     std::vector<uint8_t> encrypted(data_len + aead_params.ulTagLen);
+     aead_params.ulTagLen = 158072;
+@@ -53,9 +53,16 @@ class Pkcs11ChaCha20Poly1305Test
+                      &encrypted_len, encrypted.size(), data, data_len);
+     EXPECT_EQ(SECFailure, rv);
+     EXPECT_EQ(0U, encrypted_len);
+-    aead_params.ulTagLen = 16;
++
++    // Encrypt with bad parameters (TagLen is too short).
++    aead_params.ulTagLen = 2;
++    rv = PK11_Encrypt(key.get(), kMech, &params, encrypted.data(),
++                      &encrypted_len, encrypted.size(), data, data_len);
++    EXPECT_EQ(SECFailure, rv);
++    EXPECT_EQ(0U, encrypted_len);
+ 
+     // Encrypt.
++    aead_params.ulTagLen = 16;
+     rv = PK11_Encrypt(key.get(), kMech, &params, encrypted.data(),
+                       &encrypted_len, encrypted.size(), data, data_len);
+ 
+diff --git a/nss/lib/freebl/chacha20poly1305.c b/nss/lib/freebl/chacha20poly1305.c
+index 4daba2a..9d94f59 100644
+--- a/nss/lib/freebl/chacha20poly1305.c
++++ b/nss/lib/freebl/chacha20poly1305.c
+@@ -60,7 +60,7 @@ ChaCha20Poly1305_InitContext(ChaCha20Poly1305Context *ctx,
+         PORT_SetError(SEC_ERROR_BAD_KEY);
+         return SECFailure;
+     }
+-    if (tagLen == 0 || tagLen > 16) {
++    if (tagLen != 16) {
+         PORT_SetError(SEC_ERROR_INPUT_LEN);
+         return SECFailure;
+     }
diff --git a/meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch b/meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch
new file mode 100644
index 000000000..18b1e58bf
--- /dev/null
+++ b/meta-oe/recipes-support/nss/nss/CVE-2020-12403_2.patch
@@ -0,0 +1,96 @@
+From 930bc9c5b0f9e6ed8dc9f9cd237eede41591a64e Mon Sep 17 00:00:00 2001
+From: Marta Rybczynska <marta.rybczynska@huawei.com>
+Date: Wed, 3 Nov 2021 12:21:44 +0100
+Subject: [PATCH] nss: followup CVE-2020-12403
+
+# HG changeset patch
+# User Benjamin Beurdouche <bbeurdouche@mozilla.com>
+# Date 1595031194 0
+# Node ID f282556e6cc7715f5754aeaadda6f902590e7e38
+# Parent  89733253df83ef7fe8dd0d49f6370b857e93d325
+Bug 1636771 - Disable PKCS11 incremental mode for ChaCha20. r=kjacobs,rrelyea
+
+Depends on D74801
+
+Differential Revision: https://phabricator.services.mozilla.com/D83994
+
+Upstream-Status: Backport
+
+CVE: CVE-2020-12403
+
+Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
+---
+ .../pk11_gtest/pk11_cipherop_unittest.cc      | 49 +++++++++++++++++++
+ nss/lib/softoken/pkcs11c.c                    |  1 +
+ 2 files changed, 50 insertions(+)
+
+diff --git a/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc b/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc
+index 38982fd..700750c 100644
+--- a/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc
++++ b/nss/gtests/pk11_gtest/pk11_cipherop_unittest.cc
+@@ -77,4 +77,53 @@ TEST(Pkcs11CipherOp, SingleCtxMultipleUnalignedCipherOps) {
+   NSS_ShutdownContext(globalctx);
+ }
+ 
++TEST(Pkcs11CipherOp, SingleCtxMultipleUnalignedCipherOpsChaCha20) {
++  PK11SlotInfo* slot;
++  PK11SymKey* key;
++  PK11Context* ctx;
++
++  NSSInitContext* globalctx =
++      NSS_InitContext("", "", "", "", NULL,
++                      NSS_INIT_READONLY | NSS_INIT_NOCERTDB | NSS_INIT_NOMODDB |
++                          NSS_INIT_FORCEOPEN | NSS_INIT_NOROOTINIT);
++
++  const CK_MECHANISM_TYPE cipher = CKM_NSS_CHACHA20_CTR;
++
++  slot = PK11_GetInternalSlot();
++  ASSERT_TRUE(slot);
++
++  // Use arbitrary bytes for the ChaCha20 key and IV
++  uint8_t key_bytes[32];
++  for (size_t i = 0; i < 32; i++) {
++    key_bytes[i] = i;
++  }
++  SECItem keyItem = {siBuffer, key_bytes, 32};
++
++  uint8_t iv_bytes[16];
++  for (size_t i = 0; i < 16; i++) {
++    key_bytes[i] = i;
++  }
++  SECItem ivItem = {siBuffer, iv_bytes, 16};
++
++  SECItem* param = PK11_ParamFromIV(cipher, &ivItem);
++
++  key = PK11_ImportSymKey(slot, cipher, PK11_OriginUnwrap, CKA_ENCRYPT,
++                          &keyItem, NULL);
++  ctx = PK11_CreateContextBySymKey(cipher, CKA_ENCRYPT, key, param);
++  ASSERT_TRUE(key);
++  ASSERT_TRUE(ctx);
++
++  uint8_t outbuf[128];
++  // This is supposed to fail for Chacha20. This is because the underlying
++  // PK11_CipherOp operation is calling the C_EncryptUpdate function for
++  // which multi-part is disabled for ChaCha20 in counter mode.
++  ASSERT_EQ(GetBytes(ctx, outbuf, 7), SECFailure);
++
++  PK11_FreeSymKey(key);
++  PK11_FreeSlot(slot);
++  SECITEM_FreeItem(param, PR_TRUE);
++  PK11_DestroyContext(ctx, PR_TRUE);
++  NSS_ShutdownContext(globalctx);
++}
++
+ }  // namespace nss_test
+diff --git a/nss/lib/softoken/pkcs11c.c b/nss/lib/softoken/pkcs11c.c
+index 6f3c2aa..53ec5f4 100644
+--- a/nss/lib/softoken/pkcs11c.c
++++ b/nss/lib/softoken/pkcs11c.c
+@@ -1205,6 +1205,7 @@ sftk_CryptInit(CK_SESSION_HANDLE hSession, CK_MECHANISM_PTR pMechanism,
+             break;
+ 
+         case CKM_NSS_CHACHA20_CTR:
++            context->multi = PR_FALSE;
+             if (key_type != CKK_NSS_CHACHA20) {
+                 crv = CKR_KEY_TYPE_INCONSISTENT;
+                 break;
diff --git a/meta-oe/recipes-support/nss/nss_3.51.1.bb b/meta-oe/recipes-support/nss/nss_3.51.1.bb
index ac046ed0f..220610dea 100644
--- a/meta-oe/recipes-support/nss/nss_3.51.1.bb
+++ b/meta-oe/recipes-support/nss/nss_3.51.1.bb
@@ -37,6 +37,8 @@ SRC_URI = "http://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/${VERSIO
            file://0001-Bug-1631576-Force-a-fixed-length-for-DSA-exponentiat.patch \
            file://CVE-2020-12401.patch \
            file://CVE-2020-6829_12400.patch \
+           file://CVE-2020-12403.patch \
+           file://CVE-2020-12403_2.patch \
            "
 
 SRC_URI[md5sum] = "6acaf1ddff69306ae30a908881c6f233"
-- 
2.33.0


