Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63074C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 21:36:44 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.113589.1747258596820610180
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 14:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k/DRowBe;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7423fb98c5aso382244b3a.0
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 14:36:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747258596; x=1747863396; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IXH0t1qioQpj59ZnpQifIiY8WzQImjCY3C/JmhGjYzg=;
        b=k/DRowBe3ysWU55Do1Xli4Gu5iBbHBDGEaf99jXyDR3VHPZhfXl/ULkKpLFoFobJvm
         9zSn5tISU4exQ0KJhoQH2zliYJT7c1PqJbd2coODAlHLB7VlNytgZP6Mm2Q+jsNVeVTI
         BddwktnWJrsmh4SdJ13gAjUNjJSMWWarhUhcTCCO7qcHkqFb1kZyHq87TSTzjGmkH3j9
         RHG23oAvg8ixJ8mIaXQSXOAiZh1Mlje49lsKPwXRrbA67V1srwhmHe26hT8LVz1DbN3z
         Kz5sMuQZEMzObUScdH2Z4iq48UBgatMVSbvwekTP886XCXugRCSFF71MVecf7fu/w2OU
         Yr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747258596; x=1747863396;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXH0t1qioQpj59ZnpQifIiY8WzQImjCY3C/JmhGjYzg=;
        b=pVNxM14xJIjvlOlI4M1RmHijkjztqqi1cJmd6ySJUsw3CZe+86fLknwaVPwJKloRPr
         FXerYUb77W/xq7GHYpn14TTiZ3uhqgoNShAkXzemyZ8GSDQsaS6SINdwtme5D8FbW+B0
         3ZE5+OR9SzIyJyrwjVFd+zdnezx0lGk4JoKaz4ZLW4zbIlByF9hRSmAiVCtpmiKnuQe9
         cj15BwSysX/snzr6G5K0wdOKBLpRU3FFZ6IbEHywx/XMrnevpy6BA8WaXaW9W9w4UCe3
         RVDcsJoUhV9bmMCyrEp5Wei4Jz2P1P5k464sGKy8C22165GbAUlPRxs9lyH49FXwOnJt
         XcqA==
X-Gm-Message-State: AOJu0YwpCa4dV+yBnO1yFn72rl7zxz0nZ4npQIk32gQi9qWT6kACDl8L
	ttuFssH1om26IVYvATmvLmVCODNMWkvuTqRbQYZBajyqHfqKnujMJ9ycTQrh
X-Gm-Gg: ASbGnculQiNIxVgKdcM8l0AW5vLS8dp7Gay4hl+oNGhAXXZEBicPomXDz3D8DTolncV
	H31OPcW5+wg+6YpO9gCCJkdMtHHUaw4HrT9PlTgLr6b29Mk+4Gvg4s8EfUiPUgSr2whQh7cjsD+
	ksVpL3wua+0WFyWuTxzAYagSlBWs9h4X12vtOe+tuShpKL9V9C7AOA+kI1B47XGz+K4wUOVekDL
	gIV6XA1xGDmfWkePBydzCW6W11x5lcaB9lz0AwloHyp3Z2/SRnsC0eWAiBbKuoBFyaukLZvRqg6
	maP1s3kpsujkEVnx3s1DuCXypX/Rz9LXc6H4agQrs4M=
X-Google-Smtp-Source: AGHT+IEtnEqfqKoRLga/jNCcfJNH2UcGSH7Ym45vn4nvPEM7MbIxgvnJLxfSd390iGD9EygI9Y1aJA==
X-Received: by 2002:a05:6a00:1254:b0:736:33fd:f57d with SMTP id d2e1a72fcca58-74289349c72mr6442468b3a.17.1747258595769;
        Wed, 14 May 2025 14:36:35 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7423773c796sm10210646b3a.69.2025.05.14.14.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:36:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [walnascar][PATCH] gcc: Fix LDRD register overlap in register-indexed mode
Date: Wed, 14 May 2025 14:36:33 -0700
Message-ID: <20250514213633.644985-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 21:36:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216551

