Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYwvM-0006wu-7l
	for openembedded-core@lists.openembedded.org;
	Thu, 15 Nov 2012 11:43:57 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 15 Nov 2012 02:29:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,255,1352102400"; d="scan'208";a="247377215"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2012 02:29:56 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Nov 2012 12:29:54 +0200
Message-Id: <1352975394-17860-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <f819ea4994858356c0f33c7b754ae85a11b764b9.1352898505.git.laurentiu.palcu@intel.com>
References: <f819ea4994858356c0f33c7b754ae85a11b764b9.1352898505.git.laurentiu.palcu@intel.com>
Subject: [PATCH v4 07/12] libdrm: upgrade to 2.4.40
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
X-List-Received-Date: Thu, 15 Nov 2012 10:43:57 -0000

Other changes:
 * removed a backported patch;
 * activated libdrm-omap helper layer which is needed by the latest
   xf86-video-omap xorg driver;
 * split libdrm-drivers package into libdrm-radeon, libdrm-nouveau and
   libdrm-omap, libdrm-intel and libdrm-exynos;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc               |   20 ++++--
 .../drm/libdrm/disable-cairo.patch                 |   74 --------------------
 meta/recipes-graphics/drm/libdrm_2.4.39.bb         |   11 ---
 meta/recipes-graphics/drm/libdrm_2.4.40.bb         |   10 +++
 meta/recipes-graphics/drm/libdrm_git.bb            |    4 +-
 5 files changed, 27 insertions(+), 92 deletions(-)
 delete mode 100644 meta/recipes-graphics/drm/libdrm/disable-cairo.patch
 delete mode 100644 meta/recipes-graphics/drm/libdrm_2.4.39.bb
 create mode 100644 meta/recipes-graphics/drm/libdrm_2.4.40.bb

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index a64a5df..9c1124e 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -11,17 +11,27 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
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
+ALLOW_EMPTY_${PN}-drivers = "1"
+PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-radeon ${PN}-nouveau ${PN}-omap \
+             ${PN}-intel ${PN}-exynos ${PN}-kms"
+
+RDEPENDS_${PN}-drivers = "${PN}-radeon ${PN}-nouveau ${PN}-omap ${PN}-intel \
+                          ${PN}-exynos"
 
-PACKAGES =+ "${PN}-tests ${PN}-drivers ${PN}-kms"
 FILES_${PN}-tests = "${bindir}/dr* ${bindir}/mode*"
-FILES_${PN}-drivers = "${libdir}/libdrm_*.so.*"
+FILES_${PN}-radeon = "${libdir}/libdrm_radeon.so.*"
+FILES_${PN}-nouveau = "${libdir}/libdrm_nouveau.so.*"
+FILES_${PN}-omap = "${libdir}/libdrm_omap.so.*"
+FILES_${PN}-intel = "${libdir}/libdrm_intel.so.*"
+FILES_${PN}-exynos = "${libdir}/libdrm_exynos.so.*"
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
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.39.bb b/meta/recipes-graphics/drm/libdrm_2.4.39.bb
deleted file mode 100644
index f3ce2b1..0000000
--- a/meta/recipes-graphics/drm/libdrm_2.4.39.bb
+++ /dev/null
@@ -1,11 +0,0 @@
-require libdrm.inc
-
-PR = "${INC_PR}.0"
-
-SRC_URI += "file://installtests.patch \
-            file://GNU_SOURCE_definition.patch \
-            file://disable-cairo.patch \
-           "
-
-SRC_URI[md5sum] = "9a299e021d81bab6c82307582c78319d"
-SRC_URI[sha256sum] = "386b17388980504bca16ede81ceed4c77b12c3488f46ecb7f4d48e48512a733d"
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.40.bb b/meta/recipes-graphics/drm/libdrm_2.4.40.bb
new file mode 100644
index 0000000..42f860a
--- /dev/null
+++ b/meta/recipes-graphics/drm/libdrm_2.4.40.bb
@@ -0,0 +1,10 @@
+require libdrm.inc
+
+PR = "${INC_PR}.0"
+
+SRC_URI += "file://installtests.patch \
+            file://GNU_SOURCE_definition.patch \
+           "
+
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



