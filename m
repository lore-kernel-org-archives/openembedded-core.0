Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1RNesr-0002dk-DM
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Nov 2011 07:10:10 +0100
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 07 Nov 2011 22:03:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="72120569"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 07 Nov 2011 22:03:53 -0800
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Nov 2011 14:19:37 +0800
Message-Id: <8d5fb3fc99567457b497c859f333fe68b49806cb.1320732950.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1320732950.git.dongxiao.xu@intel.com>
References: <cover.1320732950.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1320732950.git.dongxiao.xu@intel.com>
References: <cover.1320732950.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] multilib: Drop MULTILIB_IMAGE_INSTALL
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
X-List-Received-Date: Tue, 08 Nov 2011 06:10:10 -0000

There should just be a single IMAGE_INSTALL variable. If the package
backends need this split into different multilib components they should
be responsible for doing this, not the user.

This commit removes the MULTILIB_IMAGE_INSTALL variable.

[YOCTO #1564]

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/image.bbclass       |    4 +---
 meta/classes/multilib.bbclass    |    5 ++---
 meta/classes/package_ipk.bbclass |   31 ++++++++++++++++++++++++++++---
 meta/classes/package_rpm.bbclass |   37 +++++++++----------------------------
 meta/classes/rootfs_ipk.bbclass  |    3 +--
 meta/classes/rootfs_rpm.bbclass  |    3 +--
 6 files changed, 42 insertions(+), 41 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 05f4331..48b78da 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -5,8 +5,7 @@ inherit imagetest-${IMAGETEST}
 
 LICENSE = "MIT"
 PACKAGES = ""
-MULTILIB_IMAGE_INSTALL ?= ""
-RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${MULTILIB_IMAGE_INSTALL} ${NORMAL_FEATURE_INSTALL}"
+RDEPENDS += "${IMAGE_INSTALL} ${LINGUAS_INSTALL} ${NORMAL_FEATURE_INSTALL}"
 RRECOMMENDS += "${NORMAL_FEATURE_INSTALL_OPTIONAL}"
 
 INHIBIT_DEFAULT_DEPS = "1"
@@ -54,7 +53,6 @@ IMAGE_INSTALL ?= ""
 IMAGE_INSTALL[type] = "list"
 IMAGE_BASENAME[export] = "1"
 export PACKAGE_INSTALL ?= "${IMAGE_INSTALL} ${FEATURE_INSTALL}"
-export MULTILIB_PACKAGE_INSTALL ?= "${MULTILIB_IMAGE_INSTALL}"
 PACKAGE_INSTALL_ATTEMPTONLY ?= "${FEATURE_INSTALL_OPTIONAL}"
 
 # Images are generally built explicitly, do not need to be part of world.
diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 1aed2a9..6eb3bc3 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -56,9 +56,8 @@ python __anonymous () {
         map_dependencies("PACKAGE_INSTALL", d)
         map_dependencies("LINGUAS_INSTALL", d)
         map_dependencies("RDEPENDS", d)
-        pinstall = d.getVar("LINGUAS_INSTALL", True) + " " + d.getVar("PACKAGE_INSTALL", True) + " " + d.getVar("MULTILIB_PACKAGE_INSTALL", False)
-        d.setVar("MULTILIB_PACKAGE_INSTALL", pinstall)
-        d.setVar("PACKAGE_INSTALL", "")
+        pinstall = d.getVar("LINGUAS_INSTALL", True) + " " + d.getVar("PACKAGE_INSTALL", True)
+        d.setVar("PACKAGE_INSTALL", pinstall)
         d.setVar("LINGUAS_INSTALL", "")
         # FIXME, we need to map this to something, not delete it!
         d.setVar("PACKAGE_INSTALL_ATTEMPTONLY", "")
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index c97e36e..d41b40d 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -86,12 +86,34 @@ package_tryout_install_multilib_ipk() {
 		fi
 	done
 }
+
+split_multilib_packages() {
+	INSTALL_PACKAGES_NORMAL_IPK=""
+	INSTALL_PACKAGES_MULTILIB_IPK=""
+	for pkg in ${INSTALL_PACKAGES_IPK}; do
+		is_multilib=0
+		for item in ${MULTILIB_VARIANTS}; do
+			local pkgname_prefix="${item}-"
+			if [ ${pkg:0:${#pkgname_prefix}} == ${pkgname_prefix} ]; then
+				is_multilib=1
+				break
+			fi
+		done
+
+		if [ ${is_multilib} = 0 ]; then
+			INSTALL_PACKAGES_NORMAL_IPK="${INSTALL_PACKAGES_NORMAL_IPK} ${pkg}"
+		else
+			INSTALL_PACKAGES_MULTILIB_IPK="${INSTALL_PACKAGES_MULTILIB_IPK} ${pkg}"
+		fi
+	done
+}
+
 #
 # install a bunch of packages using opkg
 # the following shell variables needs to be set before calling this func:
 # INSTALL_ROOTFS_IPK - install root dir
 # INSTALL_CONF_IPK - configuration file
-# INSTALL_PACKAGES_NORMAL_IPK - packages to be installed
+# INSTALL_PACKAGES_IPK - packages to be installed
 # INSTALL_PACKAGES_ATTEMPTONLY_IPK - packages attemped to be installed only
 # INSTALL_PACKAGES_LINGUAS_IPK - additional packages for uclibc
 # INSTALL_TASK_IPK - task name
@@ -100,12 +122,15 @@ package_install_internal_ipk() {
 
 	local target_rootfs="${INSTALL_ROOTFS_IPK}"
 	local conffile="${INSTALL_CONF_IPK}"
-	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_IPK}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_IPK}"
-	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
 	local task="${INSTALL_TASK_IPK}"
 
+	split_multilib_packages
+
+	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
+	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
+
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
 
 	local ipkg_args="-f ${conffile} -o ${target_rootfs} --force-overwrite"
diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 7f42583..df5a2db 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -154,7 +154,7 @@ resolve_package_rpm () {
 # INSTALL_PLATFORM_RPM - main platform
 # INSTALL_PLATFORM_EXTRA_RPM - extra platform
 # INSTALL_CONFBASE_RPM - configuration file base name
-# INSTALL_PACKAGES_NORMAL_RPM - packages to be installed
+# INSTALL_PACKAGES_RPM - packages to be installed
 # INSTALL_PACKAGES_ATTEMPTONLY_RPM - packages attemped to be installed only
 # INSTALL_PACKAGES_LINGUAS_RPM - additional packages for uclibc
 # INSTALL_PROVIDENAME_RPM - content for provide name
@@ -166,8 +166,7 @@ package_install_internal_rpm () {
 	local platform="${INSTALL_PLATFORM_RPM}"
 	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
 	local confbase="${INSTALL_CONFBASE_RPM}"
-	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
-	local multilib_to_install="${INSTALL_PACKAGES_MULTILIB_RPM}"
+	local package_to_install="${INSTALL_PACKAGES_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
 	local providename="${INSTALL_PROVIDENAME_RPM}"
@@ -211,12 +210,14 @@ package_install_internal_rpm () {
 				echo "Processing $pkg..."
 
 				archvar=base_archs
+				manifest=install.manifest
 				ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 				ml_pkg=$pkg
 				for i in ${MULTILIB_PREFIX_LIST} ; do
 					if [ ${ml_prefix} == ${i} ]; then
 						ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 						archvar=ml_archs
+						manifest=install_multilib.manifest
 						break
 					fi
 				done
@@ -226,7 +227,7 @@ package_install_internal_rpm () {
 					echo "Unable to find package $pkg ($ml_pkg)!"
 					exit 1
 				fi
-				echo $pkg_name >> ${target_rootfs}/install/install.manifest
+				echo $pkg_name >> ${target_rootfs}/install/${manifest}
 			done
 		fi
 	fi
@@ -235,12 +236,14 @@ package_install_internal_rpm () {
 			echo "Processing $pkg..."
 
 			archvar=base_archs
+			manifest=install.manifest
 			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
 			ml_pkg=$pkg
 			for i in ${MULTILIB_PREFIX_LIST} ; do
 				if [ ${ml_prefix} == ${i} ]; then
 					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
 					archvar=ml_archs
+					manifest=install_multilib.manifest
 					break
 				fi
 			done
@@ -250,7 +253,7 @@ package_install_internal_rpm () {
 				echo "Unable to find package $pkg ($ml_pkg)!"
 				exit 1
 			fi
-			echo $pkg_name >> ${target_rootfs}/install/install.manifest
+			echo $pkg_name >> ${target_rootfs}/install/${manifest}
 		done
 	fi
 
@@ -356,29 +359,7 @@ package_install_internal_rpm () {
 
 	touch ${target_rootfs}/install/install_multilib_solution.manifest
 
-	if [ ! -z "${multilib_to_install}" ]; then
-		for pkg in ${multilib_to_install} ; do
-			echo "Processing $pkg..."
-
-			archvar=base_archs
-			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
-			ml_pkg=$pkg
-			for i in ${MULTILIB_PREFIX_LIST} ; do
-				if [ ${ml_prefix} == ${i} ]; then
-					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
-					archvar=ml_archs
-					break
-				fi
-			done
-
-			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
-			if [ -z "$pkg_name" ]; then
-				echo "Unable to find package $pkg ($ml_pkg)!"
-				exit 1
-			fi
-			echo $pkg_name >> ${target_rootfs}/install/install_multilib.manifest
-		done
-
+	if [ -e "${target_rootfs}/install/install_multilib.manifest" ]; then
 		# multilib package installation
 
 		# Generate an install solution by doing a --justdb install, then recreate it with
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 3094c1a..ffc4a72 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -58,8 +58,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 
 	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
-	export INSTALL_PACKAGES_NORMAL_IPK="${PACKAGE_INSTALL}"
-	export INSTALL_PACKAGES_MULTILIB_IPK="${MULTILIB_PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_IPK="${PACKAGE_INSTALL}"
 
 	package_install_internal_ipk
 
diff --git a/meta/classes/rootfs_rpm.bbclass b/meta/classes/rootfs_rpm.bbclass
index dd370b2..9f50764 100644
--- a/meta/classes/rootfs_rpm.bbclass
+++ b/meta/classes/rootfs_rpm.bbclass
@@ -57,8 +57,7 @@ fakeroot rootfs_rpm_do_rootfs () {
 	export INSTALL_ROOTFS_RPM="${IMAGE_ROOTFS}"
 	export INSTALL_PLATFORM_RPM="${TARGET_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_TARGET_BASE}"
-	export INSTALL_PACKAGES_NORMAL_RPM="${PACKAGE_INSTALL}"
-	export INSTALL_PACKAGES_MULTILIB_RPM="${MULTILIB_PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_RPM="${PACKAGE_INSTALL}"
 	export INSTALL_PACKAGES_ATTEMPTONLY_RPM="${PACKAGE_INSTALL_ATTEMPTONLY}"
 	export INSTALL_PACKAGES_LINGUAS_RPM="${LINGUAS_INSTALL}"
 	export INSTALL_PROVIDENAME_RPM=""
-- 
1.7.1



