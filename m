Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8116C433EF
	for <webhook@archiver.kernel.org>; Fri, 31 Dec 2021 00:19:34 +0000 (UTC)
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web08.5718.1640909973598930358
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Dec 2021 16:19:34 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Pbb0Vjmk;
 spf=pass (domain: intel.com, ip: 134.134.136.126,
 mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1640909973; x=1672445973;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=gXt3PpKcAsa/8PapmKO/ND3w0yPhpfjHQqv03BAHHOQ=;
  b=Pbb0VjmkKNm+5+sPOKUYno5xieGtatfDJp/WNvFjUGjCdcMGMhfasf1R
   1B5jxwIrKiltQMWxaGeh8YuNBJ9QF4XZZfFw9AB4cgdL/Ty5KWcDfICak
   j9HLeUGNXFwnfTMzJVKzaBkLfly6Wk63EMjyPuOWeZsKlQQYjk/fzFFMX
   i2JIHtTgAWku0tpTb3qGuOgQQXOcv5JxPLMhyevmzFOYHq35ig+rR1B47
   2BltykT8ds1QgneNvT21oNeF34PBXF7lB5hH09L711jxhVAd/S06Lj1t1
   hi+USeKEoIshUY8icMPDxo7o0CDwZbzDCFt16biZuwBPQ23kMx94AkYP2
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10213"; a="228573098"
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="228573098"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:33 -0800
X-IronPort-AV: E=Sophos;i="5.88,248,1635231600";
   d="scan'208";a="619502248"
Received: from jiayingk-mobl2.gar.corp.intel.com (HELO
 anmitta2-mobl3.intel.com) ([10.215.231.141])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Dec 2021 16:19:31 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [honister][PATCH 02/11] gcc: Fix CVE-2021-35465
Date: Fri, 31 Dec 2021 08:19:15 +0800
Message-Id: 
 <e82ffd7dc34609a8174c48a34efffbf833967ed1.1640909776.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1640909776.git.anuj.mittal@intel.com>
References: <cover.1640909776.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Dec 2021 00:19:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160070

From: Pgowda <pgowda.cve@gmail.com>

source : https://gcc.gnu.org/bugzilla/show_bug.cgi?id=102035

Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=3929bca9ca95de9d35e82ae8828b188029e3eb70]
Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=574e7950bd6b34e9e2cacce18c802b45505d1d0a]
Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=30461cf8dba3d3adb15a125e4da48800eb2b9b8f]
Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=809330ab8450261e05919b472783bf15e4b000f7]

Signed-off-by: Pgowda <pgowda.cve@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c8a1726feaf705683e80d85811ae482c6ebc3172)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-devtools/gcc/gcc-11.2.inc        |   4 +
 .../gcc/gcc/0001-CVE-2021-35465.patch         | 138 ++++++++
 .../gcc/gcc/0002-CVE-2021-35465.patch         |  39 +++
 .../gcc/gcc/0003-CVE-2021-35465.patch         | 103 ++++++
 .../gcc/gcc/0004-CVE-2021-35465.patch         | 304 ++++++++++++++++++
 5 files changed, 588 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch

diff --git a/meta/recipes-devtools/gcc/gcc-11.2.inc b/meta/recipes-devtools/gcc/gcc-11.2.inc
index cd1b022ff2..60e04cd53c 100644
--- a/meta/recipes-devtools/gcc/gcc-11.2.inc
+++ b/meta/recipes-devtools/gcc/gcc-11.2.inc
@@ -68,6 +68,10 @@ SRC_URI = "\
            file://0036-mingw32-Enable-operation_not_supported.patch \
            file://0037-libatomic-Do-not-enforce-march-on-aarch64.patch \
            file://0041-apply-debug-prefix-maps-before-checksumming-DIEs.patch \
+           file://0001-CVE-2021-35465.patch \
+           file://0002-CVE-2021-35465.patch \
+           file://0003-CVE-2021-35465.patch \
+           file://0004-CVE-2021-35465.patch \
 "
 SRC_URI[sha256sum] = "d08edc536b54c372a1010ff6619dd274c0f1603aa49212ba20f7aa2cda36fa8b"
 
