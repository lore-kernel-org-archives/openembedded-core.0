Received: from ffm.saftware.de ([83.141.3.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <obi@opendreambox.org>) id 1SBX3x-0007Ax-8o
	for openembedded-core@lists.openembedded.org;
	Sat, 24 Mar 2012 20:55:45 +0100
From: Andreas Oberritter <obi@opendreambox.org>
To: openembedded-core@lists.openembedded.org
Date: Sat, 24 Mar 2012 20:46:47 +0100
Message-Id: <1332618407-30816-1-git-send-email-obi@opendreambox.org>
X-Mailer: git-send-email 1.7.5.4
Cc: martin.jansa@gmail.com
Subject: [PATCH] busybox: move watch to /usr/bin for compatibility with procps
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
X-List-Received-Date: Sat, 24 Mar 2012 19:55:45 -0000

Commit 68dc2a3fa30c03a196d650de34d0c657a7b85454 broke opkg upgrade:

| update-alternatives: Error: cannot register alternative watch to
| /usr/bin/watch since it is already registered to /bin/watch

Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
---
* Martin, can you please verify whether this really helps? I've built a
  rootfs with both busybox watch and procps installed. I didn't actually
  do an opkg upgrade.

 .../busybox/busybox-1.19.4/watch.in.usr-bin.patch  |   29 ++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.19.4.bb        |    3 +-
 2 files changed, 31 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch

diff --git a/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
new file mode 100644
index 0000000..e8e1edf
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox-1.19.4/watch.in.usr-bin.patch
@@ -0,0 +1,29 @@
+Upstream-Status: Inappropriate [configuration]
+
+From f2372ab626a395d067704f4c318180fb6039de15 Mon Sep 17 00:00:00 2001
+From: Andreas Oberritter <obi@opendreambox.org>
+Date: Sat, 24 Mar 2012 17:36:48 +0100
+Subject: [PATCH] watch: move from /bin to /usr/bin for compatibility with
+ procps
+
+Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
+---
+ include/applets.src.h |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/include/applets.src.h b/include/applets.src.h
+index 87d9cbb..c148a8c 100644
+--- a/include/applets.src.h
++++ b/include/applets.src.h
+@@ -404,7 +404,7 @@ IF_VLOCK(APPLET(vlock, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
+ IF_VOLNAME(APPLET(volname, BB_DIR_USR_BIN, BB_SUID_DROP))
+ /* Needs to be run by root or be suid root - needs to write to /dev/TTY: */
+ IF_WALL(APPLET(wall, BB_DIR_USR_BIN, BB_SUID_REQUIRE))
+-IF_WATCH(APPLET(watch, BB_DIR_BIN, BB_SUID_DROP))
++IF_WATCH(APPLET(watch, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_WATCHDOG(APPLET(watchdog, BB_DIR_SBIN, BB_SUID_DROP))
+ IF_WC(APPLET(wc, BB_DIR_USR_BIN, BB_SUID_DROP))
+ IF_WGET(APPLET(wget, BB_DIR_USR_BIN, BB_SUID_DROP))
+-- 
+1.7.5.4
+
diff --git a/meta/recipes-core/busybox/busybox_1.19.4.bb b/meta/recipes-core/busybox/busybox_1.19.4.bb
index dff616d..3f22669 100644
--- a/meta/recipes-core/busybox/busybox_1.19.4.bb
+++ b/meta/recipes-core/busybox/busybox_1.19.4.bb
@@ -1,5 +1,5 @@
 require busybox.inc
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://udhcpscript.patch \
@@ -8,6 +8,7 @@ SRC_URI = "http://www.busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://get_header_tar.patch \
            file://busybox-appletlib-dependency.patch \
            file://run-parts.in.usr-bin.patch \
+           file://watch.in.usr-bin.patch \
            file://busybox-udhcpc-no_deconfig.patch \
            file://find-touchscreen.sh \
            file://busybox-cron \
-- 
1.7.5.4



