Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QK3mh-0003ef-A0
	for openembedded-core@lists.openembedded.org;
	Wed, 11 May 2011 09:24:40 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 11 May 2011 00:21:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,350,1301900400"; 
   d="scan'208";a="766035"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 11 May 2011 00:21:45 -0700
Message-Id: <beb4f7bea70574aab3613126d6cf14afc4859411.1305098201.git.ke.yu@intel.com>
In-Reply-To: <cover.1305098201.git.ke.yu@intel.com>
References: <cover.1305098201.git.ke.yu@intel.com>
Old-Date: Mon, 9 May 2011 16:12:51 +0800
Date: Wed, 11 May 2011 15:28:02 +0800
To: openembedded-core@lists.openembedded.org
CC: 
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 5/5] xserver-xf86-lite: upgrade to from 1.7 RC2 to 1.10.1
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
X-List-Received-Date: Wed, 11 May 2011 07:24:40 -0000

From: Yu Ke <ke.yu@intel.com>

- remove the following patches, since they are already in upstream
  xserver-xf86-lite/libdri-xinerama-symbol.patch,
  xserver-xf86-lite/drmfix.patch
  xserver-xf86-lite/nodolt.patch
  xserver-xf86-lite/revert_make_sys_c_use_unaligned_access_functions.patch
- rebase the patch for 1.10.1
  xserver-xf86-lite/crosscompile.patch

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../xserver-xf86-lite/crosscompile.patch           |   35 ++--
 .../xorg-xserver/xserver-xf86-lite/drmfix.patch    |   13 -
 .../xserver-xf86-lite/libdri-xinerama-symbol.patch |   50 ----
 .../xserver-xf86-lite/macro_tweak.patch            |   30 +++
 .../xorg-xserver/xserver-xf86-lite/nodolt.patch    |   12 -
 ...make_sys_c_use_unaligned_access_functions.patch |  256 --------------------
 .../xorg-xserver/xserver-xf86-lite_1.10.1.bb       |   12 +
 .../xorg-xserver/xserver-xf86-lite_1.7.99.2.bb     |   12 -
 8 files changed, 61 insertions(+), 359 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/drmfix.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/libdri-xinerama-symbol.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/revert_make_sys_c_use_unaligned_access_functions.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.7.99.2.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
index 2341e40..2f98bb8 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/crosscompile.patch
@@ -1,19 +1,22 @@
-Index: xorg-server-1.7.99.2/configure.ac
-===================================================================
---- xorg-server-1.7.99.2.orig/configure.ac	2010-01-29 16:38:49.000000000 +0000
-+++ xorg-server-1.7.99.2/configure.ac	2010-01-29 16:42:39.000000000 +0000
-@@ -503,14 +503,10 @@
- 
- dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
- dnl otherwise uses standard subdirectories of FONTROOTDIR
--AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
--	[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
--	[
- 		DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
- 		case $host_os in
- 			darwin*)    DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
- 		esac
--	])
+Upstream-Status: Inappropriate [configuration]
+
+diff --git a/configure.ac b/configure.ac
+index b3b752c..600500b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
+ dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
+ dnl compiling, assume default font path uses standard FONTROOTDIR directories.
+ DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
+-if test "$cross_compiling" != yes; then
+-	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
+-		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
+-		[case $host_os in
++		case $host_os in
+ 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
+-		esac])
+-fi
++		esac
  AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
  				[ FONTPATH="$withval" ],
  				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/drmfix.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/drmfix.patch
