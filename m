Received: from mail-iy0-f175.google.com ([209.85.210.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RSBe3-0003T6-0t
	for openembedded-core@lists.openembedded.org;
	Sun, 20 Nov 2011 18:57:35 +0100
Received: by mail-iy0-f175.google.com with SMTP id k25so6180037iah.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Nov 2011 09:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=kwiDkweEh7I1xVvNMw5BTvDgu/PBTdC/i+4NCBAC7g8=;
	b=ljsrVDHzgK0ILGSzTdivd6thoe4aX0PVfBvu5DTG3A+KWSWqFWtgi2hMcf8Ysp8TNY
	PbjaIbWiJzQrhxHzfCO1CB5TshOreE2M08diqKvd6TGoMx6Y5Bjuh4He2hw4VLu965Ys
	XAhwvmzDT8+4A0EyrmYeefBWYahYuHp0roY/k=
Received: by 10.42.151.4 with SMTP id c4mr8862192icw.39.1321811468436;
	Sun, 20 Nov 2011 09:51:08 -0800 (PST)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id dd36sm34710971ibb.7.2011.11.20.09.51.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 20 Nov 2011 09:51:07 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Nov 2011 09:50:47 -0800
Message-Id: <9da270b2c739a947bbf475ef2ef070057ce7f072.1321811216.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
References: <d06edef859ff936294d76bc07523f50eaaa5baf4.1321811216.git.raj.khem@gmail.com>
In-Reply-To: <cover.1321811216.git.raj.khem@gmail.com>
References: <cover.1321811216.git.raj.khem@gmail.com>
Subject: [PATCH 5/5] gcc-4.6: Fix gcc ICE on qt4-x11-free/armv7-a
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
X-List-Received-Date: Sun, 20 Nov 2011 17:57:35 -0000

Backport fix for PR 47551 fixes the ICE seen on armv7-a/qt4-x11-free
Bump up SRCREV past gcc 4.6.2 release

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.6.inc           |    9 ++--
 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch |   63 +++++++++++++++++++++++
 2 files changed, 68 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch

diff --git a/meta/recipes-devtools/gcc/gcc-4.6.inc b/meta/recipes-devtools/gcc/gcc-4.6.inc
index 469457c..7bf14e3 100644
--- a/meta/recipes-devtools/gcc/gcc-4.6.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.6.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r16"
+PR = "r17"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.6.0
@@ -8,7 +8,7 @@ PR = "r16"
 # on branch then PV should be incremented to 4.6.1+svnr${SRCPV}
 # to reflect that change
 
-PV = "4.6.1+svnr${SRCPV}"
+PV = "4.6.2+svnr${SRCPV}"
 
 # BINV should be incremented after updating to a revision
 # after a minor gcc release (e.g. 4.6.1 or 4.6.2) has been made
@@ -16,9 +16,9 @@ PV = "4.6.1+svnr${SRCPV}"
 # 4.6.1 then the value below will have 2 which will mean 4.6.2
 # which will be next minor release and so on.
 
-BINV = "4.6.2"
+BINV = "4.6.3"
 
-SRCREV = 180099
+SRCREV = 181430
 BRANCH = "gcc-4_6-branch"
 FILESPATH = "${@base_set_filespath([ '${FILE_DIRNAME}/gcc-4.6' ], d)}"
 
@@ -71,6 +71,7 @@ SRC_URI = "svn://gcc.gnu.org/svn/gcc/branches;module=${BRANCH};proto=http \
 	   file://gcc-with-linker-hash-style.patch \
 	   file://pr46934.patch \
 	   file://pr32219.patch \
+	   file://pr47551.patch \
 	  "
 
 SRC_URI_append_sh3  = " file://sh3-installfix-fixheaders.patch "
diff --git a/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch b/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
new file mode 100644
index 0000000..5271ffa
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-4.6/pr47551.patch
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
-- 
1.7.5.4



