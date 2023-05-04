Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47B05C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:14:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.46722.1683198887936945569
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:14:48 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=AObPOHp1;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f178da21afso2711065e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:14:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683198886; x=1685790886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW2ltY7PwrdsY0qMdJ5jpLia9Nhc5X+FJ41Ei6l/ncM=;
        b=AObPOHp1Zjm+hDN+KutTWeEL0pnG08QOsr8y6mcNQRKGzY5XsU0zkzjsxbLpRuyckE
         KbKHpljoGddzgGT9TDK1b37LG8RLe65Qm7ygzuOfNje+zwK5mLuDneOkuQzn/5TeI4kN
         V1cbY4uW5bPtorYlaBmjuX8I8jkNYlp8/w5Pg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683198886; x=1685790886;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZW2ltY7PwrdsY0qMdJ5jpLia9Nhc5X+FJ41Ei6l/ncM=;
        b=kk/zRUnq37rpTuZ5P5S4ahMErt2tj56FEqPZTQgdpZMJbHQrGadm/uTAYU9dHD9spK
         tgaNFN+sw9Wgeo1cLqOf0PQnyoTRToA0CybWLEWeysbbsCkF+/Kz1dmFvFNKYWZBCdYl
         G12wxogsjnASOjh2Se/BRXQYS9Pg00so+nu+81ylrtOuk6QTJ9FWHf0ZqdzkYg/Um+cT
         N9IpOxk4jSPXQBHs4XFmeazlFnQYRPNmYGd6l7/v+Fxk75ZdfZIhFAF4SiM5TmTvU5Tr
         V6KrTA437/HyvGFIS8Kg5DV55dQzYQABxP3czr0/lC1qAI3fWK1YAJN0axHF3iNEPggN
         IbhA==
X-Gm-Message-State: AC+VfDwNY6yT4QwO0XNwQer1HWw/PQM1qTHqH8157cuB/xlIfzid2i51
	yUfyMCFXBJW2Q3e8VAFJiOl2vVWYT902Sm4R1AQ=
X-Google-Smtp-Source: ACHHUZ5uUnE6zimrknnrjnminJ77Nw7xhYrs7oTb0ZM5bF1rSqNw82k1h0JuJn9OtQEXFDghMjcYiQ==
X-Received: by 2002:a7b:c44e:0:b0:3f1:a71b:d46b with SMTP id l14-20020a7bc44e000000b003f1a71bd46bmr16447182wmi.41.1683198886127;
        Thu, 04 May 2023 04:14:46 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id a24-20020a05600c225800b003f349d14010sm4662610wmm.38.2023.05.04.04.14.45
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:14:45 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2] qemu: Add fix for powerpc instruction fallback issue
Date: Thu,  4 May 2023 12:14:45 +0100
Message-Id: <20230504111445.3046381-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:14:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180862

See the patch for more details, fixes a regression in qemu causing
illegal instructions in libm on powerpc, triggered by a libinput
upgrade.

https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f1c56cdff09f650ad721fae026eb6a3651631f3d
was the glibc code generating the instruction and triggering the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/recipes-devtools/qemu/qemu.inc       |  1 +
 meta/recipes-devtools/qemu/qemu/ppc.patch | 70 +++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/ppc.patch

v2 - add upstream status as submitted (failed to add to the index)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index a373c9e5774..2a9aa13912b 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -30,6 +30,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://ppc.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-devtools/qemu/qemu/ppc.patch
new file mode 100644
index 00000000000..ade1daf61ff
--- /dev/null
+++ b/meta/recipes-devtools/qemu/qemu/ppc.patch
@@ -0,0 +1,70 @@
+target/ppc: Fix fallback to MFSS for MFFSCRN, MFFSCRNI, MFFSCE and MFFSL
+
+The following commits changed the code such that these instructions became invalid
+on pre 3.0 ISAs:
+
+  bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree 
+  394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
+  3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree 
+
+The hardware will handle them as a MFFS instruction as the code did previously.
+Restore that behaviour. This means applications that were segfaulting under qemu 
+when encountering these instructions now operate correctly. The instruction
+is used in glibc libm functions for example.
+
+Upstream-Status: Submitted [https://lore.kernel.org/qemu-devel/20230504110150.3044402-1-richard.purdie@linuxfoundation.org/]
+
+Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
+
+Index: qemu-8.0.0/target/ppc/translate/fp-impl.c.inc
+===================================================================
+--- qemu-8.0.0.orig/target/ppc/translate/fp-impl.c.inc
++++ qemu-8.0.0/target/ppc/translate/fp-impl.c.inc
+@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *c
+ {
+     TCGv_i64 fpscr;
+ 
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
++        return trans_MFFS(ctx, a);
++    }
++
+     REQUIRE_FPU(ctx);
+ 
+     gen_reset_fpstatus();
+@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *
+ {
+     TCGv_i64 t1, fpscr;
+ 
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
++        return trans_MFFS(ctx, a);
++    }
++
+     REQUIRE_FPU(ctx);
+ 
+     t1 = tcg_temp_new_i64();
+@@ -631,7 +637,10 @@ static bool trans_MFFSCRNI(DisasContext
+ {
+     TCGv_i64 t1, fpscr;
+ 
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
++        return trans_MFFS(ctx, a);
++    }
++
+     REQUIRE_FPU(ctx);
+ 
+     t1 = tcg_temp_new_i64();
+@@ -661,7 +670,10 @@ static bool trans_MFFSCDRNI(DisasContext
+ 
+ static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
+ {
+-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
++    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
++        return trans_MFFS(ctx, a);
++    }
++
+     REQUIRE_FPU(ctx);
+ 
+     gen_reset_fpstatus();
-- 
2.39.2


