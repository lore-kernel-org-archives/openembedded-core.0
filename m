Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C3F606BB80
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 05:01:14 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8B51GZ4007846
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Sep 2013 22:01:16 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 10 Sep 2013 22:01:16 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 11 Sep 2013 13:01:55 +0800
Message-ID: <14d6fca8bde7511b5ee32e26b3ece70a93345f99.1378875647.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378875647.git.Qi.Chen@windriver.com>
References: <cover.1378875647.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] init-live.sh: distinguish between a read-only image and a read-write image
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
X-List-Received-Date: Wed, 11 Sep 2013 05:01:14 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The iso and hddimg share a common concept of 'live image', and they
use the same initramfs and thus the same init. However, that init
script in initramfs made a wrong assumption that the rootfs image
was read-only by itself. This is apparently not true for hddimg.

To make things work as expected, this init script should at least
distinguish between a read-only rootfs image and a read-write one.

This patch adds this ability to the init script. After this change,
the init script would be able to check whether the rootfs image is
read-only or not. If the rootfs image is read-write, the image will
be mounted and then booted directly. No union mounts will be attempted
in this case.

[YOCTO #5164]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   29 ++++++++++++--------
 1 file changed, 18 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 861d874..df0076d 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -137,12 +137,23 @@ do
   sleep 1
 done
 
-# Try to make a union mount of the root image.
-# If no unification filesystem is available, mount the image read-only.
+# Try to mount the root image read-write and then boot it up.
+# This function distinguishes between a read-only image and a read-write image.
+# In the former case (typically an iso), it tries to make a union mount if possible.
+# In the latter case, the root image could be mounted and then directly booted up.
 mount_and_boot() {
     mkdir $ROOT_MOUNT
     mknod /dev/loop0 b 7 0 2>/dev/null
 
+    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+	fatal "Could not mount rootfs image"
+    fi
+
+    if touch $ROOT_MOUNT/bin 2>/dev/null; then
+	# The root image is read-write, directly boot it up.
+	boot_live_root
+    fi
+
     # determine which unification filesystem to use
     union_fs_type=""
     if grep -q -w "overlayfs" /proc/filesystems; then
@@ -157,9 +168,9 @@ mount_and_boot() {
     case $union_fs_type in
 	"overlayfs")
 	    mkdir -p /rootfs.ro /rootfs.rw
-	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+	    if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
-		fatal "Could not mount rootfs image"
+		fatal "Could not move rootfs mount point"
 	    else
 		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
 		mount -t overlayfs -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw" overlayfs $ROOT_MOUNT
@@ -170,9 +181,9 @@ mount_and_boot() {
 	    ;;
 	"aufs")
 	    mkdir -p /rootfs.ro /rootfs.rw
-	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+	    if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
-		fatal "Could not mount rootfs image"
+		fatal "Could not move rootfs mount point"
 	    else
 		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
 		mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOT_MOUNT
@@ -182,11 +193,7 @@ mount_and_boot() {
 	    fi
 	    ;;
 	"")
-	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
-		fatal "Could not mount rootfs image"
-	    else
-		mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOT_MOUNT/media
-	    fi
+	    mount -t tmpfs -o rw,noatime,mode=755 tmpfs $ROOT_MOUNT/media
 	    ;;
     esac
 
-- 
1.7.9.5


