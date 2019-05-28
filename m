Return-Path: <Zhixiong.Chi@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5CC347CECB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 07:57:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x4S7v48V031289
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2019 00:57:25 -0700
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Tue, 28 May 2019 00:56:56 -0700
From: Zhixiong Chi <zhixiong.chi@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 May 2019 00:56:56 -0700
Message-ID: <20190528075656.29039-1-zhixiong.chi@windriver.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] gcc: reduce the variables in symtab
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
X-List-Received-Date: Tue, 28 May 2019 07:57:34 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
---
 meta/recipes-devtools/gcc/gcc-8.3.inc         |  1 +
 .../gcc/gcc-8.3/0042-PR-debug-86964.patch     | 94 +++++++++++++++++++
 2 files changed, 95 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch

diff --git a/meta/recipes-devtools/gcc/gcc-8.3.inc b/meta/recipes-devtools/gcc/gcc-8.3.inc
index fe9c7c3602..a6b772aadd 100644
--- a/meta/recipes-devtools/gcc/gcc-8.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-8.3.inc
@@ -72,6 +72,7 @@ SRC_URI = "\
            file://0039-riscv-Disable-multilib-for-OE.patch \
            file://0040-powerpc-powerpc64-Add-support-for-musl-ldso.patch \
            file://0041-Add-a-recursion-limit-to-libiberty-s-demangling-code.patch \
+           file://0042-PR-debug-86964.patch \
 "
 SRC_URI[md5sum] = "65b210b4bfe7e060051f799e0f994896"
 SRC_URI[sha256sum] = "64baadfe6cc0f4947a84cb12d7f0dfaf45bb58b7e92461639596c21e02d97d2c"
diff --git a/meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch b/meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch
new file mode 100644
index 0000000000..d9b5d39b77
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-8.3/0042-PR-debug-86964.patch
@@ -0,0 +1,94 @@
+From beb921e1106b5bcbb0c6e2be84b241327e2ffc51 Mon Sep 17 00:00:00 2001
+From: law <law@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Mon, 25 Mar 2019 21:19:09 +0000
+Subject: [PATCH] 	PR debug/86964 	* dwarf2out.c
+ (premark_used_variables): New function. 	(prune_unused_types_walk): Do
+ not mark not premarked external 	variables. 	(prune_unused_types):
+ Call premark_used_variables.
+
+	* gcc.dg/debug/dwarf2/pr86964.c: New testcase.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@269925 138bc75d-0d04-0410-961f-82ee72b054a4
+
+Upstream-Status: Backport
+Signed-off-by: Zhixiong Chi <zhixiong.chi@windriver.com>
+---
+ gcc/ChangeLog                               |  8 ++++++
+ gcc/dwarf2out.c                             | 32 +++++++++++++++++++++
+ 2 files changed, 40 insertions(+)
+
+diff --git a/gcc/ChangeLog b/gcc/ChangeLog
+index 2075480ca2b..cdce539ac6f 100644
+--- a/gcc/ChangeLog
++++ b/gcc/ChangeLog
+@@ -1,3 +1,11 @@
++2019-03-25  Johan Karlsson <johan.karlsson@enea.com>
++
++	PR debug/86964
++	* dwarf2out.c (premark_used_variables): New function.
++	(prune_unused_types_walk): Do not mark not premarked external
++	variables.
++	(prune_unused_types): Call premark_used_variables.
++
+ 2019-02-22  Release Manager
+ 
+ 	* GCC 8.3.0 released.
+diff --git a/gcc/dwarf2out.c b/gcc/dwarf2out.c
+index ae8bdee9981..b9a624e1ac7 100644
+--- a/gcc/dwarf2out.c
++++ b/gcc/dwarf2out.c
+@@ -22658,6 +22658,21 @@ premark_types_used_by_global_vars (void)
+       ->traverse<void *, premark_types_used_by_global_vars_helper> (NULL);
+ }
+ 
++/* Mark all variables used by the symtab as perennial.  */
++
++static void
++premark_used_variables (void)
++{
++  /* Mark DIEs in the symtab as used.  */
++  varpool_node *var;
++  FOR_EACH_VARIABLE (var)
++    {
++      dw_die_ref die = lookup_decl_die (var->decl);
++      if (die)
++	die->die_perennial_p = 1;
++    }
++}
++
+ /* Generate a DW_TAG_call_site DIE in function DECL under SUBR_DIE
+    for CA_LOC call arg loc node.  */
+ 
+@@ -29264,6 +29279,19 @@ prune_unused_types_walk (dw_die_ref die)
+ 
+       return;
+ 
++    case DW_TAG_variable:
++      if (flag_debug_only_used_symbols)
++	{
++	  if (die->die_perennial_p)
++	    break;
++
++	  /* premark_used_variables marks external variables --- don't mark
++	     them here.  */
++	  if (get_AT (die, DW_AT_external))
++	    return;
++	}
++      /* FALLTHROUGH */
++
+     default:
+       /* Mark everything else.  */
+       break;
+@@ -29390,6 +29418,10 @@ prune_unused_types (void)
+   /* Mark types that are used in global variables.  */
+   premark_types_used_by_global_vars ();
+ 
++  /* Mark variables used in the symtab.  */
++  if (flag_debug_only_used_symbols)
++    premark_used_variables ();
++
+   /* Set the mark on nodes that are actually used.  */
+   prune_unused_types_walk (comp_unit_die ());
+   for (node = limbo_die_list; node; node = node->next)
+-- 
+2.21.0
-- 
2.21.0


