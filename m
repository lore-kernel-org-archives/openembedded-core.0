Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3C2FA6E20F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Jan 2014 14:25:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 16 Jan 2014 06:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,668,1384329600"; d="scan'208";a="439836829"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga001.jf.intel.com with ESMTP; 16 Jan 2014 06:25:12 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Jan 2014 16:25:08 +0200
Message-Id: <6bfb77b03055a1694a505a1b80d96c7d1f30a1d0.1389882270.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1389882270.git.laurentiu.palcu@intel.com>
References: <cover.1389882270.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1389882270.git.laurentiu.palcu@intel.com>
References: <cover.1389882270.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/1] x11vnc: fix CAPS_LOCK issues
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
X-List-Received-Date: Thu, 16 Jan 2014 14:25:32 -0000

Currently, pressing CAPS_LOCK on the viewer changes the lock state on
the server and the key will not change the case.

To fix this, use -skip_lockkeys option to ignore all Caps_Lock,
Shift_Lock, Num_Lock, Scroll_Lock keysyms received from viewers, in
order to leave the lock state on the server side unchanged. However, the
keys will appear correctly on the remote side.

[YOCTO #4149]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../x11vnc/files/starting-fix.patch                |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11vnc/files/starting-fix.patch b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
index cfaa797..f62e405 100644
--- a/meta/recipes-graphics/x11vnc/files/starting-fix.patch
+++ b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
@@ -1,8 +1,12 @@
 "-gui" & "-rfbport" require "wish" installed, or else x11vnc fails to start.
 Removing these 2 parameters makes x11vnc works well on poky sato image.
 
+Add also -skip_lockkeys option to ignore all Caps_Lock, Shift_Lock, Num_Lock,
+Scroll_Lock keysyms received from viewers, in order to leave the lock state on
+the server side unchanged. Yet, the keys will appear correctly.
 
 Signed-off-by: Zhai Edwin <edwin.zhai@intel.com>
+Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
 
 Upstream-Status: Inappropriate [configuration]
 
@@ -15,7 +19,7 @@ Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
  Name=X11VNC Server
  Comment=Share this desktop by VNC
 -Exec=x11vnc -gui tray=setpass -rfbport PROMPT -bg -o %%HOME/.x11vnc.log.%%VNCDISPLAY
-+Exec=x11vnc -bg -rfbport 5900 -o %%HOME/.x11vnc.log.%%VNCDISPLAY
++Exec=x11vnc -bg -rfbport 5900 -skip_lockkeys -o %%HOME/.x11vnc.log.%%VNCDISPLAY
  Icon=computer
  Terminal=false
  Type=Application
-- 
1.7.9.5


