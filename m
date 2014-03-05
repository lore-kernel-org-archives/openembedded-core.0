Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D423F6EECA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 12:39:48 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 04:39:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494441783"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 04:39:47 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 14:39:42 +0200
Message-Id: <b431b1bf8b66981e1797e1d9f3119784be306e5e.1394023121.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1394023121.git.laurentiu.palcu@intel.com>
References: <cover.1394023121.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/3] populate_sdk_*.bbclass: remove old rootfs_list_installed_depends()
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
X-List-Received-Date: Wed, 05 Mar 2014 12:39:49 -0000

We're using the python routines now.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_deb.bbclass |    5 -----
 meta/classes/populate_sdk_ipk.bbclass |    4 ----
 meta/classes/populate_sdk_rpm.bbclass |    4 ----
 3 files changed, 13 deletions(-)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index 462525f..833feca 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -10,8 +10,3 @@ do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 
 # This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
 DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
-
-rootfs_list_installed_depends() {
-	# Cheat here a little bit by using the opkg query helper util
-	${DPKG_QUERY_COMMAND} -W -f='Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n' | opkg-query-helper.py
-}
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index 4c23f05..e2e3523 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -2,7 +2,3 @@ do_populate_sdk[depends] += "opkg-native:do_populate_sysroot opkg-utils-native:d
 do_populate_sdk[recrdeptask] += "do_package_write_ipk"
 
 do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
-
-rootfs_list_installed_depends() {
-	opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py
-}
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 06605d3..0fdef3b 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -16,7 +16,3 @@ do_populate_sdk[recrdeptask] += "do_package_write_rpm"
 rpmlibdir = "/var/lib/rpm"
 
 do_populate_sdk[lockfiles] += "${DEPLOY_DIR_RPM}/rpm.lock"
-
-rootfs_list_installed_depends() {
-	rpmresolve -t $INSTALL_ROOTFS_RPM/${rpmlibdir}
-}
-- 
1.7.9.5


