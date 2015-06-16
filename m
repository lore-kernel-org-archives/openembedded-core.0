Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6EADB759FF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jun 2015 08:07:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 16 Jun 2015 01:07:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,624,1427785200"; d="scan'208";a="744225544"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 16 Jun 2015 01:07:56 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id BA3386A4005;
	Tue, 16 Jun 2015 01:07:19 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Jun 2015 09:13:54 +0300
Message-Id: <1434435234-4892-12-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1434435234-4892-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [PATCH v2 11/11] init-install: Properly delete partition table
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
X-List-Received-Date: Tue, 16 Jun 2015 08:07:56 -0000

Fixed deletion of the partition table by increasing
amount of sectors from 2(correct for msdos PT) to 35 as
GPT size is 34 sectors + 1 sector for protective MBR.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi.sh b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
index 74372b0..14939ac 100644
--- a/meta/recipes-core/initrdscripts/files/init-install-efi.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi.sh
@@ -127,7 +127,7 @@ echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
 echo "Swap partition size:   $swap_size MB ($swap)"
 echo "*****************"
 echo "Deleting partition table on ${device} ..."
-dd if=/dev/zero of=${device} bs=512 count=2
+dd if=/dev/zero of=${device} bs=512 count=35
 
 echo "Creating new partition table on ${device} ..."
 parted ${device} mklabel gpt
diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 0593b3c..7fccdde 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -153,7 +153,7 @@ echo "Rootfs partition size: $rootfs_size MB ($rootfs)"
 echo "Swap partition size:   $swap_size MB ($swap)"
 echo "*****************"
 echo "Deleting partition table on ${device} ..."
-dd if=/dev/zero of=${device} bs=512 count=2
+dd if=/dev/zero of=${device} bs=512 count=35
 
 echo "Creating new partition table on ${device} ..."
 if [ $grub_version -eq 0 ] ; then
-- 
2.1.4


