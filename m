Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Uap9z-0006xk-OX
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 17:23:07 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2013 08:04:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,648,1363158000"; d="scan'208";a="331999011"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by fmsmga001.fm.intel.com with ESMTP; 10 May 2013 08:04:27 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 May 2013 18:04:13 +0300
Message-Id: <8bc677b83460d112b69dd2799225cec77aedceb6.1368198012.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1368198012.git.laurentiu.palcu@intel.com>
References: <cover.1368198012.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/8] xf86-video-vmware: upgrade to 13.0.1
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
X-List-Received-Date: Fri, 10 May 2013 15:23:26 -0000

Removed the backported patch.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xf86-video-vmware/Kill-mibstore.patch          |   63 --------------------
 ...mware_13.0.0.bb => xf86-video-vmware_13.0.1.bb} |    8 +--
 2 files changed, 2 insertions(+), 69 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-vmware_13.0.0.bb => xf86-video-vmware_13.0.1.bb} (65%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
deleted file mode 100644
index e85a2ea..0000000
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-Upstream-Status: Backported
-
-From 23d87c92b7211cc5249eefe4ab3a2c7f370e279e Mon Sep 17 00:00:00 2001
-From: Zack Rusin <zackr@vmware.com>
-Date: Thu, 14 Feb 2013 14:33:01 -0800
-Subject: [PATCH] Kill mibstore
-
-It was a noop for at least 5 years and it has been removed.
-
-Signed-off-by: Zack Rusin <zackr@vmware.com>
----
- saa/saa_priv.h         |    1 -
- src/vmware.c           |    2 --
- vmwgfx/vmwgfx_driver.c |    1 -
- 3 files changed, 4 deletions(-)
-
-diff --git a/saa/saa_priv.h b/saa/saa_priv.h
-index 6652054..5d81453 100644
---- a/saa/saa_priv.h
-+++ b/saa/saa_priv.h
-@@ -48,7 +48,6 @@
- #include "pixmapstr.h"
- #include "windowstr.h"
- #include "servermd.h"
--#include "mibstore.h"
- #include "colormapst.h"
- #include "gcstruct.h"
- #include "input.h"
-diff --git a/src/vmware.c b/src/vmware.c
-index 41201f1..6b74e14 100644
---- a/src/vmware.c
-+++ b/src/vmware.c
-@@ -23,7 +23,6 @@ char rcsId_vmware[] =
- #include "xf86Pci.h"		/* pci */
- 
- #include "mipointer.h"		/* sw cursor */
--#include "mibstore.h"		/* backing store */
- #include "micmap.h"		/* mi color map */
- #include "vgaHW.h"		/* VGA hardware */
- #include "fb.h"
-@@ -1483,7 +1482,6 @@ VMWAREScreenInit(SCREEN_INIT_ARGS_DECL)
-      * If backing store is to be supported (as is usually the case),
-      * initialise it.
-      */
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
- 
-diff --git a/vmwgfx/vmwgfx_driver.c b/vmwgfx/vmwgfx_driver.c
-index 9959ffb..7863ba2 100644
---- a/vmwgfx/vmwgfx_driver.c
-+++ b/vmwgfx/vmwgfx_driver.c
-@@ -1036,7 +1036,6 @@ drv_screen_init(SCREEN_INIT_ARGS_DECL)
- 		   (ms->only_hw_presents) ? "enabled" : "disabled");
-     }
- 
--    miInitializeBackingStore(pScreen);
-     xf86SetBackingStore(pScreen);
-     xf86SetSilkenMouse(pScreen);
-     miDCInitialize(pScreen, xf86GetPointerScreenFuncs());
--- 
-1.7.9.5
-
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
similarity index 65%
rename from meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
rename to meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
index fef5af4..1526a02 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.1.bb
@@ -6,14 +6,10 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
-SRC_URI += "file://Kill-mibstore.patch"
-
 DEPENDS += "virtual/libx11 libxvmc drm glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
-PR = "${INC_PR}.0"
-
-SRC_URI[md5sum] = "b72be57517cbc7a56362f2ee0f092269"
-SRC_URI[sha256sum] = "44919ecd88654f2ab40a1732b5ea6a1dbd1c696b4b0748e68e8b5f1a3486bca6"
+SRC_URI[md5sum] = "b08e0195ebf3f88a82129322cb93da08"
+SRC_URI[sha256sum] = "802dda415c22412edad6c3df44fe18a06e91d0f8456d9a58bac0d340fdf8fe3d"
 
 COMPATIBLE_HOST = '(i.86.*-linux|x86_64.*-linux)'
-- 
1.7.9.5



