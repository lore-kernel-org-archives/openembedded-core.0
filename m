Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id D27BB6FC13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 08:50:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4S8o7hA007219
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 28 May 2014 01:50:07 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Wed, 28 May 2014 01:50:06 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 May 2014 16:49:58 +0800
Message-ID: <758f6a574321b2ce51050d35f3186e56f2a089f9.1401266833.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1401266832.git.hongxu.jia@windriver.com>
References: <cover.1401266832.git.hongxu.jia@windriver.com>
MIME-Version: 1.0
Cc: saul.wold@intel.com
Subject: [PATCH 2/3] elfutils: upgrade to 0.158
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
X-List-Received-Date: Wed, 28 May 2014 08:50:07 -0000
Content-Type: text/plain

Add 'm4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch' to fix cross compiling failure;

Rebase 'elf_additions.diff' for 0.158;

Drop obsolete patches:
- nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch
- elfutils-ar-c-fix-num-passed-to-memset.patch
- fix-build-gcc-4.8.patch

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../elfutils/elfutils-0.158/elf_additions.diff     | 77 ++++++++++++++++++++++
 ...4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch | 34 ++++++++++
 .../{elfutils_0.155.bb => elfutils_0.158.bb}       | 21 ++----
 3 files changed, 118 insertions(+), 14 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
 create mode 100644 meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
 rename meta/recipes-devtools/elfutils/{elfutils_0.155.bb => elfutils_0.158.bb} (81%)

diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff b/meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
new file mode 100644
index 0000000..671c8ee
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/elf_additions.diff
@@ -0,0 +1,77 @@
+Upstream-Status: Backport
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ libelf/elf.h | 27 +++++++++++++++++++++++++--
+ 1 file changed, 25 insertions(+), 2 deletions(-)
+
+diff --git a/libelf/elf.h b/libelf/elf.h
+--- a/libelf/elf.h
++++ b/libelf/elf.h
+@@ -142,6 +142,7 @@ typedef struct
+ #define ELFOSABI_NETBSD		2	/* NetBSD.  */
+ #define ELFOSABI_GNU		3	/* Object uses GNU ELF extensions.  */
+ #define ELFOSABI_LINUX		ELFOSABI_GNU /* Compatibility alias.  */
++#define ELFOSABI_HURD		4	/* GNU/Hurd */
+ #define ELFOSABI_SOLARIS	6	/* Sun Solaris.  */
+ #define ELFOSABI_AIX		7	/* IBM AIX.  */
+ #define ELFOSABI_IRIX		8	/* SGI Irix.  */
+@@ -149,8 +150,13 @@ typedef struct
+ #define ELFOSABI_TRU64		10	/* Compaq TRU64 UNIX.  */
+ #define ELFOSABI_MODESTO	11	/* Novell Modesto.  */
+ #define ELFOSABI_OPENBSD	12	/* OpenBSD.  */
++#define ELFOSABI_OPENVMS	13	/* OpenVMS */
++#define ELFOSABI_NSK		14	/* Hewlett-Packard Non-Stop Kernel */
++#define ELFOSABI_AROS		15	/* Amiga Research OS */
++/* 64-255 Architecture-specific value range */
+ #define ELFOSABI_ARM_AEABI	64	/* ARM EABI */
+ #define ELFOSABI_ARM		97	/* ARM */
++/* This is deprecated? It's not in the latest version anymore. */
+ #define ELFOSABI_STANDALONE	255	/* Standalone (embedded) application */
+ 
+ #define EI_ABIVERSION	8		/* ABI version */
+@@ -205,7 +211,7 @@ typedef struct
+ #define EM_H8_300H	47		/* Hitachi H8/300H */
+ #define EM_H8S		48		/* Hitachi H8S */
+ #define EM_H8_500	49		/* Hitachi H8/500 */
+-#define EM_IA_64	50		/* Intel Merced */
++#define EM_IA_64	50		/* Intel IA64 */
+ #define EM_MIPS_X	51		/* Stanford MIPS-X */
+ #define EM_COLDFIRE	52		/* Motorola Coldfire */
+ #define EM_68HC12	53		/* Motorola M68HC12 */
+@@ -219,7 +225,8 @@ typedef struct
+ #define EM_TINYJ	61		/* Advanced Logic Corp. Tinyj emb.fam*/
+ #define EM_X86_64	62		/* AMD x86-64 architecture */
+ #define EM_PDSP		63		/* Sony DSP Processor */
+-
++#define EM_PDP10	64		/* Digital Equipment Corp. PDP-10 */
++#define EM_PDP11	65		/* Digital Equipment Corp. PDP-11 */
+ #define EM_FX66		66		/* Siemens FX66 microcontroller */
+ #define EM_ST9PLUS	67		/* STMicroelectronics ST9+ 8/16 mc */
+ #define EM_ST7		68		/* STmicroelectronics ST7 8 bit mc */
+@@ -249,6 +256,22 @@ typedef struct
+ #define EM_OPENRISC	92		/* OpenRISC 32-bit embedded processor */
+ #define EM_ARC_A5	93		/* ARC Cores Tangent-A5 */
+ #define EM_XTENSA	94		/* Tensilica Xtensa Architecture */
++#define EM_VIDEOCORE 95		/* Alphamosaic VideoCore processor */
++#define EM_TMM_GPP	96		/* Thompson Multimedia General Purpose Processor */
++#define EM_NS32K	97		/* National Semiconductor 32000 series */
++#define EM_TPC		98		/* Tenor Network TPC processor */
++#define EM_SNP1K	99		/* Trebia SNP 1000 processor */
++#define EM_ST200	100		/* STMicroelectronics (www.st.com) ST200 microcontroller */
++#define EM_IP2K 	101		/* Ubicom IP2XXX microcontroller family */
++#define EM_MAX		102		/* MAX Processor */
++#define EM_CR		103		/* National Semiconductor CompactRISC */
++#define EM_F2MC16	104		/* Fujitsu F2MC16 */
++#define EM_MSP430	105		/* TI msp430 micro controller */
++#define EM_BLACKFIN	106		/* Analog Devices Blackfin (DSP) processor */
++#define EM_SE_C33	107		/* S1C33 Family of Seiko Epson processors */
++#define EM_SEP		108		/* Sharp embedded microprocessor */
++#define EM_ARCA 	109		/* Arca RISC Microprocessor */
++
+ #define EM_AARCH64	183		/* ARM AARCH64 */
+ #define EM_TILEPRO	188		/* Tilera TILEPro */
+ #define EM_MICROBLAZE	189		/* Xilinx MicroBlaze */
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch b/meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
new file mode 100644
index 0000000..1dbd52d
--- /dev/null
+++ b/meta/recipes-devtools/elfutils/elfutils-0.158/m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch
@@ -0,0 +1,34 @@
+m4/biarch.m4: tweak AC_RUN_IFELSE for cross-compiling
+
+Macro: AC_RUN_IFELSE (input,
+                      [action-if-true],
+                      [action-if-false],
+                      [action-if-cross-compiling])
+
+Add the missing [action-if-cross-compiling] part to support
+cross-compiling.
+
+Upstream-Status: inappropriate [oe specific]
+
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ m4/biarch.m4 | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/m4/biarch.m4 b/m4/biarch.m4
+--- a/m4/biarch.m4
++++ b/m4/biarch.m4
+@@ -40,7 +40,9 @@ AC_CACHE_CHECK([whether $biarch_CC makes executables we can run],
+ save_CC="$CC"
+ CC="$biarch_CC"
+ AC_RUN_IFELSE([AC_LANG_PROGRAM([], [])],
+-	      utrace_cv_cc_biarch=yes, utrace_cv_cc_biarch=no)
++	      utrace_cv_cc_biarch=yes,
++	      utrace_cv_cc_biarch=no,
++	      utrace_cv_cc_biarch=yes)
+ CC="$save_CC"])], [utrace_cv_cc_biarch=no])
+ AS_IF([test $utrace_cv_cc_biarch != yes], [dnl
+ AC_MSG_WARN([not running biarch tests, $biarch_CC does not work])])])
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.155.bb b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
similarity index 81%
rename from meta/recipes-devtools/elfutils/elfutils_0.155.bb
rename to meta/recipes-devtools/elfutils/elfutils_0.158.bb
index b1f410c..c97be74 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.155.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.158.bb
@@ -7,23 +7,16 @@ DEPENDS = "libtool bzip2 zlib virtual/libintl"
 
 SRC_URI = "https://fedorahosted.org/releases/e/l/elfutils/${PV}/elfutils-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "163a5712b86f6bdfebdf233cc6e2192d"
-SRC_URI[sha256sum] = "68444a4526416ffd68852ec3c6a40ceddcca46538297322405319884c5d30ed8"
+SRC_URI[md5sum] = "050a4909e452d01ab4747fd69d4036e0"
+SRC_URI[sha256sum] = "be27af5c21352f53e010342bf1c68e0b9e18232dbf3adec7e2f9b41f6bbe397d"
 
-SRC_URI += "\
-        file://redhat-portability.diff \
-        file://redhat-robustify.diff \
-        file://hppa_backend.diff \
-        file://arm_backend.diff \
-        file://mips_backend.diff \
-        file://m68k_backend.diff \
-        file://elf_additions.diff \
-        file://mempcpy.patch \
+SRC_URI += " \
+	file://elf_additions.diff \
+	file://mempcpy.patch \
 	file://dso-link-change.patch \
-	file://nm-Fix-size-passed-to-snprintf-for-invalid-sh_name-case.patch \
-	file://elfutils-ar-c-fix-num-passed-to-memset.patch \
-	file://fix-build-gcc-4.8.patch \
+	file://m4-biarch.m4-tweak-AC_RUN_IFELSE-for-cross-compiling.patch \
 "
+
 # Only apply when building uclibc based target recipe
 SRC_URI_append_libc-uclibc = " file://uclibc-support.patch"
 
-- 
1.8.1.2


