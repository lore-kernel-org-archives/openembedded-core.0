Received: from ptmx.org ([178.63.28.110])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dv@pseudoterminal.org>) id 1UNTbJ-0004y1-5R
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 21:44:05 +0200
Received: from localhost.localdomain (chello080108009040.14.11.vie.surfer.at
	[80.108.9.40]) by ptmx.org (Postfix) with ESMTPSA id 88D332130F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2013 21:26:55 +0200 (CEST)
From: Carlos Rafael Giani <dv@pseudoterminal.org>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Apr 2013 21:26:51 +0200
Message-Id: <1365017211-17183-1-git-send-email-dv@pseudoterminal.org>
X-Mailer: git-send-email 1.8.2
Subject: [oe][PATCH] eglinfo: Add recipes for x11 and fb backends
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
X-List-Received-Date: Wed, 03 Apr 2013 19:44:05 -0000

eglinfo is a small utility for printing out information about EGL as well
as about its client APIs, OpenGL / OpenGLES 1.x / OpenGLES 2.x / OpenVG.

Signed-off-by: Carlos Rafael Giani <dv@pseudoterminal.org>
---
 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb  | 11 ++++++
 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb |  6 +++
 meta/recipes-graphics/eglinfo/eglinfo.inc        | 49 ++++++++++++++++++++++++
 3 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
 create mode 100644 meta/recipes-graphics/eglinfo/eglinfo.inc

diff --git a/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
new file mode 100644
index 0000000..65b265f
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo-fb_1.0.bb
@@ -0,0 +1,11 @@
+EGLINFO_PLATFORM ?= "fb"
+EGLINFO_BINARY_NAME ?= "eglinfo-fb"
+
+# .bbappend files in BSP meta layers can add EGLINFO_DEVICE
+# values if necessary. eglinfo.inc contains default values for
+# the currently supported devices.
+# Consult the eglinfo README.md for details
+
+include eglinfo.inc
+
+SUMMARY += "(Framebuffer version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
new file mode 100644
index 0000000..8793a25
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo-x11_1.0.bb
@@ -0,0 +1,6 @@
+EGLINFO_PLATFORM ?= "x11"
+EGLINFO_BINARY_NAME ?= "eglinfo-x11"
+
+include eglinfo.inc
+
+SUMMARY += "(X11 version)"
diff --git a/meta/recipes-graphics/eglinfo/eglinfo.inc b/meta/recipes-graphics/eglinfo/eglinfo.inc
new file mode 100644
index 0000000..116435d
--- /dev/null
+++ b/meta/recipes-graphics/eglinfo/eglinfo.inc
@@ -0,0 +1,49 @@
+SUMMARY = "Utility for printing information EGL and its client APIs (OpenGL, OpenGL ES, OpenVG)"
+SECTION = "graphics"
+LICENSE = "Zlib"
+HOMEPAGE = "https://github.com/dv1/eglinfo"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=8d4f33bc3add976f7dfae85dab66f03c"
+
+DEPENDS = "virtual/egl"
+
+SRC_URI = "git://github.com/dv1/eglinfo.git;branch=master"
+SRCREV = "4a49ff59545d9b6a8222badab64115f89d3a6774"
+
+S = "${WORKDIR}/git"
+
+
+# BSP layers should add .bbappend files for the -x11 and -fb .bb recipes,
+# which append the respective EGL/OpenGLES/OpenVG libraries to DEPENDS
+# not doing that here, since some platforms might not have OpenGL ES or OpenVG support
+# (in that case, the eglinfo build scripts automatically disable the relevant code paths)
+
+EGLINFO_DEVICE ?= "generic"
+EGLINFO_DEVICE_raspberrypi ?= "raspberrypi"
+EGLINFO_DEVICE_beagleboard ?= "beagleboard"
+EGLINFO_DEVICE_mx6 ?= "imx6"
+
+
+do_clean() {
+	if [ -x ${S}/waf ]; then
+		${S}/waf distclean
+	fi
+}
+
+do_configure() {
+	${S}/waf configure \
+		--platform=${EGLINFO_PLATFORM} \
+		--device=${EGLINFO_DEVICE} \
+		--sysroot ${STAGING_DIR_TARGET} \
+		--prefix=${prefix} \
+		${EXTRA_OECONF}
+}
+
+do_compile() {
+	${S}/waf
+}
+
+do_install() {
+	mkdir -p "${D}/${bindir}"
+	mv "${S}/build/release/eglinfo" "${D}/${bindir}/${EGLINFO_BINARY_NAME}"
+}
+
-- 
1.8.2



