Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ddalex@intel.com>) id 1UFop8-0007Qp-UM
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Mar 2013 17:46:46 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Mar 2013 09:29:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,838,1355126400"; d="scan'208";a="214074857"
Received: from adamian-desktop.rb.intel.com ([10.237.105.51])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Mar 2013 09:29:57 -0700
Received: by adamian-desktop.rb.intel.com (Postfix, from userid 1000)
	id 61ED25608C0; Wed, 13 Mar 2013 18:30:09 +0200 (EET)
From: Alex DAMIAN <alexandru.damian@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 13 Mar 2013 18:30:08 +0200
Message-Id: <1363192208-29115-1-git-send-email-alexandru.damian@intel.com>
X-Mailer: git-send-email 1.7.10.4
Cc: Alexandru DAMIAN <alexandru.damian@intel.com>
Subject: [PATCH] Xorg configuration change default resolution
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
X-List-Received-Date: Wed, 13 Mar 2013 16:46:49 -0000

From: Alexandru DAMIAN <alexandru.damian@intel.com>

This is a workaround for the starts-to-magenta problem
when starting Xorg-based images in QEMUX86 and X86_64.

The root cause is that the Qemu vmware vga driver
doesn't pick up a pixel depth change without a resolution
change.

So a resolution change from the console 640x480 is forced,
moving the Xorg screen to 800x600. Xrandr works correctly
afterwards, so a manual revert to 640x480 is possible.

Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>
---
 .../xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf            |    2 +-
 .../xorg-xserver/xserver-xf86-config/qemux86/xorg.conf               |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
index 10a6d9a..67600d9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86-64/xorg.conf
@@ -55,7 +55,7 @@ Section "Screen"
     Device        "Graphics Controller"
     Monitor        "Generic Monitor"
     SubSection "Display"
-        Modes     "640x480"
+        Modes     "800x600" "640x480"
     EndSubSection
 EndSection
 
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
index 10a6d9a..67600d9 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/qemux86/xorg.conf
@@ -55,7 +55,7 @@ Section "Screen"
     Device        "Graphics Controller"
     Monitor        "Generic Monitor"
     SubSection "Display"
-        Modes     "640x480"
+        Modes     "800x600" "640x480"
     EndSubSection
 EndSection
 
-- 
1.7.10.4



