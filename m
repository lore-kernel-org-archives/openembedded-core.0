Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7BC9474743
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Apr 2018 07:28:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w397SuYB013912
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Apr 2018 00:28:57 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 9 Apr 2018 00:28:55 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 9 Apr 2018 03:28:34 -0400
Message-ID: <1523258914-12621-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] udev-extraconf: Add systemd-mount to mount.sh
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
X-List-Received-Date: Mon, 09 Apr 2018 07:28:56 -0000
Content-Type: text/plain

This patch fixs the problem that block devices unable to be formatted when
systemd and udev-extraconf recipes added into rootfs.

If we add systemd and udev-extraconf recipes into rootfs:
    VIRTUAL-RUNTIME_init_manager = "systemd"
    DISTRO_FEATURES_append = " systemd"
    DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
    KERNEL_FEATURES_append = " cfg/systemd.scc"
    IMAGE_INSTALL_append = " udev-extraconf"
    IMAGE_FSTYPES += "tar.bz2 ext4"
    IMAGE_INSTALL_append = " e2fsprogs-mke2fs"
then systemd-udevd.service will invoke udev rules to automount block devices
any probed under itself private namespace, this behavior results in host space
can't format those devices. And host space can't find where the device is used.
Such as:
    root@qemux86:~# mkfs.ext4 /dev/sda1
    mke2fs 1.43.8 (1-Jan-2018)
    /dev/sda1 contains a ext4 file system
	    last mounted on Tue Apr  3 06:22:41 2018
    Proceed anyway? (y,N) y
    /dev/sda1 is apparently in use by the system; will not make a filesystem here!

Command systemd-mount recommended by systemd maintainer instead of command mount
will fix the problem brought with private namespace. Systemd-mount request the
mount operation to be executed by PID 1, and hence host space can access the block
devices.

[YOCTO #12644]

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/mount.sh | 141 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 meta/recipes-core/udev/mount.sh

diff --git a/meta/recipes-core/udev/mount.sh b/meta/recipes-core/udev/mount.sh
new file mode 100644
index 0000000..2fa2925
--- /dev/null
+++ b/meta/recipes-core/udev/mount.sh
@@ -0,0 +1,141 @@
+#!/bin/sh
+#
+# Called from udev
+#
+# Attempt to mount any added block devices and umount any removed devices
+
+
+BASE_INIT="`readlink "/sbin/init"`"
+INIT_SYSTEMD="/lib/systemd/systemd"
+
+if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
+	# systemd as init uses systemd-mount to mount block devices
+        MOUNT="/usr/bin/systemd-mount"
+        UMOUNT="/usr/bin/systemd-umount"
+
+        if [ -x $MOUNT ] && [ -x $UMOUNT ];
+        then
+                logger "Using systemd-mount to finish mount"
+        else
+                logger "Linux init is using systemd, so please install systemd-mount to finish mount"
+		exit 1
+        fi
+else
+        MOUNT="/bin/mount"
+        UMOUNT="/bin/umount"
+fi
+
+PMOUNT="/usr/bin/pmount"
+
+for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
+do
+	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
+	then
+		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
+		exit 0
+	fi
+done
+
+automount_systemd() {
+        name="`basename "$DEVNAME"`"
+
+        ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+        
+        MOUNT="$MOUNT -o silent"
+        
+        # If filesystemtype is vfat, change the ownership group to 'disk', and
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
+                #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
+                rm_dir "/run/media/$name"
+        else
+                logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
+                touch "/tmp/.automount-$name"
+        fi
+}
+
+automount() {	
+	name="`basename "$DEVNAME"`"
+
+	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+	# Silent util-linux's version of mounting auto
+	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
+	then
+		MOUNT="$MOUNT -o silent"
+	fi
+	
+	# If filesystem type is vfat, change the ownership group to 'disk', and
+	# grant it with  w/r/x permissions.
+	case $ID_FS_TYPE in
+	vfat|fat)
+		MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+		;;
+	# TODO
+	*)
+		;;
+	esac
+
+	if ! $MOUNT -t auto $DEVNAME "/run/media/$name"
+	then
+		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
+		rm_dir "/run/media/$name"
+	else
+		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
+		touch "/tmp/.automount-$name"
+	fi
+}
+	
+rm_dir() {
+	# We do not want to rm -r populated directories
+	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
+	then
+		! test -z "$1" && rm -r "$1"
+	else
+		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
+	fi
+}
+
+# No ID_FS_TYPE for cdrom device, yet it should be mounted
+name="`basename "$DEVNAME"`"
+[ -e /sys/block/$name/device/media ] && media_type=`cat /sys/block/$name/device/media`
+
+if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_type" = "cdrom" ]; then
+	if [ -x "$PMOUNT" ]; then
+		$PMOUNT $DEVNAME 2> /dev/null
+	elif [ -x $MOUNT ]; then
+    		$MOUNT $DEVNAME 2> /dev/null
+	fi
+	
+	# If the device isn't mounted at this point, it isn't
+	# configured in fstab (note the root filesystem can show up as
+	# /dev/root in /proc/mounts, so check the device number too)
+        if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
+                if [ "`basename $MOUNT`" = "systemd-mount" ];then
+                        grep -q "^$DEVNAME " /proc/mounts || automount_systemd
+                else
+                        grep -q "^$DEVNAME " /proc/mounts || automount
+                fi
+        fi
+fi
+
+
+if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
+	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
+	do
+		$UMOUNT $mnt
+	done
+	
+	# Remove empty directories from auto-mounter
+	name="`basename "$DEVNAME"`"
+	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
+fi
-- 
2.8.1


