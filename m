Return-Path: <laurentiu.palcu@intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 9FE0660F23
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2013 09:03:54 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 05 Sep 2013 02:03:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,845,1371106800"; d="scan'208";a="356239567"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by azsmga001.ch.intel.com with ESMTP; 05 Sep 2013 02:03:55 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Sep 2013 12:03:49 +0300
Message-Id: <458079bc072716290bebe261aa1c24d4c40a2b7a.1378371716.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1378371716.git.laurentiu.palcu@intel.com>
References: <cover.1378371716.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1378371716.git.laurentiu.palcu@intel.com>
References: <cover.1378371716.git.laurentiu.palcu@intel.com>
Subject: [PATCH v2 1/1] image.bbclass: leave metadata in place if a PM is installed in the image
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
X-List-Received-Date: Thu, 05 Sep 2013 09:03:54 -0000

If IMAGE_FEATURES does not contain 'package-management' but the user
manually installs a package manager (opkg/dpkg/rpm) using
CORE_IMAGE_EXTRA_INSTALL (for example), then do not remove update-rc.d,
base-passwd and package metadata because these will be needed by the
package manager to function correcly.

[YOCTO #4484]

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/image.bbclass |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 84f638c..b748397 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -498,7 +498,11 @@ rootfs_install_complementary() {
 }
 
 rootfs_uninstall_unneeded () {
-	if ${@base_contains("IMAGE_FEATURES", "package-management", "false", "true", d)}; then
+	rpm_installed=${@base_contains("PACKAGE_INSTALL", "rpm",  "true", "false", d)}
+	opkg_installed=${@base_contains("PACKAGE_INSTALL", "opkg", "true", "false", d)}
+	dpkg_installed=${@base_contains("PACKAGE_INSTALL", "dpkg", "true", "false", d)}
+
+	if ! $rpm_installed && ! $opkg_installed && ! $dpkg_installed; then
 		if [ -z "$(delayed_postinsts)" ]; then
 			# All packages were successfully configured.
 			# update-rc.d, base-passwd, run-postinsts are no further use, remove them now
-- 
1.7.9.5


