Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SoGMl-00065Z-No
	for openembedded-core@lists.openembedded.org;
	Mon, 09 Jul 2012 17:59:16 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jul 2012 08:48:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="190292901"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.157])
	by fmsmga002.fm.intel.com with ESMTP; 09 Jul 2012 08:48:00 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Jul 2012 08:47:35 -0700
Message-Id: <b9fb8df4672bd8ab8a8a4a8d0dd5900a753b375e.1341802889.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
In-Reply-To: <cover.1341802889.git.sgw@linux.intel.com>
References: <cover.1341802889.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 21/41] init-install: Use swap_ratio in the calulation of swap_size
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

swap_size currently uses a hard coded percentage and ignores the
swap_ratio variable. Fortunately they are the same value currently. Make
the calculation use the variable to avoid problems in the future.

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 .../initrdscripts/files/init-install.sh            |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/initrdscripts/files/init-install.sh b/meta/recipes-core/initrdscripts/files/init-install.sh
index 01ff829..3005f20 100644
--- a/meta/recipes-core/initrdscripts/files/init-install.sh
+++ b/meta/recipes-core/initrdscripts/files/init-install.sh
@@ -81,7 +81,7 @@ cat /proc/mounts > /etc/mtab
 
 disk_size=$(parted /dev/${device} unit mb print | grep Disk | cut -d" " -f 3 | sed -e "s/MB//")
 
-swap_size=$((disk_size*5/100))
+swap_size=$((disk_size*swap_ratio/100))
 rootfs_size=$((disk_size-boot_size-swap_size))
 
 rootfs_start=$((boot_size + 1))
-- 
1.7.7.6



