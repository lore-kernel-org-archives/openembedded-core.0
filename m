Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 82A5D78260
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Aug 2017 12:46:47 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Aug 2017 05:46:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,441,1498546800"; d="scan'208";a="144657140"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2017 05:46:48 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id DD646580366;
	Mon, 28 Aug 2017 05:46:47 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Aug 2017 15:46:35 +0300
Message-Id: <38789a200c02167a293e7b7d51e0f2ac0ce0da21.1503923683.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1503923683.git.jussi.kukkonen@intel.com>
References: <cover.1503923683.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/3] mesa: Support building without opengl
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
X-List-Received-Date: Mon, 28 Aug 2017 12:46:47 -0000

mesa can build certain things without opengl: most importantly vulkan
drivers.

Add comments on the dependencies between the packageconfigs. Also add
a few dependencies to packageconfigs. Modify default packageconfig to
do the reasonable thing based on distro features.

Add a backported patch to fix the build with --disable-opengl. Fix
do_install_append() so it works even if dri drivers are not built.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../0001-configure.ac-Always-check-for-expat.patch | 51 ++++++++++++++++++++++
 meta/recipes-graphics/mesa/mesa.inc                | 23 +++++++---
 meta/recipes-graphics/mesa/mesa_17.1.7.bb          |  1 +
 3 files changed, 68 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch

diff --git a/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch b/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch
new file mode 100644
index 0000000..4753c49
--- /dev/null
+++ b/meta/recipes-graphics/mesa/files/0001-configure.ac-Always-check-for-expat.patch
@@ -0,0 +1,51 @@
+From 1f7d752193f02d15d5923cee992e8f46d4c6df1b Mon Sep 17 00:00:00 2001
+From: Jussi Kukkonen <jussi.kukkonen@intel.com>
+Date: Mon, 28 Aug 2017 13:51:49 +0300
+Subject: [PATCH] configure.ac: Always check for expat
+
+expat was not checked if dri was not built leading to build failure
+in vulkan driver: backport a fix (a combination of multiple commits
+that should end up in 17.3).
+
+Upstream-Status: Backport
+Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
+---
+ configure.ac | 15 ++++++---------
+ 1 file changed, 6 insertions(+), 9 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index fd346c8aa2..662faecefa 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -1777,6 +1777,12 @@ if test "x$with_dri_drivers" = xno; then
+     with_dri_drivers=''
+ fi
+ 
++# Check for expat
++PKG_CHECK_MODULES([EXPAT], [expat])
++PKG_CHECK_MODULES([EXPAT], [expat],,
++    [PKG_CHECK_MODULES([EXPAT], [expat21])]
++)
++
+ dnl If $with_dri_drivers is yes, drivers will be added through
+ dnl platform checks. Set DEFINES and LIB_DEPS
+ if test "x$enable_dri" = xyes; then
+@@ -1810,15 +1816,6 @@ if test "x$enable_dri" = xyes; then
+         with_dri_drivers="i915 i965 nouveau r200 radeon swrast"
+     fi
+ 
+-    # Check for expat
+-    PKG_CHECK_MODULES([EXPAT], [expat], [],
+-        # expat version 2.0 and earlier do not provide expat.pc
+-        [AC_CHECK_HEADER([expat.h],[],
+-                         [AC_MSG_ERROR([Expat headers required for DRI not found])])
+-         AC_CHECK_LIB([expat],[XML_ParserCreate],[],
+-                     [AC_MSG_ERROR([Expat library required for DRI not found])])
+-         EXPAT_LIBS="-lexpat"])
+-
+     # put all the necessary libs together
+     DRI_LIB_DEPS="$DRI_LIB_DEPS $SELINUX_LIBS $LIBDRM_LIBS $EXPAT_LIBS -lm $PTHREAD_LIBS $DLOPEN_LIBS"
+ fi
+-- 
+2.14.1
+
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 3bb3cf4..4f31ed2 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -20,7 +20,7 @@ PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/
 
 inherit autotools pkgconfig gettext distro_features_check
 
-REQUIRED_DISTRO_FEATURES = "opengl"
+ANY_OF_DISTRO_FEATURES = "opengl vulkan"
 
 PLATFORMS ??= "${@bb.utils.filter('PACKAGECONFIG', 'x11 wayland', d)} \
                ${@bb.utils.contains('PACKAGECONFIG', 'gbm', 'drm', '', d)}"
@@ -32,20 +32,25 @@ EXTRA_OECONF = "--enable-shared-glapi \
                 --with-llvm-prefix=${STAGING_LIBDIR}/llvm${MESA_LLVM_RELEASE} \
                 --with-platforms='${PLATFORMS}'"
 
-PACKAGECONFIG ??= "gbm egl gles dri \
-		${@bb.utils.filter('DISTRO_FEATURES', 'wayland x11 vulkan', d)} \
-		${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
-		"
+PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'opengl egl gles gbm dri', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11', '', d)} \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
+		   "
+
+# "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+# "x11" requires "opengl"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
-PACKAGECONFIG[wayland] = ",,wayland-native wayland"
+PACKAGECONFIG[wayland] = ",,wayland-native wayland libdrm"
 
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
+# "dri" requires "opengl"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
 
@@ -56,8 +61,12 @@ VULKAN_DRIVERS_append_x86 = ",intel"
 VULKAN_DRIVERS_append_x86-64 = ",intel"
 PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=${VULKAN_DRIVERS}, --without-vulkan-drivers"
 
+PACKAGECONFIG[opengl] = "--enable-opengl, --disable-opengl"
+
+# "gles" requires "opengl"
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
+# "egl" requires "dri", "opengl"
 PACKAGECONFIG[egl] = "--enable-egl, --disable-egl"
 
 PACKAGECONFIG[etnaviv] = ""
@@ -121,7 +130,7 @@ do_install_append () {
 
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
-    chrpath --delete ${D}${libdir}/dri/*_dri.so
+    chrpath --delete ${D}${libdir}/dri/*_dri.so || true
 }
 
 # For the packages that make up the OpenGL interfaces, inject variables so that
diff --git a/meta/recipes-graphics/mesa/mesa_17.1.7.bb b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
index 494cdc6..a50f32c 100644
--- a/meta/recipes-graphics/mesa/mesa_17.1.7.bb
+++ b/meta/recipes-graphics/mesa/mesa_17.1.7.bb
@@ -10,6 +10,7 @@ SRC_URI = "https://mesa.freedesktop.org/archive/mesa-${PV}.tar.xz \
            file://0001-ac-fix-build-after-LLVM-5.0-SVN-r300718.patch \
            file://0002-gallivm-Fix-build-against-LLVM-SVN-r302589.patch \
            file://0001-winsys-svga-drm-Include-sys-types.h.patch \
+           file://0001-configure.ac-Always-check-for-expat.patch \
            "
 SRC_URI[md5sum] = "e40bb428a263bd28cbf6478dae45b207"
 SRC_URI[sha256sum] = "69f472a874b1122404fa0bd13e2d6bf87eb3b9ad9c21d2f39872a96d83d9e5f5"
-- 
2.1.4


