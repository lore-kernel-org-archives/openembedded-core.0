Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AE69C7EE2D
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:31:57 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.70162.1684081909105383373
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:31:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=fzt2OZqo;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-64ab2a37812so14508835b3a.1
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081912; x=1686673912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xzc3zvi7lSAdmEbxNYQswOLQezEEOPnwEEB+h098cvg=;
        b=fzt2OZqoYjoLm46M6a2KZe4a5ticrJ2fFoVboYx9zzG2162suBFufHiozbe2bI9XZE
         vBrsK61VScFepEh9iWBWygnE2CSGpx4cM7E4ET8V9CQto7K6pDR/LoEqNeOQ/ip5UgqZ
         Yk4mXtB/PLD4JbiEvYTOHq3P/3ys+u3iYpZnVy7RwWFptCfi0DwULDyQ8cYuFGu6I/z8
         gFU8Ax77R+crFmlPxGwMJ5Xhw6vISZyVYiXGths+DuNOqdl0TY8vgVAiEElI6ff+yyEI
         gvfW0h7XnHJ0kYL9gVfnuEWLwjA4+GtGfJCvEu/PfpLpfUAEtz8zuSj4kZIJKkQ790s1
         XpXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081912; x=1686673912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xzc3zvi7lSAdmEbxNYQswOLQezEEOPnwEEB+h098cvg=;
        b=jOZ71CwFEE5k47UoYBBxn8ZbK0dLt8SHuvfCIea6bPN+BV4nOfigBNOCXJPQ+9sMzO
         4xFybr4GZVtxyr3Oa/hli4v0uribKtLRerafoxEAIvMW3RIunwzF86L+6UQMIuv48/9K
         I62mX6xeh7YJnuCK5pjZ+RLBcw9ywX6xCXb/CyagzXHtoOkbVKOoWZtJQJacW3wQq8bz
         0PaTAXTkLWshj6iPIVv8yANimk4KfETp/5vrE+dBMfvPHcT2LCKpVhZ66Fha4OoULV5M
         vEQwSggxsFb0TtQxVrSahZFWM5yQpKs60JxNI9iMKiQvUKdHlEWS5tUx0unJxAfD5M3e
         WREw==
X-Gm-Message-State: AC+VfDxgle//OBVPqkqebD9wJD0jY4cEU6Z0IewjP3ux3xN0L9Od4Y6d
	EqLKj58k4WEmCJ4/KTZaAEGTSJptBR3m3yo1JP4=
X-Google-Smtp-Source: ACHHUZ4UX/d3EpilZ1pdlUDM8USUDaf2b985ANIrQ2lr0b7oU16Oec2U5JVoRD5B/WMltKBz7LQplQ==
X-Received: by 2002:a05:6a00:3028:b0:643:a841:887a with SMTP id ay40-20020a056a00302800b00643a841887amr35448126pfb.4.1684081911511;
        Sun, 14 May 2023 09:31:51 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.31.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:31:51 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 03/15] qemu: Update ppc instruction fix to match revised upstream version
Date: Sun, 14 May 2023 06:31:28 -1000
Message-Id: <411e3f76840c06580fa8d2e764ae504b8f0ad46b.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:31:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181204

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Upstream asked for some changes, this updates our patch to match. The differences
likely don't change our real world use.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 42591e07a469cff881fa087d5251a8c783897634)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu/ppc.patch | 127 +++++++++++++++++-----
 1 file changed, 102 insertions(+), 25 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-devtools/qemu/qemu/ppc.patch
index 395cdb814f..4fce3c81ac 100644
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
+-- 
+2.39.2
+
-- 
2.34.1


