Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 51181745ED
	for <openembedded-core@lists.openembedded.org>;
	Sun, 16 Sep 2018 05:45:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w8G5jskB017319
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Sep 2018 22:45:54 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.408.0;
	Sat, 15 Sep 2018 22:45:53 -0700
From: "Hongzhi.Song" <hongzhi.song@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 15 Sep 2018 22:45:30 -0700
Message-ID: <20180916054532.1312-2-hongzhi.song@windriver.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180916054532.1312-1-hongzhi.song@windriver.com>
References: <20180916054532.1312-1-hongzhi.song@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] udev-extraconf/mount.sh: add support to systemd
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

Udev-extraconf works correctly with sysvinit in the aspect of
automounting block devices,but it has a serious problem in case
of systemd. Block devices automounted by udev are not accessible
to host namespace, i.e. udevd's private namespace. For example,
we cannot format the host namespace block devices.

e.g.
    root@intel-x86-64:~# mkfs.ext4 /dev/sda1
    (skip...)
    /dev/sda1 is apparently in use by the system; will not make a filesystem here!

Other distributions have no such problem, because they use a series
of rules to manage block devices. Note that udev-extraconf has just
one file, automount.rules, which results in this problem.

As recommended by members of the systemd community, we can use the
'systemd-mount' command to resolve this problem since it's intended
purpose is to establish (and destroy) transient mount or auto-mount
points using the service manager job queue thereby eliminating
dependencies loops.

We add 'systemd-mount' command instead of replace 'mount' command
based on the original mount.sh.

[YOCTO #12644]
Simply steps of reproduce:
Using systemd as init and an ext3 filesystem image,
boot core-image-minimal using:
  runqemu qemux86 slirp nographic qemuparams="-hda b.img"
  Note that hda is not mounted yet it can't be formatted either.

Detail steps of reproduce:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12644

Signed-off-by: Hongzhi.Song <hongzhi.song@windriver.com>
---
 meta/recipes-core/udev/udev-extraconf/mount.sh | 60 ++++++++++++++++++++++----
 1 file changed, 51 insertions(+), 9 deletions(-)

diff --git a/meta/recipes-core/udev/udev-extraconf/mount.sh b/meta/recipes-core/udev/udev-extraconf/mount.sh
index d760328a09..5a877dd7ed 100644
--- a/meta/recipes-core/udev/udev-extraconf/mount.sh
+++ b/meta/recipes-core/udev/udev-extraconf/mount.sh
@@ -4,10 +4,26 @@
 #
 # Attempt to mount any added block devices and umount any removed devices
 
+BASE_INIT="`readlink -f "/sbin/init"`"
+INIT_SYSTEMD="/lib/systemd/systemd"
+
+if [ "x$BASE_INIT" = "x$INIT_SYSTEMD" ];then
+        MOUNT="/usr/bin/systemd-mount"
+        UMOUNT="/usr/bin/systemd-umount"
+
+        if [ ! -x $MOUNT ] && [ ! -x $UMOUNT ];
+        then
+                logger "/sbin/init is systemd but /usr/bin/systemd-[u]mount not found."
+                logger "Install systemd-[u]mount to be able to [un]mount all filesystems."
+                exit 0
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
@@ -17,7 +33,31 @@ do
 	fi
 done
 
-automount() {	
+automount_systemd() {
+	name="`basename "$DEVNAME"`"
+
+        ! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
+
+        # If filesystem type is vfat, change the ownership group to 'disk', and
+        # grant it with  w/r/x permissions.
+        case $ID_FS_TYPE in
+        vfat|fat)
+                MOUNT="$MOUNT -o umask=007,gid=`awk -F':' '/^disk/{print $3}' /etc/group`"
+                ;;
+        *)
+                ;;
+        esac
+
+        if ! $MOUNT -o silent --no-block -t auto $DEVNAME "/run/media/$name"
+        then
+                rm_dir "/run/media/$name"
+        else
+                logger "mount.sh: systemd-mount of [/run/media/$name] successful"
+                touch "/tmp/.automount-$name"
+        fi
+}
+
+automount() {
 	name="`basename "$DEVNAME"`"
 
 	! test -d "/run/media/$name" && mkdir -p "/run/media/$name"
@@ -26,7 +66,7 @@ automount() {
 	then
 		MOUNT="$MOUNT -o silent"
 	fi
-	
+
 	# If filesystem type is vfat, change the ownership group to 'disk', and
 	# grant it with  w/r/x permissions.
 	case $ID_FS_TYPE in
@@ -47,7 +87,7 @@ automount() {
 		touch "/tmp/.automount-$name"
 	fi
 }
-	
+
 rm_dir() {
 	# We do not want to rm -r populated directories
 	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
@@ -61,19 +101,21 @@ rm_dir() {
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
 
@@ -83,7 +125,7 @@ if [ "$ACTION" = "remove" ] || [ "$ACTION" = "change" ] && [ -x "$UMOUNT" ] && [
 	do
 		$UMOUNT $mnt
 	done
-	
+
 	# Remove empty directories from auto-mounter
 	name="`basename "$DEVNAME"`"
 	test -e "/tmp/.automount-$name" && rm_dir "/run/media/$name"
-- 
2.11.0


