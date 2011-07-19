Received: from mail-out.m-online.net ([212.18.0.10])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <yanok@emcraft.com>) id 1Qiykt-0003QZ-HO
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 03:05:49 +0200
Received: from frontend1.mail.m-online.net (frontend1.mail.intern.m-online.net
	[192.168.8.180])
	by mail-out.m-online.net (Postfix) with ESMTP id BD8EE186DEF8;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
X-Auth-Info: QwU0fjf/rkYacHihTLM0kEyjs2aTpbkvJUWW4MeFoGE=
Received: from mail.denx.de (host-82-135-33-74.customer.m-online.net
	[82.135.33.74])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id A937B1C000B3;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: from pollux.denx.de (pollux [192.168.1.1])
	by mail.denx.de (Postfix) with ESMTP id 84B2F340064;
	Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
Received: by pollux.denx.de (Postfix, from userid 547)
	id 5643E4BFD; Tue, 19 Jul 2011 03:01:39 +0200 (CEST)
From: Ilya Yanok <yanok@emcraft.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 19 Jul 2011 03:00:56 +0200
Message-Id: <1311037258-11777-6-git-send-email-yanok@emcraft.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
References: <1311037258-11777-1-git-send-email-yanok@emcraft.com>
Cc: Ilya Yanok <yanok@emcraft.com>
Subject: [PATCH 5/7] gcc_4.5.1: add pr45094.patch
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
X-List-Received-Date: Tue, 19 Jul 2011 01:05:52 -0000

Add fix for PR45094 as proposed in
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=45094

Signed-off-by: Ilya Yanok <yanok@emcraft.com>
---
 meta/recipes-devtools/gcc/gcc-4.5.1.inc           |    1 +
 meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch |   75 +++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1.inc b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
index e84df82..2473775 100644
--- a/meta/recipes-devtools/gcc/gcc-4.5.1.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1.inc
@@ -61,6 +61,7 @@ SRC_URI = "${GNU_MIRROR}/gcc/gcc-${PV}/gcc-${PV}.tar.bz2 \
 	   file://pr43810.patch \
 	   file://pr44290.patch \
 	   file://pr44606.patch \
+	   file://pr45094.patch \
 	  "
 	
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch;patch=1 "
diff --git a/meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch b/meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch
new file mode 100644
index 0000000..182e005
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.5.1/pr45094.patch
@@ -0,0 +1,75 @@
+From 34bd4baaa0f6583f9ff99544c732350c199ec0e2 Mon Sep 17 00:00:00 2001
+From: qiyao <qiyao@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Wed, 18 Aug 2010 12:33:43 +0000
+Subject: [PATCH 4/6] gcc/ PR target/45094 * config/arm/arm.c (output_move_double): Fix typo generating instructions ('ldr'->'str').
+
+gcc/testsuite/
+
+        PR target/45094
+        * gcc.target/arm/pr45094.c: New test.
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@163338 138bc75d-0d04-0410-961f-82ee72b054a4
+---
+ gcc/config/arm/arm.c                   |    8 ++++----
+ gcc/testsuite/gcc.target/arm/pr45094.c |   27 +++++++++++++++++++++++++++
+ 2 files changed, 31 insertions(+), 4 deletions(-)
+ create mode 100644 gcc/testsuite/gcc.target/arm/pr45094.c
+
+diff --git a/gcc/config/arm/arm.c b/gcc/config/arm/arm.c
+index a06a38b..0382b24 100644
+--- a/gcc/config/arm/arm.c
++++ b/gcc/config/arm/arm.c
+@@ -12182,13 +12182,13 @@ output_move_double (rtx *operands)
+ 	    {
+ 	      if (GET_CODE (XEXP (operands[0], 0)) == PRE_MODIFY)
+ 		{
+-		  output_asm_insn ("ldr%?\t%0, [%1, %2]!", otherops);
+-		  output_asm_insn ("ldr%?\t%H0, [%1, #4]", otherops);
++		  output_asm_insn ("str%?\t%0, [%1, %2]!", otherops);
++		  output_asm_insn ("str%?\t%H0, [%1, #4]", otherops);
+ 		}
+ 	      else
+ 		{
+-		  output_asm_insn ("ldr%?\t%H0, [%1, #4]", otherops);
+-		  output_asm_insn ("ldr%?\t%0, [%1], %2", otherops);
++		  output_asm_insn ("str%?\t%H0, [%1, #4]", otherops);
++		  output_asm_insn ("str%?\t%0, [%1], %2", otherops);
+ 		}
+ 	    }
+ 	  else if (GET_CODE (XEXP (operands[0], 0)) == PRE_MODIFY)
+diff --git a/gcc/testsuite/gcc.target/arm/pr45094.c b/gcc/testsuite/gcc.target/arm/pr45094.c
+new file mode 100644
+index 0000000..05f16d8
+--- /dev/null
++++ b/gcc/testsuite/gcc.target/arm/pr45094.c
+@@ -0,0 +1,27 @@
++/* { dg-do run } */
++/* { dg-require-effective-target arm_neon_hw } */
++/* { dg-options "-O2 -mcpu=cortex-a8" } */
++/* { dg-add-options arm_neon } */
++
++#include <stdlib.h>
++
++long long buffer[32];
++
++void __attribute__((noinline)) f(long long *p, int n)
++{
++  while (--n >= 0)
++    {
++      *p = 1;
++      p += 32;
++    }
++}
++
++int main(void)
++{
++  f(buffer, 1);
++  
++  if (!buffer[0])
++    abort();
++
++  return 0;
++}
+-- 
+1.7.4
+
-- 
1.7.6



