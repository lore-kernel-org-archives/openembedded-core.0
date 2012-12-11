Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TiPNq-00039o-9U
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 13:56:26 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 11 Dec 2012 04:41:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,259,1355126400"; d="scan'208";a="229880194"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 11 Dec 2012 04:41:51 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 14:41:49 +0200
Message-Id: <1355229709-19296-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] x11vnc: bind vnc server to port 5900
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
X-List-Received-Date: Tue, 11 Dec 2012 12:56:26 -0000

At the moment, if one clicks on X11VNC Server icon, a new vnc server is
started on an automatically assigned port (starting with 5900). The
problem is that the user can click multiple times on the icon and a new
vnc server is started on another port. So, we'll end up with multiple
vnc servers, wasting memory.

This patch will restrict the x11vnc server port to 5900 (default VNC
port) and another process will not be started (because the port is
already used), unless the user chooses to start the server manually,
from the command line, in which case the port can be changed as the
user wishes.

[YOCTO #3369]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 .../x11vnc/files/starting-fix.patch                |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11vnc/files/starting-fix.patch b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
index 11c55e6..cfaa797 100644
--- a/meta/recipes-graphics/x11vnc/files/starting-fix.patch
+++ b/meta/recipes-graphics/x11vnc/files/starting-fix.patch
@@ -15,7 +15,7 @@ Index: x11vnc-0.9.12/x11vnc/x11vnc.desktop
  Name=X11VNC Server
  Comment=Share this desktop by VNC
 -Exec=x11vnc -gui tray=setpass -rfbport PROMPT -bg -o %%HOME/.x11vnc.log.%%VNCDISPLAY
-+Exec=x11vnc -bg -o %%HOME/.x11vnc.log.%%VNCDISPLAY
++Exec=x11vnc -bg -rfbport 5900 -o %%HOME/.x11vnc.log.%%VNCDISPLAY
  Icon=computer
  Terminal=false
  Type=Application
-- 
1.7.9.5



