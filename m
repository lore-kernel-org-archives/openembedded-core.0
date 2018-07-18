Return-Path: <raphael.kubo.da.costa@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id E60C6789CF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 11:18:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Jul 2018 04:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,370,1526367600"; d="scan'208";a="57455628"
Received: from rkubodac-desk.ger.corp.intel.com ([10.252.5.122])
	by orsmga007.jf.intel.com with ESMTP; 18 Jul 2018 04:17:50 -0700
From: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2018 13:17:47 +0200
Message-Id: <20180718111747.54105-1-raphael.kubo.da.costa@intel.com>
X-Mailer: git-send-email 2.14.4
Subject: [pyro][PATCH] gcc: Backport upstream r261799
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
X-List-Received-Date: Wed, 18 Jul 2018 11:18:05 -0000

The upstream commit merges several bug fixes into the GCC 6 branch; we are
specifically interested in the fix for GCC bug 83623, which was causing
Chromium 68+ to fail to build on ARM and aarch64 with

    In file included from ../../third_party/skia/third_party/skcms/src/Transform.c:176:0:
    ../../third_party/skia/third_party/skcms/src/Transform_inl.h: In function 'exec_ops':
    ../../third_party/skia/third_party/skcms/src/Transform_inl.h:459:32: internal compiler error: in convert_move, at expr.c:299
         v = (U16)( ((v<<8)|(v>>8)) & 0xffff );
                  ~~~~~~~~~~~~~~~~~~^~~~~~~~~~

Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
---
 meta/recipes-devtools/gcc/gcc-6.4.inc              |   1 +
 ...18-06-20-Richard-Biener-rguenther-suse.de.patch | 504 +++++++++++++++++++++
 2 files changed, 505 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0058-2018-06-20-Richard-Biener-rguenther-suse.de.patch

diff --git a/meta/recipes-devtools/gcc/gcc-6.4.inc b/meta/recipes-devtools/gcc/gcc-6.4.inc
index daa9e42af8..f3cada2e9f 100644
--- a/meta/recipes-devtools/gcc/gcc-6.4.inc
+++ b/meta/recipes-devtools/gcc/gcc-6.4.inc
@@ -86,6 +86,7 @@ SRC_URI = "\
 BACKPORTS = "\
            file://CVE-2016-6131.patch \
            file://0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch \
+           file://0058-2018-06-20-Richard-Biener-rguenther-suse.de.patch \
            file://0001-enable-FL_LPAE-flag-for-armv7ve-cores.patch \
            file://0001-i386-Move-struct-ix86_frame-to-machine_function.patch \
            file://0002-i386-Use-reference-of-struct-ix86_frame-to-avoid-cop.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-6.4/0058-2018-06-20-Richard-Biener-rguenther-suse.de.patch b/meta/recipes-devtools/gcc/gcc-6.4/0058-2018-06-20-Richard-Biener-rguenther-suse.de.patch
