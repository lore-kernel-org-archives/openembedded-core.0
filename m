Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AFCA97704A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Sep 2015 22:51:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 29 Sep 2015 15:51:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,609,1437462000"; d="scan'208";a="815694282"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.83])
	by fmsmga002.fm.intel.com with ESMTP; 29 Sep 2015 15:51:26 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Sep 2015 17:51:23 -0500
Message-Id: <ff547dde5ddcb1f42afcc4d91aea70a20c5c4983.1443564436.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1443564436.git.anibal.limon@linux.intel.com>
References: <cover.1443564436.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1443564436.git.anibal.limon@linux.intel.com>
References: <cover.1443564436.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: bruce.ashfield@windriver.com, benjamin.esquivel@intel.com
Subject: [PATCH 2/2] runqemu-internal: qemuarm enable usage of virtio devices
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
X-List-Received-Date: Tue, 29 Sep 2015 22:51:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

We are experiencing occasional segfaults in scsi sym53c8xx driver
on qemuarm boot. There are some old discussions into the mailing
lists [1] about the scsi problem and seems to be isn't fixed.

We use virtio blk/net devices into qemuarm64 also are supported
into qemuarm so change to use it because virtio devices are the best
choice.

[YOCTO #8060]

[1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=8060#c10

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 scripts/runqemu-internal | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index d6b1102..a77660f 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -364,8 +364,18 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -drive file=$ROOTFS,format=raw -no-reboot $QEMU_UI_OPTIONS"
+        if [ "$MACHINE" = "qemuarm" ]; then
+            QEMU_NETWORK_CMD="-net nic,model=virtio $QEMU_TAP_CMD"
+            DROOT="/dev/vda"
+            ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio,format=raw"
+        else
+            QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
+            DROOT="/dev/sda"
+            ROOTFS_OPTIONS="-drive file=$ROOTFS,format=raw"
+        fi
+
+        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-- 
1.9.1


