Return-Path: <tom.zanussi@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3DA1F6F66D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 04:26:33 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Mar 2014 20:26:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,605,1389772800"; d="scan'208";a="487690805"
Received: from unknown (HELO localhost) ([10.255.13.79])
	by fmsmga001.fm.intel.com with ESMTP; 06 Mar 2014 20:26:33 -0800
From: Tom Zanussi <tom.zanussi@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 22:26:22 -0600
Message-Id: <0548a63a7dfc14bf42046189de83a111d153c3b5.1394165774.git.tom.zanussi@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394165774.git.tom.zanussi@linux.intel.com>
References: <489d4a5c88148ee8864e93a2b5a393065e1f80b2.1394165774.git.tom.zanussi@linux.intel.com>
In-Reply-To: <cover.1394165774.git.tom.zanussi@linux.intel.com>
References: <cover.1394165774.git.tom.zanussi@linux.intel.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 7/7] gcc: Add upstream fix for gcc bug 58595
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
X-List-Received-Date: Fri, 07 Mar 2014 04:26:33 -0000

Fix for internal compiler error hit when building lttng-tools_4.2.0:

 kernel-consumer.c:324:1: internal compiler error: in gen_movsi, at
   config/arm/arm.md:5539

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |   3 +-
 .../gcc/gcc-4.8/0050-PR-target-58595.patch         | 132 +++++++++++++++++++++
 2 files changed, 134 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index f5e583d..855ec26 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -69,7 +69,8 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://0046-libatomic-deptracking.patch \
 	   file://0047-repomembug.patch \
 	   file://0048-PR58854_fix_arm_apcs_epilogue.patch \
-	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \ 
+	   file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
+	   file://0050-PR-target-58595.patch \
 	  "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch b/meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
new file mode 100644
index 0000000..4470596
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0050-PR-target-58595.patch
@@ -0,0 +1,132 @@
+Backport fix for PR target/58595
+
+From: jakub <jakub@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 6 Mar 2014 12:07:07 +0000
+Subject: [PATCH] 	PR target/58595 	* config/arm/arm.c
+ (arm_tls_symbol_p): Remove. 	(arm_legitimize_address): Call
+ legitimize_tls_address for any 	arm_tls_referenced_p expression,
+ handle constant addend.  Call it 	before testing for !TARGET_ARM. 
+ (thumb_legitimize_address): Don't handle arm_tls_symbol_p here.
+
+	* gcc.dg/tls/pr58595.c: New test.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@208380 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Index: gcc-4.8.2/gcc/ChangeLog
+===================================================================
+--- gcc-4.8.2.orig/gcc/ChangeLog
++++ gcc-4.8.2/gcc/ChangeLog
+@@ -1,3 +1,13 @@
++2014-03-06  Jakub Jelinek  <jakub@redhat.com>
++	    Meador Inge  <meadori@codesourcery.com>
++
++	PR target/58595
++	* config/arm/arm.c (arm_tls_symbol_p): Remove.
++	(arm_legitimize_address): Call legitimize_tls_address for any
++	arm_tls_referenced_p expression, handle constant addend.  Call it
++	before testing for !TARGET_ARM.
++	(thumb_legitimize_address): Don't handle arm_tls_symbol_p here.
++
+ 2013-10-16  Release Manager
+ 
+ 	* GCC 4.8.2 released.
+Index: gcc-4.8.2/gcc/config/arm/arm.c
+===================================================================
+--- gcc-4.8.2.orig/gcc/config/arm/arm.c
++++ gcc-4.8.2/gcc/config/arm/arm.c
+@@ -230,7 +230,6 @@ static tree arm_gimplify_va_arg_expr (tr
+ static void arm_option_override (void);
+ static unsigned HOST_WIDE_INT arm_shift_truncation_mask (enum machine_mode);
+ static bool arm_cannot_copy_insn_p (rtx);
+-static bool arm_tls_symbol_p (rtx x);
+ static int arm_issue_rate (void);
+ static void arm_output_dwarf_dtprel (FILE *, int, rtx) ATTRIBUTE_UNUSED;
+ static bool arm_output_addr_const_extra (FILE *, rtx);
+@@ -6573,6 +6572,32 @@ legitimize_tls_address (rtx x, rtx reg)
+ rtx
+ arm_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
+ {
++  if (arm_tls_referenced_p (x))
++    {
++      rtx addend = NULL;
++
++      if (GET_CODE (x) == CONST && GET_CODE (XEXP (x, 0)) == PLUS)
++	{
++	  addend = XEXP (XEXP (x, 0), 1);
++	  x = XEXP (XEXP (x, 0), 0);
++	}
++
++      if (GET_CODE (x) != SYMBOL_REF)
++	return x;
++
++      gcc_assert (SYMBOL_REF_TLS_MODEL (x) != 0);
++
++      x = legitimize_tls_address (x, NULL_RTX);
++
++      if (addend)
++	{
++	  x = gen_rtx_PLUS (SImode, x, addend);
++	  orig_x = x;
++	}
++      else
++	return x;
++    }
++
+   if (!TARGET_ARM)
+     {
+       /* TODO: legitimize_address for Thumb2.  */
+@@ -6581,9 +6606,6 @@ arm_legitimize_address (rtx x, rtx orig_
+       return thumb_legitimize_address (x, orig_x, mode);
+     }
+ 
+-  if (arm_tls_symbol_p (x))
+-    return legitimize_tls_address (x, NULL_RTX);
+-
+   if (GET_CODE (x) == PLUS)
+     {
+       rtx xop0 = XEXP (x, 0);
+@@ -6695,9 +6717,6 @@ arm_legitimize_address (rtx x, rtx orig_
+ rtx
+ thumb_legitimize_address (rtx x, rtx orig_x, enum machine_mode mode)
+ {
+-  if (arm_tls_symbol_p (x))
+-    return legitimize_tls_address (x, NULL_RTX);
+-
+   if (GET_CODE (x) == PLUS
+       && CONST_INT_P (XEXP (x, 1))
+       && (INTVAL (XEXP (x, 1)) >= 32 * GET_MODE_SIZE (mode)
+@@ -6988,20 +7007,6 @@ thumb_legitimize_reload_address (rtx *x_
+ 
+ /* Test for various thread-local symbols.  */
+ 
+-/* Return TRUE if X is a thread-local symbol.  */
+-
+-static bool
+-arm_tls_symbol_p (rtx x)
+-{
+-  if (! TARGET_HAVE_TLS)
+-    return false;
+-
+-  if (GET_CODE (x) != SYMBOL_REF)
+-    return false;
+-
+-  return SYMBOL_REF_TLS_MODEL (x) != 0;
+-}
+-
+ /* Helper for arm_tls_referenced_p.  */
+ 
+ static int
+Index: gcc-4.8.2/gcc/testsuite/ChangeLog
+===================================================================
+--- gcc-4.8.2.orig/gcc/testsuite/ChangeLog
++++ gcc-4.8.2/gcc/testsuite/ChangeLog
+@@ -1,3 +1,8 @@
++2014-03-06  Jakub Jelinek  <jakub@redhat.com>
++
++	PR target/58595
++	* gcc.dg/tls/pr58595.c: New test.
++
+ 2013-10-16  Release Manager
+ 
+ 	* GCC 4.8.2 released.
-- 
1.8.3.1


