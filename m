Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B551CA601E
	for <webhook@archiver.kernel.org>; Fri,  9 Oct 2026 18:47:59 +0000 (UTC)
Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2883.1791571669089184662
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Oct 2026 11:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=p3Z1J5Pq;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.226, mailfrom: fm-256628-20261009184747893b9c4fb80002073b-b9qaam@rts-flowmailer.siemens.com)
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20261009184747893b9c4fb80002073b
        for <openembedded-core@lists.openembedded.org>;
        Fri, 09 Oct 2026 20:47:47 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=3GbqYym/xyaNN1ywu3KBnWCcjtgfL1xuC9d9KRwXaOA=;
 b=p3Z1J5PqQFhHCzybprXvLbZZcfGKBXPYa2X5yFnPqs/J+YxiodbxlaxU97qAlfJnYMb+k1
 IOzov5M0nTQQpOuPJP/KiTELhzoJe27Yt8xn/4BOlUA4rvAgLxnH+UmIlQBSpBLEZY2VDSdI
 QlcSVqGXHrBspM4NlWS/TDI3DBRBmUTlHrgc2HeVQDYyHZq+98otSFuSzMMwuBZlFmTAtvLI
 wFpQPnvmplPINOuISQ02xisKExFPzT2/lFwtpKeXPmOt1cD+0FuSjzLdG2qfmBiMf9qTxVmW
 9D8y6O5T4j+36GM5NJyzgfL5MRC70TAZqhv+RpNzUNNxEqvyEsjt3o+Q==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [wrynose][PATCH 8/8] libpcre2: patch CVE-2026-103111
Date: Fri,  9 Oct 2026 20:45:48 +0200
Message-ID: <20261009184548.2962197-8-peter.marko@siemens.com>
In-Reply-To: <20261009184548.2962197-1-peter.marko@siemens.com>
References: <20261009184548.2962197-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Oct 2026 18:47:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247483

From: Peter Marko <peter.marko@siemens.com>

Pick patch per [1] and [2].

[1] https://security-tracker.debian.org/tracker/CVE-2026-103111
[2] https://github.com/PCRE2Project/pcre2/security/advisories/GHSA-r9hj-j2rw-4q3m

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../libpcre/libpcre2/CVE-2026-103111.patch    | 111 ++++++++++++++++++
 .../recipes-support/libpcre/libpcre2_10.47.bb |   1 +
 2 files changed, 112 insertions(+)
 create mode 100644 meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch

diff --git a/meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch b/meta/recipes-support/libpcre/libpcre2/CVE-2026-103111.patch
new file mode 100644
index 0000000000..6006566d84
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
index 60ba56014b..4884ffb092 100644
--- a/meta/recipes-support/libpcre/libpcre2_10.47.bb
+++ b/meta/recipes-support/libpcre/libpcre2_10.47.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/pcre2-${PV}/pcre2-${PV}.tar.bz2 \
            file://CVE-2026-89160.patch \
            file://CVE-2026-89158.patch \
            file://CVE-2026-86145.patch \
+           file://CVE-2026-103111.patch \
 "
 
 GITHUB_BASE_URI = "https://github.com/PCRE2Project/pcre2/releases"

