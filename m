Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1Tm2Ip-0004gH-Ol
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Dec 2012 14:06:24 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 21 Dec 2012 04:51:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,329,1355126400"; d="scan'208";a="183385172"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by AZSMGA002.ch.intel.com with ESMTP; 21 Dec 2012 04:51:26 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id DB128560AA1; Fri, 21 Dec 2012 14:51:30 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org, ross.burton@intel.com,
	martin.jansa@gmail.com
Date: Fri, 21 Dec 2012 14:51:27 +0200
Message-Id: <f01341a575d045489ad0208e7638a8de87d0df10.1356094006.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356094006.git.alexandru.damian@intel.com>
References: <cover.1356094006.git.alexandru.damian@intel.com>
	<bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356094006.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1356094006.git.alexandru.damian@intel.com>
References: <cover.1356094006.git.alexandru.damian@intel.com>
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH 2/3] Prepare mesa-dri for weston compatibility
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
X-List-Received-Date: Fri, 21 Dec 2012 13:06:25 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch enables mesa-git to build wayland-compatible
packages for usage with weston.

It adds wayland platform support, packs the wayland-egl
files, and sets the -git version as preffered provider.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   13 ++++++++++---
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 2 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 70957eb..65f70e7 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,13 +12,12 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r9"
+INC_PR = "r10"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
-
 # for mesa-dri and mesa-xlib
 FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
 
@@ -29,10 +28,15 @@ EXTRA_OECONF = "--disable-glu \
                 --disable-glut \
                 --enable-shared-glapi"
 
-PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} egl gles"
+PACKAGECONFIG ??= "egl gles \
+		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
+		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
+		"
 
 X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
+PACKAGECONFIG[wayland] = ",,wayland"
+
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
@@ -49,6 +53,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
+             wayland-egl wayland-egl-dev \
             "
 
 do_install_append () {
@@ -90,8 +95,10 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
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
-- 
1.7.10.4



