Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QBhCW-00087T-Ob
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Apr 2011 07:40:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 17 Apr 2011 22:38:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,231,1301900400"; d="scan'208";a="421001317"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by azsmga001.ch.intel.com with ESMTP; 17 Apr 2011 22:38:11 -0700
Message-Id: <104cf8a8fe3ed92f781e5a4bb189a1eea2749819.1303105369.git.ke.yu@intel.com>
In-Reply-To: <cover.1303105369.git.ke.yu@intel.com>
References: <cover.1303105369.git.ke.yu@intel.com>
Old-Date: Sat, 16 Apr 2011 13:34:58 +0800
Date: Mon, 18 Apr 2011 13:45:42 +0800
To: openembedded-core@lists.openembedded.org
From: Yu Ke <ke.yu@intel.com>
Subject: [PATCH 2/3] mesa: cleanup and remove the old version 7.5, 7.7 and 7.8.2
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
X-List-Received-Date: Mon, 18 Apr 2011 05:40:45 -0000

From: Yu Ke <ke.yu@intel.com>

 - mesa 7.8.2 is kept to have a version without GPLv3 talloc. now 7.10.2 has removed the talloc, 7.8.2 can be removed safely.
 - mesa 7.5 and 7.7 is a legacy recips from original poky, also can removed.
 - mesa-dri-glsl-native_7.8.2 is a dependecy recipe only used by mesa 7.8.2, should also be removed along with mesa 7.8.2
 - aslo update the patch upstream status

Signed-off-by: Yu Ke <ke.yu@intel.com>
---
 meta/recipes-graphics/mesa/mesa-dri/cross2.patch   |    2 +
 meta/recipes-graphics/mesa/mesa-dri/crossfix.patch |    2 +
 meta/recipes-graphics/mesa/mesa-dri_7.5.bb         |   48 -----------------
 meta/recipes-graphics/mesa/mesa-dri_7.7.bb         |   49 -----------------
 meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb       |   56 --------------------
 5 files changed, 4 insertions(+), 153 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.5.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.7.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb

diff --git a/meta/recipes-graphics/mesa/mesa-dri/cross2.patch b/meta/recipes-graphics/mesa/mesa-dri/cross2.patch
index d214791..264c153 100644
--- a/meta/recipes-graphics/mesa/mesa-dri/cross2.patch
+++ b/meta/recipes-graphics/mesa/mesa-dri/cross2.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: git/configure.ac
 ===================================================================
 --- git.orig/configure.ac	2009-09-01 16:38:26.000000000 +0100
diff --git a/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch b/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
index 84be428..d300e2f 100644
--- a/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
+++ b/meta/recipes-graphics/mesa/mesa-dri/crossfix.patch
@@ -1,3 +1,5 @@
+Upstream-Status: Pending
+
 Index: Mesa-7.5/bin/mklib
 ===================================================================
 --- Mesa-7.5.orig/bin/mklib	2009-08-12 13:01:34.000000000 +0100
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.5.bb b/meta/recipes-graphics/mesa/mesa-dri_7.5.bb
deleted file mode 100644
index b50cee8..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_7.5.bb
+++ /dev/null
@@ -1,48 +0,0 @@
-include mesa-common.inc
-
-SRC_URI += "file://crossfix.patch;patch=1"
-#            file://mesa-DRI2Swapbuffer.patch;patch=1
-
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
-
-PR = "r12"
-
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
-# Atom PCs have DRI support so use mesa-dri by default
-DEFAULT_PREFERENCE_atom-pc = "1"
-
-PACKAGES =+ "${PN}-xprogs"
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-LEAD_SONAME = "libGL.so.1"
-
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
-
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
-
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-
-#
-# Header generated by i586-poky-linux-gcc gen_matypes.c -o gen_matypes -I ../../../include/GL -I ../../../include -I .. -I ../main/ -I ../math -I ../glapi/ -I ../tnl
-# then run gen_matypes > matypes.h on device
-#
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.7.bb b/meta/recipes-graphics/mesa/mesa-dri_7.7.bb
deleted file mode 100644
index 4cae9c8..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_7.7.bb
+++ /dev/null
@@ -1,49 +0,0 @@
-include mesa-common.inc
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/7.7/MesaLib-${PV}.tar.bz2 \
-           ftp://ftp.freedesktop.org/pub/mesa/7.7/MesaDemos-${PV}.tar.bz2  \
-           file://crossfix.patch;patch=1"
-
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS}"
-
-PR = "r12"
-
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
-# Atom PCs have DRI support so use mesa-dri by default
-DEFAULT_PREFERENCE_atom-pc = "1"
-
-PACKAGES =+ "${PN}-xprogs"
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-LEAD_SONAME = "libGL.so.1"
-
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
-
-do_install_append () {
-    install -d ${D}/usr/bin
-    install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
-
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-
-#
-# Header generated by i586-poky-linux-gcc gen_matypes.c -o gen_matypes -I ../../../include/GL -I ../../../include -I .. -I ../main/ -I ../math -I ../glapi/ -I ../tnl
-# then run gen_matypes > matypes.h on device
-#
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb b/meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb
deleted file mode 100644
index 1b4606d..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri_7.8.2.bb
+++ /dev/null
@@ -1,56 +0,0 @@
-include mesa-common.inc
-
-LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
-
-PROTO_DEPS = "xf86driproto glproto dri2proto"
-LIB_DEPS = "libdrm virtual/libx11 libxext libxxf86vm libxdamage libxfixes expat"
-
-DEPENDS = "${PROTO_DEPS}  ${LIB_DEPS} mesa-dri-glsl-native"
-
-PR = "r3"
-
-SRC_URI += "file://crossfix.patch"
-
-SRC_URI[mesalib.md5sum] = "6be2d343a0089bfd395ce02aaf8adb57"
-SRC_URI[mesalib.sha256sum] = "505bf418dceba05837f4ea1b1972b9620c35f8cb94bc4d1e6d573c15f562576d"
-
-SRC_URI[mesademos.md5sum] = "757d9e2e06f48b1a52848be9b0307ced"
-SRC_URI[mesademos.sha256sum] = "ea7b9ebfb7a80de2b275c0c9124c8a505382ec48411a2794ab82542f9885ac3c"
-
-# most of our targets do not have DRI so will use mesa-xlib
-DEFAULT_PREFERENCE = "-1"
-
-LEAD_SONAME = "libGL.so.1"
-
-EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium"
-
-# We need glsl-compile built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
-do_configure_prepend() {
-	sed -i "s#^GLSL_CL = .*\$#GLSL_CL = ${STAGING_BINDIR_NATIVE}/glsl-compile#g" ${S}/src/mesa/shader/slang/library/Makefile
-}
-
-do_install_append () {
-	install -d ${D}/usr/bin
-	install -m 0755 ${S}/progs/xdemos/{glxdemo,glxgears,glxheads,glxinfo} ${D}/usr/bin/
-}
-
-python populate_packages_prepend() {
-	import os.path
-
-	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
-
-	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
-}
-
-COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-
-PACKAGES =+ "${PN}-xprogs"
-PACKAGES_DYNAMIC = "mesa-dri-driver-*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-FILES_${PN}-xprogs = "${bindir}/glxdemo ${bindir}/glxgears ${bindir}/glxheads ${bindir}/glxinfo"
-
-#
-# Header generated by i586-poky-linux-gcc gen_matypes.c -o gen_matypes -I ../../../include/GL -I ../../../include -I .. -I ../main/ -I ../math -I ../glapi/ -I ../tnl
-# then run gen_matypes > matypes.h on device
-#
-- 
1.7.0.4



