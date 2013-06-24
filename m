Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5706F6A961
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Jun 2013 18:20:05 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2013 11:20:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,929,1363158000"; d="scan'208";a="358805211"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.122.47])
	by orsmga002.jf.intel.com with ESMTP; 24 Jun 2013 11:20:00 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Jun 2013 19:19:07 +0100
Message-Id: <1372097947-27125-1-git-send-email-paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [danny][PATCH] classes/package_rpm: avoid bash being pulled in unnecessarily
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 24 Jun 2013 18:20:05 -0000

The initial installation step for base-passwd, base-files and shadow
will pull in bash if any of these packages depend on /bin/sh and a bash
package has been built, which is undesirable if you are using busybox;
so force the early installation of one or the other depending on which
is going to be installed in the second step.

Note: this fix is not needed for 1.4 (dylan) and newer, since there we
use smart to construct the root filesystem without this initial step.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/package_rpm.bbclass | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 1ff92ce..e6f5912 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -543,6 +543,9 @@ EOF
 		grep /base-passwd-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
 		grep /base-files-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
 		grep /shadow-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
+		# Ensure we get the right shell
+		grep /bash-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
+		grep /busybox-[0-9] ${target_rootfs}/install/total_solution.manifest >> ${target_rootfs}/install/initial_install.manifest || true
 
 		if [ -s ${target_rootfs}/install/initial_install.manifest ]; then
 			echo "# Initial Install manifest padding..." >> ${target_rootfs}/install/initial_install.manifest
-- 
1.8.1.2


