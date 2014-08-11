Return-Path: <max.eliaser@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C3D8065CC1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Aug 2014 22:06:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 11 Aug 2014 15:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,844,1400050800"; d="scan'208";a="557081003"
Received: from maxtothemax-studio-xps-8000.jf.intel.com ([10.7.196.63])
	by orsmga001.jf.intel.com with ESMTP; 11 Aug 2014 15:05:24 -0700
From: Max Eliaser <max.eliaser@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Aug 2014 15:03:07 -0700
Message-Id: <c3eb0953d0bac491b07435c38a13a3f3b64050f5.1407794494.git.max.eliaser@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <cover.1407794494.git.max.eliaser@intel.com>
References: <cover.1407794494.git.max.eliaser@intel.com>
In-Reply-To: <cover.1407794494.git.max.eliaser@intel.com>
References: <cover.1407794494.git.max.eliaser@intel.com>
Subject: [PATCH 3/3] qemux86-64: support X11 when QEMU is emulating a different GPU than vmware
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
X-List-Received-Date: Mon, 11 Aug 2014 22:06:40 -0000

QEMU is capable of emulating four different VGA adapters: cirrus, std, vmware,
and QXL. By adding the cirrus and fbdev X.Org drivers to the qemux86-64 image,
the image can be made to launch an X server on when cirrus and std are chosen,
in addition to just vmware. (The build of QEMU in OE-Core appears to have QXL
disabled, meaning a driver for it is unnecessary.)

The runqemu script now allows the choice of emulated VGA adapter to be
specified manually, so it's important that qemux86-64 supports any
configuration the user might choose without requiring the image to be rebuilt.

In addition to adding the two extra drivers to the qemux86-64 image, a section
specifying the driver to use is deleted from the image's xorg.conf, allowing
the X server to automatically select the most appropriate driver. Testing
shows that it does always pick the correct one.

Signed-off-by: Max Eliaser <max.eliaser@intel.com>
---
 meta/conf/machine/qemux86-64.conf                                    | 2 ++
 .../xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf            | 5 -----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 642a2d9..837f9f4 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -20,6 +20,8 @@ XSERVER = "xserver-xorg \
            xf86-input-vmmouse \
            xf86-input-keyboard \
            xf86-input-evdev \
+           xf86-video-cirrus \
+           xf86-video-fbdev \
            xf86-video-vmware"
 
 MACHINE_FEATURES += "x86"
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
index 10a6d9a..bbda9ea 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
@@ -30,11 +30,6 @@ Section "InputDevice"
     Option        "USB"           "on"
 EndSection
 
-Section "Device"
-    Identifier    "Graphics Controller"
-    Driver        "vmware"
-EndSection
-
 Section "Monitor"
     Identifier    "Generic Monitor"
     Option        "DPMS"
-- 
1.8.3.2


