Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1TgYMG-0003LM-P0
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Dec 2012 11:07:09 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 06 Dec 2012 01:52:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,229,1355126400"; d="scan'208";a="259828665"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by fmsmga002.fm.intel.com with ESMTP; 06 Dec 2012 01:52:41 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Dec 2012 11:52:40 +0200
Message-Id: <1354787560-9601-1-git-send-email-laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH] populate_sdk_deb.bbclass: put back INSTALL_PACKAGES_NORMAL_DEB
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
X-List-Received-Date: Thu, 06 Dec 2012 10:07:09 -0000

This commit (0b0674ebcd8a51783e4bb38e3ead3e419dbba376) was also changing
the populate_sdk_deb.bbclass but the deb backend does not support
multilib just yet. So, when compiling the standalone toolchain tarball,
we ended up with an empty tarball if the deb package manager was chosen.

Reverting the deb part until the multilib support is added to deb.

[YOCTO #3532]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_deb.bbclass |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index f2d0621..48a638e 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -30,7 +30,7 @@ populate_sdk_deb () {
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}/${SDKTARGETSYSROOT}"
 	export INSTALL_BASEARCH_DEB="${DPKG_ARCH}"
 	export INSTALL_ARCHS_DEB="${PACKAGE_ARCHS}"
-	export INSTALL_PACKAGES_DEB="${TOOLCHAIN_TARGET_TASK}"
+	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_TARGET_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-target"
@@ -48,7 +48,7 @@ populate_sdk_deb () {
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
 	export INSTALL_BASEARCH_DEB="${DEB_SDK_ARCH}"
 	export INSTALL_ARCHS_DEB="${SDK_PACKAGE_ARCHS}"
-	export INSTALL_PACKAGES_DEB="${TOOLCHAIN_HOST_TASK}"
+	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_HOST_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-nativesdk"
-- 
1.7.9.5



