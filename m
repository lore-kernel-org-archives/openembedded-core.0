Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKd-0008Vb-BU
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:26:03 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 03 Aug 2011 08:21:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; 
   d="scan'208";a="3779448"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 08:21:23 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:37 +0800
Message-Id: <ba3e6c58f74119dcdf1c26cfa6f31ab1383004d1.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1312384552.git.dongxiao.xu@intel.com>
References: <cover.1312384552.git.dongxiao.xu@intel.com>
Subject: [PATCH 5/7] multilib: remove MULTILIB_PACKAGE_ARCHS variable
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
X-List-Received-Date: Wed, 03 Aug 2011 15:26:03 -0000

multilib package and normal package shares the same architecture deploy
folder, thus we do not need the ${MULTILIB_PACKAGE_ARCHS}.

CC: Mark Hatle <mark.hatle@windriver.com>
Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package_rpm.bbclass      |   13 ++-----------
 meta/classes/populate_sdk_rpm.bbclass |    3 ---
 meta/classes/rootfs_rpm.bbclass       |    3 ---
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index abedc68..9d0eeba 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -27,8 +27,7 @@ package_update_index_rpm () {
 
 	# Update target packages
 	base_archs="${PACKAGE_ARCHS}"
-	ml_archs="${MULTILIB_PACKAGE_ARCHS}"
-	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
+	package_update_index_rpm_common "${RPMCONF_TARGET_BASE}" base_archs
 
 	# Update SDK packages
 	base_archs="${SDK_PACKAGE_ARCHS}"
@@ -76,7 +75,7 @@ package_update_index_rpm_common () {
 #
 package_generate_rpm_conf () {
 	# Update target packages
-	package_generate_rpm_conf_common "${RPMCONF_TARGET_BASE}" base_archs ml_archs
+	package_generate_rpm_conf_common "${RPMCONF_TARGET_BASE}" base_archs
 
 	# Update SDK packages
 	package_generate_rpm_conf_common "${RPMCONF_HOST_BASE}" base_archs
@@ -203,10 +202,6 @@ package_install_internal_rpm () {
 
 				archvar=base_archs
 				ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-				if [ "${ml_pkg}" != "${pkg}" ]; then
-					archvar=ml_archs
-				fi
-
 				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 				if [ -z "$pkg_name" ]; then
 					echo "Unable to find package $pkg ($ml_pkg)!"
@@ -223,10 +218,6 @@ package_install_internal_rpm () {
 
 			archvar=base_archs
 			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-			if [ "${ml_pkg}" != "${pkg}" ]; then
-				archvar=ml_archs
-			fi
-
 			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
 				echo "Unable to find package $pkg ($ml_pkg)!"
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index 5fb0234..f33e4a9 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -115,7 +115,6 @@ EOF
 }
 
 python () {
-    ml_package_archs = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -125,8 +124,6 @@ python () {
             localdata.setVar("OVERRIDES", overrides)
             # TEMP: OVERRIDES isn't working right
             localdata.setVar("DEFAULTTUNE", localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False) or "")
-            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
-    bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
 }
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 7c06064..c188d27 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -209,7 +209,6 @@ python () {
         bb.data.setVar('RPM_PREPROCESS_COMMANDS', '', d)
         bb.data.setVar('RPM_POSTPROCESS_COMMANDS', '', d)
 
-    ml_package_archs = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -219,7 +218,5 @@ python () {
             localdata.setVar("OVERRIDES", overrides)
             # TEMP: OVERRIDES isn't working right
             localdata.setVar("DEFAULTTUNE", localdata.getVar("DEFAULTTUNE_virtclass-multilib-" + eext[1], False) or "")
-            ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
-    bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
 }
-- 
1.7.1



