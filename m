Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C296372F98
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Feb 2017 09:27:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Feb 2017 01:27:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,218,1484035200"; d="scan'208";a="62839619"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 28 Feb 2017 01:27:11 -0800
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 58F7C6A4082;
	Tue, 28 Feb 2017 01:27:09 -0800 (PST)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 28 Feb 2017 11:26:57 +0200
Message-Id: <74496fb491f86bee8df0f84a5da6f6c05044d2b7.1488272553.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1488272553.git.jussi.kukkonen@intel.com>
References: <cover.1488272553.git.jussi.kukkonen@intel.com>
Subject: [PATCH v2 4/6] mesa: Enable vulkan driver for intel
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
X-List-Received-Date: Tue, 28 Feb 2017 09:27:11 -0000

PACKAGECONFIG "vulkan" enables building libvulkan_intel.so.
The radeon driver can be added to recipe as well but it requires
llvm so recent that I couldn't test it.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index f982dd4..54bc362 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -42,6 +42,10 @@ DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
 PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
 PACKAGECONFIG[dri3] = "--enable-dri3, --disable-dri3, dri3proto presentproto libxshmfence"
 
+# Vulkan drivers need dri3 enabled
+# radeon could be enabled as well but requires gallium-llvm with llvm >= 3.9
+PACKAGECONFIG[vulkan] = "--with-vulkan-drivers=intel, --without-vulkan-drivers"
+
 PACKAGECONFIG[gles] = "--enable-gles1 --enable-gles2, --disable-gles1 --disable-gles2"
 
 EGL_PLATFORMS  = "drm"
@@ -89,7 +93,7 @@ PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libgles3-mesa libgles3-mesa-dev \
              libwayland-egl libwayland-egl-dev \
              libxatracker libxatracker-dev \
-             mesa-megadriver \
+             mesa-megadriver mesa-vulkan-drivers \
             "
 
 do_install_append () {
@@ -163,6 +167,7 @@ PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN} += "${sysconfdir}/drirc"
 FILES_mesa-megadriver = "${libdir}/dri/*"
+FILES_mesa-vulkan-drivers = "${libdir}/libvulkan_*.so ${datadir}/vulkan"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
@@ -173,7 +178,7 @@ FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
 FILES_libxatracker = "${libdir}/libxatracker.so.*"
 
-FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
+FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc ${includedir}/vulkan"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-- 
2.1.4


