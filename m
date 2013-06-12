Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f53.google.com (mail-ee0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id F2A636A957
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:39 +0000 (UTC)
Received: by mail-ee0-f53.google.com with SMTP id c41so4773160eek.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=OU5t7ehkEVSAXzPbKPvV0BkOsl/AUZDQM4yHFFzGhgk=;
	b=xdWlvYOIjS4s3+OuvQBIBvkGg9LO63iZWVW9sWvUhqPlbboONxnWV35J+8xxGsfnBv
	eortVuSqrBCv5T40KtM1o6WGKvrrpckhGKkODAN8/ZJM0+p8KAwjOROuinEE4Ft9QzBK
	XVWPOlT8qkNx7pyIqlMls8RqPZprMUAh+IJcXgsLNUxjPQ9Cr/76PV1iZBxCVht6hM80
	xg8bCiciqfSP4J9Ahh0o1W3F6eO9flEkPq7LjSImPdHh9hrrp3Q3FIJBGYWoW1/U5jfL
	2lCdt11BmCEQmSRqZrrwekBF0F4xQEWL145LAbNnOgaGCewOsgOgulXbIJQbw1mDarV0
	98GQ==
X-Received: by 10.14.94.3 with SMTP id m3mr23371659eef.66.1371079180626;
	Wed, 12 Jun 2013 16:19:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	p43sm39762372eem.11.2013.06.12.16.19.39 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:54 +0200
Message-Id: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 01/10] mesa: merge mesa-common.inc to mesa.inc
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:40 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc | 106 ----------------------------
 meta/recipes-graphics/mesa/mesa.inc        | 108 ++++++++++++++++++++++++++++-
 meta/recipes-graphics/mesa/mesa_9.1.3.bb   |   1 -
 meta/recipes-graphics/mesa/mesa_git.bb     |   1 -
 4 files changed, 105 insertions(+), 111 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-common.inc

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
deleted file mode 100644
index f9d7ced..0000000
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ /dev/null
@@ -1,106 +0,0 @@
-SUMMARY = "A free implementation of the OpenGL API"
-DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
-a system for rendering interactive 3D graphics.  \
-A variety of device drivers allows Mesa to be used in many different environments \
-ranging from software emulation to complete hardware acceleration for modern GPUs. \
-Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
-environment."
-
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "MIT"
-
-INC_PR = "r9"
-PE = "2"
-
-DEPENDS = "expat makedepend-native flex-native bison-native"
-
-PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
-
-inherit autotools pkgconfig pythonnative
-
-EXTRA_OECONF = "--enable-shared-glapi"
-
-PACKAGECONFIG ??= "egl gles \
-		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
-		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
-		"
-
-X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
-PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
-PACKAGECONFIG[wayland] = ",,wayland"
-
-
-# Multiple virtual/gl providers being built breaks staging
-EXCLUDE_FROM_WORLD = "1"
-
-# Remove the mesa dependency on mesa-dev, as mesa is empty
-RDEPENDS_${PN}-dev = ""
-
-PACKAGES =+ "libegl-mesa libegl-mesa-dev \
-             libosmesa libosmesa-dev \
-             libgl-mesa libgl-mesa-dev \
-             libdricore libdricore-dev \
-             libglapi libglapi-dev \
-             libgbm libgbm-dev \
-             libgles1-mesa libgles1-mesa-dev \
-             libgles2-mesa libgles2-mesa-dev \
-             libgles3-mesa libgles3-mesa-dev \
-             libwayland-egl libwayland-egl-dev \
-            "
-
-do_install_append () {
-    # GLU is now in libglu (this shouldn't be required in Mesa 9.x)
-    rm -f ${D}${includedir}/GL/glu*
-
-    # Drivers never need libtool .la files
-    rm -f ${D}${libdir}/dri/*.la
-}
-
-# For the packages that make up the OpenGL interfaces, inject variables so that
-# they don't get Debian-renamed (which would remove the -mesa suffix), and
-# RPROVIDEs/RCONFLICTs on the generic libgl name.
-python __anonymous() {
-    for p in (("libegl", "libegl1"), ("libgl", "libgl1"),
-              ("libgles1", "libglesv1-cm1"), ("libgles2", "libglesv2-2"),
-              ("libgles3",)):
-        fullp = p[0] + "-mesa"
-        pkgs = " ".join(p)
-        d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
-        d.appendVar("RREPLACES_" + fullp, pkgs)
-        d.appendVar("RPROVIDES_" + fullp, pkgs)
-        d.appendVar("RCONFLICTS_" + fullp, pkgs)
-        
-        # For -dev, the first element is both the Debian and original name
-        fullp += "-dev"
-        pkgs = p[0] + "-dev"
-        d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
-        d.appendVar("RREPLACES_" + fullp, pkgs)
-        d.appendVar("RPROVIDES_" + fullp, pkgs)
-        d.appendVar("RCONFLICTS_" + fullp, pkgs)
-}
-
-FILES_libdricore = "${sysconfdir}/drirc ${libdir}/libdricore*.so.*"
-FILES_libegl-mesa = "${libdir}/libEGL.so.*"
-FILES_libgbm = "${libdir}/libgbm.so.*"
-FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
-FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
-FILES_libgl-mesa = "${libdir}/libGL.so.*"
-FILES_libglapi = "${libdir}/libglapi.so.*"
-FILES_libosmesa = "${libdir}/libOSMesa.so.*"
-FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
-
-FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
-FILES_libdricore-dev = "${libdir}/libdricore*.*"
-FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
-FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
-FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES_libglapi-dev = "${libdir}/libglapi.*"
-FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
-FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
-FILES_libgles3-mesa-dev = "${includedir}/GLES3"
-FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
-FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
-
-FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index a692bb7..3f00237 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -1,5 +1,35 @@
-DEPENDS += "libdrm expat udev"
-X11_DEPS += "dri2proto"
+SUMMARY = "A free implementation of the OpenGL API"
+DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
+a system for rendering interactive 3D graphics.  \
+A variety of device drivers allows Mesa to be used in many different environments \
+ranging from software emulation to complete hardware acceleration for modern GPUs. \
+Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
+environment."
+
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "MIT"
+
+INC_PR = "r9"
+PE = "2"
+
+DEPENDS = "expat makedepend-native flex-native bison-native libdrm expat udev"
+
+PROVIDES = "virtual/libgl virtual/libgles1 virtual/libgles2 virtual/egl"
+
+inherit autotools pkgconfig pythonnative
+
+EXTRA_OECONF = "--enable-shared-glapi"
+
+PACKAGECONFIG ??= "egl gles \
+		${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)}\
+		${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}\
+		"
+
+X11_DEPS = "xf86driproto glproto virtual/libx11 libxext libxxf86vm libxdamage libxfixes dri2proto"
+PACKAGECONFIG[x11] = "--enable-glx-tls,--disable-glx,${X11_DEPS}"
+PACKAGECONFIG[wayland] = ",,wayland"
 
 DRIDRIVERS = "swrast"
 DRIDRIVERS_append_x86 = ",radeon,r200,nouveau,i965,i915"
@@ -16,9 +46,58 @@ EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'x11', ',x11', '', d)}"
 EGL_PLATFORMS .="${@base_contains('DISTRO_FEATURES', 'wayland', ',wayland', '', d)}"
 PACKAGECONFIG[egl] = "--enable-egl --with-egl-platforms=${EGL_PLATFORMS}, --disable-egl"
 
+# Multiple virtual/gl providers being built breaks staging
+EXCLUDE_FROM_WORLD = "1"
+
+# Remove the mesa dependency on mesa-dev, as mesa is empty
+RDEPENDS_${PN}-dev = ""
+
+PACKAGES =+ "libegl-mesa libegl-mesa-dev \
+             libosmesa libosmesa-dev \
+             libgl-mesa libgl-mesa-dev \
+             libdricore libdricore-dev \
+             libglapi libglapi-dev \
+             libgbm libgbm-dev \
+             libgles1-mesa libgles1-mesa-dev \
+             libgles2-mesa libgles2-mesa-dev \
+             libgles3-mesa libgles3-mesa-dev \
+             libwayland-egl libwayland-egl-dev \
+            "
+
+do_install_append () {
+    # GLU is now in libglu (this shouldn't be required in Mesa 9.x)
+    rm -f ${D}${includedir}/GL/glu*
+
+    # Drivers never need libtool .la files
+    rm -f ${D}${libdir}/dri/*.la
+}
+
+# For the packages that make up the OpenGL interfaces, inject variables so that
+# they don't get Debian-renamed (which would remove the -mesa suffix), and
+# RPROVIDEs/RCONFLICTs on the generic libgl name.
+python __anonymous() {
+    for p in (("libegl", "libegl1"), ("libgl", "libgl1"),
+              ("libgles1", "libglesv1-cm1"), ("libgles2", "libglesv2-2"),
+              ("libgles3",)):
+        fullp = p[0] + "-mesa"
+        pkgs = " ".join(p)
+        d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
+        d.appendVar("RREPLACES_" + fullp, pkgs)
+        d.appendVar("RPROVIDES_" + fullp, pkgs)
+        d.appendVar("RCONFLICTS_" + fullp, pkgs)
+        
+        # For -dev, the first element is both the Debian and original name
+        fullp += "-dev"
+        pkgs = p[0] + "-dev"
+        d.setVar("DEBIAN_NOAUTONAME_" + fullp, "1")
+        d.appendVar("RREPLACES_" + fullp, pkgs)
+        d.appendVar("RPROVIDES_" + fullp, pkgs)
+        d.appendVar("RCONFLICTS_" + fullp, pkgs)
+}
+
 python populate_packages_prepend() {
     dri_drivers_root = os.path.join(d.getVar('libdir', True), "dri")
-    
+
     pkgs = ['mesa', 'mesa-dev', 'mesa-dbg']
     pkgs += do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-driver-%s', 'Mesa %s DRI driver', extra_depends='')
     for pkg in pkgs:
@@ -31,3 +110,26 @@ PACKAGES_DYNAMIC += "^mesa-driver-.*"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
 
+FILES_libdricore = "${sysconfdir}/drirc ${libdir}/libdricore*.so.*"
+FILES_libegl-mesa = "${libdir}/libEGL.so.*"
+FILES_libgbm = "${libdir}/libgbm.so.*"
+FILES_libgles1-mesa = "${libdir}/libGLESv1*.so.*"
+FILES_libgles2-mesa = "${libdir}/libGLESv2.so.*"
+FILES_libgl-mesa = "${libdir}/libGL.so.*"
+FILES_libglapi = "${libdir}/libglapi.so.*"
+FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+FILES_libwayland-egl = "${libdir}/libwayland-egl.so.*"
+
+FILES_${PN}-dev = "${libdir}/pkgconfig/dri.pc"
+FILES_libdricore-dev = "${libdir}/libdricore*.*"
+FILES_libegl-mesa-dev = "${libdir}/libEGL.* ${includedir}/EGL ${includedir}/KHR ${libdir}/pkgconfig/egl.pc"
+FILES_libgbm-dev = "${libdir}/libgbm.* ${libdir}/pkgconfig/gbm.pc ${includedir}/gbm.h"
+FILES_libgl-mesa-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
+FILES_libglapi-dev = "${libdir}/libglapi.*"
+FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
+FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
+FILES_libgles3-mesa-dev = "${includedir}/GLES3"
+FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
+FILES_libwayland-egl-dev = "${libdir}/pkgconfig/wayland-egl.pc ${libdir}/libwayland-egl.*"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
diff --git a/meta/recipes-graphics/mesa/mesa_9.1.3.bb b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
index 60a90a3..74d467a 100644
--- a/meta/recipes-graphics/mesa/mesa_9.1.3.bb
+++ b/meta/recipes-graphics/mesa/mesa_9.1.3.bb
@@ -10,5 +10,4 @@ LIC_FILES_CHKSUM = "file://docs/license.html;md5=42d77d95cba529a3637129be87d6555
 
 S = "${WORKDIR}/Mesa-${PV}"
 
-require mesa-common.inc
 require mesa.inc
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 6a4bc38..241261c 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -1,4 +1,3 @@
-require mesa-common.inc
 require mesa-git.inc
 require mesa.inc
 
-- 
1.8.2.1


