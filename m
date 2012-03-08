Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1S5dLg-0003vp-Ot
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Mar 2012 14:25:40 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Mar 2012 13:08:50 +0100
Message-Id: <1331208530-11938-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] udev-164: don't hardcode path to pidof
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Mar 2012 13:25:40 -0000

* pidof lives in /bin, search it in $PATH.
* Assume pidof's presence.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-core/udev/udev/init   |    6 ++----
 meta/recipes-core/udev/udev_164.bb |    2 +-
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 78b5b1c..f9e9014 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -28,10 +28,8 @@ readfile () {
 }
 
 kill_udevd() {
-	if [ -x /sbin/pidof ]; then
-		pid=`/sbin/pidof -x udevd`
-		[ -n "$pid" ] && kill $pid
-	fi
+	pid=`pidof -x udevd`
+	[ -n "$pid" ] && kill $pid
 }
 
 export ACTION=add
diff --git a/meta/recipes-core/udev/udev_164.bb b/meta/recipes-core/udev/udev_164.bb
index b993a13..d661044 100644
--- a/meta/recipes-core/udev/udev_164.bb
+++ b/meta/recipes-core/udev/udev_164.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r11"
+PR = "r12"
 
 SRC_URI += "file://udev-166-v4l1-1.patch"
 
-- 
1.7.5.4



