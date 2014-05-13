Return-Path: <valentin.popa@intel.com>
Received: from mga03.intel.com (unknown [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id 72CBD65FE3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 May 2014 14:59:33 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 13 May 2014 07:59:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,1044,1389772800"; d="scan'208";a="431533217"
Received: from vpopa-desktop.rb.intel.com ([10.237.105.76])
	by azsmga001.ch.intel.com with ESMTP; 13 May 2014 07:59:33 -0700
From: Valentin Popa <valentin.popa@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 May 2014 17:59:11 +0300
Message-Id: <84c0b7befda652d0d7f00dbdedece2e535bad760.1399993010.git.valentin.popa@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1399993010.git.valentin.popa@intel.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
In-Reply-To: <cover.1399993010.git.valentin.popa@intel.com>
References: <cover.1399993010.git.valentin.popa@intel.com>
Subject: [PATCH 3/3] mesa: upgrade to 10.1.3
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
X-List-Received-Date: Tue, 13 May 2014 14:59:34 -0000

(*) libdricore was removed.
(*) added libmesa-megadriver that includes
    all the hardlinks to the mesa megadriver.
(*) license is the same.

Signed-off-by: Valentin Popa <valentin.popa@intel.com>
---
 .../mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb}   |  0
 meta/recipes-graphics/mesa/mesa.inc                | 35 +++++++++++++---------
 .../mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb}         |  4 +--
 meta/recipes-graphics/mesa/mesa_git.bb             |  4 +--
 4 files changed, 25 insertions(+), 18 deletions(-)
 rename meta/recipes-graphics/mesa/{mesa-gl_9.2.5.bb => mesa-gl_10.1.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_9.2.5.bb => mesa_10.1.3.bb} (82%)

diff --git a/meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb b/meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-gl_9.2.5.bb
rename to meta/recipes-graphics/mesa/mesa-gl_10.1.3.bb
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a33b7b5..855a9e4 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -10,11 +10,11 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
 
-INC_PR = "r9"
 PE = "2"
 
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=6a23445982a7a972ac198e93cc1cb3de"
+
 DEPENDS = "expat makedepend-native flex-native bison-native udev"
 
 PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl virtual/mesa"
@@ -30,7 +30,7 @@ PACKAGECONFIG ??= "egl gles dri \
 		${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
 		"
 
-X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes presentproto libxshmfence"
 PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
 PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
 PACKAGECONFIG[wayland] = ",,wayland"
@@ -38,7 +38,7 @@ PACKAGECONFIG[wayland] = ",,wayland"
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
 DRIDRIVERS_append_x86-64 = ",radeon,r200,nouveau,i965,i915"
-PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto libdrm"
+PACKAGECONFIG[dri] = "--enable-dri --with-dri-drivers=${DRIDRIVERS}, --disable-dri, dri2proto dri3proto libdrm"
 
 EXTRA_OECONF += "--enable-gbm"
 
