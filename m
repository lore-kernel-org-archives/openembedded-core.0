Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X2-0005MJ-7l
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:44 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260468"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:16 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:49 -0700
Message-Id: <6550691dbf59ad6bed0d4db2b5a920edae3286ca.1312469790.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 03/10] linux-yocto: pass KMACHINE to updateme, not MACHINE
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:44 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

To support the mapping of any oe/yocto MACHINE to a kernel
branch that may not share that naming structure we have
KMACHINE and KBRANCH. To allow the mapping to work, we
actually have to pass KMACHINE into updateme and not MACHINE.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index 8df5f31..e242165 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -28,7 +28,7 @@ do_patch() {
 			addon_features="$addon_features --feature $feat"
 		done
 	fi
-	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${MACHINE} ${WORKDIR}
+	updateme --branch ${kbranch} ${addon_features} ${ARCH} ${KMACHINE} ${WORKDIR}
 	if [ $? -ne 0 ]; then
 		echo "ERROR. Could not update ${kbranch}"
 		exit 1
-- 
1.7.6



