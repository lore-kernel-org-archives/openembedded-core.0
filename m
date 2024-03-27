Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE418C54E67
	for <webhook@archiver.kernel.org>; Wed, 27 Mar 2024 11:16:26 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.35010.1711538180287455180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Mar 2024 04:16:20 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 014A82F4
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 04:16:54 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9C8073F694
	for <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 04:16:19 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Subject: [PATCH][nanbield] openssl: fix crash on aarch64 if BTI is enabled but no Crypto instructions
Date: Wed, 27 Mar 2024 11:16:15 +0000
Message-Id: <20240327111615.855840-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Mar 2024 11:16:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197553

From: Ross Burton <ross.burton@arm.com>

On aarch64, if the processor doesn't have the Crypto instructions then
OpenSSL will fall back onto the "bit-sliced" assembler routines. When
branch protection (BTI) was enabled in OpenSSL these routines were
missed, so if BTI is available libssl will immediately abort when it
enters this assembler.

Backport a patch submitted upstream to add the required call target
annotations so that BTI doesn't believe the code is being exploited.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/bti.patch                 | 58 +++++++++++++++++++
 .../openssl/openssl_3.1.5.bb                  |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/bti.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/bti.patch b/meta/r=
ecipes-connectivity/openssl/openssl/bti.patch
new file mode 100644
index 00000000000..748576c30ca
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/bti.patch
@@ -0,0 +1,58 @@
+From ba8a599395f8b770c76316b5f5b0f3838567014f Mon Sep 17 00:00:00 2001
+From: Tom Cosgrove <tom.cosgrove@arm.com>
+Date: Tue, 26 Mar 2024 13:18:00 +0000
+Subject: [PATCH] aarch64: fix BTI in bsaes assembly code
+
+In Arm systems where BTI is enabled but the Crypto extensions are not (m=
ore
+likely in FVPs than in real hardware), the bit-sliced assembler code wil=
l
+be used. However, this wasn't annotated with BTI instructions when BTI w=
as
+enabled, so the moment libssl jumps into this code it (correctly) aborts=
.
+
+Solve this by adding the missing BTI landing pads.
+
+Upstream-Status: Submitted [https://github.com/openssl/openssl/pull/2398=
2]
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ crypto/aes/asm/bsaes-armv8.pl | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/crypto/aes/asm/bsaes-armv8.pl b/crypto/aes/asm/bsaes-armv8.=
pl
+index b3c97e439f..c3c5ff3e05 100644
+--- a/crypto/aes/asm/bsaes-armv8.pl
++++ b/crypto/aes/asm/bsaes-armv8.pl
+@@ -1018,6 +1018,7 @@ _bsaes_key_convert:
+ //   Initialisation vector overwritten with last quadword of ciphertext
+ //   No output registers, usual AAPCS64 register preservation
+ ossl_bsaes_cbc_encrypt:
++        AARCH64_VALID_CALL_TARGET
+         cmp     x2, #128
+         bhs     .Lcbc_do_bsaes
+         b       AES_cbc_encrypt
+@@ -1270,7 +1271,7 @@ ossl_bsaes_cbc_encrypt:
+ //   Output text filled in
+ //   No output registers, usual AAPCS64 register preservation
+ ossl_bsaes_ctr32_encrypt_blocks:
+-
++        AARCH64_VALID_CALL_TARGET
+         cmp     x2, #8                      // use plain AES for
+         blo     .Lctr_enc_short             // small sizes
+=20
+@@ -1476,6 +1477,7 @@ ossl_bsaes_ctr32_encrypt_blocks:
+ //   Output ciphertext filled in
+ //   No output registers, usual AAPCS64 register preservation
+ ossl_bsaes_xts_encrypt:
++        AARCH64_VALID_CALL_TARGET
+         // Stack layout:
+         // sp ->
+         //        nrounds*128-96 bytes: key schedule
+@@ -1921,6 +1923,7 @@ ossl_bsaes_xts_encrypt:
+ //   Output plaintext filled in
+ //   No output registers, usual AAPCS64 register preservation
+ ossl_bsaes_xts_decrypt:
++        AARCH64_VALID_CALL_TARGET
+         // Stack layout:
+         // sp ->
+         //        nrounds*128-96 bytes: key schedule
+--=20
+2.34.1
+
diff --git a/meta/recipes-connectivity/openssl/openssl_3.1.5.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.1.5.bb
index 05bfeac45e3..174b5f6ad36 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.1.5.bb
@@ -12,6 +12,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from=
-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
+           file://bti.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.34.1


