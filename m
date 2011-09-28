Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8klu-0004gP-1B
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 05:25:22 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Sep 2011 20:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,452,1312182000"; d="scan'208";a="56414238"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 27 Sep 2011 20:19:53 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 11:28:00 +0800
Message-Id: <496d8749cdb0e441351fdd842f0156465112ff32.1317180056.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1317180055.git.dongxiao.xu@intel.com>
References: <cover.1317180055.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1317180055.git.dongxiao.xu@intel.com>
References: <cover.1317180055.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/5] package_rpm: combine normal and multilib solution manifest together
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
X-List-Received-Date: Wed, 28 Sep 2011 03:25:22 -0000

When RPM does the real install, if the first manifest file is empty, the
installation will stop without handling the second manifest file.

Merge the two manifest files together to fix this issue.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package_rpm.bbclass |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 45de0f8..fa0d8c3 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -395,6 +395,8 @@ package_install_internal_rpm () {
 		-D "__dbi_txn create nofsync private" \
 		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_multilib_solution.manifest
 
+	cat ${target_rootfs}/install/install_solution.manifest > ${target_rootfs}/install/total_solution.manifest
+	cat ${target_rootfs}/install/install_multilib_solution.manifest >> ${target_rootfs}/install/total_solution.manifest
 
 	# Attempt install
 	${RPM} --root ${target_rootfs} \
@@ -403,8 +405,7 @@ package_install_internal_rpm () {
 		-D "_dbpath ${rpmlibdir}" \
 		--noscripts --notriggers --noparentdirs --nolinktos --replacepkgs \
 		-D "__dbi_txn create nofsync private" \
-		-Uhv ${target_rootfs}/install/install_solution.manifest \
-		${target_rootfs}/install/install_multilib_solution.manifest
+		-Uhv ${target_rootfs}/install/total_solution.manifest
 }
 
 python write_specfile () {
-- 
1.7.1



