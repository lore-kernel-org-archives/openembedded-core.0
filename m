Return-Path: <Kexin.Hao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AA47479C23
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 12:07:26 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w9MC7RDY023924
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2018 05:07:27 -0700 (PDT)
Received: from pek-lpggp6.wrs.com (128.224.153.40) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 22 Oct 2018 05:07:26 -0700
From: Kevin Hao <kexin.hao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Oct 2018 19:58:39 +0800
Message-ID: <20181022115840.38029-3-kexin.hao@windriver.com>
X-Mailer: git-send-email 2.14.4
In-Reply-To: <20181022115840.38029-1-kexin.hao@windriver.com>
References: <20181022115840.38029-1-kexin.hao@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] udev-extraconf: Fix the recursively dependency for the systemd-mount
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
X-List-Received-Date: Mon, 22 Oct 2018 12:07:26 -0000
Content-Type: text/plain

The commit 4ca9402c3720 ("udev-extraconf: Add systemd-mount to
udev-extraconf/mount.sh") uses the systemd-mount to mount the new added
disk partitions if systemd is used. But it forgot to move the codes
which tries to mount the partition by using the configuration in
/etc/fstab to the non-systemd function. And it will cause the
systemd-mount try to mount the partition synchronously and trigger a
recursively dependency like the following:
    dev-sda1.device -> run-media-sda1.mount -> dev-sda1.device

Signed-off-by: Kevin Hao <kexin.hao@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index 34ef98a6a882..afb368dd6737 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -66,6 +66,16 @@ automount_systemd() {
 automount() {
 	name="`basename "$DEVNAME"`"
 
+	if [ -x "$PMOUNT" ]; then
+		$PMOUNT $DEVNAME 2> /dev/null
+	elif [ -x $MOUNT ]; then
+		$MOUNT $DEVNAME 2> /dev/null
+	fi
+
+	# If the device isn't mounted at this point, it isn't
+	# configured in fstab
+	grep -q "^$DEVNAME " /proc/mounts && return
+
 	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
 	# Silent util-linux's version of mounting auto
 	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
@@ -109,20 +119,13 @@ name="`basename "$DEVNAME"`"
 [ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
 
 if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
-	if [ -x "$PMOUNT" ]; then
-		$PMOUNT $DEVNAME 2> /dev/null
-	elif [ -x $MOUNT ]; then
-    		$MOUNT $DEVNAME 2> /dev/null
-	fi
-
-	# If the device isn't mounted at this point, it isn't
-	# configured in fstab (note the root filesystem can show up as
-	# /dev/root in /proc/mounts, so check the device number too)
+    # Note the root filesystem can show up as /dev/root in /proc/mounts,
+    # so check the device number too
     if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
         if [ "`basename $MOUNT`" = "systemd-mount" ];then
-            grep -q "^$DEVNAME " /proc/mounts || automount_systemd
+            automount_systemd
         else
-            grep -q "^$DEVNAME " /proc/mounts || automount
+            automount
         fi
     fi
 fi
-- 
2.14.4


