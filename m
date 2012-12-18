Received: from mx.mailsparr.se ([212.112.184.237])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <johan.hovold@lundinova.se>) id 1Tl1ka-0000bs-MM
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 19:18:44 +0100
Received: from pi (unknown [92.33.14.100])
	by mx.mailsparr.se (Halon Mail Gateway) with ESMTPSA;
	Tue, 18 Dec 2012 18:48:47 +0100 (CET)
Received: from johan by pi with local (Exim 4.80.1) (envelope-from <johan@pi>)
	id 1Tl1HZ-0001BL-BW; Tue, 18 Dec 2012 18:48:45 +0100
From: Johan Hovold <johan.hovold@lundinova.se>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Dec 2012 18:46:19 +0100
Message-Id: <1355852779-4266-1-git-send-email-johan.hovold@lundinova.se>
X-Mailer: git-send-email 1.8.0.2
Sender: <johan.hovold@lundinova.se>
Subject: [PATCH] udev: fix failed /dev/shm mount
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
X-List-Received-Date: Tue, 18 Dec 2012 18:18:44 -0000

Since commit commit fbec192f6bc4 ("udev: Ensure tmpfs are mounted and
volatile/run exists") all tmpfs-entries in fstab are mounted before udev
starts using mount -a. If /dev/shm is among those entries, that mount
will fail as the mount point has not yet been created:

   Starting udev
   mount: mounting tmpfs on /dev/shm failed: No such file or directory
   udevd[474]: starting version 182

Fix by restoring the old way of mounting /dev and mounting the
remaining tmpfs-entries only after /dev/shm has been created.

Also make sure that any errors are supressed for these tmpfs-mounts.
Should any mount point not yet be present, that mount will be retried
later during the boot process.

Signed-off-by: Johan Hovold <johan.hovold@lundinova.se>
---

 meta/recipes-core/udev/udev/init   | 7 +++++--
 meta/recipes-core/udev/udev_182.bb | 2 +-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/udev/udev/init b/meta/recipes-core/udev/udev/init
index 74449fe..1934d11 100644
--- a/meta/recipes-core/udev/udev/init
+++ b/meta/recipes-core/udev/udev/init
@@ -37,10 +37,13 @@ export ACTION=add
 echo "Starting udev"
 
 # mount the tmpfs on /dev, if not already done
-mount -a -t tmpfs
-mkdir -p /var/volatile/run
+LANG=C awk '$2 == "/dev" && ($3 == "tmpfs" || $3 == "devtmpfs") { exit 1 }' /proc/mounts && {
+	mount -n -o mode=0755 -t tmpfs none "/dev"
+}
 [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
 [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
+mount -a -t tmpfs 2>/dev/null
+mkdir -p /var/volatile/run
 
 # cache handling
 if [ "$DEVCACHE" != "" ]; then
diff --git a/meta/recipes-core/udev/udev_182.bb b/meta/recipes-core/udev/udev_182.bb
index c41de9f..0ae9f8c 100644
--- a/meta/recipes-core/udev/udev_182.bb
+++ b/meta/recipes-core/udev/udev_182.bb
@@ -1,6 +1,6 @@
 include udev.inc
 
-PR = "r2"
+PR = "r3"
 
 # module-init-tools from kmod_git will provide libkmod runtime
 DEPENDS += "module-init-tools"
-- 
1.8.0.2



