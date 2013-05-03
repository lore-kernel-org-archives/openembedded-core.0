Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1UYOUv-0002w4-OX
	for openembedded-core@lists.openembedded.org;
	Sat, 04 May 2013 00:30:39 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 May 2013 15:10:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,607,1363158000"; d="scan'208";a="331254432"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.170])
	by orsmga002.jf.intel.com with ESMTP; 03 May 2013 15:12:41 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 May 2013 15:12:40 -0700
Message-Id: <1367619160-17703-1-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.0.2
Subject: [PATCH] binutils: backport whitespace fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 May 2013 22:30:53 -0000

This is a backport of a whitespace skipping issue: PR14987 and PR14887

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-devtools/binutils/binutils-2.23.2.inc |    1 +
 .../binutils-fix-skip-whitespace-pr14887.patch     |   50 ++++++++++++++++++++
 2 files changed, 51 insertions(+)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch

diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2.inc b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
index 0b01279..ddbe522 100644
--- a/meta/recipes-devtools/binutils/binutils-2.23.2.inc
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2.inc
@@ -37,6 +37,7 @@ BACKPORT = "\
      file://backport/binutils-fix-ineffectual-zero-of-cache.patch \
      file://backport/binutils-replace-strncat-with-strcat.patch  \
      file://backport/0001-config-tc-ppc.c-md_assemble-Do-not-generate-APUinfo-.patch  \
+     file://backport/binutils-fix-skip-whitespace-pr14887.patch \
 "
 SRC_URI[md5sum] = "4f8fa651e35ef262edc01d60fb45702e"
 SRC_URI[sha256sum] = "fe914e56fed7a9ec2eb45274b1f2e14b0d8b4f41906a5194eac6883cfe5c1097"
diff --git a/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
new file mode 100644
index 0000000..e504b3b
--- /dev/null
+++ b/meta/recipes-devtools/binutils/binutils-2.23.2/backport/binutils-fix-skip-whitespace-pr14887.patch
@@ -0,0 +1,50 @@
+
+
+PR gas/14887
+ * config/tc-arm.c (skip_past_char): Skip whitespace before the anticipated character.
+ * config/tc-arm.c (parse_address_main): Delete skip of whitespace here as it is no longer needed.
+
+Upstream-Status: Backport [PR14887]
+
+Signed-off-by: Saul Wold <sgw@linux.intel.com>
+
+===================================================================
+RCS file: /cvs/src/src/gas/ChangeLog,v
+retrieving revision 1.4898
+retrieving revision 1.4899
+Index: binutils-2.23.2/gas/config/tc-arm.c
+===================================================================
+--- binutils-2.23.2.orig/gas/config/tc-arm.c
++++ binutils-2.23.2/gas/config/tc-arm.c
+@@ -885,6 +885,9 @@ const char FLT_CHARS[] = "rRsSfFdDxXeEpP
+ static inline int
+ skip_past_char (char ** str, char c)
+ {
++  /* PR gas/14987: Allow for whitespace before the expected character.  */
++  skip_whitespace (*str);
++
+   if (**str == c)
+     {
+       (*str)++;
+@@ -5168,6 +5171,9 @@ parse_address_main (char **str, int i, i
+       return PARSE_OPERAND_SUCCESS;
+     }
+ 
++  /* PR gas/14987: Allow for whitespace before the expected character.  */
++  skip_whitespace (p);
++
+   if ((reg = arm_reg_parse (&p, REG_TYPE_RN)) == FAIL)
+     {
+       inst.error = _(reg_expected_msgs[REG_TYPE_RN]);
+Index: binutils-2.23.2/gas/testsuite/gas/arm/neon-ldst-es.s
+===================================================================
+--- binutils-2.23.2.orig/gas/testsuite/gas/arm/neon-ldst-es.s
++++ binutils-2.23.2/gas/testsuite/gas/arm/neon-ldst-es.s
+@@ -57,3 +57,7 @@
+ 	vld2.32 {q1},[r7]
+ 	vld4.32 {q1-q2},[r7]
+ 	vld4.32 {q14-q15},[r7]
++
++	@ PR 14987 and 14887: Allow for whitespace in the instruction.
++	vld1.32 { d1 [ ] } , [ r2 ] , r3
++
-- 
1.7.10.4



