Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6FCF471B1D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2018 03:38:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w3C3cxvI010936
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 20:38:59 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 11 Apr 2018 20:38:58 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Apr 2018 23:38:19 -0400
Message-ID: <20180412033819.40298-1-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.13.3
MIME-Version: 1.0
Subject: [PATCH v2] udev-extraconf: Add systemd-mount to udev-extraconf/mount.sh
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
X-List-Received-Date: Thu, 12 Apr 2018 03:38:58 -0000
Content-Type: text/plain

This patch fixs the problem that block devices unable to be formatted when
systemd and udev-extraconf recipes added to rootfs.

If we add systemd and udev-extraconf recipes to rootfs:
    VIRTUAL-RUNTIME_init_manager = "systemd"
    DISTRO_FEATURES_append = " systemd"
    DISTRO_FEATURES_BACKFILL_CONSIDERED += "sysvinit"
    KERNEL_FEATURES_append = " cfg/systemd.scc"
    IMAGE_INSTALL_append = " udev-extraconf"
    IMAGE_FSTYPES += "tar.bz2 ext4"
    IMAGE_INSTALL_append = " e2fsprogs-mke2fs"
then systemd-udevd.service will invoke udev rules to automount block devices
any probed under udevd's private namespace, this behavior results in host space
can't format those devices. And host space can't find where the device is used.

Such as:
    root@qemux86:~# mkfs.ext4 /dev/sda1
    mke2fs 1.43.8 (1-Jan-2018)
    /dev/sda1 contains a ext4 file system
    last mounted on Tue Apr  3 06:22:41 2018
    Proceed anyway? (y,N) y
    /dev/sda1 is apparently in use by the system; will not make a filesystem here!

Command 'systemd-mount' recommended by systemd maintainer instead of command
'mount' will fix the problem brought with private namespace. Systemd-mount
request the mount operation to be executed by PID 1, and hence host space can
access the block devices.

[YOCTO #12644]

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 71 ++++++++++++++++++++++----
 1 file changed, 60 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index d760328a09..4ba9f1dd99 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -4,10 +4,28 @@
 #
 # Attempt to mount any added block devices and umount any removed devices
 
+BASE_INIT="`readlink "/sbin/init"`"
+INIT_SYSTEMD="/lib/systemd/systemd"
+
+if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
+	# systemd as init uses systemd-mount to mount block devices
+    MOUNT="/usr/bin/systemd-mount"
+    UMOUNT="/usr/bin/systemd-umount"
+
+    if [ -x $MOUNT ] && [ -x $UMOUNT ];
+    then
+        logger "Using systemd-mount to finish mount"
+    else
+        logger "Linux init is using systemd, so please install systemd-mount to finish mount"
+        exit 1
+    fi
+else
+    MOUNT="/bin/mount"
+    UMOUNT="/bin/umount"
+fi
 
-MOUNT="/bin/mount"
 PMOUNT="/usr/bin/pmount"
-UMOUNT="/bin/umount"
+
 for line in `grep -h -v ^# /etc/udev/mount.blacklist /etc/udev/mount.blacklist.d/*`
 do
 	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
@@ -17,7 +35,35 @@ do
 	fi
 done
 
-automount() {	
+automount_systemd() {
+    name="`basename "$DEVNAME"`"
+
+    ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+
+    MOUNT="$MOUNT -o silent"
+
+    # If filesystemtype is vfat, change the ownership group to 'disk', and
+    # grant it with  w/r/x permissions.
+    case $ID_FS_TYPE in
+    vfat|fat)
+        MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+        ;;
+    # TODO
+    *)
+        ;;
+    esac
+
+    if ! $MOUNT --no-block -t auto $DEVNAME "/run/media/$name"
+    then
+        #logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/run/media/$name\" failed!"
+        rm_dir "/run/media/$name"
+    else
+        logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
+        touch "/tmp/.automount-$name"
+    fi
+}
+
+automount() {
 	name="`basename "$DEVNAME"`"
 
 	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
@@ -26,7 +72,7 @@ automount() {
 	then
 		MOUNT="$MOUNT -o silent"
 	fi
-	
+
 	# If filesystem type is vfat, change the ownership group to 'disk', and
 	# grant it with  w/r/x permissions.
 	case $ID_FS_TYPE in
@@ -46,7 +92,7 @@ automount() {
 		logger "mount.sh/automount" "Auto-mount of [/run/media/$name] successful"
 		touch "/tmp/.automount-$name"
 	fi
-}
+
 	
 rm_dir() {
 	# We do not want to rm -r populated directories
@@ -68,22 +114,25 @@ if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" -o "$media_t
 	elif [ -x $MOUNT ]; then
     		$MOUNT $DEVNAME 2> /dev/null
 	fi
-	
+
 	# If the device isn't mounted at this point, it isn't
 	# configured in fstab (note the root filesystem can show up as
 	# /dev/root in /proc/mounts, so check the device number too)
-	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
-		grep -q "^$DEVNAME " /proc/mounts || automount
-	fi
+    if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
+        if [ "`basename $MOUNT`" = "systemd-mount" ];then
+            grep -q "^$DEVNAME " /proc/mounts || automount_systemd
+        else
+            grep -q "^$DEVNAME " /proc/mounts || automount
+        fi
+    fi
 fi
 
-
 if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
 	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
 	do
 		$UMOUNT $mnt
 	done
-	
+
 	# Remove empty directories from auto-mounter
 	name="`basename "$DEVNAME"`"
 	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
-- 
2.13.3


