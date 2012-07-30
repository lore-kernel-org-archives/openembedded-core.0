Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Sw5UA-00084J-Px
	for Openembedded-core@lists.openembedded.org;
	Tue, 31 Jul 2012 07:59:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 30 Jul 2012 22:47:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="173448225"
Received: from yocto-hm1.jf.intel.com ([10.23.232.32])
	by orsmga001.jf.intel.com with ESMTP; 30 Jul 2012 22:47:38 -0700
From: nitin.a.kamble@intel.com
To: Openembedded-core@lists.openembedded.org
Date: Sun, 29 Jul 2012 22:45:40 -0700
Message-Id: <f34e98d24527f4bc09697b59deb4de9dacf0e007.1343627054.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1343627054.git.nitin.a.kamble@intel.com>
References: <cover.1343627054.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] libxcb: Ensure nativesdk package extension is handled correctly
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
X-List-Received-Date: Tue, 31 Jul 2012 05:59:15 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This avoids the warning:

NOTE: multiple providers are available for runtime libxcb-dri2 (libxcb-nativesdk, libxcb)
NOTE: consider defining a PREFERRED_PROVIDER entry to match libxcb-dri2

until such times as we convert nativesdk to use a prefix like multilib.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 meta/recipes-graphics/xcb/libxcb.inc       |   64 ++++++++++++++++------------
 meta/recipes-graphics/xcb/libxcb_1.1.91.bb |    2 +-
 meta/recipes-graphics/xcb/libxcb_1.8.1.bb  |    2 +-
 meta/recipes-graphics/xcb/libxcb_git.bb    |    2 +-
 4 files changed, 39 insertions(+), 31 deletions(-)

diff --git a/meta/recipes-graphics/xcb/libxcb.inc b/meta/recipes-graphics/xcb/libxcb.inc
index 1517f8a..efbde57 100644
--- a/meta/recipes-graphics/xcb/libxcb.inc
+++ b/meta/recipes-graphics/xcb/libxcb.inc
@@ -17,37 +17,45 @@ DEPENDS = "xcb-proto xproto libxau libxslt-native xcb-proto-native"
 SRC_URI = "http://xcb.freedesktop.org/dist/libxcb-${PV}.tar.bz2"
 #           file://xcbincludedir.patch"
 
-PACKAGES =+ "libxcb-composite libxcb-damage libxcb-dpms libxcb-glx \
-             libxcb-randr libxcb-record libxcb-render libxcb-res \
-             libxcb-screensaver libxcb-shape libxcb-shm libxcb-sync \
-             libxcb-xevie libxcb-xf86dri libxcb-xfixes libxcb-xlib \
-             libxcb-xprint libxcb-xtest libxcb-xv libxcb-xvmc \
-             libxcb-dri2"
+PKGSUFFIX = ""
+PKGSUFFIX_virtclass-nativesdk = "-nativesdk"
+
+PACKAGES =+ "${BPN}${PKGSUFFIX}-composite ${BPN}${PKGSUFFIX}-damage \
+             ${BPN}${PKGSUFFIX}-dpms ${BPN}${PKGSUFFIX}-glx \
+             ${BPN}${PKGSUFFIX}-randr ${BPN}${PKGSUFFIX}-record \
+             ${BPN}${PKGSUFFIX}-render ${BPN}${PKGSUFFIX}-res \
+             ${BPN}${PKGSUFFIX}-screensaver ${BPN}${PKGSUFFIX}-shape \
+             ${BPN}${PKGSUFFIX}-shm ${BPN}${PKGSUFFIX}-sync \
+             ${BPN}${PKGSUFFIX}-xevie ${BPN}${PKGSUFFIX}-xf86dri \
+             ${BPN}${PKGSUFFIX}-xfixes ${BPN}${PKGSUFFIX}-xlib \
+             ${BPN}${PKGSUFFIX}-xprint ${BPN}${PKGSUFFIX}-xtest \
+             ${BPN}${PKGSUFFIX}-xv ${BPN}${PKGSUFFIX}-xvmc \
+             ${BPN}${PKGSUFFIX}-dri2"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
 #FILES_${PN}-dev = "${libdir}/libxcb.* ${libdir}/pkgconfig/*.pc ${includedir}/xcb/*.h"
