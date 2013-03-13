Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1UFi8k-0005pQ-K8
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 10:38:32 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 13 Mar 2013 02:21:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,834,1355126400"; d="scan'208";a="269815302"
Received: from lpalcu-linux.rb.intel.com (HELO localhost.localdomain)
	([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 13 Mar 2013 02:21:44 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 11:21:30 +0200
Message-Id: <935d151cc447d5e4ac2c2894fd53e05377161d62.1363166040.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1363166040.git.laurentiu.palcu@intel.com>
References: <cover.1363166040.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1363166040.git.laurentiu.palcu@intel.com>
References: <cover.1363166040.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 4/4] xf86-video-*: delete references to mibstore.h
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
X-List-Received-Date: Wed, 13 Mar 2013 09:38:33 -0000

This patch removes any references to mibstore.h, which has been removed
from xserver-org, from the following drivers:
 * xf86-video-vmware
 * xf86-video-fbdev
 * xf86-video-vesa

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../xf86-video-fbdev/Remove-mibstore.h.patch       |   35 +++++++++++
 .../xorg-driver/xf86-video-fbdev_0.4.3.bb          |    2 +
 .../xf86-video-vesa/Remove-mibstore.h.patch        |   37 ++++++++++++
 .../xorg-driver/xf86-video-vesa_2.3.2.bb           |    2 +
 .../xf86-video-vmware/Kill-mibstore.patch          |   63 ++++++++++++++++++++
 .../xorg-driver/xf86-video-vmware_13.0.0.bb        |    2 +
 6 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
new file mode 100644
index 0000000..225ff01
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev/Remove-mibstore.h.patch
@@ -0,0 +1,35 @@
+Upstream-Status: Backported
+
+From ac293412a01d87f87eb61f4adb9db7486a75d3fc Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 08:54:37 -0400
+Subject: [PATCH] Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+ src/fbdev.c |    2 --
+ 1 file changed, 2 deletions(-)
+
+diff --git a/src/fbdev.c b/src/fbdev.c
+index cd7ebc5..f5a7378 100644
+--- a/src/fbdev.c
++++ b/src/fbdev.c
+@@ -14,7 +14,6 @@
+ #include "xf86_OSproc.h"
+ 
+ #include "mipointer.h"
+-#include "mibstore.h"
+ #include "micmap.h"
+ #include "colormapst.h"
+ #include "xf86cmap.h"
+@@ -845,7 +844,6 @@ FBDevScreenInit(SCREEN_INIT_ARGS_DECL)
+ 	}
+ 
+ 	xf86SetBlackWhitePixels(pScreen);
+-	miInitializeBackingStore(pScreen);
+ 	xf86SetBackingStore(pScreen);
+ 
+ 	/* software cursor */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
index ff627a1..51c5144 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-fbdev_0.4.3.bb
@@ -4,5 +4,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d8cbd99fff773f92e844948f74ef0df8"
 DESCRIPTION = "X.Org X server -- fbdev display driver"
 PR = "${INC_PR}.0"
 
+SRC_URI += "file://Remove-mibstore.h.patch"
+
 SRC_URI[md5sum] = "1d99f1dfb3f0fea077b6b61caa3dc85a"
 SRC_URI[sha256sum] = "ff7b037ad110040a4e2db5c84e9741125dbbaf3a08107db47760f3e11f9c4831"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
new file mode 100644
index 0000000..0805d81
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa/Remove-mibstore.h.patch
@@ -0,0 +1,37 @@
+Upstream-Status: Backported
+
+From 60d2dc115c4b6210d3b1e05f5b0c39d1f7917cbc Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Tue, 25 Sep 2012 08:55:03 -0400
+Subject: [PATCH] Remove mibstore.h
+
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+---
+ src/vesa.c |    4 ----
+ 1 file changed, 4 deletions(-)
+
+diff --git a/src/vesa.c b/src/vesa.c
+index 11cd26c..b73d104 100644
+--- a/src/vesa.c
++++ b/src/vesa.c
+@@ -49,9 +49,6 @@
+ /* All drivers initialising the SW cursor need this */
+ #include "mipointer.h"
+ 
+-/* All drivers implementing backing store need this */
+-#include "mibstore.h"
+-
+ /* Colormap handling */
+ #include "micmap.h"
+ #include "xf86cmap.h"
+@@ -1081,7 +1078,6 @@ VESAScreenInit(SCREEN_INIT_ARGS_DECL)
+     VESADGAInit(pScrn, pScreen);
+ 
+     xf86SetBlackWhitePixels(pScreen);
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+ 
+     /* software cursor */
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
index 0fc6b71..7373f85 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
@@ -20,5 +20,7 @@ COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
 RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
