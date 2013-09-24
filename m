Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from mailhost.eurogiciel.fr (mailhost.eurogiciel.fr [86.64.47.76])
	by mail.openembedded.org (Postfix) with ESMTP id BD341601D6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 08:58:44 +0000 (UTC)
Received: from (unknown [172.16.88.4]) by mailhost.eurogiciel.fr with smtp
	id 6a23_35fd_61c37932_24f8_11e3_81eb_a4badbe01a3a;
	Tue, 24 Sep 2013 11:04:55 +0200
Received: from 06s-venera.eurogiciel.fr ([172.16.92.15]) by
	31l-syracuse.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Sep 2013 10:58:42 +0200
Received: from 44c-mariner.eurogiciel.fr ([172.16.96.15]) by
	06s-venera.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Sep 2013 10:58:42 +0200
Received: from linux-7s87.rennes ([172.16.100.253]) by
	44c-mariner.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959);
	Tue, 24 Sep 2013 10:58:41 +0200
From: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 10:57:14 +0200
Message-Id: <1380013034-2681-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-Mailer: git-send-email 1.8.1.4
X-OriginalArrivalTime: 24 Sep 2013 08:58:41.0277 (UTC)
	FILETIME=[4408FAD0:01CEB904]
Subject: [PATCH] wayland/weston: bump to 1.2.0 version
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
X-List-Received-Date: Tue, 24 Sep 2013 08:58:46 -0000

add bitbake files for wayland and weston 1.2.0

Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
---
 meta/recipes-graphics/wayland/wayland_1.2.0.bb | 25 ++++++++
 meta/recipes-graphics/wayland/weston_1.2.0.bb  | 79 ++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/wayland_1.2.0.bb
 create mode 100644 meta/recipes-graphics/wayland/weston_1.2.0.bb

diff --git a/meta/recipes-graphics/wayland/wayland_1.2.0.bb b/meta/recipes-graphics/wayland/wayland_1.2.0.bb
new file mode 100644
index 0000000..f001b43
--- /dev/null
+++ b/meta/recipes-graphics/wayland/wayland_1.2.0.bb
@@ -0,0 +1,25 @@
+SUMMARY = "Wayland, a protocol between a compositor and clients"
+DESCRIPTION = "Wayland is a protocol for a compositor to talk to its clients \
+as well as a C library implementation of that protocol. The compositor can be \
+a standalone display server running on Linux kernel modesetting and evdev \
+input devices, an X application, or a wayland client itself. The clients can \
+be traditional applications, X servers (rootless or fullscreen) or other \
+display servers."
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=1d4476a7d98dd5691c53d4d43a510c72 \
+                    file://src/wayland-server.c;endline=21;md5=079ae21dbf98ada52ec23744851b0a5c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "48d375afb15f3e68a72cf7b4fd8f4a63"
+SRC_URI[sha256sum] = "6b0439a017185bc5b2fed96c178bed3abf7f19188f3078f4d69fd3ce222d654c"
+inherit autotools pkgconfig
+
+# We need wayland-native for the wayland-scanner utility
+BBCLASSEXTEND = "native"
+
+DEPENDS_virtclass-native = "expat-native libffi-native"
+DEPENDS = "expat libffi wayland-native"
+
+EXTRA_OECONF_virtclass-native = "--disable-documentation"
+EXTRA_OECONF = "--disable-documentation --disable-scanner"
diff --git a/meta/recipes-graphics/wayland/weston_1.2.0.bb b/meta/recipes-graphics/wayland/weston_1.2.0.bb
new file mode 100644
index 0000000..d320f88
--- /dev/null
+++ b/meta/recipes-graphics/wayland/weston_1.2.0.bb
@@ -0,0 +1,79 @@
+SUMMARY = "Weston, a Wayland compositor"
+DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
+HOMEPAGE = "http://wayland.freedesktop.org"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
+                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
+
+SRC_URI = "http://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
+           file://install-examples.patch \
+           file://weston.png \
+           file://weston.desktop"
+SRC_URI[md5sum] = "86f8c9e865923e138ce44ee41d951500"
+SRC_URI[sha256sum] = "122e12ae8e4ec4618780465c0cc31d70d67054900a2aac458f82ed6eb5d397b7"
+
+
+inherit autotools pkgconfig useradd
+
+DEPENDS = "libxkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg"
+DEPENDS += "wayland mesa virtual/egl pango"
+BBCLASSEXTEND = "native"
+EXTRA_OECONF = "--disable-android-compositor \
+                --enable-setuid-install \
+                --disable-tablet-shell \
+                --disable-xwayland \
+                --enable-simple-clients \
+                --enable-clients \
+                --disable-simple-egl-clients \
+                --disable-libunwind \
+                --disable-rpi-compositor \
+                --disable-rdp-compositor"
+
+
+PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
+                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
+                  "
+#
+# Compositor choices
+#
+# Weston on KMS
+PACKAGECONFIG[kms] = "--enable-drm-compositor --enable-weston-launch,--disable-drm-compositor --disable-weston-launch,drm udev mesa mtdev libpam"
+# Weston on Wayland (nested Weston)
+PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,mesa"
+# Weston on X11
+PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
+# Headless Weston
+PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
+# Weston on framebuffer
+PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
+
+# Use cairo-gl or cairo-glesv2
+PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
+
+do_install_append() {
+	# Weston doesn't need the .la files to load modules, so wipe them
+	rm -f ${D}/${libdir}/weston/*.la
+
+	for feature in ${DISTRO_FEATURES}; do
+		# If X11, ship a desktop file to launch it
+		if [ "$feature" = "x11" ]; then
+			install -d ${D}${datadir}/applications
+			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
+
+			install -d ${D}${datadir}/icons/hicolor/48x48/apps
+			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
+                fi
+	done
+}
+
+PACKAGES += "${PN}-examples"
+
+FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir}"
+FILES_${PN}-examples = "${bindir}/*"
+
+RDEPENDS_${PN} += "xkeyboard-config"
+RRECOMMENDS_${PN} = "liberation-fonts"
+
+USERADD_PACKAGES = "${PN}"
+GROUPADD_PARAM_${PN} = "--system weston-launch"
-- 
1.8.1.4


