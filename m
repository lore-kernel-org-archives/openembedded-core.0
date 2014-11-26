Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-04.prod.phx3.secureserver.net
	(p3plsmtpa07-04.prod.phx3.secureserver.net [173.201.192.233])
	by mail.openembedded.org (Postfix) with ESMTP id 8889D7233E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Nov 2014 19:46:53 +0000 (UTC)
Received: from llc.pab ([75.72.225.8])
	by p3plsmtpa07-04.prod.phx3.secureserver.net with 
	id LKmr1p00Z0BVjqb01KmuT4; Wed, 26 Nov 2014 12:46:54 -0700
From: "Peter A. Bigot" <pab@pabigot.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Nov 2014 13:46:40 -0600
Message-Id: <1841536e818d2411ff1ea0cbfdebce709bc21fdc.1417030958.git.pab@pabigot.com>
X-Mailer: git-send-email 1.8.5.5
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
References: <cover.1417030958.git.pab@pabigot.com>
In-Reply-To: <cover.1417030958.git.pab@pabigot.com>
References: <cover.1417030958.git.pab@pabigot.com>
Subject: [RFC v2 5/9] gstreamer1.0-plugins-bad: select distro preference for bluez provider
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
X-List-Received-Date: Wed, 26 Nov 2014 19:47:01 -0000

Signed-off-by: Peter A. Bigot <pab@pabigot.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc    | 6 +++---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb | 1 -
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index dab0bf5..9e087e7 100644
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
index e1a5904..2a5aff5 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_git.bb
@@ -11,7 +11,6 @@ S = "${WORKDIR}/git"
 
 SRCREV = "6e5db57d2446a753aaa76bee268e1f95600b14ce"
 
-PACKAGECONFIG[bluez] = "--enable-bluez,--disable-bluez,bluez4"
 PACKAGECONFIG[sbc] = "--enable-sbc,--disable-sbc,sbc"
 PACKAGECONFIG[hls] = "--enable-hls,--disable-hls,gnutls"
 
-- 
1.8.5.5


