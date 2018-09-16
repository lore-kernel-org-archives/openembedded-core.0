Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6EC8779813
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 05:45:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w8G5jthS028659
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 22:45:55 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 22:45:54 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Sep 2018 22:45:31 -0700
Message-ID: <20180916054532.1312-3-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180916054532.1312-1-hongzhi.song@windriver.com>
References: <20180916054532.1312-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] udev-extraconf/mount.sh: Fix the recursively dependency for the systemd-mount
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
X-List-Received-Date: Sun, 16 Sep 2018 05:45:54 -0000
Content-Type: text/plain

If systemd is used, using the systemd-mount to mount the new added disk
partitions forgets to move the codes which tries to mount the partition
by using the configuration in /etc/fstab to the non-systemd function.

And it will cause the systemd-mount try to mount the partition
synchronously and trigger a recursively dependency like the following:
    dev-sda1.device -> run-media-sda1.mount -> dev-sda1.device

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 27 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 5a877dd7ed..4cb5db3a9b 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -60,7 +60,17 @@ automount_systemd() {
 automount() {
 	name="`basename "$DEVNAME"`"
 
-	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+    if [ -x "$PMOUNT" ]; then
+    $PMOUNT $DEVNAME 2> /dev/null
+    elif [ -x $MOUNT ]; then
+    $MOUNT $DEVNAME 2> /dev/null
+    fi
+
+    # If the device isn't mounted at this point, it isn't
+    # configured in fstab
+    grep -q "^$DEVNAME " /proc/mounts && return
+
+    ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
 	then
@@ -102,19 +112,14 @@ rm_dir() {
 name="`basename "$DEVNAME"`"
 [ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
 if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
-	if [ -x "$PMOUNT" ]; then
-		$PMOUNT $DEVNAME 2> /dev/null
-	elif [ -x $MOUNT ]; then
-    		$MOUNT $DEVNAME 2> /dev/null
-	fi
-	# If the device isn't mounted at this point, it isn't
-	# configured in fstab (note the root filesystem can show up as
-	# /dev/root in /proc/mounts, so check the device number too)
+
+    # Note the root filesystem can show up as /dev/root in /proc/mounts,
+    # so check the device number too
 	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
 		if [ "`basename $MOUNT`" = "systemd-mount" ];then
-			grep -q "^$DEVNAME " /proc/mounts || automount_systemd
+			automount_systemd
 		else
-			grep -q "^$DEVNAME " /proc/mounts || automount
+			automount
 		fi
 	fi
 fi
-- 
2.11.0


