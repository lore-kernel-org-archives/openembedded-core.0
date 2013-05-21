Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5C2296969F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 11:04:23 +0000 (UTC)
Received: from i7-990x.r-finger.com
	(host86-137-102-112.range86-137.btcentralplus.com [86.137.102.112])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 27EDB9530
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 May 2013 12:04:24 +0100 (BST)
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 May 2013 12:04:13 +0100
Message-Id: <1369134259-12091-3-git-send-email-tf+lists.yocto@r-finger.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
References: <1368789942-7476-1-git-send-email-tf+lists.yocto@r-finger.com>
	<1369134259-12091-1-git-send-email-tf+lists.yocto@r-finger.com>
Subject: [PATCH v3 2/8] New cogl recipe (1.14.0)
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
X-List-Received-Date: Tue, 21 May 2013 11:04:23 -0000

From: Tomas Frydrych <tomas@sleepfive.com>

The package has been renamed to cogl-1.0 instead of cogl-vmajor.vminor, keeping
up with the upstream versioning policy (e.g., all 1.x packages install cogl-1.0
pc file and headers and are backward compatible), and to simplify dependency
management (worth noting that since the 1.x development files are not parallel
installable, it is not possible to use two versions of cogl 1.x at the same
time anyway).

Package configuration is provided via PACKAGECONFIG options as follows:

GL flavour:   'gl' for big GL or 'gles2' for GLES2
              (GLES1 is availabe in cogl, but not supporeted here at present.)

EGL platform: 'egl-null' -- PVR-style null platform
              'egl-kms'  -- kms platform provide by Mesa
              'egl-x11'  -- egl over xlib platform
              (Additional EGL platforms, e.g., Wayland are supported by cogl,
              but not supported here at present.)

GLX:          'glx' for the GLX extension support (implies 'gl')

Default configuration is 'glx'; typical configuration providing 'native' egl
on embedded HW would be 'gles2 egl-null'.

Signed-off-by: Tomas Frydrych <tomas@sleepfive.com>
---
 meta/recipes-graphics/cogl/cogl-1.0.inc       |   50 +++++++++++++++++++++++++
 meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb |    7 ++++
 2 files changed, 57 insertions(+)
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0.inc
 create mode 100644 meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb

diff --git a/meta/recipes-graphics/cogl/cogl-1.0.inc b/meta/recipes-graphics/cogl/cogl-1.0.inc
new file mode 100644
index 0000000..611d8fc
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0.inc
@@ -0,0 +1,50 @@
+DESCRIPTION = "a modern 3D graphics API with associated utility APIs"
+HOMEPAGE = "http://wiki.clutter-project.org/wiki/Cogl"
+LICENSE = "LGPLv2.1+"
+
+inherit clutter
+
+DEPENDS = "pango glib-2.0 gdk-pixbuf"
+PACKAGES =+ "${PN}-examples"
+AUTOTOOLS_AUXDIR = "${S}/build"
+
+# Extra DEPENDS for PACKAGECONFIG
+EDEPENDS_GL    = "virtual/libgl libdrm"
+EDEPENDS_GLES2 = "virtual/libgles2"
+EDEPENDS_KMS   = "libdrm virtual/egl"
+EDEPENDS_EGL   = "virtual/egl"
+EDEPENDS_X11   = "virtual/libx11 libxcomposite libxfixes libxi"
+
+# Extra RDEPENDS for PACKAGECONFIG
+# This has to be explictly listed, because cogl dlopens the backends
+ERDEPENDS_GL    = "libgl"
+ERDEPENDS_GLES2 = "libgles2"
+
+EXTRA_OECONF += "--disable-introspection	\
+	       	 --enable-examples-install	\
+	       	 --enable-debug		 	\
+	       	 --disable-gles1		\
+	    	"
+
+# GL flavours
+PACKAGECONFIG[gl] = "--enable-gl,--disable-gl,${EDEPENDS_GL},${ERDEPENDS_GL}"
+PACKAGECONFIG[gles2] = "--enable-gles2,,${EDEPENDS_GLES2}, ${ERDEPENDS_GLES2}"
+
+# egl backends
+PACKAGECONFIG[egl-kms] = "--enable-kms-egl-platform,--disable-kms-egl-platform,${EDEPENDS_KMS}"
+PACKAGECONFIG[egl-null] = "--enable-null-egl-platform,--disable-null-egl-platform"
+PACKAGECONFIG[egl-x11] = "--enable-xlib-egl-platform,--disable-xlib-egl-platform,${EDEPENDS_X11}"
+
+# glx
+PACKAGECONFIG[glx] = "--enable-glx,--disable-glx, ${EDEPENDS_X11}"
+
+# Default to GLX
+PACKAGECONFIG ??= "gl glx"
+
+#Fix up some weirdness in the docs
+do_configure_prepend() {
+        sed -i s:doc/reference/Makefile::g ${S}/configure.ac
+        sed -i s:doc::g ${S}/Makefile.am
+}
+
+FILES_${PN}-examples = "${bindir}/* ${datadir}/cogl/examples-data/*"
diff --git a/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb b/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
new file mode 100644
index 0000000..0f40c59
--- /dev/null
+++ b/meta/recipes-graphics/cogl/cogl-1.0_1.14.0.bb
@@ -0,0 +1,7 @@
+
+require cogl-1.0.inc
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c"
+
+SRC_URI[archive.md5sum] = "7eabaf4241c0b87cc9e3b0fa23fd0315"
+SRC_URI[archive.sha256sum] = "276e8c9f5ff0fcd57c1eaf74cc245f41ad469a95a18ac831fac2d5960baa5ae8"
-- 
1.7.10.4


