Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id D3D6178745
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 17:41:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w1NHfSob002364
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Feb 2018 09:41:29 -0800
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 23 Feb 2018 09:41:06 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Feb 2018 12:41:24 -0500
Message-ID: <20180223174124.24238-3-mark.hatle@windriver.com>
X-Mailer: git-send-email 2.16.0.rc2
In-Reply-To: <20180223174124.24238-1-mark.hatle@windriver.com>
References: <20180223174124.24238-1-mark.hatle@windriver.com>
MIME-Version: 1.0
Subject: [master][rocko][PATCH 2/2] gcc: Fix internal compiler error for PPC test case "gcc.dg/vmx/7d-02.c"
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 23 Feb 2018 17:41:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Fix an internal compiler error on PPC from building a specific test:

$ $CC -S 7d-02.c
7d-02.c: In function â:
7d-02.c:11:5: internal compiler error: in copy_to_mode_reg, at explow.c:612
     vec_st(v, i*16,p);
     ^~~~~~

The failure appears to happen on all optimizations levels as well.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-7.3.inc              |   1 +
 ...1-Fix-internal-compiler-error-in-testcase.patch | 212 +++++++++++++++++++++
 2 files changed, 213 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-testcase.patch

diff --git a/meta/recipes-devtools/gcc/gcc-7.3.inc b/meta/recipes-devtools/gcc/gcc-7.3.inc
index da236e5..5d3b8d7 100644
--- a/meta/recipes-devtools/gcc/gcc-7.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-7.3.inc
@@ -78,6 +78,7 @@ SRC_URI = "\
            ${BACKPORTS} \
 "
 BACKPORTS = "\
+           file://0001-Fix-internal-compiler-error-in-testcase.patch \
 "
 
 SRC_URI[md5sum] = "be2da21680f27624f3a87055c4ba5af2"
