Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8161CA9EC9
	for <webhook@archiver.kernel.org>; Sun, 11 Oct 2026 08:41:50 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.23588.1791708101308108688
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2026 01:41:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=izuewGq6;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48afe0081a6so609257f8f.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1791708099; x=1792312899; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=y+/h+CeNecC7ZCX8QrR5HB0tJLtzxXhB55wiZToO7LU=;
        b=izuewGq6Z+278kFkpVJF7gTQ1tanWQLkKr1CIRsnUy/jpLC+iElXHiywCBcL8bxQOb
         Te6nufggCTA05RtY+19/7iSBixw5ag+wo3t6OAopiZb+z2FxSBbq1diW4PhG21Y1TOGS
         7K8/V8FEW7ZHz45vNuOncankogKxZ2l7Ts7VE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708099; x=1792312899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=y+/h+CeNecC7ZCX8QrR5HB0tJLtzxXhB55wiZToO7LU=;
        b=RGZiHXOZEZXaV7HpRGXEGc43bJcoGl/jnv6oC/J4jh2NfHExypd6ST2f8zeBXVBYot
         bwBZ5TLvll+9vds9H+w+nZA/bJ+os4+BdJhZaiZum1uENn6i80kcnq+GMMsy7+rJg7Zr
         CFVVTUmUGD53jFxPyuY65Rz/jgPft1I5ZlVvVs+oMcChqicQqfL27alM5OIb9x3MeETt
         SCo4y4fdt4g+5dYjrTYc6T+7G9RgtQ89YSQ4q0nyO4C1DilYutrWLieuEiuplykSXmn1
         r7jMC79/RS0CQKwg8nN7PhQSrEH19Ajxh3Lc6rOnAGpWREnzlAwNYTMH2WnLptG/h/+G
         6JIw==
X-Gm-Message-State: AFq9FYKN1nnksj91N0nkv4bLb8+TGv3UE3daMvEZMx7IQu6gZBmsKIGW
	Kp9fDrLzsyw+lxTK2VfwgXR+MZlsDsfCq62si6l8Sfmgh6MQpgs3GGQk4pgdppi7gL5wQ0fNZsT
	XoMJS+EU=
X-Gm-Gg: AYBFou3Xk10J0bS0ul7tsqWeO0UNl12Owl1OPt15Hx17hIeBVEjcdl3DxdKj3XaQjXJ
	12M+yJKTkUlDbmhRPUI4c6bK+of+DfInoP7etqW3LKZb1d13Hp5PHm4/s6OlUU02XAgkiol6rKq
	amruDKhUPcxMhdEqAP/SVaIwX+bNDyhaGZXvBg5/KCfD3qgvSab7JdONvvR9WREQ2xyGiXB1BAF
	WSaK1Ux3blD4Z4C1369cGxVT7n602AflYHyVV3UvjoMxL2azxf7O2MTnXjPYzkmfG/0usWW9ReQ
	+OKHaMnC7wzVUPbnYsex0RqsTrNKATVA1q4aC6540FncaRQ4spH8Zo0N/gKc+dLHyZH85IN3yRm
	JzDBGuVV8HUvPtGhfcNaOWDqg/Uvtx/NjaDtuH7VKzbFfOn8NokBGrWupPAO3C3SvXN7BTA7QKI
	GfyVetVzyXOOnKWad0GYeazurrJXGXqrjgmAwRy3RB4hq81PKzpHqL71/IbO0UljqgzRwtKv6tT
	n0GNU5KACZu3Ncr9Xr4OPyQmlvECB/B0/VD6bXJsPVguf0xFGjKxscCOl6HF4F0I8zGyl/Vyw==
