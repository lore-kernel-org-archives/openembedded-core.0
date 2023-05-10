Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 015EAC77B7C
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 11:26:09 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web10.14047.1683717966307804414
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 04:26:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=Fv98vUhs;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3075e802738so6307008f8f.1
        for <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 04:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683717964; x=1686309964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9wMQ+H6vQkxFdTCkDmY7aAaSd9klnSAO3cWgcE2nUyc=;
        b=Fv98vUhs9lzNQE0b+QhohIEx25xigR/7CaU5dj6te9ifsS2JZt1qbV7UCoH0PJcHfq
         oh8ysFESV6oJEI1+eM5G1kshtE+rJxII6c6PmUZbkRiSyz6RqqpjoiAteqH6zU/3dLrP
         51KR3buyZoAR3oq8xG9UrwUl6b89FC0FJtrBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683717964; x=1686309964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9wMQ+H6vQkxFdTCkDmY7aAaSd9klnSAO3cWgcE2nUyc=;
        b=B/T+KRIa/bbLJnhH/POQf69j9bCW3otwFXQ1uGMExnQ0Un2AwuO53uSFjx2HnLayXe
         ziSy0JpJFAFnVQMp4XPhUQItBSjLkAMdPn1LIOuedJQF/G+wyCOQUMQH9yFrLNAhknvG
         k1hfXTD4r24m1CrFVWTCokM1Y6gZ+g257ucP1iNBBE14pZXAmuRj7/YNe2QINfv/88uu
         c4Xt57rmeQW+WJZmTWF7Fx7iMLIGz4xbKD0AvD8KakdLIMYOb8sHt1OQT/pZEBVyMm6H
         sA8jLne0lAlQ2PCOXRVT2l3wamOZ9OXVXuxCGf0AsXeSYKL+gxSzizI4vgSVEHT1l4xK
         1PKQ==
X-Gm-Message-State: AC+VfDwlrq/MUWCkJAly0fDdQGWA0+mOLsyRfseApOdFa9dxQdfNogmm
	to3opHTPM8TWls3euJQgJJ04uKsyzDyUsfGyRE0=
X-Google-Smtp-Source: ACHHUZ6JYn9I+aiKyGJGn4ADSyojp5yFpVZRG8AW/BiaBWba37CSMap0h2RvcB+fldHWMiGM5SvIeQ==
X-Received: by 2002:a5d:6d46:0:b0:2fe:fd61:6426 with SMTP id k6-20020a5d6d46000000b002fefd616426mr11887665wri.11.1683717964378;
        Wed, 10 May 2023 04:26:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:97c0:2f0a:108:d273])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d5109000000b002ffbf2213d4sm16982761wrt.75.2023.05.10.04.26.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 May 2023 04:26:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Further updates to the ppc patch after upstream discussion
Date: Wed, 10 May 2023 12:26:03 +0100
Message-Id: <20230510112603.1720223-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 11:26:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181107

After someone tested real hardware, the patch needs tweaks to match the 3.0 ISA
behaviour. It won't change much from our perspective but may as well keep the
patch in sync.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu/ppc.patch | 89 +++++++++++------------
 1 file changed, 44 insertions(+), 45 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-devtools/qemu/qemu/ppc.patch
index 1fe6a3b4139..22d26e23d9b 100644
--- a/meta/recipes-devtools/qemu/qemu/ppc.patch
+++ b/meta/recipes-devtools/qemu/qemu/ppc.patch
@@ -1,11 +1,12 @@
-From d92b63b7d15d4fd202c5802dfe444a96f5d8109c Mon Sep 17 00:00:00 2001
+From 31f02021ac17442c514593f7b9ed750ea87c21b1 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Sat, 6 May 2023 07:42:35 +0100
 Cc: Víctor Colombo <victor.colombo@eldorado.org.br>
 Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
 Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
 Cc: Richard Henderson <richard.henderson@linaro.org>
-Subject: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS* instructions on
+Cc: Philippe Mathieu-Daudé <philmd@linaro.org>
+Subject: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS* instructions on
  pre 3.0 ISAs
 
 The following commits changed the code such that the fallback to MFSS for MFFSCRN,
