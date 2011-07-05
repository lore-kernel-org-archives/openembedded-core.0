Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qe3HU-00064I-Jq
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Jul 2011 12:55:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Jul 2011 03:51:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,478,1304319600"; d="scan'208";a="23530598"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.87])
	by orsmga001.jf.intel.com with ESMTP; 05 Jul 2011 03:51:07 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Jul 2011 18:51:34 +0800
Message-Id: <052c64486690d7ff32e1f62b1a0391d0fd3586a8.1309862610.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
References: <8afebe13f6e5c1ba3354907892f2808277a96e6e.1309862610.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1309862610.git.lianhao.lu@intel.com>
References: <cover.1309862610.git.lianhao.lu@intel.com>
Subject: [MULTILIB_SUBTASK4 5/5] package(rootfs)_ipk.bbclass: support multilib in opkg backend.
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
X-List-Received-Date: Tue, 05 Jul 2011 10:55:04 -0000

Support install multiple multilib in opkg backend.

The installation is done in 3 phases.

Phase 1: install normal packages to IMAGE_ROOTFS.

Phase 2: install multilib packages under MULTILIB_TEMP_ROOTFS. Packages
belongs to the same multilib arch would be installed to a unique
directory.

Phase 3: check file confliction between IMAGE_ROOTFS and
MULTILIB_TEMP_ROOTFS, install multilib packages to IMAGE_ROOTFS only if
the sanity check passed.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package_ipk.bbclass |   51 ++++++++++++++++++++++++++++++++++++++
 meta/classes/rootfs_ipk.bbclass  |    3 ++
 2 files changed, 54 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 4317028..7029a2e 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -61,6 +61,28 @@ python package_ipk_install () {
 		raise bb.build.FuncFailed
 }
 
+package_tryout_install_multilib_ipk() {
+	#try install multilib
+	multilib_tryout_dirs=""
+	for arch in ${MULTILIB_ARCHS}; do
+		local target_rootfs="${MULTILIB_TEMP_ROOTFS}/${arch}"
+		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs} --force_overwrite"
+		local selected_pkg=""
+		#strip the "ml" from package_arch
+		local pkgarch_prefix="${arch:2}-"
+		for pkg in "${INSTALL_PACKAGES_MULTILIB_IPK}"; do
+			if [ ${pkg:0:${#pkgarch_prefix}} == ${pkgarch_prefix} ]; then
+			    selected_pkg="${selected_pkg} ${pkg}"
+			fi
+		done
+		if [ ! -z "${selected_pkg}" ]; then
+			mkdir -p ${target_rootfs}/${opkglibdir}
+			opkg-cl ${ipkg_args} update
+			opkg-cl ${ipkg_args} install ${selected_pkg}
+			multilib_tryout_dirs="${multilib_tryout_dirs} ${target_rootfs}"
+		fi
+	done
+}
 #
 # install a bunch of packages using opkg
 # the following shell variables needs to be set before calling this func:
@@ -78,6 +100,7 @@ package_install_internal_ipk() {
 	local package_to_install="${INSTALL_PACKAGES_NORMAL_IPK}"
 	local package_attemptonly="${INSTALL_PACKAGES_ATTEMPTONLY_IPK}"
 	local package_lingusa="${INSTALL_PACKAGES_LINGUAS_IPK}"
+	local package_multilib="${INSTALL_PACKAGES_MULTILIB_IPK}"
 	local task="${INSTALL_TASK_IPK}"
 
 	mkdir -p ${target_rootfs}${localstatedir}/lib/opkg/
@@ -102,6 +125,14 @@ package_install_internal_ipk() {
 	if [ ! -z "${package_attemptonly}" ]; then
 		opkg-cl ${ipkg_args} install ${package_attemptonly} > "${WORKDIR}/temp/log.do_${task}_attemptonly.${PID}" || true
 	fi
+
+	package_tryout_install_multilib_ipk
+	#sanity check
+	multilib_sanity_check  ${target_rootfs} ${multilib_tryout_dirs}|| exit 1
+
+	if [ ! -z "${package_multilib}" ]; then
+		opkg-cl ${ipkg_args} install ${package_multilib}
+	fi
 }
 
 ipk_log_check() {
@@ -142,6 +173,11 @@ package_update_index_ipk () {
 		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch ${DEPLOY_DIR_IPK}/$sdkarch-nativesdk"
 	done
 
+	multilib_archs="${MULTILIB_ARCHS}"
+	for arch in $multilib_archs; do
+		packagedirs="$packagedirs ${DEPLOY_DIR_IPK}/$arch"
+	done
+
 	for pkgdir in $packagedirs; do
 		if [ -e $pkgdir/ ]; then
 			touch $pkgdir/Packages
@@ -173,6 +209,13 @@ package_generate_ipkg_conf () {
 		        echo "src oe-$sdkarch$extension file:${DEPLOY_DIR_IPK}/$sdkarch$extension" >> ${IPKGCONF_SDK}
 		fi
 	done
+
+	multilib_archs="${MULTILIB_ARCHS}"
+	for arch in $multilib_archs; do
+		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
+		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
+		fi
+	done
 }
 
 package_generate_archlist () {
@@ -188,6 +231,14 @@ package_generate_archlist () {
 		echo "arch $sdkarch$extension $priority" >> ${IPKGCONF_SDK}
 		priority=$(expr $priority + 5)
 	done
+
+	multilib_archs="${MULTILIB_ARCHS}"
+	for arch in $multilib_archs; do
+		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
+		priority=$(expr $priority + 5)
+	done
+
+
 }
 
 python do_package_ipk () {
diff --git a/meta/classes/rootfs_ipk.bbclass b/meta/classes/rootfs_ipk.bbclass
index 3b4b4da..26d0676 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -20,6 +20,8 @@ OPKG_POSTPROCESS_COMMANDS = "ipk_insert_feed_uris"
 
 opkglibdir = "${localstatedir}/lib/opkg"
 
+MULTILIBRE_ALLOW_REP = "${opkglibdir}"
+
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
 
@@ -38,6 +40,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_PACKAGES_NORMAL_IPK="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_MULTILIB_IPK="${MULTILIB_PACKAGE_INSTALL}"
 
 	package_install_internal_ipk
 
-- 
1.7.0.4



