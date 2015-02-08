Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-07.prod.phx3.secureserver.net
	(p3plsmtpa07-07.prod.phx3.secureserver.net [173.201.192.236])
	by mail.openembedded.org (Postfix) with ESMTP id 6DC9873295
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 Feb 2015 18:42:53 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-07.prod.phx3.secureserver.net with 
	id puin1p00C0BVjqb01uiuW1; Sun, 08 Feb 2015 11:42:55 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  8 Feb 2015 12:42:18 -0600
Message-Id: <68300aa946e0e82397f0861cfdc1783c1e373783.1423420390.git.pab@pabigot.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
In-Reply-To: <cover.1423420390.git.pab@pabigot.com>
References: <cover.1423420390.git.pab@pabigot.com>
Subject: [PATCHv3 06/10] gstreamer1.0-plugins-bad: select distro preference for bluez provider
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
X-List-Received-Date: Sun, 08 Feb 2015 18:42:58 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc    | 6 +++---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 9c15f2b..d9aee21 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -9,7 +9,7 @@ S = "${WORKDIR}/gst-plugins-bad-${PV}"
 SRC_URI += "file://configure-allow-to-disable-libssh2.patch \
            "
 
-inherit gettext
+inherit gettext bluetooth
 
 # opengl packageconfig factored out to make it easy for distros
 # and BSP layers to pick either (desktop) opengl, gles2, or no GL
@@ -18,7 +18,7 @@ PACKAGECONFIG_GL ?= "${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'gles2',
 PACKAGECONFIG ??= " \
     ${PACKAGECONFIG_GL} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
-    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'bluetooth', '${BLUEZ}', '', d)} \
     ${@bb.utils.contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
     orc curl uvch264 neon sndfile \
     hls sbc dash bz2 smoothstreaming \
@@ -49,7 +49,7 @@ PACKAGECONFIG[bz2]             = "--enable-bz2,--disable-bz2,bzip2"
 PACKAGECONFIG[fluidsynth]      = "--enable-fluidsynth,--disable-fluidsynth,fluidsynth"
 PACKAGECONFIG[schroedinger]    = "--enable-schro,--disable-schro,schroedinger"
 PACKAGECONFIG[smoothstreaming] = "--enable-smoothstreaming,--disable-smoothstreaming,libxml2"
-PACKAGECONFIG[bluez]           = "--enable-bluez,--disable-bluez,bluez4"
+PACKAGECONFIG[bluez4]          = "--enable-bluez,--disable-bluez,bluez4"
 PACKAGECONFIG[rsvg]            = "--enable-rsvg,--disable-rsvg,librsvg"
 PACKAGECONFIG[sndfile]         = "--enable-sndfile,--disable-sndfile,libsndfile1"
 PACKAGECONFIG[webp]            = "--enable-webp,--disable-webp,libwebp"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
index 75859f9..309505f 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -11,7 +11,6 @@ S = "${WORKDIR}/git"
 
 SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
 
-PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
 PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
 PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
 
-- 
1.9.1