diff --git a/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
new file mode 100644
index 0000000000..6b1d4e3fce
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0001-CVE-2021-35465.patch
@@ -0,0 +1,138 @@
+From 3929bca9ca95de9d35e82ae8828b188029e3eb70 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Fri, 11 Jun 2021 16:02:05 +0100
+Subject: [PATCH] arm: Add command-line option for enabling CVE-2021-35465
+ mitigation [PR102035]
+
+Add a new option, -mfix-cmse-cve-2021-35465 and document it.  Enable it
+automatically for cortex-m33, cortex-m35p and cortex-m55.
+
+gcc:
+	PR target/102035
+	* config/arm/arm.opt (mfix-cmse-cve-2021-35465): New option.
+	* doc/invoke.texi (Arm Options): Document it.
+	* config/arm/arm-cpus.in (quirk_vlldm): New feature bit.
+	(ALL_QUIRKS): Add quirk_vlldm.
+	(cortex-m33): Add quirk_vlldm.
+	(cortex-m35p, cortex-m55): Likewise.
+	* config/arm/arm.c (arm_option_override): Enable fix_vlldm if
+	targetting an affected CPU and not explicitly controlled on
+	the command line.
+
+CVE: CVE-2021-35465
+Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=3929bca9ca95de9d35e82ae8828b188029e3eb70]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ gcc/config/arm/arm-cpus.in | 9 +++++++--
+ gcc/config/arm/arm.c       | 9 +++++++++
+ gcc/config/arm/arm.opt     | 4 ++++
+ gcc/doc/invoke.texi        | 9 +++++++++
+ 4 files changed, 29 insertions(+), 2 deletions(-)
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+--- a/gcc/config/arm/arm.c	2021-11-15 02:13:11.100579812 -0800
++++ b/gcc/config/arm/arm.c	2021-11-15 02:17:36.988237692 -0800
+@@ -3610,6 +3610,15 @@ arm_option_override (void)
+ 	fix_cm3_ldrd = 0;
+     }
+ 
++  /* Enable fix_vlldm by default if required.  */
++  if (fix_vlldm == 2)
++    {
++      if (bitmap_bit_p (arm_active_target.isa, isa_bit_quirk_vlldm))
++	fix_vlldm = 1;
++      else
++	fix_vlldm = 0;
++    }
++
+   /* Hot/Cold partitioning is not currently supported, since we can't
+      handle literal pool placement in that case.  */
+   if (flag_reorder_blocks_and_partition)
+diff --git a/gcc/config/arm/arm-cpus.in b/gcc/config/arm/arm-cpus.in
+--- a/gcc/config/arm/arm-cpus.in	2021-11-15 02:13:11.104579747 -0800
++++ b/gcc/config/arm/arm-cpus.in	2021-11-15 02:17:36.984237757 -0800
+@@ -186,6 +186,9 @@ define feature quirk_armv6kz
+ # Cortex-M3 LDRD quirk.
+ define feature quirk_cm3_ldrd
+ 
++# v8-m/v8.1-m VLLDM errata.
++define feature quirk_vlldm
++
+ # Don't use .cpu assembly directive
+ define feature quirk_no_asmcpu
+ 
+@@ -322,7 +325,7 @@ define implied vfp_base MVE MVE_FP ALL_F
+ # architectures.
+ # xscale isn't really a 'quirk', but it isn't an architecture either and we
+ # need to ignore it for matching purposes.
+-define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd xscale quirk_no_asmcpu
++define fgroup ALL_QUIRKS   quirk_no_volatile_ce quirk_armv6kz quirk_cm3_ldrd quirk_vlldm xscale quirk_no_asmcpu
+ 
+ define fgroup IGNORE_FOR_MULTILIB cdecp0 cdecp1 cdecp2 cdecp3 cdecp4 cdecp5 cdecp6 cdecp7
+ 
+@@ -1570,6 +1573,7 @@ begin cpu cortex-m33
+  architecture armv8-m.main+dsp+fp
+  option nofp remove ALL_FP
+  option nodsp remove armv7em
++ isa quirk_vlldm
+  costs v7m
+ end cpu cortex-m33
+ 
+@@ -1579,6 +1583,7 @@ begin cpu cortex-m35p
+  architecture armv8-m.main+dsp+fp
+  option nofp remove ALL_FP
+  option nodsp remove armv7em
++ isa quirk_vlldm
+  costs v7m
+ end cpu cortex-m35p
+ 
+@@ -1590,7 +1595,7 @@ begin cpu cortex-m55
+  option nomve remove mve mve_float
+  option nofp remove ALL_FP mve_float
+  option nodsp remove MVE mve_float
+- isa quirk_no_asmcpu
++ isa quirk_no_asmcpu quirk_vlldm
+  costs v7m
+  vendor 41
+ end cpu cortex-m55
+diff --git a/gcc/config/arm/arm.opt b/gcc/config/arm/arm.opt
+--- a/gcc/config/arm/arm.opt	2021-11-15 02:13:11.104579747 -0800
++++ b/gcc/config/arm/arm.opt	2021-11-15 02:17:36.988237692 -0800
+@@ -268,6 +268,10 @@ Target Var(fix_cm3_ldrd) Init(2)
+ Avoid overlapping destination and address registers on LDRD instructions
+ that may trigger Cortex-M3 errata.
+ 
++mfix-cmse-cve-2021-35465
++Target Var(fix_vlldm) Init(2)
++Mitigate issues with VLLDM on some M-profile devices (CVE-2021-35465).
++
+ munaligned-access
+ Target Var(unaligned_access) Init(2) Save
+ Enable unaligned word and halfword accesses to packed data.
+diff --git a/gcc/doc/invoke.texi b/gcc/doc/invoke.texi
+--- a/gcc/doc/invoke.texi	2021-11-15 02:13:11.112579616 -0800
++++ b/gcc/doc/invoke.texi	2021-11-15 02:17:36.996237562 -0800
+@@ -804,6 +804,7 @@ Objective-C and Objective-C++ Dialects}.
+ -mverbose-cost-dump @gol
+ -mpure-code @gol
+ -mcmse @gol
++-mfix-cmse-cve-2021-35465 @gol
+ -mfdpic}
+ 
+ @emph{AVR Options}
+@@ -20487,6 +20488,14 @@ Generate secure code as per the "ARMv8-M
+ Development Tools Engineering Specification", which can be found on
+ @url{https://developer.arm.com/documentation/ecm0359818/latest/}.
+ 
++@item -mfix-cmse-cve-2021-35465
++@opindex mfix-cmse-cve-2021-35465
++Mitigate against a potential security issue with the @code{VLLDM} instruction
++in some M-profile devices when using CMSE (CVE-2021-365465).  This option is
++enabled by default when the option @option{-mcpu=} is used with
++@code{cortex-m33}, @code{cortex-m35p} or @code{cortex-m55}.  The option
++@option{-mno-fix-cmse-cve-2021-35465} can be used to disable the mitigation.
++
+ @item -mfdpic
+ @itemx -mno-fdpic
+ @opindex mfdpic
diff --git a/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
new file mode 100644
index 0000000000..98841e6d7c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0002-CVE-2021-35465.patch
@@ -0,0 +1,39 @@
+From 574e7950bd6b34e9e2cacce18c802b45505d1d0a Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Fri, 18 Jun 2021 17:16:25 +0100
+Subject: [PATCH] arm: add erratum mitigation to __gnu_cmse_nonsecure_call
+ [PR102035]
+
+Add the recommended erratum mitigation sequence to
+__gnu_cmse_nonsecure_call for use on Armv8-m.main devices. Since this
+is in the library code we cannot know in advance whether the core we
+are running on will be affected by this, so always enable it.
+
+libgcc:
+	PR target/102035
+	* config/arm/cmse_nonsecure_call.S (__gnu_cmse_nonsecure_call):
+	Add vlldm erratum work-around.
+
+CVE: CVE-2021-35465
+Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=574e7950bd6b34e9e2cacce18c802b45505d1d0a]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ libgcc/config/arm/cmse_nonsecure_call.S | 5 +++++
+ 1 file changed, 5 insertions(+)
+
+diff --git a/libgcc/config/arm/cmse_nonsecure_call.S b/libgcc/config/arm/cmse_nonsecure_call.S
+--- a/libgcc/config/arm/cmse_nonsecure_call.S
++++ b/libgcc/config/arm/cmse_nonsecure_call.S
+@@ -102,6 +102,11 @@ blxns	    r4
+ #ifdef __ARM_PCS_VFP
+ vpop.f64    {d8-d15}
+ #else
++/* VLLDM erratum mitigation sequence. */
++mrs	    r5, control
++tst	    r5, #8	  /* CONTROL_S.SFPA */
++it	    ne
++.inst.w	    0xeeb00a40	  /* vmovne s0, s0 */
+ vlldm	    sp		  /* Lazy restore of d0-d16 and FPSCR.  */
+ add	    sp, sp, #0x88 /* Free space used to save floating point registers.  */
+ #endif /* __ARM_PCS_VFP */
diff --git a/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
new file mode 100644
index 0000000000..d87be19866
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0003-CVE-2021-35465.patch
@@ -0,0 +1,103 @@
+From 30461cf8dba3d3adb15a125e4da48800eb2b9b8f Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Fri, 18 Jun 2021 17:18:37 +0100
+Subject: [PATCH] arm: fix vlldm erratum for Armv8.1-m [PR102035]
+
+For Armv8.1-m we generate code that emits VLLDM directly and do not
+rely on support code in the library, so emit the mitigation directly
+as well, when required.  In this case, we can use the compiler options
+to determine when to apply the fix and when it is safe to omit it.
+
+gcc:
+	PR target/102035
+	* config/arm/arm.md (attribute arch): Add fix_vlldm.
+	(arch_enabled): Use it.
+	* config/arm/vfp.md (lazy_store_multiple_insn): Add alternative to
+	use when erratum mitigation is needed.
+
+CVE: CVE-2021-35465
+Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=30461cf8dba3d3adb15a125e4da48800eb2b9b8f]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ gcc/config/arm/arm.md | 11 +++++++++--
+ gcc/config/arm/vfp.md | 10 +++++++---
+ 2 files changed, 16 insertions(+), 5 deletions(-)
+
+diff -upr a/gcc/config/arm/arm.md b/gcc/config/arm/arm.md
+--- a/gcc/config/arm/arm.md	2020-07-22 23:35:17.344384552 -0700
++++ b/gcc/config/arm/arm.md	2021-11-11 20:33:58.431543947 -0800
+@@ -132,9 +132,12 @@
+ ; TARGET_32BIT, "t1" or "t2" to specify a specific Thumb mode.  "v6"
+ ; for ARM or Thumb-2 with arm_arch6, and nov6 for ARM without
+ ; arm_arch6.  "v6t2" for Thumb-2 with arm_arch6 and "v8mb" for ARMv8-M
+-; Baseline.  This attribute is used to compute attribute "enabled",
++; Baseline.  "fix_vlldm" is for fixing the v8-m/v8.1-m VLLDM erratum.
++; This attribute is used to compute attribute "enabled",
+ ; use type "any" to enable an alternative in all cases.
+-(define_attr "arch" "any,a,t,32,t1,t2,v6,nov6,v6t2,v8mb,iwmmxt,iwmmxt2,armv6_or_vfpv3,neon,mve"
++(define_attr "arch" "any, a, t, 32, t1, t2, v6,nov6, v6t2, \
++		     v8mb, fix_vlldm, iwmmxt, iwmmxt2, armv6_or_vfpv3, \
++		     neon, mve"
+   (const_string "any"))
+ 
+ (define_attr "arch_enabled" "no,yes"
+@@ -177,6 +180,10 @@
+ 	      (match_test "TARGET_THUMB1 && arm_arch8"))
+ 	 (const_string "yes")
+ 
++	 (and (eq_attr "arch" "fix_vlldm")
++	      (match_test "fix_vlldm"))
++	 (const_string "yes")
++
+ 	 (and (eq_attr "arch" "iwmmxt2")
+ 	      (match_test "TARGET_REALLY_IWMMXT2"))
+ 	 (const_string "yes")
+diff -upr a/gcc/config/arm/vfp.md b/gcc/config/arm/vfp.md
+--- a/gcc/config/arm/vfp.md	2020-07-22 23:35:17.356384684 -0700
++++ b/gcc/config/arm/vfp.md	2021-11-11 20:33:58.431543947 -0800
+@@ -1703,12 +1703,15 @@
+    (set_attr "type" "mov_reg")]
+ )
+ 
++;; Both this and the next instruction are treated by GCC in the same
++;; way as a blockage pattern.  That's perhaps stronger than it needs
++;; to be, but we do not want accesses to the VFP register bank to be
++;; moved across either instruction.
++
+ (define_insn "lazy_store_multiple_insn"
+-  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
+-	(post_dec:SI (match_dup 0)))
+-   (unspec_volatile [(const_int 0)
+-		     (mem:SI (post_dec:SI (match_dup 0)))]
+-		    VUNSPEC_VLSTM)]
++  [(unspec_volatile
++    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk"))]
++    VUNSPEC_VLSTM)]
+   "use_cmse && reload_completed"
+   "vlstm%?\\t%0"
+   [(set_attr "predicable" "yes")
+@@ -1716,14 +1719,16 @@
+ )
+ 
+ (define_insn "lazy_load_multiple_insn"
+-  [(set (match_operand:SI 0 "s_register_operand" "+&rk")
+-	(post_inc:SI (match_dup 0)))
+-   (unspec_volatile:SI [(const_int 0)
+-			(mem:SI (match_dup 0))]
+-		       VUNSPEC_VLLDM)]
++  [(unspec_volatile
++    [(mem:BLK (match_operand:SI 0 "s_register_operand" "rk,rk"))]
++    VUNSPEC_VLLDM)]
+   "use_cmse && reload_completed"
+-  "vlldm%?\\t%0"
+-  [(set_attr "predicable" "yes")
++  "@
++   vscclrm\\t{vpr}\;vlldm\\t%0
++   vlldm\\t%0"
++  [(set_attr "arch" "fix_vlldm,*")
++   (set_attr "predicable" "no")
++   (set_attr "length" "8,4")
+    (set_attr "type" "load_4")]
+ )
+ 
diff --git a/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
new file mode 100644
index 0000000000..12dfe682fa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc/0004-CVE-2021-35465.patch
@@ -0,0 +1,304 @@
+From 809330ab8450261e05919b472783bf15e4b000f7 Mon Sep 17 00:00:00 2001
+From: Richard Earnshaw <rearnsha@arm.com>
+Date: Tue, 6 Jul 2021 15:10:18 +0100
+Subject: [PATCH] arm: Add tests for VLLDM mitigation [PR102035]
+
+New tests for the erratum mitigation.
+
+gcc/testsuite:
+	PR target/102035
+	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c: New test.
+	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c: Likewise.
+	* gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c: Likewise.
+	* gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c: Likewise.
+	* gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c: Likewise.
+	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c: Likewise.
+	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c: Likewise.
+	* gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c: Likewise.
+
+CVE: CVE-2021-35465
+Upstream-Status: Backport[https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=809330ab8450261e05919b472783bf15e4b000f7]
+Signed-off-by: Pgowda <pgowda.cve@gmail.com>
+
+---
+ .../arm/cmse/mainline/8_1m/soft/cmse-13a.c    | 31 +++++++++++++++++++
+ .../arm/cmse/mainline/8_1m/soft/cmse-7a.c     | 28 +++++++++++++++++
+ .../arm/cmse/mainline/8_1m/soft/cmse-8a.c     | 30 ++++++++++++++++++
+ .../cmse/mainline/8_1m/softfp-sp/cmse-7a.c    | 27 ++++++++++++++++
+ .../cmse/mainline/8_1m/softfp-sp/cmse-8a.c    | 29 +++++++++++++++++
+ .../arm/cmse/mainline/8_1m/softfp/cmse-13a.c  | 30 ++++++++++++++++++
+ .../arm/cmse/mainline/8_1m/softfp/cmse-7a.c   | 27 ++++++++++++++++
+ .../arm/cmse/mainline/8_1m/softfp/cmse-8a.c   | 29 +++++++++++++++++
+ 8 files changed, 231 insertions(+)
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
+ create mode 100644 gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
+
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-13a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,31 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=soft" } } */
++
++#include "../../../cmse-13.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip), ){9}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler-not "vmov" } } */
++/* { dg-final { scan-assembler-not "vmsr" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-7a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,28 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=soft" } } */
++
++#include "../../../cmse-7.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler-not "vmov" } } */
++/* { dg-final { scan-assembler-not "vmsr" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/soft/cmse-8a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,30 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=soft -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=soft" } } */
++
++#include "../../../cmse-8.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler-not "vmov" } } */
++/* { dg-final { scan-assembler-not "vmsr" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-13a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,30 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16 -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
++/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */
++
++#include "../../../cmse-13.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[1,4-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr2, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr3, r4" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r1, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[1,4-9\]|r10|fp|ip), ){9}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[1,4-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-7a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,27 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16 -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
++/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */
++
++#include "../../../cmse-7.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp/cmse-8a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,29 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-d16 -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
++/* { dg-skip-if "Skip these if testing single precision" {*-*-*} {"-mfpu=*-sp-*"} {""} } */
++
++#include "../../../cmse-8.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-7a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,27 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-sp-d16 -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
++/* { dg-skip-if "Skip these if testing double precision" {*-*-*} {"-mfpu=fpv[4-5]-d16"} {""} } */
++
++#include "../../../cmse-7.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[0-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r0, )?(r1, )?(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[0-9\]|r10|fp|ip), ){12}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[0-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
+diff --git a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c
+--- a/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c	1969-12-31 16:00:00.000000000 -0800
++++ b/gcc/testsuite/gcc.target/arm/cmse/mainline/8_1m/softfp-sp/cmse-8a.c	2021-11-15 02:30:37.210637445 -0800
+@@ -0,0 +1,29 @@
++/* { dg-do compile } */
++/* { dg-options "-mcmse -mfloat-abi=softfp -mfpu=fpv5-sp-d16 -mfix-cmse-cve-2021-35465" }  */
++/* { dg-skip-if "Incompatible float ABI" { *-*-* } { "-mfloat-abi=*" } { "-mfloat-abi=softfp" } } */
++/* { dg-skip-if "Skip these if testing double precision" {*-*-*} {"-mfpu=fpv[4-5]-d16"} {""} } */
++
++#include "../../../cmse-8.x"
++
++/* Checks for saving and clearing prior to function call.  */
++/* Shift on the same register as blxns.  */
++/* { dg-final { scan-assembler "lsrs\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler "lsls\t(r\[2-9\]|r10|fp|ip), \\1, #1.*blxns\t\\1" } } */
++/* { dg-final { scan-assembler-not "mov\tr0, r4" } } */
++/* { dg-final { scan-assembler-not "mov\tr1, r4" } } */
++/* { dg-final { scan-assembler "push\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++/* { dg-final { scan-assembler "vlstm\tsp" } } */
++/* Check the right registers are cleared and none appears twice.  */
++/* { dg-final { scan-assembler "clrm\t\{(r2, )?(r3, )?(r4, )?(r5, )?(r6, )?(r7, )?(r8, )?(r9, )?(r10, )?(fp, )?(ip, )?APSR\}" } } */
++/* Check that the right number of registers is cleared and thus only one
++   register is missing.  */
++/* { dg-final { scan-assembler "clrm\t\{((r\[2-9\]|r10|fp|ip), ){10}APSR\}" } } */
++/* Check that no cleared register is used for blxns.  */
++/* { dg-final { scan-assembler-not "clrm\t\{\[^\}\]\+(r\[2-9\]|r10|fp|ip),\[^\}\]\+\}.*blxns\t\\1" } } */
++/* Check for v8.1-m variant of erratum work-around.  */
++/* { dg-final { scan-assembler "vscclrm\t\{vpr\}" } } */
++/* { dg-final { scan-assembler "vlldm\tsp" } } */
++/* { dg-final { scan-assembler "pop\t\{r4, r5, r6, r7, r8, r9, r10, fp\}" } } */
++
++/* Now we check that we use the correct intrinsic to call.  */
++/* { dg-final { scan-assembler "blxns" } } */
-- 
2.33.1


