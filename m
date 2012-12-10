Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <laurentiu.palcu@intel.com>) id 1Ti692-0001QO-75
	for openembedded-core@lists.openembedded.org;
	Mon, 10 Dec 2012 17:23:53 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Dec 2012 08:08:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,252,1355126400"; d="scan'208";a="231728656"
Received: from lpalcu-linux (HELO localhost.localdomain) ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 10 Dec 2012 08:09:19 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 10 Dec 2012 18:09:06 +0200
Message-Id: <d5c9acb38b6e2d962818f15119bb6748d1320dff.1355154246.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1355154246.git.laurentiu.palcu@intel.com>
References: <cover.1355154246.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1355154246.git.laurentiu.palcu@intel.com>
References: <cover.1355154246.git.laurentiu.palcu@intel.com>
Subject: [PATCH 1/2] populate_sdk_(deb|ipk|rpm): export NATIVE_ROOT and INTERCEPT_DIR variables
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
X-List-Received-Date: Mon, 10 Dec 2012 16:24:14 -0000

In order for the postinstall scripts to have access to the recent
improvements when generating the target SDK sysroot, export these
variables in populate_sdk.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_deb.bbclass |    2 ++
 meta/classes/populate_sdk_ipk.bbclass |    2 ++
 meta/classes/populate_sdk_rpm.bbclass |    2 ++
 3 files changed, 6 insertions(+)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index f2d0621..1e28b61 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -34,6 +34,8 @@ populate_sdk_deb () {
 	export INSTALL_PACKAGES_ATTEMPTONLY_DEB="${TOOLCHAIN_TARGET_TASK_ATTEMPTONLY}"
 	export PACKAGES_LINGUAS_DEB=""
 	export INSTALL_TASK_DEB="populate_sdk-target"
+	export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
+	export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 
 	package_install_internal_deb
 
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 65a95e7..3a5ecda 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -26,6 +26,8 @@ populate_sdk_ipk() {
 	export OFFLINE_ROOT=${INSTALL_ROOTFS_IPK}
 	export IPKG_OFFLINE_ROOT=${INSTALL_ROOTFS_IPK}
 	export OPKG_OFFLINE_ROOT=${IPKG_OFFLINE_ROOT}
+	export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
+	export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 
 	package_install_internal_ipk
 
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 1c54049..b5aa601 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -40,6 +40,8 @@ populate_sdk_rpm () {
 	export INSTALL_PROVIDENAME_RPM="/bin/sh /bin/bash /usr/bin/env /usr/bin/perl pkgconfig pkgconfig(pkg-config)"
 	export INSTALL_TASK_RPM="populate_sdk-target"
 	export INSTALL_COMPLEMENTARY_RPM=""
+	export INTERCEPT_DIR=${WORKDIR}/intercept_scripts
+	export NATIVE_ROOT=${STAGING_DIR_NATIVE}
 
 	# Setup base system configuration
 	mkdir -p ${INSTALL_ROOTFS_RPM}/etc/rpm/
-- 
1.7.9.5



