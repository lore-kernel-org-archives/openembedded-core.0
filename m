Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1Tn50w-0000uT-LQ
	for openembedded-core@lists.openembedded.org;
	Mon, 24 Dec 2012 11:12:08 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 24 Dec 2012 01:57:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,346,1355126400"; d="scan'208";a="266458046"
Received: from adamian-desktop.rb.intel.com ([10.237.105.141])
	by fmsmga001.fm.intel.com with ESMTP; 24 Dec 2012 01:57:14 -0800
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 98AC5560627; Mon, 24 Dec 2012 11:57:27 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org, sgw@linux.intel.com,
	richard.purdie@linuxfoundation.org, ross.burton@intel.com
Date: Mon, 24 Dec 2012 11:57:23 +0200
Message-Id: <43f5ecf2bec840e1266c74982aaa847e11b09007.1356342794.git.alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356342794.git.alexandru.damian@intel.com>
References: <bf4c63b763ceb045df5b4b27136ab6cf3f8f5ca5.1356342794.git.alexandru.damian@intel.com>
In-Reply-To: <cover.1356342794.git.alexandru.damian@intel.com>
References: <cover.1356342794.git.alexandru.damian@intel.com>
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
X-List-Received-Date: Mon, 24 Dec 2012 10:12:09 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This patch enables mesa-git to build wayland-compatible
packages for usage with weston.

It adds wayland platform support, packs the wayland-egl
files.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |   10 +++++++++-
 meta/recipes-graphics/mesa/mesa-dri.inc    |    1 +
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 70957eb..cf6e610 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -29,10 +29,15 @@ EXTRA_OECONF = "--disable-glu \
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
@@ -49,6 +54,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles1-mesa libgles1-mesa-dev \
              libgles2-mesa libgles2-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
+             wayland-egl wayland-egl-dev \
             "
 
 do_install_append () {
@@ -90,8 +96,10 @@ FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
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



