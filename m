Return-Path: <marex@denx.de>
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
	by mail.openembedded.org (Postfix) with ESMTP id 6688B731B0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Feb 2016 00:29:37 +0000 (UTC)
Received: from mail.nefkom.net (unknown [192.168.8.184])
	by mail-out.m-online.net (Postfix) with ESMTP id 3q4g694SS8z3hjZx;
	Wed, 17 Feb 2016 01:29:37 +0100 (CET)
X-Auth-Info: dLFSSZVggp0lX7LwS8aJ4gucXVFRldEujfKKPg6xl8U=
Received: from chi.lan (unknown [195.140.253.167])
	by smtp-auth.mnet-online.de (Postfix) with ESMTPA id 3q4g693W3rzvdWS;
	Wed, 17 Feb 2016 01:29:37 +0100 (CET)
From: Marek Vasut <marex@denx.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Feb 2016 01:29:36 +0100
Message-Id: <1455668976-11493-1-git-send-email-marex@denx.de>
X-Mailer: git-send-email 2.1.4
Cc: Marek Vasut <marex@denx.de>
Subject: [PATCH] gcc: Backport nios2 r31 fix
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
X-List-Received-Date: Wed, 17 Feb 2016 00:29:37 -0000

Backport a fix from GCC mainline, which fixes libpcre 8.38 and expat 2.1.0
build on nios2. The example of the fixed error follows:

| ./nios2-poky-linux-libtool --silent --mode=compile nios2-poky-linux-gcc  -mel -mhw-div  -mhw-mul  --sysroot=/mnt/work/Yocto/build-nios2/tmp/sysroots/10m50 -I../expat-2.1.0/lib -I. -O2 -pipe -g -feliminate-unused-debug-types -Wall -Wmissing-prototypes -Wstrict-prototypes -fexceptions  -DHAVE_EXPAT_CONFIG_H -o lib/xmltok.lo -c ../expat-2.1.0/lib/xmltok.c
| {standard input}: Assembler messages:
| {standard input}:4988: Error: r31 cannot be used with jmp; use ret instead
| {standard input}:9703: Error: r31 cannot be used with jmp; use ret instead
| {standard input}:20068: Error: r31 cannot be used with jmp; use ret instead
| {standard input}:24020: Error: r31 cannot be used with jmp; use ret instead
| Makefile:196: recipe for target 'lib/xmltok.lo' failed
| make: *** [lib/xmltok.lo] Error 1
| WARNING: exit code 1 from a shell command.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 meta/recipes-devtools/gcc/gcc-5.3.inc              |   1 +
 .../gcc/gcc-5.3/0051-nios2-use-ret-with-r31.patch  | 103 +++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-5.3/0051-nios2-use-ret-with-r31.patch

diff --git a/meta/recipes-devtools/gcc/gcc-5.3.inc b/meta/recipes-devtools/gcc/gcc-5.3.inc
index 214af10..0bcb7d2 100644
--- a/meta/recipes-devtools/gcc/gcc-5.3.inc
+++ b/meta/recipes-devtools/gcc/gcc-5.3.inc
@@ -80,6 +80,7 @@ SRC_URI = "\
            file://0048-ssp_nonshared.patch \
            file://0049-Disable-the-weak-reference-logic-in-gthr.h-for-os-ge.patch \
            file://0050-powerpc-pass-secure-plt-to-the-linker.patch \
+           file://0051-nios2-use-ret-with-r31.patch \
           "
 
 BACKPORTS = ""
