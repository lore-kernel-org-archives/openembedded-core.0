Return-Path: <Dmitry_Eremin@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id E8DC760167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Apr 2015 11:12:31 +0000 (UTC)
Received: from nat-ies.mentorg.com ([192.94.31.2]
	helo=SVR-IES-FEM-01.mgc.mentorg.com)
	by relay1.mentorg.com with esmtp 
	id 1Yksa0-0006H0-Gm from Dmitry_Eremin@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Apr 2015 04:12:32 -0700
Received: from fangorn.rup.mentorg.com (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.3.224.2; Wed, 22 Apr 2015 12:12:31 +0100
From: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Apr 2015 14:12:28 +0300
Message-ID: <1429701149-28824-2-git-send-email-dmitry_eremin@mentor.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1429701149-28824-1-git-send-email-dmitry_eremin@mentor.com>
References: <1429701149-28824-1-git-send-email-dmitry_eremin@mentor.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] scripts/runqemu: factor out some qemuarm configuration options
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
X-List-Received-Date: Wed, 22 Apr 2015 11:12:34 -0000
Content-Type: text/plain

In preparation of adding qemuarma9 support to runqemu scripts, factor
out some qemuarm-related options to be handled in a more generic way.

Signed-off-by: Dmitry Eremin-Solenikov <dmitry_eremin@mentor.com>
---
 scripts/runqemu-internal | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index 2db5566..65dbf21 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -124,6 +124,10 @@ if [ "$SLIRP_ENABLED" = "yes" ]; then
         QEMU_NETWORK_CMD=""
         DROOT="/dev/vda"
         ROOTFS_OPTIONS="-drive file=$ROOTFS,if=virtio"
+    elif [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" ]; then
+        QEMU_NETWORK_CMD=""
+        DROOT="/dev/sda"
+        ROOTFS_OPTIONS="-hda $ROOTFS"
     else
         QEMU_NETWORK_CMD=""
         DROOT="/dev/hda"
@@ -267,6 +271,11 @@ else
             DROOT="/dev/hda"
             ROOTFS_OPTIONS="-hda $ROOTFS"
         fi
+        if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarmv7" ]; then
+            QEMU_NETWORK_CMD="-net nic,vlan=0 $QEMU_TAP_CMD"
+            DROOT="/dev/sda"
+            ROOTFS_OPTIONS="-hda $ROOTFS"
+        fi
         if [ "$MACHINE" = "qemuarm64" ]; then
             QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
             DROOT="/dev/vda"
@@ -359,8 +368,8 @@ if [ "$MACHINE" = "qemuarm" -o "$MACHINE" = "qemuarmv6" -o "$MACHINE" = "qemuarm
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     # QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS -force-pointer"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/sda rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
-        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} -hda $ROOTFS -no-reboot $QEMU_UI_OPTIONS"
+        KERNCMDLINE="root=$DROOT rw console=ttyAMA0,115200 console=tty $KERNEL_NETWORK_CMD mem=$QEMU_MEMORY highres=off"
+        QEMUOPTIONS="$QEMU_NETWORK_CMD -M ${MACHINE_SUBTYPE} $ROOTFS_OPTIONS -no-reboot $QEMU_UI_OPTIONS"
     fi
     if [ "$FSTYPE" = "nfs" ]; then
         if [ "$NFS_SERVER" = "192.168.7.1" -a ! -d "$NFS_DIR" ]; then
-- 
2.1.4


