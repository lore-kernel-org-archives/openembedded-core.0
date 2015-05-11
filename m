Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7296773D8E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68maE003156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:48 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:39 -0700
Message-ID: <039692d042b26c2907b7e9101885cad7503a9f87.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/12] libowl/settings-daemon/libnotify: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 11 May 2015 06:08:47 -0000
Content-Type: text/plain

The libowl, settings-daemon and libnotify requires gdk/gdkx.h which is
provided by gtk when x11 in DISTRO_FEATURES, so add x11 to
REQUIRED_DISTRO_FEATURES.

The leafpad, settings-daemon and oh-puzzles requires
libowl or settings-daemon, so add xx to REQUIRED_DISTRO_FEATURES for
them too.

The leafpad can't be built without libowl, so depends in directly rather
than use DEPENDS_append_poky.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |    6 +++++-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    8 +++++---
 meta/recipes-sato/libowl/libowl_git.bb             |    5 ++++-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    4 +++-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    9 +++++++--
 .../settings-daemon/settings-daemon_git.bb         |    5 ++++-
 6 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
index 1d92b64..e6ee89b 100644
--- a/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
+++ b/meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
@@ -7,7 +7,11 @@ PR = "r1"
 
 DEPENDS = "dbus gtk+ dbus-glib"
 
-inherit gnomebase
+inherit gnomebase distro_features_check
+
+# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI[archive.md5sum] = "732c9d2cd5eb6a9069264a319d330516"
 SRC_URI[archive.sha256sum] = "73b16a79bb2fed62dcf146b11c4405776cb96a09dce66379ca541da7dbd64210"
 
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index 830c053..f715149 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -6,8 +6,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/leafpad.h;endline=20;md5=d3d6a89f5e61e8b13bdea537511ba1fa \
                     file://src/utils.c;endline=20;md5=0d2cc6584ba3202448bb274f62739571"
 
-DEPENDS = "gtk+ intltool-native"
-DEPENDS_append_poky = " libowl"
+DEPENDS = "gtk+ intltool-native libowl"
+# The libowl requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 SRC_URI = "${SAVANNAH_NONGNU_MIRROR}/${BPN}/${BPN}-${PV}.tar.gz \
 	   file://leafpad.desktop"
 
@@ -17,7 +19,7 @@ PR = "r2"
 
 SRC_URI_append_poky = " file://owl-menu.patch;apply=yes "
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 EXTRA_OECONF = " --enable-chooser --disable-emacs --disable-print"
 
diff --git a/meta/recipes-sato/libowl/libowl_git.bb b/meta/recipes-sato/libowl/libowl_git.bb
index 3ccd340..9cc47db 100644
--- a/meta/recipes-sato/libowl/libowl_git.bb
+++ b/meta/recipes-sato/libowl/libowl_git.bb
@@ -17,4 +17,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
index f0119b7..5f73a4c 100644
--- a/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
+++ b/meta/recipes-sato/matchbox-config-gtk/matchbox-config-gtk_git.bb
@@ -17,5 +17,7 @@ S = "${WORKDIR}/git"
 SRC_URI = "git://git.yoctoproject.org/${BPN} \
         file://no-handed.patch;striplevel=0"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
+# The settings-daemon requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index bd762e9..36cd2cc 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -9,7 +9,12 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f56ec6772dd1c7c367067bbea8ea1675 \
 
 SECTION = "x11"
 DEPENDS = "gtk+ gconf intltool-native librsvg"
-DEPENDS_append_poky = " libowl"
+
+# libowl requires x11 in DISTRO_FEATURES
+DEPENDS_append_poky = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libowl', '', d)}"
+
+# Requires gdk/gdkx.h which is provided by gtk when x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRCREV = "92f1a20e4b72eed7a35b00984d9793b51dc2fb3b"
 PV = "0.2+git${SRCPV}"
@@ -20,7 +25,7 @@ SRC_URI_append_poky = " file://oh-puzzles-owl-menu.patch;striplevel=0 "
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
 
 bindir = "/usr/games"
 
diff --git a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
index ba48d90..c061553 100644
--- a/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
+++ b/meta/recipes-sato/settings-daemon/settings-daemon_git.bb
@@ -17,10 +17,13 @@ SRC_URI = "git://git.yoctoproject.org/xsettings-daemon \
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gconf
+inherit autotools pkgconfig gconf distro_features_check
 
 FILES_${PN} = 	"${bindir}/* ${sysconfdir}"
 
+# Requires gdk-x11-2.0 which is provided by gtk when x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
+
 do_install_append () {
 	install -d ${D}/${sysconfdir}/X11/Xsession.d
 	install -m 755 ${WORKDIR}/70settings-daemon.sh ${D}/${sysconfdir}/X11/Xsession.d/
-- 
1.7.9.5


