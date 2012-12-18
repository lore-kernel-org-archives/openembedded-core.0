Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1TkxiI-00018N-IG
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 15:00:08 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 18 Dec 2012 05:45:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,309,1355126400"; d="scan'208";a="233211349"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by azsmga001.ch.intel.com with ESMTP; 18 Dec 2012 05:45:21 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 3AD1C560901; Tue, 18 Dec 2012 15:45:35 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: daniel@fooishbar.org, ross.burton@intel.com,
	openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 15:45:31 +0200
Message-Id: <1355838331-24404-4-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
References: <1355838331-24404-1-git-send-email-alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 3/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Tue, 18 Dec 2012 14:00:08 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch enables mesa-git to build wayland-compatible
packages for usage with weston.

It adds wayland platform support, packs the wayland-egl
files, and sets the -git version as preffered provider.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    8 ++++++--
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 meta/recipes-graphics/mesa/mesa-dri_git.bb |    3 ++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 1d3655f..0e4930c 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,13 +12,13 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r8"
+INC_PR = "r9"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
-
+PROVIDES += "wayland-egl libgbm libglapi"
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
 
@@ -30,6 +30,7 @@ EXTRA_OECONF = "--disable-glu \
                 --enable-shared-glapi"
 
 PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} egl gles"
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} egl gles"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
@@ -46,6 +47,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
+             wayland-egl wayland-egl-dev \
             "
 
 do_install_append () {
@@ -88,8 +90,10 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
 FILES_libgl-mesa = "${libdir}/libGL.so.*"
 FILES_libglapi = "${libdir}/libglapi.so.*"
 FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+FILES_wayland-egl = "${libdir}/libwayland-egl.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
+FILES_wayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
 FILES_libdricore-dev = "${libdir}/libdricore*.*"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
index 07544ab..1f6ec78 100644
--- a/meta/recipes-graphics/mesa/mesa-dri.inc
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -13,6 +13,7 @@ PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-
 
 EGL_PLATFORMS  = "drm"
 EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
+EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
 python populate_packages_prepend() {
diff --git a/meta/recipes-graphics/mesa/mesa-dri_git.bb b/meta/recipes-graphics/mesa/mesa-dri_git.bb
index 69a433e..7fd0d39 100644
--- a/meta/recipes-graphics/mesa/mesa-dri_git.bb
+++ b/meta/recipes-graphics/mesa/mesa-dri_git.bb
@@ -3,6 +3,7 @@ require mesa-git.inc
 require mesa-dri.inc
 
 # this needs to be lower than -1 because all mesa-dri have -1 and git version has highest PV, but shouldn't be default
-DEFAULT_PREFERENCE = "-2"
+# adamian - switch to git version
+DEFAULT_PREFERENCE = "1"
 
 PR = "${INC_PR}.0"
-- 
1.7.10.4



