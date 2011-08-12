Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qrma1-0004dc-CL
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 09:54:57 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 12 Aug 2011 00:50:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37809718"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.248])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 00:50:20 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 00:50:00 -0700
Message-Id: <5e73f3c282f5c9e053502bc559f6747c4ee1133b.1313134270.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313134270.git.sgw@linux.intel.com>
References: <cover.1313134270.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 11/25] init-install.sh: Fix make partition and make file system issues
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
X-List-Received-Date: Fri, 12 Aug 2011 07:55:00 -0000

From: Mei Lei <lei.mei@intel.com>

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
1.7.3.4



