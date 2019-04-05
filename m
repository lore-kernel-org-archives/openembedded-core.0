Return-Path: <Ovidiu.Panait@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5AF336BCE7
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Apr 2019 11:21:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x35BLI4v017297
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 5 Apr 2019 04:21:19 -0700 (PDT)
Received: from otp-opanait-l1.corp.ad.wrs.com (128.224.124.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Fri, 5 Apr 2019 04:21:18 -0700
From: Ovidiu Panait <ovidiu.panait@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 5 Apr 2019 14:19:42 +0300
Message-ID: <20190405111942.3059-1-ovidiu.panait@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] xf86-video-vesa: Refuse to run on UEFI machines
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
X-List-Received-Date: Fri, 05 Apr 2019 11:21:18 -0000
Content-Type: text/plain

Fix the following Xorg start failure on UEFI machines when using xf86-video-vesa
driver (e.g. in qemu, when anaconda tries to start X):
Xorg -br -logfile /tmp/X.log :1 vt7 -s 1440 -ac -nolisten tcp -dpi 96 -noreset
...
(EE) Cannot run in framebuffer mode. Please specify busIDs for all framebuffer devices
...

Upstream patch:
https://cgit.freedesktop.org/xorg/driver/xf86-video-vesa/commit/?id=2645e0aa9c17c2c966a0533e52ad00510311483e

Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
---
 .../0001-Refuse-to-run-on-UEFI-machines.patch | 52 +++++++++++++++++++
 .../xorg-driver/xf86-video-vesa_2.4.0.bb      |  4 ++
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch b/meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch
new file mode 100644
index 0000000000..9e01770667
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa/0001-Refuse-to-run-on-UEFI-machines.patch
@@ -0,0 +1,52 @@
+From 2645e0aa9c17c2c966a0533e52ad00510311483e Mon Sep 17 00:00:00 2001
+From: Adam Jackson <ajax@redhat.com>
+Date: Wed, 29 Aug 2018 11:04:23 -0400
+Subject: [PATCH] Refuse to run on UEFI machines
+
+No possible good can come of this.
+
+v2: Check for .../efi-framebuffer.0 ("is there an EFI framebuffer")
+instead of /sys/firmware/efi ("is this an EFI machine"). Suggested by
+Peter Jones.
+
+Upstream-Status: Backport [https://gitlab.freedesktop.org/xorg/driver/xf86-video-vesa]
+
+Reviewed-by: Peter Jones <pjones@redhat.com>
+Signed-off-by: Adam Jackson <ajax@redhat.com>
+Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
+---
+ src/vesa.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/src/vesa.c b/src/vesa.c
+index 9b65b9b..af750e2 100644
+--- a/src/vesa.c
++++ b/src/vesa.c
+@@ -43,7 +43,7 @@
+ #endif
+ 
+ #include <string.h>
+-
++#include <unistd.h>
+ #include "vesa.h"
+ 
+ /* All drivers initialising the SW cursor need this */
+@@ -450,7 +450,14 @@ VESAPciProbe(DriverPtr drv, int entity_num, struct pci_device *dev,
+ 	     intptr_t match_data)
+ {
+     ScrnInfoPtr pScrn;
+-    
++
++#ifdef __linux__
++    if (access("/sys/devices/platform/efi-framebuffer.0", F_OK) == 0) {
++        ErrorF("vesa: Refusing to run on UEFI\n");
++        return FALSE;
++    }
++#endif
++
+     pScrn = xf86ConfigPciEntity(NULL, 0, entity_num, NULL, 
+ 				NULL, NULL, NULL, NULL, NULL);
+     if (pScrn != NULL) {
+-- 
+2.20.1
+
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
index 9a110148d8..f6aa54456c 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.4.0.bb
@@ -17,3 +17,7 @@ RRECOMMENDS_${PN} += "xserver-xorg-module-libint10"
 
 SRC_URI[md5sum] = "8134201beaf6f77150c7809c3cc802e6"
 SRC_URI[sha256sum] = "bf443c94d7bf6cd4e248f8a3147f4647be04dc4c80250d9405006263bbdee38c"
+
+SRC_URI += " \
+    file://0001-Refuse-to-run-on-UEFI-machines.patch \
+    "
-- 
2.20.1