new file mode 100644
index 0000000000..55d420147b
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-6.4/0058-2018-06-20-Richard-Biener-rguenther-suse.de.patch
@@ -0,0 +1,504 @@
+Upstream-Status: Backport
+
+Upstream's GCC 6 backport includes several changes, but it's the fix
+for bug 63623 that is required to build Chromium >= 68 with GCC 6 on
+ARM-based architectures.
+
+Signed-off-by: Raphael Kubo da Costa <raphael.kubo.da.costa@intel.com>
+---
+From 4ff56937609df5e6373d83d197a85c062454bc05 Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 20 Jun 2018 11:09:28 +0000
+Subject: [PATCH] 2018-06-20  Richard Biener  <rguenther@suse.de>
+
+	Backport from mainline
+	2018-01-01  Jakub Jelinek  <jakub@redhat.com>
+
+	PR middle-end/83623
+	* expmed.c (expand_shift_1): For 2-byte rotates by BITS_PER_UNIT,
+	check for bswap in mode rather than HImode and use that in expand_unop
+	too.
+
+	* gcc.dg/pr83623.c: New test.
+
+	2017-09-26  Richard Biener  <rguenther@suse.de>
+
+	Backport from mainline
+	2017-09-20  Richard Biener  <rguenther@suse.de>
+
+	PR tree-optimization/82264
+	* tree-ssa-sccvn.c (vn_phi_eq): Use safe_dyn_cast to check
+	for GIMPLE_CONDs.
+	(vn_phi_lookup): Likewise.
+	(vn_phi_insert): Likewise.
+	* is-a.h (safe_dyn_cast): New.
+
+	* gcc.dg/torture/pr82264.c: New testcase.
+
+	2017-09-25  Richard Biener  <rguenther@suse.de>
+
+	PR tree-optimization/82285
+	* tree-vect-patterns.c (vect_recog_bool_pattern): Also handle
+	enumeral types.
+
+	* gcc.dg/torture/pr82285.c: New testcase.
+
+	2017-11-24  Richard Biener  <rguenther@suse.de>
+
+	PR tree-optimization/82402
+	* tree-vect-loop-manip.c (create_lcssa_for_virtual_phi): Properly
+	set SSA_NAME_OCCURS_IN_ABNORMAL_PHI.
+
+	* gcc.dg/torture/pr82402.c: New testcase.
+
+	2017-10-24  Richard Biener  <rguenther@suse.de>
+
+	PR tree-optimization/82697
+	* tree-ssa-phiopt.c (cond_store_replacement): Use alias-set
+	zero for conditional load and unconditional store.
+
+	* gcc.dg/torture/pr82697.c: New testcase.
+
+	2017-11-02  Richard Biener  <rguenther@suse.de>
+
+	PR middle-end/82765
+	* varasm.c (decode_addr_const): Make offset HOST_WIDE_INT.
+	Truncate ARRAY_REF index and element size.
+
+	* gcc.dg/pr82765.c: New testcase.
+
+	2018-01-08  Richard Biener  <rguenther@suse.de>
+
+	PR middle-end/83713
+	* convert.c (do_narrow): Properly guard TYPE_OVERFLOW_WRAPS checks.
+
+	* g++.dg/torture/pr83713.C: New testcase.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-6-branch@261799 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/ChangeLog                          | 51 ++++++++++++++++++++++++++++++++++
+ gcc/convert.c                          |  6 ++--
+ gcc/expmed.c                           |  5 ++--
+ gcc/is-a.h                             | 14 ++++++++++
+ gcc/testsuite/ChangeLog                | 41 +++++++++++++++++++++++++++
+ gcc/testsuite/g++.dg/torture/pr83713.C | 12 ++++++++
+ gcc/testsuite/gcc.dg/pr82765.c         |  5 ++++
+ gcc/testsuite/gcc.dg/pr83623.c         | 12 ++++++++
+ gcc/testsuite/gcc.dg/torture/pr82264.c | 21 ++++++++++++++
+ gcc/testsuite/gcc.dg/torture/pr82285.c | 16 +++++++++++
+ gcc/testsuite/gcc.dg/torture/pr82402.c | 20 +++++++++++++
+ gcc/testsuite/gcc.dg/torture/pr82697.c | 23 +++++++++++++++
+ gcc/tree-ssa-alias.c                   | 31 +++++++++++++++------
+ gcc/tree-ssa-phiopt.c                  | 17 +++++++++++-
+ gcc/tree-ssa-sccvn.c                   | 17 +++++-------
+ gcc/tree-vect-loop-manip.c             |  2 ++
+ gcc/tree-vect-patterns.c               |  2 +-
+ gcc/varasm.c                           |  7 +++--
+ 18 files changed, 273 insertions(+), 29 deletions(-)
+ create mode 100644 gcc/testsuite/g++.dg/torture/pr83713.C
+ create mode 100644 gcc/testsuite/gcc.dg/pr82765.c
+ create mode 100644 gcc/testsuite/gcc.dg/pr83623.c
+ create mode 100644 gcc/testsuite/gcc.dg/torture/pr82264.c
+ create mode 100644 gcc/testsuite/gcc.dg/torture/pr82285.c
+ create mode 100644 gcc/testsuite/gcc.dg/torture/pr82402.c
+ create mode 100644 gcc/testsuite/gcc.dg/torture/pr82697.c
+
+diff --git a/gcc/convert.c b/gcc/convert.c
+index 455304adb0c..f4b4712f023 100644
+--- a/gcc/convert.c
++++ b/gcc/convert.c
+@@ -459,8 +459,10 @@ do_narrow (location_t loc,
+ 	     type in case the operation in outprec precision
+ 	     could overflow.  Otherwise, we would introduce
+ 	     signed-overflow undefinedness.  */
+-	  || ((!TYPE_OVERFLOW_WRAPS (TREE_TYPE (arg0))
+-	       || !TYPE_OVERFLOW_WRAPS (TREE_TYPE (arg1)))
++	  || ((!(INTEGRAL_TYPE_P (TREE_TYPE (arg0))
++		 && TYPE_OVERFLOW_WRAPS (TREE_TYPE (arg0)))
++	       || !(INTEGRAL_TYPE_P (TREE_TYPE (arg1))
++		    && TYPE_OVERFLOW_WRAPS (TREE_TYPE (arg1))))
+ 	      && ((TYPE_PRECISION (TREE_TYPE (arg0)) * 2u
+ 		   > outprec)
+ 		  || (TYPE_PRECISION (TREE_TYPE (arg1)) * 2u
+diff --git a/gcc/expmed.c b/gcc/expmed.c
+index 80edb0d03fb..8e069455bc2 100644
+--- a/gcc/expmed.c
++++ b/gcc/expmed.c
+@@ -2361,9 +2361,8 @@ expand_shift_1 (enum tree_code code, machine_mode mode, rtx shifted,
+       && CONST_INT_P (op1)
+       && INTVAL (op1) == BITS_PER_UNIT
+       && GET_MODE_SIZE (scalar_mode) == 2
+-      && optab_handler (bswap_optab, HImode) != CODE_FOR_nothing)
+-    return expand_unop (HImode, bswap_optab, shifted, NULL_RTX,
+-				  unsignedp);
++      && optab_handler (bswap_optab, mode) != CODE_FOR_nothing)
++    return expand_unop (mode, bswap_optab, shifted, NULL_RTX, unsignedp);
+ 
+   if (op1 == const0_rtx)
+     return shifted;
+diff --git a/gcc/is-a.h b/gcc/is-a.h
+index 872aec1f5e7..05dd11dbe75 100644
+--- a/gcc/is-a.h
++++ b/gcc/is-a.h
+@@ -103,6 +103,11 @@ TYPE dyn_cast <TYPE> (pointer)
+     Note that we have converted two sets of assertions in the calls to varpool
+     into safe and efficient use of a variable.
+ 
++TYPE safe_dyn_cast <TYPE> (pointer)
++
++    Like dyn_cast <TYPE> (pointer), except that it accepts null pointers
++    and returns null results for them.
++
+ 
+ If you use these functions and get a 'inline function not defined' or a
+ 'missing symbol' error message for 'is_a_helper<....>::test', it means that
+@@ -222,4 +227,13 @@ dyn_cast (U *p)
+     return static_cast <T> (0);
+ }
+ 
++/* Similar to dyn_cast, except that the pointer may be null.  */
++
++template <typename T, typename U>
++inline T
++safe_dyn_cast (U *p)
++{
++  return p ? dyn_cast <T> (p) : 0;
++}
++
+ #endif  /* GCC_IS_A_H  */
+diff --git a/gcc/testsuite/g++.dg/torture/pr83713.C b/gcc/testsuite/g++.dg/torture/pr83713.C
+new file mode 100644
+index 00000000000..ca6af04406d
+--- /dev/null
++++ b/gcc/testsuite/g++.dg/torture/pr83713.C
+@@ -0,0 +1,12 @@
++// { dg-do compile }
++
++class a
++{
++  char b;
++  void c ();
++};
++void
++a::c ()
++{
++  &b + ((long long) &b & 0);
++}
+diff --git a/gcc/testsuite/gcc.dg/pr82765.c b/gcc/testsuite/gcc.dg/pr82765.c
+new file mode 100644
+index 00000000000..dde0aeba7ef
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/pr82765.c
+@@ -0,0 +1,5 @@
++/* { dg-do compile } */
++/* { dg-options "-Os -w" } */
++
++int a[1][1];
++int main() { int *b[] = {a, a[1820408606019012862278468], a, a, a}; }
+diff --git a/gcc/testsuite/gcc.dg/pr83623.c b/gcc/testsuite/gcc.dg/pr83623.c
+new file mode 100644
+index 00000000000..5d62c04f542
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/pr83623.c
+@@ -0,0 +1,12 @@
++/* PR middle-end/83623 */
++/* { dg-do compile } */
++/* { dg-options "-O2" } */
++/* { dg-additional-options "-mmovbe" { target i?86-*-* x86_64-*-* } } */
++
++unsigned short __attribute__ ((__vector_size__ (16))) x;
++
++void
++foo (void)
++{
++  x = x << 8 | x >> 8;
++}
+diff --git a/gcc/testsuite/gcc.dg/torture/pr82264.c b/gcc/testsuite/gcc.dg/torture/pr82264.c
+new file mode 100644
+index 00000000000..2bc03674ccd
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/torture/pr82264.c
+@@ -0,0 +1,21 @@
++/* { dg-do compile } */
++
++char a;
++int c;
++unsigned b ();
++unsigned
++setjmp ()
++{
++}
++static void
++d ()
++{
++  if (b ())
++    c = 3;
++}
++void
++e ()
++{
++  d ();
++  a && ({ setjmp (); });
++}
+diff --git a/gcc/testsuite/gcc.dg/torture/pr82285.c b/gcc/testsuite/gcc.dg/torture/pr82285.c
+new file mode 100644
+index 00000000000..6edc75070b2
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/torture/pr82285.c
+@@ -0,0 +1,16 @@
++/* { dg-do run } */
++
++enum tst { first = 0, second = 1 };
++
++int
++main ()
++{
++  enum tst data[16];
++
++  for (unsigned i = 0; i < 16; i++)
++    data[i] = (i < 5 ? second : first);
++
++  if (data[2] != second)
++    __builtin_abort ();
++  return 0;
++}
+diff --git a/gcc/testsuite/gcc.dg/torture/pr82402.c b/gcc/testsuite/gcc.dg/torture/pr82402.c
+new file mode 100644
+index 00000000000..cf90d5c6faf
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/torture/pr82402.c
+@@ -0,0 +1,20 @@
++/* { dg-do compile } */
++
++typedef int jmp_buf[1];
++
++extern void exit(int) __attribute__((__noreturn__));
++extern int setjmpx(jmp_buf) __attribute__((__returns_twice__));
++
++jmp_buf jbAnagram;
++int a[6];
++int d;
++int b () { exit (1); }
++int c () { b (); }
++int e ()
++{
++  int f = 0;
++  for (; f < 6; f++)
++    a[f] = d;
++  c ();
++  setjmpx (jbAnagram);
++}
+diff --git a/gcc/testsuite/gcc.dg/torture/pr82697.c b/gcc/testsuite/gcc.dg/torture/pr82697.c
+new file mode 100644
+index 00000000000..57da8a264b9
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/torture/pr82697.c
+@@ -0,0 +1,23 @@
++/* { dg-do run } */
++
++__attribute__((noinline,noclone))
++void test(int *pi, long *pl, int f)
++{
++  *pl = 0;
++
++  *pi = 1;
++
++  if (f)
++    *pl = 2;
++}
++
++int main()
++{
++  void *p = __builtin_malloc(sizeof (long));
++
++  test(p, p, 0);
++
++  if (*(int *)p != 1)
++    __builtin_abort ();
++  return 0;
++}
+diff --git a/gcc/tree-ssa-alias.c b/gcc/tree-ssa-alias.c
+index 08f10e5248b..3f0011f3d10 100644
+--- a/gcc/tree-ssa-alias.c
++++ b/gcc/tree-ssa-alias.c
+@@ -2235,6 +2235,7 @@ stmt_kills_ref_p (gimple *stmt, ao_ref *ref)
+       if (ref->ref)
+ 	{
+ 	  tree base = ref->ref;
++	  tree innermost_dropped_array_ref = NULL_TREE;
+ 	  if (handled_component_p (base))
+ 	    {
+ 	      tree saved_lhs0 = NULL_TREE;
+@@ -2254,6 +2255,11 @@ stmt_kills_ref_p (gimple *stmt, ao_ref *ref)
+ 		  TREE_OPERAND (base, 0) = saved_base0;
+ 		  if (res)
+ 		    break;
++		  /* Remember if we drop an array-ref that we need to
++		     double-check not being at struct end.  */ 
++		  if (TREE_CODE (base) == ARRAY_REF
++		      || TREE_CODE (base) == ARRAY_RANGE_REF)
++		    innermost_dropped_array_ref = base;
+ 		  /* Otherwise drop handled components of the access.  */
+ 		  base = saved_base0;
+ 		}
+@@ -2262,15 +2268,22 @@ stmt_kills_ref_p (gimple *stmt, ao_ref *ref)
+ 		TREE_OPERAND (lhs, 0) = saved_lhs0;
+ 	    }
+ 	  /* Finally check if the lhs has the same address and size as the
+-	     base candidate of the access.  */
+-	  if (lhs == base
+-	      || (((TYPE_SIZE (TREE_TYPE (lhs))
+-		    == TYPE_SIZE (TREE_TYPE (base)))
+-		   || (TYPE_SIZE (TREE_TYPE (lhs))
+-		       && TYPE_SIZE (TREE_TYPE (base))
+-		       && operand_equal_p (TYPE_SIZE (TREE_TYPE (lhs)),
+-					   TYPE_SIZE (TREE_TYPE (base)), 0)))
+-		  && operand_equal_p (lhs, base, OEP_ADDRESS_OF)))
++	     base candidate of the access.  Watch out if we have dropped
++	     an array-ref that was at struct end, this means ref->ref may
++	     be outside of the TYPE_SIZE of its base.  */
++	  if ((! innermost_dropped_array_ref
++	       || ! array_at_struct_end_p (innermost_dropped_array_ref))
++	      && (lhs == base
++		  || (((TYPE_SIZE (TREE_TYPE (lhs))
++			== TYPE_SIZE (TREE_TYPE (base)))
++		       || (TYPE_SIZE (TREE_TYPE (lhs))
++			   && TYPE_SIZE (TREE_TYPE (base))
++			   && operand_equal_p (TYPE_SIZE (TREE_TYPE (lhs)),
++					       TYPE_SIZE (TREE_TYPE (base)),
++					       0)))
++		      && operand_equal_p (lhs, base,
++					  OEP_ADDRESS_OF
++					  | OEP_MATCH_SIDE_EFFECTS))))
+ 	    return true;
+ 	}
+ 
+diff --git a/gcc/tree-ssa-phiopt.c b/gcc/tree-ssa-phiopt.c
+index f6880ba88f3..fb6e8be4343 100644
+--- a/gcc/tree-ssa-phiopt.c
++++ b/gcc/tree-ssa-phiopt.c
+@@ -1761,9 +1761,24 @@ cond_store_replacement (basic_block middle_bb, basic_block join_bb,
+   gsi_remove (&gsi, true);
+   release_defs (assign);
+ 
++  /* Make both store and load use alias-set zero as we have to
++     deal with the case of the store being a conditional change
++     of the dynamic type.  */
++  lhs = unshare_expr (lhs);
++  tree *basep = &lhs;
++  while (handled_component_p (*basep))
++    basep = &TREE_OPERAND (*basep, 0);
++  if (TREE_CODE (*basep) == MEM_REF
++      || TREE_CODE (*basep) == TARGET_MEM_REF)
++    TREE_OPERAND (*basep, 1)
++      = fold_convert (ptr_type_node, TREE_OPERAND (*basep, 1));
++  else
++    *basep = build2 (MEM_REF, TREE_TYPE (*basep),
++		     build_fold_addr_expr (*basep),
++		     build_zero_cst (ptr_type_node));
++
+   /* 2) Insert a load from the memory of the store to the temporary
+         on the edge which did not contain the store.  */
+-  lhs = unshare_expr (lhs);
+   name = make_temp_ssa_name (TREE_TYPE (lhs), NULL, "cstore");
+   new_stmt = gimple_build_assign (name, lhs);
+   gimple_set_location (new_stmt, locus);
+diff --git a/gcc/tree-ssa-sccvn.c b/gcc/tree-ssa-sccvn.c
+index 65077ede43c..15838975f37 100644
+--- a/gcc/tree-ssa-sccvn.c
++++ b/gcc/tree-ssa-sccvn.c
+@@ -2841,16 +2841,13 @@ vn_phi_eq (const_vn_phi_t const vp1, const_vn_phi_t const vp2)
+ 	      return false;
+ 
+ 	    /* Verify the controlling stmt is the same.  */
+-	    gimple *last1 = last_stmt (idom1);
+-	    gimple *last2 = last_stmt (idom2);
+-	    if (gimple_code (last1) != GIMPLE_COND
+-		|| gimple_code (last2) != GIMPLE_COND)
++	    gcond *last1 = safe_dyn_cast <gcond *> (last_stmt (idom1));
++	    gcond *last2 = safe_dyn_cast <gcond *> (last_stmt (idom2));
++	    if (! last1 || ! last2)
+ 	      return false;
+ 	    bool inverted_p;
+-	    if (! cond_stmts_equal_p (as_a <gcond *> (last1),
+-				      vp1->cclhs, vp1->ccrhs,
+-				      as_a <gcond *> (last2),
+-				      vp2->cclhs, vp2->ccrhs,
++	    if (! cond_stmts_equal_p (last1, vp1->cclhs, vp1->ccrhs,
++				      last2, vp2->cclhs, vp2->ccrhs,
+ 				      &inverted_p))
+ 	      return false;
+ 
+@@ -2935,7 +2932,7 @@ vn_phi_lookup (gimple *phi)
+   vp1.ccrhs = NULL_TREE;
+   basic_block idom1 = get_immediate_dominator (CDI_DOMINATORS, vp1.block);
+   if (EDGE_COUNT (idom1->succs) == 2)
+-    if (gcond *last1 = dyn_cast <gcond *> (last_stmt (idom1)))
++    if (gcond *last1 = safe_dyn_cast <gcond *> (last_stmt (idom1)))
+       {
+ 	vp1.cclhs = vn_valueize (gimple_cond_lhs (last1));
+ 	vp1.ccrhs = vn_valueize (gimple_cond_rhs (last1));
+@@ -2981,7 +2978,7 @@ vn_phi_insert (gimple *phi, tree result)
+   vp1->ccrhs = NULL_TREE;
+   basic_block idom1 = get_immediate_dominator (CDI_DOMINATORS, vp1->block);
+   if (EDGE_COUNT (idom1->succs) == 2)
+-    if (gcond *last1 = dyn_cast <gcond *> (last_stmt (idom1)))
++    if (gcond *last1 = safe_dyn_cast <gcond *> (last_stmt (idom1)))
+       {
+ 	vp1->cclhs = vn_valueize (gimple_cond_lhs (last1));
+ 	vp1->ccrhs = vn_valueize (gimple_cond_rhs (last1));
+diff --git a/gcc/tree-vect-loop-manip.c b/gcc/tree-vect-loop-manip.c
+index 7ec6daec0e6..ecd41d86b29 100644
+--- a/gcc/tree-vect-loop-manip.c
++++ b/gcc/tree-vect-loop-manip.c
+@@ -1231,6 +1231,8 @@ slpeel_tree_peel_loop_to_edge (struct loop *loop, struct loop *scalar_loop,
+ 	    gimple *stmt;
+ 	    use_operand_p use_p;
+ 
++	    SSA_NAME_OCCURS_IN_ABNORMAL_PHI (new_vop)
++	      = SSA_NAME_OCCURS_IN_ABNORMAL_PHI (vop);
+ 	    add_phi_arg (new_phi, vop, exit_e, UNKNOWN_LOCATION);
+ 	    gimple_phi_set_result (new_phi, new_vop);
+ 	    FOR_EACH_IMM_USE_STMT (stmt, imm_iter, vop)
+diff --git a/gcc/tree-vect-patterns.c b/gcc/tree-vect-patterns.c
+index c2a6f0d3fd5..1d419495dff 100644
+--- a/gcc/tree-vect-patterns.c
++++ b/gcc/tree-vect-patterns.c
+@@ -3363,7 +3363,7 @@ vect_recog_bool_pattern (vec<gimple *> *stmts, tree *type_in,
+   rhs_code = gimple_assign_rhs_code (last_stmt);
+   if (CONVERT_EXPR_CODE_P (rhs_code))
+     {
+-      if (TREE_CODE (TREE_TYPE (lhs)) != INTEGER_TYPE
++      if (! INTEGRAL_TYPE_P (TREE_TYPE (lhs))
+ 	  || TYPE_PRECISION (TREE_TYPE (lhs)) == 1)
+ 	return NULL;
+       vectype = get_vectype_for_scalar_type (TREE_TYPE (lhs));
+diff --git a/gcc/varasm.c b/gcc/varasm.c
+index b65f29c13a4..2e88e71c25d 100644
+--- a/gcc/varasm.c
++++ b/gcc/varasm.c
+@@ -2806,7 +2806,7 @@ static void
+ decode_addr_const (tree exp, struct addr_const *value)
+ {
+   tree target = TREE_OPERAND (exp, 0);
+-  int offset = 0;
++  HOST_WIDE_INT offset = 0;
+   rtx x;
+ 
+   while (1)
+@@ -2820,8 +2820,9 @@ decode_addr_const (tree exp, struct addr_const *value)
+       else if (TREE_CODE (target) == ARRAY_REF
+ 	       || TREE_CODE (target) == ARRAY_RANGE_REF)
+ 	{
+-	  offset += (tree_to_uhwi (TYPE_SIZE_UNIT (TREE_TYPE (target)))
+-		     * tree_to_shwi (TREE_OPERAND (target, 1)));
++	  /* Truncate big offset.  */
++	  offset += (TREE_INT_CST_LOW (TYPE_SIZE_UNIT (TREE_TYPE (target)))
++		     * TREE_INT_CST_LOW (TREE_OPERAND (target, 1)));
+ 	  target = TREE_OPERAND (target, 0);
+ 	}
+       else if (TREE_CODE (target) == MEM_REF
+-- 
+2.14.4
+
-- 
2.14.4


