Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAiif-0005A2-N6
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:38:09 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=YYXo6gNTJ5aUhrEBUQYDKEmheXOshXh+B1P4pOF2mnI=;
	b=LQNNeU1DBCljrj6rZg09Q1XNZmBIfdJGIODcWcca1/mmR7jU7muevGe7HRE5O7FnJl
	b/U0ZkfcA0wm0plx4LJlMTRdEACq8Ipx49EoyD6GY7sF9EDU7GJB7wijjcrXGxNWYLm/
	A6gfL2MK1ygtr1KLt9PD0RUGAhny7S7JgJoA4=
Received: by 10.204.128.88 with SMTP id j24mr9945499bks.74.1317648759655;
	Mon, 03 Oct 2011 06:32:39 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id v16sm13237837bkd.6.2011.10.03.06.32.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:32:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:58 +0200
Message-Id: <d41c6bc0c59bcad90400961ae0173c0d652a019d.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 27/30] mesa: add mesa-dri.inc and mesa-xlib.inc with shared options, move uclibc.patch
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
X-List-Received-Date: Mon, 03 Oct 2011 13:44:17 -0000

* uclibc patch does apply to all mesa versions and adding mesa-dri to
  FILESPATH in all recipes is worse then adding mesa

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc         |   36 +++++++++++++++++---
 meta/recipes-graphics/mesa/mesa-dri.inc            |   22 ++++++++++++
 meta/recipes-graphics/mesa/mesa-xlib.inc           |    1 +
 .../mesa/{mesa-dri => mesa}/uclibc.patch           |    0
 4 files changed, 54 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-dri.inc
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc
 rename meta/recipes-graphics/mesa/{mesa-dri => mesa}/uclibc.patch (100%)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index d8e800e..595597f 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -10,25 +10,51 @@ HOMEPAGE = "http://mesa3d.org"
 BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2;name=mesalib \
-           ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaDemos-${PV}.tar.bz2;name=mesademos "
+INC_PR = "r12"
+PE = "2"
 
+PROTO_DEPS = "xf86driproto glproto"
+LIB_DEPS = "virtual/libx11 libxext libxxf86vm libxdamage libxfixes"
+
+DEPENDS = "makedepend-native ${PROTO_DEPS}  ${LIB_DEPS}"
+
+SRC_URI = "ftp://ftp.freedesktop.org/pub/mesa/${PV}/MesaLib-${PV}.tar.bz2"
 S = "${WORKDIR}/Mesa-${PV}"
 
 PROVIDES = "virtual/libgl"
 
+# for mesa-dri and mesa-xlib
+FILESEXTRAPATHS_append := "${THISDIR}/mesa:${THISDIR}/mesa-${PV}:"
+
 inherit autotools pkgconfig
 
 EXTRA_OECONF = "--enable-glu \
                 --disable-glw \
                 --disable-glut \
-                --enable-glx-tls"
+               "
+
+inherit glx-use-tls
 
 # Multiple virtual/gl providers being built breaks staging
 EXCLUDE_FROM_WORLD = "1"
 
-PACKAGES =+ "libglu libglu-dev"
-
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
diff --git a/meta/recipes-graphics/mesa/mesa-dri.inc b/meta/recipes-graphics/mesa/mesa-dri.inc
new file mode 100644
index 0000000..ce98228
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-dri.inc
@@ -0,0 +1,22 @@
+DEPENDS += "dri2proto expat libdrm"
+
+# most of our targets do not have DRI so will use mesa-xlib
+DEFAULT_PREFERENCE = "-1"
+
+MACHINE_DRI_MODULES ?= ""
+PACKAGE_ARCH = "${@['${MACHINE_ARCH}','${TUNE_PKGARCH}'][bb.data.getVar('MACHINE_DRI_MODULES',d,1) == '']}"
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
diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
new file mode 100644
index 0000000..44e5dc6
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
@@ -0,0 +1 @@
+EXTRA_OECONF += " --with-driver=xlib"
diff --git a/meta/recipes-graphics/mesa/mesa-dri/uclibc.patch b/meta/recipes-graphics/mesa/mesa/uclibc.patch
similarity index 100%
rename from meta/recipes-graphics/mesa/mesa-dri/uclibc.patch
rename to meta/recipes-graphics/mesa/mesa/uclibc.patch
-- 
1.7.7



