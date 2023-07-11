Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98BA1EB64DD
	for <webhook@archiver.kernel.org>; Tue, 11 Jul 2023 16:22:27 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.430.1689092540561493666
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jul 2023 09:22:21 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@baylibre-com.20221208.gappssmtp.com header.s=20221208 header.b=ssEykxOM;
 spf=pass (domain: baylibre.com, ip: 209.85.160.169, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-40320e38b64so50892841cf.2
        for <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 09:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1689092539; x=1691684539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=pu4i+cZI3+6xd1g2lP1XMedbO2iCR/FW51nOhe8wH1A=;
        b=ssEykxOMy5qng8LGIu/p04jYwnlktldzrYhPIKXumtmI8NIgyP5FEvcu3AjoxfLRV5
         I7bsQufT9JH2iPUP01Ksd96ypBcUkbt+a/xtj8MldxRJme2JuohjiIv9FKRyuUDtLC0h
         XRKOvWF4dbWl1/SqJbnyv0U776hrXXlRrgfRDg/myoFujXnm7+fmBsnpC6G9sX/1AVg+
         tNQH36aQj5R1NFaCsGxOGNxMC/At3wsl4XcOBh+pDJ31P4TSXTn+WAylcTdwgA8dksBv
         CTVT8JhtjFimc24t9IyAWXMCZSjxTH78S91OVsh4+UnnlmhB2kzYIH+k3CtzowZJE64X
         L1aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689092539; x=1691684539;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pu4i+cZI3+6xd1g2lP1XMedbO2iCR/FW51nOhe8wH1A=;
        b=GF/WcFzCUP6gmmxJBD8vYitTkbTAmowkxDblzdU6aaEDTsKn04CR8eiloZZgjUSsgG
         3Z/5P9dm4xukgkTgM/WGHThVkYQ9BQdbNn7cj0KLJFxSktLe3K9Xikuxllifa+K9rxig
         yugD9e8qOUg3M9smJZ10iMbBhRwqXH7+yM85e2asSyzLqcU3y/YC/v2CHVlIwYD5x2z7
         qXZLsWZcuNzHAuvytDqu1TWGQ7BB2P6EwcWUUjBcihzxz3Sfa0jYoB4ltssTEKM9UhdW
         yEW7KkNNvJBnxV/oNZnfoPRJFOG22TYfefXbuhSly4tQ3ULvK7VWIW344lTENgwvp8Qx
         JeqA==
X-Gm-Message-State: ABy/qLbCladYsxK8e4CEJ0h2M3m07AfLmFeJsr4Tkf68Cx08CbpAeRBr
	eBHYSQrUfFHlFnBwXOqxhNUjUtqzTcXYHkZuVl4=
X-Google-Smtp-Source: APBJJlFkE4ONssKIpEFbnqSxW5CG993z2rwcTZVmHGKysE41jbg2vy3GcMF9ECNzC/paRsZZQcM+eQ==
X-Received: by 2002:ac8:7d03:0:b0:403:aa49:606e with SMTP id g3-20020ac87d03000000b00403aa49606emr10669067qtb.30.1689092539305;
        Tue, 11 Jul 2023 09:22:19 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id q11-20020ac8450b000000b003f7fd3ce69fsm1238605qtn.59.2023.07.11.09.22.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jul 2023 09:22:18 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] qemu: upgrade 8.0.0 -> 8.0.3
Date: Tue, 11 Jul 2023 12:22:15 -0400
Message-ID: <20230711162217.4110128-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 11 Jul 2023 16:22:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/184146

ppc.patch is removed because it is included in 8.0.3:
https://github.com/qemu/qemu/commit/864ce70c1c747898063cc2df854920d354b1b78f

