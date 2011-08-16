Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QtFUn-00023R-Fe
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:59:37 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 16 Aug 2011 01:55:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="38167603"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 16 Aug 2011 01:55:00 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 16:56:08 +0800
Message-Id: <c1cf628194ab07cfda930f31ebb74513d2838a2d.1313484812.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313484812.git.lianhao.lu@intel.com>
References: <cover.1313484812.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] package(_ipk).bbclass: opkg using ALL_MULTILIB_PACKAGE_ARCHS
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
X-List-Received-Date: Tue, 16 Aug 2011 08:59:37 -0000

[YOCTO #1345]
The new variable ALL_MULTILIB_PACKAGE_ARCHS contains all the values of
PACKAGE_ARCHS for each multilib variants. The opkg backend now uses this
new value insteald of the PACKAGE_ARCHS to update the opkg indexes and
to generate the opkg configuration files. This allows the normal
packages and multilib packages may be installed into the same rootfs.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/package.bbclass     |   13 ++-----------
 meta/classes/package_ipk.bbclass |   30 ++++++++----------------------
 meta/classes/utils.bbclass       |   24 +++++++++++++++++++-----
 3 files changed, 29 insertions(+), 38 deletions(-)

diff --git a/meta/classes/package.bbclass b/meta/classes/package.bbclass
index 100f465..96675de 100644
--- a/meta/classes/package.bbclass
+++ b/meta/classes/package.bbclass
@@ -46,6 +46,8 @@ PKGDEST = "${WORKDIR}/packages-split"
 
 LOCALE_SECTION ?= ''
 
+ALL_MULTILIB_PACKAGE_ARCHS = "${@all_multilib_tune_values(d, 'PACKAGE_ARCHS')}"
+
 # rpm is used for the per-file dependency identification
 PACKAGE_DEPENDS += "rpm-native"
 
@@ -184,17 +186,6 @@ python () {
         bb.data.setVarFlag('do_package', 'deptask', " ".join(deps), d)
     else:
         d.setVar("PACKAGERDEPTASK", "")
-
-    multilib_archs = []
-    multilibs= d.getVar('MULTILIBS', True) or ""
-    if multilibs:
-        for ext in multilibs.split():
-            eext = ext.split(':')
-            if len(eext) > 1:
-                if eext[0] == 'multilib':
-                    multilib_archs.append('ml' + eext[1])
-
-    d.setVar("MULTILIB_ARCHS", ' '.join(multilib_archs))
 }
 
 def splitfile(file, debugfile, debugsrcdir, d):
diff --git a/meta/classes/package_ipk.bbclass b/meta/classes/package_ipk.bbclass
index 8ecf511..e83aff8 100644
--- a/meta/classes/package_ipk.bbclass
+++ b/meta/classes/package_ipk.bbclass
@@ -64,14 +64,13 @@ python package_ipk_install () {
 package_tryout_install_multilib_ipk() {
 	#try install multilib
 	multilib_tryout_dirs=""
-	for arch in ${MULTILIB_ARCHS}; do
-		local target_rootfs="${MULTILIB_TEMP_ROOTFS}/${arch}"
+	for item in ${MULTILIB_VARIANTS}; do
+		local target_rootfs="${MULTILIB_TEMP_ROOTFS}/${item}"
 		local ipkg_args="-f ${INSTALL_CONF_IPK} -o ${target_rootfs} --force_overwrite"
 		local selected_pkg=""
-		#strip the "ml" from package_arch
-		local pkgarch_prefix="${arch:2}-"
-		for pkg in "${INSTALL_PACKAGES_MULTILIB_IPK}"; do
-			if [ ${pkg:0:${#pkgarch_prefix}} == ${pkgarch_prefix} ]; then
+		local pkgname_prefix="${item}-"
+		for pkg in ${INSTALL_PACKAGES_MULTILIB_IPK}; do
+			if [ ${pkg:0:${#pkgname_prefix}} == ${pkgname_prefix} ]; then
 			    selected_pkg="${selected_pkg} ${pkg}"
 			fi
 		done
@@ -163,7 +162,7 @@ ipk_log_check() {
 package_update_index_ipk () {
 	set -x
 
-	ipkgarchs="${PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
+	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS} ${SDK_PACKAGE_ARCHS}"
 
 	if [ ! -z "${DEPLOY_KEEP_PACKAGES}" ]; then
 		return
@@ -203,19 +202,12 @@ package_generate_ipkg_conf () {
 	done
 
 	echo "src oe file:${DEPLOY_DIR_IPK}" >> ${IPKGCONF_TARGET}
-	ipkgarchs="${PACKAGE_ARCHS}"
+	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
 	for arch in $ipkgarchs; do
 		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
 		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
 		fi
 	done
-
-	multilib_archs="${MULTILIB_ARCHS}"
-	for arch in $multilib_archs; do
-		if [ -e ${DEPLOY_DIR_IPK}/$arch/Packages ] ; then
-		        echo "src oe-$arch file:${DEPLOY_DIR_IPK}/$arch" >> ${IPKGCONF_TARGET}
-		fi
-	done
 }
 
 package_generate_archlist () {
@@ -226,18 +218,12 @@ package_generate_archlist () {
 		priority=$(expr $priority + 5)
 	done
 
-	ipkgarchs="${PACKAGE_ARCHS}"
+	ipkgarchs="${ALL_MULTILIB_PACKAGE_ARCHS}"
 	priority=1
 	for arch in $ipkgarchs; do
 		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
 		priority=$(expr $priority + 5)
 	done
-
-	multilib_archs="${MULTILIB_ARCHS}"
-	for arch in $multilib_archs; do
-		echo "arch $arch $priority" >> ${IPKGCONF_TARGET}
-		priority=$(expr $priority + 5)
-	done
 }
 
 python do_package_ipk () {
diff --git a/meta/classes/utils.bbclass b/meta/classes/utils.bbclass
index c66c184..56abdd8 100644
--- a/meta/classes/utils.bbclass
+++ b/meta/classes/utils.bbclass
@@ -352,12 +352,16 @@ def extend_variants(d, var, extend, delim=':'):
 			variants.append(eext[1])
 	return " ".join(variants)
 
-def all_multilib_tune_values(d, var, unique=True):
+def all_multilib_tune_values(d, var, unique = True, need_split = True, delim = ' '):
 	"""Return a string of all ${var} in all multilib tune configuration"""
 	values = []
 	value = d.getVar(var, True) or ""
 	if value != "":
-		values.append(value)
+		if need_split:
+			for item in value.split(delim):
+				values.append(item)
+		else:
+			values.append(value)
 	variants = d.getVar("MULTILIB_VARIANTS", True) or ""
 	for item in variants.split():
 		localdata = bb.data.createCopy(d)
@@ -366,7 +370,17 @@ def all_multilib_tune_values(d, var, unique=True):
 		bb.data.update_data(localdata)
 		value = localdata.getVar(var, True) or ""
 		if value != "":
-			values.append(value)
+			if need_split:
+				for item in value.split(delim):
+					values.append(item)
+			else:
+				values.append(value)
 	if unique:
-		values = set(values)
-	return " ".join(values)
+		#we do this to keep order as much as possible
+		ret = []
+		for value in values:
+			if not value in ret:
+				ret.append(value)
+	else:
+		ret = values
+	return " ".join(ret)
-- 
1.7.0.4



