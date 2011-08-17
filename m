Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QtZf4-0004F7-OU
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 08:31:34 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 23:26:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="39163411"
Received: from unknown (HELO swold-MOBL.local) ([10.255.15.2])
	by orsmga001.jf.intel.com with ESMTP; 16 Aug 2011 23:26:53 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 23:26:28 -0700
Message-Id: <dc78cdb318671862c5cd15711364c1c4462d9ece.1313560883.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
In-Reply-To: <cover.1313560883.git.sgw@linux.intel.com>
References: <cover.1313560883.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 05/27] rootfs_rpm: Fix DEFAULTTUNE setting in multilib case
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
X-List-Received-Date: Wed, 17 Aug 2011 06:31:35 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

"virtclass-multilib" is set to OVERRIDES in multilib.bbclass, remove the
duplicated settings here.

Besides, DEFAULTTUNE has overrided and it can be directly used.

[YOCTO #1368]

CC: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/rootfs_rpm.bbclass |    4 ----
 1 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 7c06064..7f24b9c 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -215,10 +215,6 @@ python () {
         eext = ext.split(':')
         if len(eext) > 1 and eext[0] == 'multilib':
             localdata = bb.data.createCopy(d)
-            overrides = localdata.getVar("OVERRIDES", False) + ":virtclass-multilib-" + eext[1]
-            localdata.setVar("OVERRIDES", overrides)
-            # TEMP: OVERRIDES isn't working right
-            localdata.setVar("DEFAULTTUNE", localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False) or "")
             ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
-- 
1.7.6



