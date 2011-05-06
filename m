Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1QIBsq-0006dP-AA
	for openembedded-core@lists.openembedded.org;
	Fri, 06 May 2011 05:39:19 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 05 May 2011 20:36:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,324,1301900400"; d="scan'208";a="743139808"
Received: from nbuild2.sc.intel.com (HELO localhost) ([172.25.110.37])
	by orsmga001.jf.intel.com with ESMTP; 05 May 2011 20:36:33 -0700
Message-Id: <6181c6647fc503840d8ef07a64ed440735c44953.1304652773.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1304652773.git.nitin.a.kamble@intel.com>
References: <cover.1304652773.git.nitin.a.kamble@intel.com>
Old-Date: Sat, 30 Apr 2011 13:36:22 -0700
Date: Thu, 05 May 2011 20:36:33 -0700
To: openembedded-core@lists.openembedded.org,poky@yoctoproject.org
From: Nitin A Kamble <nitin.a.kamble@intel.com>
Subject: [PATCH 01/10] gcc-4.6.0: Apply linaro patches
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
X-List-Received-Date: Fri, 06 May 2011 03:39:19 -0000

From: Khem Raj <raj.khem@gmail.com>

We take the improvements done by linaro for gcc 4.6

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.0.inc            |    4 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch  |   51 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch  |   63 ++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch  |   32 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch  |   28 +
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch  |  653 ++++++++++++++++++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch  |  126 ++++
 .../gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch  |  177 ++++++
 .../gcc/gcc-4_6-branch-linaro-backports.inc        |    9 +
 9 files changed, 1143 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0.inc b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
index 2c30d43..609b1df 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.0.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0.inc
@@ -7,6 +7,9 @@ require gcc-common.inc
 
 require gcc-4_6-branch-backports.inc
 
+# Linaro patches for 4.6 branch
+require gcc-4_6-branch-linaro-backports.inc
+
 PR = "r1"
 
 DEPENDS =+ "mpfr gmp libmpc"
@@ -22,6 +25,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   ${GCC-4_6-BRANCH-BACKPORTS} \
+	   ${GCC-4_6-BRANCH-LINARO-BACKPORTS} \
 	   file://gcc-4.3.1-ARCH_FLAGS_FOR_TARGET.patch \
 	   file://100-uclibc-conf.patch \
            file://gcc-uclibc-locale-ctype_touplow_t.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
