Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QjSDI-0001ZJ-A7
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jul 2011 10:33:05 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 20 Jul 2011 01:28:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,233,1309762800"; d="scan'208";a="29753295"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.254])
	by orsmga001.jf.intel.com with ESMTP; 20 Jul 2011 01:28:49 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jul 2011 01:28:12 -0700
Message-Id: <e1c2478824c1660f855e59e7ffac4f5242ee6657.1311150183.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311150183.git.sgw@linux.intel.com>
References: <cover.1311150183.git.sgw@linux.intel.com>
Subject: [PATCH 25/50] gcc_4.5.1: add pr44290.patch
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
X-List-Received-Date: Wed, 20 Jul 2011 08:33:06 -0000

From: Ilya Yanok <yanok@emcraft.com>

Add fix for PR44290 as proposed in
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=44290

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc           |    1 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch |  119 +++++++++++++++++++++
 2 files changed, 120 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index efed414..99f2ad6 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -59,6 +59,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://COLLECT_GCC_OPTIONS.patch \
 	   file://use-defaults.h-and-t-oe-in-B.patch \
 	   file://pr43810.patch \
+	   file://pr44290.patch \
 	  "
 	
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch
new file mode 100644
index 0000000..9cf187a
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/pr44290.patch
@@ -0,0 +1,119 @@
+From cb13264f07c419149b86e19c2187729bda8dd47d Mon Sep 17 00:00:00 2001
+From: jiez <jiez@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Fri, 23 Jul 2010 14:47:46 +0000
+Subject: [PATCH 2/6] PR target/44290 * attribs.c (decl_attributes): Insert "noinline" and "noclone" if "naked". * tree-sra.c (ipa_sra_preliminary_function_checks): Return false if ! tree_versionable_function_p.
+
+	testsuite/
+	PR target/44290
+	* gcc.dg/pr44290-1.c: New test.
+	* gcc.dg/pr44290-2.c: New test.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@162466 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/attribs.c                    |   13 +++++++++++++
+ gcc/testsuite/gcc.dg/pr44290-1.c |   18 ++++++++++++++++++
+ gcc/testsuite/gcc.dg/pr44290-2.c |   24 ++++++++++++++++++++++++
+ gcc/tree-sra.c                   |    7 +++++++
+ 4 files changed, 62 insertions(+), 0 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.dg/pr44290-1.c
+ create mode 100644 gcc/testsuite/gcc.dg/pr44290-2.c
+
+diff --git a/gcc/attribs.c b/gcc/attribs.c
+index 4d91a0d..2e06608 100644
+--- a/gcc/attribs.c
++++ b/gcc/attribs.c
+@@ -278,6 +278,19 @@ decl_attributes (tree *node, tree attributes, int flags)
+ 	TREE_VALUE (cur_attr) = chainon (opts, TREE_VALUE (cur_attr));
+     }
+ 
++  /* A "naked" function attribute implies "noinline" and "noclone" for
++     those targets that support it.  */
++  if (TREE_CODE (*node) == FUNCTION_DECL
++      && lookup_attribute_spec (get_identifier ("naked"))
++      && lookup_attribute ("naked", attributes) != NULL)
++    {
++      if (lookup_attribute ("noinline", attributes) == NULL)
++	attributes = tree_cons (get_identifier ("noinline"), NULL, attributes);
++
++      if (lookup_attribute ("noclone", attributes) == NULL)
++	attributes = tree_cons (get_identifier ("noclone"),  NULL, attributes);
++    }
++
+   targetm.insert_attributes (*node, &attributes);
+ 
+   for (a = attributes; a; a = TREE_CHAIN (a))
+diff --git a/gcc/testsuite/gcc.dg/pr44290-1.c b/gcc/testsuite/gcc.dg/pr44290-1.c
+new file mode 100644
+index 0000000..071a271
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/pr44290-1.c
+@@ -0,0 +1,18 @@
++/* { dg-do compile { target arm*-*-* avr-*-* mcore-*-* rx-*-* spu-*-* } } */
++/* { dg-options "-O2 -fdump-tree-optimized" } */
++
++static void __attribute__((naked))
++foo(void *from, void *to)
++{
++  asm volatile("dummy"::"r"(from), "r"(to));
++}
++
++unsigned int fie[2];
++
++void fum(void *to)
++{
++  foo(fie, to);
++}
++
++/* { dg-final { scan-tree-dump "foo \\\(void \\\* from, void \\\* to\\\)" "optimized" } } */
++/* { dg-final { cleanup-tree-dump "optimized" } } */
+diff --git a/gcc/testsuite/gcc.dg/pr44290-2.c b/gcc/testsuite/gcc.dg/pr44290-2.c
+new file mode 100644
+index 0000000..1951a51
+--- /dev/null
++++ b/gcc/testsuite/gcc.dg/pr44290-2.c
+@@ -0,0 +1,24 @@
++/* { dg-do compile { target arm*-*-* avr-*-* mcore-*-* rx-*-* spu-*-* } } */
++/* { dg-options "-O2 -fdump-tree-optimized" } */
++
++static unsigned long __attribute__((naked))
++foo (unsigned long base)
++{
++  asm volatile ("dummy");
++}
++unsigned long
++bar (void)
++{
++  static int start, set;
++
++  if (!set)
++    {
++      set = 1;
++      start = foo (0);
++    }
++
++  return foo (start);
++}
++
++/* { dg-final { scan-tree-dump "foo \\\(long unsigned int base\\\)" "optimized" } } */
++/* { dg-final { cleanup-tree-dump "optimized" } } */
+diff --git a/gcc/tree-sra.c b/gcc/tree-sra.c
+index 6a5b577..ea37d97 100644
+--- a/gcc/tree-sra.c
++++ b/gcc/tree-sra.c
+@@ -4126,6 +4126,13 @@ modify_function (struct cgraph_node *node, ipa_parm_adjustment_vec adjustments)
+ static bool
+ ipa_sra_preliminary_function_checks (struct cgraph_node *node)
+ {
++  if (!tree_versionable_function_p (current_function_decl))
++    {
++      if (dump_file)
++	fprintf (dump_file, "Function isn't allowed to be versioned.\n");
++      return false;
++    }
++
+   if (!cgraph_node_can_be_local_p (node))
+     {
+       if (dump_file)
+-- 
+1.7.4
+
-- 
1.7.3.4