@@ -78,7 +78,7 @@ RDEPENDS_${PN}-dev = ""
 PACKAGES =+ "libegl-mesa libegl-mesa-dev \
              libosmesa libosmesa-dev \
              libgl-mesa libgl-mesa-dev \
-             libdricore libdricore-dev \
+             libmesa-megadriver \
              libglapi libglapi-dev \
              libgbm libgbm-dev \
              libgles1-mesa libgles1-mesa-dev \
@@ -96,7 +96,7 @@ do_install_append () {
     rm -f ${D}${libdir}/egl/*.la
     rm -f ${D}${libdir}/gallium-pipe/*.la
     rm -f ${D}${libdir}/gbm/*.la
-    
+
     # it was packaged in libdricore9.1.3-1 and preventing upgrades when debian.bbclass was used 
     rm -f ${D}${sysconfdir}/drirc
 }
@@ -119,7 +119,7 @@ python __anonymous() {
         d.appendVar("RREPLACES_" + fullp, pkgs)
         d.appendVar("RPROVIDES_" + fullp, pkgs)
         d.appendVar("RCONFLICTS_" + fullp, pkgs)
-        
+
         # For -dev, the first element is both the Debian and original name
         fullp += "-dev"
         pkgs = p[1] + "-dev"
@@ -130,15 +130,23 @@ python __anonymous() {
 }
 
 python mesa_populate_packages() {
-    dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-
     pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
-    pkgs += do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends='')
     for pkg in pkgs:
         d.setVar("RPROVIDES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RCONFLICTS_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
         d.setVar("RREPLACES_%s" % pkg, pkg.replace("mesa-", "mesa-dri-"))
-    
+
+    import re
+    dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
+    dri_pkgs = os.listdir(d.getVar('PKGD', True) + dri_drivers_root)
+    for p in sorted(dri_pkgs):
+        m = re.match('^(.*)_dri\.so$', p)
+        if m:
+            pkg_name = " mesa-driver-%s" % legitimize_package_name(m.group(1))
+            d.appendVar("RPROVIDES_libmesa-megadriver", pkg_name)
+            d.appendVar("RCONFLICTS_libmesa-megadriver", pkg_name)
+            d.appendVar("RREPLACES_libmesa-megadriver", pkg_name)
+
     pipe_drivers_root = os.path.join(d.getVar('libdir', True), "gallium-pipe")
     do_split_packages(d, pipe_drivers_root, '^pipe_(.*)\.so$', 'mesa-driver-pipe-%s', 'Mesa %s pipe driver', extra_depends='')
 }
@@ -148,8 +156,8 @@ PACKAGESPLITFUNCS_prepend = "mesa_populate_packages "
 PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-
-FILES_libdricore = "${sysconfdir}/drirc ${libdir}/libdricore*.so.*"
+FILES_${PN} += "${sysconfdir}/drirc"
+FILES_libmesa-megadriver = "${libdir}/dri/*"
 FILES_libegl-mesa = "${libdir}/libEGL.so.*"
 FILES_libgbm = "${libdir}/libgbm.so.*"
 FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
@@ -164,7 +172,6 @@ FILES_libopenvg = "${libdir}/libOpenVG.so.*"
 FILES_libxvmcsoftpipe = "${libdir}/libXvMCsoftpipe.so.*"
 
 FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
-FILES_libdricore-dev = "${libdir}/libdricore*.*"
 FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
 FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
 FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
diff --git a/meta/recipes-graphics/mesa/mesa_9.2.5.bb b/meta/recipes-graphics/mesa/mesa_10.1.3.bb
similarity index 82%
rename from meta/recipes-graphics/mesa/mesa_9.2.5.bb
rename to meta/recipes-graphics/mesa/mesa_10.1.3.bb
index 02ecd46..abc450a 100644
--- a/meta/recipes-graphics/mesa/mesa_9.2.5.bb
+++ b/meta/recipes-graphics/mesa/mesa_10.1.3.bb
@@ -5,8 +5,8 @@ SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
            file://0006-fix-out-of-tree-egl.patch \
            "
 
-SRC_URI[md5sum] = "9fb4de29ca1d9cfd03cbdefa123ba336"
-SRC_URI[sha256sum] = "b46ab9efed176df0591993397594d712ada9da6a47fd31bbe75050fe28eb6bf0"
+SRC_URI[md5sum] = "ba6dbe2b9cab0b4de840c996b9b6a3ad"
+SRC_URI[sha256sum] = "b2615e236ef25d0fb94b8420bdd2e2a520b7dd5ca2d4b93306154f7fd4adecc3"
 
 S = "${WORKDIR}/Mesa-${PV}"
 
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 1e6fdb5..59b0d1c 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -5,8 +5,8 @@ DEFAULT_PREFERENCE = "-1"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
 
 PR = "${INC_PR}.0"
-SRCREV = "4636e87191fddd492ed8c61ba61faf4b2d89b2e4"
-PV = "9.2.5+git${SRCPV}"
+SRCREV = "0028eb1083e6adc110a23a5f02c993cda217067a"
+PV = "10.1.3+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
-- 
1.9.1


