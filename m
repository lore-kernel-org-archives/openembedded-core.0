Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1R9XcB-0005dc-2A
	for openembedded-core@lists.openembedded.org;
	Fri, 30 Sep 2011 09:34:35 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so1506871bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2011 00:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=ME/Y4ovV3+EW4QRuttm0rHNT9xeY8GdEhCLKPkDt+zM=;
	b=jH/fmaxY6D/zRF0V+nYLr7qe5zvMpmzws47/oEfD9qfPTOL57+NSOo7vGnxHnQa8dG
	sh2kKWP8OHHBRTp+Bnij+AFaoDQgvi6qJply1IjAQAH1srqjdYMaguxcqK3+xyNdPkD+
	9QJ+Rok9E09NJQmR6NzDUBOaPF1bAic882gMk=
Received: by 10.204.155.90 with SMTP id r26mr4586692bkw.391.1317367748765;
	Fri, 30 Sep 2011 00:29:08 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s13sm3923458bkb.11.2011.09.30.00.29.06
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 30 Sep 2011 00:29:07 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2011 09:27:24 +0200
Message-Id: <f41a6c82d5061f433c35439d29997e395e1c3002.1317367429.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6.1
In-Reply-To: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
References: <06d9f58329265e028db9c5104ecbd7726daa077c.1317367429.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317367429.git.Martin.Jansa@gmail.com>
References: <cover.1317367429.git.Martin.Jansa@gmail.com>
Subject: [PATCH 13/13] mesa: upgrade to 7.11
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
X-List-Received-Date: Fri, 30 Sep 2011 07:34:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-7.11.inc           |   15 ++++++
 meta/recipes-graphics/mesa/mesa-common.inc         |   48 +++++++++++++-------
 .../mesa/mesa-dri-glsl-native_7.11.bb              |   28 +++++++++++
 .../mesa/mesa-dri-glsl-native_7.8.2.bb             |   27 -----------
 meta/recipes-graphics/mesa/mesa-dri.inc            |   27 +++++++++++
 meta/recipes-graphics/mesa/mesa-dri_7.11.bb        |    3 +
 meta/recipes-graphics/mesa/mesa-xlib.inc           |    5 ++
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb       |    4 ++
 .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
 meta/recipes-graphics/mesa/mesa_7.11.bb            |    6 +++
 10 files changed, 120 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-7.11.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
 delete mode 100644 meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri_7.11.bb
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)
 create mode 100644 meta/recipes-graphics/mesa/mesa_7.11.bb

diff --git a/meta/recipes-graphics/mesa/mesa-7.11.inc b/meta/recipes-graphics/mesa/mesa-7.11.inc
new file mode 100644
index 0000000..98b888f
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-7.11.inc
@@ -0,0 +1,15 @@
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2 \
+           file://uclibc.patch \
+          "
+
+DEPENDS += "mesa-dri-glsl-native"
+
+SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
+SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+
+do_configure_prepend() {
+  #check for python not python2, because python-native does not stage python2 binary/link
+  sed -i 's/AC_CHECK_PROGS(\[PYTHON2\], \[python2 python\])/AC_CHECK_PROGS(\[PYTHON2\], \[python python\])/g' ${S}/configure.ac
+  # We need builtin_compiler built for buildhost arch instead of target (is provided by mesa-dri-glsl-native)"
+  sed -i "s#\./builtin_compiler#${STAGING_BINDIR_NATIVE}/glsl/builtin_compiler#g" ${S}/src/glsl/Makefile
+}
diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index d8e800e..b4786d0 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -1,34 +1,50 @@
-SUMMARY = "A free implementation of the OpenGL API"
-DESCRIPTION = "Mesa is an open-source implementation of the OpenGL specification - \
-a system for rendering interactive 3D graphics.  \
-A variety of device drivers allows Mesa to be used in many different environments \
-ranging from software emulation to complete hardware acceleration for modern GPUs. \
-Mesa is used as part of the overall Direct Rendering Infrastructure and X.org \
-environment."
+SECTION = "x11"
 
+DESCRIPTION = "An open source implementation of the OpenGL spec"
 HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
+
+INC_PR = "r12"
+PE = "2"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2;name=mesalib \
-           ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaDemos-${PV}.tar.bz2;name=mesademos "
+PROTO_DEPS = "xf86driproto glproto"
+LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
 
+DEPENDS = "makedepend-native ${PROTO_DEPS}  ${LIB_DEPS}"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2;name=archive \
+          "
 S = "${WORKDIR}/Mesa-${PV}"
 
 PROVIDES = "virtual/libgl"
 
+FILESEXTRAPATHS_append := "${THISDIR}/mesa:"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls"
+	       "
 
-# Multiple virtual/gl providers being built breaks staging
-EXCLUDE_FROM_WORLD = "1"
-
-PACKAGES =+ "libglu libglu-dev"
+inherit glx-use-tls
 
+PACKAGES =+ "libegl libegl-dev libegl-dbg libglu libglu-dev libosmesa libosmesa-dev libgl libgl-dev"
+FILES_libegl = "${libdir}/libEGL.so.* ${libdir}/egl/*.so"
+FILES_libgl = "${libdir}/libGL.so.*"
 FILES_libglu = "${libdir}/libGLU.so.*"
+FILES_libosmesa = "${libdir}/libOSMesa.so.*"
+
+FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
+FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL"
 FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
+FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+FILES_libegl-dbg += "${libdir}/egl/.debug/*"
+
+do_install_append () {
+    install -d ${D}/${includedir}/GL
+    cp -pPr ${S}/include/GL/internal* ${D}/${includedir}/GL
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
new file mode 100644
index 0000000..f1987fd
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.11.bb
@@ -0,0 +1,28 @@
+DESCRIPTION = "gl shader language specific build from mesa-dri"
+HOMEPAGE = "http://mesa3d.org"
+BUGTRACKER = "https://bugs.freedesktop.org"
+SECTION = "x11"
+LICENSE = "GPLv3+"
+LIC_FILES_CHKSUM = "file://glsl_parser.cpp;beginline=3;endline=33;md5=d078f1cddc2fc355719c090482254bd9"
+
+DEPENDS = "makedepend-native"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
+
+SRC_URI[md5sum] = "ff03aca82d0560009a076a87c888cf13"
+SRC_URI[sha256sum] = "f8bf37a00882840a3e3d327576bc26a79ae7f4e18fe1f7d5f17a5b1c80dd7acf"
+
+S = "${WORKDIR}/Mesa-${PV}/src/glsl/"
+
+inherit native
+
+# use default config for native build
+do_configure_prepend() {
+	ln -s ${S}/../../configs/default ${S}/../../configs/current
+}
+
+do_install() {
+	install -d ${D}/${bindir}/glsl
+	install -m 755 ${S}/builtin_compiler ${D}/${bindir}/glsl/builtin_compiler
+	install -m 755 ${S}/glsl_compiler ${D}/${bindir}/glsl/glsl_compiler
+}
diff --git a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb b/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
deleted file mode 100644
index d6f2c33..0000000
--- a/meta/recipes-graphics/mesa/mesa-dri-glsl-native_7.8.2.bb
+++ /dev/null
@@ -1,27 +0,0 @@
-DESCRIPTION = "gl shader language specific build from mesa-dri"
-HOMEPAGE = "http://mesa3d.org"
-BUGTRACKER = "https://bugs.freedesktop.org"
-SECTION = "x11"
-LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://apps/compile.c;endline=26;md5=27c2833286ce9566b162bcbe21d5b267"
-PR = "r0"
-
-DEPENDS = "makedepend-native"
-
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
-SRC_URI[md5sum] = "6be2d343a0089bfd395ce02aaf8adb57"
-SRC_URI[sha256sum] = "505bf418dceba05837f4ea1b1972b9620c35f8cb94bc4d1e6d573c15f562576d"
-
-S = "${WORKDIR}/Mesa-7.8.2/src/glsl/"
-
-inherit native
-
-# use default config for native build
-do_configure_prepend() {
-	ln -s ${S}/../../configs/default ${S}/../../configs/current
-}
-
-do_install() {
-	install -d ${D}/${bindir}
-	install -m 755 ${S}/apps/compile ${D}/${bindir}/glsl-compile
-}
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
new file mode 100644
index 0000000..8aa82c0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -0,0 +1,27 @@
+DEPENDS += "dri2proto expat libdrm"
+
+#not supported in oe-core base.bbclass
+#FILESPATHPKG =. "mesa-${PV}:mesa:"
+FILESPATH =. "${FILE_DIRNAME}/mesa:${FILE_DIRNAME}/mesa-${PV}:"
+
+# most of our targets do not have DRI so will use mesa-xlib
+DEFAULT_PREFERENCE = "-1"
+
+MACHINE_DRI_MODULES ?= ""
+#PACKAGE_ARCH = "${@['${MACHINE_ARCH}','${BASE_PACKAGE_ARCH}'][bb.data.getVar('MACHINE_DRI_MODULES',d,1) == '']}"
+PACKAGE_ARCH = "${MACHINE_ARCH}"
+
+EXTRA_OECONF += "--with-driver=dri --disable-egl --disable-gallium -with-dri-drivers=swrast,${MACHINE_DRI_MODULES}"
+
+python populate_packages_prepend() {
+	import os.path
+
+	dri_drivers_root = os.path.join(bb.data.getVar('libdir', d, 1), "dri")
+
+	do_split_packages(d, dri_drivers_root, '^(.*)_dri\.so$', 'mesa-dri-driver-%s', 'Mesa %s DRI driver', extra_depends='')
+}
+
+PACKAGES_DYNAMIC = "mesa-dri-driver-*"
+
+FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
+
diff --git a/meta/recipes-graphics/mesa/mesa-dri_7.11.bb b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
new file mode 100644
index 0000000..0712bf5
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri_7.11.bb
@@ -0,0 +1,3 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-dri.inc
diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
new file mode 100644
index 0000000..cc4a9c0
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
@@ -0,0 +1,5 @@
+#not supported in oe-core base.bbclass
+#FILESPATHPKG =. "mesa-${PV}:mesa:"
+FILESPATH =. "${FILE_DIRNAME}/mesa:${FILE_DIRNAME}/mesa-${PV}:"
+
+EXTRA_OECONF += " --with-driver=xlib"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
new file mode 100644
index 0000000..93bb8cd
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -0,0 +1,4 @@
+require mesa-common.inc
+require mesa-${PV}.inc
+require mesa-xlib.inc
+PR = "${INC_PR}.0"
diff --git a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch b/meta/recipes-graphics/mesa/mesa/uclibc.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
rename to meta/recipes-graphics/mesa/mesa/uclibc.patch
diff --git a/meta/recipes-graphics/mesa/mesa_7.11.bb b/meta/recipes-graphics/mesa/mesa_7.11.bb
new file mode 100644
index 0000000..4cb8db7
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa_7.11.bb
@@ -0,0 +1,6 @@
+# This is a dummy package so OE can use the poky mesa files
+require mesa-dri_${PV}.bb
+
+PR = "${INC_PR}.0"
+
+EXTRA_OECONF += "--disable-egl"
-- 
1.7.6.1



