Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B489060102
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Mar 2018 10:55:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w26At7VY029002
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 6 Mar 2018 02:55:07 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Tue, 6 Mar 2018 02:54:34 -0800
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 6 Mar 2018 05:54:54 -0500
Message-ID: <1520333694-68182-1-git-send-email-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] systemd-udev: Add systemd-mount to mount.sh
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
X-List-Received-Date: Tue, 06 Mar 2018 10:55:06 -0000
Content-Type: text/plain

Issue: mkfs.ext4 </dev/storage-device-name> fails, prompting that the device
is in use by the system. But there is no mounted infomation in /proc/mounts.

Reproduce: Be sure that there is storage device connected to you machine.

	Boot the machine.
	root@intel-x86-64:~# mkfs.ext4 /dev/mmcblk0p1
	mke2fs 1.43.5 (04-Aug-2017)
	/dev/mmcblk0p1 contains a ext2 file system
	last mounted on / on Tue Jan 9 05:24:36 2018
	Proceed anyway? (y,N) y
	/dev/mmcblk0p1 is apparently in use by the system; will not make a filesystem here!

	root@intel-x86-64:~# fdisk -l
	...
	Disk /dev/mmcblk0: 58.2 GiB, 62537072640 bytes, 122142720 sectors
	Units: sectors of 1 * 512 = 512 bytes
	Sector size (logical/physical): 512 bytes / 512 bytes
	I/O size (minimum/optimal): 512 bytes / 512 bytes
	Disklabel type: dos
	Disk identifier: 0xe62c8fcc

	Device Boot Start End Sectors Size Id Type
	/dev/mmcblk0p1 2048 122142719 122140672 58.2G 83 Linux
	...

	root@intel-x86-64:~#cat /proc/mounts
	...
	cgroup /sys/fs/cgroup/blkio cgroup rw,nosuid,nodev,noexec,relatime,blkio 0 0
	mqueue /dev/mqueue mqueue rw,relatime 0 0
	debugfs /sys/kernel/debug debugfs rw,relatime 0 0
	tmpfs /tmp tmpfs rw,nosuid,nodev 0 0
	hugetlbfs /dev/hugepages hugetlbfs rw,relatime 0 0
	tmpfs /var/volatile tmpfs rw,relatime 0 0
	tmpfs /run/user/0 tmpfs rw,nosuid,nodev,relatime,size=688048k,mode=700 0 0

Description:
	If linux uses systemd as init, systemd-udevd.service sets MountFlags=slave,
	which is essentially a sandboxing setting: it detaches mount() operations
	done within the service from the rest of the system. This means that,
	outside of namespace of systemd-udev, we can not access device mounted by
	udev and some operation will be failed.(e.g. mkfs.ext4 /dev/sda1).

	Current automount.rules and mount.sh created for sysvinit is unable to solve
	above problems.

	This patch adds systemd-mount in /etc/udev/script/mount.sh. The tool
	recommended by systemd upstream generally is the best way in particular in
	embedded applications to deal with hotpluggable media. Systemd-mount request
	the mount operation to be executed by PID 1, and hence outside of the mount
	context of udev.

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 61 +++++++++++++++++++++++---
 1 file changed, 56 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index d760328..2fa2925 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -5,9 +5,28 @@
 # Attempt to mount any added block devices and umount any removed devices
 
 
-MOUNT="/bin/mount"
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
 PMOUNT="/usr/bin/pmount"
-UMOUNT="/bin/umount"
+
 for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
@@ -17,6 +36,34 @@ do
 	fi
 done
 
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
 automount() {	
 	name="`basename "$DEVNAME"`"
 
@@ -72,9 +119,13 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_t
 	# If the device isn't mounted at this point, it isn't
 	# configured in fstab (note the root filesystem can show up as
 	# /dev/root in /proc/mounts, so check the device number too)
-	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
-		grep -q "^$DEVNAME " /proc/mounts || automount
-	fi
+        if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
+                if [ "`basename $MOUNT`" = "systemd-mount" ];then
+                        grep -q "^$DEVNAME " /proc/mounts || automount_systemd
+                else
+                        grep -q "^$DEVNAME " /proc/mounts || automount
+                fi
+        fi
 fi
 
 
-- 
2.8.1


