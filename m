Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CC83673D8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68pfp008566
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:51 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:44 -0700
Message-ID: <57bb53bf8de805f27225d4a454b07d6c91cfad32.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 11/12] recipes-sato: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 06:08:49 -0000
Content-Type: text/plain

They can't be built withou x11 in DISTRO_FEATURES.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../matchbox-desktop/matchbox-desktop_git.bb       |    5 ++++-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    5 ++++-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    5 ++++-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |    5 +++++
 .../matchbox-theme-sato/matchbox-theme-sato.inc    |    5 ++++-
 meta/recipes-sato/midori/midori_0.5.8.bb           |    5 ++++-
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    5 ++++-
 meta/recipes-sato/puzzles/puzzles_r10116.bb        |    5 ++++-
 .../sato-screenshot/sato-screenshot_git.bb         |    5 ++++-
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |    5 ++++-
 10 files changed, 41 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
index 29b472a..318d2e0 100644
--- a/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
+++ b/meta/recipes-sato/matchbox-desktop/matchbox-desktop_git.bb
@@ -19,4 +19,7 @@ EXTRA_OECONF = "--enable-startup-notification --with-dbus"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+# The startup-notification requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
index 7a99a9c..0d321d3 100644
--- a/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
+++ b/meta/recipes-sato/matchbox-keyboard/matchbox-keyboard_git.bb
@@ -20,7 +20,10 @@ SRC_URI = "git://git.yoctoproject.org/${BPN};branch=matchbox-keyboard-0-1 \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext gtk-immodules-cache
+inherit autotools pkgconfig gettext gtk-immodules-cache distro_features_check
+
+# The libxft, libfakekey and matchbox-panel-2 requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECONF = "--disable-cairo --enable-gtk-im --enable-applet"
 
diff --git a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
index 490e2bc..4ed7368 100644
--- a/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
+++ b/meta/recipes-sato/matchbox-panel-2/matchbox-panel-2_git.bb
@@ -11,6 +11,9 @@ DEPENDS = "gnome-common gtk+ startup-notification dbus dbus-glib"
 DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "acpi", "libacpi", "",d)}"
 DEPENDS += " ${@bb.utils.contains("MACHINE_FEATURES", "apm", "apmd", "",d)}"
 
+# The startup-notification requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRCREV = "26a3a67b41c50e0ae163d8fe86ccf7a0f0a671ae"
 PV = "2.0+git${SRCPV}"
 
@@ -33,4 +36,4 @@ FILES_${PN} += "${libdir}/matchbox-panel/*.so \
 FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
 FILES_${PN}-dev += "${libdir}/matchbox-panel/*.la"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
diff --git a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
index fe84a0f..76de18a 100644
--- a/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
+++ b/meta/recipes-sato/matchbox-sato/matchbox-session-sato_0.1.bb
@@ -14,6 +14,11 @@ PR = "r30"
 # based on the machine architecture.
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
+inherit distro_features_check
+
+# The matchbox-theme-sato requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "file://session"
 S = "${WORKDIR}"
 
diff --git a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
index b0f8380..d947e1a 100644
--- a/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
+++ b/meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato.inc
@@ -8,6 +8,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=aae86bb34b0a83716ca09f4e783d6ba4"
 DEPENDS = "matchbox-wm"
 SECTION = "x11/wm"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} += "${datadir}/themes"
+
+# The matchbox-wm requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-sato/midori/midori_0.5.8.bb b/meta/recipes-sato/midori/midori_0.5.8.bb
index 3aabdd4..5cc42cb 100644
--- a/meta/recipes-sato/midori/midori_0.5.8.bb
+++ b/meta/recipes-sato/midori/midori_0.5.8.bb
@@ -12,7 +12,10 @@ SRC_URI[sha256sum] = "af19135fd4c4b04345df4d3592e7939c20f9b40eaca24550e6cb619751
 # MIPS64 with n32 ABI. So remove it from mips64 n32 temporarily.
 COMPATIBLE_HOST_mips64n32 = "null"
 
-inherit gtk-icon-cache pkgconfig vala pythonnative cmake
+inherit gtk-icon-cache pkgconfig vala pythonnative cmake distro_features_check
+
+# The webkit-gtk and libxscrnsaver requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OECMAKE = " \
     -DCMAKE_INSTALL_PREFIX=${prefix} \
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
index 14f58ae..6ef0347 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
@@ -23,7 +23,10 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/pcmanfm-${PV}.tar.xz \
 SRC_URI[md5sum] = "c993402d407b0a3fc076f842ac1bc5c9"
 SRC_URI[sha256sum] = "cfa8d82fc63be147045174bef074807e1e32ce8c6bf4dbd8fad49e260bcf6380"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+# The startup-notification requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 do_install_append () {
 	install -d ${D}/${datadir}
diff --git a/meta/recipes-sato/puzzles/puzzles_r10116.bb b/meta/recipes-sato/puzzles/puzzles_r10116.bb
index 3bc2c85..1ad8d1b 100644
--- a/meta/recipes-sato/puzzles/puzzles_r10116.bb
+++ b/meta/recipes-sato/puzzles/puzzles_r10116.bb
@@ -4,6 +4,9 @@ HOMEPAGE = "http://www.chiark.greenend.org.uk/~sgtatham/puzzles/"
 DEPENDS = "gtk+ libxt"
 MOD_PV = "${@d.getVar('PV',1)[1:]}"
 
+# The libxt requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENCE;md5=33bcd4bce8f3c197f2aefbdbd2d299bc"
 
@@ -14,7 +17,7 @@ SRC_URI = "svn://svn.tartarus.org/sgt;module=puzzles;rev=${MOD_PV} \
 
 S = "${WORKDIR}/${BPN}"
 
-inherit autotools-brokensep
+inherit autotools-brokensep distro_features_check
 
 do_configure_prepend () {
     ./mkfiles.pl
diff --git a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
index a079e03..8794032 100644
--- a/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
+++ b/meta/recipes-sato/sato-screenshot/sato-screenshot_git.bb
@@ -16,7 +16,7 @@ SRC_URI = "git://git.yoctoproject.org/screenshot"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 FILES_${PN} += "${libdir}/matchbox-panel/*.so"
 FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
@@ -24,3 +24,6 @@ FILES_${PN}-dbg += "${libdir}/matchbox-panel/.debug"
 do_install_append () {
 	rm ${D}${libdir}/matchbox-panel/*.la
 }
+
+# The matchbox-panel-2 requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
index 3f19c2d..3348702 100644
--- a/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
+++ b/meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
@@ -17,6 +17,9 @@ DEPENDS = "zlib enchant libsoup-2.4 curl libxml2 cairo libxslt libxt libidn gnut
            gtk+ gstreamer gst-plugins-base flex-native gperf-native perl-native-runtime sqlite3 ${ICU_LIB}"
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'virtual/libgl', '', d)}"
 
+# The libxt requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "\
   http://www.webkitgtk.org/releases/webkit-${PV}.tar.xz \
   file://nodolt.patch \
@@ -35,7 +38,7 @@ SRC_URI[sha256sum] = "ada02d636af61aed38f142d3cded662d141ce71264f624c4eb873621a7
 # webkit-gtk can NOT be built on MIPS64 with n32 ABI
 COMPATIBLE_HOST_mips64n32 = "null"
 
-inherit autotools lib_package gtk-doc pkgconfig
+inherit autotools lib_package gtk-doc pkgconfig distro_features_check
 
 S = "${WORKDIR}/webkit-${PV}/"
 
-- 
1.7.9.5


