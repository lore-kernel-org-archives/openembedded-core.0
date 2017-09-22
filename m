Return-Path: <fabien.lahoudere@collabora.co.uk>
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	by mail.openembedded.org (Postfix) with ESMTP id 876BA783B1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Sep 2017 11:02:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: aragua) with ESMTPSA id 7C888260BA6
From: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Sep 2017 13:02:42 +0200
Message-Id: <20170922110243.10454-3-fabien.lahoudere@collabora.co.uk>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
References: <20170922110243.10454-1-fabien.lahoudere@collabora.co.uk>
Subject: [PATCH v2 3/4] weston: Bump version to 3.0.0
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
X-List-Received-Date: Fri, 22 Sep 2017 11:02:55 -0000

Signed-off-by: Fabien Lahoudere <fabien.lahoudere@collabora.co.uk>
---
 .../wayland/{weston_2.0.0.bb => weston_3.0.0.bb}         | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-graphics/wayland/{weston_2.0.0.bb => weston_3.0.0.bb} (89%)

diff --git a/meta/recipes-graphics/wayland/weston_2.0.0.bb b/meta/recipes-graphics/wayland/weston_3.0.0.bb
similarity index 89%
rename from meta/recipes-graphics/wayland/weston_2.0.0.bb
rename to meta/recipes-graphics/wayland/weston_3.0.0.bb
index 54b07bd6b9..6b3fad7b83 100644
--- a/meta/recipes-graphics/wayland/weston_2.0.0.bb
+++ b/meta/recipes-graphics/wayland/weston_3.0.0.bb
@@ -9,12 +9,11 @@ SRC_URI = "https://wayland.freedesktop.org/releases/${BPN}-${PV}.tar.xz \
            file://weston.png \
            file://weston.desktop \
            file://0001-make-error-portable.patch \
-           file://0001-configure.ac-Fix-wayland-protocols-path.patch \
            file://xwayland.weston-start \
            file://0001-weston-launch-Provide-a-default-version-that-doesn-t.patch \
 "
-SRC_URI[md5sum] = "15f38945942bf2a91fe2687145fb4c7d"
-SRC_URI[sha256sum] = "b4e446ac27f118196f1609dab89bb3cb3e81652d981414ad860e733b355365d8"
+SRC_URI[md5sum] = "9c42a4c51a1b9f35d040fa9d45ada36d"
+SRC_URI[sha256sum] = "cde1d55e8dd70c3cbb3d1ec72f60e60000041579caa1d6a262bd9c35e93723a5"
 
 inherit autotools pkgconfig useradd distro_features_check
 # depends on virtual/egl
@@ -25,7 +24,6 @@ DEPENDS += "wayland wayland-protocols libinput virtual/egl pango wayland-native"
 
 EXTRA_OECONF = "--enable-setuid-install \
                 --disable-rdp-compositor \
-                WAYLAND_PROTOCOLS_SYSROOT_DIR=${RECIPE_SYSROOT} \
                 "
 EXTRA_OECONF_append_qemux86 = "\
 		WESTON_NATIVE_BACKEND=fbdev-backend.so \
@@ -77,7 +75,7 @@ PACKAGECONFIG[pam] = "--with-pam,--without-pam,libpam"
 
 do_install_append() {
 	# Weston doesn't need the .la files to load modules, so wipe them
-	rm -f ${D}/${libdir}/libweston-2/*.la
+	rm -f ${D}/${libdir}/libweston-3/*.la
 
 	# If X11, ship a desktop file to launch it
 	if [ "${@bb.utils.filter('DISTRO_FEATURES', 'x11', d)}" ]; then
@@ -94,16 +92,16 @@ do_install_append() {
 }
 
 PACKAGES += "${@bb.utils.contains('PACKAGECONFIG', 'xwayland', '${PN}-xwayland', '', d)} \
-             libweston-2 ${PN}-examples"
+             libweston-3 ${PN}-examples"
 
 FILES_${PN} = "${bindir}/weston ${bindir}/weston-terminal ${bindir}/weston-info ${bindir}/weston-launch ${bindir}/wcap-decode ${libexecdir} ${libdir}/${BPN}/*.so ${datadir}"
 
-FILES_libweston-2 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-2/*.so"
-SUMMARY_libweston-2 = "Helper library for implementing 'wayland window managers'."
+FILES_libweston-3 = "${libdir}/lib*${SOLIBS} ${libdir}/libweston-3/*.so"
+SUMMARY_libweston-3 = "Helper library for implementing 'wayland window managers'."
 
 FILES_${PN}-examples = "${bindir}/*"
 
-FILES_${PN}-xwayland = "${libdir}/libweston-2/xwayland.so"
+FILES_${PN}-xwayland = "${libdir}/libweston-3/xwayland.so"
 RDEPENDS_${PN}-xwayland += "xserver-xorg-xwayland"
 
 RDEPENDS_${PN} += "xkeyboard-config"
-- 
2.11.0


