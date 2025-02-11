Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D59C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 18:38:26 +0000 (UTC)
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
 by mx.groups.io with SMTP id smtpd.web11.797.1739299103332904313
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Feb 2025 10:38:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=aJ+YD9R8;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.225, mailfrom: fm-256628-202502111838210e23d30203e3ee92e2-_x4bna@rts-flowmailer.siemens.com)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 202502111838210e23d30203e3ee92e2
        for <openembedded-core@lists.openembedded.org>;
        Tue, 11 Feb 2025 19:38:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=lRvbhPvp/jvj3fYfWA8EjLFnZqN6Q4afW9GBdziCr68=;
 b=aJ+YD9R8T0qRHfNi1NLDvT6OnUZJk9XGXhFNzCJ68EXyRo6x8nmPI2s/kNgssIdgUgp9ff
 alFHR/SngxkIjP8npmaR2mMUhjlvZ98t8RuB0xrHxDOQxt1HcPBhMyqANLZ5cjpjEG1NsXEA
 PuQrI/Bqt7SC76jOxbt4MMelVw6RXLuilk0qmSbGoKSQzgJCs/O/nGuHe198vte+pakECvSG
 RyEaaRUZMG7K+DbTQYCETXWCmBXXf+mYMkJ3c+4TNf5Sup0tC11yd8lVFU8hdFF5qcKyIJiQ
 VgfNpBj3ay5a52XapTczcFcOQ4MH7YdDw2oghUjou7/5vmRqcF64LKZw==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][PATCH] openssl: upgrade 3.4.0 -> 3.4.1
Date: Tue, 11 Feb 2025 19:37:33 +0100
Message-Id: <20250211183733.1609932-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Feb 2025 18:38:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211164

From: Peter Marko <peter.marko@siemens.com>

Release information:
https://github.com/openssl/openssl/blob/openssl-3.4/NEWS.md#major-changes-between-openssl-340-and-openssl-341-11-feb-2025

Handles CVE-2024-12797 and CVE-2024-13176.

Remove two patches included in the new version.

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 ...001-Fix-builds-on-riscv64-using-musl.patch | 36 -------------
 .../openssl/openssl/aarch64-regs.patch        | 52 -------------------
 .../{openssl_3.4.0.bb => openssl_3.4.1.bb}    |  4 +-
 3 files changed, 1 insertion(+), 91 deletions(-)
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
 delete mode 100644 meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
 rename meta/recipes-connectivity/openssl/{openssl_3.4.0.bb => openssl_3.4.1.bb} (98%)

