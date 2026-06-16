Return-Path: <nmjain23@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C076CD98E1
	for <webhook@archiver.kernel.org>; Tue, 16 Jun 2026 11:14:07 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.151952.1781608438451494173
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 04:13:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UFWiACHm;
 spf=pass (domain: gmail.com, ip: 209.85.214.180, mailfrom: nmjain23@gmail.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c0c3546924so27657845ad.3
        for <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781608438; x=1782213238; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=a2PWu7PypReKOd/s/OLxs2gq7hq2aFAkbcIWyKHTQLM=;
        b=UFWiACHmQiEAcV2GKhrGiPBImXBrfPBr56dSgrvaDfBpQEuRiydN324zIVX+xhoWJF
         wrFL8Ute/DGTBGAJYA6RSxL6bZyxIhVbVFMVHpb5LLZ/vwDT2FuwWLkCkrPTFMb0ZYL6
         RN7GNBHs/TXgvSJ2AkLrzOeHjy1NidmEUTFpTzfDtzfycJfnvi8TYX7GR1lfdBnBnLqg
         O7LDDDwUUlKfcfVWKW3QhXiDTpua/jAspK3UH14SLWntkXN9uryN0eb80skz6xpAo/NG
         G7kU4WkQX/iC4DB5HCbX6S3n8Lp2r0Cn+p9DhFRto6tT7/qGYn+G7Vpbcn4JnJs39Lda
         dJuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608438; x=1782213238;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a2PWu7PypReKOd/s/OLxs2gq7hq2aFAkbcIWyKHTQLM=;
        b=b4/tvb3vQl3457CJVvC6PHt7YCXqdFTENusYOK5BIBkw7QC0NBPwvlA1MSxt53I0cx
         f3MlDbH8Tm2NTkbADP/YY6rsNpuhfwNJRzgZn6jt+M5IN8jchJh01ac/VxaEsvmuO1gS
         mwiZptxTim5Xw2FDPwCjEclV3fQl8Niz/gyGCRQg/mbSwcL4fvx8U6FLllAhcKXdtPMN
         rh6NEg44fuECicRXGUyHIxCJse1FLld4o8+Cn0RSeobypwbz67Nls4vrv47bPrYpwcXK
         /sWPf1z3WbqsuBglNViXC/5EzRaY80SYRlBJzslsDnj9JnuA2ufP7Kb1onIUrbZa6dYS
         0TFw==
X-Gm-Message-State: AOJu0YytkXa6lzRlbyzN6HzqrNfwmzx4ai08L3TvOmK16abKsZAUlMMd
	YZJv64cu3pIH9SWufwno3easM7hw9goh5++x1yCzbosxQVIgmMKfJtnvMsUBpg==
X-Gm-Gg: Acq92OGvNU5eFQf0fZOxGDruYzGhO5FhLd9JJGBDEWOtP67Ep4DVgOD4twHfLoI8Mjs
	sC02PalEK/C8MTXH4wUgAqNgVaiTg7lLZ6XBSuiSUNwm2PjE+cbRULa6JzEHcNgt2Yb6vDk/XCl
	20S7WiPRLK8XENBtgY/SFhToCtBKxfxMj7pI5pE2fJjav/WYlp5YXqbrHEdN6+K1vYYEUgnPYzd
	VSLbLL9ocwa/ktdDS2X/wMjcVZSfIebluNd/qenMXRJfd7m4zGjv3eBrwpjxpDkSrWZfoXeRzLv
	r7Jh06Dh9hnoGqxb5SYPk1x1tSQm7EHpX8BqbLdjUx+QIbjbYwEowGKpdwaXURNC1nQR/WFqKSf
	PuLg2ZxVjn62VYccgMOX1YDAbmS1sFKUlN9nNBhqbzz3P9qIzROeOtRsRMZi4vVp7cMuGEcUFkf
	EMjVuR9yPyFhCfRxJQfl9xBYQfWTho/+3ViAUVyQtbfhE8k69qslAu7fAI6Lk19oEQnu1yyODD
X-Received: by 2002:a17:902:fc4d:b0:2b0:7d3d:756a with SMTP id d9443c01a7336-2c6642c0c21mr162841275ad.35.1781608437569;
        Tue, 16 Jun 2026 04:13:57 -0700 (PDT)
Received: from LL-3450LLL.kpit.com ([103.133.67.152])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f7c5535sm130996435ad.18.2026.06.16.04.13.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:13:57 -0700 (PDT)
From: Naman Jain <nmjain23@gmail.com>
X-Google-Original-From: Naman Jain <naman.jain@partner.bmw.de>
To: openembedded-core@lists.openembedded.org
Subject: [meta][wrynose][PATCH] openssl: upgrade 3.5.6 -> 3.5.7
Date: Tue, 16 Jun 2026 16:43:41 +0530
Message-Id: <20260616111341.1385673-1-naman.jain@partner.bmw.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Jun 2026 11:14:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238889

From: Peter Marko <peter.marko@siemens.com>

Release information [1]:

OpenSSL 3.5.7 is a security patch release. The most severe CVE fixed in this release is High.
This release incorporates the following bug fixes and mitigations:
* Fixed heap use-after-free in PKCS7_verify(). (CVE-2026-45447)
* Fixed CMS AuthEnvelopedData processing may accept forged messages. (CVE-2026-34182)
* Fixed unbounded memory growth in the QUIC PATH_CHALLENGE handler. (CVE-2026-34183)
* Fixed NULL pointer dereference in QUIC server initial packet handling. (CVE-2026-42764)
* Fixed AES-OCB IV ignored on EVP_Cipher() path. (CVE-2026-45445)
* Fixed possible heap buffer overflow in ASN.1 multibyte string conversion. (CVE-2026-7383)
* Fixed out-of-bounds read in CMS password-based decryption. (CVE-2026-9076)
* Fixed heap buffer over-read in ASN.1 content parsing. (CVE-2026-34180)
* Fixed PKCS#12 files with PBMAC1 are accepted with short HMAC keys. (CVE-2026-34181)
* Fixed possible NULL dereference in password-dased CMS decryption. (CVE-2026-42766)
* Fixed NULL pointer dereference in CRMF EncryptedValue decryption. (CVE-2026-42767)
* Fixed multi-RecipientInfo Bleichenbacher Oracle in CMS_decrypt() and PKCS7_decrypt(). (CVE-2026-42768)
* Fixed trust anchor substitution via cert/issuer typo in CMP rootCaKeyUpdate. (CVE-2026-42769)
* Fixed FFC-DH peer validation uses attacker-supplied q. (CVE-2026-42770)
* Fixed incorrect tag processing for empty messages in AES-GCM-SIV and AES-SIV modes. (CVE-2026-45446)

Refreshed patches.
Installed new test files to pass ptests.

[1] https://github.com/openssl/openssl/blob/openssl-3.5/NEWS.md#major-changes-between-openssl-356-and-openssl-357-9-jun-2026

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50962b48a9e7b8b44bf1409d53aab03dd3686c99)
Signed-off-by: Naman Jain <namanj1@kpit.com>
---
 .../openssl/0001-Configure-do-not-tweak-mips-cflags.patch     | 2 +-
 .../openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb}            | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-connectivity/openssl/{openssl_3.5.6.bb => openssl_3.5.7.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
index cf5ff356ee..cd8906df67 100644
--- a/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
+++ b/meta/recipes-connectivity/openssl/openssl/0001-Configure-do-not-tweak-mips-cflags.patch
@@ -20,7 +20,7 @@ diff --git a/Configure b/Configure
 index fff97bd..5ee54c1 100755
 --- a/Configure
 +++ b/Configure
-@@ -1552,16 +1552,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
+@@ -1557,16 +1557,6 @@ if ($target =~ /^mingw/ && `$config{CC} --target-help 2>&1` =~ m/-mno-cygwin/m)
          push @{$config{shared_ldflag}}, "-mno-cygwin";
          }
  
diff --git a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.5.6.bb
rename to meta/recipes-connectivity/openssl/openssl_3.5.7.bb
index 6685654472..212879dfa3 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.5.6.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.5.7.bb
@@ -19,7 +19,7 @@ SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "deae7c80cba99c4b4f940ecadb3c3338b13cb77418409238e57d7f31f2a3b736"
+SRC_URI[sha256sum] = "a8c0d28a529ca480f9f36cf5792e2cd21984552a3c8e4aa11a24aa31aeac98e8"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"
@@ -223,7 +223,7 @@ do_install_ptest() {
 	ln -s ${bindir}/openssl ${D}${PTEST_PATH}/apps
 
 	cd ${S}
-	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
+	find test/certs test/ct test/d2i-tests test/recipes test/ocsp-tests test/ssl-tests test/smime-certs test/smime-eml -type f -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.cnf -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.der -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
 	find apps test -name \*.pem -exec install -m644 -D {} ${D}${PTEST_PATH}/{} \;
-- 
2.34.1


