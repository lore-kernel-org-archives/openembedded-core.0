Return-Path: <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
Received: from mailhost.eurogiciel.fr (mailhost.eurogiciel.fr [86.64.47.76])
	by mail.openembedded.org (Postfix) with ESMTP id 90B496CA51
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Sep 2013 15:03:43 +0000 (UTC)
Received: from (unknown [172.16.88.4]) by mailhost.eurogiciel.fr with smtp
	id 6a23_8a4e_60a7fd74_252b_11e3_81eb_a4badbe01a3a;
	Tue, 24 Sep 2013 17:09:57 +0200
Received: from 06s-venera.eurogiciel.fr ([172.16.92.15]) by
	31l-syracuse.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Sep 2013 17:03:43 +0200
Received: from 44c-mariner.eurogiciel.fr ([172.16.96.15]) by
	06s-venera.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959); 
	Tue, 24 Sep 2013 17:03:42 +0200
Received: from linux-7s87.rennes ([172.16.100.253]) by
	44c-mariner.eurogiciel.fr with Microsoft SMTPSVC(6.0.3790.3959);
	Tue, 24 Sep 2013 17:03:41 +0200
From: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 Sep 2013 17:01:54 +0200
Message-Id: <1380034914-3792-2-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-Mailer: git-send-email 1.8.1.4
In-Reply-To: <1380034914-3792-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
References: <1380034914-3792-1-git-send-email-Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
X-OriginalArrivalTime: 24 Sep 2013 15:03:41.0170 (UTC)
	FILETIME=[41637520:01CEB937]
Subject: [PATCH v2 2/2] weston : Add weston 1.2.0 bb file
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
X-List-Received-Date: Tue, 24 Sep 2013 15:03:44 -0000

Signed-off-by: Ewan LE BIDEAU-CANEVET <Ewan.LEBIDEAU-CANEVET@eurogiciel.fr>
---
 meta/recipes-graphics/wayland/weston_1.2.0.bb | 79 +++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 meta/recipes-graphics/wayland/weston_1.2.0.bb

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