@@ -22,25 +23,23 @@ instructions which is used in glibc libm functions for example.
 The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
 
 This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
-as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
-the MFSS instruction is used for currently reserved bits to handle other potential
-ISA additions more correctly.
-
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20230506065240.3177798-1-richard.purdie@linuxfoundation.org/]
+as the hardware decoder would, fixing the segfaulting libm code. It doesn't have
+the fallback for 3.0 onwards to match hardware behaviour.
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
 ---
- target/ppc/insn32.decode           | 19 ++++++++++++-------
- target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
- 2 files changed, 36 insertions(+), 13 deletions(-)
+ target/ppc/insn32.decode           | 20 +++++++++++++-------
+ target/ppc/translate/fp-impl.c.inc | 22 ++++++++++++++++------
+ 2 files changed, 29 insertions(+), 13 deletions(-)
 
+v3 - drop fallback to MFFS for 3.0 ISA to match hardware
 v2 - switch to use decodetree pattern groups per feedback
 
 diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
-index f8f589e9fd..3c4e2c2fc2 100644
+index f8f589e9fd..4fcf3af8d0 100644
 --- a/target/ppc/insn32.decode
 +++ b/target/ppc/insn32.decode
-@@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
+@@ -390,13 +390,19 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
  
  ### Move To/From FPSCR
  
@@ -51,9 +50,11 @@ index f8f589e9fd..3c4e2c2fc2 100644
 -MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
 -MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
 -MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
-+{ 
++{
 +  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
++  MFFS_ISA207     111111 ..... ----- ----- 1001000111 .   @X_t_rc
 +  [
++    MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
 +    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 +    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
 +    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
@@ -61,84 +62,82 @@ index f8f589e9fd..3c4e2c2fc2 100644
 +    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
 +    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
 +  ]
-+  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
 +}
  
  ### Decimal Floating-Point Arithmetic Instructions
  
 diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
-index 57d8437851..10dfd91aa4 100644
+index 57d8437851..874774eade 100644
 --- a/target/ppc/translate/fp-impl.c.inc
 +++ b/target/ppc/translate/fp-impl.c.inc
-@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
- {
-     TCGv_i64 fpscr;
+@@ -568,6 +568,22 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
+     gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
+ }
  
--    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
++{
 +    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        return false;
++        /*
++         * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any instruction
++         * with OPCD=63 and XO=583 should be decoded as MFFS.
++         */
++        return trans_MFFS(ctx, a);
 +    }
++    /*
++     * For Power ISA v3.0+, return false and let the pattern group
++     * select the correct instruction.
++     */
++    return false;
++}
 +
+ static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
+ {
+     REQUIRE_FPU(ctx);
+@@ -584,7 +600,6 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
+ {
+     TCGv_i64 fpscr;
+ 
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
      REQUIRE_FPU(ctx);
  
      gen_reset_fpstatus();
-@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
+@@ -597,7 +612,6 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
  {
      TCGv_i64 t1, fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        return false;
-+    }
-+
      REQUIRE_FPU(ctx);
  
      t1 = tcg_temp_new_i64();
-@@ -614,7 +620,10 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
+@@ -614,7 +628,6 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
  {
      TCGv_i64 t1, fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        return false;
-+    }
-+
      REQUIRE_FPU(ctx);
  
      t1 = tcg_temp_new_i64();
-@@ -631,7 +640,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
+@@ -631,7 +644,6 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
  {
      TCGv_i64 t1, fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        return false;
-+    }
-+
      REQUIRE_FPU(ctx);
  
      t1 = tcg_temp_new_i64();
-@@ -647,7 +659,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
+@@ -647,7 +659,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
  {
      TCGv_i64 t1, fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        return false;
-+    }
-+
      REQUIRE_FPU(ctx);
  
      t1 = tcg_temp_new_i64();
-@@ -661,7 +676,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
+@@ -661,7 +672,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
  
  static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
  {
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
-+        return false;
-+    }
-+
      REQUIRE_FPU(ctx);
  
      gen_reset_fpstatus();
-- 
2.39.2