deleted file mode 100644
index a62a767..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/drmfix.patch
+++ /dev/null
@@ -1,13 +0,0 @@
-Index: xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am
-===================================================================
---- xorg-server-1.4.orig/hw/xfree86/os-support/linux/Makefile.am	2007-08-23 21:04:53.000000000 +0200
-+++ xorg-server-1.4/hw/xfree86/os-support/linux/Makefile.am	2008-03-13 18:27:23.000000000 +0100
-@@ -41,7 +41,7 @@
- 
- AM_CFLAGS = -DUSESTDRES -DHAVE_SYSV_IPC $(DIX_CFLAGS) $(XORG_CFLAGS) $(PLATFORM_DEFINES)
- 
--INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) -I/usr/include/drm # FIXME this last part is crack
-+INCLUDES = $(XORG_INCS) $(PLATFORM_INCLUDES) $(LIBDRM_CFLAGS)
- 
- # FIXME: These need to be added to the build
- LNX_EXTRA_SRCS = \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/libdri-xinerama-symbol.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/libdri-xinerama-symbol.patch
deleted file mode 100644
index db29da9..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/libdri-xinerama-symbol.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-Index: xorg-server-1.5.0/hw/xfree86/dri/dri.c
-===================================================================
---- xorg-server-1.5.0.orig/hw/xfree86/dri/dri.c	2008-09-24 17:43:04.000000000 +0100
-+++ xorg-server-1.5.0/hw/xfree86/dri/dri.c	2008-09-24 17:46:38.000000000 +0100
-@@ -73,10 +73,6 @@
- 
- #define PCI_BUS_NO_DOMAIN(bus) ((bus) & 0xffu)
- 
--#if !defined(PANORAMIX)
--extern Bool noPanoramiXExtension;
--#endif
--
- static int DRIEntPrivIndex = -1;
- static DevPrivateKey DRIScreenPrivKey = &DRIScreenPrivKey;
- static DevPrivateKey DRIWindowPrivKey = &DRIWindowPrivKey;
-@@ -307,7 +303,6 @@
-     drm_context_t *       reserved;
-     int                 reserved_count;
-     int                 i;
--    Bool                xineramaInCore = FALSE;
-     DRIEntPrivPtr       pDRIEntPriv;
-     ScrnInfoPtr         pScrn = xf86Screens[pScreen->myNum];
-     DRIContextFlags	flags    = 0;
-@@ -320,20 +315,13 @@
- 	return FALSE;
-     }
- 
--    /*
--     * If Xinerama is on, don't allow DRI to initialise.  It won't be usable
--     * anyway.
--     */
--    if (xf86LoaderCheckSymbol("noPanoramiXExtension"))
--	xineramaInCore = TRUE;
--
--    if (xineramaInCore) {
--	if (!noPanoramiXExtension) {
--	    DRIDrvMsg(pScreen->myNum, X_WARNING,
--		"Direct rendering is not supported when Xinerama is enabled\n");
--	    return FALSE;
--	}
-+#if defined(PANORAMIX)
-+    if (!noPanoramiXExtension) {
-+        DRIDrvMsg(pScreen->myNum, X_WARNING,
-+            "Direct rendering is not supported when Xinerama is enabled\n");
-+        return FALSE;
-     }
-+#endif
- 
-     if (!DRIOpenDRMMaster(pScrn, pDRIInfo->SAREASize,
- 			  pDRIInfo->busIdString,
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
new file mode 100644
index 0000000..2b75427
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/macro_tweak.patch
@@ -0,0 +1,30 @@
+This is the revised version of files/macro_tweak.patch for
+xorg-server 1.8.99.904.
+
+the files/macro_tweak.patch can not removed now since it is used by
+xserver-kdrive-1.7.99.2 and xserver-xf86-lite_1.7.99.2. Once they
+are all upgraded to 1.8.99.904, the the files/macro_tweak.patch
+can be safely replace by this patch.
+
+Upstream-Status: Pending
+
+Signed-off-by: Yu Ke <ke.yu@intel.com>
+
+diff --git a/xorg-server.m4 b/xorg-server.m4
+index bdecf62..040fdb8 100644
+--- a/xorg-server.m4
++++ b/xorg-server.m4
+@@ -28,10 +28,12 @@ dnl
+ # Checks for the $1 define in xorg-server.h (from the sdk).  If it
+ # is defined, then add $1 to $REQUIRED_MODULES.
+ 
++m4_pattern_allow(PKG_CONFIG_SYSROOT_DIR)
++
+ AC_DEFUN([XORG_DRIVER_CHECK_EXT],[
+ 	AC_REQUIRE([PKG_PROG_PKG_CONFIG])
+ 	SAVE_CFLAGS="$CFLAGS"
+-	CFLAGS="$CFLAGS -I`$PKG_CONFIG --variable=sdkdir xorg-server`"
++	CFLAGS="$CFLAGS -I$PKG_CONFIG_SYSROOT_DIR`$PKG_CONFIG --variable=sdkdir xorg-server`"
+ 	AC_COMPILE_IFELSE([AC_LANG_PROGRAM([[
+ #include "xorg-server.h"
+ #if !defined $1
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/nodolt.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/nodolt.patch
deleted file mode 100644
index 6b34032..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/nodolt.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: git/configure.ac
-===================================================================
---- git.orig/configure.ac	2009-01-15 20:35:31.000000000 +0000
-+++ git/configure.ac	2009-01-15 20:35:38.000000000 +0000
-@@ -62,7 +62,6 @@
- AC_LIBTOOL_WIN32_DLL
- AC_DISABLE_STATIC
- AC_PROG_LIBTOOL
--DOLT
- AC_PROG_MAKE_SET
- PKG_PROG_PKG_CONFIG
- AC_PROG_LEX
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/revert_make_sys_c_use_unaligned_access_functions.patch b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/revert_make_sys_c_use_unaligned_access_functions.patch
deleted file mode 100644
index 235b551..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite/revert_make_sys_c_use_unaligned_access_functions.patch
+++ /dev/null
@@ -1,256 +0,0 @@
-From 74ab27f64a747ee45810f99cdc6e29b82cf8035e Mon Sep 17 00:00:00 2001
-From: Tiago Vignatti <tiago.vignatti@nokia.com>
-Date: Mon, 28 Dec 2009 16:00:28 +0000
-Subject: Revert "Make sys.c use unaligned access functions provided in compiler."
-
-This reverts commit da923d0bc15e99a8ed1986bd6f5df37f7af7284b.
-
-Signed-off-by: Tiago Vignatti <tiago.vignatti@nokia.com>
-Signed-off-by: Keith Packard <keithp@keithp.com>
----
-diff --git a/hw/xfree86/x86emu/Makefile.am b/hw/xfree86/x86emu/Makefile.am
-index e7368f5..df96977 100644
---- a/hw/xfree86/x86emu/Makefile.am
-+++ b/hw/xfree86/x86emu/Makefile.am
-@@ -11,7 +11,7 @@ libx86emu_la_SOURCES = debug.c \
-                       sys.c \
-                       x86emu.h
- 
--INCLUDES = $(XORG_INCS)
-+INCLUDES = 
- 
- AM_CFLAGS = $(DIX_CFLAGS) $(XORG_CFLAGS)
- 
-diff --git a/hw/xfree86/x86emu/sys.c b/hw/xfree86/x86emu/sys.c
-index 2ebf6f1..e15fb09 100644
---- a/hw/xfree86/x86emu/sys.c
-+++ b/hw/xfree86/x86emu/sys.c
-@@ -48,13 +48,168 @@
- #ifndef NO_SYS_HEADERS
- #include <string.h>
- #endif                                                                                           
--#include "compiler.h" /* for unaligned access functions */
- /*------------------------- Global Variables ------------------------------*/
- 
- X86EMU_sysEnv		_X86EMU_env;		/* Global emulator machine state */
- X86EMU_intrFuncs	_X86EMU_intrTab[256];
- 
- /*----------------------------- Implementation ----------------------------*/
-+#if defined(__alpha__) || defined(__alpha)
-+/* to cope with broken egcs-1.1.2 :-(((( */
-+
-+#define ALPHA_UALOADS
-+/*
-+ * inline functions to do unaligned accesses
-+ * from linux/include/asm-alpha/unaligned.h
-+ */
-+
-+/*
-+ * EGCS 1.1 knows about arbitrary unaligned loads.  Define some
-+ * packed structures to talk about such things with.
-+ */
-+
-+#if defined(__GNUC__)
-+struct __una_u64 { unsigned long  x __attribute__((packed)); };
-+struct __una_u32 { unsigned int   x __attribute__((packed)); };
-+struct __una_u16 { unsigned short x __attribute__((packed)); };
-+#endif
-+
-+static __inline__ unsigned long ldq_u(unsigned long * r11)
-+{
-+#if defined(__GNUC__)
-+	const struct __una_u64 *ptr = (const struct __una_u64 *) r11;
-+	return ptr->x;
-+#else
-+	unsigned long r1,r2;
-+	__asm__("ldq_u %0,%3\n\t"
-+		"ldq_u %1,%4\n\t"
-+		"extql %0,%2,%0\n\t"
-+		"extqh %1,%2,%1"
-+		:"=&r" (r1), "=&r" (r2)
-+		:"r" (r11),
-+		 "m" (*r11),
-+		 "m" (*(const unsigned long *)(7+(char *) r11)));
-+	return r1 | r2;
-+#endif
-+}
-+
-+static __inline__ unsigned long ldl_u(unsigned int * r11)
-+{
-+#if defined(__GNUC__)
-+	const struct __una_u32 *ptr = (const struct __una_u32 *) r11;
-+	return ptr->x;
-+#else
-+	unsigned long r1,r2;
-+	__asm__("ldq_u %0,%3\n\t"
-+		"ldq_u %1,%4\n\t"
-+		"extll %0,%2,%0\n\t"
-+		"extlh %1,%2,%1"
-+		:"=&r" (r1), "=&r" (r2)
-+		:"r" (r11),
-+		 "m" (*r11),
-+		 "m" (*(const unsigned long *)(3+(char *) r11)));
-+	return r1 | r2;
-+#endif
-+}
-+
-+static __inline__ unsigned long ldw_u(unsigned short * r11)
-+{
-+#if defined(__GNUC__)
-+	const struct __una_u16 *ptr = (const struct __una_u16 *) r11;
-+	return ptr->x;
-+#else
-+	unsigned long r1,r2;
-+	__asm__("ldq_u %0,%3\n\t"
-+		"ldq_u %1,%4\n\t"
-+		"extwl %0,%2,%0\n\t"
-+		"extwh %1,%2,%1"
-+		:"=&r" (r1), "=&r" (r2)
-+		:"r" (r11),
-+		 "m" (*r11),
-+		 "m" (*(const unsigned long *)(1+(char *) r11)));
-+	return r1 | r2;
-+#endif
-+}
-+
-+/*
-+ * Elemental unaligned stores 
-+ */
-+
-+static __inline__ void stq_u(unsigned long r5, unsigned long * r11)
-+{
-+#if defined(__GNUC__)
-+	struct __una_u64 *ptr = (struct __una_u64 *) r11;
-+	ptr->x = r5;
-+#else
-+	unsigned long r1,r2,r3,r4;
-+
-+	__asm__("ldq_u %3,%1\n\t"
-+		"ldq_u %2,%0\n\t"
-+		"insqh %6,%7,%5\n\t"
-+		"insql %6,%7,%4\n\t"
-+		"mskqh %3,%7,%3\n\t"
-+		"mskql %2,%7,%2\n\t"
-+		"bis %3,%5,%3\n\t"
-+		"bis %2,%4,%2\n\t"
-+		"stq_u %3,%1\n\t"
-+		"stq_u %2,%0"
-+		:"=m" (*r11),
-+		 "=m" (*(unsigned long *)(7+(char *) r11)),
-+		 "=&r" (r1), "=&r" (r2), "=&r" (r3), "=&r" (r4)
-+		:"r" (r5), "r" (r11));
-+#endif
-+}
-+
-+static __inline__ void stl_u(unsigned long r5, unsigned int * r11)
-+{
-+#if defined(__GNUC__)
-+	struct __una_u32 *ptr = (struct __una_u32 *) r11;
-+	ptr->x = r5;
-+#else
-+	unsigned long r1,r2,r3,r4;
-+
-+	__asm__("ldq_u %3,%1\n\t"
-+		"ldq_u %2,%0\n\t"
-+		"inslh %6,%7,%5\n\t"
-+		"insll %6,%7,%4\n\t"
-+		"msklh %3,%7,%3\n\t"
-+		"mskll %2,%7,%2\n\t"
-+		"bis %3,%5,%3\n\t"
-+		"bis %2,%4,%2\n\t"
-+		"stq_u %3,%1\n\t"
-+		"stq_u %2,%0"
-+		:"=m" (*r11),
-+		 "=m" (*(unsigned long *)(3+(char *) r11)),
-+		 "=&r" (r1), "=&r" (r2), "=&r" (r3), "=&r" (r4)
-+		:"r" (r5), "r" (r11));
-+#endif
-+}
-+
-+static __inline__ void stw_u(unsigned long r5, unsigned short * r11)
-+{
-+#if defined(__GNUC__)
-+	struct __una_u16 *ptr = (struct __una_u16 *) r11;
-+	ptr->x = r5;
-+#else
-+	unsigned long r1,r2,r3,r4;
-+
-+	__asm__("ldq_u %3,%1\n\t"
-+		"ldq_u %2,%0\n\t"
-+		"inswh %6,%7,%5\n\t"
-+		"inswl %6,%7,%4\n\t"
-+		"mskwh %3,%7,%3\n\t"
-+		"mskwl %2,%7,%2\n\t"
-+		"bis %3,%5,%3\n\t"
-+		"bis %2,%4,%2\n\t"
-+		"stq_u %3,%1\n\t"
-+		"stq_u %2,%0"
-+		:"=m" (*r11),
-+		 "=m" (*(unsigned long *)(1+(char *) r11)),
-+		 "=&r" (r1), "=&r" (r2), "=&r" (r3), "=&r" (r4)
-+		:"r" (r5), "r" (r11));
-+#endif
-+}
-+#endif
- 
- /****************************************************************************
- PARAMETERS:
-@@ -107,7 +262,13 @@ u16 X86API rdw(
- 		}
- 	else
- #endif
-+#if defined(ALPHA_UALOADS)
- 		val = ldw_u((u16*)(M.mem_base + addr));
-+#elif  defined(IA64_UALOADS)
-+      val = uldw((u16*)(M.mem_base + addr));
-+#else
-+		val = *(u16*)(M.mem_base + addr);
-+#endif
- 		DB(	if (DEBUG_MEM_TRACE())
- 		printk("%#08x 2 -> %#x\n", addr, val);)
-     return val;
-@@ -140,7 +301,13 @@ u32 X86API rdl(
- 		}
- 	else
- #endif
-+#if defined(ALPHA_UALOADS)
- 		val = ldl_u((u32*)(M.mem_base + addr));
-+#elif  defined(IA64_UALOADS)
-+        val = uldl((u32*)(M.mem_base + addr));
-+#else
-+		val = *(u32*)(M.mem_base + addr);
-+#endif
- DB(	if (DEBUG_MEM_TRACE())
- 		printk("%#08x 4 -> %#x\n", addr, val);)
- 	return val;
-@@ -192,7 +359,13 @@ DB(	if (DEBUG_MEM_TRACE())
- 		}
- 	else
- #endif
-+#if defined(ALPHA_UALOADS)
- 	 stw_u(val,(u16*)(M.mem_base + addr));
-+#elif defined(IA64_UALOADS)
-+     ustw(val,(u16*)(M.mem_base + addr));
-+#else
-+	 *(u16*)(M.mem_base + addr) = val;
-+#endif
- }
- 
- /****************************************************************************
-@@ -222,7 +395,13 @@ DB(	if (DEBUG_MEM_TRACE())
- 		}
- 	else
- #endif
-+#if defined(ALPHA_UALOADS)
- 	 stl_u(val,(u32*)(M.mem_base + addr));
-+#elif defined(IA64_UALOADS)
-+     ustl(val,(u32*)(M.mem_base + addr));
-+#else
-+	 *(u32*)(M.mem_base + addr) = val;
-+#endif
- }
- 
- /****************************************************************************
---
-cgit v0.8.3-6-g21f6
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
new file mode 100644
index 0000000..f9b3a64
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.10.1.bb
@@ -0,0 +1,12 @@
+require xserver-xf86-lite.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
+
+PR = "r0"
+
+DEPENDS += "font-util"
+
+SRC_URI += "file://crosscompile.patch"
+
+# Misc build failure for master HEAD
+SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.7.99.2.bb
deleted file mode 100644
index 5ef2301..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-lite_1.7.99.2.bb
+++ /dev/null
@@ -1,12 +0,0 @@
-require xserver-xf86-lite.inc
-
-PR = "r1"
-
-DEPENDS += "font-util"
-
-SRC_URI += "file://nodolt.patch;patch=1 \
-            file://crosscompile.patch;patch=1"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;patch=1 \
-            file://revert_make_sys_c_use_unaligned_access_functions.patch;patch=1"
-- 
1.7.0.4



