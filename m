Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfS-0006Sf-W6
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:40 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907453"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:45 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:24 +0200
Message-Id: <69a45cc5b2e02a92be884bf0e7c8d0d5f6092985.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 07/12] libdrm: upgrade to 2.4.40
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
X-List-Received-Date: Tue, 13 Nov 2012 12:32:40 -0000

Other changes:
 * removed a backported patch;
 * activated libdrm-omap helper layer which is needed by the latest
   xf86-video-omap xorg driver;
 * split libdrm-drivers package into libdrm-radeon, libdrm-nouveau and
   libdrm-omap;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc               |   15 ++--
 .../drm/libdrm/disable-cairo.patch                 |   74 --------------------
 .../drm/{libdrm_2.4.39.bb => libdrm_2.4.40.bb}     |    5 +-
 meta/recipes-graphics/drm/libdrm_git.bb            |    4 +-
 4 files changed, 13 insertions(+), 85 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/disable-cairo.patch
 rename meta/recipes-graphics/drm/{libdrm_2.4.39.bb => libdrm_2.4.40.bb} (44%)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index a64a5df..2584e02 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -8,20 +8,23 @@ SECTION = "x11/base"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
-PROVIDES = "drm"
+PROVIDES = "drm libdrm-radeon libdrm-nouveau libdrm-omap"
 DEPENDS = "libpthread-stubs udev"
 
-INC_PR = "r3"
+INC_PR = "r4"
 
 #libpciaccess is required starting from libdrm 2.4.26
 DEPENDS += " libpciaccess"
 
 inherit autotools pkgconfig
 
-EXTRA_OECONF += "--disable-cairo-tests"
+EXTRA_OECONF += "--disable-cairo-tests \
+                 --enable-omap-experimental-api \
+                "
 
-PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
+PACKAGES =+ "${PN}-tests ${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-kms"
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
-FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
+FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
+FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
+FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
 FILES_${PN}-kms = "${libdir}/libkms*.so.*"
-
diff --git a/meta/recipes-graphics/drm/libdrm/disable-cairo.patch b/meta/recipes-graphics/drm/libdrm/disable-cairo.patch
deleted file mode 100644
index 90e79d4..0000000
--- a/meta/recipes-graphics/drm/libdrm/disable-cairo.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-commit c81d1df4926072d24b4dad1b488e618e57eff1c6
-Author: Daniel Stone <daniel@fooishbar.org>
-Date:   Thu Oct 4 10:26:37 2012 +1000
-
-    configure.ac: Allow forcible disabling of Cairo support
-    
-    We don't want to build libdrm tests with Cairo support under Poky, since
-    they're never used and also cause a build loop from libdrm -> cairo ->
-    mesa-dri -> libdrm.
-    
-    To avoid variance in build results, introduce a --disable-cairo-tests
-    switch.
-    
-    Upstream-Status: Backport
-    
-    Signed-off-by: Daniel Stone <daniel@fooishbar.org>
-
-diff --git a/configure.ac b/configure.ac
-index 290362c..8c28107 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -222,11 +222,23 @@ if test "x$EXYNOS" = xyes; then
- 	AC_DEFINE(HAVE_EXYNOS, 1, [Have EXYNOS support])
- fi
- 
-+AC_ARG_ENABLE([cairo-tests],
-+              [AS_HELP_STRING([--enable-cairo-tests],
-+                              [Enable support for Cairo rendering in tests (default: auto)])],
-+              [CAIRO=$enableval], [CAIRO=auto])
- PKG_CHECK_MODULES(CAIRO, cairo, [HAVE_CAIRO=yes], [HAVE_CAIRO=no])
--if test "x$HAVE_CAIRO" = xyes; then
--	AC_DEFINE(HAVE_CAIRO, 1, [Have cairo support])
-+AC_MSG_CHECKING([whether to enable Cairo tests])
-+if test "x$CAIRO" = xauto; then
-+	CAIRO="$HAVE_CAIRO"
- fi
--AM_CONDITIONAL(HAVE_CAIRO, [test "x$HAVE_CAIRO" = xyes])
-+if test "x$CAIRO" = xyes; then
-+	if ! test "x$HAVE_CAIRO" = xyes; then
-+		AC_MSG_ERROR([Cairo support required but not present])
-+	fi
-+	AC_DEFINE(HAVE_CAIRO, 1, [Have Cairo support])
-+fi
-+AC_MSG_RESULT([$CAIRO])
-+AM_CONDITIONAL(HAVE_CAIRO, [test "x$CAIRO" = xyes])
- 
- # For enumerating devices in test case
- PKG_CHECK_MODULES(LIBUDEV, libudev, [HAVE_LIBUDEV=yes], [HAVE_LIBUDEV=no])
-diff --git a/tests/modetest/Makefile.am b/tests/modetest/Makefile.am
-index b5ec771..065ae13 100644
---- a/tests/modetest/Makefile.am
-+++ b/tests/modetest/Makefile.am
-@@ -1,8 +1,7 @@
- AM_CFLAGS = \
- 	-I$(top_srcdir)/include/drm \
- 	-I$(top_srcdir)/libkms/ \
--	-I$(top_srcdir) \
--	$(CAIRO_CFLAGS)
-+	-I$(top_srcdir)
- 
- noinst_PROGRAMS = \
- 	modetest
-@@ -12,5 +11,9 @@ modetest_SOURCES = \
- 
- modetest_LDADD = \
- 	$(top_builddir)/libdrm.la \
--	$(top_builddir)/libkms/libkms.la \
--	$(CAIRO_LIBS)
-+	$(top_builddir)/libkms/libkms.la
-+
-+if HAVE_CAIRO
-+AM_CFLAGS += $(CAIRO_CFLAGS)
-+modetest_LDADD += $(CAIRO_LIBS)
-+endif
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.39.bb b/meta/recipes-graphics/drm/libdrm_2.4.40.bb
similarity index 44%
rename from meta/recipes-graphics/drm/libdrm_2.4.39.bb
rename to meta/recipes-graphics/drm/libdrm_2.4.40.bb
index f3ce2b1..42f860a 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.39.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.40.bb
@@ -4,8 +4,7 @@ PR = "${INC_PR}.0"
 
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
-            file://disable-cairo.patch \
            "
 
-SRC_URI[md5sum] = "9a299e021d81bab6c82307582c78319d"
-SRC_URI[sha256sum] = "386b17388980504bca16ede81ceed4c77b12c3488f46ecb7f4d48e48512a733d"
+SRC_URI[md5sum] = "626a3dc44a40ef37565b61732b688567"
+SRC_URI[sha256sum] = "48c14e4600ea0fde522292893eb4055d2f6d86a69d093d379c827deaccffaa1f"
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index 5d7f953..e3051c7 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -6,7 +6,7 @@ S = "${WORKDIR}/git"
 
 DEFAULT_PREFERENCE = "-1"
 
-SRCREV = "14db948127e549ea9234e02d8e112de3871f8f9f"
-PV = "2.4.39+git${SRCPV}"
+SRCREV = "e01d68f9f3acfc35fe164283904b5d058c2ab378"
+PV = "2.4.40+git${SRCPV}"
 PR = "${INC_PR}.0"
 
-- 
1.7.9.5



