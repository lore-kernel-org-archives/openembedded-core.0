Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 6690E759F8
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:07:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 16 Jun 2015 01:07:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,624,1427785200"; d="scan'208";a="744225495"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 01:07:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 498646A4087;
	Tue, 16 Jun 2015 01:07:14 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 09:13:50 +0300
Message-Id: <1434435234-4892-8-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2 07/11] init-install: Specify filesystem type in parted command line
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
X-List-Received-Date: Tue, 16 Jun 2015 08:07:49 -0000

Explicitly specified filesystem type for parted mkpart command.
This makes partition table to look more informative.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 5fb4d4d..7f3e889 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -134,14 +134,14 @@ echo "Creating new partition table on /dev/${device} ..."
 parted /dev/${device} mklabel gpt
 
 echo "Creating boot partition on $bootfs"
-parted /dev/${device} mkpart primary 0% $boot_size
+parted /dev/${device} mkpart primary fat32 0% $boot_size
 parted /dev/${device} set 1 boot on
 
 echo "Creating rootfs partition on $rootfs"
-parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
+parted /dev/${device} mkpart primary ext3 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary $swap_start 100%
+parted /dev/${device} mkpart primary linux-swap $swap_start 100%
 
 parted /dev/${device} print
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 9957c15..10aed07 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -159,21 +159,21 @@ echo "Creating new partition table on /dev/${device} ..."
 if [ $grub_version -eq 0 ] ; then
     parted /dev/${device} mktable msdos
     echo "Creating boot partition on $bootfs"
-    parted /dev/${device} mkpart primary 0% $boot_size
+    parted /dev/${device} mkpart primary ext3 0% $boot_size
 else
     parted /dev/${device} mktable gpt
     echo "Creating BIOS boot partition on $bios_boot"
     parted /dev/${device} mkpart primary 0% $bios_boot_size
     parted /dev/${device} set 1 bios_grub on
     echo "Creating boot partition on $bootfs"
-    parted /dev/${device} mkpart primary $boot_start $boot_size
+    parted /dev/${device} mkpart primary ext3 $boot_start $boot_size
 fi
 
 echo "Creating rootfs partition on $rootfs"
-parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
+parted /dev/${device} mkpart primary ext3 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary $swap_start 100%
+parted /dev/${device} mkpart primary linux-swap $swap_start 100%
 
 parted /dev/${device} print
 
-- 
2.1.4


