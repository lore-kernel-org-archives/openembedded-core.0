Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMm-00065B-K3
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:17 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292909"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:01 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:37 -0700
Message-Id: <fb978607412d3aff3512533cc4ea64ebf8ff7041.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 23/41] init-install: Clean up partition alignment
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
X-List-Received-Date: Mon, 09 Jul 2012 15:59:17 -0000

From: Darren Hart <dvhart@linux.intel.com>

The current partitioning scheme leaves a 1MB gap between all the
generated partitions by adding a 1 to the end of the last partition to
use as the start of the next. parted is smart enough to not overlap
start and end positions of the same value. This avoids the 1 MB gaps.

Rather than pad the disk with 1MB in the beginning and cut it off at the
MB boundary on the end, we can use 0% and 100% to allow parted to do the
required math and use as much of the disk as possible.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../initrdscripts/files/init-install.sh            |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 8d21dd1..0ac4949 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -84,9 +84,9 @@ disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | s
 swap_size=$((disk_size*swap_ratio/100))
 rootfs_size=$((disk_size-boot_size-swap_size))
 
-rootfs_start=$((boot_size + 1))
+rootfs_start=$((boot_size))
 rootfs_end=$((rootfs_start+rootfs_size))
-swap_start=$((rootfs_end+1))
+swap_start=$((rootfs_end))
 
 # MMC devices are special in a couple of ways
 # 1) they use a partition prefix character 'p'
@@ -113,13 +113,13 @@ echo "Creating new partition table on /dev/${device} ..."
 parted /dev/${device} mklabel msdos
 
 echo "Creating boot partition on $bootfs"
-parted /dev/${device} mkpart primary 1 $boot_size
+parted /dev/${device} mkpart primary 0% $boot_size
 
 echo "Creating rootfs partition on $rootfs"
 parted /dev/${device} mkpart primary $rootfs_start $rootfs_end
 
 echo "Creating swap partition on $swap"
-parted /dev/${device} mkpart primary $swap_start $disk_size
+parted /dev/${device} mkpart primary $swap_start 100%
 
 parted /dev/${device} print
 
-- 
1.7.7.6



