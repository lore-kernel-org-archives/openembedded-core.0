Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R8oJ9-000423-P2
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 09:11:56 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 28 Sep 2011 00:06:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,453,1312182000"; d="scan'208";a="21360979"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.219])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Sep 2011 00:06:15 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 00:06:00 -0700
Message-Id: <35dd1e73860facf8ff2b35a4dbc394e221d132a6.1317193251.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
In-Reply-To: <cover.1317193250.git.sgw@linux.intel.com>
References: <cover.1317193250.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 24/29] package_rpm: combine normal and multilib solution manifest together
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
X-List-Received-Date: Wed, 28 Sep 2011 07:11:59 -0000

From: Dongxiao Xu <dongxiao.xu@intel.com>

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
1.7.6



