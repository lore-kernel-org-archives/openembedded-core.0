Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QM5cx-0003RG-Dc
	for openembedded-core@lists.openembedded.org;
	Mon, 16 May 2011 23:47:02 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 16 May 2011 14:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437102325"
Received: from unknown (HELO localhost) ([10.255.12.119])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 14:44:03 -0700
Message-Id: <3f105b122736772aa2cf11d4b346d764239b2a68.1305580484.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305580484.git.sgw@linux.intel.com>
References: <cover.1305580484.git.sgw@linux.intel.com>
Old-Date: Mon, 9 May 2011 16:45:14 +0800
Date: Mon, 16 May 2011 14:44:03 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 04/14] xserver-kdrive: upgrade from 1.7.99.2 to 1.10.1
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
X-List-Received-Date: Mon, 16 May 2011 21:47:02 -0000

From: Yu Ke <ke.yu@intel.com>

- remove the patches
  * xserver-kdrive-1.3.0.0/*: no longer used
  * disable-xf86-dga-xorgcfg.patch: no longer used
  * nodolt.patch: already in upstream
  * enable-xcalibrate.patch: it is invalid now, because XCALIBRATE
    extension has been removed since commit edcceedb
  * kdrive-evdev.patch: no longer used
  * kdrive-use-evdev.patch: no longer used
  * enable-builtin-fonts.patch: no longer used
  * optional-xkb.patch: no longer used

- rebase patches for 1.10.1
  * extra-kmodes.patch
  * hide-cursor-and-ppm-root.patch
  * fbdev_xrandr_ioctl.patch
  * crosscompile.patch

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 .../enable-builtin-fonts.patch                     |   12 -
 .../xserver-kdrive-1.3.0.0/enable-epson.patch      |   11 -
 .../xserver-kdrive-1.3.0.0/enable-tslib.patch      |   12 -
 .../xserver-kdrive-1.3.0.0/enable-xcalibrate.patch |  110 -----
 .../xserver-kdrive-1.3.0.0/fbdev_use_current.patch |   41 --
 .../hide-cursor-and-ppm-root.patch                 |  307 ------------
 .../xserver-kdrive-1.3.0.0/kdrive-evdev.patch      |  515 --------------------
 .../xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch  |   54 --
 .../xserver-kdrive-1.3.0.0/optional-xkb.patch      |   58 ---
 .../report-correct-randr12.patch                   |   29 --
 .../xserver-kdrive-1.3.0.0/scheduler.patch         |  151 ------
 .../xserver-kdrive-1.3.0.0/xcalibrate_coords.patch |  122 -----
 .../xserver-kdrive-1.7.99.2/crosscompile.patch     |   19 -
 .../xserver-kdrive-1.7.99.2/disable-apm.patch      |   20 -
 .../enable-builtin-fonts.patch                     |   12 -
 .../enable-xcalibrate.patch                        |  148 ------
 .../xserver-kdrive-1.7.99.2/extra-kmodes.patch     |   83 ----
 .../fbdev_xrandr_ioctl.patch                       |   61 ---
 .../fix-newer-xorg-headers.patch                   |   18 -
 .../xserver-kdrive-1.7.99.2/kdrive-evdev.patch     |  515 --------------------
 .../xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch |   54 --
 .../no-serial-probing.patch                        |   13 -
 .../xserver-kdrive-1.7.99.2/nodolt.patch           |   12 -
 .../xserver-kdrive-1.7.99.2/optional-xkb.patch     |   58 ---
 .../xorg-xserver/xserver-kdrive.inc                |    2 +-
 .../xorg-xserver/xserver-kdrive/crosscompile.patch |   22 +
 .../xorg-xserver/xserver-kdrive/disable-apm.patch  |   20 +-
 .../xserver-kdrive/disable-xf86-dga-xorgcfg.patch  |   39 --
 .../xorg-xserver/xserver-kdrive/extra-kmodes.patch |   33 +-
 .../xserver-kdrive/fbdev_xrandr_ioctl.patch        |   25 +-
 .../fix-newer-xorg-headers.patch                   |    0
 .../hide-cursor-and-ppm-root.patch                 |   68 ++--
 .../keyboard-resume-workaround.patch               |    0
 .../xorg-xserver/xserver-kdrive_1.10.1.bb          |   22 +
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   29 --
 35 files changed, 117 insertions(+), 2578 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-epson.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-tslib.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fbdev_use_current.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/hide-cursor-and-ppm-root.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/optional-xkb.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/scheduler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/xcalibrate_coords.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-kdrive-1.3.0.0 => xserver-kdrive}/fix-newer-xorg-headers.patch (100%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-kdrive-1.7.99.2 => xserver-kdrive}/hide-cursor-and-ppm-root.patch (79%)
 rename meta/recipes-graphics/xorg-xserver/{xserver-kdrive-1.7.99.2 => xserver-kdrive}/keyboard-resume-workaround.patch (100%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.10.1.bb
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-builtin-fonts.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-builtin-fonts.patch
deleted file mode 100644
index 13a6c2c..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-builtin-fonts.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- xorg-server-X11R7.1-1.1.0/dix/dixfonts.c.orig	2006-06-08 14:49:12.158684250 +0200
-+++ xorg-server-X11R7.1-1.1.0/dix/dixfonts.c	2006-06-08 14:49:52.493205000 +0200
-@@ -52,8 +52,8 @@
- /* $Xorg: dixfonts.c,v 1.4 2000/08/17 19:48:18 cpqbld Exp $ */
- 
- #define NEED_REPLIES
- #ifdef HAVE_DIX_CONFIG_H
--#include <dix-config.h>
-+#include <kdrive-config.h>
- #endif
- 
- #include <X11/X.h>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-epson.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-epson.patch
deleted file mode 100644
index 8ec3a37..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-epson.patch
+++ /dev/null
@@ -1,11 +0,0 @@
-Index: xorg-server-1.2.0/hw/kdrive/Makefile.am
-===================================================================
---- xorg-server-1.2.0.orig/hw/kdrive/Makefile.am	2007-03-28 17:11:38.000000000 +0200
-+++ xorg-server-1.2.0/hw/kdrive/Makefile.am	2007-03-28 17:12:28.000000000 +0200
-@@ -1,5 +1,5 @@
- if KDRIVEFBDEV
--FBDEV_SUBDIRS = fbdev
-+FBDEV_SUBDIRS = fbdev epson
- endif
- 
- if KDRIVEIMAGEON
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-tslib.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-tslib.patch
deleted file mode 100644
index 9a59530..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-tslib.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: xorg-server-1.2.0/configure.ac
-===================================================================
---- xorg-server-1.2.0.orig/configure.ac	2007-03-29 13:28:10.000000000 +0200
-+++ xorg-server-1.2.0/configure.ac	2007-03-29 13:28:35.000000000 +0200
-@@ -1517,6 +1517,7 @@
-             AC_MSG_ERROR([tslib must be installed to build the tslib driver. See http://tslib.berlios.de/])
-         fi
-         AC_DEFINE(TSLIB, 1, [Have tslib support])
-+        AC_DEFINE(TOUCHSCREEN, 1, [Have touchscreen support])
-     fi
- 
-     # damage shadow extension glx (NOTYET) fb mi
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-xcalibrate.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-xcalibrate.patch
deleted file mode 100644
index 5a97100..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/enable-xcalibrate.patch
+++ /dev/null
@@ -1,110 +0,0 @@
----
- Xext/Makefile.am           |    6 ++++++
- configure.ac               |   11 +++++++++--
- include/kdrive-config.h.in |    3 +++
- mi/miinitext.c             |    6 ++++++
- 4 files changed, 24 insertions(+), 2 deletions(-)
-
-Index: xorg-server-1.3.0.0/mi/miinitext.c
-===================================================================
---- xorg-server-1.3.0.0.orig/mi/miinitext.c	2006-11-16 18:01:26.000000000 +0000
-+++ xorg-server-1.3.0.0/mi/miinitext.c	2008-01-11 13:45:57.000000000 +0000
-@@ -372,6 +372,9 @@ extern void ResExtensionInit(INITARGS);
- #ifdef DMXEXT
- extern void DMXExtensionInit(INITARGS);
- #endif
-+#ifdef XCALIBRATE
-+extern void XCalibrateExtensionInit(INITARGS);
-+#endif
- #ifdef XEVIE
- extern void XevieExtensionInit(INITARGS);
- #endif
-@@ -663,6 +666,9 @@ InitExtensions(argc, argv)
- #ifdef DAMAGE
-     if (!noDamageExtension) DamageExtensionInit();
- #endif
-+#ifdef  XCALIBRATE
-+    XCalibrateExtensionInit ();
-+#endif
- }
- 
- void
-Index: xorg-server-1.3.0.0/configure.ac
-===================================================================
---- xorg-server-1.3.0.0.orig/configure.ac	2008-01-11 13:45:57.000000000 +0000
-+++ xorg-server-1.3.0.0/configure.ac	2008-01-11 13:45:58.000000000 +0000
-@@ -421,6 +421,7 @@ AC_ARG_ENABLE(xf86vidmode,    AS_HELP_ST
- AC_ARG_ENABLE(xf86misc,       AS_HELP_STRING([--disable-xf86misc], [Build XF86Misc extension (default: enabled)]), [XF86MISC=$enableval], [XF86MISC=yes])
- AC_ARG_ENABLE(xace,     AS_HELP_STRING([--disable-xace], [Build X-ACE extension (default: enabled)]), [XACE=$enableval], [XACE=yes])
- AC_ARG_ENABLE(xcsecurity,     AS_HELP_STRING([--disable-xcsecurity], [Build Security extension (default: enabled)]), [XCSECURITY=$enableval], [XCSECURITY=$XACE])
-+AC_ARG_ENABLE(xcalibrate,     AS_HELP_STRING([--enable-xcalibrate], [Build XCalibrate extension (default: disabled)]), [XCALIBRATE=$enableval], [XCALIBRATE=no])
- AC_ARG_ENABLE(appgroup,       AS_HELP_STRING([--disable-appgroup], [Build XC-APPGROUP extension (default: enabled)]), [APPGROUP=$enableval], [APPGROUP=$XCSECURITY])
- AC_ARG_ENABLE(xcalibrate,     AS_HELP_STRING([--enable-xcalibrate], [Build XCalibrate extension (default: disabled)]), [XCALIBRATE=$enableval], [XCALIBRATE=no])
- AC_ARG_ENABLE(tslib,          AS_HELP_STRING([--enable-tslib], [Build kdrive tslib touchscreen support (default: disabled)]), [TSLIB=$enableval], [TSLIB=no])
-@@ -653,6 +654,12 @@ if test "x$XCSECURITY" = xyes; then
- 	AC_DEFINE(XCSECURITY, 1, [Build Security extension])
- fi
- 
-+AM_CONDITIONAL(XCALIBRATE, [test "x$XCALIBRATE" = xyes])
-+if test "x$XCALIBRATE" = xyes; then
-+	AC_DEFINE(XCALIBRATE, 1, [Build XCalibrate extension])
-+	REQUIRED_MODULES="$REQUIRED_MODULES xcalibrateproto"
-+fi
-+
- AM_CONDITIONAL(XEVIE, [test "x$XEVIE" = xyes])
- if test "x$XEVIE" = xyes; then
- 	AC_DEFINE(XEVIE, 1, [Build XEvIE extension])
-@@ -1519,7 +1526,7 @@ if test "$KDRIVE" = yes; then
-     
-     # tslib...
-     if test "x$TSLIB" = xyes; then
--        PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [HAVE_TSLIB="yes"], [HAVE_TSLIB="no"])
-+        PKG_CHECK_MODULES([TSLIB], [tslib-1.0], [HAVE_TSLIB="yes"], [HAVE_TSLIB="no"])
-         if test "x$HAVE_TSLIB" = xno; then
-             AC_MSG_ERROR([tslib must be installed to build the tslib driver. See http://tslib.berlios.de/])
-         fi
-@@ -1547,7 +1554,7 @@ if test "$KDRIVE" = yes; then
- 	    ;;
-     esac
-     KDRIVE_STUB_LIB='$(top_builddir)/hw/kdrive/src/libkdrivestubs.a'
--    KDRIVE_LIBS="$DIX_LIB $KDRIVE_LIB $KDRIVE_OS_LIB $KDRIVE_PURE_LIBS $KDRIVE_STUB_LIB $TSLIB_LIBS"
-+    KDRIVE_LIBS="$DIX_LIB $KDRIVE_LIB $KDRIVE_PURE_LIBS $KDRIVE_OS_LIB $KDRIVE_STUB_LIB $TSLIB_LIBS"
- 
-     # check if we can build Xephyr
-     PKG_CHECK_MODULES(XEPHYR, x11 xext xfont xau xdmcp, [xephyr="yes"], [xephyr="no"])
-Index: xorg-server-1.3.0.0/include/kdrive-config.h.in
-===================================================================
---- xorg-server-1.3.0.0.orig/include/kdrive-config.h.in	2006-11-16 18:01:26.000000000 +0000
-+++ xorg-server-1.3.0.0/include/kdrive-config.h.in	2008-01-11 13:45:57.000000000 +0000
-@@ -25,4 +25,7 @@
- /* Verbose debugging output hilarity */
- #undef DEBUG
- 
-+/* Enable XCalibrate extension */
-+#undef XCALIBRATE
-+
- #endif /* _KDRIVE_CONFIG_H_ */
-Index: xorg-server-1.3.0.0/Xext/Makefile.am
-===================================================================
---- xorg-server-1.3.0.0.orig/Xext/Makefile.am	2006-10-25 01:25:19.000000000 +0100
-+++ xorg-server-1.3.0.0/Xext/Makefile.am	2008-01-11 13:45:57.000000000 +0000
-@@ -91,6 +91,11 @@ BUILTIN_SRCS += $(XCALIBRATE_SRCS)
- # XCalibrare needs tslib
- endif
- 
-+XCALIBRATE_SRCS = xcalibrate.c
-+if XCALIBRATE
-+BUILTIN_SRCS += $(XCALIBRATE_SRCS)
-+endif
-+
- # X EVent Interception Extension: allows accessibility helpers & composite
- # managers to intercept events from input devices and transform as needed
- # before the clients see them.
-@@ -169,6 +174,7 @@ EXTRA_DIST = \
- 	$(XCSECURITY_SRCS) \
- 	$(XCALIBRATE_SRCS) \
- 	$(XINERAMA_SRCS) \
-+	$(XCALIBRATE_SRCS) \
- 	$(XEVIE_SRCS) \
- 	$(XPRINT_SRCS) \
- 	$(APPGROUP_SRCS) \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fbdev_use_current.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fbdev_use_current.patch
deleted file mode 100644
index dc957cc..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fbdev_use_current.patch
+++ /dev/null
@@ -1,41 +0,0 @@
----
- hw/kdrive/fbdev/fbdev.c |   24 ++++++++++++++++--------
- 1 file changed, 16 insertions(+), 8 deletions(-)
-
-Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/fbdev/fbdev.c	2008-01-11 14:40:16.000000000 +0000
-+++ xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c	2008-01-11 14:40:59.000000000 +0000
-@@ -182,16 +182,24 @@ fbdevScreenInitialize (KdScreenInfo *scr
- 	screen->rate = 103; /* FIXME: should get proper value from fb driver */
-     }
-     if (!screen->fb[0].depth)
--	screen->fb[0].depth = 16;
-+    {
-+	if (k >= 0) 
-+	    screen->fb[0].depth = var.bits_per_pixel;
-+	else
-+	    screen->fb[0].depth = 16;
-+    }
- 
--    t = KdFindMode (screen, fbdevModeSupported);
--    screen->rate = t->rate;
--    screen->width = t->horizontal;
--    screen->height = t->vertical;
-+    if ((screen->width != var.xres) || (screen->height != var.yres))
-+    {
-+      t = KdFindMode (screen, fbdevModeSupported);
-+      screen->rate = t->rate;
-+      screen->width = t->horizontal;
-+      screen->height = t->vertical;
- 
--    /* Now try setting the mode */
--    if (k < 0 || (t->horizontal != var.xres || t->vertical != var.yres))
--        fbdevConvertMonitorTiming (t, &var);
-+      /* Now try setting the mode */
-+      if (k < 0 || (t->horizontal != var.xres || t->vertical != var.yres))
-+          fbdevConvertMonitorTiming (t, &var);
-+    }
- 
-     var.activate = FB_ACTIVATE_NOW;
-     var.bits_per_pixel = screen->fb[0].depth;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/hide-cursor-and-ppm-root.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/hide-cursor-and-ppm-root.patch
deleted file mode 100644
index c160cd4..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/hide-cursor-and-ppm-root.patch
+++ /dev/null
@@ -1,307 +0,0 @@
-diff -u -r xorg-server-X11R7.1-1.1.0.orig/dix/window.c xorg-server-X11R7.1-1.1.0/dix/window.c
---- xorg-server-X11R7.1-1.1.0.orig/dix/window.c	2007-01-08 14:30:38.000000000 +0000
-+++ xorg-server-X11R7.1-1.1.0/dix/window.c	2007-01-16 17:16:19.000000000 +0000
-@@ -185,6 +185,8 @@
- _X_EXPORT int numSaveUndersViewable = 0;
- _X_EXPORT int deltaSaveUndersViewable = 0;
- 
-+char* RootPPM = NULL;
-+
- #ifdef DEBUG
- /******
-  * PrintWindowTree
-@@ -311,6 +313,115 @@
- #endif
- }
- 
-+static int
-+get_int(FILE *fp)
-+{
-+  int c = 0;
-+
-+  while ((c = getc(fp)) != EOF)
-+    {
-+      if (isspace(c))
-+	continue;
-+
-+      if (c == '#')
-+	while (c = getc(fp))
-+	  if (c == EOF)
-+	    return 0;
-+	  else if (c == '\n')
-+	    break;
-+
-+      if (isdigit(c)) 
-+	{
-+	  int val = c - '0';
-+	  while ((c = getc(fp)) && isdigit(c))
-+	    val = (val * 10) + (c - '0');
-+	  return val;
-+	}
-+    }
-+
-+  return 0;
-+}
-+
-+static unsigned char*
-+ppm_load (const char* path, int depth, int *width, int *height)
-+{
-+  FILE *fp;
-+  int   max, n = 0, w, h, i, j, bytes_per_line;
-+  unsigned char *data, *res, h1, h2;
-+
-+  if (depth < 16 || depth > 32)
-+    return NULL;
-+
-+  if (depth > 16)
-+    depth = 32;
-+
-+  fp = fopen (path, "r");
-+  if (fp == NULL)
-+    return FALSE;
-+
-+  h1 = getc(fp);
-+  h2 = getc(fp);
-+
-+  /* magic is 'P6' for raw ppm */
-+  if (h1 != 'P' && h2 != '6')
-+      goto fail;
-+
-+  w = get_int(fp);
-+  h = get_int(fp);
-+
-+  if (w == 0 || h == 0)
-+    goto fail;
-+
-+  max = get_int(fp);
-+
-+  if (max != 255)
-+      goto fail;
-+
-+  bytes_per_line = ((w * depth + 31) >> 5) << 2;
-+
-+  res = data = malloc(bytes_per_line * h);
-+
-+  for (i=0; i<h; i++)
-+    {
-+      for (j=0; j<w; j++)
-+	{
-+	  unsigned char buf[3];
-+	  fread(buf, 1, 3, fp);
-+	  
-+	  switch (depth)
-+	    {
-+	    case 24:
-+	    case 32:
-+	      *data     = buf[2];
-+	      *(data+1) = buf[1];
-+	      *(data+2) = buf[0];
-+	      data += 4;
-+	      break;
-+	    case 16:
-+	    default:
-+	      *(unsigned short*)data
-+		= ((buf[0] >> 3) << 11) | ((buf[1] >> 2) << 5) | (buf[2] >> 3);
-+	      data += 2;
-+	      break;
-+	    }
-+	}
-+      data += (bytes_per_line - (w*(depth>>3)));
-+    }
-+
-+  data = res;
-+
-+  *width  = w;
-+  *height = h;
-+
-+  fclose(fp);
-+
-+  return res;
-+
-+ fail:
-+  fclose(fp);
-+  return NULL;
-+}
-+
- static void
- MakeRootTile(WindowPtr pWin)
- {
-@@ -321,6 +432,36 @@
-     register unsigned char *from, *to;
-     register int i, j;
- 
-+    if (RootPPM != NULL)
-+      {
-+	int            w, h;
-+	unsigned char *data;
-+
-+	if ((data = ppm_load (RootPPM, pScreen->rootDepth, &w, &h)) != NULL)
-+	  {
-+	    pWin->background.pixmap 
-+	      = (*pScreen->CreatePixmap)(pScreen, w, h, pScreen->rootDepth);
-+
-+	    pWin->backgroundState = BackgroundPixmap;
-+	    pGC = GetScratchGC(pScreen->rootDepth, pScreen);
-+	    if (!pWin->background.pixmap || !pGC)
-+	      FatalError("could not create root tile");
-+
-+	    ValidateGC((DrawablePtr)pWin->background.pixmap, pGC);
-+
-+	    (*pGC->ops->PutImage)((DrawablePtr)pWin->background.pixmap, 
-+				  pGC, 
-+				  pScreen->rootDepth,
-+				  0, 0, w, h, 0, ZPixmap, (char *)data);
-+	    FreeScratchGC(pGC);
-+	    
-+	    free(data);
-+	    return;
-+	  }
-+	else
-+	  ErrorF("Unable to load root window image.");
-+      }
-+
-     pWin->background.pixmap = (*pScreen->CreatePixmap)(pScreen, 4, 4,
- 						    pScreen->rootDepth);
- 
-@@ -357,6 +498,7 @@
- 
- }
- 
-+
- WindowPtr
- AllocateWindow(ScreenPtr pScreen)
- {
-diff -u -r xorg-server-X11R7.1-1.1.0.orig/hw/kdrive/src/kdrive.c xorg-server-X11R7.1-1.1.0/hw/kdrive/src/kdrive.c
---- xorg-server-X11R7.1-1.1.0.orig/hw/kdrive/src/kdrive.c	2007-01-08 14:30:38.000000000 +0000
-+++ xorg-server-X11R7.1-1.1.0/hw/kdrive/src/kdrive.c	2007-01-15 17:53:06.000000000 +0000
-@@ -58,6 +58,9 @@
-     { 32, 32 }
- };
- 
-+int 
-+ProcXFixesHideCursor (ClientPtr client) ;
-+
- #define NUM_KD_DEPTHS (sizeof (kdDepths) / sizeof (kdDepths[0]))
- 
- int                 kdScreenPrivateIndex;
-@@ -84,6 +87,9 @@
- KdOsFuncs	*kdOsFuncs;
- extern WindowPtr *WindowTable;
- 
-+extern Bool CursorInitiallyHidden; /* See Xfixes cursor.c */
-+extern char* RootPPM;		   /* dix/window.c */
-+
- void
- KdSetRootClip (ScreenPtr pScreen, BOOL enable)
- {
-@@ -312,6 +318,7 @@
-     KdSetRootClip (pScreen, TRUE);
-     if (pScreenPriv->card->cfuncs->dpms)
- 	(*pScreenPriv->card->cfuncs->dpms) (pScreen, pScreenPriv->dpmsState);
-+
-     return TRUE;
- }
- 
-@@ -686,10 +693,14 @@
-     ErrorF("-mouse path[,n]  Filename of mouse device, n is number of buttons\n");
-     ErrorF("-switchCmd       Command to execute on vt switch\n");
-     ErrorF("-nozap           Don't terminate server on Ctrl+Alt+Backspace\n");
-+    ErrorF("-hide-cursor     Start with cursor hidden\n");
-+    ErrorF("-root-ppm [path] Specify ppm file to use as root window background.\n");
-     ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
- #ifdef PSEUDO8
-     p8UseMsg ();
- #endif
-+
-+
- }
- 
- int
-@@ -761,6 +772,19 @@
- 	kdSoftCursor = TRUE;
- 	return 1;
-     }
-+    if (!strcmp (argv[i], "-hide-cursor"))
-+    {
-+      CursorInitiallyHidden = TRUE;
-+      return 1;
-+    }
-+    if (!strcmp (argv[i], "-root-ppm"))
-+    {
-+      if ((i+1) < argc)
-+	RootPPM =  argv[i+1];
-+      else
-+	UseMsg ();
-+      return 2;
-+    }
-     if (!strcmp (argv[i], "-videoTest"))
-     {
- 	kdVideoTest = TRUE;
-diff -u -r xorg-server-X11R7.1-1.1.0.orig/xfixes/cursor.c xorg-server-X11R7.1-1.1.0/xfixes/cursor.c
---- xorg-server-X11R7.1-1.1.0.orig/xfixes/cursor.c	2007-01-08 14:30:38.000000000 +0000
-+++ xorg-server-X11R7.1-1.1.0/xfixes/cursor.c	2007-01-11 16:33:00.000000000 +0000
-@@ -59,9 +59,12 @@
- static RESTYPE		CursorWindowType;
- static int		CursorScreenPrivateIndex = -1;
- static int		CursorGeneration;
-+static Bool             CursorGloballyHidden; 
- static CursorPtr	CursorCurrent;
- static CursorPtr        pInvisibleCursor = NULL;
- 
-+Bool CursorInitiallyHidden = FALSE;
-+
- static void deleteCursorHideCountsForScreen (ScreenPtr pScreen);
- 
- #define VERIFY_CURSOR(pCursor, cursor, client, access) { \
-@@ -130,7 +133,7 @@
- 
-     Unwrap (cs, pScreen, DisplayCursor);
- 
--    if (cs->pCursorHideCounts != NULL) {
-+    if (cs->pCursorHideCounts != NULL || CursorGloballyHidden) {
- 	ret = (*pScreen->DisplayCursor) (pScreen, pInvisibleCursor);
-     } else {
- 	ret = (*pScreen->DisplayCursor) (pScreen, pCursor);
-@@ -848,6 +851,12 @@
- 	return BadWindow;
-     }
- 
-+    /* Is cursor set to be initially hidden ?, if so reset this 
-+     * flag as now visibility assumed under control of client.
-+    */
-+    if (CursorGloballyHidden)
-+      CursorGloballyHidden = FALSE;
-+
-     /* 
-      * Has client hidden the cursor before on this screen? 
-      * If so, just increment the count. 
-@@ -899,9 +908,19 @@
- 	return BadWindow;
-     }
- 
-+    /* X was started with cursor hidden, therefore just reset our flag
-+     * (returning to normal client control) and cause cursor to now be
-+     * shown.
-+    */
-+    if (CursorGloballyHidden == TRUE)
-+      {
-+	CursorGloballyHidden = FALSE;
-+	return (client->noClientException);
-+      }
-+
-     /* 
-      * Has client hidden the cursor on this screen?
--     * If not, generate an error.
-+     * If so, generate an error.
-      */
-     pChc = findCursorHideCount(client, pWin->drawable.pScreen);
-     if (pChc == NULL) {
-@@ -1009,6 +1028,8 @@
- XFixesCursorInit (void)
- {
-     int	i;
-+
-+    CursorGloballyHidden = CursorInitiallyHidden;
-     
-     if (CursorGeneration != serverGeneration)
-     {
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-evdev.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-evdev.patch
deleted file mode 100644
index 2dc22bf..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-evdev.patch
+++ /dev/null
@@ -1,515 +0,0 @@
-# Kdrive evdev support patch, posted by Ander Conselvan de Oliveira at
-# http://lists.freedesktop.org/archives/xorg/2005-December/011635.html
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/linux/evdev.c xserver/hw/kdrive/linux/evdev.c
---- xserver.original/hw/kdrive/linux/evdev.c	2005-12-16 10:36:05.000000000 -0200
-+++ xserver/hw/kdrive/linux/evdev.c	2005-12-16 10:40:51.077410192 -0200
-@@ -31,9 +31,11 @@
- #include <X11/X.h>
- #include <X11/Xproto.h>
- #include <X11/Xpoll.h>
-+#include <X11/keysym.h>
- #include "inputstr.h"
- #include "scrnintstr.h"
- #include "kdrive.h"
-+#include "kkeymap.h"
- 
- #define NUM_EVENTS  128
- #define ABS_UNSET   -65535
-@@ -105,9 +107,10 @@
- {
-     KdMouseInfo		*mi = closure;
-     Kevdev		*ke = mi->driver;
--    int			i;
-+    int			i, j;
-     struct input_event	events[NUM_EVENTS];
-     int			n;
-+    int                 flags;
- 
-     n = read (evdevPort, &events, NUM_EVENTS * sizeof (struct input_event));
-     if (n <= 0)
-@@ -115,22 +118,64 @@
-     n /= sizeof (struct input_event);
-     for (i = 0; i < n; i++)
-     {
-+	flags = KD_MOUSE_DELTA | kdMouseInfo->buttonState;
- 	switch (events[i].type) {
- 	case EV_SYN:
- 	    break;
- 	case EV_KEY:
--	    EvdevMotion (mi);
--	    ASSIGNBIT(ke->key,events[i].code, events[i].value);
--	    if (events[i].code < 0x100)
--		ErrorF ("key %d %d\n", events[i].code, events[i].value);
--	    else
--		ErrorF ("key 0x%x %d\n", events[i].code, events[i].value);
-+	  if (events[i].code >= BTN_MOUSE && events[i].code < BTN_JOYSTICK) {
-+	        switch (events[i].code) {
-+		case BTN_LEFT:
-+		  if (events[i].value == 1)
-+		    flags |= KD_BUTTON_1;
-+		  else
-+		    flags &= ~KD_BUTTON_1;
-+		  break;
-+		case BTN_MIDDLE:
-+		  if (events[i].value == 1)
-+		    flags |= KD_BUTTON_2;
-+		  else
-+		    flags &= ~KD_BUTTON_2;
-+		  break;
-+		case BTN_RIGHT:
-+		  if (events[i].value == 1)
-+		    flags |= KD_BUTTON_3;
-+		  else
-+		    flags &= ~KD_BUTTON_3;
-+		  break;
-+		default:
-+		  /* Unknow button */
-+		  break;
-+       	        }
-+		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
-+	    }
- 	    break;
- 	case EV_REL:
--	    ke->rel[events[i].code] += events[i].value;
-+	    if (events[i].code == REL_X) {
-+	      KdEnqueueMouseEvent (kdMouseInfo, flags, events[i].value, 0);
-+	    }
-+	    else if (events[i].code == REL_Y) {
-+	      KdEnqueueMouseEvent (kdMouseInfo, flags, 0, events[i].value);
-+	    }
-+	    else if (events[i].code == REL_WHEEL) {	      
-+	      for (j = 0; j < abs (events[i].value); j++) {
-+		if (events[i].value > 0)
-+		  flags |= KD_BUTTON_4;
-+		else
-+		  flags |= KD_BUTTON_5;
-+
-+		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
-+
-+		if (events[i].value > 0)
-+		  flags &= ~KD_BUTTON_4;
-+		else
-+		  flags &= ~KD_BUTTON_5;
-+
-+		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
-+	      } /* events[i].code == REL_WHEEL */
-+	    }
- 	    break;
- 	case EV_ABS:
--	    ke->abs[events[i].code] = events[i].value;
- 	    break;
- 	}
-     }
-@@ -173,6 +218,12 @@
- 		fd = open (kdefaultEvdev[i], 2);
- 		if (fd >= 0)
- 		{
-+                    if (ioctl (fd, EVIOCGRAB, 1) < 0)
-+                    {
-+                        close (fd);
-+                        continue;
-+                    }
-+
- 		    mi->name = KdSaveString (kdefaultEvdev[i]);
- 		    break;
- 		}
-@@ -287,7 +338,319 @@
-     EvdevFini,
- };
- 
--#if 0
-+/* Keyboard */
-+
-+int kbd_fd = -1;
-+int EvdevInputType = 0;
-+
-+KeySym evdevKeymap[(194 - 1 + 1) * 2] = {
-+/* These are directly mapped from DOS scanset 0 */
-+/*      1     8 */       XK_Escape, NoSymbol,
-+/*      2     9 */       XK_1,  XK_exclam,
-+/*      3    10 */       XK_2,  XK_at,
-+/*      4    11 */       XK_3,  XK_numbersign,
-+/*      5    12 */       XK_4,  XK_dollar,
-+/*      6    13 */       XK_5,  XK_percent,
-+/*      7    14 */       XK_6,  XK_asciicircum,
-+/*      8    15 */       XK_7,  XK_ampersand,
-+/*      9    16 */       XK_8,  XK_asterisk,
-+/*     10    17 */       XK_9,  XK_parenleft,
-+/*     11    18 */       XK_0,  XK_parenright,
-+/*     12    19 */       XK_minus,      XK_underscore,
-+/*     13    20 */       XK_equal,      XK_plus,
-+/*     14    21 */       XK_BackSpace,  NoSymbol,
-+/*     15    22 */       XK_Tab,        NoSymbol,
-+/*     16    23 */       XK_Q,  NoSymbol,
-+/*     17    24 */       XK_W,  NoSymbol,
-+/*     18    25 */       XK_E,  NoSymbol,
-+/*     19    26 */       XK_R,  NoSymbol,
-+/*     20    27 */       XK_T,  NoSymbol,
-+/*     21    28 */       XK_Y,  NoSymbol,
-+/*     22    29 */       XK_U,  NoSymbol,
-+/*     23    30 */       XK_I,  NoSymbol,
-+/*     24    31 */       XK_O,  NoSymbol,
-+/*     25    32 */       XK_P,  NoSymbol,
-+/*     26    33 */       XK_bracketleft,        XK_braceleft,
-+/*     27    34 */       XK_bracketright,       XK_braceright,
-+/*     28    35 */       XK_Return,     NoSymbol,
-+/*     29    36 */       XK_Control_L,  NoSymbol,
-+/*     30    37 */       XK_A,  NoSymbol,
-+/*     31    38 */       XK_S,  NoSymbol,
-+/*     32    39 */       XK_D,  NoSymbol,
-+/*     33    40 */       XK_F,  NoSymbol,
-+/*     34    41 */       XK_G,  NoSymbol,
-+/*     35    42 */       XK_H,  NoSymbol,
-+/*     36    43 */       XK_J,  NoSymbol,
-+/*     37    44 */       XK_K,  NoSymbol,
-+/*     38    45 */       XK_L,  NoSymbol,
-+/*     39    46 */       XK_semicolon,  XK_colon,
-+/*     40    47 */       XK_apostrophe, XK_quotedbl,
-+/*     41    48 */       XK_grave,      XK_asciitilde,
-+/*     42    49 */       XK_Shift_L,    NoSymbol,
-+/*     43    50 */       XK_backslash,  XK_bar,
-+/*     44    51 */       XK_Z,  NoSymbol,
-+/*     45    52 */       XK_X,  NoSymbol,
-+/*     46    53 */       XK_C,  NoSymbol,
-+/*     47    54 */       XK_V,  NoSymbol,
-+/*     48    55 */       XK_B,  NoSymbol,
-+/*     49    56 */       XK_N,  NoSymbol,
-+/*     50    57 */       XK_M,  NoSymbol,
-+/*     51    58 */       XK_comma,      XK_less,
-+/*     52    59 */       XK_period,     XK_greater,
-+/*     53    60 */       XK_slash,      XK_question,
-+/*     54    61 */       XK_Shift_R,    NoSymbol,
-+/*     55    62 */       XK_KP_Multiply,        NoSymbol,
-+/*     56    63 */       XK_Alt_L,      XK_Meta_L,
-+/*     57    64 */       XK_space,      NoSymbol,
-+/*     58    65 */       XK_Caps_Lock,  NoSymbol,
-+/*     59    66 */       XK_F1, NoSymbol,
-+/*     60    67 */       XK_F2, NoSymbol,
-+/*     61    68 */       XK_F3, NoSymbol,
-+/*     62    69 */       XK_F4, NoSymbol,
-+/*     63    70 */       XK_F5, NoSymbol,
-+/*     64    71 */       XK_F6, NoSymbol,
-+/*     65    72 */       XK_F7, NoSymbol,
-+/*     66    73 */       XK_F8, NoSymbol,
-+/*     67    74 */       XK_F9, NoSymbol,
-+/*     68    75 */       XK_F10,        NoSymbol,
-+/*     69    76 */       XK_Break,      XK_Pause,
-+/*     70    77 */       XK_Scroll_Lock,        NoSymbol,
-+/*     71    78 */       XK_KP_Home,    XK_KP_7,
-+/*     72    79 */       XK_KP_Up,      XK_KP_8,
-+/*     73    80 */       XK_KP_Page_Up, XK_KP_9,
-+/*     74    81 */       XK_KP_Subtract,        NoSymbol,
-+/*     75    82 */       XK_KP_Left,    XK_KP_4,
-+/*     76    83 */       XK_KP_5,       NoSymbol,
-+/*     77    84 */       XK_KP_Right,   XK_KP_6,
-+/*     78    85 */       XK_KP_Add,     NoSymbol,
-+/*     79    86 */       XK_KP_End,     XK_KP_1,
-+/*     80    87 */       XK_KP_Down,    XK_KP_2,
-+/*     81    88 */       XK_KP_Page_Down,       XK_KP_3,
-+/*     82    89 */       XK_KP_Insert,  XK_KP_0,
-+/*     83    90 */       XK_KP_Delete,  XK_KP_Decimal,
-+/*     84    91 */     NoSymbol,        NoSymbol,
-+/*     85    92 */     NoSymbol,        NoSymbol,
-+/*     86    93 */     NoSymbol,        NoSymbol,
-+/*     87    94 */       XK_F11,        NoSymbol,
-+/*     88    95 */       XK_F12,        NoSymbol,
-+
-+/* These are remapped from the extended set (using ExtendMap) */
-+
-+/*     89    96 */       XK_Control_R,  NoSymbol,
-+/*     90    97 */       XK_KP_Enter,   NoSymbol,
-+/*     91    98 */       XK_KP_Divide,  NoSymbol,
-+/*     92    99 */       XK_Sys_Req,    XK_Print,
-+/*     93   100 */       XK_Alt_R,      XK_Meta_R,
-+/*     94   101 */       XK_Num_Lock,   NoSymbol,
-+/*     95   102 */       XK_Home,       NoSymbol,
-+/*     96   103 */       XK_Up,         NoSymbol,
-+/*     97   104 */       XK_Page_Up,    NoSymbol,
-+/*     98   105 */       XK_Left,       NoSymbol,
-+/*     99   106 */       XK_Right,      NoSymbol,
-+/*    100   107 */       XK_End,        NoSymbol,
-+/*    101   108 */       XK_Down,       NoSymbol,
-+/*    102   109 */       XK_Page_Down,  NoSymbol,
-+/*    103   110 */       XK_Insert,     NoSymbol,
-+/*    104   111 */       XK_Delete,     NoSymbol,
-+/*    105   112 */       XK_Super_L,    NoSymbol,
-+/*    106   113 */       XK_Super_R,    NoSymbol,
-+/*    107   114 */       XK_Menu,       NoSymbol,
-+/*    108   115 */       NoSymbol,      NoSymbol,
-+/*    109   116 */       NoSymbol,      NoSymbol,
-+/*    110   117 */       NoSymbol,      NoSymbol,
-+/*    111   118 */       NoSymbol,      NoSymbol,
-+/*    112   119 */       NoSymbol,      NoSymbol,
-+
-+/*    113   120 */      NoSymbol,     NoSymbol,
-+/*    114   121 */      NoSymbol,     NoSymbol,
-+/*    115   122 */      NoSymbol,     NoSymbol,
-+/*    116   123 */      NoSymbol,     NoSymbol,
-+/*    117   124 */      NoSymbol,     NoSymbol,
-+/*    118   125 */      NoSymbol,     NoSymbol,
-+/*    119   126 */      NoSymbol,     NoSymbol,
-+/*    120   127 */      NoSymbol,     NoSymbol,
-+/*    121   128 */      NoSymbol,     NoSymbol,
-+/*    122   129 */      NoSymbol,     NoSymbol,
-+/*    123   130 */      NoSymbol,     NoSymbol,
-+/*    124   131 */      NoSymbol,     NoSymbol,
-+/*    125   132 */      NoSymbol,     NoSymbol,
-+/*    126   133 */      NoSymbol,     NoSymbol,
-+/*    127   134 */      NoSymbol,     NoSymbol,
-+/*    128   135 */      NoSymbol,     NoSymbol,
-+/*    129   136 */      NoSymbol,     NoSymbol,
-+/*    130   137 */      NoSymbol,     NoSymbol,
-+/*    131   138 */      NoSymbol,     NoSymbol,
-+/*    132   139 */      NoSymbol,     NoSymbol,
-+/*    133   140 */      NoSymbol,     NoSymbol,
-+/*    134   141 */      NoSymbol,     NoSymbol,
-+/*    135   142 */      NoSymbol,     NoSymbol,
-+/*    136   143 */      NoSymbol,     NoSymbol,
-+/*    137   144 */      NoSymbol,     NoSymbol,
-+/*    138   145 */      NoSymbol,     NoSymbol,
-+/*    139   146 */      NoSymbol,     NoSymbol,
-+/*    140   147 */      NoSymbol,     NoSymbol,
-+/*    141   148 */      NoSymbol,     NoSymbol,
-+/*    142   149 */      NoSymbol,     NoSymbol,
-+/*    143   150 */      NoSymbol,     NoSymbol,
-+/*    144   151 */      NoSymbol,     NoSymbol,
-+/*    145   152 */      NoSymbol,     NoSymbol,
-+/*    146   153 */      NoSymbol,     NoSymbol,
-+/*    147   154 */      NoSymbol,     NoSymbol,
-+/*    148   155 */      NoSymbol,     NoSymbol,
-+/*    149   156 */      NoSymbol,     NoSymbol,
-+/*    150   157 */      NoSymbol,     NoSymbol,
-+/*    151   158 */      NoSymbol,     NoSymbol,
-+/*    152   159 */      NoSymbol,     NoSymbol,
-+/*    153   160 */      NoSymbol,     NoSymbol,
-+/*    154   161 */      NoSymbol,     NoSymbol,
-+/*    155   162 */      NoSymbol,     NoSymbol,
-+/*    156   163 */      NoSymbol,     NoSymbol,
-+/*    157   164 */      NoSymbol,     NoSymbol,
-+/*    158   165 */      NoSymbol,     NoSymbol,
-+/*    159   166 */      NoSymbol,     NoSymbol,
-+/*    160   167 */      NoSymbol,     NoSymbol,
-+/*    161   168 */      NoSymbol,     NoSymbol,
-+/*    162   169 */      NoSymbol,     NoSymbol,
-+/*    163   170 */      NoSymbol,     NoSymbol,
-+/*    164   171 */      NoSymbol,     NoSymbol,
-+/*    165   172 */      NoSymbol,     NoSymbol,
-+/*    166   173 */      NoSymbol,     NoSymbol,
-+/*    167   174 */      NoSymbol,     NoSymbol,
-+/*    168   175 */      NoSymbol,     NoSymbol,
-+/*    169   176 */      NoSymbol,     NoSymbol,
-+/*    170   177 */      NoSymbol,     NoSymbol,
-+/*    171   178 */      NoSymbol,     NoSymbol,
-+/*    172   179 */      NoSymbol,     NoSymbol,
-+/*    173   180 */      NoSymbol,     NoSymbol,
-+/*    174   181 */      NoSymbol,     NoSymbol,
-+/*    175   182 */      NoSymbol,     NoSymbol,
-+/*    176   183 */      NoSymbol,     NoSymbol,
-+/*    177   184 */      NoSymbol,     NoSymbol,
-+/*    178   185 */      NoSymbol,     NoSymbol,
-+/*    179   186 */      NoSymbol,     NoSymbol,
-+/*    180   187 */      NoSymbol,     NoSymbol,
-+/*    181   188 */      NoSymbol,     NoSymbol,
-+/*    182   189 */      NoSymbol,     NoSymbol,
-+/*    183   190 */      NoSymbol,     NoSymbol,
-+/*    184   191 */      NoSymbol,     NoSymbol,
-+/*    185   192 */      NoSymbol,     NoSymbol,
-+/*    186   193 */      NoSymbol,     NoSymbol,
-+/*    187   194 */      NoSymbol,     NoSymbol,
-+/*    188   195 */      NoSymbol,     NoSymbol,
-+/*    189   196 */      NoSymbol,     NoSymbol,
-+/*    190   197 */      NoSymbol,     NoSymbol,
-+/*    191   198 */      NoSymbol,     NoSymbol,
-+/*    192   199 */      NoSymbol,     NoSymbol,
-+/*    193   200 */      NoSymbol,     NoSymbol,
-+/*    194   201 */      NoSymbol,     NoSymbol,
-+};
-+
-+static void
-+EvdevKbdRead (int fd, void *closure)
-+{
-+    int i, n;
-+    struct input_event events[NUM_EVENTS];
-+
-+    n = read (fd, &events, NUM_EVENTS * sizeof (struct input_event));
-+    if (n <= 0)
-+      return;
-+
-+    n /= sizeof (struct input_event);
-+
-+    for (i = 0; i < n; i++)
-+    {
-+        if (events[i].type == EV_KEY)
-+      	    KdEnqueueKeyboardEvent (events[i].code, !events[i].value);
-+    }
-+}
-+
-+static void
-+EvdevKbdLoad (void)
-+{
-+    kdMinScanCode = 0;
-+    kdMaxScanCode = 193;
-+    kdKeymapWidth = 2;
-+    memcpy (kdKeymap, evdevKeymap, sizeof (evdevKeymap));
-+}
-+
-+static int
-+EvdevKbdInit (void)
-+{
-+    int fd, i;
-+
-+    if (!EvdevInputType)
-+        EvdevInputType = KdAllocInputType ();
-+
-+    if (!kdKeyboard)
-+    {
-+        for (i = 0; i < NUM_DEFAULT_EVDEV; i++)
-+        {
-+            fd = open (kdefaultEvdev[i], 2);
-+            if (fd >= 0)
-+            {
-+                kdKeyboard = KdSaveString (kdefaultEvdev[i]);
-+                break;
-+            }
-+	}
-+    }
-+    else
-+    {
-+        fd = open (kdKeyboard, O_RDWR);
-+        if (fd < 0)
-+            return FALSE;
-+    }
-+
-+    if (ioctl (fd, EVIOCGRAB, 1) < 0)
-+    {
-+        close (fd);
-+	return FALSE;
-+    }
-+
-+    if (!KdRegisterFd (EvdevInputType, fd, EvdevKbdRead, NULL))
-+        return FALSE;
-+
-+    kbd_fd = fd;
-+    return TRUE;
-+}
-+
-+static void
-+EvdevKbdFini (void)
-+{
-+}
-+
-+static void
-+EvdevKbdLeds (int leds)
-+{
-+    struct input_event event;
-+
-+    memset(&event, 0, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_CAPSL;
-+    event.value = leds & (1 << 0) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_NUML;
-+    event.value = leds & (1 << 1) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_SCROLLL;
-+    event.value = leds & (1 << 2) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_COMPOSE;
-+    event.value = leds & (1 << 3) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+}
-+
-+static void
-+EvdevKbdBell (int volume, int frequency, int duration)
-+{
-+}
-+
- KdKeyboardFuncs LinuxEvdevKeyboardFuncs = {
-     EvdevKbdLoad,
-     EvdevKbdInit,
-@@ -296,4 +659,4 @@
-     EvdevKbdFini,
-     0,
- };
--#endif
-+
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kdrive.c xserver/hw/kdrive/src/kdrive.c
---- xserver.original/hw/kdrive/src/kdrive.c	2005-12-16 10:36:07.000000000 -0200
-+++ xserver/hw/kdrive/src/kdrive.c	2005-12-16 10:37:09.000000000 -0200
-@@ -73,6 +73,7 @@
- Bool		    kdEnabled;
- int		    kdSubpixelOrder;
- int		    kdVirtualTerminal = -1;
-+char		    *kdKeyboard = 0;
- Bool		    kdSwitchPending;
- char		    *kdSwitchCmd;
- DDXPointRec	    kdOrigin;
-@@ -795,6 +796,14 @@
- 	    UseMsg ();
- 	return 2;
-     }
-+    if (!strcmp (argv[i], "-keyboard"))
-+    {
-+	if ((i+1) < argc)
-+	    kdKeyboard = argv[i+1];
-+	else
-+	    UseMsg ();
-+	return 2;
-+    }
-     if (!strcmp (argv[i], "-rgba"))
-     {
- 	if ((i+1) < argc)
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kdrive.h xserver/hw/kdrive/src/kdrive.h
---- xserver.original/hw/kdrive/src/kdrive.h	2005-12-16 10:36:07.000000000 -0200
-+++ xserver/hw/kdrive/src/kdrive.h	2005-12-16 10:37:09.000000000 -0200
-@@ -416,6 +416,7 @@
- extern Bool		kdDisableZaphod;
- extern Bool		kdDontZap;
- extern int		kdVirtualTerminal;
-+extern char		*kdKeyboard;
- extern char		*kdSwitchCmd;
- extern KdOsFuncs	*kdOsFuncs;
- 
-@@ -769,7 +770,7 @@
- ProcessInputEvents (void);
- 
- extern KdMouseFuncs	LinuxMouseFuncs;
--extern KdMouseFuncs	LinuxEvdevFuncs;
-+extern KdMouseFuncs	LinuxEvdevMouseFuncs;
- extern KdMouseFuncs	Ps2MouseFuncs;
- extern KdMouseFuncs	BusMouseFuncs;
- extern KdMouseFuncs	MsMouseFuncs;
-@@ -777,6 +778,7 @@
- extern KdMouseFuncs	TsFuncs;
- #endif
- extern KdKeyboardFuncs	LinuxKeyboardFuncs;
-+extern KdKeyboardFuncs	LinuxEvdevKeyboardFuncs;
- extern KdOsFuncs	LinuxFuncs;
- 
- extern KdMouseFuncs	VxWorksMouseFuncs;
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kinput.c xserver/hw/kdrive/src/kinput.c
---- xserver.original/hw/kdrive/src/kinput.c	2005-12-16 10:36:07.000000000 -0200
-+++ xserver/hw/kdrive/src/kinput.c	2005-12-16 10:37:09.000000000 -0200
-@@ -1300,6 +1300,7 @@
- 	    xE.u.u.type = KeyPress;
- 	xE.u.u.detail = key_code;
- 	
-+#ifndef XKB
- 	switch (KEYCOL1(key_code)) 
- 	{
- 	case XK_Num_Lock:
-@@ -1313,6 +1314,7 @@
- 	    else
- 		xE.u.u.type = KeyPress;
- 	}
-+#endif
- 	
- 	/*
- 	 * Check pressed keys which are already down
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch
deleted file mode 100644
index 28d7325..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/kdrive-use-evdev.patch
+++ /dev/null
@@ -1,54 +0,0 @@
---- xserver/hw/kdrive/fbdev/fbinit.c~	2006-01-31 17:09:33.000000000 +0100
-+++ xserver/hw/kdrive/fbdev/fbinit.c	2006-01-31 17:11:55.000000000 +0100
-@@ -28,6 +28,8 @@
- #endif
- #include <fbdev.h>
- 
-+extern int use_evdev;
-+
- void
- InitCard (char *name)
- {
-@@ -45,7 +47,10 @@
- void
- InitInput (int argc, char **argv)
- {
--    KdInitInput (&LinuxMouseFuncs, &LinuxKeyboardFuncs);
-+    if (use_evdev)
-+        KdInitInput (&LinuxEvdevMouseFuncs, &LinuxEvdevKeyboardFuncs);
-+    else
-+        KdInitInput (&LinuxMouseFuncs, &LinuxKeyboardFuncs);
- #ifdef TOUCHSCREEN
-     KdAddMouseDriver (&TsFuncs);
- #endif
---- xserver/hw/kdrive/src/kdrive.c.orig	2006-01-31 17:13:28.000000000 +0100
-+++ xserver/hw/kdrive/src/kdrive.c	2006-01-31 17:15:28.000000000 +0100
-@@ -44,6 +44,8 @@
- #include "dpmsproc.h"
- #endif
- 
-+int use_evdev = 0;
-+
- typedef struct _kdDepths {
-     CARD8   depth;
-     CARD8   bpp;
-@@ -687,6 +689,7 @@
-     ErrorF("-videoTest       Start the server, pause momentarily and exit\n");
-     ErrorF("-origin X,Y      Locates the next screen in the the virtual screen (Xinerama)\n");
-     ErrorF("-mouse path[,n]  Filename of mouse device, n is number of buttons\n");
-+    ErrorF("-use-evdev       Use Linux evdev input\n");
-     ErrorF("-switchCmd       Command to execute on vt switch\n");
-     ErrorF("-nozap           Don't terminate server on Ctrl+Alt+Backspace\n");
-     ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
-@@ -796,6 +799,11 @@
- 	    UseMsg ();
- 	return 2;
-     }
-+    if (!strcmp (argv[i], "-use-evdev"))
-+    {
-+	use_evdev = 1;
-+	return 1;
-+    }
-     if (!strcmp (argv[i], "-keyboard"))
-     {
- 	if ((i+1) < argc)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/optional-xkb.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/optional-xkb.patch
deleted file mode 100644
index a580b50..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/optional-xkb.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Index: xorg-server-1.2.0/Makefile.am
-===================================================================
---- xorg-server-1.2.0.orig/Makefile.am	2007-01-23 06:39:15.000000000 +0100
-+++ xorg-server-1.2.0/Makefile.am	2007-03-28 20:26:19.000000000 +0200
-@@ -30,6 +30,10 @@
- XINPUT_DIR=Xi
- endif
- 
-+if XKB
-+XKB_DIR=xkb
-+endif
-+
- if DBE
- DBE_DIR=dbe
- endif
-@@ -46,7 +50,7 @@
- 	randr \
- 	render  \
- 	$(XINPUT_DIR) \
--	xkb \
-+	$(XKB_DIR) \
- 	$(DBE_DIR) \
- 	$(MFB_DIR) \
- 	$(AFB_DIR) \
-Index: xorg-server-1.2.0/configure.ac
-===================================================================
---- xorg-server-1.2.0.orig/configure.ac	2007-01-23 06:39:15.000000000 +0100
-+++ xorg-server-1.2.0/configure.ac	2007-03-28 20:27:13.000000000 +0200
-@@ -428,6 +428,7 @@
- AC_ARG_ENABLE(dpms,           AS_HELP_STRING([--disable-dpms], [Build DPMS extension (default: enabled)]), [DPMSExtension=$enableval], [DPMSExtension=yes])
- AC_ARG_ENABLE(xinput,         AS_HELP_STRING([--disable-xinput], [Build XInput Extension (default: enabled)]), [XINPUT=$enableval], [XINPUT=yes])
- AC_ARG_ENABLE(xfree86-utils,     AS_HELP_STRING([--enable-xfree86-utils], [Build xfree86 DDX utilities (default: enabled)]), [XF86UTILS=$enableval], [XF86UTILS=yes])
-+AC_ARG_ENABLE(xkb,            AS_HELP_STRING([--disable-xkb], [Build XKB (default: enabled)]), [XKB=$enableval], [XKB=yes])
- 
- dnl DDXes.
- AC_ARG_ENABLE(xorg,    	      AS_HELP_STRING([--enable-xorg], [Build Xorg server (default: auto)]), [XORG=$enableval], [XORG=auto])
-@@ -754,12 +755,15 @@
- 
- AC_DEFINE(SHAPE, 1, [Support SHAPE extension])
- 
--AC_DEFINE(XKB, 1, [Build XKB])
--AC_DEFINE(XKB_IN_SERVER, 1, [Build XKB server])
--AC_DEFINE(XKB_DFLT_DISABLED, 0, [Disable XKB per default])
--REQUIRED_MODULES="$REQUIRED_MODULES xkbfile"
--XKB_LIB='$(top_builddir)/xkb/libxkb.la'
--XKB_STUB_LIB='$(top_builddir)/xkb/libxkbstubs.la'
-+AM_CONDITIONAL(XKB, [test "x$XKB" = xyes])
-+if test "x$XKB" = xyes; then
-+	AC_DEFINE(XKB, 1, [Build XKB])
-+	AC_DEFINE(XKB_IN_SERVER, 1, [Build XKB server])
-+	AC_DEFINE(XKB_DFLT_DISABLED, 0, [Disable XKB per default])
-+	REQUIRED_MODULES="$REQUIRED_MODULES xkbfile"
-+	XKB_LIB='$(top_builddir)/xkb/libxkb.la'
-+	XKB_STUB_LIB='$(top_builddir)/xkb/libxkbstubs.la'
-+fi
- 
- AC_CHECK_FUNC(strcasecmp, [], AC_DEFINE([NEED_STRCASECMP], 1,
-                                         [Do not have `strcasecmp'.]))
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
deleted file mode 100644
index 72c8a18..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/report-correct-randr12.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-Server reports XRandR version provided by libxrandr instead of XRandR
-version implemented. It confuses applications that execute XRandR
-version dependent code (e. g. gtk+ >= 2.18.0).
-
-Index: xorg-server-1.3.0.0/randr/rrdispatch.c
-===================================================================
---- xorg-server-1.3.0.0.orig/randr/rrdispatch.c
-+++ xorg-server-1.3.0.0/randr/rrdispatch.c
-@@ -22,6 +22,9 @@
- 
- #include "randrstr.h"
- 
-+#define SERVER_RANDR_MAJOR	1
-+#define SERVER_RANDR_MINOR	2
-+
- Bool
- RRClientKnowsRates (ClientPtr	pClient)
- {
-@@ -49,8 +52,8 @@ ProcRRQueryVersion (ClientPtr client)
-      * Report the current version; the current
-      * spec says they're all compatible after 1.0
-      */
--    rep.majorVersion = RANDR_MAJOR;
--    rep.minorVersion = RANDR_MINOR;
-+    rep.majorVersion = SERVER_RANDR_MAJOR;
-+    rep.minorVersion = SERVER_RANDR_MINOR;
-     if (client->swapped) {
-     	swaps(&rep.sequenceNumber, n);
-     	swapl(&rep.length, n);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/scheduler.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/scheduler.patch
deleted file mode 100644
index 395bc7d..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/scheduler.patch
+++ /dev/null
@@ -1,151 +0,0 @@
->From 48e4d08e99de41047c6b6fde5ba9d12787881c23 Mon Sep 17 00:00:00 2001
-From: root <root@benny.jf.intel.com>
-Date: Sun, 28 Oct 2007 09:37:52 +0100
-Subject: [PATCH] The smart scheduler itimer currently always fires after each request
- (which in turn causes the CPU to wake out of idle, burning precious power).
- Rather than doing this, just stop the timer before going into the select()
- portion of the WaitFor loop. It's a cheap system call, and it will only get
- called if there's no more commands batched up from the active fd.
-
-This change also allows some of the functions to be simplified; setitimer()
-will only fail if it's passed invalid data, and we don't do that... so make
-it void and remove all the conditional code that deals with failure.
-
-The change also allows us to remove a few variables that were used for
-housekeeping between the signal handler and the main loop.
----
- include/dixstruct.h |    6 ++----
- os/WaitFor.c        |   11 +++--------
- os/utils.c          |   28 +++-------------------------
- 3 files changed, 8 insertions(+), 37 deletions(-)
-
-diff --git a/include/dixstruct.h b/include/dixstruct.h
-index dd6347f..bed31dc 100644
---- a/include/dixstruct.h
-+++ b/include/dixstruct.h
-@@ -150,11 +150,9 @@ extern long SmartScheduleTime;
- extern long SmartScheduleInterval;
- extern long SmartScheduleSlice;
- extern long SmartScheduleMaxSlice;
--extern unsigned long SmartScheduleIdleCount;
- extern Bool SmartScheduleDisable;
--extern Bool SmartScheduleIdle;
--extern Bool SmartScheduleTimerStopped;
--extern Bool SmartScheduleStartTimer(void);
-+extern void SmartScheduleStartTimer(void);
-+extern void SmartScheduleStopTimer(void);
- #define SMART_MAX_PRIORITY  (20)
- #define SMART_MIN_PRIORITY  (-20)
- 
-diff --git a/os/WaitFor.c b/os/WaitFor.c
-index ec1592c..7683477 100644
---- a/os/WaitFor.c
-+++ b/os/WaitFor.c
-@@ -217,7 +217,8 @@ WaitForSomething(int *pClientsReady)
- 	XFD_COPYSET(&AllSockets, &LastSelectMask);
- #ifdef SMART_SCHEDULE
- 	}
--	SmartScheduleIdle = TRUE;
-+	SmartScheduleStopTimer ();
-+
- #endif
- 	BlockHandler((pointer)&wt, (pointer)&LastSelectMask);
- 	if (NewOutputPending)
-@@ -237,13 +238,7 @@ WaitForSomething(int *pClientsReady)
- 	selecterr = GetErrno();
- 	WakeupHandler(i, (pointer)&LastSelectMask);
- #ifdef SMART_SCHEDULE
--	if (i >= 0)
--	{
--	    SmartScheduleIdle = FALSE;
--	    SmartScheduleIdleCount = 0;
--	    if (SmartScheduleTimerStopped)
--		(void) SmartScheduleStartTimer ();
--	}
-+	SmartScheduleStartTimer ();
- #endif
- 	if (i <= 0) /* An error or timeout occurred */
- 	{
-diff --git a/os/utils.c b/os/utils.c
-index 31cb0af..6fc1f7d 100644
---- a/os/utils.c
-+++ b/os/utils.c
-@@ -1513,10 +1513,6 @@ XNFstrdup(const char *s)
- 
- #ifdef SMART_SCHEDULE
- 
--unsigned long	SmartScheduleIdleCount;
--Bool		SmartScheduleIdle;
--Bool		SmartScheduleTimerStopped;
--
- #ifdef SIGVTALRM
- #define SMART_SCHEDULE_POSSIBLE
- #endif
-@@ -1526,7 +1522,7 @@ Bool		SmartScheduleTimerStopped;
- #define SMART_SCHEDULE_TIMER		ITIMER_REAL
- #endif
- 
--static void
-+void
- SmartScheduleStopTimer (void)
- {
- #ifdef SMART_SCHEDULE_POSSIBLE
-@@ -1537,38 +1533,28 @@ SmartScheduleStopTimer (void)
-     timer.it_value.tv_sec = 0;
-     timer.it_value.tv_usec = 0;
-     (void) setitimer (ITIMER_REAL, &timer, 0);
--    SmartScheduleTimerStopped = TRUE;
- #endif
- }
- 
--Bool
-+void
- SmartScheduleStartTimer (void)
- {
- #ifdef SMART_SCHEDULE_POSSIBLE
-     struct itimerval	timer;
-     
--    SmartScheduleTimerStopped = FALSE;
-     timer.it_interval.tv_sec = 0;
-     timer.it_interval.tv_usec = SmartScheduleInterval * 1000;
-     timer.it_value.tv_sec = 0;
-     timer.it_value.tv_usec = SmartScheduleInterval * 1000;
--    return setitimer (ITIMER_REAL, &timer, 0) >= 0;
-+    setitimer (ITIMER_REAL, &timer, 0);
- #endif
--    return FALSE;
- }
- 
- #ifdef SMART_SCHEDULE_POSSIBLE
- static void
- SmartScheduleTimer (int sig)
- {
--    int olderrno = errno;
--
-     SmartScheduleTime += SmartScheduleInterval;
--    if (SmartScheduleIdle)
--    {
--	SmartScheduleStopTimer ();
--    }
--    errno = olderrno;
- }
- #endif
- 
-@@ -1592,14 +1578,6 @@ SmartScheduleInit (void)
- 	perror ("sigaction for smart scheduler");
- 	return FALSE;
-     }
--    /* Set up the virtual timer */
--    if (!SmartScheduleStartTimer ())
--    {
--	perror ("scheduling timer");
--	return FALSE;
--    }
--    /* stop the timer and wait for WaitForSomething to start it */
--    SmartScheduleStopTimer ();
-     return TRUE;
- #else
-     return FALSE;
--- 
-1.5.3.4
-
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/xcalibrate_coords.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/xcalibrate_coords.patch
deleted file mode 100644
index e0cca54..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/xcalibrate_coords.patch
+++ /dev/null
@@ -1,122 +0,0 @@
----
- Xext/xcalibrate.c      |   47 ++++++++++++++++++++++++++++++++++++++++++++++-
- hw/kdrive/src/kdrive.h |    3 +++
- hw/kdrive/src/kinput.c |   12 ++++++++++++
- 3 files changed, 61 insertions(+), 1 deletion(-)
-
-Index: xorg-server-1.3.0.0/Xext/xcalibrate.c
-===================================================================
---- xorg-server-1.3.0.0.orig/Xext/xcalibrate.c	2007-06-29 17:30:03.000000000 +0100
-+++ xorg-server-1.3.0.0/Xext/xcalibrate.c	2007-06-30 14:04:40.000000000 +0100
-@@ -166,7 +166,6 @@ ProcXCalibrateSetRawMode (ClientPtr clie
-   return (client->noClientException);
- }
- 
--
- static int
- SProcXCalibrateSetRawMode (ClientPtr client)
- {
-@@ -180,6 +179,47 @@ SProcXCalibrateSetRawMode (ClientPtr cli
-   return ProcXCalibrateSetRawMode(client);
- }
- 
-+static int
-+ProcXCalibrateScreenToCoord (ClientPtr client)
-+{
-+  REQUEST(xXCalibrateScreenToCoordReq);
-+  xXCalibrateScreenToCoordReply rep;
-+
-+  REQUEST_SIZE_MATCH (xXCalibrateScreenToCoordReq);
-+
-+  memset (&rep, 0, sizeof (rep));
-+  rep.type = X_Reply;
-+  rep.sequenceNumber = client->sequence;
-+  rep.x = stuff->x;
-+  rep.y = stuff->y;
-+
-+  KdScreenToMouseCoords(&rep.x, &rep.y);
-+
-+  if (client->swapped)
-+    {
-+      int n;
-+
-+      swaps (&rep.x, n);
-+      swaps (&rep.y, n);
-+    }
-+  WriteToClient(client, sizeof (rep), (char *) &rep);
-+  return (client->noClientException);
-+}
-+
-+static int
-+SProcXCalibrateScreenToCoord (ClientPtr client)
-+{
-+  REQUEST(xXCalibrateScreenToCoordReq);
-+  int n;
-+
-+  REQUEST_SIZE_MATCH (xXCalibrateScreenToCoordReq);
-+
-+  swaps(&stuff->x, n);
-+  swaps(&stuff->y, n);
-+
-+  return ProcXCalibrateScreenToCoord(client);
-+}
-+
- static void
- XCalibrateResetProc (ExtensionEntry *extEntry) 
- { 
-@@ -194,6 +234,9 @@ ProcXCalibrateDispatch (ClientPtr client
-         return ProcXCalibrateQueryVersion(client);
-     case X_XCalibrateRawMode:
-         return ProcXCalibrateSetRawMode(client);
-+    case X_XCalibrateScreenToCoord:
-+        return ProcXCalibrateScreenToCoord(client);
-+
-     default: break;
-     }
- 
-@@ -213,6 +256,8 @@ SProcXCalibrateDispatch (ClientPtr clien
-         return SProcXCalibrateQueryVersion(client);
-     case X_XCalibrateRawMode:
-         return SProcXCalibrateSetRawMode(client);
-+    case X_XCalibrateScreenToCoord:
-+        return SProcXCalibrateScreenToCoord(client);
- 
-     default: break;
-     }
-Index: xorg-server-1.3.0.0/hw/kdrive/src/kdrive.h
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/src/kdrive.h	2007-06-30 13:43:45.000000000 +0100
-+++ xorg-server-1.3.0.0/hw/kdrive/src/kdrive.h	2007-06-30 13:45:03.000000000 +0100
-@@ -746,6 +746,9 @@ void
- KdSetMouseMatrix (KdMouseMatrix *matrix);
- 
- void
-+KdScreenToMouseCoords (int *x, int *y);
-+
-+void
- KdComputeMouseMatrix (KdMouseMatrix *matrix, Rotation randr, int width, int height);
-     
- void
-Index: xorg-server-1.3.0.0/hw/kdrive/src/kinput.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/src/kinput.c	2007-06-29 17:30:16.000000000 +0100
-+++ xorg-server-1.3.0.0/hw/kdrive/src/kinput.c	2007-06-30 15:52:16.000000000 +0100
-@@ -381,6 +381,18 @@ KdSetMouseMatrix (KdMouseMatrix *matrix)
- }
- 
- void
-+KdScreenToMouseCoords (int *x, int *y)
-+{
-+    int	(*m)[3] = kdMouseMatrix.matrix;
-+    int div = m[0][1] * m[1][0] - m[1][1] * m[0][0];
-+    int sx = *x;
-+    int sy = *y;
-+
-+    *x = (m[0][1] * sy - m[0][1] * m[1][2] + m[1][1] * m[0][2] - m[1][1] * sx) / div;
-+    *y = (m[1][0] * sx + m[0][0] * m[1][2] - m[1][0] * m[0][2] - m[0][0] * sy) / div;
-+}
-+
-+void
- KdComputeMouseMatrix (KdMouseMatrix *m, Rotation randr, int width, int height)
- {
-     int		    x_dir = 1, y_dir = 1;
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
deleted file mode 100644
index 2341e40..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/crosscompile.patch
+++ /dev/null
@@ -1,19 +0,0 @@
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
- AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
- 				[ FONTPATH="$withval" ],
- 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
deleted file mode 100644
index bd88427..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/disable-apm.patch
+++ /dev/null
@@ -1,20 +0,0 @@
---- xserver/hw/kdrive/linux/linux.c.orig	2005-04-23 15:56:13.988849232 +0000
-+++ xserver/hw/kdrive/linux/linux.c	2005-04-23 15:57:05.001094192 +0000
-@@ -342,7 +342,7 @@
-     /*
-      * Open the APM driver
-      */
--    LinuxApmFd = open ("/dev/apm_bios", 2);
-+    /*LinuxApmFd = open ("/dev/apm_bios", 2);
-     if (LinuxApmFd < 0 && errno == ENOENT)
- 	LinuxApmFd = open ("/dev/misc/apm_bios", 2); 
-     if (LinuxApmFd >= 0)
-@@ -352,7 +352,7 @@
- 	RegisterBlockAndWakeupHandlers (LinuxApmBlock, LinuxApmWakeup, 0);
- 	AddEnabledDevice (LinuxApmFd);
-     }
--	
-+    */	
-     /*
-      * now get the VT
-      */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
deleted file mode 100644
index 13a6c2c..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-builtin-fonts.patch
+++ /dev/null
@@ -1,12 +0,0 @@
---- xorg-server-X11R7.1-1.1.0/dix/dixfonts.c.orig	2006-06-08 14:49:12.158684250 +0200
-+++ xorg-server-X11R7.1-1.1.0/dix/dixfonts.c	2006-06-08 14:49:52.493205000 +0200
-@@ -52,8 +52,8 @@
- /* $Xorg: dixfonts.c,v 1.4 2000/08/17 19:48:18 cpqbld Exp $ */
- 
- #define NEED_REPLIES
- #ifdef HAVE_DIX_CONFIG_H
--#include <dix-config.h>
-+#include <kdrive-config.h>
- #endif
- 
- #include <X11/X.h>
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
deleted file mode 100644
index 9794e98..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/enable-xcalibrate.patch
+++ /dev/null
@@ -1,148 +0,0 @@
----
- Xext/Makefile.am           |    6 ++++++
- configure.ac               |   11 +++++++++--
- include/kdrive-config.h.in |    3 +++
- mi/miinitext.c             |    6 ++++++
- 4 files changed, 24 insertions(+), 2 deletions(-)
-
-Index: xorg-server-1.7.99.2/mi/miinitext.c
-===================================================================
---- xorg-server-1.7.99.2.orig/mi/miinitext.c	2010-02-10 18:54:11.959086237 +0000
-+++ xorg-server-1.7.99.2/mi/miinitext.c	2010-02-10 18:54:12.429078513 +0000
-@@ -264,6 +264,9 @@
- #ifdef DMXEXT
- extern void DMXExtensionInit(INITARGS);
- #endif
-+#ifdef XCALIBRATE
-+extern void XCalibrateExtensionInit(INITARGS);
-+#endif
- #ifdef XFIXES
- extern void XFixesExtensionInit(INITARGS);
- #endif
-@@ -493,6 +496,9 @@
- 	GlxPushProvider(&__glXDRISWRastProvider);
-     if (!noGlxExtension) GlxExtensionInit();
- #endif
-+#ifdef  XCALIBRATE
-+    XCalibrateExtensionInit ();
-+#endif
- }
- 
- #else /* XFree86LOADER */
-Index: xorg-server-1.7.99.2/configure.ac
-===================================================================
---- xorg-server-1.7.99.2.orig/configure.ac	2010-02-10 18:54:11.959086237 +0000
-+++ xorg-server-1.7.99.2/configure.ac	2010-02-11 11:49:50.710736962 +0000
-@@ -1985,7 +1985,7 @@
-     fi
- 
- 
--    PKG_CHECK_MODULES([TSLIB], [tslib-0.0], [HAVE_TSLIB="yes"], [HAVE_TSLIB="no"])
-+    PKG_CHECK_MODULES([TSLIB], [tslib-1.0], [HAVE_TSLIB="yes"], [HAVE_TSLIB="no"])
-     if test "x$HAVE_TSLIB" = xno; then
-         AC_CHECK_LIB(ts, ts_open, [HAVE_TSLIB="yes"])
-     fi
-@@ -2039,7 +2039,7 @@
-     KDRIVE_LOCAL_LIBS="$MAIN_LIB $DIX_LIB $KDRIVE_LIB $KDRIVE_STUB_LIB $CONFIG_LIB"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $FB_LIB $MI_LIB $KDRIVE_PURE_LIBS"
-     KDRIVE_LOCAL_LIBS="$KDRIVE_LOCAL_LIBS $KDRIVE_OS_LIB $OS_LIB"
--    KDRIVE_LIBS="$TSLIB_LIBS $KDRIVE_LOCAL_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS $DLOPEN_LIBS"
-+    KDRIVE_LIBS="$KDRIVE_LOCAL_LIBS $TSLIB_LIBS $XSERVER_SYS_LIBS $GLX_SYS_LIBS $DLOPEN_LIBS"
- 
-     AC_SUBST([XEPHYR_LIBS])
-     AC_SUBST([XEPHYR_INCS])
-Index: xorg-server-1.7.99.2/include/kdrive-config.h.in
-===================================================================
---- xorg-server-1.7.99.2.orig/include/kdrive-config.h.in	2010-02-10 18:54:11.959086237 +0000
-+++ xorg-server-1.7.99.2/include/kdrive-config.h.in	2010-02-10 18:54:12.429078513 +0000
-@@ -28,4 +28,7 @@
- /* Have execinfo.h for backtrace(). */
- #undef HAVE_EXECINFO_H
- 
-+/* Enable XCalibrate extension */
-+#undef XCALIBRATE
-+
- #endif /* _KDRIVE_CONFIG_H_ */
-Index: xorg-server-1.7.99.2/hw/kdrive/linux/tslib.c
-===================================================================
---- xorg-server-1.7.99.2.orig/hw/kdrive/linux/tslib.c	2010-02-10 18:58:12.669078495 +0000
-+++ xorg-server-1.7.99.2/hw/kdrive/linux/tslib.c	2010-02-10 19:04:56.927828767 +0000
-@@ -50,12 +50,15 @@
-     int fd;
-     int lastx, lasty;
-     struct tsdev *tsDev;
--    void (*raw_event_hook)(int x, int y, int pressure, void *closure);
--    void *raw_event_closure;
-     int phys_screen;
- };
- 
- 
-+/* For XCalibrate extension */
-+void (*tslib_raw_event_hook)(int x, int y, int pressure, void *closure);
-+void *tslib_raw_event_closure;
-+
-+
- static void
- TsRead (int fd, void *closure)
- {
-@@ -65,10 +68,10 @@
-     long                x = 0, y = 0;
-     unsigned long       flags;
- 
--    if (private->raw_event_hook) {
-+    if (tslib_raw_event_hook) {
-         while (ts_read_raw(private->tsDev, &event, 1) == 1)
--            private->raw_event_hook (event.x, event.y, event.pressure,
--                                     private->raw_event_closure);
-+            tslib_raw_event_hook (event.x, event.y, event.pressure,
-+                                     tslib_raw_event_closure);
-         return;
-     }
- 
-@@ -111,8 +114,8 @@
- {
-     struct TslibPrivate *private = pi->driverPrivate;
- 
--    private->raw_event_hook = NULL;
--    private->raw_event_closure = NULL;
-+    tslib_raw_event_hook = NULL;
-+    tslib_raw_event_closure = NULL;
-     if (!pi->path) {
-         pi->path = strdup("/dev/input/touchscreen0");
-         ErrorF("[tslib/TslibEnable] no device path given, trying %s\n", pi->path);
-Index: xorg-server-1.7.99.2/Xext/xcalibrate.c
-===================================================================
---- xorg-server-1.7.99.2.orig/Xext/xcalibrate.c	2010-02-10 18:59:24.097829840 +0000
-+++ xorg-server-1.7.99.2/Xext/xcalibrate.c	2010-02-11 11:51:00.930735731 +0000
-@@ -115,6 +115,7 @@
- 
-   memset (&rep, 0, sizeof (rep));
-   rep.type = X_Reply;
-+  rep.length = 0;
-   rep.sequenceNumber = client->sequence;
- 
-   if (stuff->on)
-@@ -158,6 +159,7 @@
- 
-       swaps (&rep.sequenceNumber, n);
-       swaps (&rep.status, n);
-+      swapl (&rep.length, n);
-     }
-   WriteToClient(client, sizeof (rep), (char *) &rep);
-   return (client->noClientException);
-@@ -186,6 +188,7 @@
- 
-   memset (&rep, 0, sizeof (rep));
-   rep.type = X_Reply;
-+  rep.length = 0;
-   rep.sequenceNumber = client->sequence;
-   rep.x = stuff->x;
-   rep.y = stuff->y;
-@@ -198,6 +201,7 @@
- 
-       swaps (&rep.x, n);
-       swaps (&rep.y, n);
-+      swapl (&rep.length, n);
-     }
-   WriteToClient(client, sizeof (rep), (char *) &rep);
-   return (client->noClientException);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
deleted file mode 100644
index 14cf990..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/extra-kmodes.patch
+++ /dev/null
@@ -1,83 +0,0 @@
-Add some extra video modes and change the default to VGA.
-
----
- hw/kdrive/src/kmode.c |   41 +++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 39 insertions(+), 2 deletions(-)
-
-Index: xorg-server-1.3.0.0/hw/kdrive/src/kmode.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/src/kmode.c	2008-01-11 14:20:47.000000000 +0000
-+++ xorg-server-1.3.0.0/hw/kdrive/src/kmode.c	2008-01-11 14:21:18.000000000 +0000
-@@ -32,6 +32,31 @@ const KdMonitorTiming  kdMonitorTimings[
-     /*	H	V	Hz	KHz */
- 		/*  FP	    BP	    BLANK   POLARITY */
- 
-+	/* Treo 650 */
-+
-+    {   320,	320,	64,	16256,
-+	            17,	    12,	    32,     KdSyncNegative,
-+	            1,      11,     14,     KdSyncNegative,
-+    },
-+    
-+    {   320,	320,	64,	    0,
-+	            0,	    0,	    0,     KdSyncNegative,
-+	            0,      0,      0,     KdSyncNegative,
-+    },
-+	
-+	/* LifeDrive/T3/TX modes */
-+
-+    {   320,	480,	64,	16256,
-+	            17,	    12,	    32,     KdSyncNegative,
-+	            1,      11,     14,     KdSyncNegative,
-+    },
-+    
-+    {   480,	320,	64,	    0,
-+	            0,	    0,	    0,     KdSyncNegative,
-+	            0,      0,      0,     KdSyncNegative,
-+    },
-+
-+
-     /* IPAQ modeline:
-      *
-      * Modeline "320x240"      5.7222 320 337 340 352   240 241 244 254"
-@@ -41,6 +66,11 @@ const KdMonitorTiming  kdMonitorTimings[
- 	            1,      11,     14,     KdSyncNegative,
-     },
-     
-+    {   240,	320,	64,	    0,
-+	            0,	    0,	    0,     KdSyncNegative,
-+	            0,      0,      0,     KdSyncNegative,
-+    },
-+
-     /* Other VESA modes */
-     {	640,	350,	85,	31500,			    /* VESA */
- 		    32,	    96,	    192,    KdSyncPositive, /* 26.413 */
-@@ -76,10 +106,19 @@ const KdMonitorTiming  kdMonitorTimings[
- 		    16,	    120,    176,    KdSyncNegative, /* 37.861 */
- 		    1,	    20,	    24,	    KdSyncNegative, /* 72.809 */
-     },
-+    /* DEFAULT */
-+#define MONITOR_TIMING_DEFAULT	13
-     {	640,	480,	60,	25175,			    /* VESA */
- 		   16,	    48,	    160,    KdSyncNegative, /* 31.469 */
- 		   10,	    33,	    45,	    KdSyncNegative, /* 59.940 */
-     },
-+
-+
-+  {   480,    640,    60,     0,                      /* VESA */
-+               0,      0,     0,    KdSyncNegative, /* 31.469 */
-+               0,      0,     0,     KdSyncNegative, /* 59.940 */
-+   },
-+  
-     
-     /* 800x600 modes */
-     {	800,	600,	85,	56250,			    /* VESA */
-@@ -90,8 +129,6 @@ const KdMonitorTiming  kdMonitorTimings[
- 		    16,	    160,    256,    KdSyncPositive, /* 46.875 */
- 		    1,	    21,	    25,	    KdSyncPositive, /* 75.000 */
-     },
--    /* DEFAULT */
--#define MONITOR_TIMING_DEFAULT	9
-     {	800,	600,	72,	50000,			    /* VESA */
- 		    56,	    64,	    240,    KdSyncPositive, /* 48.077 */
- 		    37,	    23,	    66,	    KdSyncPositive, /* 72.188 */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
deleted file mode 100644
index a5c22a5..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fbdev_xrandr_ioctl.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:12.000000000 +0100
-+++ xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:46.000000000 +0100
-@@ -498,6 +498,7 @@
-     KdScreenInfo	*screen = pScreenPriv->screen;
-     FbdevScrPriv	*scrpriv = screen->driver;
-     Bool		wasEnabled = pScreenPriv->enabled;
-+    FbdevPriv		*priv = screen->card->driver;
-     FbdevScrPriv	oldscr;
-     int			oldwidth;
-     int			oldheight;
-@@ -525,11 +526,46 @@
-     oldheight = screen->height;
-     oldmmwidth = pScreen->mmWidth;
-     oldmmheight = pScreen->mmHeight;
--    
-+
-     /*
-      * Set new configuration
-      */
--    
-+
-+    if (newwidth != oldwidth || newheight != oldheight)
-+    {
-+	struct fb_var_screeninfo var;
-+	int k;
-+
-+	k = ioctl (priv->fd, FBIOGET_VSCREENINFO, &var);
-+
-+	if (k < 0)
-+	{
-+	    ErrorF("Error with framebuffer ioctl FBIOGET_VSCREENINFO: %s", strerror (errno));
-+	    return FALSE;
-+	}
-+
-+	var.xres = newwidth;
-+	var.yres = newheight;
-+	var.activate = FB_ACTIVATE_NOW;
-+
-+	k = ioctl (priv->fd, FBIOPUT_VSCREENINFO, &var);
-+
-+	if (k >= 0)
-+	{
-+	    if ((k=ioctl(priv->fd, FBIOGET_FSCREENINFO, &priv->fix)) < 0)
-+	    {
-+		perror("Error with framebuffer ioctl FIOGET_FSCREENINFO");
-+		close (priv->fd);
-+		return FALSE;
-+	    }
-+	    if ((k=ioctl(priv->fd, FBIOGET_VSCREENINFO, &priv->var)) < 0) {
-+		perror("Error  framebuffer ioctl FIOGET_VSCREENINFO");
-+		close (priv->fd);
-+		return FALSE;
-+	    }
-+	}
-+    }
-+
-     scrpriv->randr = KdAddRotation (screen->randr, randr);
- 
-     KdOffscreenSwapOut (screen->pScreen);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
deleted file mode 100644
index eb98fb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/fix-newer-xorg-headers.patch
+++ /dev/null
@@ -1,18 +0,0 @@
----
- render/glyphstr.h |    1 +
- 1 file changed, 1 insertion(+)
-
---- xorg-server-1.3.0.0.orig/render/glyphstr.h
-+++ xorg-server-1.3.0.0/render/glyphstr.h
-@@ -23,10 +23,11 @@
-  */
- 
- #ifndef _GLYPHSTR_H_
- #define _GLYPHSTR_H_
- 
-+#include <X11/X.h>
- #include <X11/extensions/renderproto.h>
- #include "picture.h"
- #include "screenint.h"
- #include "regionstr.h"
- #include "miscstruct.h"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
deleted file mode 100644
index 2dc22bf..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-evdev.patch
+++ /dev/null
@@ -1,515 +0,0 @@
-# Kdrive evdev support patch, posted by Ander Conselvan de Oliveira at
-# http://lists.freedesktop.org/archives/xorg/2005-December/011635.html
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/linux/evdev.c xserver/hw/kdrive/linux/evdev.c
---- xserver.original/hw/kdrive/linux/evdev.c	2005-12-16 10:36:05.000000000 -0200
-+++ xserver/hw/kdrive/linux/evdev.c	2005-12-16 10:40:51.077410192 -0200
-@@ -31,9 +31,11 @@
- #include <X11/X.h>
- #include <X11/Xproto.h>
- #include <X11/Xpoll.h>
-+#include <X11/keysym.h>
- #include "inputstr.h"
- #include "scrnintstr.h"
- #include "kdrive.h"
-+#include "kkeymap.h"
- 
- #define NUM_EVENTS  128
- #define ABS_UNSET   -65535
-@@ -105,9 +107,10 @@
- {
-     KdMouseInfo		*mi = closure;
-     Kevdev		*ke = mi->driver;
--    int			i;
-+    int			i, j;
-     struct input_event	events[NUM_EVENTS];
-     int			n;
-+    int                 flags;
- 
-     n = read (evdevPort, &events, NUM_EVENTS * sizeof (struct input_event));
-     if (n <= 0)
-@@ -115,22 +118,64 @@
-     n /= sizeof (struct input_event);
-     for (i = 0; i < n; i++)
-     {
-+	flags = KD_MOUSE_DELTA | kdMouseInfo->buttonState;
- 	switch (events[i].type) {
- 	case EV_SYN:
- 	    break;
- 	case EV_KEY:
--	    EvdevMotion (mi);
--	    ASSIGNBIT(ke->key,events[i].code, events[i].value);
--	    if (events[i].code < 0x100)
--		ErrorF ("key %d %d\n", events[i].code, events[i].value);
--	    else
--		ErrorF ("key 0x%x %d\n", events[i].code, events[i].value);
-+	  if (events[i].code >= BTN_MOUSE && events[i].code < BTN_JOYSTICK) {
-+	        switch (events[i].code) {
-+		case BTN_LEFT:
-+		  if (events[i].value == 1)
-+		    flags |= KD_BUTTON_1;
-+		  else
-+		    flags &= ~KD_BUTTON_1;
-+		  break;
-+		case BTN_MIDDLE:
-+		  if (events[i].value == 1)
-+		    flags |= KD_BUTTON_2;
-+		  else
-+		    flags &= ~KD_BUTTON_2;
-+		  break;
-+		case BTN_RIGHT:
-+		  if (events[i].value == 1)
-+		    flags |= KD_BUTTON_3;
-+		  else
-+		    flags &= ~KD_BUTTON_3;
-+		  break;
-+		default:
-+		  /* Unknow button */
-+		  break;
-+       	        }
-+		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
-+	    }
- 	    break;
- 	case EV_REL:
--	    ke->rel[events[i].code] += events[i].value;
-+	    if (events[i].code == REL_X) {
-+	      KdEnqueueMouseEvent (kdMouseInfo, flags, events[i].value, 0);
-+	    }
-+	    else if (events[i].code == REL_Y) {
-+	      KdEnqueueMouseEvent (kdMouseInfo, flags, 0, events[i].value);
-+	    }
-+	    else if (events[i].code == REL_WHEEL) {	      
-+	      for (j = 0; j < abs (events[i].value); j++) {
-+		if (events[i].value > 0)
-+		  flags |= KD_BUTTON_4;
-+		else
-+		  flags |= KD_BUTTON_5;
-+
-+		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
-+
-+		if (events[i].value > 0)
-+		  flags &= ~KD_BUTTON_4;
-+		else
-+		  flags &= ~KD_BUTTON_5;
-+
-+		KdEnqueueMouseEvent (kdMouseInfo, flags, 0, 0);
-+	      } /* events[i].code == REL_WHEEL */
-+	    }
- 	    break;
- 	case EV_ABS:
--	    ke->abs[events[i].code] = events[i].value;
- 	    break;
- 	}
-     }
-@@ -173,6 +218,12 @@
- 		fd = open (kdefaultEvdev[i], 2);
- 		if (fd >= 0)
- 		{
-+                    if (ioctl (fd, EVIOCGRAB, 1) < 0)
-+                    {
-+                        close (fd);
-+                        continue;
-+                    }
-+
- 		    mi->name = KdSaveString (kdefaultEvdev[i]);
- 		    break;
- 		}
-@@ -287,7 +338,319 @@
-     EvdevFini,
- };
- 
--#if 0
-+/* Keyboard */
-+
-+int kbd_fd = -1;
-+int EvdevInputType = 0;
-+
-+KeySym evdevKeymap[(194 - 1 + 1) * 2] = {
-+/* These are directly mapped from DOS scanset 0 */
-+/*      1     8 */       XK_Escape, NoSymbol,
-+/*      2     9 */       XK_1,  XK_exclam,
-+/*      3    10 */       XK_2,  XK_at,
-+/*      4    11 */       XK_3,  XK_numbersign,
-+/*      5    12 */       XK_4,  XK_dollar,
-+/*      6    13 */       XK_5,  XK_percent,
-+/*      7    14 */       XK_6,  XK_asciicircum,
-+/*      8    15 */       XK_7,  XK_ampersand,
-+/*      9    16 */       XK_8,  XK_asterisk,
-+/*     10    17 */       XK_9,  XK_parenleft,
-+/*     11    18 */       XK_0,  XK_parenright,
-+/*     12    19 */       XK_minus,      XK_underscore,
-+/*     13    20 */       XK_equal,      XK_plus,
-+/*     14    21 */       XK_BackSpace,  NoSymbol,
-+/*     15    22 */       XK_Tab,        NoSymbol,
-+/*     16    23 */       XK_Q,  NoSymbol,
-+/*     17    24 */       XK_W,  NoSymbol,
-+/*     18    25 */       XK_E,  NoSymbol,
-+/*     19    26 */       XK_R,  NoSymbol,
-+/*     20    27 */       XK_T,  NoSymbol,
-+/*     21    28 */       XK_Y,  NoSymbol,
-+/*     22    29 */       XK_U,  NoSymbol,
-+/*     23    30 */       XK_I,  NoSymbol,
-+/*     24    31 */       XK_O,  NoSymbol,
-+/*     25    32 */       XK_P,  NoSymbol,
-+/*     26    33 */       XK_bracketleft,        XK_braceleft,
-+/*     27    34 */       XK_bracketright,       XK_braceright,
-+/*     28    35 */       XK_Return,     NoSymbol,
-+/*     29    36 */       XK_Control_L,  NoSymbol,
-+/*     30    37 */       XK_A,  NoSymbol,
-+/*     31    38 */       XK_S,  NoSymbol,
-+/*     32    39 */       XK_D,  NoSymbol,
-+/*     33    40 */       XK_F,  NoSymbol,
-+/*     34    41 */       XK_G,  NoSymbol,
-+/*     35    42 */       XK_H,  NoSymbol,
-+/*     36    43 */       XK_J,  NoSymbol,
-+/*     37    44 */       XK_K,  NoSymbol,
-+/*     38    45 */       XK_L,  NoSymbol,
-+/*     39    46 */       XK_semicolon,  XK_colon,
-+/*     40    47 */       XK_apostrophe, XK_quotedbl,
-+/*     41    48 */       XK_grave,      XK_asciitilde,
-+/*     42    49 */       XK_Shift_L,    NoSymbol,
-+/*     43    50 */       XK_backslash,  XK_bar,
-+/*     44    51 */       XK_Z,  NoSymbol,
-+/*     45    52 */       XK_X,  NoSymbol,
-+/*     46    53 */       XK_C,  NoSymbol,
-+/*     47    54 */       XK_V,  NoSymbol,
-+/*     48    55 */       XK_B,  NoSymbol,
-+/*     49    56 */       XK_N,  NoSymbol,
-+/*     50    57 */       XK_M,  NoSymbol,
-+/*     51    58 */       XK_comma,      XK_less,
-+/*     52    59 */       XK_period,     XK_greater,
-+/*     53    60 */       XK_slash,      XK_question,
-+/*     54    61 */       XK_Shift_R,    NoSymbol,
-+/*     55    62 */       XK_KP_Multiply,        NoSymbol,
-+/*     56    63 */       XK_Alt_L,      XK_Meta_L,
-+/*     57    64 */       XK_space,      NoSymbol,
-+/*     58    65 */       XK_Caps_Lock,  NoSymbol,
-+/*     59    66 */       XK_F1, NoSymbol,
-+/*     60    67 */       XK_F2, NoSymbol,
-+/*     61    68 */       XK_F3, NoSymbol,
-+/*     62    69 */       XK_F4, NoSymbol,
-+/*     63    70 */       XK_F5, NoSymbol,
-+/*     64    71 */       XK_F6, NoSymbol,
-+/*     65    72 */       XK_F7, NoSymbol,
-+/*     66    73 */       XK_F8, NoSymbol,
-+/*     67    74 */       XK_F9, NoSymbol,
-+/*     68    75 */       XK_F10,        NoSymbol,
-+/*     69    76 */       XK_Break,      XK_Pause,
-+/*     70    77 */       XK_Scroll_Lock,        NoSymbol,
-+/*     71    78 */       XK_KP_Home,    XK_KP_7,
-+/*     72    79 */       XK_KP_Up,      XK_KP_8,
-+/*     73    80 */       XK_KP_Page_Up, XK_KP_9,
-+/*     74    81 */       XK_KP_Subtract,        NoSymbol,
-+/*     75    82 */       XK_KP_Left,    XK_KP_4,
-+/*     76    83 */       XK_KP_5,       NoSymbol,
-+/*     77    84 */       XK_KP_Right,   XK_KP_6,
-+/*     78    85 */       XK_KP_Add,     NoSymbol,
-+/*     79    86 */       XK_KP_End,     XK_KP_1,
-+/*     80    87 */       XK_KP_Down,    XK_KP_2,
-+/*     81    88 */       XK_KP_Page_Down,       XK_KP_3,
-+/*     82    89 */       XK_KP_Insert,  XK_KP_0,
-+/*     83    90 */       XK_KP_Delete,  XK_KP_Decimal,
-+/*     84    91 */     NoSymbol,        NoSymbol,
-+/*     85    92 */     NoSymbol,        NoSymbol,
-+/*     86    93 */     NoSymbol,        NoSymbol,
-+/*     87    94 */       XK_F11,        NoSymbol,
-+/*     88    95 */       XK_F12,        NoSymbol,
-+
-+/* These are remapped from the extended set (using ExtendMap) */
-+
-+/*     89    96 */       XK_Control_R,  NoSymbol,
-+/*     90    97 */       XK_KP_Enter,   NoSymbol,
-+/*     91    98 */       XK_KP_Divide,  NoSymbol,
-+/*     92    99 */       XK_Sys_Req,    XK_Print,
-+/*     93   100 */       XK_Alt_R,      XK_Meta_R,
-+/*     94   101 */       XK_Num_Lock,   NoSymbol,
-+/*     95   102 */       XK_Home,       NoSymbol,
-+/*     96   103 */       XK_Up,         NoSymbol,
-+/*     97   104 */       XK_Page_Up,    NoSymbol,
-+/*     98   105 */       XK_Left,       NoSymbol,
-+/*     99   106 */       XK_Right,      NoSymbol,
-+/*    100   107 */       XK_End,        NoSymbol,
-+/*    101   108 */       XK_Down,       NoSymbol,
-+/*    102   109 */       XK_Page_Down,  NoSymbol,
-+/*    103   110 */       XK_Insert,     NoSymbol,
-+/*    104   111 */       XK_Delete,     NoSymbol,
-+/*    105   112 */       XK_Super_L,    NoSymbol,
-+/*    106   113 */       XK_Super_R,    NoSymbol,
-+/*    107   114 */       XK_Menu,       NoSymbol,
-+/*    108   115 */       NoSymbol,      NoSymbol,
-+/*    109   116 */       NoSymbol,      NoSymbol,
-+/*    110   117 */       NoSymbol,      NoSymbol,
-+/*    111   118 */       NoSymbol,      NoSymbol,
-+/*    112   119 */       NoSymbol,      NoSymbol,
-+
-+/*    113   120 */      NoSymbol,     NoSymbol,
-+/*    114   121 */      NoSymbol,     NoSymbol,
-+/*    115   122 */      NoSymbol,     NoSymbol,
-+/*    116   123 */      NoSymbol,     NoSymbol,
-+/*    117   124 */      NoSymbol,     NoSymbol,
-+/*    118   125 */      NoSymbol,     NoSymbol,
-+/*    119   126 */      NoSymbol,     NoSymbol,
-+/*    120   127 */      NoSymbol,     NoSymbol,
-+/*    121   128 */      NoSymbol,     NoSymbol,
-+/*    122   129 */      NoSymbol,     NoSymbol,
-+/*    123   130 */      NoSymbol,     NoSymbol,
-+/*    124   131 */      NoSymbol,     NoSymbol,
-+/*    125   132 */      NoSymbol,     NoSymbol,
-+/*    126   133 */      NoSymbol,     NoSymbol,
-+/*    127   134 */      NoSymbol,     NoSymbol,
-+/*    128   135 */      NoSymbol,     NoSymbol,
-+/*    129   136 */      NoSymbol,     NoSymbol,
-+/*    130   137 */      NoSymbol,     NoSymbol,
-+/*    131   138 */      NoSymbol,     NoSymbol,
-+/*    132   139 */      NoSymbol,     NoSymbol,
-+/*    133   140 */      NoSymbol,     NoSymbol,
-+/*    134   141 */      NoSymbol,     NoSymbol,
-+/*    135   142 */      NoSymbol,     NoSymbol,
-+/*    136   143 */      NoSymbol,     NoSymbol,
-+/*    137   144 */      NoSymbol,     NoSymbol,
-+/*    138   145 */      NoSymbol,     NoSymbol,
-+/*    139   146 */      NoSymbol,     NoSymbol,
-+/*    140   147 */      NoSymbol,     NoSymbol,
-+/*    141   148 */      NoSymbol,     NoSymbol,
-+/*    142   149 */      NoSymbol,     NoSymbol,
-+/*    143   150 */      NoSymbol,     NoSymbol,
-+/*    144   151 */      NoSymbol,     NoSymbol,
-+/*    145   152 */      NoSymbol,     NoSymbol,
-+/*    146   153 */      NoSymbol,     NoSymbol,
-+/*    147   154 */      NoSymbol,     NoSymbol,
-+/*    148   155 */      NoSymbol,     NoSymbol,
-+/*    149   156 */      NoSymbol,     NoSymbol,
-+/*    150   157 */      NoSymbol,     NoSymbol,
-+/*    151   158 */      NoSymbol,     NoSymbol,
-+/*    152   159 */      NoSymbol,     NoSymbol,
-+/*    153   160 */      NoSymbol,     NoSymbol,
-+/*    154   161 */      NoSymbol,     NoSymbol,
-+/*    155   162 */      NoSymbol,     NoSymbol,
-+/*    156   163 */      NoSymbol,     NoSymbol,
-+/*    157   164 */      NoSymbol,     NoSymbol,
-+/*    158   165 */      NoSymbol,     NoSymbol,
-+/*    159   166 */      NoSymbol,     NoSymbol,
-+/*    160   167 */      NoSymbol,     NoSymbol,
-+/*    161   168 */      NoSymbol,     NoSymbol,
-+/*    162   169 */      NoSymbol,     NoSymbol,
-+/*    163   170 */      NoSymbol,     NoSymbol,
-+/*    164   171 */      NoSymbol,     NoSymbol,
-+/*    165   172 */      NoSymbol,     NoSymbol,
-+/*    166   173 */      NoSymbol,     NoSymbol,
-+/*    167   174 */      NoSymbol,     NoSymbol,
-+/*    168   175 */      NoSymbol,     NoSymbol,
-+/*    169   176 */      NoSymbol,     NoSymbol,
-+/*    170   177 */      NoSymbol,     NoSymbol,
-+/*    171   178 */      NoSymbol,     NoSymbol,
-+/*    172   179 */      NoSymbol,     NoSymbol,
-+/*    173   180 */      NoSymbol,     NoSymbol,
-+/*    174   181 */      NoSymbol,     NoSymbol,
-+/*    175   182 */      NoSymbol,     NoSymbol,
-+/*    176   183 */      NoSymbol,     NoSymbol,
-+/*    177   184 */      NoSymbol,     NoSymbol,
-+/*    178   185 */      NoSymbol,     NoSymbol,
-+/*    179   186 */      NoSymbol,     NoSymbol,
-+/*    180   187 */      NoSymbol,     NoSymbol,
-+/*    181   188 */      NoSymbol,     NoSymbol,
-+/*    182   189 */      NoSymbol,     NoSymbol,
-+/*    183   190 */      NoSymbol,     NoSymbol,
-+/*    184   191 */      NoSymbol,     NoSymbol,
-+/*    185   192 */      NoSymbol,     NoSymbol,
-+/*    186   193 */      NoSymbol,     NoSymbol,
-+/*    187   194 */      NoSymbol,     NoSymbol,
-+/*    188   195 */      NoSymbol,     NoSymbol,
-+/*    189   196 */      NoSymbol,     NoSymbol,
-+/*    190   197 */      NoSymbol,     NoSymbol,
-+/*    191   198 */      NoSymbol,     NoSymbol,
-+/*    192   199 */      NoSymbol,     NoSymbol,
-+/*    193   200 */      NoSymbol,     NoSymbol,
-+/*    194   201 */      NoSymbol,     NoSymbol,
-+};
-+
-+static void
-+EvdevKbdRead (int fd, void *closure)
-+{
-+    int i, n;
-+    struct input_event events[NUM_EVENTS];
-+
-+    n = read (fd, &events, NUM_EVENTS * sizeof (struct input_event));
-+    if (n <= 0)
-+      return;
-+
-+    n /= sizeof (struct input_event);
-+
-+    for (i = 0; i < n; i++)
-+    {
-+        if (events[i].type == EV_KEY)
-+      	    KdEnqueueKeyboardEvent (events[i].code, !events[i].value);
-+    }
-+}
-+
-+static void
-+EvdevKbdLoad (void)
-+{
-+    kdMinScanCode = 0;
-+    kdMaxScanCode = 193;
-+    kdKeymapWidth = 2;
-+    memcpy (kdKeymap, evdevKeymap, sizeof (evdevKeymap));
-+}
-+
-+static int
-+EvdevKbdInit (void)
-+{
-+    int fd, i;
-+
-+    if (!EvdevInputType)
-+        EvdevInputType = KdAllocInputType ();
-+
-+    if (!kdKeyboard)
-+    {
-+        for (i = 0; i < NUM_DEFAULT_EVDEV; i++)
-+        {
-+            fd = open (kdefaultEvdev[i], 2);
-+            if (fd >= 0)
-+            {
-+                kdKeyboard = KdSaveString (kdefaultEvdev[i]);
-+                break;
-+            }
-+	}
-+    }
-+    else
-+    {
-+        fd = open (kdKeyboard, O_RDWR);
-+        if (fd < 0)
-+            return FALSE;
-+    }
-+
-+    if (ioctl (fd, EVIOCGRAB, 1) < 0)
-+    {
-+        close (fd);
-+	return FALSE;
-+    }
-+
-+    if (!KdRegisterFd (EvdevInputType, fd, EvdevKbdRead, NULL))
-+        return FALSE;
-+
-+    kbd_fd = fd;
-+    return TRUE;
-+}
-+
-+static void
-+EvdevKbdFini (void)
-+{
-+}
-+
-+static void
-+EvdevKbdLeds (int leds)
-+{
-+    struct input_event event;
-+
-+    memset(&event, 0, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_CAPSL;
-+    event.value = leds & (1 << 0) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_NUML;
-+    event.value = leds & (1 << 1) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_SCROLLL;
-+    event.value = leds & (1 << 2) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+
-+    event.type = EV_LED;
-+    event.code = LED_COMPOSE;
-+    event.value = leds & (1 << 3) ? 1 : 0;
-+    write(kbd_fd, (char *) &event, sizeof(event));
-+}
-+
-+static void
-+EvdevKbdBell (int volume, int frequency, int duration)
-+{
-+}
-+
- KdKeyboardFuncs LinuxEvdevKeyboardFuncs = {
-     EvdevKbdLoad,
-     EvdevKbdInit,
-@@ -296,4 +659,4 @@
-     EvdevKbdFini,
-     0,
- };
--#endif
-+
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kdrive.c xserver/hw/kdrive/src/kdrive.c
---- xserver.original/hw/kdrive/src/kdrive.c	2005-12-16 10:36:07.000000000 -0200
-+++ xserver/hw/kdrive/src/kdrive.c	2005-12-16 10:37:09.000000000 -0200
-@@ -73,6 +73,7 @@
- Bool		    kdEnabled;
- int		    kdSubpixelOrder;
- int		    kdVirtualTerminal = -1;
-+char		    *kdKeyboard = 0;
- Bool		    kdSwitchPending;
- char		    *kdSwitchCmd;
- DDXPointRec	    kdOrigin;
-@@ -795,6 +796,14 @@
- 	    UseMsg ();
- 	return 2;
-     }
-+    if (!strcmp (argv[i], "-keyboard"))
-+    {
-+	if ((i+1) < argc)
-+	    kdKeyboard = argv[i+1];
-+	else
-+	    UseMsg ();
-+	return 2;
-+    }
-     if (!strcmp (argv[i], "-rgba"))
-     {
- 	if ((i+1) < argc)
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kdrive.h xserver/hw/kdrive/src/kdrive.h
---- xserver.original/hw/kdrive/src/kdrive.h	2005-12-16 10:36:07.000000000 -0200
-+++ xserver/hw/kdrive/src/kdrive.h	2005-12-16 10:37:09.000000000 -0200
-@@ -416,6 +416,7 @@
- extern Bool		kdDisableZaphod;
- extern Bool		kdDontZap;
- extern int		kdVirtualTerminal;
-+extern char		*kdKeyboard;
- extern char		*kdSwitchCmd;
- extern KdOsFuncs	*kdOsFuncs;
- 
-@@ -769,7 +770,7 @@
- ProcessInputEvents (void);
- 
- extern KdMouseFuncs	LinuxMouseFuncs;
--extern KdMouseFuncs	LinuxEvdevFuncs;
-+extern KdMouseFuncs	LinuxEvdevMouseFuncs;
- extern KdMouseFuncs	Ps2MouseFuncs;
- extern KdMouseFuncs	BusMouseFuncs;
- extern KdMouseFuncs	MsMouseFuncs;
-@@ -777,6 +778,7 @@
- extern KdMouseFuncs	TsFuncs;
- #endif
- extern KdKeyboardFuncs	LinuxKeyboardFuncs;
-+extern KdKeyboardFuncs	LinuxEvdevKeyboardFuncs;
- extern KdOsFuncs	LinuxFuncs;
- 
- extern KdMouseFuncs	VxWorksMouseFuncs;
-diff -u -r --exclude=CVS --exclude=Makefile --exclude='*.o' --exclude=ephyr --exclude='*.Po' xserver.original/hw/kdrive/src/kinput.c xserver/hw/kdrive/src/kinput.c
---- xserver.original/hw/kdrive/src/kinput.c	2005-12-16 10:36:07.000000000 -0200
-+++ xserver/hw/kdrive/src/kinput.c	2005-12-16 10:37:09.000000000 -0200
-@@ -1300,6 +1300,7 @@
- 	    xE.u.u.type = KeyPress;
- 	xE.u.u.detail = key_code;
- 	
-+#ifndef XKB
- 	switch (KEYCOL1(key_code)) 
- 	{
- 	case XK_Num_Lock:
-@@ -1313,6 +1314,7 @@
- 	    else
- 		xE.u.u.type = KeyPress;
- 	}
-+#endif
- 	
- 	/*
- 	 * Check pressed keys which are already down
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
deleted file mode 100644
index 28d7325..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/kdrive-use-evdev.patch
+++ /dev/null
@@ -1,54 +0,0 @@
---- xserver/hw/kdrive/fbdev/fbinit.c~	2006-01-31 17:09:33.000000000 +0100
-+++ xserver/hw/kdrive/fbdev/fbinit.c	2006-01-31 17:11:55.000000000 +0100
-@@ -28,6 +28,8 @@
- #endif
- #include <fbdev.h>
- 
-+extern int use_evdev;
-+
- void
- InitCard (char *name)
- {
-@@ -45,7 +47,10 @@
- void
- InitInput (int argc, char **argv)
- {
--    KdInitInput (&LinuxMouseFuncs, &LinuxKeyboardFuncs);
-+    if (use_evdev)
-+        KdInitInput (&LinuxEvdevMouseFuncs, &LinuxEvdevKeyboardFuncs);
-+    else
-+        KdInitInput (&LinuxMouseFuncs, &LinuxKeyboardFuncs);
- #ifdef TOUCHSCREEN
-     KdAddMouseDriver (&TsFuncs);
- #endif
---- xserver/hw/kdrive/src/kdrive.c.orig	2006-01-31 17:13:28.000000000 +0100
-+++ xserver/hw/kdrive/src/kdrive.c	2006-01-31 17:15:28.000000000 +0100
-@@ -44,6 +44,8 @@
- #include "dpmsproc.h"
- #endif
- 
-+int use_evdev = 0;
-+
- typedef struct _kdDepths {
-     CARD8   depth;
-     CARD8   bpp;
-@@ -687,6 +689,7 @@
-     ErrorF("-videoTest       Start the server, pause momentarily and exit\n");
-     ErrorF("-origin X,Y      Locates the next screen in the the virtual screen (Xinerama)\n");
-     ErrorF("-mouse path[,n]  Filename of mouse device, n is number of buttons\n");
-+    ErrorF("-use-evdev       Use Linux evdev input\n");
-     ErrorF("-switchCmd       Command to execute on vt switch\n");
-     ErrorF("-nozap           Don't terminate server on Ctrl+Alt+Backspace\n");
-     ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
-@@ -796,6 +799,11 @@
- 	    UseMsg ();
- 	return 2;
-     }
-+    if (!strcmp (argv[i], "-use-evdev"))
-+    {
-+	use_evdev = 1;
-+	return 1;
-+    }
-     if (!strcmp (argv[i], "-keyboard"))
-     {
- 	if ((i+1) < argc)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
deleted file mode 100644
index 35ccada..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/no-serial-probing.patch
+++ /dev/null
@@ -1,13 +0,0 @@
---- xserver/hw/kdrive/linux/mouse.c.orig	2004-05-13 14:25:51.000000000 -0700
-+++ xserver/hw/kdrive/linux/mouse.c	2005-09-22 12:20:47.000000000 -0700
-@@ -927,8 +927,10 @@ char *kdefaultMouse[] =  {
-     "/dev/psaux",
-     "/dev/input/mice",
-     "/dev/adbmouse",
-+#ifdef BREAK_MY_SERIAL_CONSOLE
-     "/dev/ttyS0",
-     "/dev/ttyS1",
-+#endif
- };
- 
- #define NUM_DEFAULT_MOUSE    (sizeof (kdefaultMouse) / sizeof (kdefaultMouse[0]))
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
deleted file mode 100644
index 6b34032..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/nodolt.patch
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
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
deleted file mode 100644
index a580b50..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/optional-xkb.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-Index: xorg-server-1.2.0/Makefile.am
-===================================================================
---- xorg-server-1.2.0.orig/Makefile.am	2007-01-23 06:39:15.000000000 +0100
-+++ xorg-server-1.2.0/Makefile.am	2007-03-28 20:26:19.000000000 +0200
-@@ -30,6 +30,10 @@
- XINPUT_DIR=Xi
- endif
- 
-+if XKB
-+XKB_DIR=xkb
-+endif
-+
- if DBE
- DBE_DIR=dbe
- endif
-@@ -46,7 +50,7 @@
- 	randr \
- 	render  \
- 	$(XINPUT_DIR) \
--	xkb \
-+	$(XKB_DIR) \
- 	$(DBE_DIR) \
- 	$(MFB_DIR) \
- 	$(AFB_DIR) \
-Index: xorg-server-1.2.0/configure.ac
-===================================================================
---- xorg-server-1.2.0.orig/configure.ac	2007-01-23 06:39:15.000000000 +0100
-+++ xorg-server-1.2.0/configure.ac	2007-03-28 20:27:13.000000000 +0200
-@@ -428,6 +428,7 @@
- AC_ARG_ENABLE(dpms,           AS_HELP_STRING([--disable-dpms], [Build DPMS extension (default: enabled)]), [DPMSExtension=$enableval], [DPMSExtension=yes])
- AC_ARG_ENABLE(xinput,         AS_HELP_STRING([--disable-xinput], [Build XInput Extension (default: enabled)]), [XINPUT=$enableval], [XINPUT=yes])
- AC_ARG_ENABLE(xfree86-utils,     AS_HELP_STRING([--enable-xfree86-utils], [Build xfree86 DDX utilities (default: enabled)]), [XF86UTILS=$enableval], [XF86UTILS=yes])
-+AC_ARG_ENABLE(xkb,            AS_HELP_STRING([--disable-xkb], [Build XKB (default: enabled)]), [XKB=$enableval], [XKB=yes])
- 
- dnl DDXes.
- AC_ARG_ENABLE(xorg,    	      AS_HELP_STRING([--enable-xorg], [Build Xorg server (default: auto)]), [XORG=$enableval], [XORG=auto])
-@@ -754,12 +755,15 @@
- 
- AC_DEFINE(SHAPE, 1, [Support SHAPE extension])
- 
--AC_DEFINE(XKB, 1, [Build XKB])
--AC_DEFINE(XKB_IN_SERVER, 1, [Build XKB server])
--AC_DEFINE(XKB_DFLT_DISABLED, 0, [Disable XKB per default])
--REQUIRED_MODULES="$REQUIRED_MODULES xkbfile"
--XKB_LIB='$(top_builddir)/xkb/libxkb.la'
--XKB_STUB_LIB='$(top_builddir)/xkb/libxkbstubs.la'
-+AM_CONDITIONAL(XKB, [test "x$XKB" = xyes])
-+if test "x$XKB" = xyes; then
-+	AC_DEFINE(XKB, 1, [Build XKB])
-+	AC_DEFINE(XKB_IN_SERVER, 1, [Build XKB server])
-+	AC_DEFINE(XKB_DFLT_DISABLED, 0, [Disable XKB per default])
-+	REQUIRED_MODULES="$REQUIRED_MODULES xkbfile"
-+	XKB_LIB='$(top_builddir)/xkb/libxkb.la'
-+	XKB_STUB_LIB='$(top_builddir)/xkb/libxkbstubs.la'
-+fi
- 
- AC_CHECK_FUNC(strcasecmp, [], AC_DEFINE([NEED_STRCASECMP], 1,
-                                         [Do not have `strcasecmp'.]))
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
index 52b63ed..cc9acaa 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive.inc
@@ -4,7 +4,7 @@ DEPENDS = "compositeproto damageproto fixesproto recordproto resourceproto \
         libxdmcp libxfont libxrandr tslib virtual/libx11 xtrans bigreqsproto \
         xcmiscproto libdrm openssl"
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=3dd2bbe3563837f80ed8926b06c1c353"
+LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
 
 PROVIDES = "virtual/xserver"
 PACKAGES =+ "xserver-kdrive-fbdev \
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/crosscompile.patch
new file mode 100644
index 0000000..2f98bb8
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/crosscompile.patch
@@ -0,0 +1,22 @@
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
+ AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
+ 				[ FONTPATH="$withval" ],
+ 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
index bd88427..458f19a 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-apm.patch
@@ -1,20 +1,24 @@
---- xserver/hw/kdrive/linux/linux.c.orig	2005-04-23 15:56:13.988849232 +0000
-+++ xserver/hw/kdrive/linux/linux.c	2005-04-23 15:57:05.001094192 +0000
-@@ -342,7 +342,7 @@
+Upstream-Status: Inappropriate [disable feature]
+
+diff --git a/hw/kdrive/linux/linux.c b/hw/kdrive/linux/linux.c
+index 9863c14..adbfbaa 100644
+--- a/hw/kdrive/linux/linux.c
++++ b/hw/kdrive/linux/linux.c
+@@ -251,7 +251,7 @@ LinuxEnable (void)
      /*
       * Open the APM driver
       */
 -    LinuxApmFd = open ("/dev/apm_bios", 2);
-+    /*LinuxApmFd = open ("/dev/apm_bios", 2);
++/*  LinuxApmFd = open ("/dev/apm_bios", 2);
      if (LinuxApmFd < 0 && errno == ENOENT)
- 	LinuxApmFd = open ("/dev/misc/apm_bios", 2); 
+ 	LinuxApmFd = open ("/dev/misc/apm_bios", 2);
      if (LinuxApmFd >= 0)
-@@ -352,7 +352,7 @@
+@@ -261,7 +261,7 @@ LinuxEnable (void)
  	RegisterBlockAndWakeupHandlers (LinuxApmBlock, LinuxApmWakeup, 0);
  	AddEnabledDevice (LinuxApmFd);
      }
--	
-+    */	
+-
++*/
      /*
       * now get the VT
       */
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
deleted file mode 100644
index ccc1913..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/disable-xf86-dga-xorgcfg.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-Index: xorg-server-1.3.0.0/configure.ac
-===================================================================
---- xorg-server-1.3.0.0.orig/configure.ac	2007-04-20 03:23:40.000000000 +0200
-+++ xorg-server-1.3.0.0/configure.ac	2007-05-09 16:51:34.000000000 +0200
-@@ -520,7 +520,11 @@
- XEXTXORG_LIB='$(top_builddir)/Xext/libXextbuiltin.la'
- 
- dnl Core modules for most extensions, et al.
-+if test "$KDRIVE" = yes; then
-+REQUIRED_MODULES="[randrproto >= 1.2] renderproto [fixesproto >= 4.0] [damageproto >= 1.1] xcmiscproto xextproto xproto xtrans xf86bigfontproto [scrnsaverproto >= 1.1] bigreqsproto resourceproto fontsproto inputproto [kbproto >= 1.0.3]"
-+else
- REQUIRED_MODULES="[randrproto >= 1.2] renderproto [fixesproto >= 4.0] [damageproto >= 1.1] xcmiscproto xextproto xproto xtrans xf86miscproto xf86vidmodeproto xf86bigfontproto [scrnsaverproto >= 1.1] bigreqsproto resourceproto fontsproto inputproto xf86dgaproto [kbproto >= 1.0.3]"
-+fi
- REQUIRED_LIBS="xfont xau fontenc"
- 
- AM_CONDITIONAL(XV, [test "x$XV" = xyes])
-@@ -1603,7 +1607,9 @@
- AC_SUBST(XKB_COMPILED_DIR)
- 
- dnl and the rest of these are generic, so they're in config.h
-+if test ! x"$KDRIVE" = xyes; then
- AC_DEFINE(XFreeXDGA, 1, [Build XDGA support])
-+fi
- AC_DEFINE(XResExtension, 1, [Build XRes extension])
- 
- AC_TRY_COMPILE([
-@@ -1616,10 +1622,12 @@
- 
- AC_DEFINE_DIR(PROJECTROOT, prefix, [Overall prefix])
- 
-+if test ! "x$KDRIVE" = xyes ; then
- dnl xorgconfig CLI configuration utility
- PKG_CHECK_MODULES([XORGCONFIG_DEP], [xkbfile x11])
- AC_SUBST(XORGCONFIG_DEP_CFLAGS)
- AC_SUBST(XORGCONFIG_DEP_LIBS)
-+fi
- 
- dnl xorgcfg GUI configuration utility
- AC_ARG_ENABLE(xorgcfg, AS_HELP_STRING([--enable-xorgcfg], 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
index 14cf990..4cde6ab 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/extra-kmodes.patch
@@ -1,14 +1,12 @@
 Add some extra video modes and change the default to VGA.
 
----
- hw/kdrive/src/kmode.c |   41 +++++++++++++++++++++++++++++++++++++++--
- 1 file changed, 39 insertions(+), 2 deletions(-)
+Upstream-Status: Inappropriate [embedded specific]
 
-Index: xorg-server-1.3.0.0/hw/kdrive/src/kmode.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/src/kmode.c	2008-01-11 14:20:47.000000000 +0000
-+++ xorg-server-1.3.0.0/hw/kdrive/src/kmode.c	2008-01-11 14:21:18.000000000 +0000
-@@ -32,6 +32,31 @@ const KdMonitorTiming  kdMonitorTimings[
+diff --git a/hw/kdrive/src/kmode.c b/hw/kdrive/src/kmode.c
+index 38b7bc8..d569444 100644
+--- a/hw/kdrive/src/kmode.c
++++ b/hw/kdrive/src/kmode.c
+@@ -30,6 +30,31 @@ const KdMonitorTiming  kdMonitorTimings[] = {
      /*	H	V	Hz	KHz */
  		/*  FP	    BP	    BLANK   POLARITY */
  
@@ -40,10 +38,10 @@ Index: xorg-server-1.3.0.0/hw/kdrive/src/kmode.c
      /* IPAQ modeline:
       *
       * Modeline "320x240"      5.7222 320 337 340 352   240 241 244 254"
-@@ -41,6 +66,11 @@ const KdMonitorTiming  kdMonitorTimings[
+@@ -39,6 +64,11 @@ const KdMonitorTiming  kdMonitorTimings[] = {
  	            1,      11,     14,     KdSyncNegative,
      },
-     
+ 
 +    {   240,	320,	64,	    0,
 +	            0,	    0,	    0,     KdSyncNegative,
 +	            0,      0,      0,     KdSyncNegative,
@@ -52,7 +50,7 @@ Index: xorg-server-1.3.0.0/hw/kdrive/src/kmode.c
      /* Other VESA modes */
      {	640,	350,	85,	31500,			    /* VESA */
  		    32,	    96,	    192,    KdSyncPositive, /* 26.413 */
-@@ -76,10 +106,19 @@ const KdMonitorTiming  kdMonitorTimings[
+@@ -74,11 +104,18 @@ const KdMonitorTiming  kdMonitorTimings[] = {
  		    16,	    120,    176,    KdSyncNegative, /* 37.861 */
  		    1,	    20,	    24,	    KdSyncNegative, /* 72.809 */
      },
@@ -62,17 +60,16 @@ Index: xorg-server-1.3.0.0/hw/kdrive/src/kmode.c
  		   16,	    48,	    160,    KdSyncNegative, /* 31.469 */
  		   10,	    33,	    45,	    KdSyncNegative, /* 59.940 */
      },
-+
-+
-+  {   480,    640,    60,     0,                      /* VESA */
+ 
++    {  480,    640,    60,     0,                      /* VESA */
 +               0,      0,     0,    KdSyncNegative, /* 31.469 */
 +               0,      0,     0,     KdSyncNegative, /* 59.940 */
-+   },
-+  
-     
++    },
++
      /* 800x600 modes */
      {	800,	600,	85,	56250,			    /* VESA */
-@@ -90,8 +129,6 @@ const KdMonitorTiming  kdMonitorTimings[
+ 		    32,	    152,    248,    KdSyncPositive, /* 53.674 */
+@@ -88,8 +125,6 @@ const KdMonitorTiming  kdMonitorTimings[] = {
  		    16,	    160,    256,    KdSyncPositive, /* 46.875 */
  		    1,	    21,	    25,	    KdSyncPositive, /* 75.000 */
      },
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
index a5c22a5..125d126 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fbdev_xrandr_ioctl.patch
@@ -1,8 +1,10 @@
-Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
-===================================================================
---- xorg-server-1.3.0.0.orig/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:12.000000000 +0100
-+++ xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c	2008-09-25 21:55:46.000000000 +0100
-@@ -498,6 +498,7 @@
+Upstream-Status: Pending
+
+diff --git a/hw/kdrive/fbdev/fbdev.c b/hw/kdrive/fbdev/fbdev.c
+index 2c7fa91..7f6b6f9 100644
+--- a/hw/kdrive/fbdev/fbdev.c
++++ b/hw/kdrive/fbdev/fbdev.c
+@@ -485,6 +485,7 @@ fbdevRandRSetConfig (ScreenPtr		pScreen,
      KdScreenInfo	*screen = pScreenPriv->screen;
      FbdevScrPriv	*scrpriv = screen->driver;
      Bool		wasEnabled = pScreenPriv->enabled;
@@ -10,17 +12,10 @@ Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
      FbdevScrPriv	oldscr;
      int			oldwidth;
      int			oldheight;
-@@ -525,11 +526,46 @@
-     oldheight = screen->height;
-     oldmmwidth = pScreen->mmWidth;
-     oldmmheight = pScreen->mmHeight;
--    
-+
-     /*
+@@ -517,6 +518,41 @@ fbdevRandRSetConfig (ScreenPtr		pScreen,
       * Set new configuration
       */
--    
-+
+ 
 +    if (newwidth != oldwidth || newheight != oldheight)
 +    {
 +	struct fb_var_screeninfo var;
@@ -58,4 +53,4 @@ Index: xorg-server-1.3.0.0/hw/kdrive/fbdev/fbdev.c
 +
      scrpriv->randr = KdAddRotation (screen->randr, randr);
  
-     KdOffscreenSwapOut (screen->pScreen);
+     fbdevUnmapFramebuffer (screen);
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fix-newer-xorg-headers.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/fix-newer-xorg-headers.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.3.0.0/fix-newer-xorg-headers.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-kdrive/fix-newer-xorg-headers.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/hide-cursor-and-ppm-root.patch
similarity index 79%
rename from meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-kdrive/hide-cursor-and-ppm-root.patch
index 73f30ee..c949123 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/hide-cursor-and-ppm-root.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/hide-cursor-and-ppm-root.patch
@@ -1,8 +1,10 @@
-Index: xorg-server-1.7.99.2/dix/window.c
-===================================================================
---- xorg-server-1.7.99.2.orig/dix/window.c	2009-11-04 16:25:50.000000000 +0000
-+++ xorg-server-1.7.99.2/dix/window.c	2010-02-10 17:42:22.719078216 +0000
-@@ -179,6 +179,8 @@
+Upstream-Status: Pending
+
+diff --git a/dix/window.c b/dix/window.c
+index cd28d05..4f782e4 100644
+--- a/dix/window.c
++++ b/dix/window.c
+@@ -176,6 +176,8 @@ static Bool TileScreenSaver(ScreenPtr pScreen, int kind);
  
  #define SubStrSend(pWin,pParent) (StrSend(pWin) || SubSend(pParent))
  
@@ -11,7 +13,7 @@ Index: xorg-server-1.7.99.2/dix/window.c
  #ifdef DEBUG
  /******
   * PrintWindowTree
-@@ -304,6 +306,115 @@
+@@ -305,6 +307,115 @@ SetWindowToDefaults(WindowPtr pWin)
  #endif
  }
  
@@ -127,7 +129,7 @@ Index: xorg-server-1.7.99.2/dix/window.c
  static void
  MakeRootTile(WindowPtr pWin)
  {
-@@ -314,6 +425,36 @@
+@@ -315,6 +426,36 @@ MakeRootTile(WindowPtr pWin)
      unsigned char *from, *to;
      int i, j;
  
@@ -164,7 +166,7 @@ Index: xorg-server-1.7.99.2/dix/window.c
      pWin->background.pixmap = (*pScreen->CreatePixmap)(pScreen, 4, 4,
  						    pScreen->rootDepth, 0);
  
-@@ -530,6 +671,7 @@
+@@ -530,6 +671,7 @@ RegisterRealChildHeadProc (RealChildHeadProc proc)
  }
  
  
@@ -172,11 +174,11 @@ Index: xorg-server-1.7.99.2/dix/window.c
  WindowPtr
  RealChildHead(WindowPtr pWin)
  {
-Index: xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c
-===================================================================
---- xorg-server-1.7.99.2.orig/hw/kdrive/src/kdrive.c	2010-02-10 17:36:36.000000000 +0000
-+++ xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c	2010-02-10 17:43:07.797828099 +0000
-@@ -60,6 +60,9 @@
+diff --git a/hw/kdrive/src/kdrive.c b/hw/kdrive/src/kdrive.c
+index f034ce4..660e2c9 100644
+--- a/hw/kdrive/src/kdrive.c
++++ b/hw/kdrive/src/kdrive.c
+@@ -60,6 +60,9 @@ KdDepths    kdDepths[] = {
      { 32, 32 }
  };
  
@@ -186,7 +188,7 @@ Index: xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c
  #define NUM_KD_DEPTHS (sizeof (kdDepths) / sizeof (kdDepths[0]))
  
  #define KD_DEFAULT_BUTTONS 5
-@@ -92,6 +95,9 @@
+@@ -91,6 +94,9 @@ static Bool         kdCaughtSignal = FALSE;
  
  KdOsFuncs	*kdOsFuncs;
  
@@ -194,17 +196,17 @@ Index: xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c
 +extern char* RootPPM;		   /* dix/window.c */
 +
  void
- KdSetRootClip (ScreenPtr pScreen, BOOL enable)
+ KdDisableScreen (ScreenPtr pScreen)
  {
-@@ -275,6 +281,7 @@
-     KdSetRootClip (pScreen, TRUE);
+@@ -185,6 +191,7 @@ KdEnableScreen (ScreenPtr pScreen)
+     SetRootClip (pScreen, TRUE);
      if (pScreenPriv->card->cfuncs->dpms)
  	(*pScreenPriv->card->cfuncs->dpms) (pScreen, pScreenPriv->dpmsState);
 +
      return TRUE;
  }
  
-@@ -553,6 +560,8 @@
+@@ -454,6 +461,8 @@ KdUseMsg (void)
      ErrorF("-switchCmd       Command to execute on vt switch\n");
      ErrorF("-zap             Terminate server on Ctrl+Alt+Backspace\n");
      ErrorF("vtxx             Use virtual terminal xx instead of the next available\n");
@@ -213,7 +215,7 @@ Index: xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c
  }
  
  int
-@@ -616,6 +625,19 @@
+@@ -517,6 +526,19 @@ KdProcessArgument (int argc, char **argv, int i)
  	kdSoftCursor = TRUE;
  	return 1;
      }
@@ -233,19 +235,19 @@ Index: xorg-server-1.7.99.2/hw/kdrive/src/kdrive.c
      if (!strcmp (argv[i], "-videoTest"))
      {
  	kdVideoTest = TRUE;
-Index: xorg-server-1.7.99.2/xfixes/cursor.c
-===================================================================
---- xorg-server-1.7.99.2.orig/xfixes/cursor.c	2009-12-19 01:43:53.000000000 +0000
-+++ xorg-server-1.7.99.2/xfixes/cursor.c	2010-02-10 17:45:02.089079491 +0000
+diff --git a/xfixes/cursor.c b/xfixes/cursor.c
+index fb608f6..d217619 100644
+--- a/xfixes/cursor.c
++++ b/xfixes/cursor.c
 @@ -57,6 +57,7 @@
  static RESTYPE		CursorClientType;
  static RESTYPE		CursorHideCountType;
  static RESTYPE		CursorWindowType;
 +static Bool             CursorGloballyHidden; 
  static CursorPtr	CursorCurrent[MAXDEVICES];
- static CursorPtr        pInvisibleCursor = NULL;
  
-@@ -65,6 +66,8 @@
+ static DevPrivateKeyRec CursorScreenPrivateKeyRec;
+@@ -64,6 +65,8 @@ static DevPrivateKeyRec CursorScreenPrivateKeyRec;
  
  static void deleteCursorHideCountsForScreen (ScreenPtr pScreen);
  
@@ -254,17 +256,17 @@ Index: xorg-server-1.7.99.2/xfixes/cursor.c
  #define VERIFY_CURSOR(pCursor, cursor, client, access)			\
      do {								\
  	int err;							\
-@@ -150,7 +153,7 @@
+@@ -146,7 +149,7 @@ CursorDisplayCursor (DeviceIntPtr pDev,
      if (ConnectionInfo)
  	CursorVisible = EnableCursor;
  
 -    if (cs->pCursorHideCounts != NULL || !CursorVisible) {
 +    if (cs->pCursorHideCounts != NULL || !CursorVisible || CursorGloballyHidden) {
-         ret = ((*pScreen->RealizeCursor)(pDev, pScreen, pInvisibleCursor) &&
- 	       (*pScreen->DisplayCursor) (pDev, pScreen, pInvisibleCursor));
+ 	ret = (*pScreen->DisplayCursor) (pDev, pScreen, NullCursor);
      } else {
-@@ -887,6 +890,12 @@
- 	return (ret == BadValue) ? BadWindow : ret;
+ 	ret = (*pScreen->DisplayCursor) (pDev, pScreen, pCursor);
+@@ -880,6 +883,12 @@ ProcXFixesHideCursor (ClientPtr client)
+ 	return ret;
      }
  
 +    /* Is cursor set to be initially hidden ?, if so reset this 
@@ -276,8 +278,8 @@ Index: xorg-server-1.7.99.2/xfixes/cursor.c
      /* 
       * Has client hidden the cursor before on this screen? 
       * If so, just increment the count. 
-@@ -950,9 +959,19 @@
- 	return (rc == BadValue) ? BadWindow : rc;
+@@ -943,9 +952,19 @@ ProcXFixesShowCursor (ClientPtr client)
+ 	return rc;
      }
  
 +    /* X was started with cursor hidden, therefore just reset our flag
@@ -297,7 +299,7 @@ Index: xorg-server-1.7.99.2/xfixes/cursor.c
       */
      pChc = findCursorHideCount(client, pWin->drawable.pScreen);
      if (pChc == NULL) {
-@@ -1068,6 +1087,8 @@
+@@ -1034,6 +1053,8 @@ XFixesCursorInit (void)
  {
      int	i;
  
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/keyboard-resume-workaround.patch b/meta/recipes-graphics/xorg-xserver/xserver-kdrive/keyboard-resume-workaround.patch
similarity index 100%
rename from meta/recipes-graphics/xorg-xserver/xserver-kdrive-1.7.99.2/keyboard-resume-workaround.patch
rename to meta/recipes-graphics/xorg-xserver/xserver-kdrive/keyboard-resume-workaround.patch
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.10.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.10.1.bb
new file mode 100644
index 0000000..b1340fb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.10.1.bb
@@ -0,0 +1,22 @@
+require xserver-kdrive.inc
+
+DEPENDS += "libxkbfile libxcalibrate font-util pixman"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+
+EXTRA_OECONF += "--disable-glx"
+
+PE = "1"
+PR = "r0"
+
+SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
+	file://extra-kmodes.patch; \
+	file://disable-apm.patch; \
+	file://no-serial-probing.patch; \
+	file://keyboard-resume-workaround.patch; \
+	file://hide-cursor-and-ppm-root.patch; \
+	file://fbdev_xrandr_ioctl.patch; \
+	file://fix-newer-xorg-headers.patch;\
+	file://crosscompile.patch;"
+
+S = "${WORKDIR}/xorg-server-${PV}"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb b/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
deleted file mode 100644
index b7e5520..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-kdrive_1.7.99.2.bb
+++ /dev/null
@@ -1,29 +0,0 @@
-require xserver-kdrive.inc
-
-DEPENDS += "libxkbfile libxcalibrate font-util pixman"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-
-EXTRA_OECONF += "--disable-glx"
-
-PE = "1"
-PR = "r26"
-
-SRC_URI = "${XORG_MIRROR}/individual/xserver/xorg-server-${PV}.tar.bz2 \
-	file://extra-kmodes.patch;patch=1 \
-	file://disable-apm.patch;patch=1 \
-	file://no-serial-probing.patch;patch=1 \
-	file://keyboard-resume-workaround.patch;patch=1 \
-	file://enable-xcalibrate.patch;patch=1 \
-	file://hide-cursor-and-ppm-root.patch;patch=1 \
-	file://fbdev_xrandr_ioctl.patch;patch=1 \
-	file://fix-newer-xorg-headers.patch;patch=1 \
-	file://crosscompile.patch;patch=1 \
-	file://nodolt.patch;patch=1"
-#	file://kdrive-evdev.patch;patch=1
-#	file://kdrive-use-evdev.patch;patch=1
-#	file://enable-builtin-fonts.patch;patch=1
-#	file://optional-xkb.patch;patch=1
-
-
-S = "${WORKDIR}/xorg-server-${PV}"
-- 
1.7.1.1



