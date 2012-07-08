Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SnuFs-0001Uh-KO
	for openembedded-core@lists.openembedded.org;
	Sun, 08 Jul 2012 18:22:41 +0200
Received: by mail-pb0-f47.google.com with SMTP id rq2so16967057pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 08 Jul 2012 09:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=8lOpVzcfkWdcKMk7HqltM1dho4fc61k7pzoYDSbn4/o=;
	b=qH807JMYoBAPhWvasuMwsYfc8bH/zZxPDY0vsPrb05Uxr/AFARwZTty2WDBDW5Ih1s
	TlftHSU4t8xJjdQZbAALhjSuD+uGZFABjP1LLHycI06k18YHvOZZsGoaIEKgk9WKUSPs
	gN8/TsiLZQ3cGtQpgCPiui8jOjagmetG9rhxe/0umOB9oGC+6GbVX5+TgSTK0k7nuoGb
	5wCn9yyKUmBSfwjtAnWKIsE6taLc5K2MY7XbtWGhMkrScRpHl8Lt2TuUPJehbnKu43QT
	k4/QfWLBIBWka56t7IHSzNDguxRcqRRB5J3cE0EVfHxtpqcVtwePquY3VZUa840kggb3
	bhyw==
Received: by 10.66.72.225 with SMTP id g1mr59983279pav.3.1341763891430;
	Sun, 08 Jul 2012 09:11:31 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id qp9sm25927714pbc.9.2012.07.08.09.11.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 08 Jul 2012 09:11:30 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Jul 2012 09:10:35 -0700
Message-Id: <9f42cd8a4251507135300cea8520492b49cab19f.1341763347.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
References: <8e3806df2f45dfaf6bf86ce7591b8d09b873c27e.1341763346.git.raj.khem@gmail.com>
In-Reply-To: <cover.1341763345.git.raj.khem@gmail.com>
References: <cover.1341763345.git.raj.khem@gmail.com>
Subject: [PATCH 17/19] gcc: Refresh support for fsl E5500/E6500
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 08 Jul 2012 16:22:41 -0000

These patches are backport from gcc mainline
they fix issues where eglibc was not compilable
for e5500+ due to missing vector intrinsics
It obsoletes the existing e5500 patch

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    7 +-
 .../gcc/gcc-4.7/define_insn_reservation.patch      |  118 +++
 .../gcc/gcc-4.7/ppc_with_cpu.patch                 |  752 ++++++++++++++++++++
 ...pc-e5500.patch => ppce5500-e6500-support.patch} |  560 +++++++++++----
 .../gcc/gcc-4.7/rs6000-tables.patch                |  135 ++++
 5 files changed, 1412 insertions(+), 160 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
 rename meta/recipes-devtools/gcc/gcc-4.7/{powerpc-e5500.patch => ppce5500-e6500-support.patch} (41%)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index a824573..72edd1a 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r2"
+PR = "r3"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
@@ -59,7 +59,10 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};proto=git \
 	   file://disable_relax_pic_calls_flag.patch \
 	   file://COLLECT_GCC_OPTIONS.patch \
            file://use-defaults.h-and-t-oe-in-B.patch \
-	   file://powerpc-e5500.patch \
+	   file://ppc_with_cpu.patch \
+	   file://ppce5500-e6500-support.patch \
+	   file://rs6000-tables.patch \
+	   file://define_insn_reservation.patch \
 	   file://pr32219.patch \
 	   file://fortran-cross-compile-hack.patch \
 	   file://libgcc-sjlj-check.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch b/meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
