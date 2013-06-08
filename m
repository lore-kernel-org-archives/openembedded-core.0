Return-Path: <net147@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id 3D02B6A880
	for <openembedded-core@lists.openembedded.org>;
	Sat,  8 Jun 2013 12:41:30 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id kx10so922906pab.41
	for <openembedded-core@lists.openembedded.org>;
	Sat, 08 Jun 2013 05:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=hdUntAGb9UZeYhSR9bWf9INERSC8Rk3+ASgEm6PQ8Mw=;
	b=waVZYnrXsyCIGzJ/9ZbFUz6S1K+NMmiYM5bCh/Ah2QtO2tWh1hlYngo0xKNkMReh3O
	cSaAXCmsgh1adfqVS3Pdw9GNHIpTjSVsXxJlXmRLBmXzYp7wgIyyNQpgOdFWC8+LLjgU
	l5lMAz7A2fcmBd8m4OHPa5R6x5pcQTw518PB1PO9sSuwN0vETTznsJJqzaaZz/aG5hgX
	2ab+1WrFoz9qkaba+DbXcv+aEqpubWdcxdBzfxoD/s+izhN+jpcl6F0asUhTwATasMOV
	zr9Tl2WrdB6bE9n0dVfQaiOCLZNNYwkEWS48NSyD2LSXDZkb98tT6qXCveO6GWs6LwUS
	yi9A==
X-Received: by 10.66.91.107 with SMTP id cd11mr6826752pab.74.1370695291022;
	Sat, 08 Jun 2013 05:41:31 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id fn9sm7487442pab.2.2013.06.08.05.41.28
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 08 Jun 2013 05:41:29 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  8 Jun 2013 22:54:22 +1000
Message-Id: <1370696062-25915-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.2.3
Subject: [PATCH v2] boot-directdisk: mount root by MBR disk signature for Linux 3.8+
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
X-List-Received-Date: Sat, 08 Jun 2013 12:41:30 -0000

The root device is currently set as /dev/hda2. However, this is
only correct if it's the first IDE drive. If booting off the first SATA
drive instead, it would be /dev/sda2. It's not the first drive, neither
/dev/hda2 or /dev/sda2 would be correct.

The solution to this has typically been to use the filesystem UUID to
specify the root device but this requires extra support in the initrd.
Linux 3.8 introduces the ability to specify the root device using the
MBR disk signature and the partition number which is much simpler to
use and avoids the extra overhead of an initrd.

This change uses the MBR disk signature to specify the root device when
using Linux 3.8+ and CONFIG_BLOCK (required for root=PARTUUID=)
is enabled in the kernel.

This has been tested with QEMU x86 and Intel Desktop Board D2500HN using
an image recipe inheriting boot-directdisk and core-image.

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/classes/boot-directdisk.bbclass | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/meta/classes/boot-directdisk.bbclass b/meta/classes/boot-directdisk.bbclass
index 3169043..efeadab 100644
--- a/meta/classes/boot-directdisk.bbclass
+++ b/meta/classes/boot-directdisk.bbclass
@@ -23,7 +23,8 @@ do_bootdirectdisk[depends] += "dosfstools-native:do_populate_sysroot \
                                syslinux:do_populate_sysroot \
                                syslinux-native:do_populate_sysroot \
                                parted-native:do_populate_sysroot \
-                               mtools-native:do_populate_sysroot "
+                               mtools-native:do_populate_sysroot \
+                               util-linux-native:do_populate_sysroot "
 
 PACKAGES = " "
 EXCLUDE_FROM_WORLD = "1"
@@ -58,6 +59,25 @@ build_boot_dd() {
 	# done in blocks, thus the mod by 16 instead of 32.
 	BLOCKS=$(expr $BLOCKS + $(expr 16 - $(expr $BLOCKS % 16)))
 
+	KERNEL_VERSION=$(grep '^VERSION\s*=' ${STAGING_KERNEL_DIR}/Makefile | grep -o '[0-9]*$')
+	KERNEL_PATCHLEVEL=$(grep '^PATCHLEVEL\s*=' ${STAGING_KERNEL_DIR}/Makefile | grep -o '[0-9]*$')
+
+	rm -rf $IMAGE
+	dd if=/dev/zero of=$IMAGE bs=512 seek=1 count=0
+	parted $IMAGE mklabel msdos
+
+	# If using Linux 3.8+ and CONFIG_BLOCK is enabled, use MBR disk signature to specify root device
+	if (([ $KERNEL_VERSION -eq 3 ] && [ $KERNEL_PATCHLEVEL -ge 8 ]) || [ $KERNEL_VERSION -gt 3 ]) &&
+	   grep '^CONFIG_BLOCK=y$' ${STAGING_KERNEL_DIR}/.config >/dev/null; then
+		# Disk signature generated by parted isn't really random, so regenerate it
+		DISK_SIGNATURE=$(uuidgen | sed 's/-//g' | cut -b -8)
+		echo -ne "$(echo $DISK_SIGNATURE | fold -w 2 | tac | paste -sd '' | sed 's/\(..\)/\\x&/g')" | \
+			dd of=$IMAGE bs=1 seek=440 conv=notrunc
+
+		# Use MBR disk signature to specify root device
+		sed -i "s|\broot=[^ ]*|root=PARTUUID=$DISK_SIGNATURE-02|" $HDDDIR/syslinux.cfg
+	fi
+
 	mkdosfs -n ${BOOTDD_VOLUME_ID} -S 512 -C $HDDIMG $BLOCKS 
 	mcopy -i $HDDIMG -s $HDDDIR/* ::/
 
@@ -71,10 +91,8 @@ build_boot_dd() {
 	END3=`expr \( $ROOTFSBLOCKS \* 1024 \) + $END1`
 
 	echo $ROOTFSBLOCKS $TOTALSIZE $END1 $END2 $END3
-	rm -rf $IMAGE
 	dd if=/dev/zero of=$IMAGE bs=1024 seek=$TOTALSIZE count=1
 
-	parted $IMAGE mklabel msdos
 	parted $IMAGE mkpart primary fat16 0 ${END1}B
 	parted $IMAGE unit B mkpart primary ext2 ${END2}B ${END3}B
 	parted $IMAGE set 1 boot on 
-- 
1.8.2.3


