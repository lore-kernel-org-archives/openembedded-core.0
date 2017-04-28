Return-Path: <jonathan.yong@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 4D8AE77AA3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Apr 2017 02:09:42 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Apr 2017 19:09:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.37,386,1488873600"; 
	d="txt'?scan'208";a="81611216"
Received: from jyong2-mobl5.gar.corp.intel.com (HELO [172.30.66.60])
	([172.30.66.60])
	by orsmga004.jf.intel.com with ESMTP; 27 Apr 2017 19:09:43 -0700
Message-ID: <5902A466.7020508@intel.com>
Date: Fri, 28 Apr 2017 10:09:42 +0800
From: "Yong, Jonathan" <jonathan.yong@intel.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64;
	rv:25.4) Gecko/20150524 FossaMail/25.1.5
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: [RFC] Hybrid live image?
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
X-List-Received-Date: Fri, 28 Apr 2017 02:09:43 -0000
X-Groupsio-MsgNum: 96773
Content-Type: multipart/mixed; boundary="------------050404020300010408070202"

--------------050404020300010408070202
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

Attached patch makes the init script attempt to find an writable image
to use with Overlay/AUFS, and probably does so poorly.

The idea is to eventually allow users to do a "RESET" option in case
they mess up the system. The underlying image can be something read-only
like cramfs or squashfs.

Any comments or suggestions?

--------------050404020300010408070202
Content-Type: text/plain; charset=windows-1252;
 name="init-live.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename="init-live.txt"

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 441b41c..35047c8 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -152,6 +152,25 @@ do
   sleep 1
 done
 
+try_rw_image() {
+    for i in /run/media/$ROOT_DISK/$ISOLINUX/${ROOT_IMAGE}.rw; do
+        if [ -w $i ]; then
+            mount -o rw,loop,noatime,sync $i /rootfs.rw
+            if [ "$?" -ne 0 ]; then
+                break
+            fi
+            touch /rootfs.rw/.rwtest 2>/dev/null
+            if [ "$?" -ne 0 ]; then
+                break
+            fi
+            rm /rootfs.rw/.rwtest
+            return
+        fi
+     done
+     umount /rootfs.rw
+     mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+}
+
 # Try to mount the root image read-write and then boot it up.
 # This function distinguishes between a read-only image and a read-write image.
 # In the former case (typically an iso), it tries to make a union mount if possible.
@@ -159,6 +178,7 @@ done
 mount_and_boot() {
     mkdir $ROOT_MOUNT
     mknod /dev/loop0 b 7 0 2>/dev/null
+    mknod /dev/loop1 b 7 1 2>/dev/null
 
     if ! mount -o rw,loop,noatime,nodiratime /run/media/$ROOT_DISK/$ISOLINUX/$ROOT_IMAGE $ROOT_MOUNT ; then
 	fatal "Could not mount rootfs image"
@@ -187,7 +207,7 @@ mount_and_boot() {
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not move rootfs mount point"
 	    else
-		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		try_rw_image
 		mkdir -p /rootfs.rw/upperdir /rootfs.rw/work
 		mount -t overlay overlay -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw/upperdir,workdir=/rootfs.rw/work" $ROOT_MOUNT
 		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
@@ -201,7 +221,7 @@ mount_and_boot() {
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not move rootfs mount point"
 	    else
-		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
+		try_rw_image
 		mount -t aufs -o "dirs=/rootfs.rw=rw:/rootfs.ro=ro" aufs $ROOT_MOUNT
 		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
 		mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro

--------------050404020300010408070202--
