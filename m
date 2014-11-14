Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 520286A9D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Nov 2014 09:29:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id sAE9T9xn017669
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 14 Nov 2014 01:29:09 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Fri, 14 Nov 2014 01:29:09 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Fri, 14 Nov 2014 17:29:03 +0800
Message-ID: <fcaaf17b338dfa5da63f801729787cb062997eb0.1415956955.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1415956955.git.hongxu.jia@windriver.com>
References: <cover.1415956955.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] elfutils: upgrade to 0.160
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
X-List-Received-Date: Fri, 14 Nov 2014 09:29:13 -0000
Content-Type: text/plain

- Upgrade elfutils to 0.160

- Move 0.148 patches from elfutils to elfutils-0.148

- Drop 0.158 patches that got from debain, so far debian
  doesn't provide patches for 0.160 (the latest is 0.159)

- Move fixheadercheck.patch from 0.159 to 0.160

- We choose to use 0.159 patches from debian for the current 0.160
  which located in elfutils-0.160
  1) Rebase the following patches from 0.159 to 0.160
     hppa_backend.diff
     arm_backend.diff
     mips_backend.diff
     m68k_backend.diff
     arm_func_value.patch
     arm_unwind_ret_mask.patch

  2) Rebase redhat-portability.diff according to
     commit 52a6d20519870103134166d91e22d21fd736195d
     Author: Roxana Ciobanu <roxana.ciobanu@intel.com>
     Date:   Tue Jul 1 17:17:00 2014 +0300
       elfutils/elfutils-native: Fix patching generated files

  3) Drop the following patches which have already beem merged to 0.160
     arm_unsupported.patch
     arm_syscall.patch
     unaligned.patch
     aarch64-run-native-test-fix.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../{elfutils => elfutils-0.148}/arm_backend.diff  |    0
 .../elf_additions.diff                             |    0
 .../elfutils-ar-c-fix-num-passed-to-memset.patch   |    0
 .../elfutils-fsize.patch                           |    0
 .../fix-build-gcc-4.8.patch                        |    0
 .../fix_for_gcc-4.7.patch                          |    0
 .../{elfutils => elfutils-0.148}/hppa_backend.diff |    0
 .../{elfutils => elfutils-0.148}/m68k_backend.diff |    0
 .../{elfutils => elfutils-0.148}/mips_backend.diff |    0
 ...ssed-to-snprintf-for-invalid-sh_name-case.patch |    0
 .../redhat-portability.diff                        |    0
 .../redhat-robustify.diff                          |    0
 .../remove-unused.patch                            |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../elfutils/elfutils-0.158/CVE-2014-0172.patch    |   35 -
 .../elfutils/elfutils-0.158/core_filename.patch    |   27 -
 .../elfutils/elfutils-0.158/elf_additions.diff     |   77 -
 ...4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch |   34 -
 .../elfutils/elfutils-0.158/redhat-robustify.diff  | 1756 --------------------
 .../elfutils/elfutils-0.158/unwind_non_linux.patch |  256 ---
 .../arm_backend.diff                               |  382 +++--
 .../elfutils/elfutils-0.160/arm_func_value.patch   |  166 ++
 .../elfutils-0.160/arm_unwind_ret_mask.patch       |   83 +
 .../fixheadercheck.patch                           |    0
 .../hppa_backend.diff                              |    2 +-
 .../m68k_backend.diff                              |    2 +-
 .../mips_backend.diff                              |    2 +-
 .../mips_readelf_w.patch                           |    0
 .../elfutils/elfutils-0.160/non_linux.patch        |   35 +
 .../redhat-portability.diff                        |  408 +++--
 .../scanf-format.patch                             |    0
 .../testsuite-ignore-elflint.diff                  |    0
 .../{elfutils_0.158.bb => elfutils_0.160.bb}       |   28 +-
 33 files changed, 736 insertions(+), 2557 deletions(-)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/arm_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/elf_additions.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/elfutils-ar-c-fix-num-passed-to-memset.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/elfutils-fsize.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/fix-build-gcc-4.8.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/fix_for_gcc-4.7.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/hppa_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/m68k_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/mips_backend.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/redhat-portability.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/redhat-robustify.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/remove-unused.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils => elfutils-0.148}/testsuite-ignore-elflint.diff (100%)
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
 delete mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/arm_backend.diff (82%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/fixheadercheck.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/hppa_backend.diff (99%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/m68k_backend.diff (99%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/mips_backend.diff (99%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/mips_readelf_w.patch (100%)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/redhat-portability.diff (71%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/scanf-format.patch (100%)
 rename meta/recipes-devtools/elfutils/{elfutils-0.158 => elfutils-0.160}/testsuite-ignore-elflint.diff (100%)
 rename meta/recipes-devtools/elfutils/{elfutils_0.158.bb => elfutils_0.160.bb} (87%)

diff --git a/meta/recipes-devtools/elfutils/elfutils/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/arm_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/elf_additions.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/elf_additions.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/elf_additions.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-ar-c-fix-num-passed-to-memset.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/elfutils-ar-c-fix-num-passed-to-memset.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-ar-c-fix-num-passed-to-memset.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/elfutils-fsize.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/elfutils-fsize.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/elfutils-fsize.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/fix-build-gcc-4.8.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/fix-build-gcc-4.8.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/fix-build-gcc-4.8.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/fix_for_gcc-4.7.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/fix_for_gcc-4.7.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/hppa_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/m68k_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/mips_backend.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/redhat-portability.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/redhat-portability.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/redhat-robustify.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/redhat-robustify.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/redhat-robustify.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils/remove-unused.patch b/meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/remove-unused.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.148/remove-unused.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.148/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
deleted file mode 100644
index 6c44314..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/CVE-2014-0172.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 7f1eec317db79627b473c5b149a22a1b20d1f68f Mon Sep 17 00:00:00 2001
-From: Mark Wielaard <mjw@redhat.com>
-Date: Wed, 9 Apr 2014 11:33:23 +0200
-Subject: [PATCH] CVE-2014-0172 Check for overflow before calling malloc to
- uncompress data.
-
-https://bugzilla.redhat.com/show_bug.cgi?id=1085663
-
-Reported-by: Florian Weimer <fweimer@redhat.com>
-Signed-off-by: Mark Wielaard <mjw@redhat.com>
-
-Index: elfutils-0.158/libdw/dwarf_begin_elf.c
-===================================================================
---- elfutils-0.158.orig/libdw/dwarf_begin_elf.c	2014-05-01 17:10:01.928213292 +0000
-+++ elfutils-0.158/libdw/dwarf_begin_elf.c	2014-05-01 17:10:01.924213375 +0000
-@@ -1,5 +1,5 @@
- /* Create descriptor from ELF descriptor for processing file.
--   Copyright (C) 2002-2011 Red Hat, Inc.
-+   Copyright (C) 2002-2011, 2014 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2002.
- 
-@@ -289,6 +289,12 @@
- 	    memcpy (&size, data->d_buf + 4, sizeof size);
- 	    size = be64toh (size);
- 
-+	    /* Check for unsigned overflow so malloc always allocated
-+	       enough memory for both the Elf_Data header and the
-+	       uncompressed section data.  */
-+	    if (unlikely (sizeof (Elf_Data) + size < size))
-+	      break;
-+
- 	    Elf_Data *zdata = malloc (sizeof (Elf_Data) + size);
- 	    if (unlikely (zdata == NULL))
- 	      break;
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
deleted file mode 100644
index e2f0576..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/core_filename.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From: Matthias Klose <doko@ubuntu.com>
-Date: Tue, 7 Jan 2014 10:25:29 +0100
-Subject: [PATCH] tests: backtrace-subr.sh (check_native_core) should check
- core file name.
-
-Needed when /proc/sys/kernel/core_uses_pid is set to 0. Try to rename
-the core file, and if it does still fail, skip the test.
-
-diff --git a/tests/backtrace-subr.sh b/tests/backtrace-subr.sh
-index e7ece91..62b873c 100644
---- a/tests/backtrace-subr.sh
-+++ b/tests/backtrace-subr.sh
-@@ -111,6 +111,11 @@ check_native_core()
- 
-   # Skip the test if we cannot adjust core ulimit.
-   core="core.`ulimit -c unlimited || exit 77; set +ex; testrun ${abs_builddir}/$child --gencore; true`"
-+  # see if /proc/sys/kernel/core_uses_pid is set to 0
-+  if [ -f core ]; then
-+    mv core "$core"
-+  fi
-+  if [ ! -f "$core" ]; then exit 77; fi
- 
-   if [ "x$SAVED_VALGRIND_CMD" != "x" ]; then
-     VALGRIND_CMD="$SAVED_VALGRIND_CMD"
--- 
-1.9.2
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
deleted file mode 100644
index 671c8ee..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
+++ /dev/null
@@ -1,77 +0,0 @@
-Upstream-Status: Backport
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- libelf/elf.h | 27 +++++++++++++++++++++++++--
- 1 file changed, 25 insertions(+), 2 deletions(-)
-
-diff --git a/libelf/elf.h b/libelf/elf.h
---- a/libelf/elf.h
-+++ b/libelf/elf.h
-@@ -142,6 +142,7 @@ typedef struct
- #define ELFOSABI_NETBSD		2	/* NetBSD.  */
- #define ELFOSABI_GNU		3	/* Object uses GNU ELF extensions.  */
- #define ELFOSABI_LINUX		ELFOSABI_GNU /* Compatibility alias.  */
-+#define ELFOSABI_HURD		4	/* GNU/Hurd */
- #define ELFOSABI_SOLARIS	6	/* Sun Solaris.  */
- #define ELFOSABI_AIX		7	/* IBM AIX.  */
- #define ELFOSABI_IRIX		8	/* SGI Irix.  */
-@@ -149,8 +150,13 @@ typedef struct
- #define ELFOSABI_TRU64		10	/* Compaq TRU64 UNIX.  */
- #define ELFOSABI_MODESTO	11	/* Novell Modesto.  */
- #define ELFOSABI_OPENBSD	12	/* OpenBSD.  */
-+#define ELFOSABI_OPENVMS	13	/* OpenVMS */
-+#define ELFOSABI_NSK		14	/* Hewlett-Packard Non-Stop Kernel */
-+#define ELFOSABI_AROS		15	/* Amiga Research OS */
-+/* 64-255 Architecture-specific value range */
- #define ELFOSABI_ARM_AEABI	64	/* ARM EABI */
- #define ELFOSABI_ARM		97	/* ARM */
-+/* This is deprecated? It's not in the latest version anymore. */
- #define ELFOSABI_STANDALONE	255	/* Standalone (embedded) application */
- 
- #define EI_ABIVERSION	8		/* ABI version */
-@@ -205,7 +211,7 @@ typedef struct
- #define EM_H8_300H	47		/* Hitachi H8/300H */
- #define EM_H8S		48		/* Hitachi H8S */
- #define EM_H8_500	49		/* Hitachi H8/500 */
--#define EM_IA_64	50		/* Intel Merced */
-+#define EM_IA_64	50		/* Intel IA64 */
- #define EM_MIPS_X	51		/* Stanford MIPS-X */
- #define EM_COLDFIRE	52		/* Motorola Coldfire */
- #define EM_68HC12	53		/* Motorola M68HC12 */
-@@ -219,7 +225,8 @@ typedef struct
- #define EM_TINYJ	61		/* Advanced Logic Corp. Tinyj emb.fam*/
- #define EM_X86_64	62		/* AMD x86-64 architecture */
- #define EM_PDSP		63		/* Sony DSP Processor */
--
-+#define EM_PDP10	64		/* Digital Equipment Corp. PDP-10 */
-+#define EM_PDP11	65		/* Digital Equipment Corp. PDP-11 */
- #define EM_FX66		66		/* Siemens FX66 microcontroller */
- #define EM_ST9PLUS	67		/* STMicroelectronics ST9+ 8/16 mc */
- #define EM_ST7		68		/* STmicroelectronics ST7 8 bit mc */
-@@ -249,6 +256,22 @@ typedef struct
- #define EM_OPENRISC	92		/* OpenRISC 32-bit embedded processor */
- #define EM_ARC_A5	93		/* ARC Cores Tangent-A5 */
- #define EM_XTENSA	94		/* Tensilica Xtensa Architecture */
-+#define EM_VIDEOCORE 95		/* Alphamosaic VideoCore processor */
-+#define EM_TMM_GPP	96		/* Thompson Multimedia General Purpose Processor */
-+#define EM_NS32K	97		/* National Semiconductor 32000 series */
-+#define EM_TPC		98		/* Tenor Network TPC processor */
-+#define EM_SNP1K	99		/* Trebia SNP 1000 processor */
-+#define EM_ST200	100		/* STMicroelectronics (www.st.com) ST200 microcontroller */
-+#define EM_IP2K 	101		/* Ubicom IP2XXX microcontroller family */
-+#define EM_MAX		102		/* MAX Processor */
-+#define EM_CR		103		/* National Semiconductor CompactRISC */
-+#define EM_F2MC16	104		/* Fujitsu F2MC16 */
-+#define EM_MSP430	105		/* TI msp430 micro controller */
-+#define EM_BLACKFIN	106		/* Analog Devices Blackfin (DSP) processor */
-+#define EM_SE_C33	107		/* S1C33 Family of Seiko Epson processors */
-+#define EM_SEP		108		/* Sharp embedded microprocessor */
-+#define EM_ARCA 	109		/* Arca RISC Microprocessor */
-+
- #define EM_AARCH64	183		/* ARM AARCH64 */
- #define EM_TILEPRO	188		/* Tilera TILEPro */
- #define EM_MICROBLAZE	189		/* Xilinx MicroBlaze */
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
deleted file mode 100644
index 1dbd52d..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
+++ /dev/null
@@ -1,34 +0,0 @@
-m4/biarch.m4: tweak AC_RUN_IFELSE for cross-compiling
-
-Macro: AC_RUN_IFELSE (input,
-                      [action-if-true],
-                      [action-if-false],
-                      [action-if-cross-compiling])
-
-Add the missing [action-if-cross-compiling] part to support
-cross-compiling.
-
-Upstream-Status: inappropriate [oe specific]
-
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- m4/biarch.m4 | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/m4/biarch.m4 b/m4/biarch.m4
---- a/m4/biarch.m4
-+++ b/m4/biarch.m4
-@@ -40,7 +40,9 @@ AC_CACHE_CHECK([whether $biarch_CC makes executables we can run],
- save_CC="$CC"
- CC="$biarch_CC"
- AC_RUN_IFELSE([AC_LANG_PROGRAM([], [])],
--	      utrace_cv_cc_biarch=yes, utrace_cv_cc_biarch=no)
-+	      utrace_cv_cc_biarch=yes,
-+	      utrace_cv_cc_biarch=no,
-+	      utrace_cv_cc_biarch=yes)
- CC="$save_CC"])], [utrace_cv_cc_biarch=no])
- AS_IF([test $utrace_cv_cc_biarch != yes], [dnl
- AC_MSG_WARN([not running biarch tests, $biarch_CC does not work])])])
--- 
-1.8.1.2
-
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
deleted file mode 100644
index f358a85..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-robustify.diff
+++ /dev/null
@@ -1,1756 +0,0 @@
---- elfutils/libdwfl/ChangeLog
-+++ elfutils/libdwfl/ChangeLog
-@@ -680,6 +680,11 @@
- 	* dwfl_module_getdwarf.c (open_elf): Clear errno before CBFAIL.
- 	Reported by Kurt Roeckx <kurt@roeckx.be>.
- 
-+2011-03-23  Petr Machata  <pmachata@redhat.com>
-+
-+	* relocate.c (relocate_section): Use gelf_fsize instead of relying
-+	on shdr->sh_entsize.
-+
- 2011-02-11  Roland McGrath  <roland@redhat.com>
- 
- 	* linux-kernel-modules.c (try_kernel_name): Try .gz, .bz2, .xz
---- elfutils/libdwfl/relocate.c
-+++ elfutils/libdwfl/relocate.c
-@@ -1,5 +1,5 @@
- /* Relocate debug information.
--   Copyright (C) 2005-2010 Red Hat, Inc.
-+   Copyright (C) 2005-2011 Red Hat, Inc.
-    This file is part of elfutils.
- 
-    This file is free software; you can redistribute it and/or modify
-@@ -456,7 +456,10 @@ relocate_section (Dwfl_Module *mod, Elf
-       }
-   }
- 
--  size_t nrels = shdr->sh_size / shdr->sh_entsize;
-+  size_t sh_entsize
-+    = gelf_fsize (relocated, shdr->sh_type == SHT_REL ? ELF_T_REL : ELF_T_RELA,
-+		  1, EV_CURRENT);
-+  size_t nrels = shdr->sh_size / sh_entsize;
-   size_t complete = 0;
-   if (shdr->sh_type == SHT_REL)
-     for (size_t relidx = 0; !result && relidx < nrels; ++relidx)
-@@ -558,7 +561,7 @@ relocate_section (Dwfl_Module *mod, Elf
- 	  nrels = next;
- 	}
- 
--      shdr->sh_size = reldata->d_size = nrels * shdr->sh_entsize;
-+      shdr->sh_size = reldata->d_size = nrels * sh_entsize;
-       gelf_update_shdr (scn, shdr);
-     }
- 
---- elfutils/libelf/ChangeLog
-+++ elfutils/libelf/ChangeLog
-@@ -754,10 +754,53 @@
- 	If section content hasn't been read yet, do it before looking for the
- 	block size.  If no section data present, infer size of section header.
- 
-+2005-05-14  Jakub Jelinek  <jakub@redhat.com>
-+
-+	* libelfP.h (INVALID_NDX): Define.
-+	* gelf_getdyn.c (gelf_getdyn): Use it.  Remove ndx < 0 test if any.
-+	* gelf_getlib.c (gelf_getlib): Likewise.
-+	* gelf_getmove.c (gelf_getmove): Likewise.
-+	* gelf_getrel.c (gelf_getrel): Likewise.
-+	* gelf_getrela.c (gelf_getrela): Likewise.
-+	* gelf_getsym.c (gelf_getsym): Likewise.
-+	* gelf_getsyminfo.c (gelf_getsyminfo): Likewise.
-+	* gelf_getsymshndx.c (gelf_getsymshndx): Likewise.
-+	* gelf_getversym.c (gelf_getversym): Likewise.
-+	* gelf_update_dyn.c (gelf_update_dyn): Likewise.
-+	* gelf_update_lib.c (gelf_update_lib): Likewise.
-+	* gelf_update_move.c (gelf_update_move): Likewise.
-+	* gelf_update_rel.c (gelf_update_rel): Likewise.
-+	* gelf_update_rela.c (gelf_update_rela): Likewise.
-+	* gelf_update_sym.c (gelf_update_sym): Likewise.
-+	* gelf_update_syminfo.c (gelf_update_syminfo): Likewise.
-+	* gelf_update_symshndx.c (gelf_update_symshndx): Likewise.
-+	* gelf_update_versym.c (gelf_update_versym): Likewise.
-+	* elf_newscn.c (elf_newscn): Check for overflow.
-+	* elf32_updatefile.c (__elfw2(LIBELFBITS,updatemmap)): Likewise.
-+	(__elfw2(LIBELFBITS,updatefile)): Likewise.
-+	* elf_begin.c (file_read_elf): Likewise.
-+	* elf32_newphdr.c (elfw2(LIBELFBITS,newphdr)): Likewise.
-+	* elf_getarsym.c (elf_getarsym): Likewise.
-+	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)): Likewise.
- 2005-05-11  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* elf.h: Update again.
- 
-+2005-05-17  Jakub Jelinek  <jakub@redhat.com>
-+
-+	* elf32_getphdr.c (elfw2(LIBELFBITS,getphdr)): Check if program header
-+	table fits into object's bounds.
-+	* elf_getshstrndx.c (elf_getshstrndx): Add elf->start_offset to
-+	elf->map_address.  Check if first section header fits into object's
-+	bounds.
-+	* elf32_getshdr.c (elfw2(LIBELFBITS,getshdr)):
-+	Check if section header table fits into object's bounds.
-+	* elf_begin.c (get_shnum): Ensure section headers fits into
-+	object's bounds.
-+	(file_read_elf): Make sure scncnt is small enough to allocate both
-+	ElfXX_Shdr and Elf_Scn array.  Make sure section and program header
-+	tables fit into object's bounds.  Avoid memory leak on failure.
-+
- 2005-05-09  Ulrich Drepper  <drepper@redhat.com>
- 
- 	* elf.h: Update from glibc.
---- elfutils/libelf/elf32_getphdr.c
-+++ elfutils/libelf/elf32_getphdr.c
-@@ -93,6 +93,16 @@ __elfw2(LIBELFBITS,getphdr_wrlock) (elf)
- 
-       if (elf->map_address != NULL)
- 	{
-+	  /* First see whether the information in the ELF header is
-+	     valid and it does not ask for too much.  */
-+	  if (unlikely (ehdr->e_phoff >= elf->maximum_size)
-+	      || unlikely (elf->maximum_size - ehdr->e_phoff < size))
-+	    {
-+	      /* Something is wrong.  */
-+	      __libelf_seterrno (ELF_E_INVALID_PHDR);
-+	      goto out;
-+	    }
-+
- 	  /* All the data is already mapped.  Use it.  */
- 	  void *file_phdr = ((char *) elf->map_address
- 			     + elf->start_offset + ehdr->e_phoff);
---- elfutils/libelf/elf32_getshdr.c
-+++ elfutils/libelf/elf32_getshdr.c
-@@ -60,7 +60,8 @@ load_shdr_wrlock (Elf_Scn *scn)
-     goto out;
- 
-   size_t shnum;
--  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0)
-+  if (__elf_getshdrnum_rdlock (elf, &shnum) != 0
-+      || shnum > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Shdr)))
-     goto out;
-   size_t size = shnum * sizeof (ElfW2(LIBELFBITS,Shdr));
- 
-@@ -77,6 +78,16 @@ load_shdr_wrlock (Elf_Scn *scn)
- 
-   if (elf->map_address != NULL)
-     {
-+      /* First see whether the information in the ELF header is
-+	 valid and it does not ask for too much.  */
-+      if (unlikely (ehdr->e_shoff >= elf->maximum_size)
-+	  || unlikely (elf->maximum_size - ehdr->e_shoff < size))
-+	{
-+	  /* Something is wrong.  */
-+	  __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
-+	  goto free_and_out;
-+	}
-+
-       ElfW2(LIBELFBITS,Shdr) *notcvt;
- 
-       /* All the data is already mapped.  If we could use it
---- elfutils/libelf/elf32_newphdr.c
-+++ elfutils/libelf/elf32_newphdr.c
-@@ -114,6 +114,12 @@ elfw2(LIBELFBITS,newphdr) (elf, count)
- 	   || count == PN_XNUM
- 	   || elf->state.ELFW(elf,LIBELFBITS).phdr == NULL)
-     {
-+      if (unlikely (count > SIZE_MAX / sizeof (ElfW2(LIBELFBITS,Phdr))))
-+	{
-+	  result = NULL;
-+	  goto out;
-+	}
-+
-       /* Allocate a new program header with the appropriate number of
- 	 elements.  */
-       result = (ElfW2(LIBELFBITS,Phdr) *)
---- elfutils/libelf/elf32_updatefile.c
-+++ elfutils/libelf/elf32_updatefile.c
-@@ -202,6 +202,9 @@ __elfw2(LIBELFBITS,updatemmap) (Elf *elf
-   /* Write all the sections.  Well, only those which are modified.  */
-   if (shnum > 0)
-     {
-+      if (unlikely (shnum > SIZE_MAX / sizeof (Elf_Scn *)))
-+ 	return 1;
-+
-       Elf_ScnList *list = &elf->state.ELFW(elf,LIBELFBITS).scns;
-       Elf_Scn **scns = (Elf_Scn **) alloca (shnum * sizeof (Elf_Scn *));
-       char *const shdr_start = ((char *) elf->map_address + elf->start_offset
-@@ -624,6 +627,10 @@ __elfw2(LIBELFBITS,updatefile) (Elf *elf
-   /* Write all the sections.  Well, only those which are modified.  */
-   if (shnum > 0)
-     {
-+      if (unlikely (shnum > SIZE_MAX / (sizeof (Elf_Scn *)
-+					+ sizeof (ElfW2(LIBELFBITS,Shdr)))))
-+	return 1;
-+
-       off_t shdr_offset = elf->start_offset + ehdr->e_shoff;
- #if EV_NUM != 2
-       xfct_t shdr_fctp = __elf_xfctstom[__libelf_version - 1][EV_CURRENT - 1][ELFW(ELFCLASS, LIBELFBITS) - 1][ELF_T_SHDR];
---- elfutils/libelf/elf_begin.c
-+++ elfutils/libelf/elf_begin.c
-@@ -144,7 +144,8 @@ get_shnum (void *map_address, unsigned c
- 
-       if (unlikely (result == 0) && ehdr.e32->e_shoff != 0)
- 	{
--	  if (ehdr.e32->e_shoff + sizeof (Elf32_Shdr) > maxsize)
-+	  if (unlikely (ehdr.e32->e_shoff >= maxsize)
-+	      || unlikely (maxsize - ehdr.e32->e_shoff < sizeof (Elf32_Shdr)))
- 	    /* Cannot read the first section header.  */
- 	    return 0;
- 
-@@ -192,7 +193,8 @@ get_shnum (void *map_address, unsigned c
- 
-       if (unlikely (result == 0) && ehdr.e64->e_shoff != 0)
- 	{
--	  if (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize)
-+	  if (unlikely (ehdr.e64->e_shoff >= maxsize)
-+	      || unlikely (ehdr.e64->e_shoff + sizeof (Elf64_Shdr) > maxsize))
- 	    /* Cannot read the first section header.  */
- 	    return 0;
- 
-@@ -264,6 +266,15 @@ file_read_elf (int fildes, void *map_add
-     /* Could not determine the number of sections.  */
-     return NULL;
- 
-+  /* Check for too many sections.  */
-+  if (e_ident[EI_CLASS] == ELFCLASS32)
-+    {
-+      if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf32_Shdr)))
-+	return NULL;
-+    }
-+  else if (scncnt > SIZE_MAX / (sizeof (Elf_Scn) + sizeof (Elf64_Shdr)))
-+    return NULL;
-+
-   /* We can now allocate the memory.  Even if there are no section headers,
-      we allocate space for a zeroth section in case we need it later.  */
-   const size_t scnmax = (scncnt ?: (cmd == ELF_C_RDWR || cmd == ELF_C_RDWR_MMAP)
-@@ -303,6 +314,16 @@ file_read_elf (int fildes, void *map_add
- 	{
- 	  /* We can use the mmapped memory.  */
- 	  elf->state.elf32.ehdr = ehdr;
-+
-+	  if (unlikely (ehdr->e_shoff >= maxsize)
-+	      || unlikely (maxsize - ehdr->e_shoff
-+			   < scncnt * sizeof (Elf32_Shdr)))
-+	    {
-+	    free_and_out:
-+	      free (elf);
-+	      __libelf_seterrno (ELF_E_INVALID_FILE);
-+	      return NULL;
-+	    }
- 	  elf->state.elf32.shdr
- 	    = (Elf32_Shdr *) ((char *) ehdr + ehdr->e_shoff);
- 
-@@ -389,6 +410,11 @@ file_read_elf (int fildes, void *map_add
- 	{
- 	  /* We can use the mmapped memory.  */
- 	  elf->state.elf64.ehdr = ehdr;
-+
-+	  if (unlikely (ehdr->e_shoff >= maxsize)
-+	      || unlikely (ehdr->e_shoff
-+			   + scncnt * sizeof (Elf32_Shdr) > maxsize))
-+	    goto free_and_out;
- 	  elf->state.elf64.shdr
- 	    = (Elf64_Shdr *) ((char *) ehdr + ehdr->e_shoff);
- 
---- elfutils/libelf/elf_getarsym.c
-+++ elfutils/libelf/elf_getarsym.c
-@@ -183,6 +183,9 @@ elf_getarsym (elf, ptr)
-       size_t index_size = atol (tmpbuf);
- 
-       if (SARMAG + sizeof (struct ar_hdr) + index_size > elf->maximum_size
-+#if SIZE_MAX <= 4294967295U
-+	  || n >= SIZE_MAX / sizeof (Elf_Arsym)
-+#endif
- 	  || n * w > index_size)
- 	{
- 	  /* This index table cannot be right since it does not fit into
---- elfutils/libelf/elf_getshdrstrndx.c
-+++ elfutils/libelf/elf_getshdrstrndx.c
-@@ -104,10 +104,25 @@ elf_getshdrstrndx (elf, dst)
- 	      if (elf->map_address != NULL
- 		  && elf->state.elf32.ehdr->e_ident[EI_DATA] == MY_ELFDATA
- 		  && (ALLOW_UNALIGNED
--		      || (((size_t) ((char *) elf->map_address + offset))
-+		      || (((size_t) ((char *) elf->map_address
-+			   + elf->start_offset + offset))
- 			  & (__alignof__ (Elf32_Shdr) - 1)) == 0))
--		/* We can directly access the memory.  */
--		num = ((Elf32_Shdr *) (elf->map_address + offset))->sh_link;
-+		{
-+		  /* First see whether the information in the ELF header is
-+		     valid and it does not ask for too much.  */
-+		  if (unlikely (elf->maximum_size - offset
-+				< sizeof (Elf32_Shdr)))
-+		    {
-+		      /* Something is wrong.  */
-+		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
-+		      result = -1;
-+		      goto out;
-+		    }
-+
-+		  /* We can directly access the memory.  */
-+		  num = ((Elf32_Shdr *) (elf->map_address + elf->start_offset
-+					 + offset))->sh_link;
-+		}
- 	      else
- 		{
- 		  /* We avoid reading in all the section headers.  Just read
-@@ -142,10 +157,25 @@ elf_getshdrstrndx (elf, dst)
- 	      if (elf->map_address != NULL
- 		  && elf->state.elf64.ehdr->e_ident[EI_DATA] == MY_ELFDATA
- 		  && (ALLOW_UNALIGNED
--		      || (((size_t) ((char *) elf->map_address + offset))
-+		      || (((size_t) ((char *) elf->map_address
-+			   + elf->start_offset + offset))
- 			  & (__alignof__ (Elf64_Shdr) - 1)) == 0))
--		/* We can directly access the memory.  */
--		num = ((Elf64_Shdr *) (elf->map_address + offset))->sh_link;
-+		{
-+		  /* First see whether the information in the ELF header is
-+		     valid and it does not ask for too much.  */
-+		  if (unlikely (elf->maximum_size - offset
-+				< sizeof (Elf64_Shdr)))
-+		    {
-+		      /* Something is wrong.  */
-+		      __libelf_seterrno (ELF_E_INVALID_SECTION_HEADER);
-+		      result = -1;
-+		      goto out;
-+		    }
-+
-+		  /* We can directly access the memory.  */
-+		  num = ((Elf64_Shdr *) (elf->map_address + elf->start_offset
-+					 + offset))->sh_link;
-+		}
- 	      else
- 		{
- 		  /* We avoid reading in all the section headers.  Just read
---- elfutils/libelf/elf_newscn.c
-+++ elfutils/libelf/elf_newscn.c
-@@ -83,10 +83,18 @@ elf_newscn (elf)
-   else
-     {
-       /* We must allocate a new element.  */
--      Elf_ScnList *newp;
-+      Elf_ScnList *newp = NULL;
- 
-       assert (elf->state.elf.scnincr > 0);
- 
-+      if (
-+#if SIZE_MAX <= 4294967295U
-+	  likely (elf->state.elf.scnincr
-+		  < SIZE_MAX / 2 / sizeof (Elf_Scn) - sizeof (Elf_ScnList))
-+#else
-+	  1
-+#endif
-+	  )
-       newp = (Elf_ScnList *) calloc (sizeof (Elf_ScnList)
- 				     + ((elf->state.elf.scnincr *= 2)
- 					* sizeof (Elf_Scn)), 1);
---- elfutils/libelf/gelf_getdyn.c
-+++ elfutils/libelf/gelf_getdyn.c
-@@ -1,5 +1,5 @@
- /* Get information from dynamic table at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -72,7 +72,7 @@ gelf_getdyn (data, ndx, dst)
- 	 table entries has to be adopted.  The user better has provided
- 	 a buffer where we can store the information.  While copying the
- 	 data we are converting the format.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -93,7 +93,7 @@ gelf_getdyn (data, ndx, dst)
- 
-       /* The data is already in the correct form.  Just make sure the
- 	 index is OK.  */
--      if (unlikely ((ndx + 1) * sizeof (GElf_Dyn) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, GElf_Dyn, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_getlib.c
-+++ elfutils/libelf/gelf_getlib.c
-@@ -1,5 +1,5 @@
- /* Get library from table at the given index.
--   Copyright (C) 2004 Red Hat, Inc.
-+   Copyright (C) 2004-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
- 
-@@ -65,7 +65,7 @@ gelf_getlib (data, ndx, dst)
-   /* The data is already in the correct form.  Just make sure the
-      index is OK.  */
-   GElf_Lib *result = NULL;
--  if (unlikely ((ndx + 1) * sizeof (GElf_Lib) > data->d_size))
-+  if (INVALID_NDX (ndx, GElf_Lib, data))
-     __libelf_seterrno (ELF_E_INVALID_INDEX);
-   else
-     {
---- elfutils/libelf/gelf_getmove.c
-+++ elfutils/libelf/gelf_getmove.c
-@@ -1,5 +1,5 @@
- /* Get move structure at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -62,7 +62,7 @@ gelf_getmove (data, ndx, dst)
- 
-   /* The data is already in the correct form.  Just make sure the
-      index is OK.  */
--  if (unlikely ((ndx + 1) * sizeof (GElf_Move) > data->d_size))
-+  if (INVALID_NDX (ndx, GElf_Move, data))
-     {
-       __libelf_seterrno (ELF_E_INVALID_INDEX);
-       goto out;
---- elfutils/libelf/gelf_getrela.c
-+++ elfutils/libelf/gelf_getrela.c
-@@ -1,5 +1,5 @@
- /* Get RELA relocation information at given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -50,12 +50,6 @@ gelf_getrela (data, ndx, dst)
-   if (data_scn == NULL)
-     return NULL;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return NULL;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
-     {
-       __libelf_seterrno (ELF_E_INVALID_HANDLE);
-@@ -72,7 +66,7 @@ gelf_getrela (data, ndx, dst)
-   if (scn->elf->class == ELFCLASS32)
-     {
-       /* We have to convert the data.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  result = NULL;
-@@ -93,7 +87,7 @@ gelf_getrela (data, ndx, dst)
-     {
-       /* Simply copy the data after we made sure we are actually getting
- 	 correct data.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  result = NULL;
---- elfutils/libelf/gelf_getrel.c
-+++ elfutils/libelf/gelf_getrel.c
-@@ -1,5 +1,5 @@
- /* Get REL relocation information at given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -50,12 +50,6 @@ gelf_getrel (data, ndx, dst)
-   if (data_scn == NULL)
-     return NULL;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return NULL;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_REL))
-     {
-       __libelf_seterrno (ELF_E_INVALID_HANDLE);
-@@ -72,7 +66,7 @@ gelf_getrel (data, ndx, dst)
-   if (scn->elf->class == ELFCLASS32)
-     {
-       /* We have to convert the data.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  result = NULL;
-@@ -92,7 +86,7 @@ gelf_getrel (data, ndx, dst)
-     {
-       /* Simply copy the data after we made sure we are actually getting
- 	 correct data.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  result = NULL;
---- elfutils/libelf/gelf_getsym.c
-+++ elfutils/libelf/gelf_getsym.c
-@@ -1,5 +1,5 @@
- /* Get symbol information from symbol table at the given index.
--   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 1999-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
- 
-@@ -69,7 +69,7 @@ gelf_getsym (data, ndx, dst)
- 	 table entries has to be adopted.  The user better has provided
- 	 a buffer where we can store the information.  While copying the
- 	 data we are converting the format.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data->d_size))
-+      if (INVALID_NDX (ndx, Elf32_Sym, data))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -98,7 +98,7 @@ gelf_getsym (data, ndx, dst)
- 
-       /* The data is already in the correct form.  Just make sure the
- 	 index is OK.  */
--      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > data->d_size))
-+      if (INVALID_NDX (ndx, GElf_Sym, data))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_getsyminfo.c
-+++ elfutils/libelf/gelf_getsyminfo.c
-@@ -1,5 +1,5 @@
- /* Get additional symbol information from symbol table at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -63,7 +63,7 @@ gelf_getsyminfo (data, ndx, dst)
- 
-   /* The data is already in the correct form.  Just make sure the
-      index is OK.  */
--  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data->d_size))
-+  if (INVALID_NDX (ndx, GElf_Syminfo, data))
-     {
-       __libelf_seterrno (ELF_E_INVALID_INDEX);
-       goto out;
---- elfutils/libelf/gelf_getsymshndx.c
-+++ elfutils/libelf/gelf_getsymshndx.c
-@@ -1,6 +1,6 @@
- /* Get symbol information and separate section index from symbol table
-    at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -69,7 +69,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
-      section index table.  */
-   if (likely (shndxdata_scn != NULL))
-     {
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Word) > shndxdata_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Word, &shndxdata_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -89,7 +89,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
- 	 table entries has to be adopted.  The user better has provided
- 	 a buffer where we can store the information.  While copying the
- 	 data we are converting the format.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata->d_size))
-+      if (INVALID_NDX (ndx, Elf32_Sym, symdata))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -118,7 +118,7 @@ gelf_getsymshndx (symdata, shndxdata, nd
- 
-       /* The data is already in the correct form.  Just make sure the
- 	 index is OK.  */
--      if (unlikely ((ndx + 1) * sizeof (GElf_Sym) > symdata->d_size))
-+      if (INVALID_NDX (ndx, GElf_Sym, symdata))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_getversym.c
-+++ elfutils/libelf/gelf_getversym.c
-@@ -1,5 +1,5 @@
- /* Get symbol version information at the given index.
--   Copyright (C) 1999, 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 1999-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 1999.
- 
-@@ -71,7 +71,7 @@ gelf_getversym (data, ndx, dst)
- 
-   /* The data is already in the correct form.  Just make sure the
-      index is OK.  */
--  if (unlikely ((ndx + 1) * sizeof (GElf_Versym) > data->d_size))
-+  if (INVALID_NDX (ndx, GElf_Versym, data))
-     {
-       __libelf_seterrno (ELF_E_INVALID_INDEX);
-       result = NULL;
---- elfutils/libelf/gelf_update_dyn.c
-+++ elfutils/libelf/gelf_update_dyn.c
-@@ -1,5 +1,5 @@
- /* Update information in dynamic table at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -50,12 +50,6 @@ gelf_update_dyn (data, ndx, src)
-   if (data == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_DYN))
-     {
-       /* The type of the data better should match.  */
-@@ -81,7 +75,7 @@ gelf_update_dyn (data, ndx, src)
- 	}
- 
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Dyn) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Dyn, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -95,7 +89,7 @@ gelf_update_dyn (data, ndx, src)
-   else
-     {
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Dyn) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Dyn, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_update_lib.c
-+++ elfutils/libelf/gelf_update_lib.c
-@@ -1,5 +1,5 @@
- /* Update library in table at the given index.
--   Copyright (C) 2004 Red Hat, Inc.
-+   Copyright (C) 2004-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2004.
- 
-@@ -47,12 +47,6 @@ gelf_update_lib (data, ndx, src)
-   if (data == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   Elf_Data_Scn *data_scn = (Elf_Data_Scn *) data;
-   if (unlikely (data_scn->d.d_type != ELF_T_LIB))
-     {
-@@ -66,7 +60,7 @@ gelf_update_lib (data, ndx, src)
- 
-   /* Check whether we have to resize the data buffer.  */
-   int result = 0;
--  if (unlikely ((ndx + 1) * sizeof (Elf64_Lib) > data_scn->d.d_size))
-+  if (INVALID_NDX (ndx, Elf64_Lib, &data_scn->d))
-     __libelf_seterrno (ELF_E_INVALID_INDEX);
-   else
-     {
---- elfutils/libelf/gelf_update_move.c
-+++ elfutils/libelf/gelf_update_move.c
-@@ -1,5 +1,5 @@
- /* Update move structure at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -54,8 +54,7 @@ gelf_update_move (data, ndx, src)
-   assert (sizeof (GElf_Move) == sizeof (Elf64_Move));
- 
-   /* Check whether we have to resize the data buffer.  */
--  if (unlikely (ndx < 0)
--      || unlikely ((ndx + 1) * sizeof (GElf_Move) > data_scn->d.d_size))
-+  if (INVALID_NDX (ndx, GElf_Move, &data_scn->d))
-     {
-       __libelf_seterrno (ELF_E_INVALID_INDEX);
-       return 0;
---- elfutils/libelf/gelf_update_rela.c
-+++ elfutils/libelf/gelf_update_rela.c
-@@ -1,5 +1,5 @@
- /* Update RELA relocation information at given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -47,12 +47,6 @@ gelf_update_rela (Elf_Data *dst, int ndx
-   if (dst == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_RELA))
-     {
-       /* The type of the data better should match.  */
-@@ -80,7 +74,7 @@ gelf_update_rela (Elf_Data *dst, int ndx
- 	}
- 
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Rela) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Rela, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -96,7 +90,7 @@ gelf_update_rela (Elf_Data *dst, int ndx
-   else
-     {
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Rela) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Rela, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_update_rel.c
-+++ elfutils/libelf/gelf_update_rel.c
-@@ -1,5 +1,5 @@
- /* Update REL relocation information at given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -47,12 +47,6 @@ gelf_update_rel (Elf_Data *dst, int ndx,
-   if (dst == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_REL))
-     {
-       /* The type of the data better should match.  */
-@@ -78,7 +72,7 @@ gelf_update_rel (Elf_Data *dst, int ndx,
- 	}
- 
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Rel) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Rel, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -93,7 +87,7 @@ gelf_update_rel (Elf_Data *dst, int ndx,
-   else
-     {
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Rel) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Rel, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_update_sym.c
-+++ elfutils/libelf/gelf_update_sym.c
-@@ -1,5 +1,5 @@
- /* Update symbol information in symbol table at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -51,12 +51,6 @@ gelf_update_sym (data, ndx, src)
-   if (data == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_SYM))
-     {
-       /* The type of the data better should match.  */
-@@ -81,7 +75,7 @@ gelf_update_sym (data, ndx, src)
- 	}
- 
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Sym, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -104,7 +98,7 @@ gelf_update_sym (data, ndx, src)
-   else
-     {
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > data_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Sym, &data_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_update_syminfo.c
-+++ elfutils/libelf/gelf_update_syminfo.c
-@@ -1,5 +1,5 @@
- /* Update additional symbol information in symbol table at the given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -51,12 +51,6 @@ gelf_update_syminfo (data, ndx, src)
-   if (data == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   if (unlikely (data_scn->d.d_type != ELF_T_SYMINFO))
-     {
-       /* The type of the data better should match.  */
-@@ -72,7 +66,7 @@ gelf_update_syminfo (data, ndx, src)
-   rwlock_wrlock (scn->elf->lock);
- 
-   /* Check whether we have to resize the data buffer.  */
--  if (unlikely ((ndx + 1) * sizeof (GElf_Syminfo) > data_scn->d.d_size))
-+  if (INVALID_NDX (ndx, GElf_Syminfo, &data_scn->d))
-     {
-       __libelf_seterrno (ELF_E_INVALID_INDEX);
-       goto out;
---- elfutils/libelf/gelf_update_symshndx.c
-+++ elfutils/libelf/gelf_update_symshndx.c
-@@ -1,6 +1,6 @@
- /* Update symbol information and section index in symbol table at the
-    given index.
--   Copyright (C) 2000, 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2000-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2000.
- 
-@@ -56,12 +56,6 @@ gelf_update_symshndx (symdata, shndxdata
-   if (symdata == NULL)
-     return 0;
- 
--  if (unlikely (ndx < 0))
--    {
--      __libelf_seterrno (ELF_E_INVALID_INDEX);
--      return 0;
--    }
--
-   if (unlikely (symdata_scn->d.d_type != ELF_T_SYM))
-     {
-       /* The type of the data better should match.  */
-@@ -107,7 +101,7 @@ gelf_update_symshndx (symdata, shndxdata
- 	}
- 
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf32_Sym) > symdata_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf32_Sym, &symdata_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
-@@ -130,7 +124,7 @@ gelf_update_symshndx (symdata, shndxdata
-   else
-     {
-       /* Check whether we have to resize the data buffer.  */
--      if (unlikely ((ndx + 1) * sizeof (Elf64_Sym) > symdata_scn->d.d_size))
-+      if (INVALID_NDX (ndx, Elf64_Sym, &symdata_scn->d))
- 	{
- 	  __libelf_seterrno (ELF_E_INVALID_INDEX);
- 	  goto out;
---- elfutils/libelf/gelf_update_versym.c
-+++ elfutils/libelf/gelf_update_versym.c
-@@ -1,5 +1,5 @@
- /* Update symbol version information.
--   Copyright (C) 2001, 2002 Red Hat, Inc.
-+   Copyright (C) 2001-2009 Red Hat, Inc.
-    This file is part of elfutils.
-    Written by Ulrich Drepper <drepper@redhat.com>, 2001.
- 
-@@ -54,8 +54,7 @@ gelf_update_versym (data, ndx, src)
-   assert (sizeof (GElf_Versym) == sizeof (Elf64_Versym));
- 
-   /* Check whether we have to resize the data buffer.  */
--  if (unlikely (ndx < 0)
--      || unlikely ((ndx + 1) * sizeof (GElf_Versym) > data_scn->d.d_size))
-+  if (INVALID_NDX (ndx, GElf_Versym, &data_scn->d))
-     {
-       __libelf_seterrno (ELF_E_INVALID_INDEX);
-       return 0;
---- elfutils/libelf/libelfP.h
-+++ elfutils/libelf/libelfP.h
-@@ -587,4 +587,8 @@ extern uint32_t __libelf_crc32 (uint32_t
- /* Align offset to 4 bytes as needed for note name and descriptor data.  */
- #define NOTE_ALIGN(n)	(((n) + 3) & -4U)
- 
-+/* Convenience macro.  */
-+#define INVALID_NDX(ndx, type, data) \
-+  unlikely ((data)->d_size / sizeof (type) <= (unsigned int) (ndx))
-+
- #endif  /* libelfP.h */
---- elfutils/src/ChangeLog
-+++ elfutils/src/ChangeLog
-@@ -702,6 +702,12 @@
- 
- 	* readelf.c (dwarf_attr_string): Grok DW_AT_GNU_odr_signature.
- 
-+2011-03-23  Petr Machata  <pmachata@redhat.com>
-+
-+	* readelf.c (handle_dynamic, handle_relocs_rel)
-+	(handle_relocs_rela, handle_versym, print_liblist):
-+	Use gelf_fsize instead of relying on shdr->sh_entsize.
-+
- 2011-02-11  Roland McGrath  <roland@redhat.com>
- 
- 	* elfcmp.c (verbose): New variable.
-@@ -2414,6 +2420,16 @@
- 	object symbols or symbols with unknown type.
- 	(check_rel): Likewise.
- 
-+2005-06-09  Roland McGrath  <roland@redhat.com>
-+
-+	* readelf.c (handle_dynamic, handle_symtab): Check for bogus sh_link.
-+	(handle_verneed, handle_verdef, handle_versym, handle_hash): Likewise.
-+	(handle_scngrp): Check for bogus sh_info.
-+
-+	* strip.c (handle_elf): Check for bogus values in sh_link, sh_info,
-+	st_shndx, e_shstrndx, and SHT_GROUP or SHT_SYMTAB_SHNDX data.
-+	Don't use assert on input values, instead bail with "illformed" error.
-+
- 2005-06-08  Roland McGrath  <roland@redhat.com>
- 
- 	* readelf.c (print_ops): Add consts.
-@@ -2459,6 +2475,19 @@
- 
- 	* readelf.c (dwarf_tag_string): Add new tags.
- 
-+2005-05-17  Jakub Jelinek  <jakub@redhat.com>
-+
-+	* elflint.c (check_hash): Don't check entries beyond end of section.
-+	(check_note): Don't crash if gelf_rawchunk fails.
-+	(section_name): Return <invalid> if gelf_getshdr returns NULL.
-+
-+2005-05-14  Jakub Jelinek  <jakub@redhat.com>
-+
-+	* elflint.c (section_name): Return "<invalid>" instead of
-+	crashing on invalid section name.
-+	(check_symtab, is_rel_dyn, check_rela, check_rel, check_dynamic,
-+	check_symtab_shndx, check_hash, check_versym): Robustify.
-+
- 2005-05-08  Roland McGrath  <roland@redhat.com>
- 
- 	* strip.c (handle_elf): Don't translate hash and versym data formats,
---- elfutils/src/elflint.c
-+++ elfutils/src/elflint.c
-@@ -123,6 +123,10 @@ static uint32_t shstrndx;
- /* Array to count references in section groups.  */
- static int *scnref;
- 
-+/* Numbers of sections and program headers.  */
-+static unsigned int shnum;
-+static unsigned int phnum;
-+
- 
- int
- main (int argc, char *argv[])
-@@ -311,10 +315,19 @@ section_name (Ebl *ebl, int idx)
- {
-   GElf_Shdr shdr_mem;
-   GElf_Shdr *shdr;
-+  const char *ret;
-+
-+  if ((unsigned int) idx > shnum)
-+    return "<invalid>";
- 
-   shdr = gelf_getshdr (elf_getscn (ebl->elf, idx), &shdr_mem);
-+  if (shdr == NULL)
-+    return "<invalid>";
- 
--  return elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
-+  ret = elf_strptr (ebl->elf, shstrndx, shdr->sh_name);
-+  if (ret == NULL)
-+    return "<invalid>";
-+  return ret;
- }
- 
- 
-@@ -337,11 +350,6 @@ static const int valid_e_machine[] =
-   (sizeof (valid_e_machine) / sizeof (valid_e_machine[0]))
- 
- 
--/* Numbers of sections and program headers.  */
--static unsigned int shnum;
--static unsigned int phnum;
--
--
- static void
- check_elf_header (Ebl *ebl, GElf_Ehdr *ehdr, size_t size)
- {
-@@ -625,7 +633,8 @@ section [%2d] '%s': symbol table cannot
- 	  }
-       }
- 
--  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT))
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_SYM, 1, EV_CURRENT);
-+  if (shdr->sh_entsize != sh_entsize)
-     ERROR (gettext ("\
- section [%2u] '%s': entry size is does not match ElfXX_Sym\n"),
- 	   idx, section_name (ebl, idx));
-@@ -663,7 +672,7 @@ section [%2d] '%s': XINDEX for zeroth en
- 	       xndxscnidx, section_name (ebl, xndxscnidx));
-     }
- 
--  for (size_t cnt = 1; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
-+  for (size_t cnt = 1; cnt < shdr->sh_size / sh_entsize; ++cnt)
-     {
-       sym = gelf_getsymshndx (data, xndxdata, cnt, &sym_mem, &xndx);
-       if (sym == NULL)
-@@ -683,7 +692,8 @@ section [%2d] '%s': symbol %zu: invalid
-       else
- 	{
- 	  name = elf_strptr (ebl->elf, shdr->sh_link, sym->st_name);
--	  assert (name != NULL);
-+	  assert (name != NULL
-+		  || strshdr->sh_type != SHT_STRTAB);
- 	}
- 
-       if (sym->st_shndx == SHN_XINDEX)
-@@ -1040,9 +1050,11 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
-     {
-       GElf_Shdr rcshdr_mem;
-       const GElf_Shdr *rcshdr = gelf_getshdr (scn, &rcshdr_mem);
--      assert (rcshdr != NULL);
- 
--      if (rcshdr->sh_type == SHT_DYNAMIC)
-+      if (rcshdr == NULL)
-+	break;
-+
-+      if (rcshdr->sh_type == SHT_DYNAMIC && rcshdr->sh_entsize)
- 	{
- 	  /* Found the dynamic section.  Look through it.  */
- 	  Elf_Data *d = elf_getdata (scn, NULL);
-@@ -1052,7 +1064,9 @@ is_rel_dyn (Ebl *ebl, const GElf_Ehdr *e
- 	    {
- 	      GElf_Dyn dyn_mem;
- 	      GElf_Dyn *dyn = gelf_getdyn (d, cnt, &dyn_mem);
--	      assert (dyn != NULL);
-+
-+	      if (dyn == NULL)
-+		break;
- 
- 	      if (dyn->d_tag == DT_RELCOUNT)
- 		{
-@@ -1066,7 +1080,9 @@ section [%2d] '%s': DT_RELCOUNT used for
- 		      /* Does the number specified number of relative
- 			 relocations exceed the total number of
- 			 relocations?  */
--		      if (dyn->d_un.d_val > shdr->sh_size / shdr->sh_entsize)
-+		      if (shdr->sh_entsize != 0
-+			  && dyn->d_un.d_val > (shdr->sh_size
-+						/ shdr->sh_entsize))
- 			ERROR (gettext ("\
- section [%2d] '%s': DT_RELCOUNT value %d too high for this section\n"),
- 			       idx, section_name (ebl, idx),
-@@ -1226,7 +1242,8 @@ section [%2d] '%s': no relocations for m
- 	}
-     }
- 
--  if (shdr->sh_entsize != gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT))
-+  size_t sh_entsize = gelf_fsize (ebl->elf, reltype, 1, EV_CURRENT);
-+  if (shdr->sh_entsize != sh_entsize)
-     ERROR (gettext (reltype == ELF_T_RELA ? "\
- section [%2d] '%s': section entry size does not match ElfXX_Rela\n" : "\
- section [%2d] '%s': section entry size does not match ElfXX_Rel\n"),
-@@ -1449,7 +1466,8 @@ check_rela (Ebl *ebl, GElf_Ehdr *ehdr, G
-   Elf_Data *symdata = elf_getdata (symscn, NULL);
-   enum load_state state = state_undecided;
- 
--  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
-+  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
-     {
-       GElf_Rela rela_mem;
-       GElf_Rela *rela = gelf_getrela (data, cnt, &rela_mem);
-@@ -1499,7 +1517,8 @@ check_rel (Ebl *ebl, GElf_Ehdr *ehdr, GE
-   Elf_Data *symdata = elf_getdata (symscn, NULL);
-   enum load_state state = state_undecided;
- 
--  for (size_t cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
-+  for (size_t cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
-     {
-       GElf_Rel rel_mem;
-       GElf_Rel *rel = gelf_getrel (data, cnt, &rel_mem);
-@@ -1598,7 +1617,8 @@ section [%2d] '%s': referenced as string
- 	   shdr->sh_link, section_name (ebl, shdr->sh_link),
- 	   idx, section_name (ebl, idx));
- 
--  if (shdr->sh_entsize != gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT))
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
-+  if (shdr->sh_entsize != sh_entsize)
-     ERROR (gettext ("\
- section [%2d] '%s': section entry size does not match ElfXX_Dyn\n"),
- 	   idx, section_name (ebl, idx));
-@@ -1608,7 +1628,7 @@ section [%2d] '%s': section entry size d
- 	   idx, section_name (ebl, idx));
- 
-   bool non_null_warned = false;
--  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
-+  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
-     {
-       GElf_Dyn dyn_mem;
-       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dyn_mem);
-@@ -1880,6 +1900,8 @@ section [%2d] '%s': entry size does not
- 	   idx, section_name (ebl, idx));
- 
-   if (symshdr != NULL
-+      && shdr->sh_entsize
-+      && symshdr->sh_entsize
-       && (shdr->sh_size / shdr->sh_entsize
- 	  < symshdr->sh_size / symshdr->sh_entsize))
-     ERROR (gettext ("\
-@@ -1906,6 +1928,12 @@ section [%2d] '%s': extended section ind
-     }
- 
-   Elf_Data *data = elf_getdata (elf_getscn (ebl->elf, idx), NULL);
-+  if (data == NULL)
-+    {
-+      ERROR (gettext ("section [%2d] '%s': cannot get section data\n"),
-+ 	     idx, section_name (ebl, idx));
-+      return;
-+    }
- 
-   if (*((Elf32_Word *) data->d_buf) != 0)
-     ERROR (gettext ("symbol 0 should have zero extended section index\n"));
-@@ -1948,7 +1976,7 @@ section [%2d] '%s': hash table section i
- 
-   size_t maxidx = nchain;
- 
--  if (symshdr != NULL)
-+  if (symshdr != NULL && symshdr->sh_entsize != 0)
-     {
-       size_t symsize = symshdr->sh_size / symshdr->sh_entsize;
- 
-@@ -1959,18 +1987,28 @@ section [%2d] '%s': hash table section i
-       maxidx = symsize;
-     }
- 
-+  Elf32_Word *buf = (Elf32_Word *) data->d_buf;
-+  Elf32_Word *end = (Elf32_Word *) ((char *) data->d_buf + shdr->sh_size);
-   size_t cnt;
-   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
--    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
-+    {
-+      if (buf + cnt >= end)
-+	break;
-+      else if (buf[cnt] >= maxidx)
-       ERROR (gettext ("\
- section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
- 	     idx, section_name (ebl, idx), cnt - 2);
-+    }
- 
-   for (; cnt < 2 + nbucket + nchain; ++cnt)
--    if (((Elf32_Word *) data->d_buf)[cnt] >= maxidx)
-+    {
-+      if (buf + cnt >= end)
-+	break;
-+      else if (buf[cnt] >= maxidx)
-       ERROR (gettext ("\
- section [%2d] '%s': hash chain reference %zu out of bounds\n"),
- 	     idx, section_name (ebl, idx), cnt - 2 - nbucket);
-+    }
- }
- 
- 
-@@ -2000,18 +2038,28 @@ section [%2d] '%s': hash table section i
-       maxidx = symsize;
-     }
- 
-+  Elf64_Xword *buf = (Elf64_Xword *) data->d_buf;
-+  Elf64_Xword *end = (Elf64_Xword *) ((char *) data->d_buf + shdr->sh_size);
-   size_t cnt;
-   for (cnt = 2; cnt < 2 + nbucket; ++cnt)
--    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
-+    {
-+      if (buf + cnt >= end)
-+	break;
-+      else if (buf[cnt] >= maxidx)
-       ERROR (gettext ("\
- section [%2d] '%s': hash bucket reference %zu out of bounds\n"),
- 	     idx, section_name (ebl, idx), cnt - 2);
-+    }
- 
-   for (; cnt < 2 + nbucket + nchain; ++cnt)
--    if (((Elf64_Xword *) data->d_buf)[cnt] >= maxidx)
-+    {
-+      if (buf + cnt >= end)
-+	break;
-+      else if (buf[cnt] >= maxidx)
-       ERROR (gettext ("\
- section [%2d] '%s': hash chain reference %" PRIu64 " out of bounds\n"),
--	     idx, section_name (ebl, idx), (uint64_t) (cnt - 2 - nbucket));
-+	       idx, section_name (ebl, idx), (uint64_t) cnt - 2 - nbucket);
-+    }
- }
- 
- 
-@@ -2036,7 +2084,7 @@ section [%2d] '%s': bitmask size not pow
-   if (shdr->sh_size < (4 + bitmask_words + nbuckets) * sizeof (Elf32_Word))
-     {
-       ERROR (gettext ("\
--section [%2d] '%s': hash table section is too small (is %ld, expected at least%ld)\n"),
-+section [%2d] '%s': hash table section is too small (is %ld, expected at least %ld)\n"),
- 	     idx, section_name (ebl, idx), (long int) shdr->sh_size,
- 	     (long int) ((4 + bitmask_words + nbuckets) * sizeof (Elf32_Word)));
-       return;
-@@ -2708,8 +2756,9 @@ section [%2d] '%s' refers in sh_link to
- 
-   /* The number of elements in the version symbol table must be the
-      same as the number of symbols.  */
--  if (shdr->sh_size / shdr->sh_entsize
--      != symshdr->sh_size / symshdr->sh_entsize)
-+  if (shdr->sh_entsize && symshdr->sh_entsize
-+      && (shdr->sh_size / shdr->sh_entsize
-+	  != symshdr->sh_size / symshdr->sh_entsize))
-     ERROR (gettext ("\
- section [%2d] '%s' has different number of entries than symbol table [%2d] '%s'\n"),
- 	   idx, section_name (ebl, idx),
---- elfutils/src/readelf.c
-+++ elfutils/src/readelf.c
-@@ -1364,6 +1364,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
-   Elf32_Word *grpref = (Elf32_Word *) data->d_buf;
- 
-   GElf_Sym sym_mem;
-+  GElf_Sym *sym = gelf_getsym (symdata, shdr->sh_info, &sym_mem);
-+
-   printf ((grpref[0] & GRP_COMDAT)
- 	  ? ngettext ("\
- \nCOMDAT section group [%2zu] '%s' with signature '%s' contains %zu entry:\n",
-@@ -1376,8 +1378,8 @@ handle_scngrp (Ebl *ebl, Elf_Scn *scn, G
- 		      data->d_size / sizeof (Elf32_Word) - 1),
- 	  elf_ndxscn (scn),
- 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
--	  elf_strptr (ebl->elf, symshdr->sh_link,
--		      gelf_getsym (symdata, shdr->sh_info, &sym_mem)->st_name)
-+	  (sym == NULL ? NULL
-+	   : elf_strptr (ebl->elf, symshdr->sh_link, sym->st_name))
- 	  ?: gettext ("<INVALID SYMBOL>"),
- 	  data->d_size / sizeof (Elf32_Word) - 1);
- 
-@@ -1528,10 +1530,12 @@ static void
- handle_dynamic (Ebl *ebl, Elf_Scn *scn, GElf_Shdr *shdr)
- {
-   int class = gelf_getclass (ebl->elf);
--  GElf_Shdr glink;
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink;
-   Elf_Data *data;
-   size_t cnt;
-   size_t shstrndx;
-+  size_t sh_entsize;
- 
-   /* Get the data of the section.  */
-   data = elf_getdata (scn, NULL);
-@@ -1543,21 +1547,26 @@ handle_dynamic (Ebl *ebl, Elf_Scn *scn,
-     error (EXIT_FAILURE, 0,
- 	   gettext ("cannot get section header string table index"));
- 
-+  sh_entsize = gelf_fsize (ebl->elf, ELF_T_DYN, 1, EV_CURRENT);
-+
-+  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
-+  if (glink == NULL)
-+    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
-+	   elf_ndxscn (scn));
-+
-   printf (ngettext ("\
- \nDynamic segment contains %lu entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
- 		    "\
- \nDynamic segment contains %lu entries:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
--		    shdr->sh_size / shdr->sh_entsize),
--	  (unsigned long int) (shdr->sh_size / shdr->sh_entsize),
-+		    shdr->sh_size / sh_entsize),
-+	  (unsigned long int) (shdr->sh_size / sh_entsize),
- 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
- 	  shdr->sh_offset,
- 	  (int) shdr->sh_link,
--	  elf_strptr (ebl->elf, shstrndx,
--		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
--				    &glink)->sh_name));
-+	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
-   fputs_unlocked (gettext ("  Type              Value\n"), stdout);
- 
--  for (cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
-+  for (cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
-     {
-       GElf_Dyn dynmem;
-       GElf_Dyn *dyn = gelf_getdyn (data, cnt, &dynmem);
-@@ -1706,7 +1715,8 @@ static void
- handle_relocs_rel (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
- {
-   int class = gelf_getclass (ebl->elf);
--  int nentries = shdr->sh_size / shdr->sh_entsize;
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_REL, 1, EV_CURRENT);
-+  int nentries = shdr->sh_size / sh_entsize;
- 
-   /* Get the data of the section.  */
-   Elf_Data *data = elf_getdata (scn, NULL);
-@@ -1892,7 +1902,8 @@ static void
- handle_relocs_rela (Ebl *ebl, GElf_Ehdr *ehdr, Elf_Scn *scn, GElf_Shdr *shdr)
- {
-   int class = gelf_getclass (ebl->elf);
--  int nentries = shdr->sh_size / shdr->sh_entsize;
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_RELA, 1, EV_CURRENT);
-+  int nentries = shdr->sh_size / sh_entsize;
- 
-   /* Get the data of the section.  */
-   Elf_Data *data = elf_getdata (scn, NULL);
-@@ -2139,6 +2150,13 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
-     error (EXIT_FAILURE, 0,
- 	   gettext ("cannot get section header string table index"));
- 
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
-+				   &glink_mem);
-+  if (glink == NULL)
-+    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
-+	   elf_ndxscn (scn));
-+
-   /* Now we can compute the number of entries in the section.  */
-   unsigned int nsyms = data->d_size / (class == ELFCLASS32
- 				       ? sizeof (Elf32_Sym)
-@@ -2149,15 +2167,12 @@ handle_symtab (Ebl *ebl, Elf_Scn *scn, G
- 		    nsyms),
- 	  (unsigned int) elf_ndxscn (scn),
- 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name), nsyms);
--  GElf_Shdr glink;
-   printf (ngettext (" %lu local symbol  String table: [%2u] '%s'\n",
- 		    " %lu local symbols  String table: [%2u] '%s'\n",
- 		    shdr->sh_info),
- 	  (unsigned long int) shdr->sh_info,
- 	  (unsigned int) shdr->sh_link,
--	  elf_strptr (ebl->elf, shstrndx,
--		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
--				    &glink)->sh_name));
-+	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
- 
-   fputs_unlocked (class == ELFCLASS32
- 		  ? gettext ("\
-@@ -2393,7 +2408,13 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
-     error (EXIT_FAILURE, 0,
- 	   gettext ("cannot get section header string table index"));
- 
--  GElf_Shdr glink;
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
-+				   &glink_mem);
-+  if (glink == NULL)
-+    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
-+	   elf_ndxscn (scn));
-+
-   printf (ngettext ("\
- \nVersion needs section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
- 		    "\
-@@ -2404,9 +2425,7 @@ handle_verneed (Ebl *ebl, Elf_Scn *scn,
- 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
- 	  shdr->sh_offset,
- 	  (unsigned int) shdr->sh_link,
--	  elf_strptr (ebl->elf, shstrndx,
--		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
--				    &glink)->sh_name));
-+	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
- 
-   unsigned int offset = 0;
-   for (int cnt = shdr->sh_info; --cnt >= 0; )
-@@ -2459,8 +2478,14 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
-     error (EXIT_FAILURE, 0,
- 	   gettext ("cannot get section header string table index"));
- 
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
-+				   &glink_mem);
-+  if (glink == NULL)
-+    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
-+	   elf_ndxscn (scn));
-+
-   int class = gelf_getclass (ebl->elf);
--  GElf_Shdr glink;
-   printf (ngettext ("\
- \nVersion definition section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
- 		    "\
-@@ -2472,9 +2497,7 @@ handle_verdef (Ebl *ebl, Elf_Scn *scn, G
- 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
- 	  shdr->sh_offset,
- 	  (unsigned int) shdr->sh_link,
--	  elf_strptr (ebl->elf, shstrndx,
--		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
--				    &glink)->sh_name));
-+	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
- 
-   unsigned int offset = 0;
-   for (int cnt = shdr->sh_info; --cnt >= 0; )
-@@ -2736,25 +2759,30 @@ handle_versym (Ebl *ebl, Elf_Scn *scn, G
-       filename = NULL;
-     }
- 
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
-+				   &glink_mem);
-+  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_HALF, 1, EV_CURRENT);
-+  if (glink == NULL)
-+    error (EXIT_FAILURE, 0, gettext ("invalid sh_link value in section %Zu"),
-+	   elf_ndxscn (scn));
-+
-   /* Print the header.  */
--  GElf_Shdr glink;
-   printf (ngettext ("\
- \nVersion symbols section [%2u] '%s' contains %d entry:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
- 		    "\
- \nVersion symbols section [%2u] '%s' contains %d entries:\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'",
--		    shdr->sh_size / shdr->sh_entsize),
-+		    shdr->sh_size / sh_entsize),
- 	  (unsigned int) elf_ndxscn (scn),
- 	  elf_strptr (ebl->elf, shstrndx, shdr->sh_name),
--	  (int) (shdr->sh_size / shdr->sh_entsize),
-+	  (int) (shdr->sh_size / sh_entsize),
- 	  class == ELFCLASS32 ? 10 : 18, shdr->sh_addr,
- 	  shdr->sh_offset,
- 	  (unsigned int) shdr->sh_link,
--	  elf_strptr (ebl->elf, shstrndx,
--		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
--				    &glink)->sh_name));
-+	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
- 
-   /* Now we can finally look at the actual contents of this section.  */
--  for (unsigned int cnt = 0; cnt < shdr->sh_size / shdr->sh_entsize; ++cnt)
-+  for (unsigned int cnt = 0; cnt < shdr->sh_size / sh_entsize; ++cnt)
-     {
-       if (cnt % 2 == 0)
- 	printf ("\n %4d:", cnt);
-@@ -2803,7 +2831,17 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
-   for (Elf32_Word cnt = 0; cnt < nbucket; ++cnt)
-     ++counts[lengths[cnt]];
- 
--  GElf_Shdr glink;
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink = gelf_getshdr (elf_getscn (ebl->elf,
-+					       shdr->sh_link),
-+				   &glink_mem);
-+  if (glink == NULL)
-+    {
-+      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
-+	     elf_ndxscn (scn));
-+      return;
-+    }
-+
-   printf (ngettext ("\
- \nHistogram for bucket list length in section [%2u] '%s' (total of %d bucket):\n Addr: %#0*" PRIx64 "  Offset: %#08" PRIx64 "  Link to section: [%2u] '%s'\n",
- 		    "\
-@@ -2816,9 +2854,7 @@ print_hash_info (Ebl *ebl, Elf_Scn *scn,
- 	  shdr->sh_addr,
- 	  shdr->sh_offset,
- 	  (unsigned int) shdr->sh_link,
--	  elf_strptr (ebl->elf, shstrndx,
--		      gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link),
--				    &glink)->sh_name));
-+	  elf_strptr (ebl->elf, shstrndx, glink->sh_name));
- 
-   if (extrastr != NULL)
-     fputs (extrastr, stdout);
-@@ -3078,7 +3114,8 @@ print_liblist (Ebl *ebl)
- 
-       if (shdr != NULL && shdr->sh_type == SHT_GNU_LIBLIST)
- 	{
--	  int nentries = shdr->sh_size / shdr->sh_entsize;
-+	  size_t sh_entsize = gelf_fsize (ebl->elf, ELF_T_LIB, 1, EV_CURRENT);
-+	  int nentries = shdr->sh_size / sh_entsize;
- 	  printf (ngettext ("\
- \nLibrary list section [%2zu] '%s' at offset %#0" PRIx64 " contains %d entry:\n",
- 			    "\
-@@ -4398,6 +4435,16 @@ print_decoded_aranges_section (Ebl *ebl,
-       return;
-     }
- 
-+  GElf_Shdr glink_mem;
-+  GElf_Shdr *glink;
-+  glink = gelf_getshdr (elf_getscn (ebl->elf, shdr->sh_link), &glink_mem);
-+  if (glink == NULL)
-+    {
-+      error (0, 0, gettext ("invalid sh_link value in section %Zu"),
-+	     elf_ndxscn (scn));
-+      return;
-+    }
-+
-   printf (ngettext ("\
- \nDWARF section [%2zu] '%s' at offset %#" PRIx64 " contains %zu entry:\n",
- 		    "\
---- elfutils/src/strip.c
-+++ elfutils/src/strip.c
-@@ -565,6 +565,11 @@ handle_elf (int fd, Elf *elf, const char
-       goto fail_close;
-     }
- 
-+  if (shstrndx >= shnum)
-+    goto illformed;
-+
-+#define elf_assert(test) do { if (!(test)) goto illformed; } while (0)
-+
-   /* Storage for section information.  We leave room for two more
-      entries since we unconditionally create a section header string
-      table.  Maybe some weird tool created an ELF file without one.
-@@ -586,7 +591,7 @@ handle_elf (int fd, Elf *elf, const char
-     {
-       /* This should always be true (i.e., there should not be any
- 	 holes in the numbering).  */
--      assert (elf_ndxscn (scn) == cnt);
-+      elf_assert (elf_ndxscn (scn) == cnt);
- 
-       shdr_info[cnt].scn = scn;
- 
-@@ -599,6 +604,7 @@ handle_elf (int fd, Elf *elf, const char
- 					shdr_info[cnt].shdr.sh_name);
-       if (shdr_info[cnt].name == NULL)
- 	{
-+	illformed:
- 	  error (0, 0, gettext ("illformed file '%s'"), fname);
- 	  goto fail_close;
- 	}
-@@ -608,6 +614,8 @@ handle_elf (int fd, Elf *elf, const char
- 
-       /* Remember the shdr.sh_link value.  */
-       shdr_info[cnt].old_sh_link = shdr_info[cnt].shdr.sh_link;
-+      if (shdr_info[cnt].old_sh_link >= shnum)
-+	goto illformed;
- 
-       /* Sections in files other than relocatable object files which
- 	 are not loaded can be freely moved by us.  In relocatable
-@@ -620,7 +628,7 @@ handle_elf (int fd, Elf *elf, const char
- 	 appropriate reference.  */
-       if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB_SHNDX))
- 	{
--	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
-+	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx == 0);
- 	  shdr_info[shdr_info[cnt].shdr.sh_link].symtab_idx = cnt;
- 	}
-       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GROUP))
-@@ -637,7 +645,12 @@ handle_elf (int fd, Elf *elf, const char
- 	  for (inner = 1;
- 	       inner < shdr_info[cnt].data->d_size / sizeof (Elf32_Word);
- 	       ++inner)
-+	    {
-+	      if (grpref[inner] < shnum)
- 	    shdr_info[grpref[inner]].group_idx = cnt;
-+	      else
-+		goto illformed;
-+	    }
- 
- 	  if (inner == 1 || (inner == 2 && (grpref[0] & GRP_COMDAT) == 0))
- 	    /* If the section group contains only one element and this
-@@ -648,7 +661,7 @@ handle_elf (int fd, Elf *elf, const char
- 	}
-       else if (unlikely (shdr_info[cnt].shdr.sh_type == SHT_GNU_versym))
- 	{
--	  assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
-+	  elf_assert (shdr_info[shdr_info[cnt].shdr.sh_link].version_idx == 0);
- 	  shdr_info[shdr_info[cnt].shdr.sh_link].version_idx = cnt;
- 	}
- 
-@@ -656,7 +669,7 @@ handle_elf (int fd, Elf *elf, const char
- 	 discarded right away.  */
-       if ((shdr_info[cnt].shdr.sh_flags & SHF_GROUP) != 0)
- 	{
--	  assert (shdr_info[cnt].group_idx != 0);
-+	  elf_assert (shdr_info[cnt].group_idx != 0);
- 
- 	  if (shdr_info[shdr_info[cnt].group_idx].idx == 0)
- 	    {
-@@ -732,10 +745,14 @@ handle_elf (int fd, Elf *elf, const char
- 	    {
- 	      /* If a relocation section is marked as being removed make
- 		 sure the section it is relocating is removed, too.  */
--	      if ((shdr_info[cnt].shdr.sh_type == SHT_REL
-+	      if (shdr_info[cnt].shdr.sh_type == SHT_REL
- 		   || shdr_info[cnt].shdr.sh_type == SHT_RELA)
--		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
--		shdr_info[cnt].idx = 1;
-+		{
-+		  if (shdr_info[cnt].shdr.sh_info >= shnum)
-+		    goto illformed;
-+		  else if (shdr_info[shdr_info[cnt].shdr.sh_info].idx != 0)
-+		    shdr_info[cnt].idx = 1;
-+		}
- 
- 	      /* If a group section is marked as being removed make
- 		 sure all the sections it contains are being removed, too.  */
-@@ -779,7 +796,7 @@ handle_elf (int fd, Elf *elf, const char
- 		  if (shdr_info[cnt].symtab_idx != 0
- 		      && shdr_info[shdr_info[cnt].symtab_idx].data == NULL)
- 		    {
--		      assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
-+		      elf_assert (shdr_info[cnt].shdr.sh_type == SHT_SYMTAB);
- 
- 		      shdr_info[shdr_info[cnt].symtab_idx].data
- 			= elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
-@@ -819,6 +836,9 @@ handle_elf (int fd, Elf *elf, const char
- 		      else if (scnidx == SHN_XINDEX)
- 			scnidx = xndx;
- 
-+		      if (scnidx >= shnum)
-+			goto illformed;
-+
- 		      if (shdr_info[scnidx].idx == 0)
- 			/* This symbol table has a real symbol in
- 			   a discarded section.  So preserve the
-@@ -849,12 +869,16 @@ handle_elf (int fd, Elf *elf, const char
- 		}
- 
- 	      /* Handle references through sh_info.  */
--	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr)
--		  && shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
-+	      if (SH_INFO_LINK_P (&shdr_info[cnt].shdr))
-+		{
-+		  if (shdr_info[cnt].shdr.sh_info >= shnum)
-+		    goto illformed;
-+		  else if ( shdr_info[shdr_info[cnt].shdr.sh_info].idx == 0)
- 		{
- 		  shdr_info[shdr_info[cnt].shdr.sh_info].idx = 1;
- 		  changes |= shdr_info[cnt].shdr.sh_info < cnt;
- 		}
-+		}
- 
- 	      /* Mark the section as investigated.  */
- 	      shdr_info[cnt].idx = 2;
-@@ -995,7 +1019,7 @@ handle_elf (int fd, Elf *elf, const char
- 	  error (EXIT_FAILURE, 0, gettext ("while generating output file: %s"),
- 		 elf_errmsg (-1));
- 
--	assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
-+	elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
- 
- 	/* Add this name to the section header string table.  */
- 	shdr_info[cnt].se = ebl_strtabadd (shst, shdr_info[cnt].name, 0);
-@@ -1032,7 +1056,7 @@ handle_elf (int fd, Elf *elf, const char
- 	error (EXIT_FAILURE, 0,
- 	       gettext ("while create section header section: %s"),
- 	       elf_errmsg (-1));
--      assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
-+      elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == shdr_info[cnt].idx);
- 
-       shdr_info[cnt].data = elf_newdata (shdr_info[cnt].newscn);
-       if (shdr_info[cnt].data == NULL)
-@@ -1089,7 +1113,7 @@ handle_elf (int fd, Elf *elf, const char
-     error (EXIT_FAILURE, 0,
- 	   gettext ("while create section header section: %s"),
- 	   elf_errmsg (-1));
--  assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
-+  elf_assert (elf_ndxscn (shdr_info[cnt].newscn) == idx);
- 
-   /* Finalize the string table and fill in the correct indices in the
-      section headers.  */
-@@ -1179,20 +1203,20 @@ handle_elf (int fd, Elf *elf, const char
- 		    shndxdata = elf_getdata (shdr_info[shdr_info[cnt].symtab_idx].scn,
- 					     NULL);
- 
--		    assert ((versiondata->d_size / sizeof (Elf32_Word))
-+		    elf_assert ((versiondata->d_size / sizeof (Elf32_Word))
- 			    >= shdr_info[cnt].data->d_size / elsize);
- 		  }
- 
- 		if (shdr_info[cnt].version_idx != 0)
- 		  {
--		    assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
-+		    elf_assert (shdr_info[cnt].shdr.sh_type == SHT_DYNSYM);
- 		    /* This section has associated version
- 		       information.  We have to modify that
- 		       information, too.  */
- 		    versiondata = elf_getdata (shdr_info[shdr_info[cnt].version_idx].scn,
- 					       NULL);
- 
--		    assert ((versiondata->d_size / sizeof (GElf_Versym))
-+		    elf_assert ((versiondata->d_size / sizeof (GElf_Versym))
- 			    >= shdr_info[cnt].data->d_size / elsize);
- 		  }
- 
-@@ -1247,7 +1271,7 @@ handle_elf (int fd, Elf *elf, const char
- 		      sec = shdr_info[sym->st_shndx].idx;
- 		    else
- 		      {
--			assert (shndxdata != NULL);
-+			elf_assert (shndxdata != NULL);
- 
- 			sec = shdr_info[xshndx].idx;
- 		      }
-@@ -1268,7 +1292,7 @@ handle_elf (int fd, Elf *elf, const char
- 			    nxshndx = sec;
- 			  }
- 
--			assert (sec < SHN_LORESERVE || shndxdata != NULL);
-+			elf_assert (sec < SHN_LORESERVE || shndxdata != NULL);
- 
- 			if ((inner != destidx || nshndx != sym->st_shndx
- 			     || (shndxdata != NULL && nxshndx != xshndx))
-@@ -1295,9 +1319,11 @@ handle_elf (int fd, Elf *elf, const char
- 		      {
- 			size_t sidx = (sym->st_shndx != SHN_XINDEX
- 					? sym->st_shndx : xshndx);
--			assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION
--				|| (shdr_info[sidx].shdr.sh_type == SHT_GROUP
--				    && shdr_info[sidx].shdr.sh_info == inner));
-+			elf_assert (GELF_ST_TYPE (sym->st_info) == STT_SECTION
-+				    || ((shdr_info[sidx].shdr.sh_type
-+					 == SHT_GROUP)
-+					&& (shdr_info[sidx].shdr.sh_info
-+					    == inner)));
- 		      }
- 		  }
- 
-@@ -1485,11 +1511,11 @@ handle_elf (int fd, Elf *elf, const char
- 		  {
- 		    GElf_Sym sym_mem;
- 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
--		    assert (sym != NULL);
-+		    elf_assert (sym != NULL);
- 
- 		    const char *name = elf_strptr (elf, strshndx,
- 						   sym->st_name);
--		    assert (name != NULL);
-+		    elf_assert (name != NULL);
- 		    size_t hidx = elf_hash (name) % nbucket;
- 
- 		    if (bucket[hidx] == 0)
-@@ -1508,8 +1534,8 @@ handle_elf (int fd, Elf *elf, const char
- 	    else
- 	      {
- 		/* Alpha and S390 64-bit use 64-bit SHT_HASH entries.  */
--		assert (shdr_info[cnt].shdr.sh_entsize
--			== sizeof (Elf64_Xword));
-+		elf_assert (shdr_info[cnt].shdr.sh_entsize
-+                            == sizeof (Elf64_Xword));
- 
- 		Elf64_Xword *bucket = (Elf64_Xword *) hashd->d_buf;
- 
-@@ -1539,11 +1565,11 @@ handle_elf (int fd, Elf *elf, const char
- 		  {
- 		    GElf_Sym sym_mem;
- 		    GElf_Sym *sym = gelf_getsym (symd, inner, &sym_mem);
--		    assert (sym != NULL);
-+		    elf_assert (sym != NULL);
- 
- 		    const char *name = elf_strptr (elf, strshndx,
- 						   sym->st_name);
--		    assert (name != NULL);
-+		    elf_assert (name != NULL);
- 		    size_t hidx = elf_hash (name) % nbucket;
- 
- 		    if (bucket[hidx] == 0)
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
deleted file mode 100644
index 870ec23..0000000
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/unwind_non_linux.patch
+++ /dev/null
@@ -1,256 +0,0 @@
-From 02cefdaa6429e620d6457fdb3ad9934f194c5a93 Mon Sep 17 00:00:00 2001
-From: Kurt Roeckx <kurt@roeckx.be>
-Date: Tue, 22 Apr 2014 21:46:22 +0200
-Subject: [PATCH] Unwinding is only supported on Linux
-
-Index: elfutils-0.158/backends/i386_initreg.c
-===================================================================
---- elfutils-0.158.orig/backends/i386_initreg.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/backends/i386_initreg.c	2014-05-01 17:11:18.866616384 +0000
-@@ -44,7 +44,7 @@
- 			  ebl_tid_registers_t *setfunc __attribute__ ((unused)),
- 				void *arg __attribute__ ((unused)))
- {
--#if !defined __i386__ && !defined __x86_64__
-+#if (!defined __i386__ && !defined __x86_64__) || !defined(__linux__)
-   return false;
- #else /* __i386__ || __x86_64__ */
-   struct user_regs_struct user_regs;
-Index: elfutils-0.158/backends/x86_64_initreg.c
-===================================================================
---- elfutils-0.158.orig/backends/x86_64_initreg.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/backends/x86_64_initreg.c	2014-05-01 17:11:18.866616384 +0000
-@@ -44,7 +44,7 @@
- 			  ebl_tid_registers_t *setfunc __attribute__ ((unused)),
- 				  void *arg __attribute__ ((unused)))
- {
--#ifndef __x86_64__
-+#if !defined(__x86_64__) || !defined(__linux__)
-   return false;
- #else /* __x86_64__ */
-   struct user_regs_struct user_regs;
-Index: elfutils-0.158/libdwfl/linux-pid-attach.c
-===================================================================
---- elfutils-0.158.orig/libdwfl/linux-pid-attach.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/libdwfl/linux-pid-attach.c	2014-05-01 17:12:47.980766442 +0000
-@@ -37,6 +37,8 @@
- # define MAX(a, b) ((a) > (b) ? (a) : (b))
- #endif
- 
-+#ifdef __linux__
-+
- struct pid_arg
- {
-   DIR *dir;
-@@ -358,3 +360,87 @@
-   return 0;
- }
- INTDEF (dwfl_linux_proc_attach)
-+
-+#else	/* __linux__ */
-+
-+static pid_t
-+pid_next_thread (Dwfl *dwfl __attribute__ ((unused)),
-+	         void *dwfl_arg __attribute__ ((unused)),
-+		 void **thread_argp __attribute__ ((unused)))
-+{
-+  errno = ENOSYS;
-+  __libdwfl_seterrno (DWFL_E_ERRNO);
-+  return -1;
-+}
-+
-+static bool
-+pid_getthread (Dwfl *dwfl __attribute__ ((unused)),
-+	       pid_t tid __attribute__ ((unused)),
-+	       void *dwfl_arg __attribute__ ((unused)),
-+	       void **thread_argp __attribute__ ((unused)))
-+{
-+  errno = ENOSYS;
-+  __libdwfl_seterrno (DWFL_E_ERRNO);
-+  return false;
-+}
-+
-+static bool
-+pid_memory_read (Dwfl *dwfl __attribute__ ((unused)),
-+                 Dwarf_Addr addr __attribute__ ((unused)),
-+	         Dwarf_Word *result __attribute__ ((unused)),
-+	         void *arg __attribute__ ((unused)))
-+{
-+  errno = ENOSYS;
-+  __libdwfl_seterrno (DWFL_E_ERRNO);
-+  return false;
-+}
-+
-+static bool
-+pid_set_initial_registers (Dwfl_Thread *thread __attribute__ ((unused)),
-+			   void *thread_arg __attribute__ ((unused)))
-+{
-+  errno = ENOSYS;
-+  __libdwfl_seterrno (DWFL_E_ERRNO);
-+  return false;
-+}
-+
-+static void
-+pid_detach (Dwfl *dwfl __attribute__ ((unused)),
-+	    void *dwfl_arg __attribute__ ((unused)))
-+{
-+}
-+
-+static void
-+pid_thread_detach (Dwfl_Thread *thread __attribute__ ((unused)),
-+		  void *thread_arg __attribute__ ((unused)))
-+{
-+}
-+
-+static const Dwfl_Thread_Callbacks pid_thread_callbacks =
-+{
-+  pid_next_thread,
-+  pid_getthread,
-+  pid_memory_read,
-+  pid_set_initial_registers,
-+  pid_detach,
-+  pid_thread_detach,
-+};
-+
-+int
-+dwfl_linux_proc_attach (Dwfl *dwfl __attribute__ ((unused)),
-+			pid_t pid __attribute__ ((unused)),
-+			bool assume_ptrace_stopped __attribute__ ((unused)))
-+{
-+  return ENOSYS;
-+}
-+INTDEF (dwfl_linux_proc_attach)
-+
-+struct __libdwfl_pid_arg *
-+internal_function
-+__libdwfl_get_pid_arg (Dwfl *dwfl __attribute__ ((unused)))
-+{
-+  return NULL;
-+}
-+
-+#endif /* ! __linux __ */
-+
-Index: elfutils-0.158/tests/backtrace-child.c
-===================================================================
---- elfutils-0.158.orig/tests/backtrace-child.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/tests/backtrace-child.c	2014-05-01 17:11:18.866616384 +0000
-@@ -79,6 +79,18 @@
- #include <stdio.h>
- #include <unistd.h>
- 
-+#ifndef __linux__
-+
-+int
-+main (int argc __attribute__ ((unused)), char **argv)
-+{
-+  fprintf (stderr, "%s: Unwinding not supported for this architecture\n",
-+           argv[0]);
-+  return 77;
-+}
-+
-+#else /* __linux__ */
-+
- #if __GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
- #define NOINLINE_NOCLONE __attribute__ ((noinline, noclone))
- #else
-@@ -221,3 +233,6 @@
-   /* Not reached.  */
-   abort ();
- }
-+
-+#endif /* ! __linux__ */
-+
-Index: elfutils-0.158/tests/backtrace-data.c
-===================================================================
---- elfutils-0.158.orig/tests/backtrace-data.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/tests/backtrace-data.c	2014-05-01 17:11:18.866616384 +0000
-@@ -40,7 +40,7 @@
- #include <string.h>
- #include ELFUTILS_HEADER(dwfl)
- 
--#ifndef __x86_64__
-+#if !defined(__x86_64__) || !defined(__linux__)
- 
- int
- main (int argc __attribute__ ((unused)), char **argv)
-@@ -50,7 +50,7 @@
-   return 77;
- }
- 
--#else /* __x86_64__ */
-+#else /* __x86_64__ && __linux__ */
- 
- /* The only arch specific code is set_initial_registers.  */
- 
-Index: elfutils-0.158/tests/backtrace-dwarf.c
-===================================================================
---- elfutils-0.158.orig/tests/backtrace-dwarf.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/tests/backtrace-dwarf.c	2014-05-01 17:11:18.866616384 +0000
-@@ -25,6 +25,18 @@
- #include <sys/ptrace.h>
- #include ELFUTILS_HEADER(dwfl)
- 
-+#ifndef __linux__
-+
-+int
-+main (int argc __attribute__ ((unused)), char **argv)
-+{
-+  fprintf (stderr, "%s: Unwinding not supported for this architecture\n",
-+           argv[0]);
-+  return 77;
-+}
-+
-+#else /* __linux__ */
-+
- static void cleanup_13_abort (void);
- #define main cleanup_13_main
- #include "cleanup-13.c"
-@@ -148,3 +160,6 @@
-   /* There is an exit (0) call if we find the "main" frame,  */
-   error (1, 0, "dwfl_getthreads: %s", dwfl_errmsg (-1));
- }
-+
-+#endif /* ! __linux__ */
-+
-Index: elfutils-0.158/tests/backtrace-subr.sh
-===================================================================
---- elfutils-0.158.orig/tests/backtrace-subr.sh	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/tests/backtrace-subr.sh	2014-05-01 17:11:18.866616384 +0000
-@@ -84,6 +84,7 @@
-   echo ./backtrace ./backtrace.$arch.{exec,core}
-   testrun ${abs_builddir}/backtrace -e ./backtrace.$arch.exec --core=./backtrace.$arch.core 1>backtrace.$arch.bt 2>backtrace.$arch.err || true
-   cat backtrace.$arch.{bt,err}
-+  check_unsupported backtrace.$arch.err backtrace.$arch.core
-   check_all backtrace.$arch.{bt,err} backtrace.$arch.core
- }
- 
-Index: elfutils-0.158/tests/backtrace.c
-===================================================================
---- elfutils-0.158.orig/tests/backtrace.c	2014-05-01 17:11:18.870616302 +0000
-+++ elfutils-0.158/tests/backtrace.c	2014-05-01 17:11:18.866616384 +0000
-@@ -39,6 +39,18 @@
- #include <sys/syscall.h>
- #include ELFUTILS_HEADER(dwfl)
- 
-+#ifndef __linux__
-+
-+int
-+main (int argc __attribute__ ((unused)), char **argv)
-+{
-+  fprintf (stderr, "%s: Unwinding not supported for this architecture\n",
-+	   argv[0]);
-+  return 77;
-+}
-+
-+#else /* __linux__ */
-+
- static int
- dump_modules (Dwfl_Module *mod, void **userdata __attribute__ ((unused)),
- 	      const char *name, Dwarf_Addr start,
-@@ -452,3 +464,6 @@
-   dwfl_end (dwfl);
-   return 0;
- }
-+
-+#endif /* ! __linux__ */
-+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.160/arm_backend.diff
similarity index 82%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.160/arm_backend.diff
index fc3d6dc..c97c4e4 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/arm_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/arm_backend.diff
@@ -1,7 +1,25 @@
-Index: elfutils-0.158/backends/arm_init.c
-===================================================================
---- elfutils-0.158.orig/backends/arm_init.c	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/backends/arm_init.c	2014-04-21 11:13:24.374519343 +0000
+From 0db1687eee0b4d16ccbc40db5a06b574fca6614c Mon Sep 17 00:00:00 2001
+From: Hongxu Jia <hongxu.jia@windriver.com>
+Date: Fri, 14 Nov 2014 15:25:42 +0800
+Subject: [PATCH] Rebase arm_backend.diff from 0.159 to 0.160
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/arm_init.c                 |  18 ++++-
+ backends/arm_regs.c                 | 132 ++++++++++++++++++++++++++++++++++++
+ backends/arm_retval.c               |  44 +++++++++++-
+ backends/libebl_arm.h               |   9 +++
+ libelf/elf.h                        |  11 +++
+ tests/run-addrcfi.sh                |  93 ++++++++++++++++++++++++-
+ tests/run-allregs.sh                |  95 +++++++++++++++++++++++++-
+ tests/run-readelf-mixed-corenote.sh |  11 ++-
+ 8 files changed, 401 insertions(+), 12 deletions(-)
+ create mode 100644 backends/libebl_arm.h
+
+diff --git a/backends/arm_init.c b/backends/arm_init.c
+index 3283c97..8b57d3f 100644
+--- a/backends/arm_init.c
++++ b/backends/arm_init.c
 @@ -35,21 +35,32 @@
  #define RELOC_PREFIX	R_ARM_
  #include "libebl_CPU.h"
@@ -36,7 +54,7 @@ Index: elfutils-0.158/backends/arm_init.c
    /* We handle it.  */
    eh->name = "ARM";
    arm_init_reloc (eh);
-@@ -61,7 +72,10 @@
+@@ -61,7 +72,10 @@ arm_init (elf, machine, eh, ehlen)
    HOOK (eh, core_note);
    HOOK (eh, auxv_info);
    HOOK (eh, check_object_attribute);
@@ -46,12 +64,12 @@ Index: elfutils-0.158/backends/arm_init.c
 +  else
 +    eh->return_value_location = arm_return_value_location_hard;
    HOOK (eh, abi_cfi);
+   HOOK (eh, check_reloc_target_type);
  
-   return MODVERSION;
-Index: elfutils-0.158/backends/arm_regs.c
-===================================================================
---- elfutils-0.158.orig/backends/arm_regs.c	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/backends/arm_regs.c	2014-04-21 11:13:24.374519343 +0000
+diff --git a/backends/arm_regs.c b/backends/arm_regs.c
+index 21c5ad3..4ee1039 100644
+--- a/backends/arm_regs.c
++++ b/backends/arm_regs.c
 @@ -31,6 +31,7 @@
  #endif
  
@@ -60,7 +78,7 @@ Index: elfutils-0.158/backends/arm_regs.c
  #include <dwarf.h>
  
  #define BACKEND arm_
-@@ -76,6 +77,9 @@
+@@ -76,6 +77,9 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
        break;
  
      case 16 + 0 ... 16 + 7:
@@ -70,7 +88,7 @@ Index: elfutils-0.158/backends/arm_regs.c
        regno += 96 - 16;
        /* Fall through.  */
      case 96 + 0 ... 96 + 7:
-@@ -87,11 +91,139 @@
+@@ -87,11 +91,139 @@ arm_register_info (Ebl *ebl __attribute__ ((unused)),
        namelen = 2;
        break;
  
@@ -210,11 +228,11 @@ Index: elfutils-0.158/backends/arm_regs.c
        *setname = "VFP";
        *type = DW_ATE_float;
        *bits = 64;
-Index: elfutils-0.158/backends/arm_retval.c
-===================================================================
---- elfutils-0.158.orig/backends/arm_retval.c	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/backends/arm_retval.c	2014-04-21 11:13:24.374519343 +0000
-@@ -48,6 +48,13 @@
+diff --git a/backends/arm_retval.c b/backends/arm_retval.c
+index 7aced74..052132e 100644
+--- a/backends/arm_retval.c
++++ b/backends/arm_retval.c
+@@ -48,6 +48,13 @@ static const Dwarf_Op loc_intreg[] =
  #define nloc_intreg	1
  #define nloc_intregs(n)	(2 * (n))
  
@@ -228,7 +246,7 @@ Index: elfutils-0.158/backends/arm_retval.c
  /* The return value is a structure and is actually stored in stack space
     passed in a hidden argument by the caller.  But, the compiler
     helpfully returns the address of that space in r0.  */
-@@ -58,8 +65,9 @@
+@@ -58,8 +65,9 @@ static const Dwarf_Op loc_aggregate[] =
  #define nloc_aggregate 1
  
  
@@ -240,11 +258,11 @@ Index: elfutils-0.158/backends/arm_retval.c
  {
    /* Start with the function's type, and get the DW_AT_type attribute,
       which is the type of the return value.  */
-@@ -112,14 +120,31 @@
- 	  else
- 	    return -1;
- 	}
-+      if (tag == DW_TAG_base_type)
+@@ -98,14 +106,31 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
+ 	    else
+ 	      return -1;
+ 	  }
++	if (tag == DW_TAG_base_type)
 +	{
 +	  Dwarf_Word encoding;
 +	  if (dwarf_formudata (dwarf_attr_integrate (typedie, DW_AT_encoding,
@@ -259,20 +277,20 @@ Index: elfutils-0.158/backends/arm_retval.c
 +	      goto aggregate;
 +	    }
 +	}
-       if (size <= 16)
- 	{
- 	intreg:
- 	  *locp = loc_intreg;
- 	  return size <= 4 ? nloc_intreg : nloc_intregs ((size + 3) / 4);
- 	}
-+      /* fall through. */
+ 	if (size <= 16)
+ 	  {
+ 	  intreg:
+ 	    *locp = loc_intreg;
+ 	    return size <= 4 ? nloc_intreg : nloc_intregs ((size + 3) / 4);
+ 	  }
++	  /* fall through. */
  
-     aggregate:
-+      /* XXX TODO sometimes aggregates are returned in r0 (-mabi=aapcs) */
-       *locp = loc_aggregate;
-       return nloc_aggregate;
- 
-@@ -138,3 +163,18 @@
+       aggregate:
++	/* XXX TODO sometimes aggregates are returned in r0 (-mabi=aapcs) */
+ 	*locp = loc_aggregate;
+ 	return nloc_aggregate;
+       }
+@@ -125,3 +150,18 @@ arm_return_value_location (Dwarf_Die *functypedie, const Dwarf_Op **locp)
       DWARF and might be valid.  */
    return -2;
  }
@@ -291,11 +309,26 @@ Index: elfutils-0.158/backends/arm_retval.c
 +   return arm_return_value_location_ (functypedie, locp, 0);
 +}
 +
-Index: elfutils-0.158/libelf/elf.h
-===================================================================
---- elfutils-0.158.orig/libelf/elf.h	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/libelf/elf.h	2014-04-21 11:13:24.374519343 +0000
-@@ -2318,6 +2318,9 @@
+diff --git a/backends/libebl_arm.h b/backends/libebl_arm.h
+new file mode 100644
+index 0000000..c00770c
+--- /dev/null
++++ b/backends/libebl_arm.h
+@@ -0,0 +1,9 @@
++#ifndef _LIBEBL_ARM_H
++#define _LIBEBL_ARM_H 1
++
++#include <libdw.h>
++
++extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
++extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
++
++#endif
+diff --git a/libelf/elf.h b/libelf/elf.h
+index a3cce3e..0891674 100644
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -2346,6 +2346,9 @@ typedef Elf32_Addr Elf32_Conflict;
  #define EF_ARM_EABI_VER4	0x04000000
  #define EF_ARM_EABI_VER5	0x05000000
  
@@ -305,7 +338,7 @@ Index: elfutils-0.158/libelf/elf.h
  /* Additional symbol types for Thumb.  */
  #define STT_ARM_TFUNC		STT_LOPROC /* A Thumb function.  */
  #define STT_ARM_16BIT		STT_HIPROC /* A Thumb label.  */
-@@ -2335,12 +2338,19 @@
+@@ -2363,12 +2366,19 @@ typedef Elf32_Addr Elf32_Conflict;
  
  /* Processor specific values for the Phdr p_type field.  */
  #define PT_ARM_EXIDX		(PT_LOPROC + 1)	/* ARM unwind segment.  */
@@ -325,7 +358,7 @@ Index: elfutils-0.158/libelf/elf.h
  
  /* AArch64 relocs.  */
  
-@@ -2619,6 +2629,7 @@
+@@ -2647,6 +2657,7 @@ typedef Elf32_Addr Elf32_Conflict;
  					   TLS block (LDR, STR).  */
  #define R_ARM_TLS_IE12GP	111	/* 12 bit GOT entry relative
  					   to GOT origin (LDR).  */
@@ -333,25 +366,122 @@ Index: elfutils-0.158/libelf/elf.h
  #define R_ARM_ME_TOO		128	/* Obsolete.  */
  #define R_ARM_THM_TLS_DESCSEQ	129
  #define R_ARM_THM_TLS_DESCSEQ16	129
-Index: elfutils-0.158/backends/libebl_arm.h
-===================================================================
---- /dev/null	1970-01-01 00:00:00.000000000 +0000
-+++ elfutils-0.158/backends/libebl_arm.h	2014-04-21 11:13:24.374519343 +0000
-@@ -0,0 +1,9 @@
-+#ifndef _LIBEBL_ARM_H
-+#define _LIBEBL_ARM_H 1
-+
-+#include <libdw.h>
-+
-+extern int arm_return_value_location_soft(Dwarf_Die *, const Dwarf_Op **locp);
-+extern int arm_return_value_location_hard(Dwarf_Die *, const Dwarf_Op **locp);
-+
-+#endif
-Index: elfutils-0.158/tests/run-allregs.sh
-===================================================================
---- elfutils-0.158.orig/tests/run-allregs.sh	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/tests/run-allregs.sh	2014-04-21 11:13:24.378519252 +0000
-@@ -2671,7 +2671,28 @@
+diff --git a/tests/run-addrcfi.sh b/tests/run-addrcfi.sh
+index 5d33246..78464a8 100755
+--- a/tests/run-addrcfi.sh
++++ b/tests/run-addrcfi.sh
+@@ -2530,6 +2530,38 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
+ 	FPA reg21 (f5): undefined
+ 	FPA reg22 (f6): undefined
+ 	FPA reg23 (f7): undefined
++	VFP reg64 (s0): undefined
++	VFP reg65 (s1): undefined
++	VFP reg66 (s2): undefined
++	VFP reg67 (s3): undefined
++	VFP reg68 (s4): undefined
++	VFP reg69 (s5): undefined
++	VFP reg70 (s6): undefined
++	VFP reg71 (s7): undefined
++	VFP reg72 (s8): undefined
++	VFP reg73 (s9): undefined
++	VFP reg74 (s10): undefined
++	VFP reg75 (s11): undefined
++	VFP reg76 (s12): undefined
++	VFP reg77 (s13): undefined
++	VFP reg78 (s14): undefined
++	VFP reg79 (s15): undefined
++	VFP reg80 (s16): undefined
++	VFP reg81 (s17): undefined
++	VFP reg82 (s18): undefined
++	VFP reg83 (s19): undefined
++	VFP reg84 (s20): undefined
++	VFP reg85 (s21): undefined
++	VFP reg86 (s22): undefined
++	VFP reg87 (s23): undefined
++	VFP reg88 (s24): undefined
++	VFP reg89 (s25): undefined
++	VFP reg90 (s26): undefined
++	VFP reg91 (s27): undefined
++	VFP reg92 (s28): undefined
++	VFP reg93 (s29): undefined
++	VFP reg94 (s30): undefined
++	VFP reg95 (s31): undefined
+ 	FPA reg96 (f0): undefined
+ 	FPA reg97 (f1): undefined
+ 	FPA reg98 (f2): undefined
+@@ -2538,7 +2570,66 @@ dwarf_cfi_addrframe (.eh_frame): no matching address range
+ 	FPA reg101 (f5): undefined
+ 	FPA reg102 (f6): undefined
+ 	FPA reg103 (f7): undefined
+-	integer reg128 (spsr): undefined
++	MMX reg104 (wcgr0): undefined
++	MMX reg105 (wcgr1): undefined
++	MMX reg106 (wcgr2): undefined
++	MMX reg107 (wcgr3): undefined
++	MMX reg108 (wcgr4): undefined
++	MMX reg109 (wcgr5): undefined
++	MMX reg110 (wcgr6): undefined
++	MMX reg111 (wcgr7): undefined
++	MMX reg112 (wr0): undefined
++	MMX reg113 (wr1): undefined
++	MMX reg114 (wr2): undefined
++	MMX reg115 (wr3): undefined
++	MMX reg116 (wr4): undefined
++	MMX reg117 (wr5): undefined
++	MMX reg118 (wr6): undefined
++	MMX reg119 (wr7): undefined
++	MMX reg120 (wr8): undefined
++	MMX reg121 (wr9): undefined
++	MMX reg122 (wr10): undefined
++	MMX reg123 (wr11): undefined
++	MMX reg124 (wr12): undefined
++	MMX reg125 (wr13): undefined
++	MMX reg126 (wr14): undefined
++	MMX reg127 (wr15): undefined
++	state reg128 (spsr): undefined
++	state reg129 (spsr_fiq): undefined
++	state reg130 (spsr_irq): undefined
++	state reg131 (spsr_abt): undefined
++	state reg132 (spsr_und): undefined
++	state reg133 (spsr_svc): undefined
++	integer reg144 (r8_usr): undefined
++	integer reg145 (r9_usr): undefined
++	integer reg146 (r10_usr): undefined
++	integer reg147 (r11_usr): undefined
++	integer reg148 (r12_usr): undefined
++	integer reg149 (r13_usr): undefined
++	integer reg150 (r14_usr): undefined
++	integer reg151 (r8_fiq): undefined
++	integer reg152 (r9_fiq): undefined
++	integer reg153 (r10_fiq): undefined
++	integer reg154 (r11_fiq): undefined
++	integer reg155 (r12_fiq): undefined
++	integer reg156 (r13_fiq): undefined
++	integer reg157 (r14_fiq): undefined
++	integer reg158 (r13_irq): undefined
++	integer reg159 (r14_irq): undefined
++	integer reg160 (r13_abt): undefined
++	integer reg161 (r14_abt): undefined
++	integer reg162 (r13_und): undefined
++	integer reg163 (r14_und): undefined
++	integer reg164 (r13_svc): undefined
++	integer reg165 (r14_svc): undefined
++	MMX reg192 (wc0): undefined
++	MMX reg193 (wc1): undefined
++	MMX reg194 (wc2): undefined
++	MMX reg195 (wc3): undefined
++	MMX reg196 (wc4): undefined
++	MMX reg197 (wc5): undefined
++	MMX reg198 (wc6): undefined
++	MMX reg199 (wc7): undefined
+ 	VFP reg256 (d0): undefined
+ 	VFP reg257 (d1): undefined
+ 	VFP reg258 (d2): undefined
+diff --git a/tests/run-allregs.sh b/tests/run-allregs.sh
+index 6f3862e..13557d5 100755
+--- a/tests/run-allregs.sh
++++ b/tests/run-allregs.sh
+@@ -2671,7 +2671,28 @@ integer registers:
  	 13: sp (sp), address 32 bits
  	 14: lr (lr), address 32 bits
  	 15: pc (pc), address 32 bits
@@ -381,7 +511,7 @@ Index: elfutils-0.158/tests/run-allregs.sh
  FPA registers:
  	 16: f0 (f0), float 96 bits
  	 17: f1 (f1), float 96 bits
-@@ -2689,7 +2710,72 @@
+@@ -2689,7 +2710,72 @@ FPA registers:
  	101: f5 (f5), float 96 bits
  	102: f6 (f6), float 96 bits
  	103: f7 (f7), float 96 bits
@@ -454,7 +584,7 @@ Index: elfutils-0.158/tests/run-allregs.sh
  	256: d0 (d0), float 64 bits
  	257: d1 (d1), float 64 bits
  	258: d2 (d2), float 64 bits
-@@ -2722,6 +2808,13 @@
+@@ -2722,6 +2808,13 @@ VFP registers:
  	285: d29 (d29), float 64 bits
  	286: d30 (d30), float 64 bits
  	287: d31 (d31), float 64 bits
@@ -468,11 +598,11 @@ Index: elfutils-0.158/tests/run-allregs.sh
  EOF
  
  # See run-readelf-mixed-corenote.sh for instructions to regenerate
-Index: elfutils-0.158/tests/run-readelf-mixed-corenote.sh
-===================================================================
---- elfutils-0.158.orig/tests/run-readelf-mixed-corenote.sh	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/tests/run-readelf-mixed-corenote.sh	2014-04-21 11:13:24.378519252 +0000
-@@ -30,12 +30,11 @@
+diff --git a/tests/run-readelf-mixed-corenote.sh b/tests/run-readelf-mixed-corenote.sh
+index 01e4594..9a8a380 100755
+--- a/tests/run-readelf-mixed-corenote.sh
++++ b/tests/run-readelf-mixed-corenote.sh
+@@ -30,12 +30,11 @@ Note segment of 892 bytes at offset 0x274:
      pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
      utime: 0.000000, stime: 0.010000, cutime: 0.000000, cstime: 0.000000
      orig_r0: -1, fpvalid: 1
@@ -490,114 +620,6 @@ Index: elfutils-0.158/tests/run-readelf-mixed-corenote.sh
    CORE                 124  PRPSINFO
      state: 0, sname: R, zomb: 0, nice: 0, flag: 0x00400500
      uid: 0, gid: 0, pid: 11087, ppid: 11063, pgrp: 11087, sid: 11063
-Index: elfutils-0.158/tests/run-addrcfi.sh
-===================================================================
---- elfutils-0.158.orig/tests/run-addrcfi.sh	2014-04-21 11:13:24.378519252 +0000
-+++ elfutils-0.158/tests/run-addrcfi.sh	2014-04-21 11:13:24.378519252 +0000
-@@ -2530,6 +2530,38 @@
- 	FPA reg21 (f5): undefined
- 	FPA reg22 (f6): undefined
- 	FPA reg23 (f7): undefined
-+	VFP reg64 (s0): undefined
-+	VFP reg65 (s1): undefined
-+	VFP reg66 (s2): undefined
-+	VFP reg67 (s3): undefined
-+	VFP reg68 (s4): undefined
-+	VFP reg69 (s5): undefined
-+	VFP reg70 (s6): undefined
-+	VFP reg71 (s7): undefined
-+	VFP reg72 (s8): undefined
-+	VFP reg73 (s9): undefined
-+	VFP reg74 (s10): undefined
-+	VFP reg75 (s11): undefined
-+	VFP reg76 (s12): undefined
-+	VFP reg77 (s13): undefined
-+	VFP reg78 (s14): undefined
-+	VFP reg79 (s15): undefined
-+	VFP reg80 (s16): undefined
-+	VFP reg81 (s17): undefined
-+	VFP reg82 (s18): undefined
-+	VFP reg83 (s19): undefined
-+	VFP reg84 (s20): undefined
-+	VFP reg85 (s21): undefined
-+	VFP reg86 (s22): undefined
-+	VFP reg87 (s23): undefined
-+	VFP reg88 (s24): undefined
-+	VFP reg89 (s25): undefined
-+	VFP reg90 (s26): undefined
-+	VFP reg91 (s27): undefined
-+	VFP reg92 (s28): undefined
-+	VFP reg93 (s29): undefined
-+	VFP reg94 (s30): undefined
-+	VFP reg95 (s31): undefined
- 	FPA reg96 (f0): undefined
- 	FPA reg97 (f1): undefined
- 	FPA reg98 (f2): undefined
-@@ -2538,7 +2570,66 @@
- 	FPA reg101 (f5): undefined
- 	FPA reg102 (f6): undefined
- 	FPA reg103 (f7): undefined
--	integer reg128 (spsr): undefined
-+	MMX reg104 (wcgr0): undefined
-+	MMX reg105 (wcgr1): undefined
-+	MMX reg106 (wcgr2): undefined
-+	MMX reg107 (wcgr3): undefined
-+	MMX reg108 (wcgr4): undefined
-+	MMX reg109 (wcgr5): undefined
-+	MMX reg110 (wcgr6): undefined
-+	MMX reg111 (wcgr7): undefined
-+	MMX reg112 (wr0): undefined
-+	MMX reg113 (wr1): undefined
-+	MMX reg114 (wr2): undefined
-+	MMX reg115 (wr3): undefined
-+	MMX reg116 (wr4): undefined
-+	MMX reg117 (wr5): undefined
-+	MMX reg118 (wr6): undefined
-+	MMX reg119 (wr7): undefined
-+	MMX reg120 (wr8): undefined
-+	MMX reg121 (wr9): undefined
-+	MMX reg122 (wr10): undefined
-+	MMX reg123 (wr11): undefined
-+	MMX reg124 (wr12): undefined
-+	MMX reg125 (wr13): undefined
-+	MMX reg126 (wr14): undefined
-+	MMX reg127 (wr15): undefined
-+	state reg128 (spsr): undefined
-+	state reg129 (spsr_fiq): undefined
-+	state reg130 (spsr_irq): undefined
-+	state reg131 (spsr_abt): undefined
-+	state reg132 (spsr_und): undefined
-+	state reg133 (spsr_svc): undefined
-+	integer reg144 (r8_usr): undefined
-+	integer reg145 (r9_usr): undefined
-+	integer reg146 (r10_usr): undefined
-+	integer reg147 (r11_usr): undefined
-+	integer reg148 (r12_usr): undefined
-+	integer reg149 (r13_usr): undefined
-+	integer reg150 (r14_usr): undefined
-+	integer reg151 (r8_fiq): undefined
-+	integer reg152 (r9_fiq): undefined
-+	integer reg153 (r10_fiq): undefined
-+	integer reg154 (r11_fiq): undefined
-+	integer reg155 (r12_fiq): undefined
-+	integer reg156 (r13_fiq): undefined
-+	integer reg157 (r14_fiq): undefined
-+	integer reg158 (r13_irq): undefined
-+	integer reg159 (r14_irq): undefined
-+	integer reg160 (r13_abt): undefined
-+	integer reg161 (r14_abt): undefined
-+	integer reg162 (r13_und): undefined
-+	integer reg163 (r14_und): undefined
-+	integer reg164 (r13_svc): undefined
-+	integer reg165 (r14_svc): undefined
-+	MMX reg192 (wc0): undefined
-+	MMX reg193 (wc1): undefined
-+	MMX reg194 (wc2): undefined
-+	MMX reg195 (wc3): undefined
-+	MMX reg196 (wc4): undefined
-+	MMX reg197 (wc5): undefined
-+	MMX reg198 (wc6): undefined
-+	MMX reg199 (wc7): undefined
- 	VFP reg256 (d0): undefined
- 	VFP reg257 (d1): undefined
- 	VFP reg258 (d2): undefined
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch b/meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch
new file mode 100644
index 0000000..eeb2063
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/arm_func_value.patch
@@ -0,0 +1,166 @@
+From: Mark Wielaard <mjw@redhat.com>
+Date: Sun, 15 Jun 2014 11:30:35 +0200
+Subject: libebl: Add sym_func_value hook.
+
+The ARM EABI says that the zero bit of function symbol st_value indicates
+whether the symbol points to a THUMB or ARM function. Add a new ebl hook
+to adjust the st_value in such a case so that we get the actual value that
+the symbol points to. It isn't easily possible to reuse the existing
+resolve_sym_value for this purpose, so we end up with another hook that
+can be used from dwfl_module_getsym and elflint.
+
+Rebase arm_func_value.patch from 0.159 to 0.160
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/arm_init.c          |  1 +
+ backends/arm_symbol.c        |  8 ++++++++
+ libdwfl/dwfl_module_getsym.c |  2 +-
+ libebl/Makefile.am           |  3 ++-
+ libebl/ebl-hooks.h           |  3 +++
+ libebl/eblsymfuncval.c       | 43 +++++++++++++++++++++++++++++++++++++++++++
+ libebl/libebl.h              | 11 +++++++++++
+ 7 files changed, 69 insertions(+), 2 deletions(-)
+ create mode 100644 libebl/eblsymfuncval.c
+
+diff --git a/backends/arm_init.c b/backends/arm_init.c
+index 8b57d3f..2266829 100644
+--- a/backends/arm_init.c
++++ b/backends/arm_init.c
+@@ -78,6 +78,7 @@ arm_init (elf, machine, eh, ehlen)
+     eh->return_value_location = arm_return_value_location_hard;
+   HOOK (eh, abi_cfi);
+   HOOK (eh, check_reloc_target_type);
++  HOOK (eh, sym_func_value);
+ 
+   /* We only unwind the core integer registers.  */
+   eh->frame_nregs = 16;
+diff --git a/backends/arm_symbol.c b/backends/arm_symbol.c
+index cd467ff..49fca55 100644
+--- a/backends/arm_symbol.c
++++ b/backends/arm_symbol.c
+@@ -129,3 +129,11 @@ arm_check_reloc_target_type (Ebl *ebl __attribute__ ((unused)), Elf64_Word sh_ty
+ {
+   return sh_type == SHT_ARM_EXIDX;
+ }
++
++/* ARM EABI says that the low bit indicates whether the function
++   symbol value is a THUMB function or not.  Mask it off.  */
++GElf_Addr
++arm_sym_func_value (Ebl *ebl __attribute__ ((unused)), GElf_Addr val)
++{
++  return val & ~(GElf_Addr)1;
++}
+diff --git a/libdwfl/dwfl_module_getsym.c b/libdwfl/dwfl_module_getsym.c
+index 42d2b67..fb192d7 100644
+--- a/libdwfl/dwfl_module_getsym.c
++++ b/libdwfl/dwfl_module_getsym.c
+@@ -119,7 +119,7 @@ __libdwfl_getsym (Dwfl_Module *mod, int ndx, GElf_Sym *sym, GElf_Addr *addr,
+      descriptors).  */
+ 
+   char *ident;
+-  GElf_Addr st_value = sym->st_value & ebl_func_addr_mask (mod->ebl);
++  GElf_Addr st_value = ebl_sym_func_value (mod->ebl, sym->st_value);
+   *resolved = false;
+   if (! adjust_st_value && mod->e_type != ET_REL && alloc
+       && (GELF_ST_TYPE (sym->st_info) == STT_FUNC
+diff --git a/libebl/Makefile.am b/libebl/Makefile.am
+index ec4477b..889c21b 100644
+--- a/libebl/Makefile.am
++++ b/libebl/Makefile.am
+@@ -55,7 +55,8 @@ gen_SOURCES = eblopenbackend.c eblclosebackend.c eblstrtab.c \
+ 	      eblsysvhashentrysize.c eblauxvinfo.c eblcheckobjattr.c \
+ 	      ebl_check_special_section.c ebl_syscall_abi.c eblabicfi.c \
+ 	      eblstother.c eblinitreg.c ebldwarftoregno.c eblnormalizepc.c \
+-	      eblunwind.c eblresolvesym.c eblcheckreloctargettype.c
++	      eblunwind.c eblresolvesym.c eblcheckreloctargettype.c \
++	      eblsymfuncval.c
+ 
+ libebl_a_SOURCES = $(gen_SOURCES)
+ 
+diff --git a/libebl/ebl-hooks.h b/libebl/ebl-hooks.h
+index e1186f8..160a821 100644
+--- a/libebl/ebl-hooks.h
++++ b/libebl/ebl-hooks.h
+@@ -191,5 +191,8 @@ bool EBLHOOK(unwind) (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
+    (e.g. function descriptor resolving)  */
+ bool EBLHOOK(resolve_sym_value) (Ebl *ebl, GElf_Addr *addr);
+ 
++/* Returns the real value of a symbol function address or offset.  */
++GElf_Addr EBLHOOK(sym_func_value) (Ebl *ebl, GElf_Addr val);
++
+ /* Destructor for ELF backend handle.  */
+ void EBLHOOK(destr) (struct ebl *);
+diff --git a/libebl/eblsymfuncval.c b/libebl/eblsymfuncval.c
+new file mode 100644
+index 0000000..c0b322f
+--- /dev/null
++++ b/libebl/eblsymfuncval.c
+@@ -0,0 +1,43 @@
++/* Turn a symbol function value into a real function address or offset.
++   Copyright (C) 2014 Red Hat, Inc.
++   This file is part of elfutils.
++
++   This file is free software; you can redistribute it and/or modify
++   it under the terms of either
++
++     * the GNU Lesser General Public License as published by the Free
++       Software Foundation; either version 3 of the License, or (at
++       your option) any later version
++
++   or
++
++     * the GNU General Public License as published by the Free
++       Software Foundation; either version 2 of the License, or (at
++       your option) any later version
++
++   or both in parallel, as here.
++
++   elfutils is distributed in the hope that it will be useful, but
++   WITHOUT ANY WARRANTY; without even the implied warranty of
++   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
++   General Public License for more details.
++
++   You should have received copies of the GNU General Public License and
++   the GNU Lesser General Public License along with this program.  If
++   not, see <http://www.gnu.org/licenses/>.  */
++
++#ifdef HAVE_CONFIG_H
++# include <config.h>
++#endif
++
++#include <libeblP.h>
++#include <assert.h>
++
++GElf_Addr
++ebl_sym_func_value (Ebl *ebl, GElf_Addr val)
++{
++  if (ebl == NULL || ebl->sym_func_value == NULL)
++    return val;
++
++  return ebl->sym_func_value (ebl, val);
++}
+diff --git a/libebl/libebl.h b/libebl/libebl.h
+index bb993bf..40cf635 100644
+--- a/libebl/libebl.h
++++ b/libebl/libebl.h
+@@ -459,6 +459,17 @@ extern bool ebl_unwind (Ebl *ebl, Dwarf_Addr pc, ebl_tid_registers_t *setfunc,
+ extern bool ebl_resolve_sym_value (Ebl *ebl, GElf_Addr *addr)
+    __nonnull_attribute__ (2);
+ 
++/* Returns the real value of a symbol function address or offset
++   (e.g. when the st_value contains some flag bits that need to be
++   masked off).  This is different from ebl_resolve_sym_value which
++   only works for actual symbol addresses (in non-ET_REL files) that
++   might resolve to an address in a different section.
++   ebl_sym_func_value is called to turn the given value into the a
++   real address or offset (the original value might not be a real
++   address).  This works for both ET_REL when the value is a section
++   offset or ET_EXEC or ET_DYN symbol values, which are addresses.  */
++extern GElf_Addr ebl_sym_func_value (Ebl *ebl, GElf_Addr val);
++
+ #ifdef __cplusplus
+ }
+ #endif
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch b/meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch
new file mode 100644
index 0000000..8abb36b
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/arm_unwind_ret_mask.patch
@@ -0,0 +1,83 @@
+From: Mark Wielaard <mjw@redhat.com>
+Date: Sun, 15 Jun 2014 12:30:02 +0200
+Subject: libebl: Add ebl_unwind_ret_mask.
+
+Another ARM oddity. A return value address in an unwind will contain an
+extra bit to indicate whether to return to a regular ARM or THUMB function.
+Add a new ebl function to return a mask to use to get the actual return
+address during an unwind ebl_unwind_ret_mask.
+
+Rebase arm_unwind_ret_mask.patch from 0.159 to 0.160
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ backends/arm_init.c | 3 +++
+ libebl/eblinitreg.c | 8 ++++++++
+ libebl/libebl.h     | 4 ++++
+ libebl/libeblP.h    | 6 ++++++
+ 4 files changed, 21 insertions(+)
+
+diff --git a/backends/arm_init.c b/backends/arm_init.c
+index 2266829..f8df042 100644
+--- a/backends/arm_init.c
++++ b/backends/arm_init.c
+@@ -87,5 +87,8 @@ arm_init (elf, machine, eh, ehlen)
+   /* Bit zero encodes whether an function address is THUMB or ARM. */
+   eh->func_addr_mask = ~(GElf_Addr)1;
+ 
++  /* Bit zero encodes whether to return to a THUMB or ARM function. */
++  eh->unwind_ret_mask = ~(GElf_Addr)1;
++
+   return MODVERSION;
+ }
+diff --git a/libebl/eblinitreg.c b/libebl/eblinitreg.c
+index 5729b3c..ca681c0 100644
+--- a/libebl/eblinitreg.c
++++ b/libebl/eblinitreg.c
+@@ -56,3 +56,11 @@ ebl_func_addr_mask (Ebl *ebl)
+   return ((ebl == NULL || ebl->func_addr_mask == 0)
+ 	  ? ~(GElf_Addr)0 : ebl->func_addr_mask);
+ }
++
++GElf_Addr
++ebl_unwind_ret_mask (Ebl *ebl)
++{
++  return ((ebl == NULL || ebl->unwind_ret_mask == 0)
++	  ? ~(GElf_Addr)0 : ebl->unwind_ret_mask);
++}
++
+diff --git a/libebl/libebl.h b/libebl/libebl.h
+index 40cf635..be70027 100644
+--- a/libebl/libebl.h
++++ b/libebl/libebl.h
+@@ -420,6 +420,10 @@ extern size_t ebl_frame_nregs (Ebl *ebl)
+    tables) is needed.  */
+ extern GElf_Addr ebl_func_addr_mask (Ebl *ebl);
+ 
++/* Mask to use for unwind return address in case the architecture adds
++   some extra non-address bits to it.  */
++extern GElf_Addr ebl_unwind_ret_mask (Ebl *ebl);
++
+ /* Convert *REGNO as is in DWARF to a lower range suitable for
+    Dwarf_Frame->REGS indexing.  */
+ extern bool ebl_dwarf_to_regno (Ebl *ebl, unsigned *regno)
+diff --git a/libebl/libeblP.h b/libebl/libeblP.h
+index dbd67f3..e18ace6 100644
+--- a/libebl/libeblP.h
++++ b/libebl/libeblP.h
+@@ -70,6 +70,12 @@ struct ebl
+      otherwise it should be the actual mask to use.  */
+   GElf_Addr func_addr_mask;
+ 
++  /* Mask to use to get the return address from an unwind in case the
++     architecture adds some extra non-address bits to it.  When not
++     initialized (0) then ebl_unwind_ret_mask will return ~0, otherwise
++     it should be the actual mask to use.  */
++  GElf_Addr unwind_ret_mask;
++
+   /* Function descriptor load address and table as used by
+      ebl_resolve_sym_value if available for this arch.  */
+   GElf_Addr fd_addr;
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch b/meta/recipes-devtools/elfutils/elfutils-0.160/fixheadercheck.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/fixheadercheck.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.160/fixheadercheck.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.160/hppa_backend.diff
similarity index 99%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.160/hppa_backend.diff
index 6c19d17..d51a720 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/hppa_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/hppa_backend.diff
@@ -478,7 +478,7 @@ Index: elfutils-0.158/backends/parisc_retval.c
 +  /* Follow typedefs and qualifiers to get to the actual type.  */
 +  while (tag == DW_TAG_typedef
 +	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++	 || tag == DW_TAG_restrict_type)
 +    {
 +      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
 +      typedie = dwarf_formref_die (attr, &die_mem);
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.160/m68k_backend.diff
similarity index 99%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.160/m68k_backend.diff
index 48bffda..f5b566f 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/m68k_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/m68k_backend.diff
@@ -409,7 +409,7 @@ Index: elfutils-0.158/backends/m68k_retval.c
 +  /* Follow typedefs and qualifiers to get to the actual type.  */
 +  while (tag == DW_TAG_typedef
 +	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++	 || tag == DW_TAG_restrict_type)
 +    {
 +      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
 +      typedie = dwarf_formref_die (attr, &die_mem);
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff b/meta/recipes-devtools/elfutils/elfutils-0.160/mips_backend.diff
similarity index 99%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.160/mips_backend.diff
index b188927..d73a3f2 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/mips_backend.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/mips_backend.diff
@@ -496,7 +496,7 @@ Index: elfutils-0.158/backends/mips_retval.c
 +  /* Follow typedefs and qualifiers to get to the actual type.  */
 +  while (tag == DW_TAG_typedef
 +	 || tag == DW_TAG_const_type || tag == DW_TAG_volatile_type
-+	 || tag == DW_TAG_restrict_type || tag == DW_TAG_mutable_type)
++	 || tag == DW_TAG_restrict_type)
 +    {
 +      attr = dwarf_attr_integrate (typedie, DW_AT_type, &attr_mem);
 +      typedie = dwarf_formref_die (attr, &die_mem);
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch b/meta/recipes-devtools/elfutils/elfutils-0.160/mips_readelf_w.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/mips_readelf_w.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.160/mips_readelf_w.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch b/meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch
new file mode 100644
index 0000000..35b1b38
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/non_linux.patch
@@ -0,0 +1,35 @@
+Index: elfutils-0.159/libdwfl/linux-pid-attach.c
+===================================================================
+--- elfutils-0.159.orig/libdwfl/linux-pid-attach.c
++++ elfutils-0.159/libdwfl/linux-pid-attach.c
+@@ -393,6 +393,16 @@ pid_getthread (Dwfl *dwfl __attribute__
+   return false;
+ }
+ 
++bool
++internal_function
++__libdwfl_ptrace_attach (pid_t tid __attribute__ ((unused)),
++			 bool *tid_was_stoppedp __attribute__ ((unused)))
++{
++  errno = ENOSYS;
++  __libdwfl_seterrno (DWFL_E_ERRNO);
++  return false;
++}
++
+ static bool
+ pid_memory_read (Dwfl *dwfl __attribute__ ((unused)),
+                  Dwarf_Addr addr __attribute__ ((unused)),
+@@ -419,6 +429,13 @@ pid_detach (Dwfl *dwfl __attribute__ ((u
+ {
+ }
+ 
++void
++internal_function
++__libdwfl_ptrace_detach (pid_t tid __attribute__ ((unused)),
++			 bool tid_was_stopped __attribute__ ((unused)))
++{
++}
++
+ static void
+ pid_thread_detach (Dwfl_Thread *thread __attribute__ ((unused)),
+ 		  void *thread_arg __attribute__ ((unused)))
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff b/meta/recipes-devtools/elfutils/elfutils-0.160/redhat-portability.diff
similarity index 71%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.160/redhat-portability.diff
index 5a75375..a358b11 100644
--- a/meta/recipes-devtools/elfutils/elfutils-0.158/redhat-portability.diff
+++ b/meta/recipes-devtools/elfutils/elfutils-0.160/redhat-portability.diff
@@ -1,6 +1,8 @@
---- elfutils/backends/ChangeLog
-+++ elfutils/backends/ChangeLog
-@@ -292,6 +292,10 @@
+Index: elfutils-0.159/backends/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/backends/ChangeLog
++++ elfutils-0.159/backends/ChangeLog
+@@ -364,6 +364,10 @@
  	* ppc_attrs.c (ppc_check_object_attribute): Handle tag
  	GNU_Power_ABI_Struct_Return.
  
@@ -11,7 +13,7 @@
  2008-10-04  Ulrich Drepper  <drepper@redhat.com>
  
  	* i386_reloc.def: Fix entries for TLS_GOTDESC, TLS_DESC_CALL, and
-@@ -619,6 +623,11 @@
+@@ -691,6 +695,11 @@
  	* sparc_init.c: Likewise.
  	* x86_64_init.c: Likewise.
  
@@ -23,7 +25,7 @@
  2005-11-19  Roland McGrath  <roland@redhat.com>
  
  	* ppc64_reloc.def: REL30 -> ADDR30.
-@@ -641,6 +650,9 @@
+@@ -713,6 +722,9 @@
  	* Makefile.am (uninstall): Don't try to remove $(pkgincludedir).
  	(CLEANFILES): Add libebl_$(m).so.
  
@@ -33,20 +35,24 @@
  	* ppc_reloc.def: Update bits per Alan Modra <amodra@bigpond.net.au>.
  	* ppc64_reloc.def: Likewise.
  
---- elfutils/backends/Makefile.am
-+++ elfutils/backends/Makefile.am
-@@ -124,7 +124,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
+Index: elfutils-0.159/backends/Makefile.am
+===================================================================
+--- elfutils-0.159.orig/backends/Makefile.am
++++ elfutils-0.159/backends/Makefile.am
+@@ -119,7 +119,7 @@ libebl_%.so libebl_%.map: libebl_%_pic.a
  	$(LINK) -shared -o $(@:.map=.so) \
  		-Wl,--whole-archive $< $(cpu_$*) -Wl,--no-whole-archive \
  		-Wl,--version-script,$(@:.so=.map) \
--		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw) $(libmudflap)
-+		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw) $(libmudflap)
+-		-Wl,-z,defs -Wl,--as-needed $(libelf) $(libdw)
++		-Wl,-z,defs $(LD_AS_NEEDED) $(libelf) $(libdw)
  	$(textrel_check)
  
  libebl_i386.so: $(cpu_i386)
---- elfutils/ChangeLog
-+++ elfutils/ChangeLog
-@@ -118,6 +118,8 @@
+Index: elfutils-0.159/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/ChangeLog
++++ elfutils-0.159/ChangeLog
+@@ -148,6 +148,8 @@
  
  2012-01-24  Mark Wielaard  <mjw@redhat.com>
  
@@ -55,7 +61,7 @@
  	* COPYING: Fix address. Updated version from gnulib.
  
  2012-01-23  Mark Wielaard  <mjw@redhat.com>
-@@ -136,6 +138,9 @@
+@@ -166,6 +168,9 @@
  
  2011-10-08  Mike Frysinger  <vapier@gentoo.org>
  
@@ -65,7 +71,7 @@
  	* configure.ac: Fix use of AC_ARG_ENABLE to handle $enableval correctly.
  
  2011-10-02  Ulrich Drepper  <drepper@gmail.com>
-@@ -157,6 +162,10 @@
+@@ -187,6 +192,10 @@
  
  	* configure.ac (LOCALEDIR, DATADIRNAME): Removed.
  
@@ -76,7 +82,7 @@
  2009-09-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* configure.ac: Update for more modern autoconf.
-@@ -165,6 +174,10 @@
+@@ -195,6 +204,10 @@
  
  	* configure.ac (zip_LIBS): Check for liblzma too.
  
@@ -87,7 +93,7 @@
  2009-04-19  Roland McGrath  <roland@redhat.com>
  
  	* configure.ac (eu_version): Round down here, not in version.h macros.
-@@ -176,6 +189,8 @@
+@@ -206,6 +219,8 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
  
@@ -96,7 +102,7 @@
  	* configure.ac (zlib check): Check for gzdirect, need zlib >= 1.2.2.3.
  
  	* configure.ac (__thread check): Use AC_LINK_IFELSE, in case of
-@@ -256,6 +271,10 @@
+@@ -286,6 +301,10 @@
  	* configure.ac: Add dummy automake conditional to get dependencies
  	for non-generic linker right.  See src/Makefile.am.
  
@@ -107,7 +113,7 @@
  2005-11-18  Roland McGrath  <roland@redhat.com>
  
  	* Makefile.am (DISTCHECK_CONFIGURE_FLAGS): New variable.
-@@ -303,6 +322,17 @@
+@@ -333,6 +352,17 @@
  	* Makefile.am (all_SUBDIRS): Add libdwfl.
  	* configure.ac: Write libdwfl/Makefile.
  
@@ -125,9 +131,11 @@
  2005-05-19  Roland McGrath  <roland@redhat.com>
  
  	* configure.ac [AH_BOTTOM] (INTDECL, _INTDECL): New macros.
---- elfutils/config/ChangeLog
-+++ elfutils/config/ChangeLog
-@@ -44,6 +44,10 @@
+Index: elfutils-0.159/config/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/config/ChangeLog
++++ elfutils-0.159/config/ChangeLog
+@@ -58,6 +58,10 @@
  
  	* known-dwarf.awk: Use gawk.
  
@@ -138,17 +146,19 @@
  2010-07-02  Ulrich Drepper  <drepper@redhat.com>
  
  	* elfutils.spec.in: Add more BuildRequires.
---- elfutils/config/eu.am
-+++ elfutils/config/eu.am
+Index: elfutils-0.159/config/eu.am
+===================================================================
+--- elfutils-0.159.orig/config/eu.am
++++ elfutils-0.159/config/eu.am
 @@ -1,6 +1,6 @@
  ## Common automake fragments for elfutils subdirectory makefiles.
  ##
--## Copyright (C) 2010 Red Hat, Inc.
-+## Copyright (C) 2010-2011 Red Hat, Inc.
+-## Copyright (C) 2010, 2014 Red Hat, Inc.
++## Copyright (C) 2010-2011, 2014 Red Hat, Inc.
  ##
  ## This file is part of elfutils.
  ##
-@@ -29,14 +29,20 @@
+@@ -29,13 +29,21 @@
  ## not, see <http://www.gnu.org/licenses/>.
  ##
  
@@ -157,43 +167,26 @@
 +
  DEFS = -D_GNU_SOURCE -DHAVE_CONFIG_H -DLOCALEDIR='"${localedir}"'
  AM_CPPFLAGS = -I. -I$(srcdir) -I$(top_srcdir)/lib -I..
- AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
--	    $(if $($(*F)_no_Werror),,-Werror) \
+-AM_CFLAGS = -std=gnu99 -Wall -Wshadow -Wformat=2 \
++AM_CFLAGS = -std=gnu99 -Wall -Wshadow \
+ 	    $(if $($(*F)_no_Werror),,-Werror) \
 -	    $(if $($(*F)_no_Wunused),,-Wunused -Wextra) \
 +	    $(if $($(*F)_no_Wunused),,-Wunused $(WEXTRA)) \
- 	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
++	    $(if $($(*F)_no_Wformat),-Wno-format,-Wformat=2) \
  	    $($(*F)_CFLAGS)
  
 +if BUILD_WERROR
 +AM_CFLAGS += $(if $($(*F)_no_Werror),,-Werror)
 +endif
 +
- if MUDFLAP
- AM_CFLAGS += -fmudflap
- libmudflap = -lmudflap
---- elfutils/config.h.in
-+++ elfutils/config.h.in
-@@ -6,6 +6,9 @@
- /* Defined if libdw should support GNU ref_alt FORM, dwz multi files. */
- #undef ENABLE_DWZ
+ COMPILE.os = $(filter-out -fprofile-arcs -ftest-coverage, $(COMPILE))
  
-+/* Have __builtin_popcount. */
-+#undef HAVE_BUILTIN_POPCOUNT
-+
- /* Define to 1 if you have the <inttypes.h> header file. */
- #undef HAVE_INTTYPES_H
- 
-@@ -102,4 +105,7 @@
- /* Define for large files, on AIX-style hosts. */
- #undef _LARGE_FILES
- 
-+/* Stubbed out if missing compiler support. */
-+#undef __thread
-+
- #include <eu-config.h>
---- elfutils/configure.ac
-+++ elfutils/configure.ac
-@@ -99,6 +99,54 @@ CFLAGS="$old_CFLAGS"])
+ %.os: %.c %.o
+Index: elfutils-0.159/configure.ac
+===================================================================
+--- elfutils-0.159.orig/configure.ac
++++ elfutils-0.159/configure.ac
+@@ -89,6 +89,54 @@ CFLAGS="$old_CFLAGS"])
  AS_IF([test "x$ac_cv_c99" != xyes],
        AC_MSG_ERROR([gcc with C99 support required]))
  
@@ -248,7 +241,7 @@
  AC_CACHE_CHECK([for __thread support], ac_cv_tls, [dnl
  # Use the same flags that we use for our DSOs, so the test is representative.
  # Some old compiler/linker/libc combinations fail some ways and not others.
-@@ -114,7 +162,10 @@ static __thread int a; int foo (int b) {
+@@ -104,7 +152,10 @@ static __thread int a; int foo (int b) {
  CFLAGS="$save_CFLAGS"
  LDFLAGS="$save_LDFLAGS"])
  AS_IF([test "x$ac_cv_tls" != xyes],
@@ -260,9 +253,9 @@
  
  dnl This test must come as early as possible after the compiler configuration
  dnl tests, because the choice of the file model can (in principle) affect
-@@ -213,6 +264,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_
+@@ -183,6 +234,11 @@ AM_CONDITIONAL(USE_VALGRIND, test "$use_
  AM_CONDITIONAL(BUILD_STATIC, [dnl
- test "$use_mudflap" = yes -o "$use_gprof" = yes -o "$use_gcov" = yes])
+ test "$use_gprof" = yes -o "$use_gcov" = yes])
  
 +AC_ARG_ENABLE([werror],
 +AS_HELP_STRING([--disable-werror],[do not build with -Werror]),
@@ -272,7 +265,7 @@
  AC_ARG_ENABLE([tests-rpath],
  AS_HELP_STRING([--enable-tests-rpath],[build $ORIGIN-using rpath into tests]),
  	       [tests_use_rpath=$enableval], [tests_use_rpath=no])
-@@ -324,7 +380,7 @@ case "$eu_version" in
+@@ -297,7 +353,7 @@ case "$eu_version" in
  esac
  
  # Round up to the next release API (x.y) version.
@@ -281,9 +274,11 @@
  
  AC_CHECK_SIZEOF(long)
  
---- elfutils/lib/ChangeLog
-+++ elfutils/lib/ChangeLog
-@@ -61,6 +61,9 @@
+Index: elfutils-0.159/lib/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/lib/ChangeLog
++++ elfutils-0.159/lib/ChangeLog
+@@ -65,6 +65,9 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
  
@@ -293,7 +288,7 @@
  	* eu-config.h: Add multiple inclusion protection.
  
  2009-01-17  Ulrich Drepper  <drepper@redhat.com>
-@@ -117,6 +120,11 @@
+@@ -121,6 +124,11 @@
  	* Makefile.am (libeu_a_SOURCES): Add it.
  	* system.h: Declare crc32_file.
  
@@ -305,8 +300,10 @@
  2005-04-30  Ulrich Drepper  <drepper@redhat.com>
  
  	* Makefile.am: Use -ffunction-sections for xmalloc.c.
---- elfutils/lib/eu-config.h
-+++ elfutils/lib/eu-config.h
+Index: elfutils-0.159/lib/eu-config.h
+===================================================================
+--- elfutils-0.159.orig/lib/eu-config.h
++++ elfutils-0.159/lib/eu-config.h
 @@ -162,6 +162,17 @@ asm (".section predict_data, \"aw\"; .pr
  /* This macro is used by the tests conditionalize for standalone building.  */
  #define ELFUTILS_HEADER(name) <lib##name.h>
@@ -325,9 +322,11 @@
  
  #ifdef SHARED
  # define OLD_VERSION(name, version) \
---- elfutils/libasm/ChangeLog
-+++ elfutils/libasm/ChangeLog
-@@ -75,6 +75,11 @@
+Index: elfutils-0.159/libasm/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/libasm/ChangeLog
++++ elfutils-0.159/libasm/ChangeLog
+@@ -79,6 +79,11 @@
  	* asm_error.c: Add new error ASM_E_IOERROR.
  	* libasmP.h: Add ASM_E_IOERROR definition.
  
@@ -339,9 +338,11 @@
  2005-02-15  Ulrich Drepper  <drepper@redhat.com>
  
  	* Makefile.am (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
---- elfutils/libcpu/ChangeLog
-+++ elfutils/libcpu/ChangeLog
-@@ -47,6 +47,9 @@
+Index: elfutils-0.159/libcpu/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/libcpu/ChangeLog
++++ elfutils-0.159/libcpu/ChangeLog
+@@ -51,6 +51,9 @@
  
  2009-01-23  Roland McGrath  <roland@redhat.com>
  
@@ -351,7 +352,7 @@
  	* Makefile.am (i386_parse_CFLAGS): Use quotes around command
  	substitution that can produce leading whitespace.
  
-@@ -376,6 +379,11 @@
+@@ -380,6 +383,11 @@
  	* defs/i386.doc: New file.
  	* defs/x86_64: New file.
  
@@ -363,8 +364,10 @@
  2005-02-15  Ulrich Drepper  <drepper@redhat.com>
  
  	* Makefile (AM_CFLAGS): Add -Wunused -Wextra -Wformat=2.
---- elfutils/libcpu/i386_disasm.c
-+++ elfutils/libcpu/i386_disasm.c
+Index: elfutils-0.159/libcpu/i386_disasm.c
+===================================================================
+--- elfutils-0.159.orig/libcpu/i386_disasm.c
++++ elfutils-0.159/libcpu/i386_disasm.c
 @@ -822,6 +822,7 @@ i386_disasm (const uint8_t **startp, con
  
  			default:
@@ -373,9 +376,11 @@
  			}
  		    }
  		  else
---- elfutils/libdw/ChangeLog
-+++ elfutils/libdw/ChangeLog
-@@ -346,6 +346,10 @@
+Index: elfutils-0.159/libdw/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/libdw/ChangeLog
++++ elfutils-0.159/libdw/ChangeLog
+@@ -420,6 +420,10 @@
  
  	* Makefile.am (known-dwarf.h): Run gawk on config/known-dwarf.awk.
  
@@ -386,7 +391,7 @@
  2011-07-14  Mark Wielaard  <mjw@redhat.com>
  
  	* libdw.h (dwarf_offdie): Fix documentation to mention .debug_info.
-@@ -705,6 +709,10 @@
+@@ -779,6 +783,10 @@
  
  	* dwarf_hasattr_integrate.c: Integrate DW_AT_specification too.
  
@@ -397,7 +402,7 @@
  2009-08-10  Roland McGrath  <roland@redhat.com>
  
  	* dwarf_getscopevar.c: Use dwarf_diename.
-@@ -1473,6 +1481,11 @@
+@@ -1547,6 +1555,11 @@
  
  2005-05-31  Roland McGrath  <roland@redhat.com>
  
@@ -409,9 +414,11 @@
  	* dwarf_formref_die.c (dwarf_formref_die): Add CU header offset to
  	formref offset.
  
---- elfutils/libdw/dwarf_begin_elf.c
-+++ elfutils/libdw/dwarf_begin_elf.c
-@@ -48,6 +48,14 @@
+Index: elfutils-0.159/libdw/dwarf_begin_elf.c
+===================================================================
+--- elfutils-0.159.orig/libdw/dwarf_begin_elf.c
++++ elfutils-0.159/libdw/dwarf_begin_elf.c
+@@ -47,6 +47,14 @@
  #if USE_ZLIB
  # include <endian.h>
  # define crc32		loser_crc32
@@ -426,9 +433,11 @@
  # include <zlib.h>
  # undef crc32
  #endif
---- elfutils/libdw/libdw.h
-+++ elfutils/libdw/libdw.h
-@@ -879,7 +879,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (
+Index: elfutils-0.159/libdw/libdw.h
+===================================================================
+--- elfutils-0.159.orig/libdw/libdw.h
++++ elfutils-0.159/libdw/libdw.h
+@@ -891,7 +891,7 @@ extern Dwarf_OOM dwarf_new_oom_handler (
  
  
  /* Inline optimizations.  */
@@ -437,9 +446,11 @@
  /* Return attribute code of given attribute.  */
  __libdw_extern_inline unsigned int
  dwarf_whatattr (Dwarf_Attribute *attr)
---- elfutils/libdwfl/ChangeLog
-+++ elfutils/libdwfl/ChangeLog
-@@ -283,6 +283,21 @@
+Index: elfutils-0.159/libdwfl/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/libdwfl/ChangeLog
++++ elfutils-0.159/libdwfl/ChangeLog
+@@ -421,6 +421,21 @@
  	(dwfl_module_addrsym) (i_to_symfile): New function.
  	(dwfl_module_addrsym) (search_table): Use it.
  
@@ -461,7 +472,7 @@
  2013-11-07  Jan Kratochvil  <jan.kratochvil@redhat.com>
  	    Mark Wielaard  <mjw@redhat.com>
  
-@@ -2048,6 +2063,11 @@
+@@ -2186,6 +2201,11 @@
  
  2005-07-21  Roland McGrath  <roland@redhat.com>
  
@@ -473,8 +484,10 @@
  	* Makefile.am (noinst_HEADERS): Add loc2c.c.
  
  	* test2.c (main): Check sscanf result to quiet warning.
---- elfutils/libdwfl/linux-core-attach.c
-+++ elfutils/libdwfl/linux-core-attach.c
+Index: elfutils-0.159/libdwfl/linux-core-attach.c
+===================================================================
+--- elfutils-0.159.orig/libdwfl/linux-core-attach.c
++++ elfutils-0.159/libdwfl/linux-core-attach.c
 @@ -29,6 +29,35 @@
  #include "libdwflP.h"
  #include <fcntl.h>
@@ -511,40 +524,43 @@
  
  #ifndef MIN
  # define MIN(a, b) ((a) < (b) ? (a) : (b))
---- elfutils/libdwfl/linux-pid-attach.c
-+++ elfutils/libdwfl/linux-pid-attach.c
-@@ -268,13 +268,24 @@ pid_thread_detach (Dwfl_Thread *thread,
-   pid_arg->tid_attached = 0;
-   if (! pid_arg->assume_ptrace_stopped)
-     {
-+      // Older kernels (tested kernel-2.6.18-348.12.1.el5.x86_64) need special
-+      // handling of the detachment to keep the process State: T (stopped).
-+      if (pid_arg->tid_was_stopped)
-+	syscall (__NR_tkill, tid, SIGSTOP);
-       /* This handling is needed only on older Linux kernels such as
--         2.6.32-358.23.2.el6.ppc64.  Later kernels such as
--         3.11.7-200.fc19.x86_64 remember the T (stopped) state
--         themselves and no longer need to pass SIGSTOP during
--         PTRACE_DETACH.  */
-+         2.6.32-358.23.2.el6.ppc64.  Later kernels such as 3.11.7-200.fc19.x86_64
-+         remember the T (stopped) state themselves and no longer need to pass
-+         SIGSTOP during PTRACE_DETACH.  */
-       ptrace (PTRACE_DETACH, tid, NULL,
- 	      (void *) (intptr_t) (pid_arg->tid_was_stopped ? SIGSTOP : 0));
-+      if (pid_arg->tid_was_stopped)
-+	{
-+	  // Wait till the SIGSTOP settles down.
-+	  int i;
-+	  for (i = 0; i < 100000; i++)
-+	    if (linux_proc_pid_is_stopped (tid))
-+	      break;
-+	}
-     }
+Index: elfutils-0.159/libdwfl/linux-pid-attach.c
+===================================================================
+--- elfutils-0.159.orig/libdwfl/linux-pid-attach.c
++++ elfutils-0.159/libdwfl/linux-pid-attach.c
+@@ -255,6 +255,11 @@ void
+ internal_function
+ __libdwfl_ptrace_detach (pid_t tid, bool tid_was_stopped)
+ {
++  // Older kernels (tested kernel-2.6.18-348.12.1.el5.x86_64) need special
++  // handling of the detachment to keep the process State: T (stopped).
++  if (tid_was_stopped)
++    syscall (__NR_tkill, tid, SIGSTOP);
++
+   /* This handling is needed only on older Linux kernels such as
+      2.6.32-358.23.2.el6.ppc64.  Later kernels such as
+      3.11.7-200.fc19.x86_64 remember the T (stopped) state
+@@ -262,6 +267,15 @@ __libdwfl_ptrace_detach (pid_t tid, bool
+      PTRACE_DETACH.  */
+   ptrace (PTRACE_DETACH, tid, NULL,
+ 	  (void *) (intptr_t) (tid_was_stopped ? SIGSTOP : 0));
++
++  if (tid_was_stopped)
++    {
++      // Wait till the SIGSTOP settles down.
++      int i;
++      for (i = 0; i < 100000; i++)
++	if (linux_proc_pid_is_stopped (tid))
++	  break;
++    }
  }
  
---- elfutils/libebl/ChangeLog
-+++ elfutils/libebl/ChangeLog
-@@ -738,6 +738,11 @@
+ static void
+Index: elfutils-0.159/libebl/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/libebl/ChangeLog
++++ elfutils-0.159/libebl/ChangeLog
+@@ -748,6 +748,11 @@
  	* Makefile.am (libebl_*_so_SOURCES): Set to $(*_SRCS) so dependency
  	tracking works right.
  
@@ -556,9 +572,11 @@
  2005-05-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* libebl_x86_64.map: Add x86_64_core_note.
---- elfutils/libelf/ChangeLog
-+++ elfutils/libelf/ChangeLog
-@@ -85,6 +85,11 @@
+Index: elfutils-0.159/libelf/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/libelf/ChangeLog
++++ elfutils-0.159/libelf/ChangeLog
+@@ -135,6 +135,11 @@
  
  	* elf-knowledge.h (SECTION_STRIP_P): Remove < SHT_NUM check.
  
@@ -570,7 +588,7 @@
  2011-02-26  Mark Wielaard  <mjw@redhat.com>
  
  	* elf_end.c (elf_end): Call rwlock_unlock before rwlock_fini.
-@@ -762,6 +767,11 @@
+@@ -812,6 +817,11 @@
  
  	* elf.h: Update from glibc.
  
@@ -582,8 +600,10 @@
  2005-05-08  Roland McGrath  <roland@redhat.com>
  
  	* elf_begin.c (read_file) [_MUDFLAP]: Don't use mmap for now.
---- elfutils/libelf/common.h
-+++ elfutils/libelf/common.h
+Index: elfutils-0.159/libelf/common.h
+===================================================================
+--- elfutils-0.159.orig/libelf/common.h
++++ elfutils-0.159/libelf/common.h
 @@ -139,7 +139,7 @@ libelf_release_all (Elf *elf)
    (Var) = (sizeof (Var) == 1						      \
  	   ? (unsigned char) (Var)					      \
@@ -602,8 +622,10 @@
  	      : (sizeof (Var) == 4					      \
  		 ? bswap_32 (Var)					      \
  		 : bswap_64 (Var))))
---- elfutils/libelf/gnuhash_xlate.h
-+++ elfutils/libelf/gnuhash_xlate.h
+Index: elfutils-0.159/libelf/gnuhash_xlate.h
+===================================================================
+--- elfutils-0.159.orig/libelf/gnuhash_xlate.h
++++ elfutils-0.159/libelf/gnuhash_xlate.h
 @@ -1,5 +1,5 @@
  /* Conversion functions for versioning information.
 -   Copyright (C) 2006, 2007 Red Hat, Inc.
@@ -622,8 +644,10 @@
        len -= 4;
      }
  }
---- elfutils/src/addr2line.c
-+++ elfutils/src/addr2line.c
+Index: elfutils-0.159/src/addr2line.c
+===================================================================
+--- elfutils-0.159.orig/src/addr2line.c
++++ elfutils-0.159/src/addr2line.c
 @@ -540,10 +540,10 @@ handle_address (const char *string, Dwfl
        bool parsed = false;
        int i, j;
@@ -637,9 +661,11 @@
  	{
  	default:
  	  break;
---- elfutils/src/ChangeLog
-+++ elfutils/src/ChangeLog
-@@ -964,8 +964,16 @@
+Index: elfutils-0.159/src/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/src/ChangeLog
++++ elfutils-0.159/src/ChangeLog
+@@ -1112,8 +1112,16 @@
  	* readelf.c (attr_callback): Use print_block only when we don't use
  	print_ops.
  
@@ -656,7 +682,7 @@
  	* ar.c (do_oper_extract): Use pathconf instead of statfs.
  
  2009-08-01  Ulrich Drepper  <drepper@redhat.com>
-@@ -1129,6 +1137,8 @@
+@@ -1277,6 +1285,8 @@
  	* readelf.c (print_debug_frame_section): Use t instead of j formats
  	for ptrdiff_t OFFSET.
  
@@ -665,7 +691,7 @@
  2009-01-21  Ulrich Drepper  <drepper@redhat.com>
  
  	* elflint.c (check_program_header): Fix typo in .eh_frame_hdr section
-@@ -1312,6 +1322,11 @@
+@@ -1460,6 +1470,11 @@
  	that matches its PT_LOAD's p_flags &~ PF_W.  On sparc, PF_X really
  	is valid in RELRO.
  
@@ -677,7 +703,7 @@
  2008-02-29  Roland McGrath  <roland@redhat.com>
  
  	* readelf.c (print_attributes): Add a cast.
-@@ -1563,6 +1578,8 @@
+@@ -1711,6 +1726,8 @@
  
  	* readelf.c (hex_dump): Fix rounding error in whitespace calculation.
  
@@ -686,7 +712,7 @@
  2007-10-15  Roland McGrath  <roland@redhat.com>
  
  	* make-debug-archive.in: New file.
-@@ -2002,6 +2019,10 @@
+@@ -2150,6 +2167,10 @@
  	* elflint.c (valid_e_machine): Add EM_ALPHA.
  	Reported by Christian Aichinger <Greek0@gmx.net>.
  
@@ -697,7 +723,7 @@
  2006-08-08  Ulrich Drepper  <drepper@redhat.com>
  
  	* elflint.c (check_dynamic): Don't require DT_HASH for DT_SYMTAB.
-@@ -2078,6 +2099,10 @@
+@@ -2226,6 +2247,10 @@
  	* Makefile.am: Add hacks to create dependency files for non-generic
  	linker.
  
@@ -708,7 +734,7 @@
  2006-06-12  Ulrich Drepper  <drepper@redhat.com>
  
  	* ldgeneric.c (ld_generic_generate_sections): Don't create .interp
-@@ -2426,6 +2451,11 @@
+@@ -2574,6 +2599,11 @@
  	* readelf.c (print_debug_loc_section): Fix indentation for larger
  	address size.
  
@@ -720,8 +746,10 @@
  2005-05-30  Roland McGrath  <roland@redhat.com>
  
  	* readelf.c (print_debug_line_section): Print section offset of each
---- elfutils/src/findtextrel.c
-+++ elfutils/src/findtextrel.c
+Index: elfutils-0.159/src/findtextrel.c
+===================================================================
+--- elfutils-0.159.orig/src/findtextrel.c
++++ elfutils-0.159/src/findtextrel.c
 @@ -496,7 +496,11 @@ ptrcompare (const void *p1, const void *
  
  
@@ -735,8 +763,10 @@
  	   GElf_Addr addr, Elf *elf, Elf_Scn *symscn, Dwarf *dw,
  	   const char *fname, bool more_than_one, void **knownsrcs)
  {
---- elfutils/src/ld.h
-+++ elfutils/src/ld.h
+Index: elfutils-0.159/src/ld.h
+===================================================================
+--- elfutils-0.159.orig/src/ld.h
++++ elfutils-0.159/src/ld.h
 @@ -1114,6 +1114,7 @@ extern bool dynamically_linked_p (void);
  
  /* Checked whether the symbol is undefined and referenced from a DSO.  */
@@ -752,21 +782,27 @@
 +#endif	/* Optimizing and not GCC 4.2.  */
  
  #endif	/* ld.h */
---- elfutils/src/Makefile.am
-+++ elfutils/src/Makefile.am
-@@ -95,6 +95,9 @@ addr2line_no_Wformat = yes
+Index: elfutils-0.159/src/Makefile.am
+===================================================================
+--- elfutils-0.159.orig/src/Makefile.am
++++ elfutils-0.159/src/Makefile.am
+@@ -89,6 +89,11 @@ endif
  # XXX While the file is not finished, don't warn about this
  ldgeneric_no_Wunused = yes
  
-+# Buggy old compilers.
++# Buggy old compilers or libc headers.
 +readelf_no_Werror = yes
++strings_no_Werror = yes
++addr2line_no_Wformat = yes
 +
- readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl
- nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) $(libmudflap) -ldl \
+ readelf_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl
+ nm_LDADD = $(libdw) $(libebl) $(libelf) $(libeu) -ldl \
  	   $(demanglelib)
---- elfutils/src/readelf.c
-+++ elfutils/src/readelf.c
-@@ -4171,10 +4171,12 @@ listptr_base (struct listptr *p)
+Index: elfutils-0.159/src/readelf.c
+===================================================================
+--- elfutils-0.159.orig/src/readelf.c
++++ elfutils-0.159/src/readelf.c
+@@ -4239,10 +4239,12 @@ listptr_base (struct listptr *p)
    return base;
  }
  
@@ -781,7 +817,7 @@
    struct listptr *p1 = (void *) a;
    struct listptr *p2 = (void *) b;
  
-@@ -4263,8 +4265,11 @@ static void
+@@ -4331,8 +4333,11 @@ static void
  sort_listptr (struct listptr_table *table, const char *name)
  {
    if (table->n > 0)
@@ -795,7 +831,7 @@
  }
  
  static bool
-@@ -9151,7 +9156,7 @@ dump_archive_index (Elf *elf, const char
+@@ -9252,7 +9257,7 @@ dump_archive_index (Elf *elf, const char
  	  if (unlikely (elf_rand (elf, as_off) == 0)
  	      || unlikely ((subelf = elf_begin (-1, ELF_C_READ_MMAP, elf))
  			   == NULL))
@@ -804,8 +840,10 @@
  	    while (1)
  #endif
  	      error (EXIT_FAILURE, 0,
---- elfutils/src/strings.c
-+++ elfutils/src/strings.c
+Index: elfutils-0.159/src/strings.c
+===================================================================
+--- elfutils-0.159.orig/src/strings.c
++++ elfutils-0.159/src/strings.c
 @@ -43,6 +43,10 @@
  
  #include <system.h>
@@ -817,7 +855,7 @@
  
  /* Prototypes of local functions.  */
  static int read_fd (int fd, const char *fname, off64_t fdlen);
-@@ -483,8 +487,13 @@ map_file (int fd, off64_t start_off, off
+@@ -489,8 +493,13 @@ map_file (int fd, off64_t start_off, off
  		    fd, start_off);
        if (mem != MAP_FAILED)
  	{
@@ -831,7 +869,7 @@
  	  break;
  	}
        if (errno != EINVAL && errno != ENOMEM)
-@@ -576,9 +585,11 @@ read_block (int fd, const char *fname, o
+@@ -581,9 +590,11 @@ read_block (int fd, const char *fname, o
        elfmap_off = from & ~(ps - 1);
        elfmap_base = elfmap = map_file (fd, elfmap_off, fdlen, &elfmap_size);
  
@@ -843,8 +881,10 @@
      }
  
    if (unlikely (elfmap == MAP_FAILED))
---- elfutils/src/strip.c
-+++ elfutils/src/strip.c
+Index: elfutils-0.159/src/strip.c
+===================================================================
+--- elfutils-0.159.orig/src/strip.c
++++ elfutils-0.159/src/strip.c
 @@ -45,6 +45,12 @@
  #include <libebl.h>
  #include <system.h>
@@ -877,7 +917,7 @@
      }
  
    /* Open the file.  */
-@@ -2060,7 +2076,7 @@ while computing checksum for debug infor
+@@ -2086,7 +2102,7 @@ while computing checksum for debug infor
    /* If requested, preserve the timestamp.  */
    if (tvp != NULL)
      {
@@ -886,7 +926,7 @@
  	{
  	  error (0, errno, gettext ("\
  cannot set access and modification date of '%s'"),
-@@ -2117,7 +2133,7 @@ handle_ar (int fd, Elf *elf, const char
+@@ -2143,7 +2159,7 @@ handle_ar (int fd, Elf *elf, const char
  
    if (tvp != NULL)
      {
@@ -895,8 +935,10 @@
  	{
  	  error (0, errno, gettext ("\
  cannot set access and modification date of '%s'"), fname);
---- elfutils/tests/backtrace.c
-+++ elfutils/tests/backtrace.c
+Index: elfutils-0.159/tests/backtrace.c
+===================================================================
+--- elfutils-0.159.orig/tests/backtrace.c
++++ elfutils-0.159/tests/backtrace.c
 @@ -36,6 +36,7 @@
  #include <fcntl.h>
  #include <string.h>
@@ -904,10 +946,12 @@
 +#include <sys/syscall.h>
  #include ELFUTILS_HEADER(dwfl)
  
- static int
---- elfutils/tests/ChangeLog
-+++ elfutils/tests/ChangeLog
-@@ -123,6 +123,13 @@
+ #ifndef __linux__
+Index: elfutils-0.159/tests/ChangeLog
+===================================================================
+--- elfutils-0.159.orig/tests/ChangeLog
++++ elfutils-0.159/tests/ChangeLog
+@@ -283,6 +283,13 @@
  
  2013-12-02  Jan Kratochvil  <jan.kratochvil@redhat.com>
  
@@ -921,7 +965,7 @@
  	* Makefile.am (check_PROGRAMS): Add backtrace, backtrace-child,
  	backtrace-data and backtrace-dwarf.
  	(BUILT_SOURCES, clean-local, backtrace-child-biarch): New.
-@@ -987,6 +994,8 @@
+@@ -1147,6 +1154,8 @@
  
  2008-01-21  Roland McGrath  <roland@redhat.com>
  
@@ -930,7 +974,7 @@
  	* testfile45.S.bz2: Add tests for cltq, cqto.
  	* testfile45.expect.bz2: Adjust.
  
-@@ -1695,6 +1704,11 @@
+@@ -1855,6 +1864,11 @@
  	* Makefile.am (TESTS): Add run-elflint-test.sh.
  	(EXTRA_DIST): Add run-elflint-test.sh and testfile18.bz2.
  
@@ -942,8 +986,10 @@
  2005-05-24  Ulrich Drepper  <drepper@redhat.com>
  
  	* get-files.c (main): Use correct format specifier.
---- elfutils/tests/line2addr.c
-+++ elfutils/tests/line2addr.c
+Index: elfutils-0.159/tests/line2addr.c
+===================================================================
+--- elfutils-0.159.orig/tests/line2addr.c
++++ elfutils-0.159/tests/line2addr.c
 @@ -124,7 +124,7 @@ main (int argc, char *argv[])
      {
        struct args a = { .arg = argv[cnt] };
@@ -953,3 +999,15 @@
  	{
  	default:
  	case 0:
+Index: elfutils-0.159/tests/Makefile.am
+===================================================================
+--- elfutils-0.159.orig/tests/Makefile.am
++++ elfutils-0.159/tests/Makefile.am
+@@ -356,6 +356,7 @@ get_lines_LDADD = $(libdw) $(libelf)
+ get_files_LDADD = $(libdw) $(libelf)
+ get_aranges_LDADD = $(libdw) $(libelf)
+ allfcts_LDADD = $(libdw) $(libelf)
++line2addr_no_Wformat = yes
+ line2addr_LDADD = $(libdw)
+ addrscopes_LDADD = $(libdw)
+ funcscopes_LDADD = $(libdw)
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch b/meta/recipes-devtools/elfutils/elfutils-0.160/scanf-format.patch
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/scanf-format.patch
rename to meta/recipes-devtools/elfutils/elfutils-0.160/scanf-format.patch
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff b/meta/recipes-devtools/elfutils/elfutils-0.160/testsuite-ignore-elflint.diff
similarity index 100%
rename from meta/recipes-devtools/elfutils/elfutils-0.158/testsuite-ignore-elflint.diff
rename to meta/recipes-devtools/elfutils/elfutils-0.160/testsuite-ignore-elflint.diff
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.158.bb b/meta/recipes-devtools/elfutils/elfutils_0.160.bb
similarity index 87%
rename from meta/recipes-devtools/elfutils/elfutils_0.158.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.160.bb
index 42724a1..e02918e 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.158.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.160.bb
@@ -7,14 +7,20 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "050a4909e452d01ab4747fd69d4036e0"
-SRC_URI[sha256sum] = "be27af5c21352f53e010342bf1c68e0b9e18232dbf3adec7e2f9b41f6bbe397d"
+SRC_URI[md5sum] = "7527f22dff8b1ac8c122cfc4d3d3bb1e"
+SRC_URI[sha256sum] = "741b556863c069ceab2d81eb54aeda8c34f46728859704eaf9baef8503e9a9d1"
 
-# Pick patches from debian
-# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.158-2.debian.tar.xz
+SRC_URI += "\
+        file://mempcpy.patch \
+        file://dso-link-change.patch \
+        file://Fix_elf_cvt_gunhash.patch \
+        file://fixheadercheck.patch \
+"
+
+# pick the patch from debian
+# http://ftp.de.debian.org/debian/pool/main/e/elfutils/elfutils_0.159-4.debian.tar.xz
 SRC_URI += "\
         file://redhat-portability.diff \
-        file://redhat-robustify.diff \
         file://hppa_backend.diff \
         file://arm_backend.diff \
         file://mips_backend.diff \
@@ -22,15 +28,9 @@ SRC_URI += "\
         file://testsuite-ignore-elflint.diff \
         file://scanf-format.patch \
         file://mips_readelf_w.patch \
-        file://core_filename.patch \
-        file://CVE-2014-0172.patch \
-        file://unwind_non_linux.patch \
-        file://elf_additions.diff \
-        file://mempcpy.patch \
-        file://dso-link-change.patch \
-        file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
-        file://fixheadercheck.patch \
-        file://Fix_elf_cvt_gunhash.patch \
+        file://arm_func_value.patch \
+        file://arm_unwind_ret_mask.patch \
+        file://non_linux.patch \
 "
 
 # Only apply when building uclibc based target recipe
-- 
1.9.1


