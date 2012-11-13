Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYFfb-0006UI-2O
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 13:32:47 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 13 Nov 2012 04:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,765,1344236400"; d="scan'208";a="218907481"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 13 Nov 2012 04:18:51 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Nov 2012 14:18:29 +0200
Message-Id: <0793c2728cde3530f6d21c865aa017bb00007de5.1352808309.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352808309.git.laurentiu.palcu@intel.com>
References: <cover.1352808309.git.laurentiu.palcu@intel.com>
Subject: [PATCH 12/12] xf86-video-omapfb: upgrade to 0.4.2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 13 Nov 2012 12:32:47 -0000

Other changes:
 * changed the recipe's SRC_URI to track the new (maintained) repo;
 * removed all old patches as the latest driver's structure has changed
   drastically;
 * license file changed quite a bit: MIT -> GPLv2 (needs to be reviewed
   by somebody with a better understanding of these things though);
 * xf86-video-omapfb changed its name to xf86-video-omap: change the
   recipe name and config files accordingly;
 * add dependency of libdrm-omap;

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta-yocto-bsp/conf/machine/beagleboard.conf       |    2 +-
 ...-video-omapfb_git.bb => xf86-video-omap_git.bb} |   23 ++++++++------------
 .../target/arch/arm/conf/machine/{{=machine}}.conf |    2 +-
 3 files changed, 11 insertions(+), 16 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omapfb_git.bb => xf86-video-omap_git.bb} (43%)

diff --git a/meta-yocto-bsp/conf/machine/beagleboard.conf b/meta-yocto-bsp/conf/machine/beagleboard.conf
index 6633880..204be95 100644
--- a/meta-yocto-bsp/conf/machine/beagleboard.conf
+++ b/meta-yocto-bsp/conf/machine/beagleboard.conf
@@ -6,7 +6,7 @@ PREFERRED_PROVIDER_virtual/xserver ?= "xserver-xorg"
 XSERVER ?= "xserver-xorg \
            xf86-input-evdev \
            xf86-input-mouse \
-           xf86-video-omapfb \
+           xf86-video-omap \
            xf86-input-keyboard"
 
 # Ship all kernel modules by default
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
similarity index 43%
rename from meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index f16441e..2a85890 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omapfb_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -6,19 +6,14 @@ DESCRIPTION = "omapfb driver supports the basic Texas Instruments OMAP \
 framebuffer."
 
 LICENSE = "MIT-X & GPLv2+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=63e2cbac53863f60e2f43343fb34367f"
-DEPENDS += "virtual/libx11"
-
-SRCREV = "28c006c94e57ea71df11ec4fff79d7ffcfc4860f"
-PR = "${INC_PR}.6"
-PV = "0.1.1+gitr${SRCPV}"
-
-SRC_URI = "git://git.pingu.fi/xf86-video-omapfb;protocol=http \
-            file://omap-revert-set-CRTC-limit.patch \
-            file://omap-revert-set-virtual-size.patch \
-            file://omap-force-plain-mode.patch  \
-            file://omap-blacklist-tv-out.patch  \
-            file://0004-Attempt-to-fix-VRFB.patch \
+LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
+DEPENDS += "virtual/libx11 libdrm-omap"
+
+SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
+PR = "${INC_PR}.0"
+PV = "0.4.2+gitr${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
 "
 
 S = "${WORKDIR}/git"
@@ -28,5 +23,5 @@ CFLAGS += " -I${STAGING_INCDIR}/xorg "
 
 # Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
 do_compile_prepend_armv7a () {
-        sed -i -e s:fb1:fb2:g ${S}/src/omapfb-xv.c
+        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
 }
diff --git a/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf b/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf
index a3e2970..1990ef6 100644
--- a/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf
+++ b/scripts/lib/bsp/substrate/target/arch/arm/conf/machine/{{=machine}}.conf
@@ -9,7 +9,7 @@ PREFERRED_PROVIDER_virtual/xserver = "xserver-xorg"
 XSERVER = "xserver-xorg \
            xf86-input-evdev \
            xf86-input-mouse \
-           xf86-video-omapfb \
+           xf86-video-omap \
            xf86-input-keyboard"
 
 # Ship all kernel modules by default
-- 
1.7.9.5



