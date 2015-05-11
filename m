Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E4DC273FB5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 May 2015 06:08:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.9) with ESMTP id t4B68o04003159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 May 2015 23:08:50 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Sun, 10 May 2015 23:08:50 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 May 2015 23:08:41 -0700
Message-ID: <aaceb4efe82da620f2463b8c4174e70a61e2d96c.1431324180.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1431324180.git.liezhi.yang@windriver.com>
References: <cover.1431324180.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 08/12] recipes-graphics: add x11 to REQUIRED_DISTRO_FEATURES
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
 meta/recipes-graphics/libepoxy/libepoxy_1.2.bb     |    5 ++++-
 meta/recipes-graphics/libfakekey/libfakekey_git.bb |    5 ++++-
 meta/recipes-graphics/waffle/waffle_1.3.0.bb       |    5 ++++-
 .../xorg-font/xorg-font-common.inc                 |    6 +++++-
 .../xorg-font/xorg-minimal-fonts.bb                |    5 ++++-
 meta/recipes-graphics/xorg-lib/libxcb.inc          |    5 ++++-
 meta/recipes-graphics/xorg-lib/xcb-util.inc        |    4 +++-
 .../xvideo-tests/xvideo-tests_git.bb               |    5 ++++-
 8 files changed, 32 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
index 4fbc861..1934fae 100644
--- a/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
+++ b/meta/recipes-graphics/libepoxy/libepoxy_1.2.bb
@@ -11,6 +11,9 @@ SRCREV="7422de5b4be7b19d789136b3bb5f932de42db27c"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+# The virtual/libx11 requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 DEPENDS = "util-macros virtual/egl virtual/libx11"
diff --git a/meta/recipes-graphics/libfakekey/libfakekey_git.bb b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
index 862fe38..c60ddea 100644
--- a/meta/recipes-graphics/libfakekey/libfakekey_git.bb
+++ b/meta/recipes-graphics/libfakekey/libfakekey_git.bb
@@ -17,4 +17,7 @@ SRC_URI = "git://git.yoctoproject.org/${BPN}"
 
 S = "${WORKDIR}/git"
 
-inherit autotools pkgconfig gettext
+inherit autotools pkgconfig gettext distro_features_check
+
+# The libxtst requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/waffle/waffle_1.3.0.bb b/meta/recipes-graphics/waffle/waffle_1.3.0.bb
index fe9609c..a21fcbb 100644
--- a/meta/recipes-graphics/waffle/waffle_1.3.0.bb
+++ b/meta/recipes-graphics/waffle/waffle_1.3.0.bb
@@ -7,12 +7,15 @@ SRC_URI = "http://people.freedesktop.org/~chadversary/waffle/files/release/${BPN
 SRC_URI[md5sum] = "5020ecc249096c881e1f59ee961f3d41"
 SRC_URI[sha256sum] = "340ee04172dba878249469018cd7ec9d1ecd41af26b612c741b8b52e713bca8e"
 
-inherit cmake
+inherit cmake distro_features_check
 
 # This should be overridden per-machine to reflect the capabilities of the GL
 # stack.
 PACKAGECONFIG ??= "glx"
 
+# libx11 requires x11 in DISTRO_FEATURES.
+REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG', 'glx', 'x11', '', d)}"
+
 # I say virtual/libgl, actually wants gl.pc
 PACKAGECONFIG[glx] = "-Dwaffle_has_glx=1,,virtual/libgl libx11"
 
diff --git a/meta/recipes-graphics/xorg-font/xorg-font-common.inc b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
index d3b995a..d5267f59 100644
--- a/meta/recipes-graphics/xorg-font/xorg-font-common.inc
+++ b/meta/recipes-graphics/xorg-font/xorg-font-common.inc
@@ -10,10 +10,14 @@ RDEPENDS_${PN} = "encodings font-util font-alias"
 XORG_PN = "${BPN}"
 INC_PR = "r2"
 
+
 SRC_URI = "${XORG_MIRROR}/individual/font/${XORG_PN}-${PV}.tar.bz2"
 S = "${WORKDIR}/${XORG_PN}-${PV}"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+# The mkfontscale-native requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 EXTRA_OEMAKE += "FCCACHE=/bin/true UTIL_DIR=${STAGING_DIR_TARGET}\$\(MAPFILES_PATH\)"
 
diff --git a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
index bee500b..9bcd1b2 100644
--- a/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
+++ b/meta/recipes-graphics/xorg-font/xorg-minimal-fonts.bb
@@ -13,7 +13,10 @@ SRC_URI = "file://misc"
 PE = "1"
 PR = "r2"
 
-inherit allarch
+inherit allarch distro_features_check
+
+# The font-alias requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 S = "${WORKDIR}/misc"
 
diff --git a/meta/recipes-graphics/xorg-lib/libxcb.inc b/meta/recipes-graphics/xorg-lib/libxcb.inc
index 453f550..fe31f20 100644
--- a/meta/recipes-graphics/xorg-lib/libxcb.inc
+++ b/meta/recipes-graphics/xorg-lib/libxcb.inc
@@ -20,7 +20,10 @@ PACKAGES_DYNAMIC = "^libxcb-.*"
 
 FILES_${PN} = "${libdir}/libxcb.so.*"
 
-inherit autotools pkgconfig pythonnative
+inherit autotools pkgconfig pythonnative distro_features_check
+
+# The libxau and others requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
 
 python populate_packages_prepend () {
     do_split_packages(d, '${libdir}', '^libxcb-(.*)\.so\..*$', 'libxcb-%s', 'XCB library module for %s', allow_links=True)
diff --git a/meta/recipes-graphics/xorg-lib/xcb-util.inc b/meta/recipes-graphics/xorg-lib/xcb-util.inc
index d15cf9f..99d04f9 100644
--- a/meta/recipes-graphics/xorg-lib/xcb-util.inc
+++ b/meta/recipes-graphics/xorg-lib/xcb-util.inc
@@ -18,4 +18,6 @@ DEPENDS += "gperf-native"
 
 SRC_URI = "http://xcb.freedesktop.org/dist/${BPN}-${PV}.tar.bz2"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "x11"
diff --git a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
index 27aacde..9b3c9e0 100644
--- a/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
+++ b/meta/recipes-graphics/xvideo-tests/xvideo-tests_git.bb
@@ -11,4 +11,7 @@ SRC_URI = "git://git.yoctoproject.org/test-xvideo"
 
 S = "${WORKDIR}/git"
 
-inherit autotools
+inherit autotools distro_features_check
+
+# The libxv requires x11 in DISTRO_FEATURES
+REQUIRED_DISTRO_FEATURES = "x11"
-- 
1.7.9.5