diff --git a/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch b/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
deleted file mode 100644
index 0ec8c93748..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/0001-Fix-builds-on-riscv64-using-musl.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 9131291716073c4ea65a29575880a9d796c22ed6 Mon Sep 17 00:00:00 2001
-From: Matt Caswell <matt@openssl.org>
-Date: Wed, 23 Oct 2024 14:57:20 +0100
-Subject: [PATCH] Fix builds on riscv64 using musl
-
-Some environments using musl are reported to have the hwprobe.h include
-file but not have the __NR_riscv_hwprobe define.
-
-Fixes #25772
-
-Upstream-Status: Backport [https://github.com/openssl/openssl/pull/25787]
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- include/crypto/riscv_arch.h | 9 ++++++++-
- 1 file changed, 8 insertions(+), 1 deletion(-)
-
-diff --git a/include/crypto/riscv_arch.h b/include/crypto/riscv_arch.h
-index 4b3573f..8858427 100644
---- a/include/crypto/riscv_arch.h
-+++ b/include/crypto/riscv_arch.h
-@@ -15,7 +15,14 @@
- 
- # if defined(OPENSSL_SYS_LINUX) && !defined(FIPS_MODULE)
- #  if __has_include(<asm/hwprobe.h>)
--#   define OSSL_RISCV_HWPROBE
-+#   include <sys/syscall.h>
-+#   /*
-+     * Some environments using musl are reported to have the hwprobe.h include
-+     * file but not have the __NR_riscv_hwprobe define.
-+     */
-+#   ifdef __NR_riscv_hwprobe
-+#    define OSSL_RISCV_HWPROBE
-+#   endif
- #  endif
- # endif
- 
diff --git a/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch b/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
deleted file mode 100644
index f9773a6183..0000000000
--- a/meta/recipes-connectivity/openssl/openssl/aarch64-regs.patch
+++ /dev/null
@@ -1,52 +0,0 @@
-From 3ad2277e4522d363ae31a1888531915bb68964dc Mon Sep 17 00:00:00 2001
-From: Julian Andres Klode <julian.klode@canonical.com>
-Date: Sat, 18 Jan 2025 21:12:45 +0100
-Subject: [PATCH] Restore correct registers in aarch64 AES-CTR code
-
-Commit 1d1ca79fe35dbe5c05faed5a2ef8c4de9c5adc49 introduced
-save and restore for the registers, saving them as
-
-	stp		d8,d9,[sp, #16]
-	stp		d10,d11,[sp, #32]
-	stp		d12,d13,[sp, #48]
-	stp		d14,d15,[sp, #64]
-
-But the restore code was inadvertently typoed:
-
-	ldp		d8,d9,[sp, #16]
-	ldp		d10,d11,[sp, #32]
-	ldp		d12,d13,[sp, #48]
-	ldp		d15,d16,[sp, #64]
-
-Restoring [sp, #64] into d15,d16 instead of d14,d15.
-
-Fixes: #26466
-
-CLA: trivial
-
-Reviewed-by: Kurt Roeckx <kurt@roeckx.be>
-Reviewed-by: Paul Dale <ppzgs1@gmail.com>
-Reviewed-by: Tomas Mraz <tomas@openssl.org>
-(Merged from https://github.com/openssl/openssl/pull/26469)
-
-(cherry picked from commit 5261f3ca41cda7ad5767e399e9a2dc008bbad5d6)
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
----
- crypto/aes/asm/aesv8-armx.pl | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/crypto/aes/asm/aesv8-armx.pl b/crypto/aes/asm/aesv8-armx.pl
-index 33a2dd53dae19..dc019b04ccd25 100755
---- a/crypto/aes/asm/aesv8-armx.pl
-+++ b/crypto/aes/asm/aesv8-armx.pl
-@@ -2493,7 +2493,7 @@ ()
- 	ldp		d8,d9,[sp, #16]
- 	ldp		d10,d11,[sp, #32]
- 	ldp		d12,d13,[sp, #48]
--	ldp		d15,d16,[sp, #64]
-+	ldp		d14,d15,[sp, #64]
- 	ldr		x29,[sp],#80
- 	ret
- .size	${prefix}_ctr32_encrypt_blocks_unroll12_eor3,.-${prefix}_ctr32_encrypt_blocks_unroll12_eor3
diff --git a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
similarity index 98%
rename from meta/recipes-connectivity/openssl/openssl_3.4.0.bb
rename to meta/recipes-connectivity/openssl/openssl_3.4.1.bb
index cc413e39ba..ec7688b7af 100644
--- a/meta/recipes-connectivity/openssl/openssl_3.4.0.bb
+++ b/meta/recipes-connectivity/openssl/openssl_3.4.1.bb
@@ -12,15 +12,13 @@ SRC_URI = "http://www.openssl.org/source/openssl-${PV}.tar.gz \
            file://0001-buildinfo-strip-sysroot-and-debug-prefix-map-from-co.patch \
            file://0001-Configure-do-not-tweak-mips-cflags.patch \
            file://0001-Added-handshake-history-reporting-when-test-fails.patch \
-           file://0001-Fix-builds-on-riscv64-using-musl.patch \
-           file://aarch64-regs.patch \
            "
 
 SRC_URI:append:class-nativesdk = " \
            file://environment.d-openssl.sh \
            "
 
-SRC_URI[sha256sum] = "e15dda82fe2fe8139dc2ac21a36d4ca01d5313c75f99f46c4e8a27709b7294bf"
+SRC_URI[sha256sum] = "002a2d6b30b58bf4bea46c43bdd96365aaf8daa6c428782aa4feee06da197df3"
 
 inherit lib_package multilib_header multilib_script ptest perlnative manpages
 MULTILIB_SCRIPTS = "${PN}-bin:${bindir}/c_rehash"

