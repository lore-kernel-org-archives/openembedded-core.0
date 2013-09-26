Return-Path: <jason.wessel@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 23ADC6CA7E
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 22:34:35 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8QMYZYO017103
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 26 Sep 2013 15:34:36 -0700 (PDT)
Received: from splat.wrs.com (128.224.60.28) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 15:34:34 -0700
From: Jason Wessel <jason.wessel@windriver.com>
To: <Openembedded-core@lists.openembedded.org>
Date: Thu, 26 Sep 2013 17:34:10 -0500
Message-ID: <1380234850-27169-1-git-send-email-jason.wessel@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] mkefidisk.sh: Allow using a loopback mounted file
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
X-List-Received-Date: Thu, 26 Sep 2013 22:34:36 -0000
Content-Type: text/plain

There is no reason not allow writing of direct boot disk images for
testing with simulators.  The easy way is to add loop back writing
capabilities.

Example:
  qemu-img create -f raw bigdisk 4G
  dev=`sudo losetup -f`
  sudo losetup $dev bigdisk
  mkefidisk.sh $dev tmp-eglibc/deploy/images/qemux86/core-image-minimal-qemux86.hddimg /dev/sda
  sudo losetup -d $dev

Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
---
 scripts/contrib/mkefidisk.sh |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index af06b4b..224a146 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -142,7 +142,7 @@ SWAP_START=$((ROOTFS_END))
 
 # MMC devices use a partition prefix character 'p'
 PART_PREFIX=""
-if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ]; then
+if [ ! "${DEVICE#/dev/mmcblk}" = "${DEVICE}" ] || [ ! "${TARGET_DEVICE#/dev/loop}" = "${DEVICE}" ]; then
 	PART_PREFIX="p"
 fi
 BOOTFS=$DEVICE${PART_PREFIX}1
@@ -197,7 +197,12 @@ unmount_device
 #
 echo ""
 echo "Formatting $BOOTFS as vfat..."
-mkfs.vfat $BOOTFS -n "efi"
+if [ ! "${DEVICE#/dev/loop}" = "${DEVICE}" ]; then
+	mkfs.vfat -I $BOOTFS -n "efi"
+else
+	mkfs.vfat $BOOTFS -n "efi"
+
+fi
 
 echo "Formatting $ROOTFS as ext3..."
 mkfs.ext3 $ROOTFS -L "root"
-- 
1.7.9.5


