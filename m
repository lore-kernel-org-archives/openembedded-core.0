Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R3idX-0003xV-1D
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Sep 2011 08:07:55 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 13 Sep 2011 23:02:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,378,1312182000"; d="scan'208";a="16898091"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 13 Sep 2011 23:02:41 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Sep 2011 14:08:17 +0800
Message-Id: <61ef31a1ccad6326a08f07fd5d4a891e8bd1f253.1315980095.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1315980095.git.dongxiao.xu@intel.com>
References: <cover.1315980095.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1315980095.git.dongxiao.xu@intel.com>
References: <cover.1315980095.git.dongxiao.xu@intel.com>
Subject: [PATCH 3/3] multilib: install MULTILIB_IMAGE_INSTALL
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
X-List-Received-Date: Wed, 14 Sep 2011 06:07:55 -0000

If user set MULTILIB_IMAGE_INSTALL, we need to install those multitlib
packages into the final image.

Also fix the logic in handling multilib prefix. For certain case like a
normal image contains several multilib libraries, the image recipe isn't
extended with MLPREFIX, therefore we need to enumerate the possible
multilib prefixes and compare them with package prefixes.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package_rpm.bbclass |   42 +++++++++++++++++++++++++------------
 meta/classes/rootfs_rpm.bbclass  |    4 +++
 2 files changed, 32 insertions(+), 14 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index ea0a079..5e5fb6c 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -166,7 +166,7 @@ package_install_internal_rpm () {
 	local platform="${INSTALL_PLATFORM_RPM}"
 	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
 	local confbase="${INSTALL_CONFBASE_RPM}"
-	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
+	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM} ${INSTALL_PACKAGES_MULTILIB_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
 	local providename="${INSTALL_PROVIDENAME_RPM}"
@@ -210,10 +210,15 @@ package_install_internal_rpm () {
 				echo "Processing $pkg..."
 
 				archvar=base_archs
-				ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-				if [ "${ml_pkg}" != "${pkg}" ]; then
-					archvar=ml_archs
-				fi
+				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+				ml_pkg=$pkg
+				for i in ${MULTILIB_PREFIX_LIST} ; do
+					if [ ${ml_prefix} == ${i} ]; then
+						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+						archvar=ml_archs
+						break
+					fi
+				done
 
 				pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 				if [ -z "$pkg_name" ]; then
@@ -224,16 +229,20 @@ package_install_internal_rpm () {
 			done
 		fi
 	fi
-
 	if [ ! -z "${package_to_install}" ]; then
 		for pkg in ${package_to_install} ; do
 			echo "Processing $pkg..."
 
 			archvar=base_archs
-			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-			if [ "${ml_pkg}" != "${pkg}" ]; then
-				archvar=ml_archs
-			fi
+			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+			ml_pkg=$pkg
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				if [ ${ml_prefix} == ${i} ]; then
+					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+					archvar=ml_archs
+					break
+				fi
+			done
 
 			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
@@ -258,10 +267,15 @@ package_install_internal_rpm () {
 		for pkg in ${package_attemptonly} ; do
 			echo "Processing $pkg..."
 			archvar=base_archs
-			ml_pkg=$(echo ${pkg} | sed "s,^${MLPREFIX}\(.*\),\1,")
-			if [ "${ml_pkg}" != "${pkg}" ]; then
-				archvar=ml_archs
-			fi
+			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+			ml_pkg=$pkg
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				if [ ${ml_prefix} == ${i} ]; then
+					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+					archvar=ml_archs
+					break
+				fi
+			done
 
 			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
 			if [ -z "$pkg_name" ]; then
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index 56c1a85..ec58700 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -58,6 +58,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_MULTILIB_RPM="${MULTILIB_PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
 	export INSTALL_PROVIDENAME_RPM=""
@@ -210,6 +211,7 @@ python () {
         bb.data.setVar('RPM_POSTPROCESS_COMMANDS', '', d)
 
     ml_package_archs = ""
+    ml_prefix_list = ""
     multilibs = d.getVar('MULTILIBS', True) or ""
     for ext in multilibs.split():
         eext = ext.split(':')
@@ -222,6 +224,8 @@ python () {
             if machine:
                 localdata.setVar("MACHINE", machine)
             ml_package_archs += localdata.getVar("PACKAGE_ARCHS", True) or ""
+            ml_prefix_list += " " + eext[1]
             #bb.note("ML_PACKAGE_ARCHS %s %s %s" % (eext[1], localdata.getVar("PACKAGE_ARCHS", True) or "(none)", overrides))
     bb.data.setVar('MULTILIB_PACKAGE_ARCHS', ml_package_archs, d)
+    bb.data.setVar('MULTILIB_PREFIX_LIST', ml_prefix_list, d)
 }
-- 
1.7.1



