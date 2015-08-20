Return-Path: <reinette.chatre@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9D56D76A64
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:32:48 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 20 Aug 2015 14:32:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,717,1432623600"; d="scan'208";a="629314211"
Received: from rchatre-builder.jf.intel.com ([10.54.39.14])
	by orsmga003.jf.intel.com with ESMTP; 20 Aug 2015 14:32:47 -0700
From: Reinette Chatre <reinette.chatre@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Aug 2015 14:34:33 -0700
Message-Id: <02c13f68fd830f0780c134fc77197f5153f6bf85.1440106310.git.reinette.chatre@intel.com>
X-Mailer: git-send-email 2.4.3
Subject: [PATCH] xf86-video-intel: enable xvmc feature by default and fix dependency
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
X-List-Received-Date: Thu, 20 Aug 2015 21:32:50 -0000

XvMC extends the X Video extension (Xv) and enables hardware rendered
motion compensation support. In a test build enabling this feature
increased the size of the xf86-video-intel package from 1386841 to
1847154 bytes.

When we enable the xvmc feature in xf86-video-intel we see the
following QA issue reported:
QA Issue: xf86-video-intel rdepends on xcb-util, but it isn't
a build dependency?

We fix this by ensuring the build dependencies are set correctly when
the xvmc feature is enabled.

Signed-off-by: Reinette Chatre <reinette.chatre@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
index 26b68b4..d041877 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.99.917.bb
@@ -18,7 +18,7 @@ SRC_URI[sha256sum] = "00b781eea055582820a123c47b62411bdf6aabf4f03dc0568faec55faf
 
 DEPENDS += "virtual/libx11 drm libpciaccess pixman"
 
-PACKAGECONFIG ??= "sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
+PACKAGECONFIG ??= "xvmc sna udev ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'dri dri1 dri2', '', d)}"
 
 PACKAGECONFIG[dri] = "--enable-dri,--disable-dri"
 PACKAGECONFIG[dri1] = "--enable-dri1,--disable-dri1,xf86driproto"
@@ -27,7 +27,7 @@ PACKAGECONFIG[dri3] = "--enable-dri3,--disable-dri3,dri3proto"
 PACKAGECONFIG[sna] = "--enable-sna,--disable-sna"
 PACKAGECONFIG[uxa] = "--enable-uxa,--disable-uxa"
 PACKAGECONFIG[udev] = "--enable-udev,--disable-udev,udev"
-PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc"
+PACKAGECONFIG[xvmc] = "--enable-xvmc,--disable-xvmc,libxvmc xcb-util"
 PACKAGECONFIG[tools] = "--enable-tools,--disable-tools,libxinerama libxrandr libxdamage libxfixes libxcursor libxtst libxext libxrender"
 
 # --enable-kms-only option is required by ROOTLESS_X
-- 
2.4.3


