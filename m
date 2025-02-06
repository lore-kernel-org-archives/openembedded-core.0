Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB170C02196
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 14:53:05 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.43122.1738853582729345073
 for <openembedded-core@lists.openembedded.org>;
 Thu, 06 Feb 2025 06:53:02 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 49FAE1CE0
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 06:53:25 -0800 (PST)
Received: from cesw-amp-gbt-1s-m12830-04.oss.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A8B993F58B
	for <openembedded-core@lists.openembedded.org>; Thu,  6 Feb 2025 06:53:01 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] openssl: fix register trampling on aarch64
Date: Thu,  6 Feb 2025 14:52:55 +0000
Message-ID: <20250206145255.4091151-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 06 Feb 2025 14:53:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210942

Backport a patch from upstream to fix register tramping on aarch64.

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../openssl/openssl/aarch64-regs.patch        | 52 +++++++++++++++++++
 .../openssl/openssl_3.4.0.bb                  |  1 +
 2 files changed, 53 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-reg=
s.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch=
 b/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
new file mode 100644
index 00000000000..f9773a6183d
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
@@ -0,0 +1,52 @@
+From 3ad2277e4522d363ae31a1888531915bb68964dc Mon Sep 17 00:00:00 2001
+From: Julian Andres Klode <julian.klode@canonical.com>
+Date: Sat, 18 Jan 2025 21:12:45 +0100
+Subject: [PATCH] Restore correct registers in aarch64 AES-CTR code
+
+Commit 1d1ca79fe35dbe5c05faed5a2ef8c4de9c5adc49 introduced
+save and restore for the registers, saving them as
+
+	stp		d8,d9,[sp, #16]
+	stp		d10,d11,[sp, #32]
+	stp		d12,d13,[sp, #48]
+	stp		d14,d15,[sp, #64]
+
+But the restore code was inadvertently typoed:
+
+	ldp		d8,d9,[sp, #16]
+	ldp		d10,d11,[sp, #32]
+	ldp		d12,d13,[sp, #48]
+	ldp		d15,d16,[sp, #64]
+
+Restoring [sp, #64] into d15,d16 instead of d14,d15.
+
+Fixes: #26466
+
+CLA: trivial
+
+Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
+Reviewed-by: Paul Dale <ppzgs1@gmail.com>
+Reviewed-by: Tomas Mraz <tomas@openssl.org>
+(Merged from https://github.com/openssl/openssl/pull/26469)
+
+(cherry picked from commit 5261f3ca41cda7ad5767e399e9a2dc008bbad5d6)
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ crypto/aes/asm/aesv8-armx.pl | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/crypto/aes/asm/aesv8-armx.pl b/crypto/aes/asm/aesv8-armx.pl
+index 33a2dd53dae19..dc019b04ccd25 100755
+--- a/crypto/aes/asm/aesv8-armx.pl
++++ b/crypto/aes/asm/aesv8-armx.pl
+@@ -2493,7 +2493,7 @@ ()
+ 	ldp		d8,d9,[sp, #16]
+ 	ldp		d10,d11,[sp, #32]
+ 	ldp		d12,d13,[sp, #48]
+-	ldp		d15,d16,[sp, #64]
++	ldp		d14,d15,[sp, #64]
+ 	ldr		x29,[sp],#80
+ 	ret
+ .size	${prefix}_ctr32_encrypt_blocks_unroll12_eor3,.-${prefix}_ctr32_en=
crypt_blocks_unroll12_eor3
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb b/meta/re=
cipes-connectivity/openssl/openssl_3.4.0.bb
index 9d99c21c208..cc413e39ba5 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "http://www.openssl.org/source/openssl-${PV=
}.tar.gz \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails=
.patch \
            file://0001-Fix-builds-on-riscv64-using-musl.patch \
+           file://aarch64-regs.patch \
            "
=20
 SRC_URI:append:class-nativesdk =3D " \
--=20
2.43.0


