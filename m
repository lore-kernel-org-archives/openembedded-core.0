Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEB70745A7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 02:50:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w722olc6006719
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 19:50:47 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 1 Aug 2018 19:50:47 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 19:50:37 -0700
Message-ID: <20180802025039.15748-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180802025039.15748-1-hongzhi.song@windriver.com>
References: <20180802025039.15748-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH v4 1/3] udev-extraconf/mount.sh: add support to systemd
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
X-List-Received-Date: Thu, 02 Aug 2018 02:50:46 -0000
Content-Type: text/plain

Udev-extraconf works correctly with sysvinit in the aspect of automounting
block devices. But it has a serious problem in case of systemd. Block devices
automounted by udev is unaccessible to host space(out of udevd's private
namespace). For example, we cannot format those block devices.

e.g.
    root@qemux86:~# mkfs.ext4 /dev/sda1
    mke2fs 1.43.8
    /dev/sda1 contains a ext4 file system
    last mounted on Tue Apr
    Proceed anyway? (y,N) y
    /dev/sda1 is apparently in use by the system; will not make a filesystem here!

Other distributions has no such problem, because they use a series of rules to
manager block devices. Different types of block devices match different rules.
But udev-extraconf just use one rule, automount.rules, which results in this
problem.

The 'systemd-mount' command is recommended by the systemd community to solve such
problems.

This patch makes use of 'systemd-mount' to solve the above problem.

[YOCTO #12644]

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 55 +++++++++++++++++++++++---
 1 file changed, 50 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index d760328a09..3a72c455e0 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -4,10 +4,26 @@
 #
 # Attempt to mount any added block devices and umount any removed devices
 
+BASE_INIT="`readlink "/sbin/init"`"
+INIT_SYSTEMD="/lib/systemd/systemd"
+
+if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
+        MOUNT="/usr/bin/systemd-mount"
+        UMOUNT="/usr/bin/systemd-umount"
+
+        if [ -x $MOUNT ] && [ -x $UMOUNT ];
+        then
+                logger "Using systemd-mount to finish mount"
+        else
+                logger "Linux init is using systemd, so please install systemd-mount to finish mount"
+        fi
+else
+        MOUNT="/bin/mount"
+        UMOUNT="/bin/umount"
+fi
 
-MOUNT="/bin/mount"
 PMOUNT="/usr/bin/pmount"
-UMOUNT="/bin/umount"
+
 for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
@@ -17,6 +33,33 @@ do
 	fi
 done
 
+automount_systemd() {
+	name="`basename "$DEVNAME"`"
+
+        ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+        # Silent util-linux's version of mounting auto
+        MOUNT="$MOUNT -o silent"
+        
+        # If filesystem type is vfat, change the ownership group to 'disk', and
+        # grant it with  w/r/x permissions.
+        case $ID_FS_TYPE in
+        vfat|fat)
+                MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+                ;;
+        # TODO
+        *)
+                ;;
+        esac
+
+        if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
+        then
+                rm_dir "/run/media/$name"
+        else
+                logger "mount.sh/automount" "systemd-mount of [/run/media/$name] successful"
+                touch "/tmp/.automount-$name"
+        fi
+}
+
 automount() {	
 	name="`basename "$DEVNAME"`"
 
@@ -61,19 +104,21 @@ rm_dir() {
 # No ID_FS_TYPE for cdrom device, yet it should be mounted
 name="`basename "$DEVNAME"`"
 [ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
-
 if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
 	if [ -x "$PMOUNT" ]; then
 		$PMOUNT $DEVNAME 2> /dev/null
 	elif [ -x $MOUNT ]; then
     		$MOUNT $DEVNAME 2> /dev/null
 	fi
-	
 	# If the device isn't mounted at this point, it isn't
 	# configured in fstab (note the root filesystem can show up as
 	# /dev/root in /proc/mounts, so check the device number too)
 	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
-		grep -q "^$DEVNAME " /proc/mounts || automount
+		if [ "`basename $MOUNT`" = "systemd-mount" ];then
+			grep -q "^$DEVNAME " /proc/mounts || automount_systemd
+		else
+			grep -q "^$DEVNAME " /proc/mounts || automount
+		fi
 	fi
 fi
 
-- 
2.11.0