+SRC_URI += "file://Remove-mibstore.h.patch"
+
 SRC_URI[md5sum] = "3eddd393fba79550e012d717499d58ad"
 SRC_URI[sha256sum] = "144a17ffae3c86603ddc4ae33521a52813498ee1f8213faa662dc4a8d6490ee3"
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
new file mode 100644
index 0000000..e85a2ea
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware/Kill-mibstore.patch
@@ -0,0 +1,63 @@
+Upstream-Status: Backported
+
+From 23d87c92b7211cc5249eefe4ab3a2c7f370e279e Mon Sep 17 00:00:00 2001
+From: Zack Rusin <zackr@vmware.com>
+Date: Thu, 14 Feb 2013 14:33:01 -0800
+Subject: [PATCH] Kill mibstore
+
+It was a noop for at least 5 years and it has been removed.
+
+Signed-off-by: Zack Rusin <zackr@vmware.com>
+---
+ saa/saa_priv.h         |    1 -
+ src/vmware.c           |    2 --
+ vmwgfx/vmwgfx_driver.c |    1 -
+ 3 files changed, 4 deletions(-)
+
+diff --git a/saa/saa_priv.h b/saa/saa_priv.h
+index 6652054..5d81453 100644
+--- a/saa/saa_priv.h
++++ b/saa/saa_priv.h
+@@ -48,7 +48,6 @@
+ #include "pixmapstr.h"
+ #include "windowstr.h"
+ #include "servermd.h"
+-#include "mibstore.h"
+ #include "colormapst.h"
+ #include "gcstruct.h"
+ #include "input.h"
+diff --git a/src/vmware.c b/src/vmware.c
+index 41201f1..6b74e14 100644
+--- a/src/vmware.c
++++ b/src/vmware.c
+@@ -23,7 +23,6 @@ char rcsId_vmware[] =
+ #include "xf86Pci.h"		/* pci */
+ 
+ #include "mipointer.h"		/* sw cursor */
+-#include "mibstore.h"		/* backing store */
+ #include "micmap.h"		/* mi color map */
+ #include "vgaHW.h"		/* VGA hardware */
+ #include "fb.h"
+@@ -1483,7 +1482,6 @@ VMWAREScreenInit(SCREEN_INIT_ARGS_DECL)
+      * If backing store is to be supported (as is usually the case),
+      * initialise it.
+      */
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+ 
+diff --git a/vmwgfx/vmwgfx_driver.c b/vmwgfx/vmwgfx_driver.c
+index 9959ffb..7863ba2 100644
+--- a/vmwgfx/vmwgfx_driver.c
++++ b/vmwgfx/vmwgfx_driver.c
+@@ -1036,7 +1036,6 @@ drv_screen_init(SCREEN_INIT_ARGS_DECL)
+ 		   (ms->only_hw_presents) ? "enabled" : "disabled");
+     }
+ 
+-    miInitializeBackingStore(pScreen);
+     xf86SetBackingStore(pScreen);
+     xf86SetSilkenMouse(pScreen);
+     miDCInitialize(pScreen, xf86GetPointerScreenFuncs());
+-- 
+1.7.9.5
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
index 4399bb1..fef5af4 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vmware_13.0.0.bb
@@ -6,6 +6,8 @@ DESCRIPTION = "vmware is an Xorg driver for VMware virtual video cards."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=5fcd7d437a959a15fbee8707747c6b53"
 
+SRC_URI += "file://Kill-mibstore.patch"
+
 DEPENDS += "virtual/libx11 libxvmc drm glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
-- 
1.7.9.5



