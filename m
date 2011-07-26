Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QlqWZ-0001Dl-TR
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 00:54:52 +0200
Received: by rex (Postfix, from userid 1000)
	id 2A5D3208C7; Tue, 26 Jul 2011 23:50:30 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 23:50:26 +0100
Message-Id: <98d2970ed91756d79ee3903dc0fd3d907d9bdf65.1311720062.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
References: <bfe5838302fbcfe989e3c26c9e04c927c4755e65.1311720062.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
References: <cover.1311720062.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 2/3] package(rootfs)_ipk.bbclass: support multilib in opkg backend.
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
X-List-Received-Date: Tue, 26 Jul 2011 22:54:52 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

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
 meta/classes/rootfs_ipk.bbclass  |    2 +
 2 files changed, 53 insertions(+), 0 deletions(-)

diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 0c0f00d..b7afa83 100644
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
index 4fcacc6..695bee0 100644
--- a/meta/classes/rootfs_ipk.bbclass
+++ b/meta/classes/rootfs_ipk.bbclass
@@ -22,6 +22,7 @@ opkglibdir = "${localstatedir}/lib/opkg"
 
 # Which packages to not install on the basis of a recommendation
 BAD_RECOMMENDATIONS ?= ""
+MULTILIBRE_ALLOW_REP = "${opkglibdir}"
 
 fakeroot rootfs_ipk_do_rootfs () {
 	set -x
@@ -58,6 +59,7 @@ fakeroot rootfs_ipk_do_rootfs () {
 	export INSTALL_ROOTFS_IPK="${IMAGE_ROOTFS}"
 	export INSTALL_CONF_IPK="${IPKGCONF_TARGET}"
 	export INSTALL_PACKAGES_NORMAL_IPK="${PACKAGE_INSTALL}"
+	export INSTALL_PACKAGES_MULTILIB_IPK="${MULTILIB_PACKAGE_INSTALL}"
 
 	package_install_internal_ipk
 
-- 
1.7.4.1



