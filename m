Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1AEB8766A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 07:46:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t8H7kRdk021687
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Sep 2015 00:46:28 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Thu, 17 Sep 2015 00:46:27 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 17 Sep 2015 00:46:27 -0700
Message-ID: <449d22e4acbad6a99a1a7372181c815e528a579f.1442475786.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1442475786.git.liezhi.yang@windriver.com>
References: <cover.1442475786.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] meta: fix build with gettext 0.16.1
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
X-List-Received-Date: Thu, 17 Sep 2015 07:46:28 -0000
Content-Type: text/plain

The gettext 0.16.1 doesn't install any m4 files to sysroot, please see
the following commit:

  commit 9e10db5bdfe77c0ef2aff2f1cf89958b62c294a1
  Author: Christopher Larson <kergoth@gmail.com>
  Date:   Mon Mar 17 18:10:54 2014 +0000

      gettext-0.16.1: kill target m4 macros from sysroot

This is aim for using gettext-native's macros(gettext-native-0.19.4),
but when we set:
  PREFERRED_VERSION_gettext = "0.16.1"
And build the recipes like pcmanfm, we would get errors when
do_configure:

configure:5164: error: possibly undefined macro: AM_NLS

This is because autotools_copy_aclocals doesn't copy the native macros
for target unless they're direct dependencies.

Add gettext-native to DEPENDS will fix the problem.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../connman/connman-gnome_0.7.bb                   |    2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |    2 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |    2 +-
 meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb   |    2 +-
 .../oprofile/oprofileui-server_git.bb              |    2 +-
 meta/recipes-kernel/oprofile/oprofileui_git.bb     |    2 +-
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |    2 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_git.bb        |    2 +-
 meta/recipes-support/atk/at-spi2-core_2.16.0.bb    |    2 +-
 meta/recipes-support/libfm/libfm-extra_1.2.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_1.2.3.bb          |    2 +-
 meta/recipes-support/pinentry/pinentry_0.9.2.bb    |    2 ++
 13 files changed, 14 insertions(+), 12 deletions(-)

diff --git a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
index f5575d2..b54d703 100644
--- a/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
+++ b/meta/recipes-connectivity/connman/connman-gnome_0.7.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eb723b61539feef013de476e68b5c50a \
                     file://properties/main.c;beginline=1;endline=20;md5=50c77c81871308b033ab7a1504626afb \
                     file://common/connman-dbus.c;beginline=1;endline=20;md5=de6b485c0e717a0236402d220187717a"
 
-DEPENDS = "gtk+ dbus-glib intltool-native"
+DEPENDS = "gtk+ dbus-glib intltool-native gettext-native"
 
 # 0.7 tag
 SRCREV = "cf3c325b23dae843c5499a113591cfbc98acb143"
diff --git a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
index c30454c..212bc52 100644
--- a/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
+++ b/meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
@@ -6,7 +6,7 @@ LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
 
 SECTION = "x11/base"
-DEPENDS = "intltool-native gtk+"
+DEPENDS = "intltool-native gtk+ gettext-native"
 
 PR = "r3"
 
diff --git a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
index cebc83b..ac84cb1 100644
--- a/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
+++ b/meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=23c2a5e0106b99d75238986559bb5fc6"
 
 inherit gnomebase gtk-doc
 
-DEPENDS = "glib-2.0 libgcrypt"
+DEPENDS = "glib-2.0 libgcrypt gettext-native"
 
 EXTRA_OECONF += "--disable-manpages"
 
diff --git a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb b/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
index 7a45241..0c23d19 100644
--- a/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
+++ b/meta/recipes-graphics/xorg-app/xwininfo_1.1.3.bb
@@ -7,7 +7,7 @@ windows.  Information may include window position, size, color depth, \
 and a number of other items."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=78976cd3115f6faf615accc4e094d90e"
-DEPENDS += "libxext libxmu"
+DEPENDS += "libxext libxmu gettext-native"
 
 PE = "0"
 
diff --git a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
index eb3b78b..cc3477b 100644
--- a/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui-server_git.bb
@@ -9,7 +9,7 @@ SRC_URI = "git://git.yoctoproject.org/oprofileui \
            file://init \
            file://oprofileui-server.service "
 
-DEPENDS += "intltool-native"
+DEPENDS += "intltool-native gettext-native"
 
 EXTRA_OECONF += "--disable-client --enable-server"
 
diff --git a/meta/recipes-kernel/oprofile/oprofileui_git.bb b/meta/recipes-kernel/oprofile/oprofileui_git.bb
index bb69d54..7fbc03d 100644
--- a/meta/recipes-kernel/oprofile/oprofileui_git.bb
+++ b/meta/recipes-kernel/oprofile/oprofileui_git.bb
@@ -1,6 +1,6 @@
 require oprofileui.inc
 