General changelog for 8.x: https://wiki.qemu.org/ChangeLog/8.0

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 ...u-native_8.0.0.bb => qemu-native_8.0.3.bb} |   0
 ...e_8.0.0.bb => qemu-system-native_8.0.3.bb} |   0
 meta/recipes-devtools/qemu/qemu.inc           |   3 +-
 meta/recipes-devtools/qemu/qemu/ppc.patch     | 148 ------------------
 .../qemu/{qemu_8.0.0.bb => qemu_8.0.3.bb}     |   0
 5 files changed, 1 insertion(+), 150 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_8.0.0.bb => qemu-native_8.0.3.bb} (100%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_8.0.0.bb => qemu-system-native_8.0.3.bb} (100%)
 delete mode 100644 meta/recipes-devtools/qemu/qemu/ppc.patch
 rename meta/recipes-devtools/qemu/{qemu_8.0.0.bb => qemu_8.0.3.bb} (100%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_8.0.0.bb b/meta/recipes-devtools/qemu/qemu-native_8.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-native_8.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-native_8.0.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_8.0.0.bb b/meta/recipes-devtools/qemu/qemu-system-native_8.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu-system-native_8.0.0.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_8.0.3.bb
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a5bdeef66d..f343dba75d 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,11 +30,10 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
-           file://ppc.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "bb60f0341531181d6cc3969dd19a013d0427a87f918193970d9adb91131e56d0"
+SRC_URI[sha256sum] = "ecf4d32cbef9d397bfc8cc50e4d1e92a1b30253bf32e8ee73c7a8dcf9a232b09"
 
 SRC_URI:append:class-target = " file://cross.patch"
 SRC_URI:append:class-nativesdk = " file://cross.patch"
diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-devtools/qemu/qemu/ppc.patch
deleted file mode 100644
index e14c48cf85..0000000000
--- a/meta/recipes-devtools/qemu/qemu/ppc.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 31f02021ac17442c514593f7b9ed750ea87c21b1 Mon Sep 17 00:00:00 2001
-From: Richard Purdie <richard.purdie@linuxfoundation.org>
-Date: Sat, 6 May 2023 07:42:35 +0100
-Cc: Víctor Colombo <victor.colombo@eldorado.org.br>
-Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
-Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
-Cc: Richard Henderson <richard.henderson@linaro.org>
-Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
-Subject: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS* instructions on
- pre 3.0 ISAs
-
-The following commits changed the code such that the fallback to MFSS for MFFSCRN,
-MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
-
-  bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
-  394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
-  3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
-
-The hardware will handle them as a MFFS instruction as the code did previously.
-This means applications that were segfaulting under qemu when encountering these
-instructions which is used in glibc libm functions for example.
-
-The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
-
-This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
-as the hardware decoder would, fixing the segfaulting libm code. It doesn't have
-the fallback for 3.0 onwards to match hardware behaviour.
-
-Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
----
- target/ppc/insn32.decode           | 20 +++++++++++++-------
- target/ppc/translate/fp-impl.c.inc | 22 ++++++++++++++++------
- 2 files changed, 29 insertions(+), 13 deletions(-)
-
-v3 - drop fallback to MFFS for 3.0 ISA to match hardware
-v2 - switch to use decodetree pattern groups per feedback
-
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20230506065240.3177798-1-richard.purdie@linuxfoundation.org/]
-
-diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
-index f8f589e9fd..4fcf3af8d0 100644
---- a/target/ppc/insn32.decode
-+++ b/target/ppc/insn32.decode
-@@ -390,13 +390,19 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
- 
- ### Move To/From FPSCR
- 
--MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
--MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
--MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
--MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
--MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
--MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
--MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
-+{
-+  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
-+  MFFS_ISA207     111111 ..... ----- ----- 1001000111 .   @X_t_rc
-+  [
-+    MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
-+    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
-+    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
-+    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
-+    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
-+    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
-+    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
-+  ]
-+}
- 
- ### Decimal Floating-Point Arithmetic Instructions
- 
-diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
-index 57d8437851..874774eade 100644
---- a/target/ppc/translate/fp-impl.c.inc
-+++ b/target/ppc/translate/fp-impl.c.inc
-@@ -568,6 +568,22 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
-     gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
- }
- 
-+static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
-+{
-+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        /*
-+         * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any instruction
-+         * with OPCD=63 and XO=583 should be decoded as MFFS.
-+         */
-+        return trans_MFFS(ctx, a);
-+    }
-+    /*
-+     * For Power ISA v3.0+, return false and let the pattern group
-+     * select the correct instruction.
-+     */
-+    return false;
-+}
-+
- static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
- {
-     REQUIRE_FPU(ctx);
-@@ -584,7 +600,6 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
- {
-     TCGv_i64 fpscr;
- 
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-     REQUIRE_FPU(ctx);
- 
-     gen_reset_fpstatus();
-@@ -597,7 +612,6 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
- {
-     TCGv_i64 t1, fpscr;
- 
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-     REQUIRE_FPU(ctx);
- 
-     t1 = tcg_temp_new_i64();
-@@ -614,7 +628,6 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
- {
-     TCGv_i64 t1, fpscr;
- 
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-     REQUIRE_FPU(ctx);
- 
-     t1 = tcg_temp_new_i64();
-@@ -631,7 +644,6 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
- {
-     TCGv_i64 t1, fpscr;
- 
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-     REQUIRE_FPU(ctx);
- 
-     t1 = tcg_temp_new_i64();
-@@ -647,7 +659,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
- {
-     TCGv_i64 t1, fpscr;
- 
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-     REQUIRE_FPU(ctx);
- 
-     t1 = tcg_temp_new_i64();
-@@ -661,7 +672,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
- 
- static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
- {
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-     REQUIRE_FPU(ctx);
- 
-     gen_reset_fpstatus();
--- 
-2.39.2
-
diff --git a/meta/recipes-devtools/qemu/qemu_8.0.0.bb b/meta/recipes-devtools/qemu/qemu_8.0.3.bb
similarity index 100%
rename from meta/recipes-devtools/qemu/qemu_8.0.0.bb
rename to meta/recipes-devtools/qemu/qemu_8.0.3.bb
-- 
2.41.0


