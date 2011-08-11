Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lei.mei@intel.com>) id 1QrMom-00085w-Lj
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Aug 2011 06:24:28 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 10 Aug 2011 21:19:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,354,1309762800"; d="scan'208";a="37312787"
Received: from daocaoren-desktop.sh.intel.com (HELO localhost.localdomain)
	([10.239.47.21])
	by azsmga001.ch.intel.com with ESMTP; 10 Aug 2011 21:19:57 -0700
From: Mei Lei <lei.mei@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2011 12:28:06 +0800
Message-Id: <49eea4ada7a2e631cbee10553a43aaeae901523f.1313036597.git.lei.mei@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313036597.git.lei.mei@intel.com>
References: <cover.1313036597.git.lei.mei@intel.com>
In-Reply-To: <cover.1313036597.git.lei.mei@intel.com>
References: <cover.1313036597.git.lei.mei@intel.com>
Subject: [PATCH 1/1] init-install.sh: Fix make partition and make file system issues
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 11 Aug 2011 04:24:28 -0000

[YOCTO #1151]

Change the offset from the beginning of the disk to aligne the blocks.

In this script, we use mkfs.ext3 to create file system after partition, but we use mkpartfs to create file system repeatly,
and get some warnings about choose another specific tools to create file system for reliability.

So use mkpart instead of mkpartfs and only use mkfs.ext3 to create file system.

Signed-off-by: Mei Lei <lei.mei@intel.com>
---
 .../initrdscripts/files/init-install.sh            |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index b9d9029..5e6b81c 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -105,13 +105,13 @@ echo "Creating new partition table on /dev/${device} ..."
 parted /dev/${device} mklabel msdos
 
 echo "Creating boot partition on /dev/${device}1"
-parted /dev/${device} mkpartfs primary ext2 0 $boot_size
+parted /dev/${device} mkpart primary 1 $boot_size
 
 echo "Creating rootfs partition on /dev/${device}2"
-parted /dev/${device} mkpartfs primary ext2 $rootfs_start $rootfs_end 
+parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
 
 echo "Creating swap partition on /dev/${device}3"
-parted /dev/${device} mkpartfs primary linux-swap $swap_start $disk_size
+parted /dev/${device} mkpart primary $swap_start $disk_size
 
 parted /dev/${device} print
 
-- 
1.7.0.4



