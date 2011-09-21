Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R6S6d-0002ey-19
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Sep 2011 21:05:15 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 21 Sep 2011 11:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,418,1312182000"; d="scan'208";a="51849326"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by azsmga001.ch.intel.com with ESMTP; 21 Sep 2011 11:59:55 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Sep 2011 03:06:52 +0800
Message-Id: <ea5aa20a9c0bf3dbaadd97a3186cefdc97dadbbc.1316631873.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <cover.1316631873.git.dongxiao.xu@intel.com>
References: <cover.1316631873.git.dongxiao.xu@intel.com>
In-Reply-To: <cover.1316631873.git.dongxiao.xu@intel.com>
References: <cover.1316631873.git.dongxiao.xu@intel.com>
Subject: [PATCH 1/1] rootfs_rpm: two step installation
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
X-List-Received-Date: Wed, 21 Sep 2011 19:05:15 -0000

Firstly we install a base image.
Then install those multilib packages listed in MULTILIB_IMAGE_INSTALL.

Signed-off-by: Dongxiao Xu <dongxiao.xu@intel.com>
---
 meta/classes/package_rpm.bbclass |   54 +++++++++++++++++++++++++++++++++++---
 1 files changed, 50 insertions(+), 4 deletions(-)

diff --git a/meta/classes/package_rpm.bbclass b/meta/classes/package_rpm.bbclass
index d822b54..775d525 100644
--- a/meta/classes/package_rpm.bbclass
+++ b/meta/classes/package_rpm.bbclass
@@ -166,7 +166,8 @@ package_install_internal_rpm () {
 	local platform="${INSTALL_PLATFORM_RPM}"
 	local platform_extra="${INSTALL_PLATFORM_EXTRA_RPM}"
 	local confbase="${INSTALL_CONFBASE_RPM}"
-	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM} ${INSTALL_PACKAGES_MULTILIB_RPM}"
+	local package_to_install="${INSTALL_PACKAGES_NORMAL_RPM}"
+	local multilib_to_install="${INSTALL_PACKAGES_MULTILIB_RPM}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_RPM}"
 	local package_linguas="${INSTALL_PACKAGES_LINGUAS_RPM}"
 	local providename="${INSTALL_PROVIDENAME_RPM}"
@@ -253,11 +254,13 @@ package_install_internal_rpm () {
 		done
 	fi
 
+	# Normal package installation
+
 	# Generate an install solution by doing a --justdb install, then recreate it with
 	# an actual package install!
 	${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
-		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}.macro`" \
+		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-base_archs.macro`" \
 		-D "__dbi_txn create nofsync" \
 		-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
 		${target_rootfs}/install/install.manifest
@@ -351,14 +354,57 @@ package_install_internal_rpm () {
 		-D "__dbi_txn create nofsync private" \
 		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_solution.manifest
 
+	if [ ! -z "${multilib_to_install}" ]; then
+		for pkg in ${multilib_to_install} ; do
+			echo "Processing $pkg..."
+
+			archvar=base_archs
+			ml_prefix=`echo ${pkg} | cut -d'-' -f1`
+			ml_pkg=$pkg
+			for i in ${MULTILIB_PREFIX_LIST} ; do
+				if [ ${ml_prefix} == ${i} ]; then
+					ml_pkg=$(echo ${pkg} | sed "s,^${ml_prefix}-\(.*\),\1,")
+					archvar=ml_archs
+					break
+				fi
+			done
+
+			pkg_name=$(resolve_package_rpm ${confbase}-${archvar}.conf ${ml_pkg})
+			if [ -z "$pkg_name" ]; then
+				echo "Unable to find package $pkg ($ml_pkg)!"
+				exit 1
+			fi
+			echo $pkg_name >> ${target_rootfs}/install/install_multilib.manifest
+		done
+	fi
+
+	# multilib package installation
+
+	# Generate an install solution by doing a --justdb install, then recreate it with
+	# an actual package install!
+	${RPM} --predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
+		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
+		-D "_dbpath ${target_rootfs}/install" -D "`cat ${confbase}-ml_archs.macro`" \
+		-D "__dbi_txn create nofsync" \
+		-U --justdb --noscripts --notriggers --noparentdirs --nolinktos --ignoresize \
+		${target_rootfs}/install/install_multilib.manifest
+
+	# Now that we have a solution, pull out a list of what to install...
+	echo "Manifest: ${target_rootfs}/install/install_multilib.manifest"
+	${RPM} -D "_dbpath ${target_rootfs}/install" -qa --yaml \
+		-D "__dbi_txn create nofsync private" \
+		| grep -i 'Packageorigin' | cut -d : -f 2 > ${target_rootfs}/install/install_multilib_solution.manifest
+
+
 	# Attempt install
 	${RPM} --root ${target_rootfs} \
 		--predefine "_rpmds_sysinfo_path ${target_rootfs}/etc/rpm/sysinfo" \
 		--predefine "_rpmrc_platform_path ${target_rootfs}/etc/rpm/platform" \
 		-D "_dbpath ${rpmlibdir}" \
-		--noscripts --notriggers --noparentdirs --nolinktos \
+		--noscripts --notriggers --noparentdirs --nolinktos --replacepkgs \
 		-D "__dbi_txn create nofsync private" \
-		-Uhv ${target_rootfs}/install/install_solution.manifest
+		-Uhv ${target_rootfs}/install/install_solution.manifest \
+		${target_rootfs}/install/install_multilib_solution.manifest
 }
 
 python write_specfile () {
-- 
1.7.1