diff --git a/meta/recipes-devtools/gcc/gcc-5.3/0051-nios2-use-ret-with-r31.patch b/meta/recipes-devtools/gcc/gcc-5.3/0051-nios2-use-ret-with-r31.patch
new file mode 100644
index 0000000..f3cb47f
--- /dev/null
+++ b/meta/recipes-devtools/gcc/gcc-5.3/0051-nios2-use-ret-with-r31.patch
@@ -0,0 +1,103 @@
+From 1d67120d95c2c6e0ed4f7357d1cc62887eaba463 Mon Sep 17 00:00:00 2001
+From: sandra <sandra@138bc75d-0d04-0410-961f-82ee72b054a4>
+Date: Tue, 12 May 2015 15:57:22 +0000
+Subject: [PATCH] 2015-05-12  Chung-Lin Tang  <cltang@codesourcery.com>
+ Sandra Loosemore <sandra@codesourcery.com>
+
+	gcc/
+	* config/nios2/nios2.h (enum reg_class): Add IJMP_REGS enum
+	value.
+	(REG_CLASS_NAMES): Add "IJMP_REGS".
+	(REG_CLASS_CONTENTS): Add new entry for IJMP_REGS.
+	* config/nios2/nios2.md (indirect_jump,*tablejump): Adjust to
+	use new "c" register constraint.
+	* config/nios2/constraint.md (c): New register constraint
+	corresponding to IJMP_REGS.
+
+
+
+git-svn-id: svn+ssh://gcc.gnu.org/svn/gcc/trunk@223082 138bc75d-0d04-0410-961f-82ee72b054a4
+Signed-off-by: Marek Vasut <marex@denx.de>
+Upstream-Status: Backport [ git://gcc.gnu.org/git/gcc.git 1d67120d95c2c6e0ed4f7357d1cc62887eaba463 ]
+---
+ gcc/ChangeLog                   | 12 ++++++++++++
+ gcc/config/nios2/constraints.md |  3 +++
+ gcc/config/nios2/nios2.h        | 11 +++++++----
+ gcc/config/nios2/nios2.md       |  4 ++--
+ 4 files changed, 24 insertions(+), 6 deletions(-)
+
+diff --git a/gcc/config/nios2/constraints.md b/gcc/config/nios2/constraints.md
+index f4bd9f7..735f892 100644
+--- a/gcc/config/nios2/constraints.md
++++ b/gcc/config/nios2/constraints.md
+@@ -39,6 +39,9 @@
+ 
+ ;; Register constraints
+ 
++(define_register_constraint "c" "IJMP_REGS"
++  "A register suitable for an indirect jump.")
++
+ (define_register_constraint "j" "SIB_REGS"
+   "A register suitable for an indirect sibcall.")
+ 
+diff --git a/gcc/config/nios2/nios2.h b/gcc/config/nios2/nios2.h
+index 510ab5f..ac33978 100644
+--- a/gcc/config/nios2/nios2.h
++++ b/gcc/config/nios2/nios2.h
+@@ -173,6 +173,7 @@ enum reg_class
+ {
+   NO_REGS,
+   SIB_REGS,
++  IJMP_REGS,
+   GP_REGS,
+   ALL_REGS,
+   LIM_REG_CLASSES
+@@ -183,6 +184,7 @@ enum reg_class
+ #define REG_CLASS_NAMES   \
+   {  "NO_REGS",		  \
+      "SIB_REGS",	  \
++     "IJMP_REGS",	  \
+      "GP_REGS",           \
+      "ALL_REGS" }
+ 
+@@ -190,10 +192,11 @@ enum reg_class
+ 
+ #define REG_CLASS_CONTENTS			\
+   {						\
+-    /* NO_REGS  */ { 0, 0},			\
+-    /* SIB_REGS */ { 0xfe0c, 0},		\
+-    /* GP_REGS  */ {~0, 0},			\
+-    /* ALL_REGS */ {~0,~0}			\
++    /* NO_REGS    */ { 0, 0},			\
++    /* SIB_REGS   */ { 0xfe0c, 0},		\
++    /* IJMP_REGS  */ { 0x7fffffff, 0},		\
++    /* GP_REGS    */ {~0, 0},			\
++    /* ALL_REGS   */ {~0,~0}			\
+   }
+ 
+ 
+diff --git a/gcc/config/nios2/nios2.md b/gcc/config/nios2/nios2.md
+index 7b35d269..36ef101 100644
+--- a/gcc/config/nios2/nios2.md
++++ b/gcc/config/nios2/nios2.md
+@@ -697,7 +697,7 @@
+ ; check or adjust for overflow.
+ 
+ (define_insn "indirect_jump"
+-  [(set (pc) (match_operand:SI 0 "register_operand" "r"))]
++  [(set (pc) (match_operand:SI 0 "register_operand" "c"))]
+   ""
+   "jmp\\t%0"
+   [(set_attr "type" "control")])
+@@ -811,7 +811,7 @@
+ 
+ (define_insn "*tablejump"
+   [(set (pc)
+-        (match_operand:SI 0 "register_operand" "r"))
++        (match_operand:SI 0 "register_operand" "c"))
+    (use (label_ref (match_operand 1 "" "")))]
+   ""
+   "jmp\\t%0"
+-- 
+2.7.0
+
-- 
2.1.4


