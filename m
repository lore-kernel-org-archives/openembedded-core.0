Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C609C3DA6D
	for <webhook@archiver.kernel.org>; Tue, 20 May 2025 19:48:44 +0000 (UTC)
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
 by mx.groups.io with SMTP id smtpd.web10.424.1747770516819458041
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 May 2025 12:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=hsx244Lp;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.52, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-30e9e81d517so3175425a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 12:48:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1747770516; x=1748375316; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZJgN07c2y3gLS/DLvBfezYhZb4hvvZizBFHTD5mOYnQ=;
        b=hsx244LpkWp9KPZR88gJxECzuHi8aR0YipMXQQ3gPDiCTt6q73Tpyj7+SL7zAYs/R6
         6YjNXg9bNyPB5bUud/M3QhLM/S2ZhALLgJiH8fZbMAki+CnO46BUNWd79JGwyPQhLw0A
         WK8uCayNggYWdWG9+Kjnp64o9hLtvP6wdpT43A0HGEcBZxHT1a8a7tNZ9NlmXrrwfz1o
         dC7WpcylhRMiJntKeu4IxINkd8F3JVFSlg8uVLgJ5jyEzDjbZVAV3e/07yYQFpwn8m67
         zxsW4cCMyET16P/YJoHnTBy3bahx+7/prJF6peWTji99dKxJbgmGjMTpB9YVkMIRJi3m
         A2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747770516; x=1748375316;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZJgN07c2y3gLS/DLvBfezYhZb4hvvZizBFHTD5mOYnQ=;
        b=uosjwJVZAV8KsEvDlHOU4VdH4XbIW31VFi5NsAJeBMMU9cJJmF6hatQ+0nkoB6g+ke
         04c+cTX8iTWCIhapp301fluwgue7KB3DCgsgn1EcJ0dUljYACD+KROZc5O5WkxR8ig+9
         kGCFEobtGUKTyx8tph2FnHBj29dgsqR3jpY6xQrvb73ZvEWxiiKdTVNokSlXwwj0mFbX
         kA2If9+C//p+a6vyESl81KYk5CFVbFTpHZ6b6JAeB/qU9mcKSEVFa4ghQDCwg4TVsFO4
         AyqQacNglja++6INblNPsulWGB6jSFQwdnT/ovXADc32aK+p6GnESQI5ujFj3sAO/X2l
         vLVg==
X-Gm-Message-State: AOJu0YyBJzF/OvX+RnrRBsqDTZWdDyN78JW0+9kfPFNW4gGZIyyrN0fN
	KOhLB9+px4cLRBI6RgafKNf238Q1M0meoAK3Oz4L2kTDbjf+aZVHWcH27jKg9plTYfrNOCx3TRC
	ByAPM
X-Gm-Gg: ASbGncujfvUILkck8tOUzQCeydqTm6OjaL/RK0U7i2MDWCcKI4/TFhphodjBVciRVSJ
	1wKe7G5O2PhD3OWD0L6qMRt5yPzAnWzRxRDg/x3wE4iTpdYy9bRD47lCRyV2XC3LpleHHhpOEPd
	otJdfE6dcoj6lnHBxm/6CGMjR+neHNUZwdODzcHyYI4dM3DqVRjysRp26z1zLfoMGO1iCgwU0iy
	O78g8MVIvurXVw1cpi6njcpi7yHcIdsi/dXUXwNz2o9Im99jMwbjG9kZUNem56bR26WFt3tCvgN
	wi1jUfmLnZV8MVpgYV1JhGCPHMrkw9s+nYn91nk6xg==
X-Google-Smtp-Source: AGHT+IGL07arqw1fgYEtzbCpr5qjESAdn6EnjuDOCSvYOiwdq13eiVLIymC7tysLAJ+sMNPW+US5Fg==
X-Received: by 2002:a17:90b:3b86:b0:30e:8c5d:8f8 with SMTP id 98e67ed59e1d1-30e8c5d09b3mr29320115a91.14.1747770515999;
        Tue, 20 May 2025 12:48:35 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:48df:296e:5350:93e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30f36386944sm2120772a91.14.2025.05.20.12.48.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 12:48:35 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 8/8] gcc: Fix LDRD register overlap in register-indexed mode
Date: Tue, 20 May 2025 12:48:15 -0700
Message-ID: <ac40557f91ade7b7eebd5eca159a9c2f31c5cf83.1747770224.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1747770224.git.steve@sakoman.com>
References: <cover.1747770224.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 20 May 2025 19:48:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216941

From: Khem Raj <raj.khem@gmail.com>

Issue is seen with nodejs ending with Illegal instruction on OE
Its also in QT5base and perhaps many other packages using 64bit
atomics.

Thanks to jeroen (oe IRC) to report and help reduce the problem.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-devtools/gcc/gcc-14.2.inc        |   1 +
 ...m-Fix-LDRD-register-overlap-PR117675.patch | 148 ++++++++++++++++++
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-arm-Fix-LDRD-register-overlap-PR117675.patch

diff --git a/meta/recipes-devtools/gcc/gcc-14.2.inc b/meta/recipes-devtools/gcc/gcc-14.2.inc
index 3d65bed92a..f4e364f692 100644
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
index 0000000000..e3d887a135
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
-- 
2.43.0


