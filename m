Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <paul.eggleton@linux.intel.com>) id 1U35uM-0000tv-5t
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Feb 2013 15:23:33 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Feb 2013 06:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,615,1355126400"; d="scan'208";a="287349754"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.120.80])
	by fmsmga002.fm.intel.com with ESMTP; 06 Feb 2013 06:07:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@intel.com>
Date: Wed,  6 Feb 2013 14:07:26 +0000
Message-Id: <f31f33c04c363ee10814d11430520bee42f5230d.1360159588.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360159588.git.paul.eggleton@linux.intel.com>
References: <cover.1360159588.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1360159588.git.paul.eggleton@linux.intel.com>
References: <cover.1360159588.git.paul.eggleton@linux.intel.com>
Subject: [for-danny][PATCH 1/1] classes/rootfs_rpm: fix missed complementary packages with complex arch names
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Feb 2013 14:23:46 -0000

If the package architecture name is complex (e.g. with the meta-yocto-bsp
beagleboard machine and Poky, the architecture-specific package name is
"armv7a-vfp-neon"), rpm reports architecture names that contain
underscores instead of dashes, which when passed to oe-pkgdata-util
during complementary package processing did not match a valid pkginfo
path. Replacing the underscores with dashes again fixes the issue.

Note that this bug affects the danny branch and not master since the
substitution is already performed there in a different manner.

Fixes [YOCTO #3792]

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/rootfs_rpm.bbclass |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index d95ccfa..877845a 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -151,7 +151,7 @@ list_installed_packages() {
 
 	# print the info, need to different return counts
 	if [ "$1" = "arch" ] ; then
-		echo "$GET_LIST" | awk '{print $1, $2}'
+		echo "$GET_LIST" | awk '{PN=$1; gsub("_", "-"); print PN, $2}'
         elif [ "$1" = "file" ] ; then
 		echo "$GET_LIST" | awk '{print $1, $3}'
         else
-- 
1.7.10.4



