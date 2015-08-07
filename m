Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CCA4F767A4
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Aug 2015 14:27:51 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 07 Aug 2015 07:27:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,630,1432623600"; d="scan'208";a="779724783"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2015 07:27:51 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Aug 2015 17:28:45 +0300
Message-Id: <a24ccc73133ead208d6c3159e4636dfaa1bd98c4.1438956967.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
References: <cover.1438956967.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 5/7] xf86-video-omapfb: switch SRC_URI to debian git repo
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
X-List-Received-Date: Fri, 07 Aug 2015 14:27:52 -0000

The previous upstream is no longer available. Debian git repository
is one commit behind the original repository, so that commit is added
as a patch.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 ...apfb-from-from-crashing-when-pixelclock-o.patch | 35 ++++++++++++++++++++++
 .../xorg-driver/xf86-video-omapfb_git.bb           |  5 ++--
 2 files changed, 38 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
new file mode 100644
index 0000000..c4cf16e
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb/0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch
@@ -0,0 +1,35 @@
+From 28c006c94e57ea71df11ec4fff79d7ffcfc4860f Mon Sep 17 00:00:00 2001
+From: Far McKon <FarMcKon@buglabs.net>
+Date: Tue, 3 May 2011 20:59:04 +0300
+Subject: [PATCH] Prevents omapfb from from crashing when pixelclock of 0 is
+ sent to it.
+
+Due to a Linux design bug it is easy to get a pixelclock set to zero
+when changing displays at runtime.
+---
+ src/omapfb-output.c | 9 +++++++--
+ 1 file changed, 7 insertions(+), 2 deletions(-)
+
+diff --git a/src/omapfb-output.c b/src/omapfb-output.c
+index f8b4db3..4d59265 100644
+--- a/src/omapfb-output.c
++++ b/src/omapfb-output.c
+@@ -125,8 +125,13 @@ OMAPFBOutputGetModes(xf86OutputPtr output)
+ 	/* Only populate the native (current) mode */
+ 	mode = calloc(1, sizeof(DisplayModeRec));
+ 	mode->type      |= M_T_PREFERRED;
+-	mode->Clock = PICOS2KHZ(ofb->state_info.pixclock);
+-	mode->SynthClock = PICOS2KHZ(ofb->state_info.pixclock);
++	if (ofb->state_info.pixclock == 0) {
++		mode->Clock = 0;
++		mode->SynthClock = 0;
++	} else {
++		mode->Clock = PICOS2KHZ(ofb->state_info.pixclock);
++		mode->SynthClock = PICOS2KHZ(ofb->state_info.pixclock);
++	}
+ 	mode->HDisplay   = ofb->state_info.xres;
+ 	mode->HSyncStart = mode->HDisplay
+ 	                  + ofb->state_info.right_margin;
+-- 
+2.1.4
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
index 4ad2538..0eeb870 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
@@ -9,11 +9,12 @@ LICENSE = "MIT-X & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
 DEPENDS += "virtual/libx11"
 
-SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
+SRCREV = "33e36c12dde336edbdd34626dd8adfcaebc8fbb8"
 PR = "${INC_PR}.7"
 PV = "0.1.1+gitr${SRCPV}"
 
-SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
+SRC_URI = "git://anonscm.debian.org/collab-maint/xf86-video-omapfb.git \
+  file://0001-Prevents-omapfb-from-from-crashing-when-pixelclock-o.patch \
   file://0001-Revert-Set-a-large-CRTC-upper-limit-to-not-prune-lar.patch \
   file://0002-Revert-Set-virtual-size-when-configuring-framebuffer.patch \
   file://0003-force-plain-mode.patch \
-- 
2.1.4


