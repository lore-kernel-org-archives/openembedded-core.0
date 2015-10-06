Return-Path: <clopez@igalia.com>
Received: from smtp4.mundo-r.com (smtp3.mundo-r.com [212.51.32.191])
	by mail.openembedded.org (Postfix) with ESMTP id 6929875CF1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Oct 2015 15:00:21 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: A2CUAwAP4RNW/5tjdVteHASDBwGBQa1vjBOEIgENgVoShz84FAEBAQEBAQGBCoZ1iDIBm1akJIZziUBphBcFhy2FW4Exh0uIB4UQiRCSXh8BAUKBSgELgi48M4g/AQEB
X-IPAS-Result: A2CUAwAP4RNW/5tjdVteHASDBwGBQa1vjBOEIgENgVoShz84FAEBAQEBAQGBCoZ1iDIBm1akJIZziUBphBcFhy2FW4Exh0uIB4UQiRCSXh8BAUKBSgELgi48M4g/AQEB
X-IronPort-AV: E=Sophos;i="5.17,644,1437429600"; d="scan'208";a="31209432"
Received: from fanzine.igalia.com ([91.117.99.155])
	by smtp4.mundo-r.com with ESMTP; 06 Oct 2015 17:00:20 +0200
Received: from [192.168.10.149] (helo=trinity.local.igalia.com)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.0:RSA_AES_128_CBC_SHA1:16) (Exim)
	id 1ZjTj2-0004D4-CL; Tue, 06 Oct 2015 17:00:20 +0200
From: Carlos Alberto Lopez Perez <clopez@igalia.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Oct 2015 17:00:20 +0200
Message-Id: <1444143620-7764-1-git-send-email-clopez@igalia.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] machine/qemu: Fix OpenGL/GLX support with xserver-xorg.
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
X-List-Received-Date: Tue, 06 Oct 2015 15:00:24 -0000

  * The Xorg server needs to load the GLX extension in order to
    enable proper OpenGL support.

  * Before this patch, glxinfo aborted with:

      root@qemux86:~# glxinfo
      name of display: :0.0
      Error: couldn't find RGB GLX visual or fbconfig

  * After this patch, it works as expected:

      root@qemux86:~# glxinfo | grep " render"
      direct rendering: Yes
      OpenGL renderer string: Software Rasterizer

Signed-off-by: Carlos Alberto Lopez Perez <clopez@igalia.com>
---
 meta/conf/machine/include/qemu.inc | 2 +-
 meta/conf/machine/qemux86-64.conf  | 2 +-
 meta/conf/machine/qemux86.conf     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/conf/machine/include/qemu.inc b/meta/conf/machine/include/qemu.inc
index d5c0b37..16e9469 100644
--- a/meta/conf/machine/include/qemu.inc
+++ b/meta/conf/machine/include/qemu.inc
@@ -5,7 +5,7 @@ PREFERRED_PROVIDER_virtual/libgles1 ?= "mesa"
 PREFERRED_PROVIDER_virtual/libgles2 ?= "mesa"
 
 XSERVER ?= "xserver-xorg \
-            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+            ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
             xf86-input-evdev \
             xf86-input-mouse \
             xf86-video-fbdev \
diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index a4fd43c..489194a 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -16,7 +16,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
diff --git a/meta/conf/machine/qemux86.conf b/meta/conf/machine/qemux86.conf
index 96cea66..3cc8091 100644
--- a/meta/conf/machine/qemux86.conf
+++ b/meta/conf/machine/qemux86.conf
@@ -15,7 +15,7 @@ KERNEL_IMAGETYPE = "bzImage"
 SERIAL_CONSOLES = "115200;ttyS0 115200;ttyS1"
 
 XSERVER = "xserver-xorg \
-           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast', '', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'opengl', 'mesa-driver-swrast xserver-xorg-extension-glx', '', d)} \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
-- 
2.1.4