-FILES_libxcb-dri2 = "${libdir}/libxcb-dri2.so.*"
-FILES_libxcb-composite = "${libdir}/libxcb-composite.so.*"
-FILES_libxcb-damage = "${libdir}/libxcb-damage.so.*"
-FILES_libxcb-dpms = "${libdir}/libxcb-dpms.so.*"
-FILES_libxcb-glx = "${libdir}/libxcb-glx.so.*"
-FILES_libxcb-randr = "${libdir}/libxcb-randr.so.*"
-FILES_libxcb-record = "${libdir}/libxcb-record.so.*"
-FILES_libxcb-render = "${libdir}/libxcb-render.so.*"
-FILES_libxcb-res = "${libdir}/libxcb-res.so.*"
-FILES_libxcb-screensaver = "${libdir}/libxcb-screensaver.so.*"
-FILES_libxcb-shape = "${libdir}/libxcb-shape.so.*"
-FILES_libxcb-shm = "${libdir}/libxcb-shm.so.*"
-FILES_libxcb-sync = "${libdir}/libxcb-sync.so.*"
-FILES_libxcb-xevie = "${libdir}/libxcb-xevie.so.*"
-FILES_libxcb-xf86dri = "${libdir}/libxcb-xf86dri.so.*"
-FILES_libxcb-xfixes = "${libdir}/libxcb-xfixes.so.*"
-FILES_libxcb-xinerama = "${libdir}/libxcb-xinerama.so.*"
-FILES_libxcb-xlib = "${libdir}/libxcb-xlib.so.*"
-FILES_libxcb-xprint = "${libdir}/libxcb-xprint.so.*"
-FILES_libxcb-xtest = "${libdir}/libxcb-xtest.so.*"
-FILES_libxcb-xv = "${libdir}/libxcb-xv.so.*"
-FILES_libxcb-xvmc = "${libdir}/libxcb-xvmc.so.*"
+FILES_${BPN}${PKGSUFFIX}-dri2 = "${libdir}/libxcb-dri2.so.*"
+FILES_${BPN}${PKGSUFFIX}-composite = "${libdir}/libxcb-composite.so.*"
+FILES_${BPN}${PKGSUFFIX}-damage = "${libdir}/libxcb-damage.so.*"
+FILES_${BPN}${PKGSUFFIX}-dpms = "${libdir}/libxcb-dpms.so.*"
+FILES_${BPN}${PKGSUFFIX}-glx = "${libdir}/libxcb-glx.so.*"
+FILES_${BPN}${PKGSUFFIX}-randr = "${libdir}/libxcb-randr.so.*"
+FILES_${BPN}${PKGSUFFIX}-record = "${libdir}/libxcb-record.so.*"
+FILES_${BPN}${PKGSUFFIX}-render = "${libdir}/libxcb-render.so.*"
+FILES_${BPN}${PKGSUFFIX}-res = "${libdir}/libxcb-res.so.*"
+FILES_${BPN}${PKGSUFFIX}-screensaver = "${libdir}/libxcb-screensaver.so.*"
+FILES_${BPN}${PKGSUFFIX}-shape = "${libdir}/libxcb-shape.so.*"
+FILES_${BPN}${PKGSUFFIX}-shm = "${libdir}/libxcb-shm.so.*"
+FILES_${BPN}${PKGSUFFIX}-sync = "${libdir}/libxcb-sync.so.*"
+FILES_${BPN}${PKGSUFFIX}-xevie = "${libdir}/libxcb-xevie.so.*"
+FILES_${BPN}${PKGSUFFIX}-xf86dri = "${libdir}/libxcb-xf86dri.so.*"
+FILES_${BPN}${PKGSUFFIX}-xfixes = "${libdir}/libxcb-xfixes.so.*"
+FILES_${BPN}${PKGSUFFIX}-xinerama = "${libdir}/libxcb-xinerama.so.*"
+FILES_${BPN}${PKGSUFFIX}-xlib = "${libdir}/libxcb-xlib.so.*"
+FILES_${BPN}${PKGSUFFIX}-xprint = "${libdir}/libxcb-xprint.so.*"
+FILES_${BPN}${PKGSUFFIX}-xtest = "${libdir}/libxcb-xtest.so.*"
+FILES_${BPN}${PKGSUFFIX}-xv = "${libdir}/libxcb-xv.so.*"
+FILES_${BPN}${PKGSUFFIX}-xvmc = "${libdir}/libxcb-xvmc.so.*"
 
 inherit autotools pkgconfig pythonnative
 
diff --git a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
index 7ea7451..36f979b 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.1.91.bb
@@ -1,5 +1,5 @@
 include libxcb.inc
-PR = "r2"
+PR = "r3"
 
 DEPENDS += "libpthread-stubs xcb-proto-native"
 
diff --git a/meta/recipes-graphics/xcb/libxcb_1.8.1.bb b/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
index 1f39ca0..3f6d1b6 100644
--- a/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
+++ b/meta/recipes-graphics/xcb/libxcb_1.8.1.bb
@@ -3,7 +3,7 @@ include libxcb.inc
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d763b081cb10c223435b01e00dc0aba7"
 
-PR = "r0"
+PR = "r1"
 
 DEPENDS += "libpthread-stubs xcb-proto-native libxdmcp"
 
diff --git a/meta/recipes-graphics/xcb/libxcb_git.bb b/meta/recipes-graphics/xcb/libxcb_git.bb
index f8cf2a5..b3d79d8 100644
--- a/meta/recipes-graphics/xcb/libxcb_git.bb
+++ b/meta/recipes-graphics/xcb/libxcb_git.bb
@@ -4,7 +4,7 @@ include libxcb.inc
 
 SRCREV = "625ed596cae6dd8175aeb6cb6f26784928042f22"
 PV = "1.1.90.1+gitr${SRCPV}"
-PR = "r1"
+PR = "r2"
 
 DEPENDS += "libpthread-stubs xcb-proto-native"
 
-- 
1.7.3.4



