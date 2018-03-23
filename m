Return-Path: <anuj.mittal@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 01E6D788CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2018 11:37:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Mar 2018 04:37:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,349,1517904000"; d="scan'208";a="213974961"
Received: from jwsimmon-mobl1.amr.corp.intel.com (HELO
	anmitta2-MOBL1.gar.corp.intel.com) ([10.255.174.146])
	by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2018 04:37:22 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2018 19:37:16 +0800
Message-Id: <1521805036-32228-1-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH] init-install: format rootfs partition as ext4
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
X-List-Received-Date: Fri, 23 Mar 2018 11:37:23 -0000

Use ext4 filesystem instead of ext3 when using the live image to install
on target. wic defaults to ext4 as well.

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-core/initrdscripts/files/init-install-efi.sh | 6 +++---
 meta/recipes-core/initrdscripts/files/init-install.sh     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index f946d97..43b75b0 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -179,7 +179,7 @@ parted ${device} mkpart boot fat32 0% $boot_size
 parted ${device} set 1 boot on
 
 echo "Creating rootfs partition on $rootfs"
-parted ${device} mkpart root ext3 $rootfs_start $rootfs_end
+parted ${device} mkpart root ext4 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
 parted ${device} mkpart swap linux-swap $swap_start 100%
@@ -196,8 +196,8 @@ done
 echo "Formatting $bootfs to vfat..."
 mkfs.vfat $bootfs
 
-echo "Formatting $rootfs to ext3..."
-mkfs.ext3 $rootfs
+echo "Formatting $rootfs to ext4..."
+mkfs.ext4 $rootfs
 
 echo "Formatting swap partition...($swap)"
 mkswap $swap
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 713a830..aa94766 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -203,7 +203,7 @@ fi
 
 echo "Creating rootfs partition on $rootfs"
 [ $grub_version -eq 0 ] && pname='primary' || pname='root'
-parted ${device} mkpart $pname ext3 $rootfs_start $rootfs_end
+parted ${device} mkpart $pname ext4 $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
 [ $grub_version -eq 0 ] && pname='primary' || pname='swap'
@@ -221,8 +221,8 @@ done
 echo "Formatting $bootfs to ext3..."
 mkfs.ext3 $bootfs
 
-echo "Formatting $rootfs to ext3..."
-mkfs.ext3 $rootfs
+echo "Formatting $rootfs to ext4..."
+mkfs.ext4 $rootfs
 
 echo "Formatting swap partition...($swap)"
 mkswap $swap
-- 
2.7.4


