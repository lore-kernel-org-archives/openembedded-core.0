Return-Path: <cristian.iorga@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 414956E905
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Feb 2014 16:39:41 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 12 Feb 2014 08:39:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,833,1384329600"; d="scan'208";a="482281855"
Received: from sentry.rb.intel.com ([10.237.105.54])
	by orsmga002.jf.intel.com with ESMTP; 12 Feb 2014 08:39:40 -0800
From: Cristian Iorga <cristian.iorga@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Feb 2014 18:42:32 +0200
Message-Id: <eb0f3a15e44a1bce0ec998042e2b4f299c246e55.1392223206.git.cristian.iorga@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1392223206.git.cristian.iorga@intel.com>
References: <cover.1392223206.git.cristian.iorga@intel.com>
In-Reply-To: <cover.1392223206.git.cristian.iorga@intel.com>
References: <cover.1392223206.git.cristian.iorga@intel.com>
Subject: [PATCH v2 3/3] flac: upgrade to 1.3.0
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
X-List-Received-Date: Wed, 12 Feb 2014 16:39:42 -0000

- Updated description, bugtracker and source;
- Switched to ${BP} variable;
- 0001-No-AltiVec-on-SPE.patch,
flac-gcc43-fixes.patch, asm-pic.patch,
obsolete_automake_macros.patch patches
removed, included in upstream;
- Licenses checksums changed due to added
copyright owners and street adresses changed;
- Backported 1.3.0 specific fix;
- Removed obsolete PPC fix;
- Added support for SSE optimizations;
- Removed default ${S} definition;
- Removed xmms unneeded prefixes.

Build on all qemu arch;
Tested on qemux86-64 and qemuppc.

Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
---
 .../flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch   |  78 -----------
 .../flac/flac-1.2.1/asm-pic.patch                  |  99 --------------
 .../flac/flac-1.2.1/disable-xmms-plugin.patch      |  25 ----
 .../flac/flac-1.2.1/flac-gcc43-fixes.patch         |  15 ---
 .../flac/flac-1.2.1/obsolete_automake_macros.patch |  14 --
 meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4    | 149 ---------------------
 .../0001-Fix-Makefile.am-altivec-logic.patch       |  35 +++++
 .../flac/{flac_1.2.1.bb => flac_1.3.0.bb}          |  50 +++----
 8 files changed, 52 insertions(+), 413 deletions(-)
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
 create mode 100644 meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
 rename meta/recipes-multimedia/flac/{flac_1.2.1.bb => flac_1.3.0.bb} (42%)

diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch b/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
deleted file mode 100644
index 5ca8b35..0000000
--- a/meta/recipes-multimedia/flac/flac-1.2.1/0001-No-AltiVec-on-SPE.patch
+++ /dev/null
@@ -1,78 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-From f9b017c2c958d968cc5dfd36dc68fc8e5fb89a58 Mon Sep 17 00:00:00 2001
-From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
-Date: Fri, 11 Jun 2010 09:48:58 +0200
-Subject: [PATCH] No AltiVec on SPE
-
-Consider *gnuspe which matches powerpc-unknown-linux-gnuspe where
-AltiVec is not available at all. This triplet uses SPE which is
-incompatible with AltiVec shares the same opcode range and can't be used
-at all.
-
-Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
----
- configure.in            |    8 ++++++++
- src/libFLAC/Makefile.am |   10 +++++++++-
- 2 files changed, 17 insertions(+), 1 deletions(-)
-
-diff --git a/configure.in b/configure.in
-index bfa6d8e..17b7c73 100644
---- a/configure.in
-+++ b/configure.in
-@@ -82,6 +82,14 @@ case "$host" in
- 	*) OBJ_FORMAT=elf ;;
- esac
- AC_SUBST(OBJ_FORMAT)
-+case "$host" in
-+	*-gnuspe)
-+		abi_spe=true
-+		AC_DEFINE(FLAC__CPU_PPC_SPE)
-+		AH_TEMPLATE(FLAC__CPU_PPC_SPE, [define if building for PowerPC with SPE ABI])
-+		;;
-+esac
-+AM_CONDITIONAL(FLaC__CPU_PPC_SPE, test "x$abi_spe" = xtrue)
- 
- # only needed because of ntohl() usage, can get rid of after that's gone:
- case "$host" in
-diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
-index cbfb0ac..5785372 100644
---- a/src/libFLAC/Makefile.am
-+++ b/src/libFLAC/Makefile.am
-@@ -40,8 +40,15 @@ if FLaC__SYS_DARWIN
- CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
- else
- # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
-+CPUCFLAGS =
-+if FLaC__CPU_PPC_SPE
-+else
-+if FLaC__USE_ALTIVEC
-+CPUCFLAGS += -maltivec -mabi=altivec
-+endif
-+endif
- #@@@ PPC optimizations temporarily disabled
--CPUCFLAGS = -maltivec -mabi=altivec -DFLAC__NO_ASM
-+CPUCFLAGS += -DFLAC__NO_ASM
- endif
- endif
- 
-@@ -58,6 +63,8 @@ endif
- if FLaC__CPU_PPC
- ARCH_SUBDIRS = ppc
- if FLaC__HAS_AS__TEMPORARILY_DISABLED
-+if FLaC__CPU_PPC_SPE
-+else
- LOCAL_EXTRA_LIBADD = ppc/as/libFLAC-asm.la
- LOCAL_EXTRA_LDFLAGS = "-Wl,-read_only_relocs,warning"
- else
-@@ -68,6 +75,7 @@ endif
- endif
- endif
- endif
-+endif
- 
- libFLAC_la_LIBADD = $(LOCAL_EXTRA_LIBADD) @OGG_LIBS@
- 
--- 
-1.5.6.5
-
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch b/meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch
deleted file mode 100644
index 43f29cf..0000000
--- a/meta/recipes-multimedia/flac/flac-1.2.1/asm-pic.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 12022d90dd3adc9f37dc2b16358cbecfe3c5be1c Mon Sep 17 00:00:00 2001
-From: Samuli Suominen <drac@gentoo.org>
-Date: Sun, 15 Jul 2012 15:45:10 +1000
-Subject: [PATCH] Fix assembler code to make it PIC so the dynamic linker does
- not have to do text relocations on-the-fly. Patch from Gentoo
- via Jaren Stangret <sirjaren@gmail.com>
-
-Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
----
- src/libFLAC/ia32/bitreader_asm.nasm |   27 +++++++++++++++++++++++++++
- 1 files changed, 27 insertions(+), 0 deletions(-)
-
-diff --git a/src/libFLAC/ia32/bitreader_asm.nasm b/src/libFLAC/ia32/bitreader_asm.nasm
-index c6bb8c2..4cd0ea2 100644
---- a/src/libFLAC/ia32/bitreader_asm.nasm
-+++ b/src/libFLAC/ia32/bitreader_asm.nasm
-@@ -140,8 +140,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
- %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
- 	mov	edi, _FLAC__crc16_table
- %else
-+%ifdef OBJ_FORMAT_elf
-+	mov	edi, [esp + 16]		;		saved ebx (GOT base)
-+	lea	edi, [edi + FLAC__crc16_table wrt ..gotoff]
-+%else
- 	mov	edi, FLAC__crc16_table
- %endif
-+%endif
- 	;; eax (ax)	crc a.k.a. br->read_crc
- 	;; ebx (bl)	intermediate result index into FLAC__crc16_table[]
- 	;; ecx		br->crc16_align
-@@ -216,8 +221,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
- %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
- 	mov	edi, _FLAC__crc16_table
- %else
-+%ifdef OBJ_FORMAT_elf
-+	mov	edi, [esp + 16]		;		saved ebx (GOT base)
-+	lea	edi, [edi + FLAC__crc16_table wrt ..gotoff]
-+%else
- 	mov	edi, FLAC__crc16_table
- %endif
-+%endif
- 	;; eax (ax)	crc a.k.a. br->read_crc
- 	;; ebx (bl)	intermediate result index into FLAC__crc16_table[]
- 	;; ecx		br->crc16_align
-@@ -316,8 +326,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
- %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
- 	call	_bitreader_read_from_client_
- %else
-+%ifdef OBJ_FORMAT_elf
-+	mov	ebx, [esp + 20]		;		saved ebx (GOT base)
-+	call	bitreader_read_from_client_ wrt ..plt
-+%else
- 	call	bitreader_read_from_client_
- %endif
-+%endif
- 	pop	edx			;     /* discard, unused */
- 	pop	ecx			;     /* restore */
- 	mov	esi, [ebp + 16]		;     cwords = br->consumed_words;
-@@ -363,13 +378,20 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
- 	mov	[ebp + 16], esi		;       br->consumed_words = cwords;
- 	mov	[ebp + 20], ecx		;       br->consumed_bits = cbits;
- 	push	ecx			;       /* save */
-+	push	ebx			;       /* save */
- 	push	ebp			;       /* push br argument */
- %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
- 	call	_bitreader_read_from_client_
- %else
-+%ifdef OBJ_FORMAT_elf
-+	mov	ebx, [esp + 24]		;		saved ebx (GOT base)
-+	call	bitreader_read_from_client_ wrt ..plt
-+%else
- 	call	bitreader_read_from_client_
- %endif
-+%endif
- 	pop	edx			;       /* discard, unused */
-+	pop	ebx			;       /* restore */
- 	pop	ecx			;       /* restore */
- 	mov	esi, [ebp + 16]		;       cwords = br->consumed_words;
- 					;       ucbits = (br->words-cwords)*FLAC__BITS_PER_WORD + br->bytes*8 - cbits;
-@@ -438,8 +460,13 @@ cident FLAC__bitreader_read_rice_signed_block_asm_ia32_bswap
- %ifdef FLAC__PUBLIC_NEEDS_UNDERSCORE
- 	mov	edi, _FLAC__crc16_table
- %else
-+%ifdef OBJ_FORMAT_elf
-+	mov	edi, [esp + 24]		;		saved ebx (GOT base)
-+	lea	edi, [edi + FLAC__crc16_table wrt ..gotoff]
-+%else
- 	mov	edi, FLAC__crc16_table
- %endif
-+%endif
- 	;; eax (ax)	crc a.k.a. br->read_crc
- 	;; ebx (bl)	intermediate result index into FLAC__crc16_table[]
- 	;; ecx		br->crc16_align
--- 
-1.7.2.5
-
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch b/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
deleted file mode 100644
index 80769a8..0000000
--- a/meta/recipes-multimedia/flac/flac-1.2.1/disable-xmms-plugin.patch
+++ /dev/null
@@ -1,25 +0,0 @@
-# Acquired from OpenEmbedded
-Upstream-Status: Inappropriate [disable feature]
-
-diff -ruN flac-1.2.1-orig/src/Makefile.am flac-1.2.1-new/src/Makefile.am
---- flac-1.2.1-orig/src/Makefile.am	2010-06-23 15:06:29.167865355 +0800
-+++ flac-1.2.1-new/src/Makefile.am	2010-06-25 16:23:05.555202728 +0800
-@@ -15,10 +15,6 @@
- #  restrictive of those mentioned above.  See the file COPYING.Xiph in this
- #  distribution.
- 
--if FLaC__HAS_XMMS
--XMMS_DIRS = plugin_common plugin_xmms
--endif
--
- if FLaC__WITH_CPPLIBS
- CPPLIBS_DIRS = libFLAC++ test_libFLAC++
- endif
-@@ -29,7 +25,6 @@
- 	flac \
- 	metaflac \
- 	monkeys_audio_utilities \
--	$(XMMS_DIRS) \
- 	plugin_winamp2 \
- 	test_grabbag \
- 	test_libs_common \
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch b/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
deleted file mode 100644
index 6b66599..0000000
--- a/meta/recipes-multimedia/flac/flac-1.2.1/flac-gcc43-fixes.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-# Acquired from OpenEmbedded
-# Fix no declaration of memcmp()
-Upstream-Status: Submitted
-
-diff -urN flac-1.2.1-orig/examples/cpp/encode/file/main.cpp flac-1.2.1/examples/cpp/encode/file/main.cpp
---- flac-1.2.1-orig/examples/cpp/encode/file/main.cpp	2010-06-23 15:06:29.159481339 +0800
-+++ flac-1.2.1/examples/cpp/encode/file/main.cpp	2010-06-23 15:06:46.233384883 +0800
-@@ -30,6 +30,7 @@
- 
- #include <stdio.h>
- #include <stdlib.h>
-+#include <string.h>
- #include "FLAC++/metadata.h"
- #include "FLAC++/encoder.h"
- 
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch b/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
deleted file mode 100644
index aa060a4..0000000
--- a/meta/recipes-multimedia/flac/flac-1.2.1/obsolete_automake_macros.patch
+++ /dev/null
@@ -1,14 +0,0 @@
-Upstream-Status: Backport [https://sourceforge.net/p/flac/support-requests/146/]
-
-Signed-off-by: Marko Lindqvist <cazfi74@gmail.com>
-diff -Nurd flac-1.2.1/configure.in flac-1.2.1/configure.in
---- flac-1.2.1/configure.in	2007-09-13 18:48:42.000000000 +0300
-+++ flac-1.2.1/configure.in	2013-01-03 08:20:07.454704587 +0200
-@@ -44,7 +44,7 @@
- AC_CHECK_SIZEOF(void*,0)
-
- #@@@ new name is AC_CONFIG_HEADERS
--AM_CONFIG_HEADER(config.h)
-+AC_CONFIG_HEADERS(config.h)
-
- AC_C_BIGENDIAN
diff --git a/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4 b/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
deleted file mode 100644
index 5e250cd..0000000
--- a/meta/recipes-multimedia/flac/flac-1.2.1/xmms.m4
+++ /dev/null
@@ -1,149 +0,0 @@
-# CFLAGS and library paths for XMMS
-# written 15 December 1999 by Ben Gertzfield <che@debian.org>
-# Acquired from OpenEmbedded
-
-dnl Usage:
-dnl AM_PATH_XMMS([MINIMUM-VERSION, [ACTION-IF-FOUND [, ACTION-IF-NOT-FOUND]]])
-dnl
-dnl Example:
-dnl AM_PATH_XMMS(0.9.5.1, , AC_MSG_ERROR([*** XMMS >= 0.9.5.1 not installed - please install first ***]))
-dnl
-dnl Defines XMMS_CFLAGS, XMMS_LIBS, XMMS_DATA_DIR, XMMS_PLUGIN_DIR, 
-dnl XMMS_VISUALIZATION_PLUGIN_DIR, XMMS_INPUT_PLUGIN_DIR, 
-dnl XMMS_OUTPUT_PLUGIN_DIR, XMMS_GENERAL_PLUGIN_DIR, XMMS_EFFECT_PLUGIN_DIR,
-dnl and XMMS_VERSION for your plugin pleasure.
-dnl
-
-dnl XMMS_TEST_VERSION(AVAILABLE-VERSION, NEEDED-VERSION [, ACTION-IF-OKAY [, ACTION-IF-NOT-OKAY]])
-AC_DEFUN(XMMS_TEST_VERSION, [
-
-# Determine which version number is greater. Prints 2 to stdout if	
-# the second number is greater, 1 if the first number is greater,	
-# 0 if the numbers are equal.						
-									
-# Written 15 December 1999 by Ben Gertzfield <che@debian.org>		
-# Revised 15 December 1999 by Jim Monty <monty@primenet.com>		
-									
-    AC_PROG_AWK
-    xmms_got_version=[` $AWK '						\
-BEGIN {									\
-    print vercmp(ARGV[1], ARGV[2]);					\
-}									\
-									\
-function vercmp(ver1, ver2,    ver1arr, ver2arr,			\
-                               ver1len, ver2len,			\
-                               ver1int, ver2int, len, i, p) {		\
-									\
-    ver1len = split(ver1, ver1arr, /\./);				\
-    ver2len = split(ver2, ver2arr, /\./);				\
-									\
-    len = ver1len > ver2len ? ver1len : ver2len;			\
-									\
-    for (i = 1; i <= len; i++) {					\
-        p = 1000 ^ (len - i);						\
-        ver1int += ver1arr[i] * p;					\
-        ver2int += ver2arr[i] * p;					\
-    }									\
-									\
-    if (ver1int < ver2int)						\
-        return 2;							\
-    else if (ver1int > ver2int)						\
-        return 1;							\
-    else								\
-        return 0;							\
-}' $1 $2`]								
-
-    if test $xmms_got_version -eq 2; then 	# failure
-	ifelse([$4], , :, $4)			
-    else  					# success!
-	ifelse([$3], , :, $3)
-    fi
-])
-
-AC_DEFUN(AM_PATH_XMMS,
-[
-AC_ARG_WITH(xmms-prefix,[  --with-xmms-prefix=PFX  Prefix where XMMS is installed (optional)],
-	xmms_config_prefix="$withval", xmms_config_prefix="")
-AC_ARG_WITH(xmms-exec-prefix,[  --with-xmms-exec-prefix=PFX Exec prefix where XMMS is installed (optional)],
-	xmms_config_exec_prefix="$withval", xmms_config_exec_prefix="")
-
-if test x$xmms_config_exec_prefix != x; then
-    xmms_config_args="$xmms_config_args --exec-prefix=$xmms_config_exec_prefix"
-    if test x${XMMS_CONFIG+set} != xset; then
-	XMMS_CONFIG=$xmms_config_exec_prefix/bin/xmms-config
-    fi
-fi
-
-if test x$xmms_config_prefix != x; then
-    xmms_config_args="$xmms_config_args --prefix=$xmms_config_prefix"
-    if test x${XMMS_CONFIG+set} != xset; then
-  	XMMS_CONFIG=$xmms_config_prefix/bin/xmms-config
-    fi
-fi
-
-AC_PATH_PROG(XMMS_CONFIG, xmms-config, no)
-min_xmms_version=ifelse([$1], ,0.9.5.1, $1)
-
-if test "$XMMS_CONFIG" = "no"; then
-    no_xmms=yes
-else
-    XMMS_CFLAGS=`$XMMS_CONFIG $xmms_config_args --cflags`
-    XMMS_LIBS=`$XMMS_CONFIG $xmms_config_args --libs`
-    XMMS_VERSION=`$XMMS_CONFIG $xmms_config_args --version`
-    XMMS_DATA_DIR=`$XMMS_CONFIG $xmms_config_args --data-dir`
-    XMMS_PLUGIN_DIR=`$XMMS_CONFIG $xmms_config_args --plugin-dir`
-    XMMS_VISUALIZATION_PLUGIN_DIR=`$XMMS_CONFIG $xmms_config_args \
-					--visualization-plugin-dir`
-    XMMS_INPUT_PLUGIN_DIR=`$XMMS_CONFIG $xmms_config_args --input-plugin-dir`
-    XMMS_OUTPUT_PLUGIN_DIR=`$XMMS_CONFIG $xmms_config_args --output-plugin-dir`
-    XMMS_EFFECT_PLUGIN_DIR=`$XMMS_CONFIG $xmms_config_args --effect-plugin-dir`
-    XMMS_GENERAL_PLUGIN_DIR=`$XMMS_CONFIG $xmms_config_args --general-plugin-dir`
-
-    XMMS_TEST_VERSION($XMMS_VERSION, $min_xmms_version, ,no_xmms=version)
-fi
-
-AC_MSG_CHECKING(for XMMS - version >= $min_xmms_version)
-
-if test "x$no_xmms" = x; then
-    AC_MSG_RESULT(yes)
-    ifelse([$2], , :, [$2])
-else
-    AC_MSG_RESULT(no)
-
-    if test "$XMMS_CONFIG" = "no" ; then
-	echo "*** The xmms-config script installed by XMMS could not be found."
-      	echo "*** If XMMS was installed in PREFIX, make sure PREFIX/bin is in"
-	echo "*** your path, or set the XMMS_CONFIG environment variable to the"
-	echo "*** full path to xmms-config."
-    else
-	if test "$no_xmms" = "version"; then
-	    echo "*** An old version of XMMS, $XMMS_VERSION, was found."
-	    echo "*** You need a version of XMMS newer than $min_xmms_version."
-	    echo "*** The latest version of XMMS is always available from"
-	    echo "*** http://www.xmms.org/"
-	    echo "***"
-
-            echo "*** If you have already installed a sufficiently new version, this error"
-            echo "*** probably means that the wrong copy of the xmms-config shell script is"
-            echo "*** being found. The easiest way to fix this is to remove the old version"
-            echo "*** of XMMS, but you can also set the XMMS_CONFIG environment to point to the"
-            echo "*** correct copy of xmms-config. (In this case, you will have to"
-            echo "*** modify your LD_LIBRARY_PATH enviroment variable, or edit /etc/ld.so.conf"
-            echo "*** so that the correct libraries are found at run-time)"
-	fi
-    fi
-    XMMS_CFLAGS=""
-    XMMS_LIBS=""
-    ifelse([$3], , :, [$3])
-fi
-AC_SUBST(XMMS_CFLAGS)
-AC_SUBST(XMMS_LIBS)
-AC_SUBST(XMMS_VERSION)
-AC_SUBST(XMMS_DATA_DIR)
-AC_SUBST(XMMS_PLUGIN_DIR)
-AC_SUBST(XMMS_VISUALIZATION_PLUGIN_DIR)
-AC_SUBST(XMMS_INPUT_PLUGIN_DIR)
-AC_SUBST(XMMS_OUTPUT_PLUGIN_DIR)
-AC_SUBST(XMMS_GENERAL_PLUGIN_DIR)
-AC_SUBST(XMMS_EFFECT_PLUGIN_DIR)
-])
diff --git a/meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch b/meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
new file mode 100644
index 0000000..d086cc9
--- /dev/null
+++ b/meta/recipes-multimedia/flac/flac-1.3.0/0001-Fix-Makefile.am-altivec-logic.patch
@@ -0,0 +1,35 @@
+From 1b3597cdc7b5e604ea37db29b2a65aab91e263e6 Mon Sep 17 00:00:00 2001
+From: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Date: Wed, 4 Dec 2013 13:31:28 -0300
+Subject: [PATCH] Fix Makefile.am altivec logic
+
+Upstream-Status: Backport
+
+Besides SPE (FSL e500v? cores) there are other powerpc processors
+that don't support altivec instructions so only enable them when it's
+100% sure that the target has it.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+Signed-off-by: Erik de Castro Lopo <erikd@mega-nerd.com>
+Signed-off-by: Cristian Iorga <cristian.iorga@intel.com>
+---
+ src/libFLAC/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/src/libFLAC/Makefile.am b/src/libFLAC/Makefile.am
+index 247e33c..258de40 100644
+--- a/src/libFLAC/Makefile.am
++++ b/src/libFLAC/Makefile.am
+@@ -47,8 +47,7 @@ CPUCFLAGS = -faltivec -force_cpusubtype_ALL -DFLAC__NO_ASM
+ else
+ # Linux-gcc for PPC does not have -force_cpusubtype_ALL, it is Darwin-specific
+ CPUCFLAGS =
+-if FLaC__CPU_PPC_SPE
+-else
++if FLaC__USE_ALTIVEC
+ CPUCFLAGS += -maltivec -mabi=altivec
+ endif
+ #@@@ PPC optimizations temporarily disabled
+-- 
+1.8.3.2
+
diff --git a/meta/recipes-multimedia/flac/flac_1.2.1.bb b/meta/recipes-multimedia/flac/flac_1.3.0.bb
similarity index 42%
rename from meta/recipes-multimedia/flac/flac_1.2.1.bb
rename to meta/recipes-multimedia/flac/flac_1.3.0.bb
index 37c7a97..aa04cac 100644
--- a/meta/recipes-multimedia/flac/flac_1.2.1.bb
+++ b/meta/recipes-multimedia/flac/flac_1.3.0.bb
@@ -1,46 +1,38 @@
 SUMMARY = "Free Lossless Audio Codec"
-DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, an audio format similar to MP3, but lossless."
-HOMEPAGE = "http://flac.sourceforge.net/"
-BUGTRACKER = "http://sourceforge.net/tracker/?group_id=13478&atid=113478"
+DESCRIPTION = "FLAC stands for Free Lossless Audio Codec, a lossless audio compression format."
+HOMEPAGE = "https://xiph.org/flac/"
+BUGTRACKER = "http://sourceforge.net/p/flac/bugs/"
 SECTION = "libs"
 LICENSE = "GFDL-1.2 & GPLv2+ & LGPLv2.1+ & BSD"
 LIC_FILES_CHKSUM = "file://COPYING.FDL;md5=ad1419ecc56e060eccf8184a87c4285f \
-                    file://src/Makefile.am;beginline=1;endline=16;md5=8dee151a56a3122f064a9dce771db37d \
-                    file://COPYING.GPL;md5=079b27cd65c86dbc1b6997ffde902735 \
-                    file://src/flac/main.c;beginline=1;endline=17;md5=756c4234516e4266ea45ee7bbbd798cf \
+                    file://src/Makefile.am;beginline=1;endline=17;md5=59575c1aa8f5f70d9361b776c2e2bdb5 \
+                    file://COPYING.GPL;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
+                    file://src/flac/main.c;beginline=1;endline=18;md5=d36a16abc38d5ffd346ac4ba1be1932b \
                     file://COPYING.LGPL;md5=fbc093901857fcd118f065f900982c24 \
-                    file://src/plugin_common/all.h;beginline=1;endline=17;md5=b2e7960da6b43e4eccabf999bcf7f3a9 \
-                    file://COPYING.Xiph;md5=df8975c0225f83ed7b567587ed953b83 \
-                    file://include/FLAC/all.h;beginline=64;endline=69;md5=64474f2b22e9e77b28d8b8b25c983a48"
+                    file://src/plugin_common/all.h;beginline=1;endline=18;md5=e33e281151e7f40db2d3d170d9b0c1bb \
+                    file://COPYING.Xiph;md5=755582d124a03e3001afea59fc02b61b \
+                    file://include/FLAC/all.h;beginline=65;endline=70;md5=64474f2b22e9e77b28d8b8b25c983a48"
 DEPENDS = "libogg"
 
-PR = "r4"
+SRC_URI = "http://downloads.xiph.org/releases/flac/${BP}.tar.xz \
+           file://0001-Fix-Makefile.am-altivec-logic.patch \
+          "
 
-SRC_URI = "${SOURCEFORGE_MIRROR}/flac/flac-${PV}.tar.gz \
-           file://disable-xmms-plugin.patch \
-           file://flac-gcc43-fixes.patch \
-           file://xmms.m4 \
-           file://0001-No-AltiVec-on-SPE.patch \
-           file://asm-pic.patch \
-           file://obsolete_automake_macros.patch \
-"
-
-SRC_URI[md5sum] = "153c8b15a54da428d1f0fadc756c22c7"
-SRC_URI[sha256sum] = "9635a44bceb478bbf2ee8a785cf6986fba525afb5fad1fd4bba73cf71f2d3edf"
-
-S = "${WORKDIR}/flac-${PV}"
+SRC_URI[md5sum] = "13b5c214cee8373464d3d65dee362cdd"
+SRC_URI[sha256sum] = "fa2d64aac1f77e31dfbb270aeb08f5b32e27036a52ad15e69a77e309528010dc"
 
 inherit autotools gettext
 
 EXTRA_OECONF = "--disable-oggtest \
                 --with-ogg-libraries=${STAGING_LIBDIR} \
                 --with-ogg-includes=${STAGING_INCDIR} \
-                --without-xmms-prefix \
-                --without-xmms-exec-prefix \
+                --disable-xmms-plugin \
                 --without-libiconv-prefix \
                 "
 
 EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "altivec", " --enable-altivec", " --disable-altivec", d)}"
+EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "core2", " --enable-sse", "", d)}"
+EXTRA_OECONF += "${@bb.utils.contains("TUNE_FEATURES", "corei7", " --enable-sse", "", d)}"
 
 PACKAGES += "libflac libflac++ liboggflac liboggflac++"
 FILES_${PN} = "${bindir}/*"
@@ -49,11 +41,3 @@ FILES_libflac++ = "${libdir}/libFLAC++.so.*"
 FILES_liboggflac = "${libdir}/libOggFLAC.so.*"
 FILES_liboggflac++ = "${libdir}/libOggFLAC++.so.*"
 
-do_configure () {
-	install -d ${S}/m4
-	install -m 0644 ${WORKDIR}/xmms.m4 ${S}/m4/
-	autotools_do_configure
-	# removes '-read-only-relocs' which is enabled for PowerPC builds.
-	# It makes the build fail, other archs are not affected. Fixes #1775.
-	sed -i 's/-Wl,-read_only_relocs,warning//g' src/libFLAC/Makefile
-}
-- 
1.8.3.2


