Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Konrad.Scherer@windriver.com>) id 1U6VRn-00059h-2N
	for openembedded-core@lists.openembedded.org;
	Sat, 16 Feb 2013 01:16:08 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1FL56kV025457
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Feb 2013 13:05:06 -0800 (PST)
Received: from yow-kscherer-l1.wrs.com (128.224.146.249) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 15 Feb 2013 13:05:06 -0800
From: Konrad Scherer <konrad.scherer@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 15 Feb 2013 16:04:52 -0500
Message-ID: <1360962292-5445-1-git-send-email-konrad.scherer@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH] Unmount filesystems automounted by udev except the one with the rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 16 Feb 2013 00:16:10 -0000
Content-Type: text/plain

From: Konrad Scherer <Konrad.Scherer@windriver.com>

Unmount all filesystems automounted by udev except one with
rootfs since the filesystem will be destroyed by switch_root.

Signed-off-by: Konrad Scherer <Konrad.Scherer@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh |   21 ++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 4f8618b..21939ad 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -75,6 +75,8 @@ read_args() {
 }
 
 boot_live_root() {
+    local rootfs_dev=$1
+
     killall udevd 2>/dev/null
 
     # Move the mount points of some filesystems over to
@@ -82,8 +84,19 @@ boot_live_root() {
     mount -n --move /proc ${ROOT_MOUNT}/proc
     mount -n --move /sys ${ROOT_MOUNT}/sys
     mount -n --move /dev ${ROOT_MOUNT}/dev
-    # Move /media/$i over to the real root filesystem
-    mount -n --move /media/$i ${ROOT_MOUNT}/media/realroot
+
+    # umount all filesystems automounted by udev except one with
+    # rootfs since the filesystem will be destroyed by switch_root
+    # They cannot be moved, because the read only rootfs may not have
+    # the corresponding mount points
+    for dir in `ls /media 2>/dev/null`; do
+        if [ "x${dir}" != "x${rootfs_dev}" ]; then
+            umount /media/${dir}
+        else
+            # Move iso mount with rootfs over to the real root filesystem
+            mount -n --move /media/${rootfs_dev} ${ROOT_MOUNT}/media/realroot
+        fi
+    done
 
     cd $ROOT_MOUNT
     exec switch_root -c /dev/console $ROOT_MOUNT /sbin/init
@@ -149,13 +162,13 @@ case $label in
 		mkdir /cow
 		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /cow
 		mount -t unionfs -o dirs=/cow:/rootfs-tmp=ro unionfs $ROOT_MOUNT
-		boot_live_root
+		boot_live_root $i
 	    fi
 	else
 	    if ! $MOUNT -o rw,loop,noatime,nodiratime /media/$i/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 		fatal "Could not mount rootfs image"
 	    else
-		boot_live_root
+		boot_live_root $i
 	    fi
 	fi
 	;;
-- 
1.7.10.4



