Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 02E2175977
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 18:05:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 15 Jun 2015 11:04:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,620,1427785200"; d="scan'208";a="508663709"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Jun 2015 11:04:50 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 224676A4083;
	Mon, 15 Jun 2015 11:04:13 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jun 2015 19:10:45 +0300
Message-Id: <1434384647-2901-9-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434384647-2901-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH 08/10] init-install: Specify partition name in parted command line
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
X-List-Received-Date: Mon, 15 Jun 2015 18:05:12 -0000

parted allows to use names for partitions if GPT partition table
is used on the device. msdos partitioning can have only partition
types: 'primary', 'logical' or 'extended'.

Used meaningful partition names in parted command line for GPT
partitioning.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 7f3e889..a6a8679 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -134,14 +134,14 @@ echo "Creating new partition table on /dev/${device} ..."
 parted /dev/${device} mklabel gpt
 
 echo "Creating boot partition on $bootfs"
-parted /dev/${device} mkpart primary fat32 0% $boot_size
+parted /dev/${device} mkpart boot fat32 0% $boot_size
 parted /dev/${device} set 1 boot on
 
 echo "Creating rootfs partition on $rootfs"
-parted /dev/${device} mkpart primary ext3 $rootfs_start $rootfs_end
+parted /dev/${device} mkpart root ext3 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary linux-swap $swap_start 100%
+parted /dev/${device} mkpart swap linux-swap $swap_start 100%
 
 parted /dev/${device} print
 
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index ee191a4..2c5d530 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -163,17 +163,19 @@ if [ $grub_version -eq 0 ] ; then
 else
     parted /dev/${device} mktable gpt
     echo "Creating BIOS boot partition on $bios_boot"
-    parted /dev/${device} mkpart primary 0% $bios_boot_size
+    parted /dev/${device} mkpart bios_boot 0% $bios_boot_size
     parted /dev/${device} set 1 bios_grub on
     echo "Creating boot partition on $bootfs"
-    parted /dev/${device} mkpart primary ext3 $boot_start $boot_size
+    parted /dev/${device} mkpart boot ext3 $boot_start $boot_size
 fi
 
 echo "Creating rootfs partition on $rootfs"
-parted /dev/${device} mkpart primary ext3 $rootfs_start $rootfs_end
+[ $grub_version -eq 0 ] && pname='primary' || pname='root'
+parted /dev/${device} mkpart $pname ext3 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary linux-swap $swap_start 100%
+[ $grub_version -eq 0 ] && pname='primary' || pname='swap'
+parted /dev/${device} mkpart $pname linux-swap $swap_start 100%
 
 parted /dev/${device} print
 
-- 
2.1.4


