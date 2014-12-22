Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id DA996727BF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Dec 2014 10:13:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMAD2HF031683; Mon, 22 Dec 2014 10:13:02 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id nTs-HxbgVevu; Mon, 22 Dec 2014 10:13:02 +0000 (GMT)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	sBMACnnb031678
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 22 Dec 2014 10:13:01 GMT
Message-ID: <1419243206.13316.70.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Mon, 22 Dec 2014 10:13:26 +0000
X-Mailer: Evolution 3.12.7-0ubuntu1 
Mime-Version: 1.0
Subject: [PATCH] runqemu-internal: Fix qemu networking for qemuarm64
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
X-List-Received-Date: Mon, 22 Dec 2014 10:13:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

This brings qemuarm64 into feature parity with the other qemu machines
and enables the automated testing on the autobuilder.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>

diff --git a/scripts/runqemu-internal b/scripts/runqemu-internal
index c219419..f6274e2 100755
--- a/scripts/runqemu-internal
+++ b/scripts/runqemu-internal
@@ -264,7 +264,7 @@ else
             ROOTFS_OPTIONS="-hda $ROOTFS"
         fi
         if [ "$MACHINE" = "qemuarm64" ]; then
-            QEMU_NETWORK_CMD="-netdev user,id=net0 -device virtio-net-device,netdev=net0"
+            QEMU_NETWORK_CMD="-netdev tap,id=net0,ifname=$TAP,script=no,downscript=no -device virtio-net-device,netdev=net0 "
             DROOT="/dev/vda"
             ROOTFS_OPTIONS="-drive id=disk0,file=$ROOTFS -device virtio-blk-device,drive=disk0"
         fi
@@ -381,7 +381,7 @@ if [ "$MACHINE" = "qemuarm64" ]; then
     export QEMU_AUDIO_DRV="none"
     QEMU_UI_OPTIONS="$QEMU_UI_OPTIONS"
     if [ "${FSTYPE:0:3}" = "ext" -o "$FSTYPE" = "btrfs" ]; then
-        KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off"
+        KERNCMDLINE="root=/dev/vda rw console=ttyAMA0,38400 mem=$QEMU_MEMORY highres=off $KERNEL_NETWORK_CMD"
         # qemu-system-aarch64 only support '-machine virt -cpu cortex-a57' for now
         QEMUOPTIONS="$QEMU_NETWORK_CMD -machine virt -cpu cortex-a57 $ROOTFS_OPTIONS $QEMU_UI_OPTIONS"
     fi



