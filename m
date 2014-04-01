Return-Path: <denis@denix.org>
Received: from vms173025pub.verizon.net (vms173025pub.verizon.net
	[206.46.173.25])
	by mail.openembedded.org (Postfix) with ESMTP id A948B6AFB5
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 03:54:12 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173025.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N3C00BF42UDYY00@vms173025.mailsrvcs.net> for
	openembedded-core@lists.openembedded.org;
	Mon, 31 Mar 2014 22:54:13 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id 245CC2009B; Mon,
	31 Mar 2014 23:54:13 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Mar 2014 23:54:11 -0400
Message-id: <1396324451-26983-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 1.9.1
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: [PATCH v2] udev-extraconf: update mount.sh to use /run/media instead of /media
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
X-List-Received-Date: Tue, 01 Apr 2014 03:54:16 -0000

From: Denys Dmytriyenko <denys@ti.com>

This is done to work around the issue of auto-mounting block devices
(i.e. SD cards) when root filesystem is still in read-only mode and
creating /media/<device> mount-points by udev is not possible. That
is due to udev (/etc/rcS.d/S03udev) getting started earlier than
checkroot (/etc/rcS.d/S10checkroot.sh) gets a chance to re-mount the
rootfs as read-write.

Although, canonical FHS specifies /media/<device> as a mount point
for removable media devices, the latest 2.3 version was released in
2004 and since then FreeDesktop/udisks and other tools adopted the
new /run/media/<user>/<device> location. That was done to overcome
read-only rootfs limitation, since /run is usually a tmpfs mounted
partition, plus avoid name-clash between users.

For our embedded systems environment we assume single-user operation
and hence simplify mount point to just /run/media/<device>. But for
proper per-user mounting to /run/media/<user>/<device>, some sort of
session management is required along with the tool like udisks, that
is out of scope of this simple udev-based auto-mounting.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
v2 - drop PR, bump PV, elaborate on session/user mounting option

 meta/recipes-core/udev/udev-extraconf/mount.sh             | 14 +++++++-------
 .../udev/{udev-extraconf_1.0.bb => udev-extraconf_1.1.bb}  |  2 --
 2 files changed, 7 insertions(+), 9 deletions(-)
 rename meta/recipes-core/udev/{udev-extraconf_1.0.bb => udev-extraconf_1.1.bb} (99%)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index cb57e47..3e4f21f 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -20,7 +20,7 @@ done
 automount() {	
 	name="`basename "$DEVNAME"`"
 
-	! test -d "/media/$name" && mkdir -p "/media/$name"
+	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
 	then
@@ -38,12 +38,12 @@ automount() {
 		;;
 	esac
 
-	if ! $MOUNT -t auto $DEVNAME "/media/$name"
+	if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
 	then
-		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
-		rm_dir "/media/$name"
+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
+		rm_dir "/run/media/$name"
 	else
-		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
+		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
 		touch "/tmp/.automount-$name"
 	fi
 }
@@ -60,7 +60,7 @@ rm_dir() {
 
 # No ID_FS_TYPE for cdrom device, yet it should be mounted
 name="`basename "$DEVNAME"`"
-[ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
+[ -e /sys/block/$name/device/run/media ] && media_type=`cat /sys/block/$name/device/run/media`
 
 if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
 	if [ -x "$PMOUNT" ]; then
@@ -87,5 +87,5 @@ if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	
 	# Remove empty directories from auto-mounter
 	name="`basename "$DEVNAME"`"
-	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
+	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
 fi
diff --git a/meta/recipes-core/udev/udev-extraconf_1.0.bb b/meta/recipes-core/udev/udev-extraconf_1.1.bb
similarity index 99%
rename from meta/recipes-core/udev/udev-extraconf_1.0.bb
rename to meta/recipes-core/udev/udev-extraconf_1.1.bb
index 3810b28..d69056d 100644
--- a/meta/recipes-core/udev/udev-extraconf_1.0.bb
+++ b/meta/recipes-core/udev/udev-extraconf_1.1.bb
@@ -4,8 +4,6 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
-PR = "r16"
-
 SRC_URI = " \
        file://automount.rules \
        file://mount.sh \
-- 
1.9.1