-DEPENDS += "gtk+ libglade libxml2 avahi-ui gconf"
+DEPENDS += "gtk+ libglade libxml2 avahi-ui gconf gettext-native"
 
 SRCREV = "389e1875af4721d52c7e65cf9cfffb69b0ed6a59"
 PV = "0.0+git${SRCPV}"
diff --git a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
index f715149..093b89f 100644
--- a/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
+++ b/meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f \
                     file://src/leafpad.h;endline=20;md5=d3d6a89f5e61e8b13bdea537511ba1fa \
                     file://src/utils.c;endline=20;md5=0d2cc6584ba3202448bb274f62739571"
 
-DEPENDS = "gtk+ intltool-native libowl"
+DEPENDS = "gtk+ intltool-native libowl gettext-native"
 # The libowl requires x11 in DISTRO_FEATURES
 REQUIRED_DISTRO_FEATURES = "x11"
 
diff --git a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
index 4467303..b63db87 100644
--- a/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
+++ b/meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb
@@ -7,7 +7,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/gseal-gtk-compat.h;endline=21;md5=46922c8691f58d124f9420fe16149ce2"
 
 SECTION = "x11"
-DEPENDS = "gtk+ startup-notification libfm intltool-native"
+DEPENDS = "gtk+ startup-notification libfm intltool-native gettext-native"
 DEPENDS_append_poky = " libowl"
 
 
diff --git a/meta/recipes-sato/puzzles/oh-puzzles_git.bb b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
index 36cd2cc..9876fe0 100644
--- a/meta/recipes-sato/puzzles/oh-puzzles_git.bb
+++ b/meta/recipes-sato/puzzles/oh-puzzles_git.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=f56ec6772dd1c7c367067bbea8ea1675 \
                     file://src/tree234.c;endline=28;md5=b4feb1976feebf8f1379093ed52f2945"
 
 SECTION = "x11"
-DEPENDS = "gtk+ gconf intltool-native librsvg"
+DEPENDS = "gtk+ gconf intltool-native librsvg gettext-native"
 
 # libowl requires x11 in DISTRO_FEATURES
 DEPENDS_append_poky = " ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'libowl', '', d)}"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
index 933cbe7..7c12b54 100644
--- a/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
+++ b/meta/recipes-support/atk/at-spi2-core_2.16.0.bb
@@ -11,7 +11,7 @@ SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz \
 SRC_URI[md5sum] = "be6eeea370f913b7639b609913b2cf02"
 SRC_URI[sha256sum] = "1c0b77fb8ce81abbf1d80c0afee9858b3f9229f673b7881995fe0fc16b1a74d0"
 
-DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native"
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi libxtst intltool-native gettext-native"
 
 inherit autotools gtk-doc pkgconfig distro_features_check
 # depends on virtual/libx11
diff --git a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb b/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
index 46d2d62..3675269 100644
--- a/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm-extra_1.2.3.bb
@@ -5,7 +5,7 @@ LICENSE = "LGPLv2+"
 LIC_FILES_CHKSUM = "file://src/fm-extra.h;beginline=8;endline=21;md5=ef1f84da64b3c01cca447212f7ef6007"
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0 intltool-native"
+DEPENDS = "glib-2.0 intltool-native gettext-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz \
            file://0001-nls.m4-Take-it-from-gettext-0.15.patch \
diff --git a/meta/recipes-support/libfm/libfm_1.2.3.bb b/meta/recipes-support/libfm/libfm_1.2.3.bb
index 629502f..aa48fb9 100644
--- a/meta/recipes-support/libfm/libfm_1.2.3.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.3.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
 
 
 SECTION = "x11/libs"
-DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif libfm-extra"
+DEPENDS = "glib-2.0 pango gtk+ menu-cache intltool-native libexif libfm-extra gettext-native"
 
 SRC_URI = "${SOURCEFORGE_MIRROR}/pcmanfm/libfm-${PV}.tar.xz"
 
diff --git a/meta/recipes-support/pinentry/pinentry_0.9.2.bb b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
index c836ca4..d6b7130 100644
--- a/meta/recipes-support/pinentry/pinentry_0.9.2.bb
+++ b/meta/recipes-support/pinentry/pinentry_0.9.2.bb
@@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=cbbd794e2a0a289b9dfcc9f513d1996e"
 
 inherit autotools
 
+DEPENDS = "gettext-native"
+
 SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2"
 
 SRC_URI[md5sum] = "f51d454f921111b5156a2291cbf70278"
-- 
1.7.9.5


