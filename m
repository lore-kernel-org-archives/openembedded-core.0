Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFED7C77B7F
	for <webhook@archiver.kernel.org>; Fri,  5 May 2023 15:21:14 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web10.30346.1683300055376312560
 for <openembedded-core@lists.openembedded.org>;
 Fri, 05 May 2023 08:21:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=APkNgZT4;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-64115e652eeso20489049b3a.0
        for <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 08:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1683300066; x=1685892066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1FO8jIGMnOE3H3tKkZCwbpIgqSuAnwOFN7ZzJqqaUZ8=;
        b=APkNgZT4yDBQ7JYYjomQJ7BgEgCKJ03eoQznI6dr+siBoHuzUlK+4CqM/HcePxKEbm
         ovu3x1WPnIpXIPtL3KwnhD3DWRfUkvH6aQVyHWBW5Us+EDm1XXga85ibmpJqQ4xymq36
         x/mi554//ayGz+Cfhy3yxdgeFhriSzKgwC8c9oiwDWFTgbwNxmQY4v9H4gNMelm9J6KK
         TpMsF6phc7STyLP+QOj4aDVCLvf+KET4hyLlyuKW+1bEJ+yLhvLLzGzB0XFE6dYHr6h+
         D5Vd1PE9V/3sNRXAHabSqF5sKjYws/arASkkTy3qBFyWceuGq7xEY2pS4slll7QGuZSI
         rM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683300066; x=1685892066;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1FO8jIGMnOE3H3tKkZCwbpIgqSuAnwOFN7ZzJqqaUZ8=;
        b=Byn21xyONpppOet0XJS24IpWQkkRSSo4KQJW/DiQzYM/foAizZ1RZkJsFtf+lAxFKO
         uphFXMc0hfcF5GWU1bWxYV8/5qvzY2teQIMGD45IjaQ6XPmO4QgDjwfJYSNm/QOGJzRz
         s3eqNJYwgzpFvUofVImJN0m7HE99mjz1rt0ZKjKfol0zqbu5AvR3tTbY0pk2ruan3P63
         4AzUbB5Qsvm9SXS0NSLcbdE+8k3VFknZXPBx8eU1BMbFA3/bDUOm4YiNQHJitbIvGcAW
         AxIOcHB1L5y8ddEvsP8aj7SuJffH7fxYtguWoIvbubKpWYiKUBt4Cs6FO1z/X7nIFff6
         0Xlg==
X-Gm-Message-State: AC+VfDx4H1GX3/27v+kv3LftXmxsrzayVGgP1wH3v+hFwo9MMVvEVbbS
	Jn5n70pn5l1QM46XBgS1X4AiMdqcQpljvxOd5jQ=
X-Google-Smtp-Source: ACHHUZ4un3cCNxLc/MUF/5sq+wt+/YV6slX6irETGXTWOylJv9gplssGqYfWHQPJPFlx6LXEAlw0wA==
X-Received: by 2002:a05:6a00:4a04:b0:63b:7489:f77 with SMTP id do4-20020a056a004a0400b0063b74890f77mr5614784pfb.0.1683300066012;
        Fri, 05 May 2023 08:21:06 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c11-20020aa78c0b000000b00643864d03dfsm1831591pfd.171.2023.05.05.08.21.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 08:21:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 32/35] qemu: Add fix for powerpc instruction fallback issue
Date: Fri,  5 May 2023 05:19:43 -1000
Message-Id: <6a19b4a5f6eb7138ec6e79acf5c85c5d38f22d8f.1683299764.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1683299764.git.steve@sakoman.com>
References: <cover.1683299764.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 May 2023 15:21:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180952

From: Richard Purdie <richard.purdie@linuxfoundation.org>

See the patch for more details, fixes a regression in qemu causing
illegal instructions in libm on powerpc, triggered by a libinput
upgrade.

https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=f1c56cdff09f650ad721fae026eb6a3651631f3d
was the glibc code generating the instruction and triggering the issue.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/qemu/qemu.inc       |  1 +
 meta/recipes-devtools/qemu/qemu/ppc.patch | 70 +++++++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-devtools/qemu/qemu/ppc.patch

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index e2453dd8bc..29bc34d743 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -35,6 +35,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://0001-tracetool-use-relative-paths-for-line-preprocessor-d.patch \
            file://qemu-guest-agent.init \
            file://qemu-guest-agent.udev \
+           file://ppc.patch \
            "
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
diff --git a/meta/recipes-devtools/qemu/qemu/ppc.patch b/meta/recipes-devtools/qemu/qemu/ppc.patch
new file mode 100644
index 0000000000..395cdb814f
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
-- 
2.34.1


