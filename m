Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53325C7EE21
	for <webhook@archiver.kernel.org>; Thu,  4 May 2023 11:12:56 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web11.46692.1683198770747478367
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 May 2023 04:12:51 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=KKIK2aTk;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.51, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-3f178da21b5so2579105e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 04:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1683198769; x=1685790769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=950WPAe9FOpQGtm9wfZMnGUZaPX0p8i1S4SETkdS5j8=;
        b=KKIK2aTkvMHaICL0aBUHk9rvNrI9KGNcVcueG2wWe0BFUQZcBtP+jCZXdttO5HLijt
         c/i2mvLzQj/ZBehkL2CJE0vFDfukuQ5MoQVw26PcDIlyzsM4qQz8cCX8gWbUpsyNbc4+
         TrdOGZdPkUs5Zv2U7+kwaDBn9lzmkPsOBNGKc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683198769; x=1685790769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=950WPAe9FOpQGtm9wfZMnGUZaPX0p8i1S4SETkdS5j8=;
        b=R7pW+jnOEer6j9rhHxbWgsp1vJL7eLd2JY3sGikrnsErSau/ovg0061V+B1pQ+ZApt
         HSIVEf0Isn0UCbaLG2hMjGHwfOATOnfLSo2ccXmAC7Nur+1SWVCUr0pUJexInZVYWztA
         OV9Q0EdFFK0mETYubVZkQ8oOkn7SDl4SovdmiNMMs/nD039EP+1MYQ4yjIZ8z1jCc2gs
         tVRkaeR7IdCBbBSU1ynO+O6JAF9j6/ZPRUQfH/EDovk5DsgXfG7AahY+0fj9b6z+aX6v
         ADB5E1oYuK3g755kXK2OlaNR+4m4GT2rmikkXzExG1ue95q3+7Hf2y1Zf6LlbzzSWORJ
         iN0A==
X-Gm-Message-State: AC+VfDw8es2QSdeWcxTAw5PHU+nW1kRjsS7prLKQn+6nwzHDeiaRUjTO
	hMFE2xyeKbh7WnTqyy3wsE8TxCp+ExuPzRtbX0I=
X-Google-Smtp-Source: ACHHUZ5DsaOUKKbuxcLsV6PJrk5jplIPgPBT6ltWOJDOLqMHchlbiBv0qbS5fzmDDD4KjycLH93MNw==
X-Received: by 2002:a05:600c:3789:b0:3f2:4f24:5f61 with SMTP id o9-20020a05600c378900b003f24f245f61mr17026266wmr.38.1683198768748;
        Thu, 04 May 2023 04:12:48 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:6749:5fda:5dc0:e535])
        by smtp.gmail.com with ESMTPSA id q20-20020a1ce914000000b003edc4788fa0sm4596028wmc.2.2023.05.04.04.12.48
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:12:48 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] qemu: Add fix for powerpc instruction fallback issue
Date: Thu,  4 May 2023 12:12:47 +0100
Message-Id: <20230504111247.3046210-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 May 2023 11:12:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180861

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
index 00000000000..7749096c403
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
+Upstream-Status: Pending
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