Issue is seen with nodejs ending with Illegal instruction on OE
Its also in QT5base and perhaps many other packages using 64bit
atomics.

Thanks to jeroen (oe IRC) to report and help reduce the problem.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...m-Fix-LDRD-register-overlap-PR117675.patch | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index 3d65bed92a0..f4e364f692b 100644
--- a/meta/recipes-devtools/gcc/gcc-14.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-14.2.inc
@@ -71,6 +71,7 @@ SRC_URI = "${BASEURI} \
 	   file://0026-gcc-Fix-c-tweak-for-Wrange-loop-construct.patch \
            file://0027-gcc-backport-patch-to-fix-data-relocation-to-ENDBR-s.patch \
            file://gcc.git-ab884fffe3fc82a710bea66ad651720d71c938b8.patch \
+           file://0001-arm-Fix-LDRD-register-overlap-PR117675.patch \
 "
 
 S = "${TMPDIR}/work-shared/gcc-${PV}-${PR}/${SOURCEDIR}"
diff --git a/meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch b/meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch
new file mode 100644
index 00000000000..e3d887a1359
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch
@@ -0,0 +1,148 @@
+From 9366c328518766d896155388726055624716c0af Mon Sep 17 00:00:00 2001
+From: Wilco Dijkstra <wilco.dijkstra@arm.com>
+Date: Tue, 10 Dec 2024 14:22:48 +0000
+Subject: [PATCH] arm: Fix LDRD register overlap [PR117675]
+
+The register indexed variants of LDRD have complex register overlap constraints
+which makes them hard to use without using output_move_double (which can't be
+used for atomics as it doesn't guarantee to emit atomic LDRD/STRD when required).
+Add a new predicate and constraint for plain LDRD/STRD with base or base+imm.
+This blocks register indexing and fixes PR117675.
+
+gcc:
+	PR target/117675
+	* config/arm/arm.cc (arm_ldrd_legitimate_address): New function.
+	* config/arm/arm-protos.h (arm_ldrd_legitimate_address): New prototype.
+	* config/arm/constraints.md: Add new Uo constraint.
+	* config/arm/predicates.md (arm_ldrd_memory_operand): Add new predicate.
+	* config/arm/sync.md (arm_atomic_loaddi2_ldrd): Use
+	arm_ldrd_memory_operand and Uo.
+
+gcc/testsuite:
+	PR target/117675
+	* gcc.target/arm/pr117675.c: Add new test.
+
+(cherry picked from commit 21fbfae2e55e1a153820acc6fbd922e66f67e65b)
+
+Upstream-Status: Backport [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117675]
+---
+ gcc/config/arm/arm-protos.h             |  1 +
+ gcc/config/arm/arm.cc                   | 24 ++++++++++++++++++++++++
+ gcc/config/arm/constraints.md           |  8 +++++++-
+ gcc/config/arm/predicates.md            |  4 ++++
+ gcc/config/arm/sync.md                  |  2 +-
+ gcc/testsuite/gcc.target/arm/pr117675.c | 17 +++++++++++++++++
+ 6 files changed, 54 insertions(+), 2 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr117675.c
+
+--- a/gcc/config/arm/arm-protos.h
++++ b/gcc/config/arm/arm-protos.h
+@@ -202,6 +202,7 @@ extern rtx arm_load_tp (rtx);
+ extern bool arm_coproc_builtin_available (enum unspecv);
+ extern bool arm_coproc_ldc_stc_legitimate_address (rtx);
+ extern rtx arm_stack_protect_tls_canary_mem (bool);
++extern bool arm_ldrd_legitimate_address (rtx);
+ 
+ 
+ #if defined TREE_CODE
+--- a/gcc/config/arm/arm.cc
++++ b/gcc/config/arm/arm.cc
+@@ -34523,6 +34523,30 @@ arm_coproc_ldc_stc_legitimate_address (r
+   return false;
+ }
+ 
++/* Return true if OP is a valid memory operand for LDRD/STRD without any
++   register overlap restrictions.  Allow [base] and [base, imm] for now.  */
++bool
++arm_ldrd_legitimate_address (rtx op)
++{
++  if (!MEM_P (op))
++    return false;
++
++  op = XEXP (op, 0);
++  if (REG_P (op))
++    return true;
++
++  if (GET_CODE (op) != PLUS)
++    return false;
++  if (!REG_P (XEXP (op, 0)) || !CONST_INT_P (XEXP (op, 1)))
++    return false;
++
++  HOST_WIDE_INT val = INTVAL (XEXP (op, 1));
++
++  if (TARGET_ARM)
++    return IN_RANGE (val, -255, 255);
++  return IN_RANGE (val, -1020, 1020) && (val & 3) == 0;
++}
++
+ /* Return the diagnostic message string if conversion from FROMTYPE to
+    TOTYPE is not allowed, NULL otherwise.  */
+ 
+--- a/gcc/config/arm/constraints.md
++++ b/gcc/config/arm/constraints.md
+@@ -39,7 +39,7 @@
+ ;; in all states: Pg
+ 
+ ;; The following memory constraints have been used:
+-;; in ARM/Thumb-2 state: Uh, Ut, Uv, Uy, Un, Um, Us, Up, Uf, Ux, Ul
++;; in ARM/Thumb-2 state: Uh, Ut, Uv, Uy, Un, Um, Us, Uo, Up, Uf, Ux, Ul, Uz
+ ;; in ARM state: Uq
+ ;; in Thumb state: Uu, Uw
+ ;; in all states: Q
+@@ -585,6 +585,12 @@
+  (and (match_code "mem")
+       (match_test "arm_coproc_ldc_stc_legitimate_address (op)")))
+ 
++(define_memory_constraint "Uo"
++ "@internal
++  A memory operand for Arm/Thumb-2 LDRD/STRD"
++ (and (match_code "mem")
++      (match_test "arm_ldrd_legitimate_address (op)")))
++
+ ;; We used to have constraint letters for S and R in ARM state, but
+ ;; all uses of these now appear to have been removed.
+ 
+--- a/gcc/config/arm/predicates.md
++++ b/gcc/config/arm/predicates.md
+@@ -849,6 +849,10 @@
+   (and (match_operand 0 "memory_operand")
+        (match_code "reg" "0")))
+ 
++;; True if the operand is memory reference suitable for a ldrd/strd.
++(define_predicate "arm_ldrd_memory_operand"
++  (match_test "arm_ldrd_legitimate_address (op)"))
++
+ ;; Predicates for parallel expanders based on mode.
+ (define_special_predicate "vect_par_constant_high" 
+   (match_code "parallel")
+--- a/gcc/config/arm/sync.md
++++ b/gcc/config/arm/sync.md
+@@ -161,7 +161,7 @@
+ (define_insn "arm_atomic_loaddi2_ldrd"
+   [(set (match_operand:DI 0 "register_operand" "=r")
+ 	(unspec_volatile:DI
+-	  [(match_operand:DI 1 "memory_operand" "m")]
++	  [(match_operand:DI 1 "arm_ldrd_memory_operand" "Uo")]
+ 	    VUNSPEC_LDRD_ATOMIC))]
+   "ARM_DOUBLEWORD_ALIGN && TARGET_HAVE_LPAE"
+   "ldrd\t%0, %H0, %1"
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr117675.c
+@@ -0,0 +1,17 @@
++/* { dg-do compile } */
++/* { dg-options "-O2 -marm" } */
++/* { dg-require-effective-target arm_arch_v7ve_neon_ok } */
++/* { dg-add-options arm_arch_v7ve_neon } */
++/* { dg-final { check-function-bodies "**" "" "" } } */
++
++/*
++** f1:
++**	add	r0, r0, r1
++**	ldrd	r0, r1, \[r0\]
++**	bx	lr
++*/
++long long f1 (char *p, int i)
++{
++  return __atomic_load_n ((long long *)(p + i), __ATOMIC_RELAXED);
++}
++

