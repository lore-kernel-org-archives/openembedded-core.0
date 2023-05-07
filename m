Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A17EC77B7D
	for <webhook@archiver.kernel.org>; Sun,  7 May 2023 08:37:51 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.62091.1683448668506986065
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 May 2023 01:37:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=OeR/b8fq;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-3f4000ec74aso22352715e9.3
        for <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 01:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683448667; x=1686040667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6j/B6xDrN22P/Qe+zrCtmIcjwRTXbfgTZ71PgbfslT0=;
        b=OeR/b8fqESVDRmnxBoOI82fdDzJr/dbNx+rpedz86dzKKtIB5L/gmkDjitUxUOqxK6
         Z5ht0452rNIZjsf4ltNva43f7en0CHJCO059siCQl3rx+RWzsjkDHyQh3WfERBfLf5G8
         kGcagJ9hQJeszluavmyPP6/Era104cNeUIPPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683448667; x=1686040667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6j/B6xDrN22P/Qe+zrCtmIcjwRTXbfgTZ71PgbfslT0=;
        b=AdI1NOAI09hKSJBP06pFtuY+qXPSi/PZ3Vo6F8Koj3HagOo0Ez6mrJ3H/LxjU9hrB6
         3LDSi1eeLaXdhHnWkfryYvQFKRTNLBmYGvvYFOClYcIZQpGMi8/iUAP2EfYbSognWSxd
         I0UG64MWsIf9tJRAMOyrF9pa+W1psihBRkoResuy93kwbBvTikPb0tz5sQ7tpqW06ttT
         PF+O+Sc/tygGoT98GBycQVonjBle1gp2X3pIyw5OjdR/pT9MDUDg3iMuK638c5DVoFG4
         2yhDb4Y7s1XPMXUyKqnxJNpUg/+YpFsOavjrlDqYxWP6YIJpUMuf7fbFHkIGiE5R4IQ5
         RWcw==
X-Gm-Message-State: AC+VfDznlwb904ZRT643xBUf0R/676vzUOV5JSmoTdd2Pf7fGhcEWWkP
	XhBaiR/j7wltf0OutYaXcFsOVM8kqNfwUJj+E8I=
X-Google-Smtp-Source: ACHHUZ6i4rjq+e48W0hkjk0qsyFTKIntkn7q4uYTxTDsD3Eg6HrDwZ8cjAyzfU0PULAexMaaa/O6gg==
X-Received: by 2002:a05:600c:2148:b0:3f1:75b6:8c7 with SMTP id v8-20020a05600c214800b003f175b608c7mr4795446wml.37.1683448666346;
        Sun, 07 May 2023 01:37:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4881:a654:eebf:9dd7])
        by smtp.gmail.com with ESMTPSA id t13-20020adfeb8d000000b003063ec828a4sm7542348wrn.117.2023.05.07.01.37.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 01:37:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Update ppc instruction fix to match revised upstream version
Date: Sun,  7 May 2023 09:37:44 +0100
Message-Id: <20230507083744.3244029-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 May 2023 08:37:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181003

Upstream asked for some changes, this updates our patch to match. The differences
likely don't change our real world use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu/ppc.patch | 127 +++++++++++++++++-----
 1 file changed, 102 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-devtools/qemu/qemu/ppc.patch
index ade1daf61ff..1fe6a3b4139 100644
--- a/meta/recipes-devtools/qemu/qemu/ppc.patch
+++ b/meta/recipes-devtools/qemu/qemu/ppc.patch
@@ -1,70 +1,147 @@
-target/ppc: Fix fallback to MFSS for MFFSCRN, MFFSCRNI, MFFSCE and MFFSL
+From d92b63b7d15d4fd202c5802dfe444a96f5d8109c Mon Sep 17 00:00:00 2001
+From: Richard Purdie <richard.purdie@linuxfoundation.org>
+Date: Sat, 6 May 2023 07:42:35 +0100
+Cc: Víctor Colombo <victor.colombo@eldorado.org.br>
+Cc: Matheus Ferst <matheus.ferst@eldorado.org.br>
+Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
+Cc: Richard Henderson <richard.henderson@linaro.org>
+Subject: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS* instructions on
+ pre 3.0 ISAs
 
