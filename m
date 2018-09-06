Return-Path: <chong.yi.chai@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1E6C2793EE
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 03:29:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Sep 2018 20:29:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.53,334,1531810800"; d="scan'208";a="88048233"
Received: from chongyic-ilbpg1.png.intel.com ([10.88.227.83])
	by orsmga001.jf.intel.com with ESMTP; 05 Sep 2018 20:29:15 -0700
From: chong.yi.chai@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Sep 2018 11:29:08 +0800
Message-Id: <1536204548-10423-1-git-send-email-chong.yi.chai@intel.com>
X-Mailer: git-send-email 1.9.1
Cc: chong.yi.chai@intel.com
Subject: [sumo][PATCH] mkefidisk: fix installation of kernel image
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
X-List-Received-Date: Thu, 06 Sep 2018 03:29:31 -0000

From: Chong Yi Chai <chong.yi.chai@intel.com>

Kernel image can be 'vmlinuz' for 'bzImage' but the script is written to
support 'vmlinuz' only. When building with meta-intel on sumo branch, the
kernel image is now bzImage and the installation will fail. Add option to
install bzImage as well.

Signed-off-by: Chong Yi Chai <chong.yi.chai@intel.com>
---
 scripts/contrib/mkefidisk.sh | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index ac4ec9c..39e4bcf 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -381,7 +381,15 @@ mount $BOOTFS $BOOTFS_MNT >$OUT 2>&1 || error "Failed to mount $BOOTFS on $BOOTF
 
 info "Preparing boot partition"
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
-cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy vmlinuz"
+# Get kernel image name
+if [ -e "$HDDIMG_MNT/vmlinuz" ]; then
+	kernel_image="vmlinuz"
+elif [ "$HDDIMG_MNT/bzImage" ]; then
+	kernel_image="bzImage"
+else
+	die "No kernel image found"
+fi
+cp $HDDIMG_MNT/${kernel_image} $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy ${kernel_image}"
 # Copy the efi loader and configs (booti*.efi and grub.cfg if it exists)
 cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT >$OUT 2>&1 || error "Failed to copy EFI dir"
 # Silently ignore a missing systemd-boot loader dir (we might just be a GRUB image)
@@ -407,7 +415,7 @@ if [ -e "$GRUB_CFG" ]; then
 	sed -i "s/ LABEL=[^ ]*/ /" $GRUB_CFG
 
 	sed -i "s@ root=[^ ]*@ @" $GRUB_CFG
-	sed -i "s@vmlinuz @vmlinuz root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GRUB_CFG
+	sed -i "s@${kernel_image} @${kernel_image} root=$TARGET_ROOTFS ro rootwait console=ttyS0 console=tty0 @" $GRUB_CFG
 fi
 
 # Look for a systemd-boot installation
-- 
1.9.1