diff --git a/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-testcase.patch b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-testcase.patch
new file mode 100644
index 0000000..45cc0ee
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-7.3/0001-Fix-internal-compiler-error-in-testcase.patch
@@ -0,0 +1,212 @@
+From d3cdd96a300f9003a1cc242541605169aacdc811 Mon Sep 17 00:00:00 2001
+From: willschm <willschm@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 25 Sep 2017 14:35:02 +0000
+Subject: [PATCH] [gcc]
+
+2017-09-25  Will Schmidt  <will_schmidt@vnet.ibm.com>
+
+	* config/rs6000/rs6000.c (rs6000_gimple_fold_builtin): Add handling
+	for early folding of vector stores (ALTIVEC_BUILTIN_ST_*).
+	(rs6000_builtin_valid_without_lhs): New helper function.
+	* config/rs6000/rs6000-c.c (altivec_resolve_overloaded_builtin):
+	Remove obsoleted code for handling ALTIVEC_BUILTIN_VEC_ST.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@253152 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Fix internal compiler error for testcase gcc.dg/vmx/7d-02.c
+
+Upstream commit: d3cdd96a300f9003a1cc242541605169aacdc811
+
+Backport by Kaushik Phatak <Kaushik.Phatak@kpit.com>
+
+This patch removes changes to Changelog from the original upstream patch.
+This will help us avoid conflicts.
+
+Upstream-Status: Backport
+
+Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
+---
+ gcc/ChangeLog                |  8 +++++
+ gcc/config/rs6000/rs6000-c.c | 72 -------------------------------------------
+ gcc/config/rs6000/rs6000.c   | 73 ++++++++++++++++++++++++++++++++++++++++++--
+ 3 files changed, 78 insertions(+), 75 deletions(-)
+
+diff --git a/gcc/config/rs6000/rs6000-c.c b/gcc/config/rs6000/rs6000-c.c
+index a49db97..4a363a1 100644
+--- a/gcc/config/rs6000/rs6000-c.c
++++ b/gcc/config/rs6000/rs6000-c.c
+@@ -6279,70 +6279,6 @@ altivec_resolve_overloaded_builtin (loca
+ 	}
+     }
+ 
+-  /* Similarly for stvx.  */
+-  if (fcode == ALTIVEC_BUILTIN_VEC_ST
+-      && (BYTES_BIG_ENDIAN || !VECTOR_ELT_ORDER_BIG)
+-      && nargs == 3)
+-    {
+-      tree arg0 = (*arglist)[0];
+-      tree arg1 = (*arglist)[1];
+-      tree arg2 = (*arglist)[2];
+-
+-      /* Construct the masked address.  Let existing error handling take
+-	 over if we don't have a constant offset.  */
+-      arg1 = fold (arg1);
+-
+-      if (TREE_CODE (arg1) == INTEGER_CST)
+-	{
+-	  if (!ptrofftype_p (TREE_TYPE (arg1)))
+-	    arg1 = build1 (NOP_EXPR, sizetype, arg1);
+-
+-	  tree arg2_type = TREE_TYPE (arg2);
+-	  if (TREE_CODE (arg2_type) == ARRAY_TYPE && c_dialect_cxx ())
+-	    {
+-	      /* Force array-to-pointer decay for C++.  */
+-	      arg2 = default_conversion (arg2);
+-	      arg2_type = TREE_TYPE (arg2);
+-	    }
+-
+-	  /* Find the built-in to make sure a compatible one exists; if not
+-	     we fall back to default handling to get the error message.  */
+-	  for (desc = altivec_overloaded_builtins;
+-	       desc->code && desc->code != fcode; desc++)
+-	    continue;
+-
+-	  for (; desc->code == fcode; desc++)
+-	    if (rs6000_builtin_type_compatible (TREE_TYPE (arg0), desc->op1)
+-		&& rs6000_builtin_type_compatible (TREE_TYPE (arg1), desc->op2)
+-		&& rs6000_builtin_type_compatible (TREE_TYPE (arg2),
+-						   desc->op3))
+-	      {
+-		tree addr = fold_build2_loc (loc, POINTER_PLUS_EXPR, arg2_type,
+-					     arg2, arg1);
+-		tree aligned
+-		  = fold_build2_loc (loc, BIT_AND_EXPR, arg2_type,
+-				     addr, build_int_cst (arg2_type, -16));
+-
+-		tree arg0_type = TREE_TYPE (arg0);
+-		if (TYPE_MODE (arg0_type) == V2DImode)
+-		  /* Type-based aliasing analysis thinks vector long
+-		     and vector long long are different and will put them
+-		     in distinct alias classes.  Force our address type
+-		     to be a may-alias type to avoid this.  */
+-		  arg0_type
+-		    = build_pointer_type_for_mode (arg0_type, Pmode,
+-						   true/*can_alias_all*/);
+-		else
+-		  arg0_type = build_pointer_type (arg0_type);
+-		aligned = build1 (NOP_EXPR, arg0_type, aligned);
+-		tree stg = build_indirect_ref (loc, aligned, RO_NULL);
+-		tree retval = build2 (MODIFY_EXPR, TREE_TYPE (stg), stg,
+-				      convert (TREE_TYPE (stg), arg0));
+-		return retval;
+-	      }
+-	}
+-    }
+-
+   for (n = 0;
+        !VOID_TYPE_P (TREE_VALUE (fnargs)) && n < nargs;
+        fnargs = TREE_CHAIN (fnargs), n++)
+diff --git a/gcc/config/rs6000/rs6000.c b/gcc/config/rs6000/rs6000.c
+index a49db97..4a363a1 100644
+--- a/gcc/config/rs6000/rs6000.c
++++ b/gcc/config/rs6000/rs6000.c
+@@ -55,6 +55,7 @@
+ #include "reload.h"
+ #include "sched-int.h"
+ #include "gimplify.h"
++#include "gimple-fold.h"
+ #include "gimple-iterator.h"
+ #include "gimple-ssa.h"
+ #include "gimple-walk.h"
+@@ -17089,6 +17090,25 @@ rs6000_fold_builtin (tree fndecl, int n_
+ #endif
+ }
+ 
++/*  Helper function to sort out which built-ins may be valid without having
++    a LHS.  */
++bool
++rs6000_builtin_valid_without_lhs (enum rs6000_builtins fn_code)
++{
++  switch (fn_code)
++    {
++    case ALTIVEC_BUILTIN_STVX_V16QI:
++    case ALTIVEC_BUILTIN_STVX_V8HI:
++    case ALTIVEC_BUILTIN_STVX_V4SI:
++    case ALTIVEC_BUILTIN_STVX_V4SF:
++    case ALTIVEC_BUILTIN_STVX_V2DI:
++    case ALTIVEC_BUILTIN_STVX_V2DF:
++      return true;
++    default:
++      return false;
++    }
++}
++
+ /* Fold a machine-dependent built-in in GIMPLE.  (For folding into
+    a constant, use rs6000_fold_builtin.)  */
+ 
+@@ -17102,6 +17122,10 @@ rs6000_gimple_fold_builtin (gimple_stmt_
+     = (enum rs6000_builtins) DECL_FUNCTION_CODE (fndecl);
+   tree arg0, arg1, lhs;
+ 
++  /* Prevent gimple folding for code that does not have a LHS, unless it is
++     allowed per the rs6000_builtin_valid_without_lhs helper function.  */
++  if (!gimple_call_lhs (stmt) && !rs6000_builtin_valid_without_lhs (fn_code))
++     return false;
+   switch (fn_code)
+     {
+     /* Flavors of vec_add.  We deliberately don't expand
+@@ -17169,6 +17193,54 @@ rs6000_gimple_fold_builtin (gimple_stmt_
+ 	gsi_replace (gsi, g, true);
+ 	return true;
+       }
++    /* Vector stores.  */
++    case ALTIVEC_BUILTIN_STVX_V16QI:
++    case ALTIVEC_BUILTIN_STVX_V8HI:
++    case ALTIVEC_BUILTIN_STVX_V4SI:
++    case ALTIVEC_BUILTIN_STVX_V4SF:
++    case ALTIVEC_BUILTIN_STVX_V2DI:
++    case ALTIVEC_BUILTIN_STVX_V2DF:
++      {
++	 /* Do not fold for -maltivec=be on LE targets.  */
++	 if (VECTOR_ELT_ORDER_BIG && !BYTES_BIG_ENDIAN)
++	    return false;
++	 arg0 = gimple_call_arg (stmt, 0); /* Value to be stored.  */
++	 arg1 = gimple_call_arg (stmt, 1); /* Offset.  */
++	 tree arg2 = gimple_call_arg (stmt, 2); /* Store-to address.  */
++	 location_t loc = gimple_location (stmt);
++	 tree arg0_type = TREE_TYPE (arg0);
++	 /* Use ptr_type_node (no TBAA) for the arg2_type.
++	  FIXME: (Richard)  "A proper fix would be to transition this type as
++	  seen from the frontend to GIMPLE, for example in a similar way we
++	  do for MEM_REFs by piggy-backing that on an extra argument, a
++	  constant zero pointer of the alias pointer type to use (which would
++	  also serve as a type indicator of the store itself).  I'd use a
++	  target specific internal function for this (not sure if we can have
++	  those target specific, but I guess if it's folded away then that's
++	  fine) and get away with the overload set."
++	  */
++	 tree arg2_type = ptr_type_node;
++	 /* POINTER_PLUS_EXPR wants the offset to be of type 'sizetype'.  Create
++	    the tree using the value from arg0.  The resulting type will match
++	    the type of arg2.  */
++	 gimple_seq stmts = NULL;
++	 tree temp_offset = gimple_convert (&stmts, loc, sizetype, arg1);
++	 tree temp_addr = gimple_build (&stmts, loc, POINTER_PLUS_EXPR,
++				       arg2_type, arg2, temp_offset);
++	 /* Mask off any lower bits from the address.  */
++	 tree aligned_addr = gimple_build (&stmts, loc, BIT_AND_EXPR,
++					  arg2_type, temp_addr,
++					  build_int_cst (arg2_type, -16));
++	 gsi_insert_seq_before (gsi, stmts, GSI_SAME_STMT);
++	/* The desired gimple result should be similar to:
++	 MEM[(__vector floatD.1407 *)_1] = vf1D.2697;  */
++	 gimple *g;
++	 g = gimple_build_assign (build2 (MEM_REF, arg0_type, aligned_addr,
++					   build_int_cst (arg2_type, 0)), arg0);
++	 gimple_set_location (g, loc);
++	 gsi_replace (gsi, g, true);
++	 return true;
++      }
+ 
+     default:
+       break;
-- 
1.8.3.1