X-Received: by 2002:a5d:5f8f:0:b0:48b:42c:8b44 with SMTP id ffacd0b85a97d-48dbaaee9bcmr11080666f8f.32.1791708099381;
        Sun, 11 Oct 2026 01:41:39 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48db9acfa28sm13481734f8f.51.2026.10.11.01.41.38
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:41:39 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 60/60] libpcre2: patch CVE-2026-103111
Date: Sun, 11 Oct 2026 10:40:33 +0200
Message-ID: <d1d174cf7d58aae5f00281aafcebc2fe11e41200.1791707817.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1791707817.git.yoann.congal@smile.fr>
References: <cover.1791707817.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Oct 2026 08:41:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247569

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] and [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-103111
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../libpcre/libpcre2/CVE-2026-103111.patch    | 111 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch
new file mode 100644
index 00000000000..6006566d840
--- /dev/null
+++ b/meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch
@@ -0,0 +1,111 @@
+From 2b4038298072684b0fae29b15bedfb1a75bda46d Mon Sep 17 00:00:00 2001
+From: Zoltan Herczeg <zherczeg@inf.u-szeged.hu>
+Date: Mon, 21 Sep 2026 07:46:13 +0000
+Subject: [PATCH] Fix large JIT stack allocation
+
+(GHSA-r9hj-j2rw-4q3m) Security fix to prevent an out of bounds write with
+arbitrary data. Applications are only affected if using the
+pcre2_jit_stack_assign() API to create a growable JIT stack, and then matching
+against a pattern with an extremely JIT stack usage, such as a large number of
+capturing groups.
+
+The implications of an out of bounds write could include arbitrary code
+execution.
+
+The issue is not a regression and affects releases 10.48 and earlier.
+
+CVE: CVE-2026-103111
+Upstream-Status: Backport [https://github.com/PCRE2Project/pcre2/commit/2b4038298072684b0fae29b15bedfb1a75bda46d]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/pcre2_jit_compile.c | 21 +++++++++++++++++++--
+ testdata/testinput17    |  5 +++++
+ testdata/testoutput17   |  6 ++++++
+ 3 files changed, 30 insertions(+), 2 deletions(-)
+
+diff --git a/src/pcre2_jit_compile.c b/src/pcre2_jit_compile.c
+index 105a1dd3..c5da883c 100644
+--- a/src/pcre2_jit_compile.c
++++ b/src/pcre2_jit_compile.c
+@@ -99,7 +99,7 @@ Fast, but limited size. */
+ 
+ /* Growth rate for stack allocated by the OS. Should be the multiply
+ of page size. */
+-#define STACK_GROWTH_RATE 8192
++#define STACK_GROWTH_RATE (sljit_sw)8192
+ 
+ /* Enable to check that the allocation could destroy temporaries. */
+ #if defined SLJIT_DEBUG && SLJIT_DEBUG
+@@ -472,6 +472,8 @@ typedef struct compiler_common {
+   BOOL local_quit_available;
+   /* Currently in a positive assertion. */
+   BOOL in_positive_assertion;
++  /* More than STACK_GROWTH_RATE / 2 stack memory is allocated. */
++  BOOL large_stack_allocation;
+   /* Newline control. */
+   int nltype;
+   sljit_u32 nlmax;
+@@ -3523,6 +3525,8 @@ static SLJIT_INLINE void allocate_stack(compiler_common *common, sljit_s32 size)
+ DEFINE_COMPILER;
+ 
+ SLJIT_ASSERT(size > 0);
++if (size > (STACK_GROWTH_RATE / (SSIZE_OF(sw) * 2)))
++  common->large_stack_allocation = TRUE;
+ OP2(SLJIT_SUB, STACK_TOP, 0, STACK_TOP, 0, SLJIT_IMM, size * SSIZE_OF(sw));
+ #ifdef DESTROY_REGISTERS
+ OP1(SLJIT_MOV, TMP1, 0, SLJIT_IMM, 12345);
+@@ -13974,7 +13978,20 @@ SLJIT_ASSERT(TMP1 == SLJIT_R0 && STR_PTR == SLJIT_R1);
+ 
+ OP1(SLJIT_MOV, SLJIT_MEM1(SLJIT_SP), LOCAL1, STR_PTR, 0);
+ OP1(SLJIT_MOV, SLJIT_R0, 0, ARGUMENTS, 0);
+-OP2(SLJIT_SUB, SLJIT_R1, 0, STACK_LIMIT, 0, SLJIT_IMM, STACK_GROWTH_RATE);
++if (common->large_stack_allocation)
++  {
++  SLJIT_COMPILE_ASSERT((STACK_GROWTH_RATE & (STACK_GROWTH_RATE - 1)) == 0, stack_growth_must_be_power_of_2);
++  // Negative difference. The positive difference would also use the same amount
++  // of operations, but the last subtraction emits several instructions on x86.
++  OP2(SLJIT_SUB, SLJIT_R1, 0, STACK_TOP, 0, STACK_LIMIT, 0);
++  // Minimum extra space after allocation.
++  OP2(SLJIT_SUB, SLJIT_R1, 0, SLJIT_R1, 0, SLJIT_IMM, (STACK_GROWTH_RATE / 2));
++  // Rounds down negative numbers.
++  OP2(SLJIT_AND, SLJIT_R1, 0, SLJIT_R1, 0, SLJIT_IMM, ~(STACK_GROWTH_RATE - 1));
++  OP2(SLJIT_ADD, SLJIT_R1, 0, SLJIT_R1, 0, STACK_LIMIT, 0);
++  }
++else
++  OP2(SLJIT_SUB, SLJIT_R1, 0, STACK_LIMIT, 0, SLJIT_IMM, STACK_GROWTH_RATE);
+ OP1(SLJIT_MOV, SLJIT_R0, 0, SLJIT_MEM1(SLJIT_R0), SLJIT_OFFSETOF(jit_arguments, stack));
+ OP1(SLJIT_MOV, STACK_LIMIT, 0, TMP2, 0);
+ 
+diff --git a/testdata/testinput17 b/testdata/testinput17
+index a02e6be2..486998b4 100644
+--- a/testdata/testinput17
++++ b/testdata/testinput17
+@@ -188,6 +188,11 @@
+ /(?(R)a*(?1)|((?R))b)/
+ \= Expect JIT stack limit reached
+     aaaabcde
++
++# A single large stack allocation must grow beyond the current stack top.
++
++/((?(DEFINE)\[()\g{-1}]{1400}).{1}(?R)|)/expand,jit
++    AAAAAA\=jitstack=192
+     
+ # Invalid options disable JIT when called via pcre2_match(), causing the
+ # match to happen via the interpreter, but for fast JIT invalid options are
+diff --git a/testdata/testoutput17 b/testdata/testoutput17
+index c678587f..b6e7e1a6 100644
+--- a/testdata/testoutput17
++++ b/testdata/testoutput17
+@@ -350,6 +350,12 @@ Failed: error -46: JIT stack limit reached
+ \= Expect JIT stack limit reached
+     aaaabcde
+ Failed: error -46: JIT stack limit reached
++
++# A single large stack allocation must grow beyond the current stack top.
++
++/((?(DEFINE)\[()\g{-1}]{1400}).{1}(?R)|)/expand,jit
++    AAAAAA\=jitstack=192
++Failed: error -46: JIT stack limit reached
+     
+ # Invalid options disable JIT when called via pcre2_match(), causing the
+ # match to happen via the interpreter, but for fast JIT invalid options are
diff --git a/meta/recipes-support/libpcre/libpcre2_10.47.bb b/meta/recipes-support/libpcre/libpcre2_10.47.bb
index 60ba56014bf..4884ffb0928 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89160.patch \
            file://CVE-2026-89158.patch \
            file://CVE-2026-86145.patch \
+           file://CVE-2026-103111.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

