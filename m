Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1SrYla-0005El-G6
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 20:14:30 +0200
Received: by bkcik5 with SMTP id ik5so1429499bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 11:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=kTD+2nq2p7Cyco5H+Qtz+FxiNOyDYIfEB/WJqQt/O6c=;
	b=kaMi9sFF44oZSI+vxPu/9ChpMLp9sFBAuB4Vy8ynIRl9a85b7slDlACd0Kjy0nm6lt
	UtU3ac9V71vxyw36zlM26qe319QRXJUI1hETKFN12loAt7SIfoegKI7ldBe/yymoE/xV
	J9NVeCHVCBaxaWhiHbhxzTzQxSVquNPp+8ECRfA7gWkHZ4lSSNfuJuO4UKlmE1uA9t10
	B4PyAb8GF7f7avWrTUdiAe6MjJ8DGpAK8L319hQ1/mLamzj8KTe55/w3ZMUEbJFtvG+I
	41uU79G0m8oty149N9EZmglTYMPJsv4D4aCM0vk7ckeGx1UIawSUi5HdMQN38apfMtJ5
	EEpA==
Received: by 10.204.155.69 with SMTP id r5mr2288321bkw.49.1342634589665;
	Wed, 18 Jul 2012 11:03:09 -0700 (PDT)
Received: from s42.loc (91-119-234-193.dynamic.xdsl-line.inode.at.
	[91.119.234.193])
	by mx.google.com with ESMTPS id he8sm12417759bkc.3.2012.07.18.11.03.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 18 Jul 2012 11:03:09 -0700 (PDT)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1SrYaY-0002XC-VT; Wed, 18 Jul 2012 20:03:07 +0200
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Jul 2012 20:03:04 +0200
Message-Id: <1342634584-9711-1-git-send-email-rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10
Subject: [PATCH] gcc: remove 904-flatten-switch-stmt-00.patch
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
X-List-Received-Date: Wed, 18 Jul 2012 18:14:30 -0000

Remove brute-force flattening.
Refer to -ftree-switch-conversion emit_case_bit_tests(),
-ftree-if-to-switch-conversion et al in 4.8

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc              |    1 -
 .../gcc/gcc-4.7/904-flatten-switch-stmt-00.patch   |   76 --------------------
 2 files changed, 77 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.7/904-flatten-switch-stmt-00.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index ece32c1..682cfa8 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -52,7 +52,6 @@ SRC_URI = "git://github.com/mirrors/gcc.git;branch=${BRANCH};protocol=git \
            file://306-libstdc++-namespace.patch  \
            file://740-sh-pr24836.patch  \
            file://800-arm-bigendian.patch  \
-           file://904-flatten-switch-stmt-00.patch  \
            file://arm-nolibfloat.patch  \
            file://gcc-poison-system-directories.patch \
            file://gcc-poison-dir-extend.patch \
diff --git a/meta/recipes-devtools/gcc/gcc-4.7/904-flatten-switch-stmt-00.patch b/meta/recipes-devtools/gcc/gcc-4.7/904-flatten-switch-stmt-00.patch
deleted file mode 100644
index e790e06..0000000
--- a/meta/recipes-devtools/gcc/gcc-4.7/904-flatten-switch-stmt-00.patch
+++ /dev/null
@@ -1,76 +0,0 @@
-Upstream-Status: Pending
-
-Hi,
-
-The attached patch makes sure that we create smaller object code for
-simple switch statements. We just make sure to flatten the switch
-statement into an if-else chain, basically.
-
-This fixes a size-regression as compared to gcc-3.4, as can be seen
-below.
-
-2007-04-15  Bernhard Fischer  <..>
-
-	* stmt.c (expand_case): Do not create a complex binary tree when
-	optimizing for size but rather use the simple ordered list.
-	(emit_case_nodes): do not emit jumps to the default_label when
-	optimizing for size.
-
-Not regtested so far.
-Comments?
-
-Attached is the test switch.c mentioned below.
-
-$ for i in 2.95 3.3 3.4 4.0 4.1 4.2.orig-HEAD 4.3.orig-HEAD 4.3-HEAD;do
-gcc-$i  -DCHAIN -Os -o switch-CHAIN-$i.o -c switch.c ;done
-$ for i in 2.95 3.3 3.4 4.0 4.1 4.2.orig-HEAD 4.3.orig-HEAD 4.3-HEAD;do
-gcc-$i  -UCHAIN -Os -o switch-$i.o -c switch.c ;done
-
-$ size switch-*.o
-   text	   data	    bss	    dec	    hex	filename
-    169	      0	      0	    169	     a9	switch-2.95.o
-    115	      0	      0	    115	     73	switch-3.3.o
-    103	      0	      0	    103	     67	switch-3.4.o
-    124	      0	      0	    124	     7c	switch-4.0.o
-    124	      0	      0	    124	     7c	switch-4.1.o
-    124	      0	      0	    124	     7c	switch-4.2.orig-HEAD.o
-     95	      0	      0	     95	     5f	switch-4.3-HEAD.o
-    124	      0	      0	    124	     7c	switch-4.3.orig-HEAD.o
-    166	      0	      0	    166	     a6	switch-CHAIN-2.95.o
-    111	      0	      0	    111	     6f	switch-CHAIN-3.3.o
-     95	      0	      0	     95	     5f	switch-CHAIN-3.4.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.0.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.1.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.2.orig-HEAD.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.3-HEAD.o
-     95	      0	      0	     95	     5f	switch-CHAIN-4.3.orig-HEAD.o
-
-
-Content-Type: text/x-diff; charset=us-ascii
-Content-Disposition: attachment; filename="gcc-4.3.gcc-flatten-switch-stmt.00.diff"
-
-Index: gcc-4_7-branch/gcc/stmt.c
-===================================================================
---- gcc-4_7-branch.orig/gcc/stmt.c	2012-04-10 10:19:49.095337065 -0700
-+++ gcc-4_7-branch/gcc/stmt.c	2012-04-10 10:32:52.219375048 -0700
-@@ -2397,7 +2397,11 @@
- 	     default code is emitted.  */
- 
- 	  use_cost_table = estimate_case_costs (case_list);
--	  balance_case_nodes (&case_list, NULL);
-+	  /* When optimizing for size, we want a straight list to avoid
-+	     jumps as much as possible. This basically creates an if-else
-+	     chain.  */
-+	  if (!optimize_size)
-+	    balance_case_nodes (&case_list, NULL);
- 	  emit_case_nodes (index, case_list, default_label, index_type);
- 	  if (default_label)
- 	    emit_jump (default_label);
-@@ -2965,6 +2969,7 @@
- 	    {
- 	      if (!node_has_low_bound (node, index_type))
- 		{
-+		  if (!optimize_size) /* don't jl to the .default_label. */
- 		  emit_cmp_and_jump_insns (index,
- 					   convert_modes
- 					   (mode, imode,
-- 
1.7.10.4