new file mode 100644
index 0000000..2b0ff67
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/define_insn_reservation.patch
@@ -0,0 +1,118 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From aab806a131efe9706396692ecc67d324371e39bc Mon Sep 17 00:00:00 2001
+From: edmarwjr <edmarwjr@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 22 Jun 2012 20:13:23 +0000
+Subject: [PATCH] 2012-06-22  Edmar Wienskoski  <edmar@freescale.com>
+
+	* config/rs6000/rs6000.md (define_attr "type"): New type popcnt.
+	(popcntb<mode>2): Add attribute type popcnt.
+	(popcntd<mode>2): Ditto.
+	* config/rs6000/power4.md (define_insn_reservation): Add type popcnt.
+	* config/rs6000/power5.md (define_insn_reservation): Ditto.
+	* config/rs6000/power7.md (define_insn_reservation): Ditto.
+	* config/rs6000/476.md (define_insn_reservation): Ditto.
+	* config/rs6000/power6.md (define_insn_reservation): New
+	reservation for popcnt instructions.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@188901 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog               |   12 ++++++++++++
+ gcc/config/rs6000/476.md    |    2 +-
+ gcc/config/rs6000/power5.md |    2 +-
+ gcc/config/rs6000/power6.md |    5 +++++
+ gcc/config/rs6000/power7.md |    2 +-
+ gcc/config/rs6000/rs6000.md |   10 +++++++---
+ 6 files changed, 27 insertions(+), 6 deletions(-)
+
+Index: gcc-4_7-branch/gcc/config/rs6000/476.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/476.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/476.md	2012-07-06 19:50:30.078779999 -0700
+@@ -71,7 +71,7 @@
+    ppc476_i_pipe|ppc476_lj_pipe")
+ 
+ (define_insn_reservation "ppc476-complex-integer" 1
+-  (and (eq_attr "type" "cmp,cr_logical,delayed_cr,cntlz,isel,isync,sync,trap")
++  (and (eq_attr "type" "cmp,cr_logical,delayed_cr,cntlz,isel,isync,sync,trap,popcnt")
+        (eq_attr "cpu" "ppc476"))
+   "ppc476_issue,\
+    ppc476_i_pipe")
+Index: gcc-4_7-branch/gcc/config/rs6000/power5.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/power5.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/power5.md	2012-07-06 19:50:30.078779999 -0700
+@@ -142,7 +142,7 @@
+ ; Integer latency is 2 cycles
+ (define_insn_reservation "power5-integer" 2
+   (and (eq_attr "type" "integer,insert_dword,shift,trap,\
+-                        var_shift_rotate,cntlz,exts,isel")
++                        var_shift_rotate,cntlz,exts,isel,popcnt")
+        (eq_attr "cpu" "power5"))
+   "iq_power5")
+ 
+Index: gcc-4_7-branch/gcc/config/rs6000/power6.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/power6.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/power6.md	2012-07-06 19:50:30.078779999 -0700
+@@ -216,6 +216,11 @@
+        (eq_attr "cpu" "power6"))
+   "FXU_power6")
+ 
++(define_insn_reservation "power6-popcnt" 1
++  (and (eq_attr "type" "popcnt")
++       (eq_attr "cpu" "power6"))
++  "FXU_power6")
++
+ (define_insn_reservation "power6-insert" 1
+   (and (eq_attr "type" "insert_word")
+        (eq_attr "cpu" "power6"))
+Index: gcc-4_7-branch/gcc/config/rs6000/power7.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/power7.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/power7.md	2012-07-06 19:50:30.078779999 -0700
+@@ -150,7 +150,7 @@
+ ; FX Unit
+ (define_insn_reservation "power7-integer" 1
+   (and (eq_attr "type" "integer,insert_word,insert_dword,shift,trap,\
+-                        var_shift_rotate,exts,isel")
++                        var_shift_rotate,exts,isel,popcnt")
+        (eq_attr "cpu" "power7"))
+   "DU_power7,FXU_power7")
+ 
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-07-06 19:44:38.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-07-06 19:50:30.078779999 -0700
+@@ -144,7 +144,7 @@
+ 
+ ;; Define an insn type attribute.  This is used in function unit delay
+ ;; computations.
+-(define_attr "type" "integer,two,three,load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,store,store_ux,store_u,fpload,fpload_ux,fpload_u,fpstore,fpstore_ux,fpstore_u,vecload,vecstore,imul,imul2,imul3,lmul,idiv,ldiv,insert_word,branch,cmp,fast_compare,compare,var_delayed_compare,delayed_compare,imul_compare,lmul_compare,fpcompare,cr_logical,delayed_cr,mfcr,mfcrf,mtcr,mfjmpr,mtjmpr,fp,fpsimple,dmul,sdiv,ddiv,ssqrt,dsqrt,jmpreg,brinc,vecsimple,veccomplex,vecdiv,veccmp,veccmpsimple,vecperm,vecfloat,vecfdiv,vecdouble,isync,sync,load_l,store_c,shift,trap,insert_dword,var_shift_rotate,cntlz,exts,mffgpr,mftgpr,isel"
++(define_attr "type" "integer,two,three,load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,store,store_ux,store_u,fpload,fpload_ux,fpload_u,fpstore,fpstore_ux,fpstore_u,vecload,vecstore,imul,imul2,imul3,lmul,idiv,ldiv,insert_word,branch,cmp,fast_compare,compare,var_delayed_compare,delayed_compare,imul_compare,lmul_compare,fpcompare,cr_logical,delayed_cr,mfcr,mfcrf,mtcr,mfjmpr,mtjmpr,fp,fpsimple,dmul,sdiv,ddiv,ssqrt,dsqrt,jmpreg,brinc,vecsimple,veccomplex,vecdiv,veccmp,veccmpsimple,vecperm,vecfloat,vecfdiv,vecdouble,isync,sync,load_l,store_c,shift,trap,insert_dword,var_shift_rotate,cntlz,exts,mffgpr,mftgpr,isel,popcnt"
+   (const_string "integer"))
+ 
+ ;; Define floating point instruction sub-types for use with Xfpu.md
+@@ -2329,13 +2329,17 @@
+         (unspec:GPR [(match_operand:GPR 1 "gpc_reg_operand" "r")]
+                      UNSPEC_POPCNTB))]
+   "TARGET_POPCNTB"
+-  "popcntb %0,%1")
++  "popcntb %0,%1"
++  [(set_attr "length" "4")
++   (set_attr "type" "popcnt")])
+ 
+ (define_insn "popcntd<mode>2"
+   [(set (match_operand:GPR 0 "gpc_reg_operand" "=r")
+ 	(popcount:GPR (match_operand:GPR 1 "gpc_reg_operand" "r")))]
+   "TARGET_POPCNTD"
+-  "popcnt<wd> %0,%1")
++  "popcnt<wd> %0,%1"
++  [(set_attr "length" "4")
++   (set_attr "type" "popcnt")])
+ 
+ (define_expand "popcount<mode>2"
+   [(set (match_operand:GPR 0 "gpc_reg_operand" "")
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch b/meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
new file mode 100644
index 0000000..5ca12a6
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/ppc_with_cpu.patch
@@ -0,0 +1,752 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 7630308303ea21c318bd57c35590fc4f249a30d8 Mon Sep 17 00:00:00 2001
+From: hainque <hainque@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 16 May 2012 08:43:41 +0000
+Subject: [PATCH]         * config/rs6000/rs6000-opts.h (enum processor_type):
+ Add         PROCESSOR_PPC8548.         *
+ config/rs6000/rs6000-cpus.def: Reference it for cpu="8548".
+         * config/rs6000/rs6000.md (cpu attribute
+ definition): Add ppc8548.         * config/rs6000/8540.md:
+ indicate that the units/patterns apply to         ppc8548
+ as well.
+
+        * config/rs6000/rs6000.c (rs6000_option_override_internal): Rename
+        default_cpu into implicit_cpu, conveying what --with-cpu was passed at
+        configure time. Treat implicit_cpu as have_CPU. Pick defaults for SPE
+        related flags,  check that what is queried is supported by the selected
+        configuration. Rework the single/double_float and MASK_STRING resets to
+        hit for all the E500 cores (854x + E500MC variants). Select the ppc8540
+        costs for PROCESSOR_PPC8548 as well.
+        (rs6000_issue_rate): case CPU_PPC8548 together with CPU_PPC8540.
+        (rs6000_use_sched_lookahead): Likewise, rewriting function as a case
+        statement instead of a sequence of ifs.
+
+        * config/rs6000/rs6000.h (TARGET_E500): Remove.
+        (TARGET_NO_LWSYNC): Adjust accordingly.
+        * config/rs6000/e500.h (TARGET_E500): Remove.
+        (CHECK_E500_OPTIONS): Adjust accordingly.
+        * config/rs6000/eabispe.h (SUBSUBTARGET_OVERRIDE_OPTIONS): Remove.
+        (TARGET_DEFAULT): Reformat definition to match the one in linuxspe.h.
+        * config/rs6000/linuxspe.h: Likewise.
+        * config/rs6000/vxworks.h: Remove bogus TARGET_E500 overrides and
+        superfluous comments.
+        * config/rs6000/e500-double.h: Remove.
+
+        * config.gcc (pick a default with_cpu): For powerpc*-*-*spe*,
+        default to with_cpu=8548 if --enable-e500-double, and to 8540
+        otherwise.
+        (set misc flags section): For powerpc*|rs6000*, remove inclusion
+        of e500-double.h for --enable-e500-double.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@187581 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                     |   37 +++++++++
+ gcc/config.gcc                    |   12 +--
+ gcc/config/rs6000/8540.md         |   50 ++++++------
+ gcc/config/rs6000/e500-double.h   |   24 ------
+ gcc/config/rs6000/e500.h          |   10 +--
+ gcc/config/rs6000/eabispe.h       |   17 +---
+ gcc/config/rs6000/linuxspe.h      |   16 +---
+ gcc/config/rs6000/rs6000-cpus.def |    3 +-
+ gcc/config/rs6000/rs6000-opts.h   |    1 +
+ gcc/config/rs6000/rs6000.c        |  155 +++++++++++++++++++++++--------------
+ gcc/config/rs6000/rs6000.h        |    7 +-
+ gcc/config/rs6000/rs6000.md       |    2 +-
+ gcc/config/rs6000/rtems.h         |   14 ----
+ gcc/config/rs6000/vxworks.h       |   11 ---
+ 14 files changed, 178 insertions(+), 181 deletions(-)
+
+Index: gcc-4_7-branch/gcc/config.gcc
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-07-06 19:44:38.000000000 -0700
+@@ -2876,6 +2876,13 @@
+     mips*-*-vxworks)
+       with_arch=mips2
+       ;;
++    powerpc*-*-*spe*)
++      if test x$enable_e500_double = xyes; then
++         with_cpu=8548
++      else
++         with_cpu=8540
++      fi       
++      ;;
+     sparc-leon*-*)
+       with_cpu=v8;
+       ;;
+@@ -3564,11 +3571,6 @@
+ 		c_target_objs="${c_target_objs} rs6000-c.o"
+ 		cxx_target_objs="${cxx_target_objs} rs6000-c.o"
+ 		tmake_file="rs6000/t-rs6000 ${tmake_file}"
+-
+-                if test x$enable_e500_double = xyes
+-                then
+-                        tm_file="$tm_file rs6000/e500-double.h"
+-                fi
+ 		;;
+ 
+ 	sh[123456ble]*-*-* | sh-*-*)
+Index: gcc-4_7-branch/gcc/config/rs6000/8540.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/8540.md	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/8540.md	2012-07-06 19:44:38.466780001 -0700
+@@ -87,18 +87,18 @@
+   (and (eq_attr "type" "integer,insert_word,insert_dword,cmp,compare,\
+                         delayed_compare,var_delayed_compare,fast_compare,\
+                         shift,trap,var_shift_rotate,cntlz,exts,isel")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ (define_insn_reservation "ppc8540_two" 1
+   (and (eq_attr "type" "two")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire,\
+    ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ (define_insn_reservation "ppc8540_three" 1
+   (and (eq_attr "type" "three")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire,\
+    ppc8540_issue+ppc8540_su_stage0+ppc8540_retire,\
+    ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+@@ -106,13 +106,13 @@
+ ;; Branch.  Actually this latency time is not used by the scheduler.
+ (define_insn_reservation "ppc8540_branch" 1
+   (and (eq_attr "type" "jmpreg,branch,isync")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_bu,ppc8540_retire")
+ 
+ ;; Multiply
+ (define_insn_reservation "ppc8540_multiply" 4
+   (and (eq_attr "type" "imul,imul2,imul3,imul_compare")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+@@ -122,57 +122,57 @@
+ ;; time.
+ (define_insn_reservation "ppc8540_divide" 14
+   (and (eq_attr "type" "idiv")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0+ppc8540_mu_div,\
+    ppc8540_mu_div*13")
+ 
+ ;; CR logical
+ (define_insn_reservation "ppc8540_cr_logical" 1
+   (and (eq_attr "type" "cr_logical,delayed_cr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_bu,ppc8540_retire")
+ 
+ ;; Mfcr
+ (define_insn_reservation "ppc8540_mfcr" 1
+   (and (eq_attr "type" "mfcr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Mtcrf
+ (define_insn_reservation "ppc8540_mtcrf" 1
+   (and (eq_attr "type" "mtcr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Mtjmpr
+ (define_insn_reservation "ppc8540_mtjmpr" 1
+   (and (eq_attr "type" "mtjmpr,mfjmpr")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; Loads
+ (define_insn_reservation "ppc8540_load" 3
+   (and (eq_attr "type" "load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,\
+ 			load_l,sync")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+ 
+ ;; Stores.
+ (define_insn_reservation "ppc8540_store" 3
+   (and (eq_attr "type" "store,store_ux,store_u,store_c")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+ 
+ ;; Simple FP
+ (define_insn_reservation "ppc8540_simple_float" 1
+   (and (eq_attr "type" "fpsimple")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; FP
+ (define_insn_reservation "ppc8540_float" 4
+   (and (eq_attr "type" "fp")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+@@ -180,44 +180,44 @@
+ ;; because of the result automata will be huge.
+ (define_insn_reservation "ppc8540_float_vector_divide" 29
+   (and (eq_attr "type" "vecfdiv")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0+ppc8540_mu_div,\
+    ppc8540_mu_div*28")
+ 
+ ;; Brinc
+ (define_insn_reservation "ppc8540_brinc" 1
+   (and (eq_attr "type" "brinc")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; Simple vector
+ (define_insn_reservation "ppc8540_simple_vector" 1
+   (and (eq_attr "type" "vecsimple")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Simple vector compare
+ (define_insn_reservation "ppc8540_simple_vector_compare" 1
+   (and (eq_attr "type" "veccmpsimple")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su_stage0+ppc8540_retire")
+ 
+ ;; Vector compare
+ (define_insn_reservation "ppc8540_vector_compare" 1
+   (and (eq_attr "type" "veccmp")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; evsplatfi evsplati
+ (define_insn_reservation "ppc8540_vector_perm" 1
+   (and (eq_attr "type" "vecperm")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_su1_stage0+ppc8540_retire")
+ 
+ ;; Vector float
+ (define_insn_reservation "ppc8540_float_vector" 4
+   (and (eq_attr "type" "vecfloat")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+@@ -226,25 +226,25 @@
+ ;; of miu_stage3 here because we use the average latency time.
+ (define_insn_reservation "ppc8540_vector_divide" 14
+   (and (eq_attr "type" "vecdiv")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0+ppc8540_mu_div,\
+    ppc8540_mu_div*13")
+ 
+ ;; Complex vector.
+ (define_insn_reservation "ppc8540_complex_vector" 4
+   (and (eq_attr "type" "veccomplex")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_mu_stage0,ppc8540_mu_stage1,\
+    ppc8540_mu_stage2,ppc8540_mu_stage3+ppc8540_retire")
+ 
+ ;; Vector load
+ (define_insn_reservation "ppc8540_vector_load" 3
+   (and (eq_attr "type" "vecload")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+ 
+ ;; Vector store
+ (define_insn_reservation "ppc8540_vector_store" 3
+   (and (eq_attr "type" "vecstore")
+-       (eq_attr "cpu" "ppc8540"))
++       (eq_attr "cpu" "ppc8540,ppc8548"))
+   "ppc8540_decode,ppc8540_issue+ppc8540_lsu,nothing,ppc8540_retire")
+Index: gcc-4_7-branch/gcc/config/rs6000/e500-double.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/e500-double.h	2012-07-05 23:49:07.000000000 -0700
++++ /dev/null	1970-01-01 00:00:00.000000000 +0000
+@@ -1,24 +0,0 @@
+-/* Target definitions for E500 with double precision FP.
+-   Copyright (C) 2004, 2006, 2007, 2011 Free Software Foundation, Inc.
+-   Contributed by Aldy Hernandez (aldyh@redhat.com).
+-
+-   This file is part of GCC.
+-
+-   GCC is free software; you can redistribute it and/or modify it
+-   under the terms of the GNU General Public License as published
+-   by the Free Software Foundation; either version 3, or (at your
+-   option) any later version.
+-
+-   GCC is distributed in the hope that it will be useful, but WITHOUT
+-   ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
+-   or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
+-   License for more details.
+-
+-   You should have received a copy of the GNU General Public License
+-   along with GCC; see the file COPYING3.  If not see
+-   <http://www.gnu.org/licenses/>.  */
+-
+-#undef  SUB3TARGET_OVERRIDE_OPTIONS
+-#define SUB3TARGET_OVERRIDE_OPTIONS \
+-  if (!global_options_set.x_rs6000_float_gprs) \
+-    rs6000_float_gprs = 2;
+Index: gcc-4_7-branch/gcc/config/rs6000/e500.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/e500.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/e500.h	2012-07-06 19:44:38.466780001 -0700
+@@ -19,7 +19,6 @@
+ 
+ #undef TARGET_SPE_ABI
+ #undef TARGET_SPE
+-#undef TARGET_E500
+ #undef TARGET_FPRS
+ #undef TARGET_E500_SINGLE
+ #undef TARGET_E500_DOUBLE
+@@ -27,21 +26,20 @@
+ 
+ #define TARGET_SPE_ABI rs6000_spe_abi
+ #define TARGET_SPE rs6000_spe
+-#define TARGET_E500 (rs6000_cpu == PROCESSOR_PPC8540)
+ #define TARGET_FPRS (rs6000_float_gprs == 0)
+ #define TARGET_E500_SINGLE (TARGET_HARD_FLOAT && rs6000_float_gprs == 1)
+ #define TARGET_E500_DOUBLE (TARGET_HARD_FLOAT && rs6000_float_gprs == 2)
+ #define CHECK_E500_OPTIONS						\
+   do {									\
+-    if (TARGET_E500 || TARGET_SPE || TARGET_SPE_ABI			\
++    if (TARGET_SPE || TARGET_SPE_ABI					\
+ 	|| TARGET_E500_SINGLE || TARGET_E500_DOUBLE)			\
+       {									\
+ 	if (TARGET_ALTIVEC)						\
+-	  error ("AltiVec and E500 instructions cannot coexist");	\
++	  error ("AltiVec and SPE instructions cannot coexist");	\
+ 	if (TARGET_VSX)							\
+-	  error ("VSX and E500 instructions cannot coexist");		\
++	  error ("VSX and SPE instructions cannot coexist");		\
+ 	if (TARGET_64BIT)						\
+-	  error ("64-bit E500 not supported");				\
++	  error ("64-bit SPE not supported");				\
+ 	if (TARGET_HARD_FLOAT && TARGET_FPRS)				\
+ 	  error ("E500 and FPRs not supported");			\
+       }									\
+Index: gcc-4_7-branch/gcc/config/rs6000/eabispe.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/eabispe.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/eabispe.h	2012-07-06 19:44:38.466780001 -0700
+@@ -21,21 +21,8 @@
+    <http://www.gnu.org/licenses/>.  */
+ 
+ #undef  TARGET_DEFAULT
+-#define TARGET_DEFAULT (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_EABI	\
+-  | MASK_STRICT_ALIGN)
+-
+-#undef  SUBSUBTARGET_OVERRIDE_OPTIONS
+-#define SUBSUBTARGET_OVERRIDE_OPTIONS \
+-  if (!global_options_set.x_rs6000_cpu_index) \
+-    rs6000_cpu = PROCESSOR_PPC8540; \
+-  if (!global_options_set.x_rs6000_spe_abi) \
+-    rs6000_spe_abi = 1; \
+-  if (!global_options_set.x_rs6000_float_gprs) \
+-    rs6000_float_gprs = 1; \
+-  if (!global_options_set.x_rs6000_spe) \
+-    rs6000_spe = 1; \
+-  if (target_flags & MASK_64BIT) \
+-    error ("-m64 not supported in this configuration")
++#define TARGET_DEFAULT \
++  (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_STRICT_ALIGN | MASK_EABI)
+ 
+ #undef  ASM_DEFAULT_SPEC
+ #define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
+Index: gcc-4_7-branch/gcc/config/rs6000/linuxspe.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/linuxspe.h	2012-07-05 23:52:14.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/linuxspe.h	2012-07-06 19:44:38.466780001 -0700
+@@ -22,20 +22,8 @@
+ 
+ /* Override rs6000.h and sysv4.h definition.  */
+ #undef	TARGET_DEFAULT
+-#define	TARGET_DEFAULT (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_STRICT_ALIGN)
+-
+-#undef  SUBSUBTARGET_OVERRIDE_OPTIONS
+-#define SUBSUBTARGET_OVERRIDE_OPTIONS \
+-  if (!global_options_set.x_rs6000_cpu_index) \
+-    rs6000_cpu = PROCESSOR_PPC8540; \
+-  if (!global_options_set.x_rs6000_spe_abi) \
+-    rs6000_spe_abi = 1; \
+-  if (!global_options_set.x_rs6000_float_gprs) \
+-    rs6000_float_gprs = 1; \
+-  if (!global_options_set.x_rs6000_spe) \
+-    rs6000_spe = 1; \
+-  if (target_flags & MASK_64BIT) \
+-    error ("-m64 not supported in this configuration")
++#define TARGET_DEFAULT \
++  (MASK_POWERPC | MASK_NEW_MNEMONICS | MASK_STRICT_ALIGN)
+ 
+ #undef  ASM_DEFAULT_SPEC
+ #define	ASM_DEFAULT_SPEC "-mppc -mspe -me500"
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:44:38.000000000 -0700
+@@ -76,8 +76,7 @@
+ RS6000_CPU ("823", PROCESSOR_MPCCORE, POWERPC_BASE_MASK | MASK_SOFT_FLOAT)
+ RS6000_CPU ("8540", PROCESSOR_PPC8540, POWERPC_BASE_MASK | MASK_STRICT_ALIGN
+ 	    | MASK_ISEL)
+-/* 8548 has a dummy entry for now.  */
+-RS6000_CPU ("8548", PROCESSOR_PPC8540, POWERPC_BASE_MASK | MASK_STRICT_ALIGN
++RS6000_CPU ("8548", PROCESSOR_PPC8548, POWERPC_BASE_MASK | MASK_STRICT_ALIGN
+ 	    | MASK_ISEL)
+ RS6000_CPU ("a2", PROCESSOR_PPCA2,
+ 	    POWERPC_BASE_MASK | MASK_PPC_GFXOPT | MASK_POWERPC64 | MASK_POPCNTB
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:44:38.000000000 -0700
+@@ -49,6 +49,7 @@
+    PROCESSOR_PPC7400,
+    PROCESSOR_PPC7450,
+    PROCESSOR_PPC8540,
++   PROCESSOR_PPC8548,
+    PROCESSOR_PPCE300C2,
+    PROCESSOR_PPCE300C3,
+    PROCESSOR_PPCE500MC,
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.c	2012-07-06 19:43:53.194780001 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.c	2012-07-06 19:44:38.000000000 -0700
+@@ -2597,7 +2597,10 @@
+ {
+   bool ret = true;
+   bool have_cpu = false;
+-  const char *default_cpu = OPTION_TARGET_CPU_DEFAULT;
++
++  /* The default cpu requested at configure time, if any.  */
++  const char *implicit_cpu = OPTION_TARGET_CPU_DEFAULT;
++
+   int set_masks;
+   int cpu_index;
+   int tune_index;
+@@ -2616,11 +2619,6 @@
+     warning (0, "-malign-power is not supported for 64-bit Darwin;"
+ 	     " it is incompatible with the installed C and C++ libraries");
+ 
+-  if (global_options_set.x_rs6000_spe_abi
+-      && rs6000_spe_abi
+-      && !TARGET_SPE_ABI)
+-    error ("not configured for SPE ABI");
+-
+   /* Numerous experiment shows that IRA based loop pressure
+      calculation works better for RTL loop invariant motion on targets
+      with enough (>= 32) registers.  It is an expensive optimization.
+@@ -2656,7 +2654,8 @@
+   /* Process the -mcpu=<xxx> and -mtune=<xxx> argument.  If the user changed
+      the cpu in a target attribute or pragma, but did not specify a tuning
+      option, use the cpu for the tuning option rather than the option specified
+-     with -mtune on the command line.  */
++     with -mtune on the command line.  Process a '--with-cpu' configuration
++     request as an implicit --cpu.  */
+   if (rs6000_cpu_index >= 0)
+     {
+       cpu_index = rs6000_cpu_index;
+@@ -2669,10 +2668,12 @@
+     }
+   else
+     {
+-      if (!default_cpu)
+-	default_cpu = (TARGET_POWERPC64 ? "powerpc64" : "powerpc");
++      const char *default_cpu =
++        (implicit_cpu ? implicit_cpu
++         : (TARGET_POWERPC64 ? "powerpc64" : "powerpc"));
+ 
+       rs6000_cpu_index = cpu_index = rs6000_cpu_name_lookup (default_cpu);
++      have_cpu = implicit_cpu != 0;
+     }
+ 
+   gcc_assert (cpu_index >= 0);
+@@ -2703,6 +2704,42 @@
+   gcc_assert (tune_index >= 0);
+   rs6000_cpu = processor_target_table[tune_index].processor;
+ 
++  /* Pick defaults for SPE related control flags.  Do this early to make sure
++     that the TARGET_ macros are representative ASAP.  */
++  {
++    int spe_capable_cpu =
++      (rs6000_cpu == PROCESSOR_PPC8540
++       || rs6000_cpu == PROCESSOR_PPC8548);
++
++    if (!global_options_set.x_rs6000_spe_abi)
++      rs6000_spe_abi = spe_capable_cpu;
++
++    if (!global_options_set.x_rs6000_spe)
++      rs6000_spe = spe_capable_cpu;
++
++    if (!global_options_set.x_rs6000_float_gprs)
++      rs6000_float_gprs =
++        (rs6000_cpu == PROCESSOR_PPC8540 ? 1
++         : rs6000_cpu == PROCESSOR_PPC8548 ? 2
++         : 0);
++  }
++
++  if (global_options_set.x_rs6000_spe_abi
++      && rs6000_spe_abi
++      && !TARGET_SPE_ABI)
++    error ("not configured for SPE ABI");
++
++  if (global_options_set.x_rs6000_spe
++      && rs6000_spe
++      && !TARGET_SPE)
++    error ("not configured for SPE instruction set");
++
++  if (main_target_opt != NULL
++      && ((main_target_opt->x_rs6000_spe_abi != rs6000_spe_abi)
++          || (main_target_opt->x_rs6000_spe != rs6000_spe)
++          || (main_target_opt->x_rs6000_float_gprs != rs6000_float_gprs)))
++    error ("target attribute or pragma changes SPE ABI");
++
+   if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3
+       || rs6000_cpu == PROCESSOR_PPCE500MC || rs6000_cpu == PROCESSOR_PPCE500MC64)
+     {
+@@ -2938,35 +2975,44 @@
+   SUB3TARGET_OVERRIDE_OPTIONS;
+ #endif
+ 
+-  if (TARGET_E500 || rs6000_cpu == PROCESSOR_PPCE500MC
+-      || rs6000_cpu == PROCESSOR_PPCE500MC64)
++  /* For the E500 family of cores, reset the single/double FP flags to let us
++     check that they remain constant across attributes or pragmas.  Also,
++     clear a possible request for string instructions, not supported and which
++     we might have silently queried above for -Os. 
++
++     For other families, clear ISEL in case it was set implicitly.
++  */
++
++  switch (rs6000_cpu)
+     {
+-      /* The e500 and e500mc do not have string instructions, and we set
+-	 MASK_STRING above when optimizing for size.  */
+-      if ((target_flags & MASK_STRING) != 0)
+-	target_flags = target_flags & ~MASK_STRING;
+-    }
+-  else if (global_options_set.x_rs6000_cpu_index)
+-    {
+-      /* For the powerpc-eabispe configuration, we set all these by
+-	 default, so let's unset them if we manually set another
+-	 CPU that is not the E500.  */
+-      if (main_target_opt != NULL
+-	  && ((main_target_opt->x_rs6000_spe_abi != rs6000_spe_abi)
+-	      || (main_target_opt->x_rs6000_spe != rs6000_spe)
+-	      || (main_target_opt->x_rs6000_float_gprs != rs6000_float_gprs)))
+-	error ("target attribute or pragma changes SPE ABI");
+-      else
+-	{
+-	  if (!global_options_set.x_rs6000_spe_abi)
+-	    rs6000_spe_abi = 0;
+-	  if (!global_options_set.x_rs6000_spe)
+-	    rs6000_spe = 0;
+-	  if (!global_options_set.x_rs6000_float_gprs)
+-	    rs6000_float_gprs = 0;
+-	}
+-      if (!(target_flags_explicit & MASK_ISEL))
++    case PROCESSOR_PPC8540:
++    case PROCESSOR_PPC8548:
++    case PROCESSOR_PPCE500MC:
++    case PROCESSOR_PPCE500MC64:
++
++      rs6000_single_float = TARGET_E500_SINGLE || TARGET_E500_DOUBLE;
++      rs6000_double_float = TARGET_E500_DOUBLE;
++
++      target_flags &= ~MASK_STRING;
++
++      break;
++
++    default:
++
++      if (have_cpu && !(target_flags_explicit & MASK_ISEL))
+ 	target_flags &= ~MASK_ISEL;
++
++      break;
++    }
++
++  if (main_target_opt)
++    {
++      if (main_target_opt->x_rs6000_single_float != rs6000_single_float)
++	error ("target attribute or pragma changes single precision floating "
++	       "point");
++      if (main_target_opt->x_rs6000_double_float != rs6000_double_float)
++	error ("target attribute or pragma changes double precision floating "
++	       "point");
+     }
+ 
+   /* Detect invalid option combinations with E500.  */
+@@ -3193,6 +3239,7 @@
+ 	break;
+ 
+       case PROCESSOR_PPC8540:
++      case PROCESSOR_PPC8548:
+ 	rs6000_cost = &ppc8540_cost;
+ 	break;
+ 
+@@ -3265,26 +3312,6 @@
+       && rs6000_single_float == 0 && rs6000_double_float == 0)
+     rs6000_single_float = rs6000_double_float = 1;
+ 
+-  /* Reset single and double FP flags if target is E500. */
+-  if (TARGET_E500) 
+-  {
+-    rs6000_single_float = rs6000_double_float = 0;
+-    if (TARGET_E500_SINGLE)
+-      rs6000_single_float = 1; 
+-    if (TARGET_E500_DOUBLE)
+-      rs6000_single_float = rs6000_double_float = 1;
+-  }
+-
+-  if (main_target_opt)
+-    {
+-      if (main_target_opt->x_rs6000_single_float != rs6000_single_float)
+-	error ("target attribute or pragma changes single precision floating "
+-	       "point");
+-      if (main_target_opt->x_rs6000_double_float != rs6000_double_float)
+-	error ("target attribute or pragma changes double precision floating "
+-	       "point");
+-    }
+-
+   /* If not explicitly specified via option, decide whether to generate indexed
+      load/store instructions.  */
+   if (TARGET_AVOID_XFORM == -1)
+@@ -22816,6 +22843,7 @@
+   case CPU_PPC750:
+   case CPU_PPC7400:
+   case CPU_PPC8540:
++  case CPU_PPC8548:
+   case CPU_CELL:
+   case CPU_PPCE300C2:
+   case CPU_PPCE300C3:
+@@ -22846,11 +22874,18 @@
+ static int
+ rs6000_use_sched_lookahead (void)
+ {
+-  if (rs6000_cpu_attr == CPU_PPC8540)
+-    return 4;
+-  if (rs6000_cpu_attr == CPU_CELL)
+-    return (reload_completed ? 8 : 0);
+-  return 0;
++  switch (rs6000_cpu_attr)
++    {
++    case CPU_PPC8540:
++    case CPU_PPC8548:
++      return 4;
++
++    case CPU_CELL:
++      return (reload_completed ? 8 : 0);
++
++    default:
++      return 0;
++    }
+ }
+ 
+ /* We are choosing insn from the ready queue.  Return nonzero if INSN can be chosen.  */
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.h	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.h	2012-07-06 19:44:38.000000000 -0700
+@@ -457,7 +457,6 @@
+ 
+ #define TARGET_SPE_ABI 0
+ #define TARGET_SPE 0
+-#define TARGET_E500 0
+ #define TARGET_ISEL64 (TARGET_ISEL && TARGET_POWERPC64)
+ #define TARGET_FPRS 1
+ #define TARGET_E500_SINGLE 0
+@@ -500,11 +499,11 @@
+ 				      || TARGET_ALTIVEC			 \
+ 				      || TARGET_VSX)))
+ 
++/* E500 cores only support plain "sync", not lwsync.  */
++#define TARGET_NO_LWSYNC (rs6000_cpu == PROCESSOR_PPC8540 \
++			  || rs6000_cpu == PROCESSOR_PPC8548)
+ 
+ 
+-/* E500 processors only support plain "sync", not lwsync.  */
+-#define TARGET_NO_LWSYNC TARGET_E500
+-
+ /* Which machine supports the various reciprocal estimate instructions.  */
+ #define TARGET_FRES	(TARGET_HARD_FLOAT && TARGET_PPC_GFXOPT \
+ 			 && TARGET_FPRS && TARGET_SINGLE_FLOAT)
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.md
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-07-06 19:44:38.000000000 -0700
+@@ -166,7 +166,7 @@
+ ;; Processor type -- this attribute must exactly match the processor_type
+ ;; enumeration in rs6000.h.
+ 
+-(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
++(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppc8548,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
+   (const (symbol_ref "rs6000_cpu_attr")))
+ 
+ 
+Index: gcc-4_7-branch/gcc/config/rs6000/rtems.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rtems.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rtems.h	2012-07-06 19:44:38.470780001 -0700
+@@ -55,17 +55,3 @@
+ #undef  SUBSUBTARGET_EXTRA_SPECS
+ #define SUBSUBTARGET_EXTRA_SPECS \
+   { "cpp_os_rtems",		CPP_OS_RTEMS_SPEC }
+-
+-#undef SUBSUBTARGET_OVERRIDE_OPTIONS
+-#define SUBSUBTARGET_OVERRIDE_OPTIONS                                     \
+-  do {                                                                    \
+-   if (TARGET_E500)                                                       \
+-      {                                                                   \
+-        if (TARGET_HARD_FLOAT && !global_options_set.x_rs6000_float_gprs) \
+-          rs6000_float_gprs = 1;                                          \
+-        if (rs6000_float_gprs != 0 && !global_options_set.x_rs6000_spe)   \
+-          rs6000_spe = 1;                                                 \
+-        if (rs6000_spe && !global_options_set.x_rs6000_spe_abi)           \
+-          rs6000_spe_abi = 1;                                             \
+-      }                                                                   \
+-  } while(0)
+Index: gcc-4_7-branch/gcc/config/rs6000/vxworks.h
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/vxworks.h	2012-07-05 23:49:07.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/vxworks.h	2012-07-06 19:44:38.470780001 -0700
+@@ -122,19 +122,8 @@
+ 
+ #undef  ABI_STACK_BOUNDARY
+ 
+-/* Make -mcpu=8540 imply SPE.  ISEL is automatically enabled, the
+-   others must be done by hand.  Handle -mrtp.  Disable -fPIC
+-   for -mrtp - the VxWorks PIC model is not compatible with it.  */
+ #undef SUBSUBTARGET_OVERRIDE_OPTIONS
+ #define SUBSUBTARGET_OVERRIDE_OPTIONS		\
+-  do {						\
+-    if (TARGET_E500)				\
+-      {						\
+-	rs6000_spe = 1;				\
+-	rs6000_spe_abi = 1;			\
+-	rs6000_float_gprs = 1;			\
+-      }						\
+-						\
+   if (!global_options_set.x_g_switch_value)	\
+     g_switch_value = SDATA_DEFAULT_SIZE;	\
+   VXWORKS_OVERRIDE_OPTIONS;			\
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/powerpc-e5500.patch b/meta/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
similarity index 41%
rename from meta/recipes-devtools/gcc/gcc-4.7/powerpc-e5500.patch
rename to meta/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
index 1c9736b..e3341fc 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7/powerpc-e5500.patch
+++ b/meta/recipes-devtools/gcc/gcc-4.7/ppce5500-e6500-support.patch
@@ -1,49 +1,91 @@
-Upstream-Status: Pending
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
 
-Implements basic e5500 enablement in gcc, with a scheduler, -mcpu
-flag, etc...
+From b770074cee13445eba1bf4e99649c5ceac9a4b5a Mon Sep 17 00:00:00 2001
+From: edmarwjr <edmarwjr@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 5 Jun 2012 16:05:16 +0000
+Subject: [PATCH] 2012-06-01  Edmar Wienskoski  <edmar@freescale.com>
 
-Also splits the masks for popcntb, popcntd, and cmpb. Originally those
-masks would also control other instructions that e5500 does not
-support (so, we either get none or all).
+	* config/rs6000/e5500.md: New file.
+	* config/rs6000/e6500.md: New file.
+	* config/rs6000/rs6000.c (processor_costs): Add new costs for
+	e5500 and e6500.
+	(rs6000_option_override_internal): Altivec and Spe options not
+	allowed with e5500. Spe options not allowed with e6500. Increase
+	move inline limit for e5500 and e6500. Disable string instructions
+	for e5500 and e6500. Enable branch targets alignment for e5500 and
+	e6500. Initialize rs6000_cost for e5500 and e6500.
+	(rs6000_adjust_cost): Add extra scheduling cycles between compare
+	and brnach for e5500 and e6500.
+	(rs6000_issue_rate): Set issue rate for e5500 and e6500.
+	* config/rs6000/rs6000-cpus.def: Add cpu definitions for e5500 and
+	e6500.
+	* config/rs6000/rs6000.h (ASM_CPU_SPEC): Add e5500 and e6500.
+	* config/rs6000/rs6000.md (define_attr "cpu"): Add ppce5500 and
+	ppce6500.
+	Include e5500.md and e6500.md.
+	* config/rs6000/rs6000-opt.h (processor_type): Add
+	PROCESSOR_PPCE5500 and PROCESSOR_PPCE6500.
+	* config.gcc (cpu_is_64bit): Add new cores e5500, e6500.
+	(powerpc*-*-*): Add new cores e5500, e6500.
+	* doc/invoke.texi: (item -mcpu): Add e5500 and e6500 to list of cpus.
 
-For the lack of means to do tests, those instructions were never
-enabled until now. The new instructions enabled with this patch are:
-popcntb, popcntw, popcntd, bpermd, prtyw, prtyd, cmpb, ldbrx, and
-stdbrx.
+gcc/testsuite
+2012-06-01  Edmar Wienskoski  <edmar@freescale.com>
 
-Signed-off-by: Edmar Wienskoski <edmar@freescale.com>
-Signed-off-by: Kumar Gala <galak@kernel.crashing.org>
+	* gcc.dg/tree-ssa/vector-3.c: Adjust regular expression.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@188244 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                            |   26 ++++
+ gcc/config.gcc                           |    6 +-
+ gcc/config/rs6000/e5500.md               |  176 ++++++++++++++++++++++++
+ gcc/config/rs6000/e6500.md               |  213 ++++++++++++++++++++++++++++++
+ gcc/config/rs6000/rs6000-cpus.def        |    4 +
+ gcc/config/rs6000/rs6000-opts.h          |    2 +
+ gcc/config/rs6000/rs6000.c               |   68 +++++++++-
+ gcc/config/rs6000/rs6000.h               |    2 +
+ gcc/config/rs6000/rs6000.md              |    4 +-
+ gcc/doc/invoke.texi                      |   12 +-
+ gcc/testsuite/ChangeLog                  |    4 +
+ gcc/testsuite/gcc.dg/tree-ssa/vector-3.c |    2 +-
+ 12 files changed, 506 insertions(+), 13 deletions(-)
+ create mode 100644 gcc/config/rs6000/e5500.md
+ create mode 100644 gcc/config/rs6000/e6500.md
 
 Index: gcc-4_7-branch/gcc/config.gcc
 ===================================================================
---- gcc-4_7-branch.orig/gcc/config.gcc	2012-04-10 10:32:36.823374222 -0700
-+++ gcc-4_7-branch/gcc/config.gcc	2012-04-10 10:39:32.543394369 -0700
+--- gcc-4_7-branch.orig/gcc/config.gcc	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config.gcc	2012-07-06 19:53:26.350779999 -0700
 @@ -413,7 +413,7 @@
  	extra_headers="ppc-asm.h altivec.h spe.h ppu_intrinsics.h paired.h spu2vmx.h vec_types.h si2vmx.h"
  	need_64bit_hwint=yes
  	case x$with_cpu in
 -	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[34567]|xpower6x|xrs64a|xcell|xa2|xe500mc64)
-+	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[34567]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500)
++	    xpowerpc64|xdefault64|x6[23]0|x970|xG5|xpower[34567]|xpower6x|xrs64a|xcell|xa2|xe500mc64|xe5500|Xe6500)
  		cpu_is_64bit=yes
  		;;
  	esac
-@@ -3342,7 +3342,7 @@
+@@ -3361,8 +3361,8 @@
  			| 401 | 403 | 405 | 405fp | 440 | 440fp | 464 | 464fp \
  			| 476 | 476fp | 505 | 601 | 602 | 603 | 603e | ec603e \
  			| 604 | 604e | 620 | 630 | 740 | 750 | 7400 | 7450 \
 -			| a2 | e300c[23] | 854[08] | e500mc | e500mc64 | titan\
-+			| a2 | e300c[23] | 854[08] | e500mc | e500mc64 | e5500 | titan\
- 			| 801 | 821 | 823 | 860 | 970 | G3 | G4 | G5 | cell)
+-			| 801 | 821 | 823 | 860 | 970 | G3 | G4 | G5 | cell)
++			| a2 | e300c[23] | 854[08] | e500mc | e500mc64 | e5500 | e6500 \
++			| titan | 801 | 821 | 823 | 860 | 970 | G3 | G4 | G5 | cell)
  				# OK
  				;;
+ 			*)
 Index: gcc-4_7-branch/gcc/config/rs6000/e5500.md
 ===================================================================
 --- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ gcc-4_7-branch/gcc/config/rs6000/e5500.md	2012-04-10 10:39:32.543394369 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/e5500.md	2012-07-06 19:53:26.350779999 -0700
 @@ -0,0 +1,176 @@
 +;; Pipeline description for Freescale PowerPC e5500 core.
-+;;   Copyright (C) 2011 Free Software Foundation, Inc.
++;;   Copyright (C) 2012 Free Software Foundation, Inc.
 +;;   Contributed by Edmar Wienskoski (edmar@freescale.com)
 +;;
 +;; This file is part of GCC.
@@ -111,7 +153,7 @@ Index: gcc-4_7-branch/gcc/config/rs6000/e5500.md
 +  "e5500_decode,e5500_sfx")
 +
 +(define_insn_reservation "e5500_delayed" 2
-+  (and (eq_attr "type" "var_shift_rotate,var_delayed_compare,popcnt")
++  (and (eq_attr "type" "var_shift_rotate,var_delayed_compare")
 +       (eq_attr "cpu" "ppce5500"))
 +  "e5500_decode,e5500_sfx*2")
 +
@@ -218,23 +260,257 @@ Index: gcc-4_7-branch/gcc/config/rs6000/e5500.md
 +  (and (eq_attr "type" "cr_logical,delayed_cr")
 +       (eq_attr "cpu" "ppce5500"))
 +  "e5500_decode,e5500_bu")
+Index: gcc-4_7-branch/gcc/config/rs6000/e6500.md
+===================================================================
+--- /dev/null	1970-01-01 00:00:00.000000000 +0000
++++ gcc-4_7-branch/gcc/config/rs6000/e6500.md	2012-07-06 19:53:26.354779999 -0700
+@@ -0,0 +1,213 @@
++;; Pipeline description for Freescale PowerPC e6500 core.
++;;   Copyright (C) 2012 Free Software Foundation, Inc.
++;;   Contributed by Edmar Wienskoski (edmar@freescale.com)
++;;
++;; This file is part of GCC.
++;;
++;; GCC is free software; you can redistribute it and/or modify it
++;; under the terms of the GNU General Public License as published
++;; by the Free Software Foundation; either version 3, or (at your
++;; option) any later version.
++;;
++;; GCC is distributed in the hope that it will be useful, but WITHOUT
++;; ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
++;; or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public
++;; License for more details.
++;;
++;; You should have received a copy of the GNU General Public License
++;; along with GCC; see the file COPYING3.  If not see
++;; <http://www.gnu.org/licenses/>.
++;;
++;; e6500 64-bit SFX(2), CFX, LSU, FPU, BU, VSFX, VCFX, VFPU, VPERM
++;; Max issue 3 insns/clock cycle (includes 1 branch)
++
++(define_automaton "e6500_most,e6500_long,e6500_vec")
++(define_cpu_unit "e6500_decode_0,e6500_decode_1" "e6500_most")
++
++;; SFX.
++(define_cpu_unit "e6500_sfx_0,e6500_sfx_1" "e6500_most")
++
++;; CFX.
++(define_cpu_unit "e6500_cfx_stage0,e6500_cfx_stage1" "e6500_most")
++
++;; Non-pipelined division.
++(define_cpu_unit "e6500_cfx_div" "e6500_long")
++
++;; LSU.
++(define_cpu_unit "e6500_lsu" "e6500_most")
++
++;; FPU.
++(define_cpu_unit "e6500_fpu" "e6500_long")
++
++;; BU.
++(define_cpu_unit "e6500_bu" "e6500_most")
++
++;; Altivec unit
++(define_cpu_unit "e6500_vec,e6500_vecperm" "e6500_vec")
++
++;; The following units are used to make the automata deterministic.
++(define_cpu_unit "present_e6500_decode_0" "e6500_most")
++(define_cpu_unit "present_e6500_sfx_0" "e6500_most")
++(presence_set "present_e6500_decode_0" "e6500_decode_0")
++(presence_set "present_e6500_sfx_0" "e6500_sfx_0")
++
++;; Some useful abbreviations.
++(define_reservation "e6500_decode"
++    "e6500_decode_0|e6500_decode_1+present_e6500_decode_0")
++(define_reservation "e6500_sfx"
++   "e6500_sfx_0|e6500_sfx_1+present_e6500_sfx_0")
++
++;; SFX.
++(define_insn_reservation "e6500_sfx" 1
++  (and (eq_attr "type" "integer,insert_word,insert_dword,delayed_compare,\
++	shift,cntlz,exts")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx")
++
++(define_insn_reservation "e6500_sfx2" 2
++  (and (eq_attr "type" "cmp,compare,fast_compare,trap")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx")
++
++(define_insn_reservation "e6500_delayed" 2
++  (and (eq_attr "type" "var_shift_rotate,var_delayed_compare")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx*2")
++
++(define_insn_reservation "e6500_two" 2
++  (and (eq_attr "type" "two")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_decode+e6500_sfx,e6500_sfx")
++
++(define_insn_reservation "e6500_three" 3
++  (and (eq_attr "type" "three")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,(e6500_decode+e6500_sfx)*2,e6500_sfx")
++
++;; SFX - Mfcr.
++(define_insn_reservation "e6500_mfcr" 4
++  (and (eq_attr "type" "mfcr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx_0*4")
++
++;; SFX - Mtcrf.
++(define_insn_reservation "e6500_mtcrf" 1
++  (and (eq_attr "type" "mtcr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx_0")
++
++;; SFX - Mtjmpr.
++(define_insn_reservation "e6500_mtjmpr" 1
++  (and (eq_attr "type" "mtjmpr,mfjmpr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_sfx")
++
++;; CFX - Multiply.
++(define_insn_reservation "e6500_multiply" 4
++  (and (eq_attr "type" "imul")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0,e6500_cfx_stage1")
++
++(define_insn_reservation "e6500_multiply_i" 5
++  (and (eq_attr "type" "imul2,imul3,imul_compare")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0,\
++   e6500_cfx_stage0+e6500_cfx_stage1,e6500_cfx_stage1")
++
++;; CFX - Divide.
++(define_insn_reservation "e6500_divide" 16
++  (and (eq_attr "type" "idiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0+e6500_cfx_div,\
++   e6500_cfx_div*15")
++
++(define_insn_reservation "e6500_divide_d" 26
++  (and (eq_attr "type" "ldiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_cfx_stage0+e6500_cfx_div,\
++   e6500_cfx_div*25")
++
++;; LSU - Loads.
++(define_insn_reservation "e6500_load" 3
++  (and (eq_attr "type" "load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,\
++			load_l,sync")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_fpload" 4
++  (and (eq_attr "type" "fpload,fpload_ux,fpload_u")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_vecload" 4
++  (and (eq_attr "type" "vecload")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++;; LSU - Stores.
++(define_insn_reservation "e6500_store" 3
++  (and (eq_attr "type" "store,store_ux,store_u,store_c")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_fpstore" 3
++  (and (eq_attr "type" "fpstore,fpstore_ux,fpstore_u")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++(define_insn_reservation "e6500_vecstore" 4
++  (and (eq_attr "type" "vecstore")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_lsu")
++
++;; FP.
++(define_insn_reservation "e6500_float" 7
++  (and (eq_attr "type" "fpsimple,fp,fpcompare,dmul")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_fpu")
++
++(define_insn_reservation "e6500_sdiv" 20
++  (and (eq_attr "type" "sdiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_fpu*20")
++
++(define_insn_reservation "e6500_ddiv" 35
++  (and (eq_attr "type" "ddiv")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_fpu*35")
++
++;; BU.
++(define_insn_reservation "e6500_branch" 1
++  (and (eq_attr "type" "jmpreg,branch,isync")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_bu")
++
++;; BU - CR logical.
++(define_insn_reservation "e6500_cr_logical" 1
++  (and (eq_attr "type" "cr_logical,delayed_cr")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_bu")
++
++;; VSFX.
++(define_insn_reservation "e6500_vecsimple" 1
++  (and (eq_attr "type" "vecsimple,veccmp")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vec")
++
++;; VCFX.
++(define_insn_reservation "e6500_veccomplex" 4
++  (and (eq_attr "type" "veccomplex")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vec")
++
++;; VFPU.
++(define_insn_reservation "e6500_vecfloat" 6
++  (and (eq_attr "type" "vecfloat")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vec")
++
++;; VPERM.
++(define_insn_reservation "e6500_vecperm" 2
++  (and (eq_attr "type" "vecperm")
++       (eq_attr "cpu" "ppce6500"))
++  "e6500_decode,e6500_vecperm")
+Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def
+===================================================================
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def	2012-07-06 19:53:26.354779999 -0700
+@@ -87,6 +87,10 @@
+ 	    | MASK_ISEL)
+ RS6000_CPU ("e500mc64", PROCESSOR_PPCE500MC64,
+ 	    POWERPC_BASE_MASK | MASK_POWERPC64 | MASK_PPC_GFXOPT | MASK_ISEL)
++RS6000_CPU ("e5500", PROCESSOR_PPCE5500, POWERPC_BASE_MASK | MASK_POWERPC64
++	    | MASK_PPC_GFXOPT | MASK_ISEL)
++RS6000_CPU ("e6500", PROCESSOR_PPCE6500, POWERPC_7400_MASK | MASK_POWERPC64
++	    | MASK_MFCRF | MASK_ISEL)
+ RS6000_CPU ("860", PROCESSOR_MPCCORE, POWERPC_BASE_MASK | MASK_SOFT_FLOAT)
+ RS6000_CPU ("970", PROCESSOR_POWER4,
+ 	    POWERPC_7400_MASK | MASK_PPC_GPOPT | MASK_MFCRF | MASK_POWERPC64)
 Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h
 ===================================================================
---- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-opts.h	2012-04-10 10:17:24.283330056 -0700
-+++ gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h	2012-04-10 10:39:32.543394369 -0700
-@@ -53,6 +53,7 @@
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000-opts.h	2012-07-06 19:53:26.354779999 -0700
+@@ -54,6 +54,8 @@
     PROCESSOR_PPCE300C3,
     PROCESSOR_PPCE500MC,
     PROCESSOR_PPCE500MC64,
 +   PROCESSOR_PPCE5500,
++   PROCESSOR_PPCE6500,
     PROCESSOR_POWER4,
     PROCESSOR_POWER5,
     PROCESSOR_POWER6,
 Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
 ===================================================================
---- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.c	2012-04-10 10:17:24.263330055 -0700
-+++ gcc-4_7-branch/gcc/config/rs6000/rs6000.c	2012-04-10 10:39:32.547394389 -0700
-@@ -755,6 +755,25 @@
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.c	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.c	2012-07-06 19:53:26.354779999 -0700
+@@ -755,6 +755,44 @@
    1,			/* prefetch streams /*/
  };
  
@@ -243,7 +519,26 @@ Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
 +struct processor_costs ppce5500_cost = {
 +  COSTS_N_INSNS (5),    /* mulsi */
 +  COSTS_N_INSNS (5),    /* mulsi_const */
-+  COSTS_N_INSNS (5),    /* mulsi_const9 */
++  COSTS_N_INSNS (4),    /* mulsi_const9 */
++  COSTS_N_INSNS (5),    /* muldi */
++  COSTS_N_INSNS (14),   /* divsi */
++  COSTS_N_INSNS (14),   /* divdi */
++  COSTS_N_INSNS (7),    /* fp */
++  COSTS_N_INSNS (10),   /* dmul */
++  COSTS_N_INSNS (36),   /* sdiv */
++  COSTS_N_INSNS (66),   /* ddiv */
++  64,			/* cache line size */
++  32,			/* l1 cache */
++  128,			/* l2 cache */
++  1,			/* prefetch streams /*/
++};
++
++/* Instruction costs on PPCE6500 processors.  */
++static const
++struct processor_costs ppce6500_cost = {
++  COSTS_N_INSNS (5),    /* mulsi */
++  COSTS_N_INSNS (5),    /* mulsi_const */
++  COSTS_N_INSNS (4),    /* mulsi_const9 */
 +  COSTS_N_INSNS (5),    /* muldi */
 +  COSTS_N_INSNS (14),   /* divsi */
 +  COSTS_N_INSNS (14),   /* divdi */
@@ -260,8 +555,8 @@ Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
  /* Instruction costs on AppliedMicro Titan processors.  */
  static const
  struct processor_costs titan_cost = {
-@@ -2704,7 +2723,8 @@
-   rs6000_cpu = processor_target_table[tune_index].processor;
+@@ -2741,13 +2779,19 @@
+     error ("target attribute or pragma changes SPE ABI");
  
    if (rs6000_cpu == PROCESSOR_PPCE300C2 || rs6000_cpu == PROCESSOR_PPCE300C3
 -      || rs6000_cpu == PROCESSOR_PPCE500MC || rs6000_cpu == PROCESSOR_PPCE500MC64)
@@ -270,43 +565,49 @@ Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
      {
        if (TARGET_ALTIVEC)
  	error ("AltiVec not supported in this target");
-@@ -2805,9 +2825,14 @@
+       if (TARGET_SPE)
+ 	error ("SPE not supported in this target");
+     }
++  if (rs6000_cpu == PROCESSOR_PPCE6500)
++    {
++      if (TARGET_SPE)
++	error ("SPE not supported in this target");
++    }
+ 
+   /* Disable Cell microcode if we are optimizing for the Cell
+      and not optimizing for size.  */
+@@ -2842,7 +2886,9 @@
       user's opinion, though.  */
    if (rs6000_block_move_inline_limit == 0
        && (rs6000_cpu == PROCESSOR_PPCE500MC
 -	  || rs6000_cpu == PROCESSOR_PPCE500MC64))
 +	  || rs6000_cpu == PROCESSOR_PPCE500MC64
-+	  || rs6000_cpu == PROCESSOR_PPCE5500))
++	  || rs6000_cpu == PROCESSOR_PPCE5500
++	  || rs6000_cpu == PROCESSOR_PPCE6500))
      rs6000_block_move_inline_limit = 128;
  
-+  /* Those machines does not have fsqrt instruction */
-+  if (rs6000_cpu == PROCESSOR_PPCE5500)
-+    target_flags &= ~MASK_PPC_GPOPT;
-+
    /* store_one_arg depends on expand_block_move to handle at least the
-      size of reg_parm_stack_space.  */
-   if (rs6000_block_move_inline_limit < (TARGET_POWERPC64 ? 64 : 32))
-@@ -2939,7 +2964,8 @@
- #endif
+@@ -2989,6 +3035,8 @@
+     case PROCESSOR_PPC8548:
+     case PROCESSOR_PPCE500MC:
+     case PROCESSOR_PPCE500MC64:
++    case PROCESSOR_PPCE5500:
++    case PROCESSOR_PPCE6500:
  
-   if (TARGET_E500 || rs6000_cpu == PROCESSOR_PPCE500MC
--      || rs6000_cpu == PROCESSOR_PPCE500MC64)
-+      || rs6000_cpu == PROCESSOR_PPCE500MC64
-+      || rs6000_cpu == PROCESSOR_PPCE5500)
-     {
-       /* The e500 and e500mc do not have string instructions, and we set
- 	 MASK_STRING above when optimizing for size.  */
-@@ -2987,7 +3013,8 @@
+       rs6000_single_float = TARGET_E500_SINGLE || TARGET_E500_DOUBLE;
+       rs6000_double_float = TARGET_E500_DOUBLE;
+@@ -3033,7 +3081,9 @@
  				 || rs6000_cpu == PROCESSOR_POWER6
  				 || rs6000_cpu == PROCESSOR_POWER7
  				 || rs6000_cpu == PROCESSOR_PPCE500MC
 -				 || rs6000_cpu == PROCESSOR_PPCE500MC64);
 +				 || rs6000_cpu == PROCESSOR_PPCE500MC64
-+				 || rs6000_cpu == PROCESSOR_PPCE5500);
++				 || rs6000_cpu == PROCESSOR_PPCE5500
++				 || rs6000_cpu == PROCESSOR_PPCE6500);
  
    /* Allow debug switches to override the above settings.  These are set to -1
       in rs6000.opt to indicate the user hasn't directly set the switch.  */
-@@ -3209,6 +3236,10 @@
+@@ -3256,6 +3306,14 @@
  	rs6000_cost = &ppce500mc64_cost;
  	break;
  
@@ -314,156 +615,99 @@ Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.c
 +	rs6000_cost = &ppce5500_cost;
 +	break;
 +
++      case PROCESSOR_PPCE6500:
++	rs6000_cost = &ppce6500_cost;
++	break;
++
        case PROCESSOR_TITAN:
  	rs6000_cost = &titan_cost;
  	break;
-@@ -22295,6 +22326,7 @@
+@@ -22304,6 +22362,8 @@
                   || rs6000_cpu_attr == CPU_PPC750
                   || rs6000_cpu_attr == CPU_PPC7400
                   || rs6000_cpu_attr == CPU_PPC7450
 +                 || rs6000_cpu_attr == CPU_PPCE5500
++                 || rs6000_cpu_attr == CPU_PPCE6500
                   || rs6000_cpu_attr == CPU_POWER4
                   || rs6000_cpu_attr == CPU_POWER5
  		 || rs6000_cpu_attr == CPU_POWER7
-@@ -22839,6 +22871,7 @@
+@@ -22849,6 +22909,8 @@
    case CPU_PPCE300C3:
    case CPU_PPCE500MC:
    case CPU_PPCE500MC64:
 +  case CPU_PPCE5500:
++  case CPU_PPCE6500:
    case CPU_TITAN:
      return 2;
    case CPU_RIOS2:
 Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.h
 ===================================================================
---- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.h	2012-04-10 10:17:24.251330055 -0700
-+++ gcc-4_7-branch/gcc/config/rs6000/rs6000.h	2012-04-10 10:39:32.551394375 -0700
-@@ -168,6 +168,7 @@
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.h	2012-07-06 19:52:30.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.h	2012-07-06 19:53:26.358779999 -0700
+@@ -168,6 +168,8 @@
  %{mcpu=e300c3: -me300} \
  %{mcpu=e500mc: -me500mc} \
  %{mcpu=e500mc64: -me500mc64} \
 +%{mcpu=e5500: -me5500} \
++%{mcpu=e6500: -me6500} \
  %{maltivec: -maltivec} \
  %{mvsx: -mvsx %{!maltivec: -maltivec} %{!mcpu*: %(asm_cpu_power7)}} \
  -many"
-@@ -475,13 +476,13 @@
- 
- #define TARGET_FCTIDZ	TARGET_FCFID
- #define TARGET_STFIWX	TARGET_PPC_GFXOPT
--#define TARGET_LFIWAX	TARGET_CMPB
--#define TARGET_LFIWZX	TARGET_POPCNTD
--#define TARGET_FCFIDS	TARGET_POPCNTD
--#define TARGET_FCFIDU	TARGET_POPCNTD
--#define TARGET_FCFIDUS	TARGET_POPCNTD
--#define TARGET_FCTIDUZ	TARGET_POPCNTD
--#define TARGET_FCTIWUZ	TARGET_POPCNTD
-+#define TARGET_LFIWAX	(TARGET_CMPB && rs6000_cpu != PROCESSOR_PPCE5500)
-+#define TARGET_LFIWZX	(TARGET_POPCNTD && rs6000_cpu != PROCESSOR_PPCE5500)
-+#define TARGET_FCFIDS	TARGET_LFIWZX
-+#define TARGET_FCFIDU	TARGET_LFIWZX
-+#define TARGET_FCFIDUS	TARGET_LFIWZX
-+#define TARGET_FCTIDUZ	TARGET_LFIWZX
-+#define TARGET_FCTIWUZ	TARGET_LFIWZX
- 
- /* For power systems, we want to enable Altivec and VSX builtins even if the
-    user did not use -maltivec or -mvsx to allow the builtins to be used inside
-@@ -510,10 +511,12 @@
- 
- #define TARGET_FRE	(TARGET_HARD_FLOAT && TARGET_FPRS \
- 			 && TARGET_DOUBLE_FLOAT \
--			 && (TARGET_POPCNTB || VECTOR_UNIT_VSX_P (DFmode)))
-+			 && (TARGET_POPCNTB || VECTOR_UNIT_VSX_P (DFmode)) \
-+			 && rs6000_cpu != PROCESSOR_PPCE5500)
- 
- #define TARGET_FRSQRTES	(TARGET_HARD_FLOAT && TARGET_POPCNTB \
--			 && TARGET_FPRS && TARGET_SINGLE_FLOAT)
-+			 && TARGET_FPRS && TARGET_SINGLE_FLOAT \
-+			 && rs6000_cpu != PROCESSOR_PPCE5500)
- 
- #define TARGET_FRSQRTE	(TARGET_HARD_FLOAT && TARGET_FPRS \
- 			 && TARGET_DOUBLE_FLOAT \
 Index: gcc-4_7-branch/gcc/config/rs6000/rs6000.md
 ===================================================================
---- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-04-10 10:17:24.275330056 -0700
-+++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-04-10 10:39:32.555394355 -0700
-@@ -144,7 +144,7 @@
- 
- ;; Define an insn type attribute.  This is used in function unit delay
- ;; computations.
--(define_attr "type" "integer,two,three,load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,store,store_ux,store_u,fpload,fpload_ux,fpload_u,fpstore,fpstore_ux,fpstore_u,vecload,vecstore,imul,imul2,imul3,lmul,idiv,ldiv,insert_word,branch,cmp,fast_compare,compare,var_delayed_compare,delayed_compare,imul_compare,lmul_compare,fpcompare,cr_logical,delayed_cr,mfcr,mfcrf,mtcr,mfjmpr,mtjmpr,fp,fpsimple,dmul,sdiv,ddiv,ssqrt,dsqrt,jmpreg,brinc,vecsimple,veccomplex,vecdiv,veccmp,veccmpsimple,vecperm,vecfloat,vecfdiv,vecdouble,isync,sync,load_l,store_c,shift,trap,insert_dword,var_shift_rotate,cntlz,exts,mffgpr,mftgpr,isel"
-+(define_attr "type" "integer,two,three,load,load_ext,load_ext_u,load_ext_ux,load_ux,load_u,store,store_ux,store_u,fpload,fpload_ux,fpload_u,fpstore,fpstore_ux,fpstore_u,vecload,vecstore,imul,imul2,imul3,lmul,idiv,ldiv,insert_word,branch,cmp,fast_compare,compare,var_delayed_compare,delayed_compare,imul_compare,lmul_compare,fpcompare,cr_logical,delayed_cr,mfcr,mfcrf,mtcr,mfjmpr,mtjmpr,fp,fpsimple,dmul,sdiv,ddiv,ssqrt,dsqrt,jmpreg,brinc,vecsimple,veccomplex,vecdiv,veccmp,veccmpsimple,vecperm,vecfloat,vecfdiv,vecdouble,isync,sync,load_l,store_c,shift,trap,insert_dword,var_shift_rotate,cntlz,exts,mffgpr,mftgpr,isel,popcnt"
-   (const_string "integer"))
- 
- ;; Define floating point instruction sub-types for use with Xfpu.md
+--- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000.md	2012-07-06 19:52:32.000000000 -0700
++++ gcc-4_7-branch/gcc/config/rs6000/rs6000.md	2012-07-06 19:53:26.358779999 -0700
 @@ -166,7 +166,7 @@
  ;; Processor type -- this attribute must exactly match the processor_type
  ;; enumeration in rs6000.h.
  
--(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
-+(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,ppce5500,power4,power5,power6,power7,cell,ppca2,titan"
+-(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppc8548,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,power4,power5,power6,power7,cell,ppca2,titan"
++(define_attr "cpu" "rios1,rios2,rs64a,mpccore,ppc403,ppc405,ppc440,ppc476,ppc601,ppc603,ppc604,ppc604e,ppc620,ppc630,ppc750,ppc7400,ppc7450,ppc8540,ppc8548,ppce300c2,ppce300c3,ppce500mc,ppce500mc64,ppce5500,ppce6500,power4,power5,power6,power7,cell,ppca2,titan"
    (const (symbol_ref "rs6000_cpu_attr")))
  
  
-@@ -194,6 +194,7 @@
+@@ -194,6 +194,8 @@
  (include "e300c2c3.md")
  (include "e500mc.md")
  (include "e500mc64.md")
 +(include "e5500.md")
++(include "e6500.md")
  (include "power4.md")
  (include "power5.md")
  (include "power6.md")
-@@ -2329,13 +2330,17 @@
-         (unspec:GPR [(match_operand:GPR 1 "gpc_reg_operand" "r")]
-                      UNSPEC_POPCNTB))]
-   "TARGET_POPCNTB"
--  "popcntb %0,%1")
-+  "popcntb %0,%1"
-+  [(set_attr "length" "4")
-+   (set_attr "type" "popcnt")])
+Index: gcc-4_7-branch/gcc/doc/invoke.texi
+===================================================================
+--- gcc-4_7-branch.orig/gcc/doc/invoke.texi	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/doc/invoke.texi	2012-07-06 19:53:26.362779999 -0700
+@@ -16565,11 +16565,13 @@
+ @samp{603e}, @samp{604}, @samp{604e}, @samp{620}, @samp{630}, @samp{740},
+ @samp{7400}, @samp{7450}, @samp{750}, @samp{801}, @samp{821}, @samp{823},
+ @samp{860}, @samp{970}, @samp{8540}, @samp{a2}, @samp{e300c2},
+-@samp{e300c3}, @samp{e500mc}, @samp{e500mc64}, @samp{ec603e}, @samp{G3},
+-@samp{G4}, @samp{G5}, @samp{titan}, @samp{power}, @samp{power2}, @samp{power3},
+-@samp{power4}, @samp{power5}, @samp{power5+}, @samp{power6}, @samp{power6x},
+-@samp{power7}, @samp{common}, @samp{powerpc}, @samp{powerpc64}, @samp{rios},
+-@samp{rios1}, @samp{rios2}, @samp{rsc}, and @samp{rs64}.
++@samp{e300c3}, @samp{e500mc}, @samp{e500mc64}, @samp{e5500},
++@samp{e6500}, @samp{ec603e}, @samp{G3}, @samp{G4}, @samp{G5},
++@samp{titan}, @samp{power}, @samp{power2}, @samp{power3},
++@samp{power4}, @samp{power5}, @samp{power5+}, @samp{power6},
++@samp{power6x}, @samp{power7}, @samp{common}, @samp{powerpc},
++@samp{powerpc64}, @samp{rios}, @samp{rios1}, @samp{rios2}, @samp{rsc},
++and @samp{rs64}.
  
- (define_insn "popcntd<mode>2"
-   [(set (match_operand:GPR 0 "gpc_reg_operand" "=r")
- 	(popcount:GPR (match_operand:GPR 1 "gpc_reg_operand" "r")))]
-   "TARGET_POPCNTD"
--  "popcnt<wd> %0,%1")
-+  "popcnt<wd> %0,%1"
-+  [(set_attr "length" "4")
-+   (set_attr "type" "popcnt")])
+ @option{-mcpu=common} selects a completely generic processor.  Code
+ generated under this option will run on any POWER or PowerPC processor.
+Index: gcc-4_7-branch/gcc/testsuite/gcc.dg/tree-ssa/vector-3.c
+===================================================================
+--- gcc-4_7-branch.orig/gcc/testsuite/gcc.dg/tree-ssa/vector-3.c	2012-07-06 19:43:53.000000000 -0700
++++ gcc-4_7-branch/gcc/testsuite/gcc.dg/tree-ssa/vector-3.c	2012-07-06 19:53:26.362779999 -0700
+@@ -14,7 +14,7 @@
  
- (define_expand "popcount<mode>2"
-   [(set (match_operand:GPR 0 "gpc_reg_operand" "")
-@@ -5984,10 +5989,10 @@
-    && ((TARGET_PPC_GFXOPT
-         && !HONOR_NANS (<MODE>mode)
-         && !HONOR_SIGNED_ZEROS (<MODE>mode))
--       || TARGET_CMPB
-+       || TARGET_LFIWAX
-        || VECTOR_UNIT_VSX_P (<MODE>mode))"
- {
--  if (TARGET_CMPB || VECTOR_UNIT_VSX_P (<MODE>mode))
-+  if (TARGET_LFIWAX || VECTOR_UNIT_VSX_P (<MODE>mode))
-     {
-       emit_insn (gen_copysign<mode>3_fcpsgn (operands[0], operands[1],
- 					     operands[2]));
-@@ -6006,7 +6011,7 @@
- 	(unspec:SFDF [(match_operand:SFDF 1 "gpc_reg_operand" "<rreg2>")
- 		      (match_operand:SFDF 2 "gpc_reg_operand" "<rreg2>")]
- 		     UNSPEC_COPYSIGN))]
--  "TARGET_CMPB && !VECTOR_UNIT_VSX_P (<MODE>mode)"
-+  "TARGET_LFIWAX && !VECTOR_UNIT_VSX_P (<MODE>mode)"
-   "fcpsgn %0,%2,%1"
-   [(set_attr "type" "fp")])
+ /* We should be able to optimize this to just "return 0.0;" */
+ /* { dg-final { scan-tree-dump-times "BIT_FIELD_REF" 0 "optimized"} } */
+-/* { dg-final { scan-tree-dump-times "0.0" 1 "optimized"} } */
++/* { dg-final { scan-tree-dump-times "0\\\.0" 1 "optimized"} } */
+ 
+ /* { dg-final { cleanup-tree-dump "optimized" } } */
  
-Index: gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def
-===================================================================
---- gcc-4_7-branch.orig/gcc/config/rs6000/rs6000-cpus.def	2012-04-10 10:17:24.295330058 -0700
-+++ gcc-4_7-branch/gcc/config/rs6000/rs6000-cpus.def	2012-04-10 10:39:32.555394355 -0700
-@@ -88,6 +88,9 @@
- 	    | MASK_ISEL)
- RS6000_CPU ("e500mc64", PROCESSOR_PPCE500MC64,
- 	    POWERPC_BASE_MASK | MASK_POWERPC64 | MASK_PPC_GFXOPT | MASK_ISEL)
-+RS6000_CPU ("e5500", PROCESSOR_PPCE5500,
-+	    POWERPC_BASE_MASK | MASK_POWERPC64 | MASK_PPC_GFXOPT | MASK_ISEL
-+	    | MASK_CMPB | MASK_POPCNTB | MASK_POPCNTD)
- RS6000_CPU ("860", PROCESSOR_MPCCORE, POWERPC_BASE_MASK | MASK_SOFT_FLOAT)
- RS6000_CPU ("970", PROCESSOR_POWER4,
- 	    POWERPC_7400_MASK | MASK_PPC_GPOPT | MASK_MFCRF | MASK_POWERPC64)
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch b/meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
new file mode 100644
index 0000000..5b8064b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.7/rs6000-tables.patch
@@ -0,0 +1,135 @@
+Upstream-Status: Backport
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+From 98da658b6944d0bf54beb10001e567d8b8922666 Mon Sep 17 00:00:00 2001
+From: edmarwjr <edmarwjr@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 6 Jun 2012 18:09:18 +0000
+Subject: [PATCH] 2012-06-06  Edmar Wienskoski  <edmar@freescale.com>
+
+	* config/rs6000/rs6000-tables.opt: Regenerated.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@188274 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                       |    4 +++
+ gcc/config/rs6000/rs6000-tables.opt |   58 +++++++++++++++++++----------------
+ 2 files changed, 36 insertions(+), 26 deletions(-)
+
+Index: git/gcc/config/rs6000/rs6000-tables.opt
+===================================================================
+--- git.orig/gcc/config/rs6000/rs6000-tables.opt	2012-07-06 20:54:29.000000000 -0700
++++ git/gcc/config/rs6000/rs6000-tables.opt	2012-07-06 20:58:12.436646819 -0700
+@@ -126,80 +126,86 @@
+ Enum(rs6000_cpu_opt_value) String(e500mc64) Value(32)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(860) Value(33)
++Enum(rs6000_cpu_opt_value) String(e5500) Value(33)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(970) Value(34)
++Enum(rs6000_cpu_opt_value) String(e6500) Value(34)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(cell) Value(35)
++Enum(rs6000_cpu_opt_value) String(860) Value(35)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(common) Value(36)
++Enum(rs6000_cpu_opt_value) String(970) Value(36)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(ec603e) Value(37)
++Enum(rs6000_cpu_opt_value) String(cell) Value(37)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(G3) Value(38)
++Enum(rs6000_cpu_opt_value) String(common) Value(38)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(G4) Value(39)
++Enum(rs6000_cpu_opt_value) String(ec603e) Value(39)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(G5) Value(40)
++Enum(rs6000_cpu_opt_value) String(G3) Value(40)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(titan) Value(41)
++Enum(rs6000_cpu_opt_value) String(G4) Value(41)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power) Value(42)
++Enum(rs6000_cpu_opt_value) String(G5) Value(42)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power2) Value(43)
++Enum(rs6000_cpu_opt_value) String(titan) Value(43)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power3) Value(44)
++Enum(rs6000_cpu_opt_value) String(power) Value(44)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power4) Value(45)
++Enum(rs6000_cpu_opt_value) String(power2) Value(45)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power5) Value(46)
++Enum(rs6000_cpu_opt_value) String(power3) Value(46)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power5+) Value(47)
++Enum(rs6000_cpu_opt_value) String(power4) Value(47)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power6) Value(48)
++Enum(rs6000_cpu_opt_value) String(power5) Value(48)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power6x) Value(49)
++Enum(rs6000_cpu_opt_value) String(power5+) Value(49)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(power7) Value(50)
++Enum(rs6000_cpu_opt_value) String(power6) Value(50)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(powerpc) Value(51)
++Enum(rs6000_cpu_opt_value) String(power6x) Value(51)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(powerpc64) Value(52)
++Enum(rs6000_cpu_opt_value) String(power7) Value(52)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rios) Value(53)
++Enum(rs6000_cpu_opt_value) String(powerpc) Value(53)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rios1) Value(54)
++Enum(rs6000_cpu_opt_value) String(powerpc64) Value(54)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rios2) Value(55)
++Enum(rs6000_cpu_opt_value) String(rios) Value(55)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rsc) Value(56)
++Enum(rs6000_cpu_opt_value) String(rios1) Value(56)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rsc1) Value(57)
++Enum(rs6000_cpu_opt_value) String(rios2) Value(57)
+ 
+ EnumValue
+-Enum(rs6000_cpu_opt_value) String(rs64) Value(58)
++Enum(rs6000_cpu_opt_value) String(rsc) Value(58)
++
++EnumValue
++Enum(rs6000_cpu_opt_value) String(rsc1) Value(59)
++
++EnumValue
++Enum(rs6000_cpu_opt_value) String(rs64) Value(60)
+ 
-- 
1.7.9.5



