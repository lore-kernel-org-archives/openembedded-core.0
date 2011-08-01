Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Qnn7K-0006ZU-Vs
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 09:40:51 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 01 Aug 2011 00:36:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="34147090"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.76])
	by orsmga001.jf.intel.com with ESMTP; 01 Aug 2011 00:36:22 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 00:36:08 -0700
Message-Id: <180637fbdcbc29750f30bc493ce2891dd8318de6.1312182844.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
In-Reply-To: <cover.1312182844.git.sgw@linux.intel.com>
References: <cover.1312182844.git.sgw@linux.intel.com>
Subject: [PATCH 16/22] populate_sdk: Fix the introduction of sdknative packages
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
X-List-Received-Date: Mon, 01 Aug 2011 07:40:51 -0000

From: Mark Hatle <mark.hatle@windriver.com>

The sdknative packages were not being introduced into the list of available
packages properly.  Fix this by always introducing it and avoiding a sed of
one type to another.

Also fix a number of minor issues with the RPM behavior when building sdk
images.

Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
---
 meta/classes/package_rpm.bbclass      |   19 +++++++++----------
 meta/classes/populate_sdk_deb.bbclass |   11 ++---------
 meta/classes/populate_sdk_rpm.bbclass |   11 ++---------
 3 files changed, 13 insertions(+), 28 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index 0377100..856dfb0 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -32,14 +32,12 @@ package_update_index_rpm () {
 		eval archs=\${${archvar}}
 		packagedirs=""
 		packagedirs_sdk=""
-		for arch in $archs; do
-			sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-			extension="-nativesdk"
-			if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-			    extension=""
-			fi
+		if [ "${SDK_ARCH}-nativesdk" != "-nativesdk" ]; then
+			packagedirs_sdk="${DEPLOY_DIR_RPM}/${SDK_ARCH}-nativesdk"
+		fi
+		for arch in $archs ; do
 			packagedirs="${DEPLOY_DIR_RPM}/$arch $packagedirs"
-			packagedirs_sdk="${DEPLOY_DIR_RPM}/$sdkarch$extension $packagedirs_sdk"
+			packagedirs_sdk="${DEPLOY_DIR_RPM}/$arch $packagedirs_sdk"
 
 			rm -rf ${DEPLOY_DIR_RPM}/$arch/solvedb
 			rm -rf ${DEPLOY_DIR_RPM}/$sdkarch$extension/solvedb
@@ -95,6 +93,7 @@ package_update_index_rpm () {
 #
 package_generate_rpm_conf () {
 	printf "_solve_dbpath " > ${RPMCONF_TARGET_BASE}.macro
+	printf "_solve_dbpath " > ${RPMCONF_HOST_BASE}.macro
 	o_colon_t=false
 	o_colon_h=false
 
@@ -238,7 +237,7 @@ package_install_internal_rpm () {
 					echo "Unable to find package $pkg ($ml_pkg)!"
 					exit 1
 				fi
-				echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
+				echo $pkg_name >> ${target_rootfs}/install/install.manifest
 			done
 		fi
 	fi
@@ -258,7 +257,7 @@ package_install_internal_rpm () {
 				echo "Unable to find package $pkg ($ml_pkg)!"
 				exit 1
 			fi
-			echo $pkg_name >> ${IMAGE_ROOTFS}/install/install.manifest
+			echo $pkg_name >> ${target_rootfs}/install/install.manifest
 		done
 	fi
 
@@ -303,7 +302,7 @@ package_install_internal_rpm () {
 		# Dump the full set of recommends...
 		${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 			--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-			-D "_dbpath ${IMAGE_ROOTFS}/install" -D "`cat ${confbase}.macro`" \
+			-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
 			-D "__dbi_txn create nofsync private" \
 			-qa --qf "[%{RECOMMENDS}\n]" | sort -u > ${target_rootfs}/install/recommend
 		# Did we add more to the list?
diff --git a/meta/classes/populate_sdk_deb.bbclass b/meta/classes/populate_sdk_deb.bbclass
index a5b6384..9acc52d 100644
--- a/meta/classes/populate_sdk_deb.bbclass
+++ b/meta/classes/populate_sdk_deb.bbclass
@@ -34,16 +34,9 @@ fakeroot populate_sdk_deb () {
 	export INSTALL_ROOTFS_DEB="${SDK_OUTPUT}"
 	export INSTALL_BASEARCH_DEB="${SDK_ARCH}"
 	export INSTALL_PACKAGES_NORMAL_DEB="${TOOLCHAIN_HOST_TASK}"
-	INSTALL_ARCHS_DEB=""
+	INSTALL_ARCHS_DEB="${SDK_ARCH}-nativesdk"
 	for arch in ${PACKAGE_ARCHS}; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension="-nativesdk"
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		if [ -e ${DEPLOY_DIR_DEB}/$sdkarch$extension ]; then
-			INSTALL_ARCHS_DEB="$INSTALL_ARCHS_DEB $sdkarch$extension"
-		fi
+		INSTALL_ARCHS_DEB="$INSTALL_ARCHS_DEB $arch"
 	done
 	export INSTALL_ARCHS_DEB
 
diff --git a/meta/classes/populate_sdk_rpm.bbclass b/meta/classes/populate_sdk_rpm.bbclass
index da308c1..8196542 100644
--- a/meta/classes/populate_sdk_rpm.bbclass
+++ b/meta/classes/populate_sdk_rpm.bbclass
@@ -53,16 +53,9 @@ fakeroot populate_sdk_rpm () {
 	export INSTALL_PLATFORM_RPM="${SDK_ARCH}"
 	export INSTALL_CONFBASE_RPM="${RPMCONF_HOST_BASE}"
 	export INSTALL_PACKAGES_NORMAL_RPM="${TOOLCHAIN_HOST_TASK}"
-	export INSTALL_PLATFORM_EXTRA_RPM=""
+	export INSTALL_PLATFORM_EXTRA_RPM="${SDK_ARCH}-nativesdk"
 	for arch in ${PACKAGE_ARCHS}; do
-		sdkarch=`echo $arch | sed -e 's/${HOST_ARCH}/${SDK_ARCH}/'`
-		extension="-nativesdk"
-		if [ "$sdkarch" = "all" -o "$sdkarch" = "any" -o "$sdkarch" = "noarch" ]; then
-		    extension=""
-		fi
-		if [ -e ${DEPLOY_DIR_RPM}/$sdkarch$extension ]; then
-			INSTALL_PLATFORM_EXTRA_RPM="$sdkarch $INSTALL_PLATFORM_EXTRA_RPM"
-		fi
+		INSTALL_PLATFORM_EXTRA_RPM="$arch $INSTALL_PLATFORM_EXTRA_RPM"
 	done
 	export INSTALL_PLATFORM_EXTRA_RPM
 
-- 
1.7.3.4



