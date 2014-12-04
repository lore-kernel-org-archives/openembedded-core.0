Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id EF5227232E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Dec 2014 23:18:21 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 04 Dec 2014 15:16:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,518,1413270000"; d="scan'208";a="618869997"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.148])
	by orsmga001.jf.intel.com with ESMTP; 04 Dec 2014 15:18:21 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Dec 2014 17:18:17 -0600
Message-Id: <e52ccb34455cac2502ad069b09dd6c0c72d1863c.1417734782.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1417734782.git.anibal.limon@linux.intel.com>
References: <cover.1417734782.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 3/3] xorg-xserver: Upgrade to 1.16.2.
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
X-List-Received-Date: Thu, 04 Dec 2014 23:18:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add PACKAGECONFIG systemd, xserver-xorg now depends in dbus because
adds support for systemd-logind, dbus is used by xserver-xorg to
communicate with systemd.

Add conditional enablement of systemd-logind if DISTRO_FEATURES contains
systemd.

Remove crosscompile, mips64-compile and present-module because are already
in upstream.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  5 +-
 .../xorg-xserver/xserver-xorg/crosscompile.patch   | 22 --------
 .../xserver-xorg/mips64-compiler.patch             | 29 ----------
 .../xorg-xserver/xserver-xorg/present-module.patch | 66 ----------------------
 ...erver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} |  9 +--
 5 files changed, 7 insertions(+), 124 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.15.1.bb => xserver-xorg_1.16.2.bb} (75%)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
index dd60884..5b47e34 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg.inc
@@ -116,7 +116,9 @@ EXTRA_OECONF += "--with-fop=no \
                  ac_cv_file__usr_share_sgml_X11_defs_ent=no \
 "
 
-PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)}"
+PACKAGECONFIG ??= "udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri2 glx', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)}"
+
 PACKAGECONFIG[udev] = "--enable-config-udev,--disable-config-udev,udev"
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri,glproto virtual/mesa xf86driproto"
 PACKAGECONFIG[dri2] = "--enable-dri2,--disable-dri2,dri2proto"
@@ -126,6 +128,7 @@ PACKAGECONFIG[glx] = "--enable-glx --enable-glx-tls,--disable-glx,glproto virtua
 PACKAGECONFIG[unwind] = "--enable-libunwind,--disable-libunwind,libunwind"
 PACKAGECONFIG[xshmfence] = "--enable-xshmfence,--disable-xshmfence,libxshmfence"
 PACKAGECONFIG[xmlto] = "--with-xmlto, --without-xmlto, xmlto-native docbook-xml-dtd4-native docbook-xsl-stylesheets-native"
