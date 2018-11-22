Return-Path: <douglas.royds@taitradio.com>
Received: from smtp0.taitradio.net (unknown [202.37.96.22])
	by mail.openembedded.org (Postfix) with SMTP id C0FC96C591
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2018 20:34:11 +0000 (UTC)
Received: from acheron.taitradio.net (unknown [172.16.169.141])
	by smtp0.taitradio.net (Postfix) with ESMTP id 356FA220239;
	Fri, 23 Nov 2018 09:34:10 +1300 (NZDT)
From: Douglas Royds <douglas.royds@taitradio.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2018 09:34:07 +1300
Message-Id: <20181122203407.7864-1-douglas.royds@taitradio.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH v3] boost-context: Reproducibility: Set .file section for all *_elf_gas.S files
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
X-List-Received-Date: Thu, 22 Nov 2018 20:34:13 -0000

Add a .file directive explicitly for all *_elf_gas.S files to prevent the linker
adding a host build-system path as a FILE symbol to the object file.

This replaces the existing patch that added the .file directive to a small
subset of these files.

Upstream-Status: Submitted [https://github.com/boostorg/context/issues/91]
Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
---
 ..._64_sysv_elf_gas.S-set-.file-section.patch |  48 ----
 ...lity-add-file-directive-to-assembler.patch | 243 ++++++++++++++++++
 meta/recipes-support/boost/boost_1.68.0.bb    |   2 +-
 3 files changed, 244 insertions(+), 49 deletions(-)
 delete mode 100644 meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch
 create mode 100644 meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch

diff --git a/meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch b/meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch
deleted file mode 100644
index c2ac49e58f..0000000000
--- a/meta/recipes-support/boost/boost/0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch
+++ /dev/null
@@ -1,48 +0,0 @@
-From c99f798407e44c86e9f64f5b1adf3b4d0549eef2 Mon Sep 17 00:00:00 2001
-From: Mingli Yu <Mingli.Yu@windriver.com>
-Date: Fri, 15 Jun 2018 16:21:56 +0800
-Subject: [PATCH] make_x86_64_sysv_elf_gas.S: set .file section
-
-Set .file section explicitly for .S files to avoid
-the linker introduces the host path in symbols for
-object files whose source file is .S
-Otherwise, there is a host path in the symbols as below:
-$ readelf --wide --symbols /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/libboost_context.so.1.67.0
-
-42: 0000000000000000 0 FILE LOCAL DEFAULT ABS /my-build/boost/1.67.0-r0/boost_1_67_0/x86_64-poky-linux/boost/bin.v2/libs/context/build/aca09349fdb84d131321425f6c3a38ed/asm/make_x86_64_sysv_elf_gas.o
-
-Upstream-Status: Pending
-
-Signed-off-by: Mingli Yu <Mingli.Yu@windriver.com>
----
- libs/context/src/asm/make_i386_sysv_elf_gas.S   | 1 +
- libs/context/src/asm/make_x86_64_sysv_elf_gas.S | 1 +
- 2 files changed, 2 insertions(+)
-
-diff --git a/libs/context/src/asm/make_i386_sysv_elf_gas.S b/libs/context/src/asm/make_i386_sysv_elf_gas.S
-index de77e88..b76de26 100644
---- a/libs/context/src/asm/make_i386_sysv_elf_gas.S
-+++ b/libs/context/src/asm/make_i386_sysv_elf_gas.S
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "make_i386_sysv_elf_gas.S"
- .text
- .globl make_fcontext
- .align 2
-diff --git a/libs/context/src/asm/make_x86_64_sysv_elf_gas.S b/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
-index 25a0c00..0ef3756 100644
---- a/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
-+++ b/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
-@@ -24,6 +24,7 @@
-  *                                                                                      *
-  ****************************************************************************************/
- 
-+.file "make_x86_64_sysv_elf_gas.S"
- .text
- .globl make_fcontext
- .type make_fcontext,@function
--- 
-2.7.4
-
diff --git a/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch b/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
new file mode 100644
index 0000000000..155653316c
--- /dev/null
+++ b/meta/recipes-support/boost/boost/reproducibility-add-file-directive-to-assembler.patch
@@ -0,0 +1,243 @@
+Author: Douglas Royds <douglas.royds@taitradio.com>
+Date:   Thu Nov 22 09:34:22 2018 +1300
+
+Add a .file directive explicitly for all *_elf_gas.S files to prevent the linker
+adding a host build-system path as a FILE symbol to the object file.
+
+This replaces the existing patch that added the .file directive to a small
+subset of these files.
+
+Upstream-Status: Submitted [https://github.com/boostorg/context/issues/91]
+Signed-off-by: Douglas Royds <douglas.royds@taitradio.com>
+
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_arm64_aapcs_elf_gas.S	2018-11-22 09:04:27.900876941 +1300
+@@ -51,6 +51,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_arm64_aapcs_elf_gas.S"
+ .text
+ .align  2
+ .global jump_fcontext
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_arm_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_arm_aapcs_elf_gas.S	2018-11-22 09:04:28.876898240 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_arm_aapcs_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_i386_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_i386_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_i386_sysv_elf_gas.S	2018-11-22 09:04:29.904920674 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "jump_i386_sysv_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_mips32_o32_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_mips32_o32_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_mips32_o32_elf_gas.S	2018-11-22 09:04:41.021163195 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  * *****************************************************/
+ 
++.file "jump_mips32_o32_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_ppc32_sysv_elf_gas.S	2018-11-22 09:04:42.281190679 +1300
+@@ -73,6 +73,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_ppc32_sysv_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_ppc64_sysv_elf_gas.S	2018-11-22 09:04:43.193210571 +1300
+@@ -66,6 +66,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "jump_ppc64_sysv_elf_gas.S"
+ .globl jump_fcontext
+ #if _CALL_ELF == 2
+ 	.text
+diff -ur boost_1_68_0.original/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/jump_x86_64_sysv_elf_gas.S	2018-11-22 09:04:44.213232818 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "jump_x86_64_sysv_elf_gas.S"
+ .text
+ .globl jump_fcontext
+ .type jump_fcontext,@function
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/make_arm64_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_arm64_aapcs_elf_gas.S	2018-11-22 09:04:45.153253319 +1300
+@@ -51,6 +51,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_arm64_aapcs_elf_gas.S"
+ .text
+ .align  2
+ .global make_fcontext
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/make_arm_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_arm_aapcs_elf_gas.S	2018-11-22 09:04:46.097273908 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_arm_aapcs_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_i386_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_i386_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_i386_sysv_elf_gas.S	2018-11-22 09:04:46.973293012 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "make_i386_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/make_mips32_o32_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_mips32_o32_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_mips32_o32_elf_gas.S	2018-11-22 09:04:47.925313772 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  * *****************************************************/
+ 
++.file "make_mips32_o32_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_ppc32_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_ppc32_sysv_elf_gas.S	2018-11-22 09:04:48.865334271 +1300
+@@ -73,6 +73,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_ppc32_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_ppc64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_ppc64_sysv_elf_gas.S	2018-11-22 09:04:50.049360089 +1300
+@@ -66,6 +66,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "make_ppc64_sysv_elf_gas.S"
+ .globl make_fcontext
+ #if _CALL_ELF == 2
+ 	.text
+diff -ur boost_1_68_0.original/libs/context/src/asm/make_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/make_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/make_x86_64_sysv_elf_gas.S	2018-11-22 09:04:51.117383378 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "make_x86_64_sysv_elf_gas.S"
+ .text
+ .globl make_fcontext
+ .type make_fcontext,@function
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S	2018-11-21 16:31:18.601760893 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_arm64_aapcs_elf_gas.S	2018-11-22 09:04:52.201407013 +1300
+@@ -51,6 +51,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_arm64_aapcs_elf_gas.S"
+ .text
+ .align  2
+ .global ontop_fcontext
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_arm_aapcs_elf_gas.S	2018-11-22 09:04:53.269430300 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_arm_aapcs_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_i386_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_i386_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_i386_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_i386_sysv_elf_gas.S	2018-11-22 09:04:54.389454719 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "ontop_i386_sysv_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_mips32_o32_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_mips32_o32_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_mips32_o32_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_mips32_o32_elf_gas.S	2018-11-22 09:04:55.657482363 +1300
+@@ -38,6 +38,7 @@
+  *                                                     *
+  * *****************************************************/
+ 
++.file "ontop_mips32_o32_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_ppc32_sysv_elf_gas.S	2018-11-22 09:04:56.777506781 +1300
+@@ -73,6 +73,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_ppc32_sysv_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .align 2
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_ppc64_sysv_elf_gas.S	2018-11-22 09:04:58.485544015 +1300
+@@ -66,6 +66,7 @@
+  *                                                     *
+  *******************************************************/
+ 
++.file "ontop_ppc64_sysv_elf_gas.S"
+ .globl ontop_fcontext
+ #if _CALL_ELF == 2
+ 	.text
+diff -ur boost_1_68_0.original/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S boost_1_68_0/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S
+--- boost_1_68_0.original/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S	2018-11-21 16:31:18.605760935 +1300
++++ boost_1_68_0/libs/context/src/asm/ontop_x86_64_sysv_elf_gas.S	2018-11-22 09:04:59.609568516 +1300
+@@ -24,6 +24,7 @@
+  *                                                                                      *
+  ****************************************************************************************/
+ 
++.file "ontop_x86_64_sysv_elf_gas.S"
+ .text
+ .globl ontop_fcontext
+ .type ontop_fcontext,@function
diff --git a/meta/recipes-support/boost/boost_1.68.0.bb b/meta/recipes-support/boost/boost_1.68.0.bb
index c7958a4c5e..82e36fd732 100644
--- a/meta/recipes-support/boost/boost_1.68.0.bb
+++ b/meta/recipes-support/boost/boost_1.68.0.bb
@@ -7,5 +7,5 @@ SRC_URI += "\
            file://boost-math-disable-pch-for-gcc.patch \
            file://0001-Apply-boost-1.62.0-no-forced-flags.patch.patch \
            file://0003-Don-t-set-up-arch-instruction-set-flags-we-do-that-o.patch \
-           file://0001-make_x86_64_sysv_elf_gas.S-set-.file-section.patch \
+           file://reproducibility-add-file-directive-to-assembler.patch \
            "
-- 
2.17.1