-The following commits changed the code such that these instructions became invalid
-on pre 3.0 ISAs:
+The following commits changed the code such that the fallback to MFSS for MFFSCRN,
+MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:
 
-  bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree 
+  bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
   394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
-  3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree 
+  3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree
 
 The hardware will handle them as a MFFS instruction as the code did previously.
-Restore that behaviour. This means applications that were segfaulting under qemu 
-when encountering these instructions now operate correctly. The instruction
-is used in glibc libm functions for example.
+This means applications that were segfaulting under qemu when encountering these
+instructions which is used in glibc libm functions for example.
 
-Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20230504110150.3044402-1-richard.purdie@linuxfoundation.org/]
+The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.
+
+This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
+as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
+the MFSS instruction is used for currently reserved bits to handle other potential
+ISA additions more correctly.
+
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20230506065240.3177798-1-richard.purdie@linuxfoundation.org/]
 
 Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+---
+ target/ppc/insn32.decode           | 19 ++++++++++++-------
+ target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
+ 2 files changed, 36 insertions(+), 13 deletions(-)
 
-Index: qemu-8.0.0/target/ppc/translate/fp-impl.c.inc
-===================================================================
---- qemu-8.0.0.orig/target/ppc/translate/fp-impl.c.inc
-+++ qemu-8.0.0/target/ppc/translate/fp-impl.c.inc
-@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *c
+v2 - switch to use decodetree pattern groups per feedback
+
+diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
+index f8f589e9fd..3c4e2c2fc2 100644
+--- a/target/ppc/insn32.decode
++++ b/target/ppc/insn32.decode
+@@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
+ 
+ ### Move To/From FPSCR
+ 
+-MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
+-MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
+-MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+-MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
+-MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+-MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
+-MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
++{ 
++  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
++  [
++    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
++    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
++    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
++    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
++    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
++    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
++  ]
++  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
++}
+ 
+ ### Decimal Floating-Point Arithmetic Instructions
+ 
+diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
+index 57d8437851..10dfd91aa4 100644
+--- a/target/ppc/translate/fp-impl.c.inc
++++ b/target/ppc/translate/fp-impl.c.inc
+@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
  {
      TCGv_i64 fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-+        return trans_MFFS(ctx, a);
++    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
++        return false;
 +    }
 +
      REQUIRE_FPU(ctx);
  
      gen_reset_fpstatus();
-@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *
+@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
+ {
+     TCGv_i64 t1, fpscr;
+ 
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
++        return false;
++    }
++
+     REQUIRE_FPU(ctx);
+ 
+     t1 = tcg_temp_new_i64();
+@@ -614,7 +620,10 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
  {
      TCGv_i64 t1, fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-+        return trans_MFFS(ctx, a);
++    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
++        return false;
 +    }
 +
      REQUIRE_FPU(ctx);
  
      t1 = tcg_temp_new_i64();
-@@ -631,7 +637,10 @@ static bool trans_MFFSCRNI(DisasContext
+@@ -631,7 +640,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
  {
      TCGv_i64 t1, fpscr;
  
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-+        return trans_MFFS(ctx, a);
++    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
++        return false;
 +    }
 +
      REQUIRE_FPU(ctx);
  
      t1 = tcg_temp_new_i64();
-@@ -661,7 +670,10 @@ static bool trans_MFFSCDRNI(DisasContext
+@@ -647,7 +659,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
+ {
+     TCGv_i64 t1, fpscr;
+ 
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
++        return false;
++    }
++
+     REQUIRE_FPU(ctx);
+ 
+     t1 = tcg_temp_new_i64();
+@@ -661,7 +676,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
  
  static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
  {
 -    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
-+    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-+        return trans_MFFS(ctx, a);
++    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
++        return false;
 +    }
 +
      REQUIRE_FPU(ctx);
  
      gen_reset_fpstatus();
+-- 
+2.39.2
+
-- 
2.39.2


