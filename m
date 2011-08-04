Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1Qp5X1-0005MJ-4G
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 23:32:43 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 04 Aug 2011 14:28:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,319,1309762800"; 
   d="scan'208";a="4260467"
Received: from nbuild1.sc.intel.com ([172.25.110.36])
	by AZSMGA002.ch.intel.com with ESMTP; 04 Aug 2011 14:28:16 -0700
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Aug 2011 08:01:48 -0700
Message-Id: <80e4be5ce59752125ef341926ab869acc496dc86.1312469789.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
References: <e5fc6a2b0a315f9ade50a7f357b98068c38d49e3.1312469789.git.nitin.a.kamble@intel.com>
In-Reply-To: <cover.1312469789.git.nitin.a.kamble@intel.com>
References: <cover.1312469789.git.nitin.a.kamble@intel.com>
Subject: [PATCH 02/10] linux-yocto: process the existing branch for configuration
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
X-List-Received-Date: Thu, 04 Aug 2011 21:32:43 -0000

From: Bruce Ashfield <bruce.ashfield@windriver.com>

When building an external tree or bootstrapping a BSP the
external branch may not have been checked out. The tools now ensure
that the tree is ready for configuration, so we no longer need to
force the checkout of the external branch.

Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>
---
 meta/classes/kernel-yocto.bbclass |    9 +--------
 1 files changed, 1 insertions(+), 8 deletions(-)

diff --git a/meta/classes/kernel-yocto.bbclass b/meta/classes/kernel-yocto.bbclass
index a374df1..8df5f31 100644
--- a/meta/classes/kernel-yocto.bbclass
+++ b/meta/classes/kernel-yocto.bbclass
@@ -87,14 +87,7 @@ do_kernel_configme() {
 	echo "[INFO] doing kernel configme"
 
 	kbranch=${KBRANCH}
-	if [ -n "${YOCTO_KERNEL_EXTERNAL_BRANCH}" ]; then
-           # switch from a generic to a specific branch
-           kbranch=${YOCTO_KERNEL_EXTERNAL_BRANCH}
-           cd ${S}
-           git checkout ${kbranch}
-	else
-	   cd ${S}
-	fi
+	cd ${S}
 
 	configme --reconfig --output ${B} ${kbranch} ${MACHINE}
 	if [ $? -ne 0 ]; then
-- 
1.7.6



