Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TYd7m-0002Xc-TV
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 14:35:27 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 14 Nov 2012 05:21:27 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.83,250,1352102400"; d="scan'208";a="219485952"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.42])
	by orsmga001.jf.intel.com with ESMTP; 14 Nov 2012 05:21:26 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Nov 2012 15:21:10 +0200
Message-Id: <7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1352898505.git.laurentiu.palcu@intel.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
Subject: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
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
X-List-Received-Date: Wed, 14 Nov 2012 13:35:27 -0000

This new recipe is needed because the old driver is unmaintained. This
new recipe will follow the new repo.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xorg-driver/xf86-video-omap_git.bb             |   31 ++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
new file mode 100644
index 0000000..b3177eb
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -0,0 +1,31 @@
+require xorg-driver-video.inc
+
+SUMMARY = "X.Org X server -- Texas Instruments OMAP framebuffer driver"
+
+DESCRIPTION = "omap driver supports the basic Texas Instruments OMAP \
+framebuffer."
+
+LICENSE = "GPLv2+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
+DEPENDS += "virtual/libx11 libdrm"
+
+RPROVIDES = "xf86-video-omapfb"
+RCONFLICTS = "xf86-video-omapfb"
+RREPLACES = "xf86-video-omapfb"
+
+SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
+PR = "${INC_PR}.0"
+PV = "0.4.2+gitr${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
+"
+
+S = "${WORKDIR}/git"
+
+EXTRA_OECONF_armv7a = " --enable-neon "
+CFLAGS += " -I${STAGING_INCDIR}/xorg "
+
+# Use overlay 2 on omap3 to enable other apps to use overlay 1 (e.g. dmai or omapfbplay)
+do_compile_prepend_armv7a () {
+        sed -i -e s:fb1:fb2:g ${S}/src/omap_xv.c
+}
-- 
1.7.9.5