+PACKAGECONFIG[systemd] = "--enable-systemd-logind=yes,--enable-systemd-logind=no,dbus,dbus-lib"
 
 do_install_append () {
 	# Its assumed base-files creates this for us
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
deleted file mode 100644
index 2f98bb8..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/crosscompile.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Upstream-Status: Inappropriate [configuration]
-
-diff --git a/configure.ac b/configure.ac
-index b3b752c..600500b 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -523,13 +523,9 @@ dnl Uses --default-font-path if set, otherwise checks for /etc/X11/fontpath.d,
- dnl otherwise uses standard subdirectories of FONTROOTDIR. When cross
- dnl compiling, assume default font path uses standard FONTROOTDIR directories.
- DEFAULT_FONT_PATH="${FONTMISCDIR}/,${FONTTTFDIR}/,${FONTOTFDIR}/,${FONTTYPE1DIR}/,${FONT100DPIDIR}/,${FONT75DPIDIR}/"
--if test "$cross_compiling" != yes; then
--	AC_CHECK_FILE([${sysconfdir}/X11/fontpath.d],
--		[DEFAULT_FONT_PATH='catalogue:${sysconfdir}/X11/fontpath.d'],
--		[case $host_os in
-+		case $host_os in
- 			darwin*) DEFAULT_FONT_PATH="${DEFAULT_FONT_PATH},/Library/Fonts,/System/Library/Fonts" ;;
--		esac])
--fi
-+		esac
- AC_ARG_WITH(default-font-path, AS_HELP_STRING([--with-default-font-path=PATH], [Comma separated list of font dirs]),
- 				[ FONTPATH="$withval" ],
- 				[ FONTPATH="${DEFAULT_FONT_PATH}" ])
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
deleted file mode 100644
index 168368e..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/mips64-compiler.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-on mips64/n64 pointers are 64bit therefore the pointer conversions to int dont work well
-so we end up with incompatible conversion errors
-
-This patch choses the right values for mips64
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
-
-Upstream-Status: Pending
-Index: xorg-server-1.13.0/hw/xfree86/common/compiler.h
-===================================================================
---- xorg-server-1.13.0-orig/hw/xfree86/common/compiler.h	2012-06-14 23:04:29.000000000 +0300
-+++ xorg-server-1.13.0/hw/xfree86/common/compiler.h	2012-11-08 10:06:50.865831783 +0200
-@@ -101,6 +101,7 @@
- #if defined(NO_INLINE) || defined(DO_PROTOTYPES)
- #if !defined(__arm__)
- #if !defined(__sparc__) && !defined(__sparc) && !defined(__arm32__) && !defined(__nds32__) \
-+      && !defined(__mips64) \
-       && !(defined(__alpha__) && defined(linux)) \
-       && !(defined(__ia64__) && defined(linux)) \
- 
-@@ -721,7 +722,7 @@
- }
- 
- #elif defined(__mips__) || (defined(__arm32__) && !defined(__linux__))
--#ifdef __arm32__
-+#if defined (__arm32__) || defined (__mips64)
- #define PORT_SIZE long
- #else
- #define PORT_SIZE short
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
deleted file mode 100644
index 13f3caf..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/present-module.patch
+++ /dev/null
@@ -1,66 +0,0 @@
-[ YOCTO #6583 ]
-
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@intel.com>
-
-From 746be5a03ebbda4ab411ca3efb2ed95f99e9ea46 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Wed, 28 May 2014 08:13:59 +0100
-Subject: xfree86: Report DRI3 as a built-in module
-
-This is so that drivers can do a runtime check that DRI3 is available,
-similar to existing runtime checks performed by the drivers for DRI and
-DRI2.
-
-v2: Only add DRI3 to the list if the module was actually built into the
-server (Mark Kettenis).
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Cc: Mark Kettenis <mark.kettenis@xs4all.nl>
-Signed-off-by: Keith Packard <keithp@keithp.com>
-
-diff --git a/hw/xfree86/loader/loadmod.c b/hw/xfree86/loader/loadmod.c
-index 092bf57..f92ad8d 100644
---- a/hw/xfree86/loader/loadmod.c
-+++ b/hw/xfree86/loader/loadmod.c
-@@ -838,6 +838,9 @@ static const char *compiled_in_modules[] = {
-     "extmod",
-     "dri",
-     "dri2",
-+#if DRI3
-+    "dri3",
-+#endif
-     NULL
- };
- 
--- 
-cgit v0.10.2
-
-
-From 7ca458493aa2f0aa091c989ea0768611e0730bf5 Mon Sep 17 00:00:00 2001
-From: Chris Wilson <chris@chris-wilson.co.uk>
-Date: Wed, 28 May 2014 08:14:00 +0100
-Subject: xfree86: Report Present as a built-in module
-
-This is so that drivers can do a runtime check that Present is available,
-similar to existing runtime checks performed by the drivers for DRI.
-
-Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
-Signed-off-by: Keith Packard <keithp@keithp.com>
-
-diff --git a/hw/xfree86/loader/loadmod.c b/hw/xfree86/loader/loadmod.c
-index f92ad8d..e1f649a 100644
---- a/hw/xfree86/loader/loadmod.c
-+++ b/hw/xfree86/loader/loadmod.c
-@@ -841,6 +841,9 @@ static const char *compiled_in_modules[] = {
- #if DRI3
-     "dri3",
- #endif
-+#if PRESENT
-+    "present",
-+#endif
-     NULL
- };
- 
--- 
-cgit v0.10.2
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
similarity index 75%
rename from meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
rename to meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
index 3bba3ce..1519271 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.15.1.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.16.2.bb
@@ -1,16 +1,13 @@
 require xserver-xorg.inc
 
 # Misc build failure for master HEAD
-SRC_URI += "file://crosscompile.patch \
-            file://fix_open_max_preprocessor_error.patch \
-            file://mips64-compiler.patch \
+SRC_URI += "file://fix_open_max_preprocessor_error.patch \
             file://xorg-CVE-2013-6424.patch \
             file://xshmfence-option.patch \
-            file://present-module.patch \
            "
 
-SRC_URI[md5sum] = "e4c70262ed89764be8f8f5d699ed9227"
-SRC_URI[sha256sum] = "626db6882602ebe1ff81f7a4231c7ccc6ceb5032f2b5b3954bf749e1567221e2"
+SRC_URI[md5sum] = "89620960b13515db8d0a8dbb92a1378a"
+SRC_URI[sha256sum] = "446e0c3ebd556aced78ec0000ba9ae73f1e5317117d497f827afba48b787ce64"
 
 # These extensions are now integrated into the server, so declare the migration
 # path for in-place upgrades.
-- 
1.9.1


