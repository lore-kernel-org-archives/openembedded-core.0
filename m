Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1D7EE65CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 07:49:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u2T7nsIV008422
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Mar 2016 00:49:54 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 29 Mar 2016 00:49:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Mar 2016 00:49:52 -0700
Message-ID: <930680769815c85878081c7d850dc6b06e62f28c.1459237687.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1459237687.git.liezhi.yang@windriver.com>
References: <cover.1459237687.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] init-live.sh: fix overlay fs
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
X-List-Received-Date: Tue, 29 Mar 2016 07:49:55 -0000
Content-Type: text/plain

* The name changes from overlayfs to overlayo
* The workdir is a must when mount
* The updir must be a subdir of rootfs.rw

This patch plus with another one which has been sent to linux-yocto can
fix the error when boot iso:
EXT4-fs (loop0): re-mounted. Opts: data=ordered
Populating dev cache
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/rcS.d/S36udev-cache: line 73: can't create /etc/udev-cache.tar.gz:
Read-only file system
udev-cache: update failed!
rm: can't remove '/etc/udev/cache.data': Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
rm: can't remove '/tmp': Read-only file system
ln: /tmp/tmp: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
ln: /etc/resolv.conf: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system
/etc/init.d/rc: /etc/rcS.d/S37populate-volatile.sh: line 1: can't create
/etc/volatile.cache.build: Read-only file system

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta/recipes-core/initrdscripts/files/init-live.sh | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-live.sh b/meta/recipes-core/initrdscripts/files/init-live.sh
index 04e58d5..09fb479 100644
--- a/meta/recipes-core/initrdscripts/files/init-live.sh
+++ b/meta/recipes-core/initrdscripts/files/init-live.sh
@@ -169,8 +169,8 @@ mount_and_boot() {
 
     # determine which unification filesystem to use
     union_fs_type=""
-    if grep -q -w "overlayfs" /proc/filesystems; then
-	union_fs_type="overlayfs"
+    if grep -q -w "overlay" /proc/filesystems; then
+	union_fs_type="overlay"
     elif grep -q -w "aufs" /proc/filesystems; then
 	union_fs_type="aufs"
     else
@@ -179,14 +179,15 @@ mount_and_boot() {
 
     # make a union mount if possible
     case $union_fs_type in
-	"overlayfs")
+	"overlay")
 	    mkdir -p /rootfs.ro /rootfs.rw
 	    if ! mount -n --move $ROOT_MOUNT /rootfs.ro; then
 		rm -rf /rootfs.ro /rootfs.rw
 		fatal "Could not move rootfs mount point"
 	    else
 		mount -t tmpfs -o rw,noatime,mode=755 tmpfs /rootfs.rw
-		mount -t overlayfs -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw" overlayfs $ROOT_MOUNT
+		mkdir -p /rootfs.rw/upperdir /rootfs.rw/work
+		mount -t overlay overlay -o "lowerdir=/rootfs.ro,upperdir=/rootfs.rw/upperdir,workdir=/rootfs.rw/work" $ROOT_MOUNT
 		mkdir -p $ROOT_MOUNT/rootfs.ro $ROOT_MOUNT/rootfs.rw
 		mount --move /rootfs.ro $ROOT_MOUNT/rootfs.ro
 		mount --move /rootfs.rw $ROOT_MOUNT/rootfs.rw
-- 
2.7.4


