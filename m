Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SK5vq-0007Da-QP
	for openembedded-core@lists.openembedded.org;
	Tue, 17 Apr 2012 12:46:46 +0200
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Apr 2012 12:37:17 +0200
Message-Id: <1334659037-5186-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCH] avahi-daemon: fix missing init script links
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
X-List-Received-Date: Tue, 17 Apr 2012 10:46:46 -0000

* update-rc.d wasn't executed when the rootfs was built, because
  pkg_postinst_avahi-daemon exited early. It wasn't run either
  on first boot, because the exit code was 0.

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
 meta/recipes-connectivity/avahi/avahi.inc |    9 ++++-----
 1 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-connectivity/avahi/avahi.inc b/meta/recipes-connectivity/avahi/avahi.inc
index 731ad9a..61ca25f 100644
--- a/meta/recipes-connectivity/avahi/avahi.inc
+++ b/meta/recipes-connectivity/avahi/avahi.inc
@@ -14,7 +14,7 @@ SECTION = "network"
 # python scripts are under GPLv2+
 LICENSE = "GPLv2+ & LGPLv2.1+"
 
-INC_PR = "r1"
+INC_PR = "r2"
 
 DEPENDS = "expat libcap libdaemon dbus glib-2.0"
 
@@ -123,17 +123,16 @@ do_install_avahi-autoipd() {
 }
 
 # At the time the postinst runs, dbus might not be setup so only restart if running 
+# Don't exit early, because update-rc.d needs to run subsequently.
 
 pkg_postinst_avahi-daemon () {
-	if [ "x$D" != "x" ]; then
-		exit 0
-	fi
-
+if [ -z "$D" ]; then
 	DBUSPID=`pidof dbus-daemon`
 
 	if [ "x$DBUSPID" != "x" ]; then
 		/etc/init.d/dbus-1 force-reload
 	fi
+fi
 }
 
 pkg_postinst_avahi-autoipd () {
-- 
1.7.5.4



