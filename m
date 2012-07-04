Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1SmHSf-00011A-Qn
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 06:45:10 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 03 Jul 2012 21:34:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="166675772"
Received: from fear.jf.intel.com (HELO rage.local) ([10.7.201.160])
	by orsmga002.jf.intel.com with ESMTP; 03 Jul 2012 21:34:05 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Khem Raj <raj.khem@gmail.com>, Tom Zanussi <tom.zanussi@intel.com>,
	Kishore Bodke <kishore.k.bodke@intel.com>, Saul Wold <sgw@linux.intel.com>
Date: Tue,  3 Jul 2012 21:33:58 -0700
Message-Id: <cc3bda9f6375350f8f549a34594cdd338392cc37.1341376182.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.5.4
In-Reply-To: <cover.1341376182.git.dvhart@linux.intel.com>
References: <cover.1341376182.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1341376182.git.dvhart@linux.intel.com>
References: <cover.1341376182.git.dvhart@linux.intel.com>
Subject: [PATCH 1/5] init-install: Use swap_ratio in the calulation of swap_size
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
X-List-Received-Date: Wed, 04 Jul 2012 04:45:10 -0000

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
1.7.5.4



