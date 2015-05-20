Return-Path: <anibal.limon@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 14DB8601E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 May 2015 18:43:03 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 20 May 2015 11:43:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,465,1427785200"; d="scan'208";a="732620213"
Received: from alimon-thinkpad-w540.zpn.intel.com ([10.219.4.36])
	by orsmga002.jf.intel.com with ESMTP; 20 May 2015 11:43:04 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 May 2015 13:44:18 -0500
Message-Id: <1432147458-28773-1-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCHv2] xserver-nodm: Support reboot from inside X
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
X-List-Received-Date: Wed, 20 May 2015 18:43:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>

If reboot was called from inside the Xserver there could happen a race
condition where chvt would never end, and therefore the whole system was
stalled.

The user could not recover the system by ssh the machine or using the
keyboard.

Running chvt in background fixes the issue.

Also move sleep 1s inside stop to give time for killproc xinit for
fix issue when chvt 1 don't work because X server is still running.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
index 2e3e090..bfa0a8d 100755
--- a/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
+++ b/meta/recipes-graphics/x11-common/xserver-nodm-init/xserver-nodm
@@ -48,12 +48,12 @@ case "$1" in
   stop)
         echo "Stopping XServer"
         killproc xinit
-        chvt 1
+        sleep 1
+        chvt 1 &
   ;;
 
   restart)
 	$0 stop
-        sleep 1
         $0 start
   ;;
 
-- 
1.9.1


