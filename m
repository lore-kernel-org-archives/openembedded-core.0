Return-Path: <laurentiu.palcu@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AFDD86F1C4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Feb 2014 10:51:21 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 19 Feb 2014 02:47:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,504,1389772800"; d="scan'208";a="477586675"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.45])
	by fmsmga001.fm.intel.com with ESMTP; 19 Feb 2014 02:51:21 -0800
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Feb 2014 12:51:17 +0200
Message-Id: <15ce4b01408e1ec91655103191c4c9436d894597.1392806896.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1392806896.git.laurentiu.palcu@intel.com>
References: <cover.1392806896.git.laurentiu.palcu@intel.com>
In-Reply-To: <cover.1392806896.git.laurentiu.palcu@intel.com>
References: <cover.1392806896.git.laurentiu.palcu@intel.com>
Subject: [PATCH 3/3] populate_sdk_*.bbclass: remove left over bash routines
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
X-List-Received-Date: Wed, 19 Feb 2014 10:51:22 -0000

The list_installed_packages bash routine is no longer needed here. We've
got a python replacement.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@intel.com>
---
 meta/classes/populate_sdk_deb.bbclass |   21 ---------------------
 meta/classes/populate_sdk_ipk.bbclass |   20 --------------------
 2 files changed, 41 deletions(-)

diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index d03b055..462525f 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -11,27 +11,6 @@ do_populate_sdk[lockfiles] += "${DEPLOY_DIR_DEB}/deb.lock"
 # This will of course only work after rootfs_deb_do_rootfs or populate_sdk_deb has been called
 DPKG_QUERY_COMMAND = "${STAGING_BINDIR_NATIVE}/dpkg-query --admindir=$INSTALL_ROOTFS_DEB/var/lib/dpkg"
 
-list_installed_packages() {
-	if [ "$1" = "arch" ] ; then
-		# Here we want the PACKAGE_ARCH not the deb architecture
-		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch}\n'
-	elif [ "$1" = "file" ] ; then
-		${DPKG_QUERY_COMMAND} -W -f='${Package} ${Package}_${Version}_${Architecture}.deb ${PackageArch}\n' | while read pkg pkgfile pkgarch
-		do
-			fullpath=`find ${DEPLOY_DIR_DEB} -name "$pkgfile" || true`
-			if [ "$fullpath" = "" ] ; then
-				echo "$pkg $pkgfile $pkgarch"
-			else
-				echo "$pkg $fullpath $pkgarch"
-			fi
-		done
-	elif [ "$1" = "ver" ] ; then
-		${DPKG_QUERY_COMMAND} -W -f='${Package} ${PackageArch} ${Version}\n'
-	else
-		${DPKG_QUERY_COMMAND} -W -f='${Package}\n'
-	fi
-}
-
 rootfs_list_installed_depends() {
 	# Cheat here a little bit by using the opkg query helper util
 	${DPKG_QUERY_COMMAND} -W -f='Package: ${Package}\nDepends: ${Depends}\nRecommends: ${Recommends}\n\n' | opkg-query-helper.py
diff --git a/meta/classes/populate_sdk_ipk.bbclass b/meta/classes/populate_sdk_ipk.bbclass
index f51a22c..4c23f05 100644
--- a/meta/classes/populate_sdk_ipk.bbclass
+++ b/meta/classes/populate_sdk_ipk.bbclass
@@ -3,26 +3,6 @@ do_populate_sdk[recrdeptask] += "do_package_write_ipk"
 
 do_populate_sdk[lockfiles] += "${WORKDIR}/ipk.lock"
 
-list_installed_packages() {
-	if [ "$1" = "arch" ] ; then
-		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -a
-	elif [ "$1" = "file" ] ; then
-		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -f | while read pkg pkgfile pkgarch
-		do
-			fullpath=`find ${DEPLOY_DIR_IPK} -name "$pkgfile" || true`
-			if [ "$fullpath" = "" ] ; then
-				echo "$pkg $pkgfile $pkgarch"
-			else
-				echo "$pkg $fullpath $pkgarch"
-			fi
-		done
-	elif [ "$1" = "ver" ] ; then
-		opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py -v
-	else
-		opkg-cl ${OPKG_ARGS} list_installed | awk '{ print $1 }'
-	fi
-}
-
 rootfs_list_installed_depends() {
 	opkg-cl ${OPKG_ARGS} status | opkg-query-helper.py
 }
-- 
1.7.9.5


