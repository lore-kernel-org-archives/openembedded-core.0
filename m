Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-05.prod.phx3.secureserver.net
	(p3plsmtpa08-05.prod.phx3.secureserver.net [173.201.193.106])
	by mail.openembedded.org (Postfix) with ESMTP id DFAC670CE6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Aug 2014 19:06:06 +0000 (UTC)
Received: from llc.pab ([66.41.60.82])
	by p3plsmtpa08-05.prod.phx3.secureserver.net with 
	id ej621o0091mTNtu01j68Jx; Thu, 14 Aug 2014 12:06:08 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Aug 2014 14:05:58 -0500
Message-Id: <1408043159-8108-9-git-send-email-pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <1408043159-8108-1-git-send-email-pab@pabigot.com>
References: <1408043159-8108-1-git-send-email-pab@pabigot.com>
Subject: [PATCH v2 8/9] gcc: backport patch affecting Linux kernel builds
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
X-List-Received-Date: Thu, 14 Aug 2014 19:06:07 -0000

A long-standing bug in gcc turns out to cause problems with unpatched
Linux versions due to improved optimization enabled by gcc 4.9.  The
upstream fix missed the gcc-4.9.1 cut-off.  It's also been applied
upstream to the 4.8 branch so is being added for OE's 4.8 as well.

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-devtools/gcc/gcc-4.8.inc              |  1 +
 .../gcc-4.8/0052-PR-rtl-optimization-61801.patch   | 36 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-4.9.inc              |  1 +
 .../gcc-4.9/0055-PR-rtl-optimization-61801.patch   | 36 ++++++++++++++++++++++
 4 files changed, 74 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.9/0055-PR-rtl-optimization-61801.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.8.inc b/meta/recipes-devtools/gcc/gcc-4.8.inc
index dbe1ba6..18a6692 100644
--- a/meta/recipes-devtools/gcc/gcc-4.8.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.8.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
     file://0048-PR58854_fix_arm_apcs_epilogue.patch \
     file://0049-Enable-SPE-AltiVec-generation-on-powepc-linux-target.patch \
     file://0050-PR-target-58595.patch \
+    file://0052-PR-rtl-optimization-61801.patch \
 "
 SRC_URI[md5sum] = "a3d7d63b9cb6b6ea049469a0c4a43c9d"
 SRC_URI[sha256sum] = "09dc2276c73424bbbfda1dbddc62bbbf900c9f185acf7f3e1d773ce2d7e3cdc8"
diff --git a/meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch b/meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
new file mode 100644
index 0000000..300b204
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.8/0052-PR-rtl-optimization-61801.patch
@@ -0,0 +1,36 @@
+From 8dfe30973ab03f0480f1e249f320e78f210dc230 Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 17 Jul 2014 07:49:44 +0000
+Subject: [PATCH] 2014-07-17  Richard Biener  <rguenther@suse.de>
+
+	PR rtl-optimization/61801
+	* sched-deps.c (sched_analyze_2): For ASM_OPERANDS and
+	ASM_INPUT don't set reg_pending_barrier if it appears in a
+	debug-insn.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_8-branch@212740 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801]
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+
+---
+ gcc/sched-deps.c | 3 ++-
+
+diff --git a/gcc/sched-deps.c b/gcc/sched-deps.c
+index 07857f2..4ac2542 100644
+--- a/gcc/sched-deps.c
++++ b/gcc/sched-deps.c
+@@ -2744,7 +2744,8 @@ sched_analyze_2 (struct deps_desc *deps, rtx x, rtx insn)
+ 	   Consider for instance a volatile asm that changes the fpu rounding
+ 	   mode.  An insn should not be moved across this even if it only uses
+ 	   pseudo-regs because it might give an incorrectly rounded result.  */
+-	if (code != ASM_OPERANDS || MEM_VOLATILE_P (x))
++	if ((code != ASM_OPERANDS || MEM_VOLATILE_P (x))
++	    && !DEBUG_INSN_P (insn))
+ 	  reg_pending_barrier = TRUE_BARRIER;
+ 
+ 	/* For all ASM_OPERANDS, we must traverse the vector of input operands.
+-- 
+1.8.5.5
+
diff --git a/meta/recipes-devtools/gcc/gcc-4.9.inc b/meta/recipes-devtools/gcc/gcc-4.9.inc
index bdea3405e..25778bd 100644
--- a/meta/recipes-devtools/gcc/gcc-4.9.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.9.inc
@@ -69,6 +69,7 @@ SRC_URI = "\
     file://0051-eabispe.patch \
     file://0053-gcc-fix-segfault-from-calling-free-on-non-malloc-d-a.patch \
     file://0054-gcc-Makefile.in-fix-parallel-building-failure.patch \
+    file://0055-PR-rtl-optimization-61801.patch \
 "
 SRC_URI[md5sum] = "fddf71348546af523353bd43d34919c1"
 SRC_URI[sha256sum] = "d334781a124ada6f38e63b545e2a3b8c2183049515a1abab6d513f109f1d717e"
diff --git a/meta/recipes-devtools/gcc/gcc-4.9/0055-PR-rtl-optimization-61801.patch b/meta/recipes-devtools/gcc/gcc-4.9/0055-PR-rtl-optimization-61801.patch
new file mode 100644
index 0000000..b27abde
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.9/0055-PR-rtl-optimization-61801.patch
@@ -0,0 +1,36 @@
+From 556537c4ad0df4cbebb74197bb2bdea75cf5dd35 Mon Sep 17 00:00:00 2001
+From: rguenth <rguenth@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Thu, 17 Jul 2014 07:48:49 +0000
+Subject: [PATCH] 2014-07-17  Richard Biener  <rguenther@suse.de>
+
+	PR rtl-optimization/61801
+	* sched-deps.c (sched_analyze_2): For ASM_OPERANDS and
+	ASM_INPUT don't set reg_pending_barrier if it appears in a
+	debug-insn.
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/branches/gcc-4_9-branch@212739 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport [https://gcc.gnu.org/bugzilla/show_bug.cgi?id=61801]
+Signed-off-by: Peter A. Bigot <pab@pabigot.com>
+
+---
+ gcc/sched-deps.c | 3 ++-
+
+diff --git a/gcc/sched-deps.c b/gcc/sched-deps.c
+index efc4223..df29bd3 100644
+--- a/gcc/sched-deps.c
++++ b/gcc/sched-deps.c
+@@ -2750,7 +2750,8 @@ sched_analyze_2 (struct deps_desc *deps, rtx x, rtx insn)
+ 	   Consider for instance a volatile asm that changes the fpu rounding
+ 	   mode.  An insn should not be moved across this even if it only uses
+ 	   pseudo-regs because it might give an incorrectly rounded result.  */
+-	if (code != ASM_OPERANDS || MEM_VOLATILE_P (x))
++	if ((code != ASM_OPERANDS || MEM_VOLATILE_P (x))
++	    && !DEBUG_INSN_P (insn))
+ 	  reg_pending_barrier = TRUE_BARRIER;
+ 
+ 	/* For all ASM_OPERANDS, we must traverse the vector of input operands.
+-- 
+1.8.5.5
+
-- 
1.8.5.5


