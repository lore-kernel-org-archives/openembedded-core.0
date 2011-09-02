Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QzPgV-0003UH-1d
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Sep 2011 11:05:11 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 02 Sep 2011 02:00:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="44666369"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 02 Sep 2011 02:00:13 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Sep 2011 17:03:35 +0800
Message-Id: <bda5bcd76bebed29dafb85b0ee85a7fb7ffa735d.1314953755.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1314953755.git.dongxiao.xu@intel.com>
References: <cover.1314953755.git.dongxiao.xu@intel.com>
Subject: [PATCH 2/5] rootfs_rpm: setting DEFAULTTUNE for multilib archs
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
X-List-Received-Date: Fri, 02 Sep 2011 09:05:11 -0000

To get the MULTILIB_PACKAGE_ARCHS, we need to get the corresponding
DEFAULTTUNE value. This fixes the multilib arch directory missing issue
in solvedb-ml_archs.conf.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/rootfs_rpm.bbclass |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 7f24b9c..135ca75 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -215,6 +215,9 @@ python () {
         eext = ext.split(':')
         if len(eext) > 1 and eext[0] == 'multilib':
             localdata = bb.data.createCopy(d)
+            default_tune = localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False)
+            if default_tune:
+                localdata.setVar("DEFAULTTUNE", default_tune)
             ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
-- 
1.7.1