new file mode 100644
index 0000000..4c573f4
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106720.patch
@@ -0,0 +1,51 @@
+2011-02-21  Andrew Stubbs  <ams@codesourcery.com>
+	    Julian Brown  <julian@codesourcery.com>
+	    Mark Shinwell  <shinwell@codesourcery.com>
+
+	Forward-ported from Linaro GCC 4.5 (bzr99324).
+
+	gcc/
+	* config/arm/arm.h (arm_class_likely_spilled_p): Check against
+	LO_REGS only for Thumb-1.
+	(MODE_BASE_REG_CLASS): Restrict base registers to those which can
+	be used in short instructions when optimising for size on Thumb-2.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-01-29 03:20:57 +0000
++++ new/gcc/config/arm/arm.c	2011-02-21 14:04:51 +0000
+@@ -22304,14 +22304,16 @@
+ 
+ /* Implement TARGET_CLASS_LIKELY_SPILLED_P.
+  
+-   We need to define this for LO_REGS on thumb.  Otherwise we can end up
+-   using r0-r4 for function arguments, r7 for the stack frame and don't
+-   have enough left over to do doubleword arithmetic.  */
+-
++   We need to define this for LO_REGS on Thumb-1.  Otherwise we can end up
++   using r0-r4 for function arguments, r7 for the stack frame and don't have
++   enough left over to do doubleword arithmetic.  For Thumb-2 all the
++   potentially problematic instructions accept high registers so this is not
++   necessary.  Care needs to be taken to avoid adding new Thumb-2 patterns
++   that require many low registers.  */
+ static bool
+ arm_class_likely_spilled_p (reg_class_t rclass)
+ {
+-  if ((TARGET_THUMB && rclass == LO_REGS)
++  if ((TARGET_THUMB1 && rclass == LO_REGS)
+       || rclass  == CC_REG)
+     return true;
+ 
+
+=== modified file 'gcc/config/arm/arm.h'
+--- old/gcc/config/arm/arm.h	2011-01-29 03:20:57 +0000
++++ new/gcc/config/arm/arm.h	2011-02-21 14:04:51 +0000
+@@ -1185,7 +1185,7 @@
+    when addressing quantities in QI or HI mode; if we don't know the
+    mode, then we must be conservative.  */
+ #define MODE_BASE_REG_CLASS(MODE)					\
+-    (TARGET_32BIT ? CORE_REGS :					\
++    (TARGET_ARM || (TARGET_THUMB2 && !optimize_size) ? CORE_REGS :      \
+      (((MODE) == SImode) ? BASE_REGS : LO_REGS))
+ 
+ /* For Thumb we can not support SP+reg addressing, so we return LO_REGS
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
new file mode 100644
index 0000000..5271ffa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106723.patch
@@ -0,0 +1,63 @@
+2011-02-02  Richard Sandiford  <richard.sandiford@linaro.org>
+
+	gcc/
+	PR target/47551
+	* config/arm/arm.c (coproc_secondary_reload_class): Handle
+	structure modes.  Don't check neon_vector_mem_operand for
+	vector or structure modes.
+
+	gcc/testsuite/
+	PR target/47551
+	* gcc.target/arm/neon-modes-2.c: New test.
+
+=== modified file 'gcc/config/arm/arm.c'
+--- old/gcc/config/arm/arm.c	2011-02-21 14:04:51 +0000
++++ new/gcc/config/arm/arm.c	2011-03-02 11:38:43 +0000
+@@ -9139,11 +9139,14 @@
+       return GENERAL_REGS;
+     }
+ 
++  /* The neon move patterns handle all legitimate vector and struct
++     addresses.  */
+   if (TARGET_NEON
++      && MEM_P (x)
+       && (GET_MODE_CLASS (mode) == MODE_VECTOR_INT
+-          || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT)
+-      && neon_vector_mem_operand (x, 0))
+-     return NO_REGS;
++	  || GET_MODE_CLASS (mode) == MODE_VECTOR_FLOAT
++	  || VALID_NEON_STRUCT_MODE (mode)))
++    return NO_REGS;
+ 
+   if (arm_coproc_mem_operand (x, wb) || s_register_operand (x, mode))
+     return NO_REGS;
+
+=== added file 'gcc/testsuite/gcc.target/arm/neon-modes-2.c'
+--- old/gcc/testsuite/gcc.target/arm/neon-modes-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.target/arm/neon-modes-2.c	2011-02-02 10:02:45 +0000
+@@ -0,0 +1,24 @@
++/* { dg-do compile } */
++/* { dg-require-effective-target arm_neon_ok } */
++/* { dg-options "-O1" } */
++/* { dg-add-options arm_neon } */
++
++#include "arm_neon.h"
++
++#define SETUP(A) x##A = vld3_u32 (ptr + A * 0x20)
++#define MODIFY(A) x##A = vld3_lane_u32 (ptr + A * 0x20 + 0x10, x##A, 1)
++#define STORE(A) vst3_u32 (ptr + A * 0x20, x##A)
++
++#define MANY(A) A (0), A (1), A (2), A (3), A (4), A (5)
++
++void
++bar (uint32_t *ptr, int y)
++{
++  uint32x2x3_t MANY (SETUP);
++  int *x = __builtin_alloca (y);
++  int z[0x1000];
++  foo (x, z);
++  MANY (MODIFY);
++  foo (x, z);
++  MANY (STORE);
++}
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
new file mode 100644
index 0000000..465d09c
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106729.patch
@@ -0,0 +1,32 @@
+2011-03-22  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF:
+
+	2011-03-21  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	gcc/
+	* config/arm/unwind-arm.c (__gnu_unwind_pr_common): Correct test
+	for barrier handlers.
+
+=== modified file 'gcc/config/arm/unwind-arm.c'
+--- old/gcc/config/arm/unwind-arm.c	2009-10-30 14:55:10 +0000
++++ new/gcc/config/arm/unwind-arm.c	2011-03-22 10:59:10 +0000
+@@ -1196,8 +1196,6 @@
+ 		  ucbp->barrier_cache.bitpattern[4] = (_uw) &data[1];
+ 
+ 		  if (data[0] & uint32_highbit)
+-		    phase2_call_unexpected_after_unwind = 1;
+-		  else
+ 		    {
+ 		      data += rtti_count + 1;
+ 		      /* Setup for entry to the handler.  */
+@@ -1207,6 +1205,8 @@
+ 		      _Unwind_SetGR (context, 0, (_uw) ucbp);
+ 		      return _URC_INSTALL_CONTEXT;
+ 		    }
++		  else
++		    phase2_call_unexpected_after_unwind = 1;
+ 		}
+ 	      if (data[0] & uint32_highbit)
+ 		data++;
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
new file mode 100644
index 0000000..9b684aa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106731.patch
@@ -0,0 +1,28 @@
+2011-03-23  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF:
+
+	2011-03-23  Julian Brown  <julian@codesourcery.com>
+
+	gcc/
+	* expr.c (expand_expr_real_1): Only use BLKmode for volatile
+	accesses which are not naturally aligned.
+
+=== modified file 'gcc/expr.c'
+--- old/gcc/expr.c	2011-03-18 09:04:31 +0000
++++ new/gcc/expr.c	2011-04-05 16:18:11 +0000
+@@ -9147,8 +9147,11 @@
+ 		&& modifier != EXPAND_CONST_ADDRESS
+ 		&& modifier != EXPAND_INITIALIZER)
+ 	    /* If the field is volatile, we always want an aligned
+-	       access.  */
+-	    || (volatilep && flag_strict_volatile_bitfields > 0)
++	       access.  Only do this if the access is not already naturally
++	       aligned, otherwise "normal" (non-bitfield) volatile fields
++	       become non-addressable.  */
++	    || (volatilep && flag_strict_volatile_bitfields > 0
++		&& (bitpos % GET_MODE_ALIGNMENT (mode) != 0))
+ 	    /* If the field isn't aligned enough to fetch as a memref,
+ 	       fetch it as a bit field.  */
+ 	    || (mode1 != BLKmode
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
new file mode 100644
index 0000000..4b0079e
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106733.patch
@@ -0,0 +1,653 @@
+2011-03-27  Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* doc/invoke.texi (max-stores-to-sink): Document.
+	* params.h (MAX_STORES_TO_SINK): Define.
+	* opts.c (finish_options): Set MAX_STORES_TO_SINK to 0
+	if either vectorization or if-conversion is disabled.
+	* tree-data-ref.c (dr_equal_offsets_p1): Moved and renamed from
+	tree-vect-data-refs.c vect_equal_offsets.
+	(dr_equal_offsets_p): New function.
+	(find_data_references_in_bb): Remove static.
+	* tree-data-ref.h (find_data_references_in_bb): Declare.
+	(dr_equal_offsets_p): Likewise.
+	* tree-vect-data-refs.c (vect_equal_offsets): Move to tree-data-ref.c.
+	(vect_drs_dependent_in_basic_block): Update calls to
+	vect_equal_offsets.
+	(vect_check_interleaving): Likewise.
+	* tree-ssa-phiopt.c: Include cfgloop.h and tree-data-ref.h.
+	(cond_if_else_store_replacement): Rename to...
+	(cond_if_else_store_replacement_1): ... this.  Change arguments and
+	documentation.
+	(cond_if_else_store_replacement): New function.
+	* Makefile.in (tree-ssa-phiopt.o): Adjust dependencies.
+	* params.def (PARAM_MAX_STORES_TO_SINK): Define.
+
+	gcc/testsuite/
+	* gcc.dg/vect/vect-cselim-1.c: New test.
+	* gcc.dg/vect/vect-cselim-2.c: New test.
+
+=== modified file 'gcc/Makefile.in'
+--- old/gcc/Makefile.in	2011-03-26 09:20:34 +0000
++++ new/gcc/Makefile.in	2011-04-18 11:31:29 +0000
+@@ -2422,7 +2422,8 @@
+ tree-ssa-phiopt.o : tree-ssa-phiopt.c $(CONFIG_H) $(SYSTEM_H) coretypes.h \
+    $(TM_H) $(GGC_H) $(TREE_H) $(TM_P_H) $(BASIC_BLOCK_H) \
+    $(TREE_FLOW_H) $(TREE_PASS_H) $(TREE_DUMP_H) langhooks.h $(FLAGS_H) \
+-   $(DIAGNOSTIC_H) $(TIMEVAR_H) pointer-set.h domwalk.h
++   $(DIAGNOSTIC_H) $(TIMEVAR_H) pointer-set.h domwalk.h $(CFGLOOP_H) \
++   $(TREE_DATA_REF_H)
+ tree-nrv.o : tree-nrv.c $(CONFIG_H) $(SYSTEM_H) coretypes.h \
+    $(TM_H) $(TREE_H) $(FUNCTION_H) $(BASIC_BLOCK_H) $(FLAGS_H) \
+    $(DIAGNOSTIC_H) $(TREE_FLOW_H) $(TIMEVAR_H) $(TREE_DUMP_H) $(TREE_PASS_H) \
+
+=== modified file 'gcc/doc/invoke.texi'
+--- old/gcc/doc/invoke.texi	2011-03-29 14:24:42 +0000
++++ new/gcc/doc/invoke.texi	2011-04-18 11:31:29 +0000
+@@ -8909,6 +8909,11 @@
+ The maximum number of namespaces to consult for suggestions when C++
+ name lookup fails for an identifier.  The default is 1000.
+ 
++@item max-stores-to-sink
++The maximum number of conditional stores paires that can be sunk.  Set to 0
++if either vectorization (@option{-ftree-vectorize}) or if-conversion
++(@option{-ftree-loop-if-convert}) is disabled.  The default is 2.
++
+ @end table
+ @end table
+ 
+
+=== modified file 'gcc/opts.c'
+--- old/gcc/opts.c	2011-02-17 22:51:57 +0000
++++ new/gcc/opts.c	2011-03-27 09:38:18 +0000
+@@ -823,6 +823,12 @@
+ 	  opts->x_flag_split_stack = 0;
+ 	}
+     }
++
++  /* Set PARAM_MAX_STORES_TO_SINK to 0 if either vectorization or if-conversion
++     is disabled.  */
++  if (!opts->x_flag_tree_vectorize || !opts->x_flag_tree_loop_if_convert)
++    maybe_set_param_value (PARAM_MAX_STORES_TO_SINK, 0,
++                           opts->x_param_values, opts_set->x_param_values);
+ }
+ 
+ #define LEFT_COLUMN	27
+
+=== modified file 'gcc/params.def'
+--- old/gcc/params.def	2011-03-26 09:20:34 +0000
++++ new/gcc/params.def	2011-04-18 11:31:29 +0000
+@@ -883,6 +883,13 @@
+ 	  "name lookup fails",
+ 	  1000, 0, 0)
+ 
++/* Maximum number of conditional store pairs that can be sunk.  */
++DEFPARAM (PARAM_MAX_STORES_TO_SINK,
++          "max-stores-to-sink",
++          "Maximum number of conditional store pairs that can be sunk",
++          2, 0, 0)
++
++
+ /*
+ Local variables:
+ mode:c
+
+=== modified file 'gcc/params.h'
+--- old/gcc/params.h	2011-01-13 13:41:03 +0000
++++ new/gcc/params.h	2011-03-27 09:38:18 +0000
+@@ -206,4 +206,6 @@
+   PARAM_VALUE (PARAM_PREFETCH_MIN_INSN_TO_MEM_RATIO)
+ #define MIN_NONDEBUG_INSN_UID \
+   PARAM_VALUE (PARAM_MIN_NONDEBUG_INSN_UID)
++#define MAX_STORES_TO_SINK \
++  PARAM_VALUE (PARAM_MAX_STORES_TO_SINK)
+ #endif /* ! GCC_PARAMS_H */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-cselim-1.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-cselim-1.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-cselim-1.c	2011-03-27 09:38:18 +0000
+@@ -0,0 +1,86 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 50
++
++typedef struct {
++  short a;
++  short b;
++} data;
++
++data in1[N], in2[N], out[N];
++short result[N*2] = {7,-7,9,-6,11,-5,13,-4,15,-3,17,-2,19,-1,21,0,23,1,25,2,27,3,29,4,31,5,33,6,35,7,37,8,39,9,41,10,43,11,45,12,47,13,49,14,51,15,53,16,55,17,57,18,59,19,61,20,63,21,65,22,67,23,69,24,71,25,73,26,75,27,77,28,79,29,81,30,83,31,85,32,87,33,89,34,91,35,93,36,95,37,97,38,99,39,101,40,103,41,105,42};
++short out1[N], out2[N];
++
++__attribute__ ((noinline)) void
++foo ()
++{
++  int i;
++  short c, d;
++
++  /* Vectorizable with conditional store sinking.  */
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i].b;
++      d = in2[i].b;
++
++      if (c >= d)
++        {
++          out[i].b = c;
++          out[i].a = d + 5;
++        }
++      else
++        {
++          out[i].b = d - 12;
++          out[i].a = c + d;
++        }
++    }
++
++  /* Not vectorizable.  */
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i].b;
++      d = in2[i].b;
++
++      if (c >= d)
++        {
++          out1[i] = c;
++        }
++      else
++        {
++          out2[i] = c + d;
++        }
++    }
++}
++
++int
++main (void)
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in1[i].a = i;
++      in1[i].b = i + 2;
++      in2[i].a = 5;
++      in2[i].b = i + 5;
++      __asm__ volatile ("");
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    {
++      if (out[i].a != result[2*i] || out[i].b != result[2*i+1])
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect"  { xfail { vect_no_align || {! vect_strided } } } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-cselim-2.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-cselim-2.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-cselim-2.c	2011-03-27 09:38:18 +0000
+@@ -0,0 +1,65 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 50
++
++int a[N], b[N], in1[N], in2[N];
++int result[2*N] = {5,-7,7,-6,9,-5,11,-4,13,-3,15,-2,17,-1,19,0,21,1,23,2,25,3,27,4,29,5,31,6,33,7,35,8,37,9,39,10,41,11,43,12,45,13,47,14,49,15,51,16,53,17,55,18,57,19,59,20,61,21,63,22,65,23,67,24,69,25,71,26,73,27,75,28,77,29,79,30,81,31,83,32,85,33,87,34,89,35,91,36,93,37,95,38,97,39,99,40,101,41,103,42};
++
++__attribute__ ((noinline)) void
++foo (int *pa, int *pb)
++{
++  int i;
++  int c, d;
++
++  /* Store sinking should not work here since the pointers may alias.  */
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i];
++      d = in2[i];
++
++      if (c >= d)
++        {
++          *pa = c;
++          *pb = d + 5;
++        }
++      else
++        {
++          *pb = d - 12;
++          *pa = c + d;
++        }
++
++      pa++;
++      pb++;
++    }
++}
++
++int
++main (void)
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in1[i] = i;
++      in2[i] = i + 5;
++      __asm__ volatile ("");
++    }
++
++  foo (a, b);
++
++  for (i = 0; i < N; i++)
++    {
++      if (a[i] != result[2*i] || b[i] != result[2*i+1])
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 0 "vect"  } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/tree-data-ref.c'
+--- old/gcc/tree-data-ref.c	2011-02-05 01:39:20 +0000
++++ new/gcc/tree-data-ref.c	2011-03-27 09:38:18 +0000
+@@ -991,6 +991,48 @@
+   return dr;
+ }
+ 
++/* Check if OFFSET1 and OFFSET2 (DR_OFFSETs of some data-refs) are identical
++   expressions.  */
++static bool
++dr_equal_offsets_p1 (tree offset1, tree offset2)
++{
++  bool res;
++
++  STRIP_NOPS (offset1);
++  STRIP_NOPS (offset2);
++
++  if (offset1 == offset2)
++    return true;
++
++  if (TREE_CODE (offset1) != TREE_CODE (offset2)
++      || (!BINARY_CLASS_P (offset1) && !UNARY_CLASS_P (offset1)))
++    return false;
++
++  res = dr_equal_offsets_p1 (TREE_OPERAND (offset1, 0),
++                             TREE_OPERAND (offset2, 0));
++
++  if (!res || !BINARY_CLASS_P (offset1))
++    return res;
++
++  res = dr_equal_offsets_p1 (TREE_OPERAND (offset1, 1),
++                             TREE_OPERAND (offset2, 1));
++
++  return res;
++}
++
++/* Check if DRA and DRB have equal offsets.  */
++bool
++dr_equal_offsets_p (struct data_reference *dra,
++                    struct data_reference *drb)
++{
++  tree offset1, offset2;
++
++  offset1 = DR_OFFSET (dra);
++  offset2 = DR_OFFSET (drb);
++
++  return dr_equal_offsets_p1 (offset1, offset2);
++}
++
+ /* Returns true if FNA == FNB.  */
+ 
+ static bool
+@@ -4294,7 +4336,7 @@
+    DATAREFS.  Returns chrec_dont_know when failing to analyze a
+    difficult case, returns NULL_TREE otherwise.  */
+ 
+-static tree
++tree
+ find_data_references_in_bb (struct loop *loop, basic_block bb,
+                             VEC (data_reference_p, heap) **datarefs)
+ {
+
+=== modified file 'gcc/tree-data-ref.h'
+--- old/gcc/tree-data-ref.h	2011-01-25 21:24:23 +0000
++++ new/gcc/tree-data-ref.h	2011-03-27 09:38:18 +0000
+@@ -426,10 +426,14 @@
+ extern void compute_all_dependences (VEC (data_reference_p, heap) *,
+ 				     VEC (ddr_p, heap) **, VEC (loop_p, heap) *,
+ 				     bool);
++extern tree find_data_references_in_bb (struct loop *, basic_block,
++                                        VEC (data_reference_p, heap) **);
+ 
+ extern void create_rdg_vertices (struct graph *, VEC (gimple, heap) *);
+ extern bool dr_may_alias_p (const struct data_reference *,
+ 			    const struct data_reference *);
++extern bool dr_equal_offsets_p (struct data_reference *,
++                                struct data_reference *);
+ 
+ 
+ /* Return true when the base objects of data references A and B are
+
+=== modified file 'gcc/tree-ssa-phiopt.c'
+--- old/gcc/tree-ssa-phiopt.c	2010-11-03 15:18:50 +0000
++++ new/gcc/tree-ssa-phiopt.c	2011-03-27 09:38:18 +0000
+@@ -34,6 +34,8 @@
+ #include "langhooks.h"
+ #include "pointer-set.h"
+ #include "domwalk.h"
++#include "cfgloop.h"
++#include "tree-data-ref.h"
+ 
+ static unsigned int tree_ssa_phiopt (void);
+ static unsigned int tree_ssa_phiopt_worker (bool);
+@@ -1292,35 +1294,18 @@
+   return true;
+ }
+ 
+-/* Do the main work of conditional store replacement.  We already know
+-   that the recognized pattern looks like so:
+-
+-   split:
+-     if (cond) goto THEN_BB; else goto ELSE_BB (edge E1)
+-   THEN_BB:
+-     X = Y;
+-     goto JOIN_BB;
+-   ELSE_BB:
+-     X = Z;
+-     fallthrough (edge E0)
+-   JOIN_BB:
+-     some more
+-
+-   We check that THEN_BB and ELSE_BB contain only one store
+-   that the stores have a "simple" RHS.  */
++/* Do the main work of conditional store replacement.  */
+ 
+ static bool
+-cond_if_else_store_replacement (basic_block then_bb, basic_block else_bb,
+-				basic_block join_bb)
++cond_if_else_store_replacement_1 (basic_block then_bb, basic_block else_bb,
++				  basic_block join_bb, gimple then_assign,
++				  gimple else_assign)
+ {
+-  gimple then_assign = last_and_only_stmt (then_bb);
+-  gimple else_assign = last_and_only_stmt (else_bb);
+   tree lhs_base, lhs, then_rhs, else_rhs;
+   source_location then_locus, else_locus;
+   gimple_stmt_iterator gsi;
+   gimple newphi, new_stmt;
+ 
+-  /* Check if then_bb and else_bb contain only one store each.  */
+   if (then_assign == NULL
+       || !gimple_assign_single_p (then_assign)
+       || else_assign == NULL
+@@ -1385,6 +1370,190 @@
+   return true;
+ }
+ 
++/* Conditional store replacement.  We already know
++   that the recognized pattern looks like so:
++
++   split:
++     if (cond) goto THEN_BB; else goto ELSE_BB (edge E1)
++   THEN_BB:
++     ...
++     X = Y;
++     ...
++     goto JOIN_BB;
++   ELSE_BB:
++     ...
++     X = Z;
++     ...
++     fallthrough (edge E0)
++   JOIN_BB:
++     some more
++
++   We check that it is safe to sink the store to JOIN_BB by verifying that
++   there are no read-after-write or write-after-write dependencies in
++   THEN_BB and ELSE_BB.  */
++
++static bool
++cond_if_else_store_replacement (basic_block then_bb, basic_block else_bb,
++                                basic_block join_bb)
++{
++  gimple then_assign = last_and_only_stmt (then_bb);
++  gimple else_assign = last_and_only_stmt (else_bb);
++  VEC (data_reference_p, heap) *then_datarefs, *else_datarefs;
++  VEC (ddr_p, heap) *then_ddrs, *else_ddrs;
++  gimple then_store, else_store;
++  bool found, ok = false, res;
++  struct data_dependence_relation *ddr;
++  data_reference_p then_dr, else_dr;
++  int i, j;
++  tree then_lhs, else_lhs;
++  VEC (gimple, heap) *then_stores, *else_stores;
++  basic_block blocks[3];
++
++  if (MAX_STORES_TO_SINK == 0)
++    return false;
++
++  /* Handle the case with single statement in THEN_BB and ELSE_BB.  */
++  if (then_assign && else_assign)
++    return cond_if_else_store_replacement_1 (then_bb, else_bb, join_bb,
++                                             then_assign, else_assign);
++
++  /* Find data references.  */
++  then_datarefs = VEC_alloc (data_reference_p, heap, 1);
++  else_datarefs = VEC_alloc (data_reference_p, heap, 1);
++  if ((find_data_references_in_bb (NULL, then_bb, &then_datarefs)
++        == chrec_dont_know)
++      || !VEC_length (data_reference_p, then_datarefs)
++      || (find_data_references_in_bb (NULL, else_bb, &else_datarefs)
++        == chrec_dont_know)
++      || !VEC_length (data_reference_p, else_datarefs))
++    {
++      free_data_refs (then_datarefs);
++      free_data_refs (else_datarefs);
++      return false;
++    }
++
++  /* Find pairs of stores with equal LHS.  */
++  then_stores = VEC_alloc (gimple, heap, 1);
++  else_stores = VEC_alloc (gimple, heap, 1);
++  FOR_EACH_VEC_ELT (data_reference_p, then_datarefs, i, then_dr)
++    {
++      if (DR_IS_READ (then_dr))
++        continue;
++
++      then_store = DR_STMT (then_dr);
++      then_lhs = gimple_assign_lhs (then_store);
++      found = false;
++
++      FOR_EACH_VEC_ELT (data_reference_p, else_datarefs, j, else_dr)
++        {
++          if (DR_IS_READ (else_dr))
++            continue;
++
++          else_store = DR_STMT (else_dr);
++          else_lhs = gimple_assign_lhs (else_store);
++
++          if (operand_equal_p (then_lhs, else_lhs, 0))
++            {
++              found = true;
++              break;
++            }
++        }
++
++      if (!found)
++        continue;
++
++      VEC_safe_push (gimple, heap, then_stores, then_store);
++      VEC_safe_push (gimple, heap, else_stores, else_store);
++    }
++
++  /* No pairs of stores found.  */
++  if (!VEC_length (gimple, then_stores)
++      || VEC_length (gimple, then_stores) > (unsigned) MAX_STORES_TO_SINK)
++    {
++      free_data_refs (then_datarefs);
++      free_data_refs (else_datarefs);
++      VEC_free (gimple, heap, then_stores);
++      VEC_free (gimple, heap, else_stores);
++      return false;
++    }
++
++  /* Compute and check data dependencies in both basic blocks.  */
++  then_ddrs = VEC_alloc (ddr_p, heap, 1);
++  else_ddrs = VEC_alloc (ddr_p, heap, 1);
++  compute_all_dependences (then_datarefs, &then_ddrs, NULL, false);
++  compute_all_dependences (else_datarefs, &else_ddrs, NULL, false);
++  blocks[0] = then_bb;
++  blocks[1] = else_bb;
++  blocks[2] = join_bb;
++  renumber_gimple_stmt_uids_in_blocks (blocks, 3);
++
++  /* Check that there are no read-after-write or write-after-write dependencies
++     in THEN_BB.  */
++  FOR_EACH_VEC_ELT (ddr_p, then_ddrs, i, ddr)
++    {
++      struct data_reference *dra = DDR_A (ddr);
++      struct data_reference *drb = DDR_B (ddr);
++
++      if (DDR_ARE_DEPENDENT (ddr) != chrec_known
++          && ((DR_IS_READ (dra) && DR_IS_WRITE (drb)
++               && gimple_uid (DR_STMT (dra)) > gimple_uid (DR_STMT (drb)))
++              || (DR_IS_READ (drb) && DR_IS_WRITE (dra)
++                  && gimple_uid (DR_STMT (drb)) > gimple_uid (DR_STMT (dra)))
++              || (DR_IS_WRITE (dra) && DR_IS_WRITE (drb))))
++        {
++          free_dependence_relations (then_ddrs);
++          free_dependence_relations (else_ddrs);
++          free_data_refs (then_datarefs);
++          free_data_refs (else_datarefs);
++          VEC_free (gimple, heap, then_stores);
++          VEC_free (gimple, heap, else_stores);
++          return false;
++        }
++    }
++
++  /* Check that there are no read-after-write or write-after-write dependencies
++     in ELSE_BB.  */
++  FOR_EACH_VEC_ELT (ddr_p, else_ddrs, i, ddr)
++    {
++      struct data_reference *dra = DDR_A (ddr);
++      struct data_reference *drb = DDR_B (ddr);
++
++      if (DDR_ARE_DEPENDENT (ddr) != chrec_known
++          && ((DR_IS_READ (dra) && DR_IS_WRITE (drb)
++               && gimple_uid (DR_STMT (dra)) > gimple_uid (DR_STMT (drb)))
++              || (DR_IS_READ (drb) && DR_IS_WRITE (dra)
++                  && gimple_uid (DR_STMT (drb)) > gimple_uid (DR_STMT (dra)))
++              || (DR_IS_WRITE (dra) && DR_IS_WRITE (drb))))
++        {
++          free_dependence_relations (then_ddrs);
++          free_dependence_relations (else_ddrs);
++          free_data_refs (then_datarefs);
++          free_data_refs (else_datarefs);
++          VEC_free (gimple, heap, then_stores);
++          VEC_free (gimple, heap, else_stores);
++          return false;
++        }
++    }
++
++  /* Sink stores with same LHS.  */
++  FOR_EACH_VEC_ELT (gimple, then_stores, i, then_store)
++    {
++      else_store = VEC_index (gimple, else_stores, i);
++      res = cond_if_else_store_replacement_1 (then_bb, else_bb, join_bb,
++                                              then_store, else_store);
++      ok = ok || res;
++    }
++
++  free_dependence_relations (then_ddrs);
++  free_dependence_relations (else_ddrs);
++  free_data_refs (then_datarefs);
++  free_data_refs (else_datarefs);
++  VEC_free (gimple, heap, then_stores);
++  VEC_free (gimple, heap, else_stores);
++
++  return ok;
++}
++
+ /* Always do these optimizations if we have SSA
+    trees to work on.  */
+ static bool
+
+=== modified file 'gcc/tree-vect-data-refs.c'
+--- old/gcc/tree-vect-data-refs.c	2011-02-25 11:18:14 +0000
++++ new/gcc/tree-vect-data-refs.c	2011-03-27 09:38:18 +0000
+@@ -289,39 +289,6 @@
+     }
+ }
+ 
+-
+-/* Function vect_equal_offsets.
+-
+-   Check if OFFSET1 and OFFSET2 are identical expressions.  */
+-
+-static bool
+-vect_equal_offsets (tree offset1, tree offset2)
+-{
+-  bool res;
+-
+-  STRIP_NOPS (offset1);
+-  STRIP_NOPS (offset2);
+-
+-  if (offset1 == offset2)
+-    return true;
+-
+-  if (TREE_CODE (offset1) != TREE_CODE (offset2)
+-      || (!BINARY_CLASS_P (offset1) && !UNARY_CLASS_P (offset1)))
+-    return false;
+-
+-  res = vect_equal_offsets (TREE_OPERAND (offset1, 0),
+-			    TREE_OPERAND (offset2, 0));
+-
+-  if (!res || !BINARY_CLASS_P (offset1))
+-    return res;
+-
+-  res = vect_equal_offsets (TREE_OPERAND (offset1, 1),
+-			    TREE_OPERAND (offset2, 1));
+-
+-  return res;
+-}
+-
+-
+ /* Check dependence between DRA and DRB for basic block vectorization.
+    If the accesses share same bases and offsets, we can compare their initial
+    constant offsets to decide whether they differ or not.  In case of a read-
+@@ -352,7 +319,7 @@
+            || TREE_CODE (DR_BASE_ADDRESS (drb)) != ADDR_EXPR
+            || TREE_OPERAND (DR_BASE_ADDRESS (dra), 0)
+            != TREE_OPERAND (DR_BASE_ADDRESS (drb),0)))
+-      || !vect_equal_offsets (DR_OFFSET (dra), DR_OFFSET (drb)))
++      || !dr_equal_offsets_p (dra, drb))
+     return true;
+ 
+   /* Check the types.  */
+@@ -402,7 +369,7 @@
+ 	   || TREE_CODE (DR_BASE_ADDRESS (drb)) != ADDR_EXPR
+ 	   || TREE_OPERAND (DR_BASE_ADDRESS (dra), 0)
+ 	   != TREE_OPERAND (DR_BASE_ADDRESS (drb),0)))
+-      || !vect_equal_offsets (DR_OFFSET (dra), DR_OFFSET (drb))
++      || !dr_equal_offsets_p (dra, drb)
+       || !tree_int_cst_compare (DR_INIT (dra), DR_INIT (drb))
+       || DR_IS_READ (dra) != DR_IS_READ (drb))
+     return false;
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
new file mode 100644
index 0000000..017b1df
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106737.patch
@@ -0,0 +1,126 @@
+2011-04-21  Andrew Stubbs  <ams@codesourcery.com>
+
+	Backport from FSF:
+
+	2008-12-03  Daniel Jacobowitz  <dan@codesourcery.com>
+
+	gcc/testsuite/
+	* gcc.dg/vect/vect-shift-3.c, gcc.dg/vect/vect-shift-4.c: New.
+	* lib/target-supports.exp (check_effective_target_vect_shift_char): New
+	function.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-shift-3.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-shift-3.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-shift-3.c	2011-04-21 13:51:06 +0000
+@@ -0,0 +1,37 @@
++/* { dg-require-effective-target vect_shift } */
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++
++#define N 32
++
++unsigned short dst[N] __attribute__((aligned(N)));
++unsigned short src[N] __attribute__((aligned(N)));
++
++__attribute__ ((noinline))
++void array_shift(void)
++{
++  int i;
++  for (i = 0; i < N; i++)
++    dst[i] = src[i] >> 3;
++}
++
++int main()
++{
++  volatile int i;
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    src[i] = i << 3;
++
++  array_shift ();
++
++  for (i = 0; i < N; i++)
++    if (dst[i] != i)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== added file 'gcc/testsuite/gcc.dg/vect/vect-shift-4.c'
+--- old/gcc/testsuite/gcc.dg/vect/vect-shift-4.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect-shift-4.c	2011-04-21 13:51:06 +0000
+@@ -0,0 +1,37 @@
++/* { dg-require-effective-target vect_shift_char } */
++/* { dg-require-effective-target vect_int } */
++
++#include "tree-vect.h"
++
++#define N 32
++
++unsigned char dst[N] __attribute__((aligned(N)));
++unsigned char src[N] __attribute__((aligned(N)));
++
++__attribute__ ((noinline))
++void array_shift(void)
++{
++  int i;
++  for (i = 0; i < N; i++)
++    dst[i] = src[i] >> 3;
++}
++
++int main()
++{
++  volatile int i;
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    src[i] = i << 3;
++
++  array_shift ();
++
++  for (i = 0; i < N; i++)
++    if (dst[i] != i)
++      abort ();
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect" } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/testsuite/lib/target-supports.exp'
+--- old/gcc/testsuite/lib/target-supports.exp	2011-02-19 15:31:15 +0000
++++ new/gcc/testsuite/lib/target-supports.exp	2011-04-21 13:51:06 +0000
+@@ -2308,6 +2308,26 @@
+ }
+ 
+ 
++# Return 1 if the target supports hardware vector shift operation for char.
++
++proc check_effective_target_vect_shift_char { } {
++    global et_vect_shift_char_saved
++
++    if [info exists et_vect_shift_char_saved] {
++	verbose "check_effective_target_vect_shift_char: using cached result" 2
++    } else {
++	set et_vect_shift_char_saved 0
++	if { ([istarget powerpc*-*-*]
++             && ![istarget powerpc-*-linux*paired*])
++	     || [check_effective_target_arm32] } {
++	   set et_vect_shift_char_saved 1
++	}
++    }
++
++    verbose "check_effective_target_vect_shift_char: returning $et_vect_shift_char_saved" 2
++    return $et_vect_shift_char_saved
++}
++
+ # Return 1 if the target supports hardware vectors of long, 0 otherwise.
+ #
+ # This can change for different subtargets so do not cache the result.
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
new file mode 100644
index 0000000..3dde3b2
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6.0/linaro/gcc-4.6-linaro-r106738.patch
@@ -0,0 +1,177 @@
+2011-04-27  Ira Rosen  <ira.rosen@linaro.org>
+
+	Backport from FSF:
+
+	2011-04-03  Richard Guenther  <rguenther@suse.de>
+		    Ira Rosen  <ira.rosen@linaro.org>
+
+	gcc/
+	* tree-if-conv.c (memrefs_read_or_written_unconditionally): Strip all
+	non-variable offsets and compare the remaining bases of the two
+	accesses instead of looking for exact same data-ref.
+
+	gcc/testsuite/
+	* gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c: New test.
+	* gcc.dg/vect/vect.exp: Run if-cvt-stores-vect* tests with
+	-ftree-loop-if-convert-stores.
+
+=== added file 'gcc/testsuite/gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c'
+--- old/gcc/testsuite/gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c	1970-01-01 00:00:00 +0000
++++ new/gcc/testsuite/gcc.dg/vect/if-cvt-stores-vect-ifcvt-18.c	2011-04-24 07:45:49 +0000
+@@ -0,0 +1,69 @@
++/* { dg-require-effective-target vect_int } */
++
++#include <stdarg.h>
++#include "tree-vect.h"
++
++#define N 50
++
++typedef struct {
++  short a;
++  short b;
++} data;
++
++data in1[N], in2[N], out[N];
++short result[N*2] = {10,-7,11,-6,12,-5,13,-4,14,-3,15,-2,16,-1,17,0,18,1,19,2,20,3,21,4,22,5,23,6,24,7,25,8,26,9,27,10,28,11,29,12,30,13,31,14,32,15,33,16,34,17,35,18,36,19,37,20,38,21,39,22,40,23,41,24,42,25,43,26,44,27,45,28,46,29,47,30,48,31,49,32,50,33,51,34,52,35,53,36,54,37,55,38,56,39,57,40,58,41,59,42};
++short out1[N], out2[N];
++
++__attribute__ ((noinline)) void
++foo ()
++{
++  int i;
++  short c, d;
++
++  for (i = 0; i < N; i++)
++    {
++      c = in1[i].b;
++      d = in2[i].b;
++
++      if (c >= d)
++        {
++          out[i].b = in1[i].a;
++          out[i].a = d + 5;
++        }
++      else
++        {
++          out[i].b = d - 12;
++          out[i].a = in2[i].a + d;
++        }
++    }
++}
++
++int
++main (void)
++{
++  int i;
++
++  check_vect ();
++
++  for (i = 0; i < N; i++)
++    {
++      in1[i].a = i;
++      in1[i].b = i + 2;
++      in2[i].a = 5;
++      in2[i].b = i + 5;
++      __asm__ volatile ("");
++    }
++
++  foo ();
++
++  for (i = 0; i < N; i++)
++    {
++      if (out[i].a != result[2*i] || out[i].b != result[2*i+1])
++        abort ();
++    }
++
++  return 0;
++}
++
++/* { dg-final { scan-tree-dump-times "vectorized 1 loops" 1 "vect"  { xfail { vect_no_align || {! vect_strided } } } } } */
++/* { dg-final { cleanup-tree-dump "vect" } } */
+
+=== modified file 'gcc/testsuite/gcc.dg/vect/vect.exp'
+--- old/gcc/testsuite/gcc.dg/vect/vect.exp	2010-11-22 21:49:19 +0000
++++ new/gcc/testsuite/gcc.dg/vect/vect.exp	2011-04-24 07:45:49 +0000
+@@ -210,6 +210,12 @@
+ dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/ggc-*.\[cS\]]]  \
+         "" $DEFAULT_VECTCFLAGS
+ 
++# -ftree-loop-if-convert-stores
++set DEFAULT_VECTCFLAGS $SAVED_DEFAULT_VECTCFLAGS
++lappend DEFAULT_VECTCFLAGS "-ftree-loop-if-convert-stores"
++dg-runtest [lsort [glob -nocomplain $srcdir/$subdir/if-cvt-stores-vect-*.\[cS\]]]  \
++        "" $DEFAULT_VECTCFLAGS
++
+ # With -O3.
+ # Don't allow IPA cloning, because it throws our counts out of whack.
+ set DEFAULT_VECTCFLAGS $SAVED_DEFAULT_VECTCFLAGS
+
+=== modified file 'gcc/tree-if-conv.c'
+--- old/gcc/tree-if-conv.c	2011-02-23 16:49:52 +0000
++++ new/gcc/tree-if-conv.c	2011-04-24 07:45:49 +0000
+@@ -464,8 +464,8 @@
+ /* Returns true when the memory references of STMT are read or written
+    unconditionally.  In other words, this function returns true when
+    for every data reference A in STMT there exist other accesses to
+-   the same data reference with predicates that add up (OR-up) to the
+-   true predicate: this ensures that the data reference A is touched
++   a data reference with the same base with predicates that add up (OR-up) to
++   the true predicate: this ensures that the data reference A is touched
+    (read or written) on every iteration of the if-converted loop.  */
+ 
+ static bool
+@@ -489,21 +489,38 @@
+ 	  continue;
+ 
+ 	for (j = 0; VEC_iterate (data_reference_p, drs, j, b); j++)
+-	  if (DR_STMT (b) != stmt
+-	      && same_data_refs (a, b))
+-	    {
+-	      tree cb = bb_predicate (gimple_bb (DR_STMT (b)));
+-
+-	      if (DR_RW_UNCONDITIONALLY (b) == 1
+-		  || is_true_predicate (cb)
+-		  || is_true_predicate (ca = fold_or_predicates (EXPR_LOCATION (cb),
+-								 ca, cb)))
+-		{
+-		  DR_RW_UNCONDITIONALLY (a) = 1;
+-		  DR_RW_UNCONDITIONALLY (b) = 1;
+-		  found = true;
+-		  break;
+-		}
++          {
++            tree ref_base_a = DR_REF (a);
++            tree ref_base_b = DR_REF (b);
++
++            if (DR_STMT (b) == stmt)
++              continue;
++
++            while (TREE_CODE (ref_base_a) == COMPONENT_REF
++                   || TREE_CODE (ref_base_a) == IMAGPART_EXPR
++                   || TREE_CODE (ref_base_a) == REALPART_EXPR)
++              ref_base_a = TREE_OPERAND (ref_base_a, 0);
++
++            while (TREE_CODE (ref_base_b) == COMPONENT_REF
++                   || TREE_CODE (ref_base_b) == IMAGPART_EXPR
++                   || TREE_CODE (ref_base_b) == REALPART_EXPR)
++              ref_base_b = TREE_OPERAND (ref_base_b, 0);
++
++  	    if (!operand_equal_p (ref_base_a, ref_base_b, 0))
++	      {
++	        tree cb = bb_predicate (gimple_bb (DR_STMT (b)));
++
++	        if (DR_RW_UNCONDITIONALLY (b) == 1
++		    || is_true_predicate (cb)
++		    || is_true_predicate (ca
++                        = fold_or_predicates (EXPR_LOCATION (cb), ca, cb)))
++		  {
++		    DR_RW_UNCONDITIONALLY (a) = 1;
++  		    DR_RW_UNCONDITIONALLY (b) = 1;
++		    found = true;
++		    break;
++		  }
++               }
+ 	    }
+ 
+ 	if (!found)
+
diff --git a/meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc b/meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
new file mode 100644
index 0000000..3160e35
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4_6-branch-linaro-backports.inc
@@ -0,0 +1,9 @@
+GCC-4_6-BRANCH-LINARO-BACKPORTS = " \
+file://linaro/gcc-4.6-linaro-r106720.patch \
+file://linaro/gcc-4.6-linaro-r106723.patch \
+file://linaro/gcc-4.6-linaro-r106729.patch \
+file://linaro/gcc-4.6-linaro-r106731.patch \
+file://linaro/gcc-4.6-linaro-r106733.patch \
+file://linaro/gcc-4.6-linaro-r106737.patch \
+file://linaro/gcc-4.6-linaro-r106738.patch \
+"
-- 
1.7.3.4



