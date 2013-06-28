Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 540DF6AEDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 07:48:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5S7mbLK024553
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Jun 2013 00:48:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 28 Jun 2013 00:48:36 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 28 Jun 2013 15:48:53 +0800
Message-ID: <5a7156829bb79f87af58c12105ad4e35545f6e96.1372394016.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1372394016.git.Qi.Chen@windriver.com>
References: <cover.1372394016.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 2/2] init-live.sh: try to make a union mount when possible
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
X-List-Received-Date: Fri, 28 Jun 2013 07:48:35 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patch tries to make a union mount in live image. For example,
if aufs is enabled with the aufs-enable.scc configuration fragment,
the init-live.sh script will use aufs to make a union mount.

Although overlayfs is not supported by Yocto kernel yet, this patch
still takes it into consideration with the expect that the related
code should at least serve as a placeholder.

[YOCTO #1487]
[YOCTO #4761]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   63 +++++++++++++++++---
 1 file changed, 56 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 00c2558..9804504 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -135,15 +135,64 @@ do
   sleep 1
 done
 
+# Try to make a union mount of the root image.
+# If no unification filesystem is available, mount the image read-only.
+mount_and_boot() {
+    mkdir $ROOT_MOUNT
+    mknod /dev/loop0 b 7 0 2>/dev/null
+
+    # determine which unification filesystem to use
+    union_fs_type=""
+    if grep -q -w "overlayfs" /proc/filesystems; then
+	union_fs_type="overlayfs"
+    elif grep -q -w "aufs" /proc/filesystems; then
+	union_fs_type="aufs"
+    else
+	union_fs_type=""
+    fi
+
+    # make a union mount if possible
+    case $union_fs_type in
+	"overlayfs")
+	    mkdir -p /rootfs.ro /rootfs.rw
+	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+		rm -rf /rootfs.ro /rootfs.rw
+		fatal "Could not mount rootfs image"
+	    else
+		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		mount -t overlayfs -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw" overlayfs $ROOT_MOUNT
+		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
+		mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
+		mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
+	    fi
+	    ;;
+	"aufs")
+	    mkdir -p /rootfs.ro /rootfs.rw
+	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE /rootfs.ro; then
+		rm -rf /rootfs.ro /rootfs.rw
+		fatal "Could not mount rootfs image"
+	    else
+		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOT_MOUNT
+		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
+		mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
+		mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
+	    fi
+	    ;;
+	"")
+	    if ! mount -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
+		fatal "Could not mount rootfs image"
+	    fi
+	    ;;
+    esac
+
+    # boot the image
+    boot_live_root
+}
+
 case $label in
     boot)
-	mkdir $ROOT_MOUNT
-	mknod /dev/loop0 b 7 0 2>/dev/null
-	if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
-	    fatal "Could not mount rootfs image"
-	else
-	    boot_live_root
-	fi
+	mount_and_boot
 	;;
     install|install-efi)
 	if [ -f /media/$i/$ISOLINUX/$ROOT_IMAGE ] ; then
-- 
1.7.9.5


