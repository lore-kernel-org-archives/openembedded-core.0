Return-Path: <dvhart@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id CD89F705E0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 21:16:17 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Jul 2014 14:10:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,673,1400050800"; d="scan'208";a="544425849"
Received: from fear.jf.intel.com (HELO localhost) ([10.7.201.149])
	by orsmga001.jf.intel.com with ESMTP; 16 Jul 2014 14:16:13 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 14:16:00 +0000
Message-Id: <1c24512dd36a5d014314adb98c5bfb5872319df1.1405520111.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1405520111.git.dvhart@linux.intel.com>
References: <cover.1405520111.git.dvhart@linux.intel.com>
Subject: [PATCH 4/8] mkefidisk.sh: Copy the EFI dir recursively
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
X-List-Received-Date: Wed, 16 Jul 2014 21:16:18 -0000

Rather than only copying the EFI/BOOT dir, copy the entire EFI dir
recursively. This allows for custom configurations to be enabled
implicitly with no extra work required.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/contrib/mkefidisk.sh | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
index 9b13041..98c43f5 100755
--- a/scripts/contrib/mkefidisk.sh
+++ b/scripts/contrib/mkefidisk.sh
@@ -264,11 +264,9 @@ umount $HDDIMG_ROOTFS_MNT
 
 echo "Preparing boot partition..."
 EFIDIR="$BOOTFS_MNT/EFI/BOOT"
-mkdir -p $EFIDIR
-
 cp $HDDIMG_MNT/vmlinuz $BOOTFS_MNT
 # Copy the efi loader and configs (booti*.efi and grub.cfg if it exists)
-cp $HDDIMG_MNT/EFI/BOOT/* $EFIDIR
+cp -r $HDDIMG_MNT/EFI $BOOTFS_MNT
 # Silently ignore a missing gummiboot loader dir (we might just be a GRUB image)
 cp -r $HDDIMG_MNT/loader $BOOTFS_MNT 2> /dev/null
 
-- 
2.0.0


