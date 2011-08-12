Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qrrcb-0004Jq-Np
	for openembedded-core@lists.openembedded.org;
	Fri, 12 Aug 2011 15:17:58 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 12 Aug 2011 06:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="37882539"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 12 Aug 2011 06:13:22 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2011 21:14:50 +0800
Message-Id: <c5610872f10f4617418f5f338fdecba4deb47310.1313154666.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313154666.git.lianhao.lu@intel.com>
References: <cover.1313154666.git.lianhao.lu@intel.com>
Subject: [PATCH Bug #892 v2 1/2] image: populate site config files into roootfs.
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
X-List-Received-Date: Fri, 12 Aug 2011 13:17:58 -0000

[YOCTO #892] populate the site config files content into the file in
{target}/cross_site_config in rootfs, which can be used by the cross
toolchain in meta-toolchain when the rootfs is used as sysroot.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/image.bbclass             |    1 +
 meta/classes/siteinfo.bbclass          |    4 +++-
 meta/classes/toolchain-scripts.bbclass |   31 +++++++++++++++++++++++++------
 3 files changed, 29 insertions(+), 7 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 54eb78b..1104693 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -1,4 +1,5 @@
 inherit rootfs_${IMAGE_PKGTYPE}
+inherit toolchain-scripts
 
 IMAGETEST ?= "dummy"
 inherit imagetest-${IMAGETEST}
diff --git a/meta/classes/siteinfo.bbclass b/meta/classes/siteinfo.bbclass
index a61b5e5..02294c4 100644
--- a/meta/classes/siteinfo.bbclass
+++ b/meta/classes/siteinfo.bbclass
@@ -118,7 +118,7 @@ python () {
         bb.fatal("Please add your architecture to siteinfo.bbclass")
 }
 
-def siteinfo_get_files(d):
+def siteinfo_get_files(d, no_cache = False):
     sitedata = siteinfo_data(d)
     sitefiles = ""
     for path in d.getVar("BBPATH", True).split(":"):
@@ -127,6 +127,8 @@ def siteinfo_get_files(d):
             if os.path.exists(filename):
                 sitefiles += filename + " "
 
+    if no_cache: return sitefiles
+
     # Now check for siteconfig cache files
     path_siteconfig = bb.data.getVar('SITECONFIG_SYSROOTCACHE', d, 1)
     if os.path.isdir(path_siteconfig):
diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index f7b52be..7655d3c 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -9,7 +9,9 @@ toolchain_create_sdk_env_script () {
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/${MULTIMACH_TARGET_SYS}:$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=${SDKTARGETSYSROOT}' >> $script
 	echo 'export PKG_CONFIG_PATH=${SDKTARGETSYSROOT}${libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=${SDKPATH}/site-config-${MULTIMACH_TARGET_SYS}' >> $script
+	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
+	echo 'export CONFIG_SITE="$OECORE_TARGET_SYSROOT${target_datadir}/cross_site_config"' >> $script
 	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
 	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
@@ -26,8 +28,6 @@ toolchain_create_sdk_env_script () {
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
 	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=${SDKTARGETSYSROOT}"' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="${SDKTARGETSYSROOT}"' >> $script
 	echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/aclocal"' >> $script
 	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
@@ -77,7 +77,9 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export PATH=${SDKPATHNATIVE}${bindir_nativesdk}:${SDKPATHNATIVE}${bindir_nativesdk}/'"${multimach_target_sys}"':$PATH' >> $script
 	echo 'export PKG_CONFIG_SYSROOT_DIR=##SDKTARGETSYSROOT##' >> $script
 	echo 'export PKG_CONFIG_PATH=##SDKTARGETSYSROOT##${target_libdir}/pkgconfig' >> $script
-	echo 'export CONFIG_SITE=${SDKPATH}/site-config-'"${multimach_target_sys}" >> $script
+	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
+	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
+	echo 'export CONFIG_SITE="$OECORE_TARGET_SYSROOT${target_datadir}/cross_site_config"' >> $script
 	echo 'export CC=${TARGET_PREFIX}gcc' >> $script
 	echo 'export CXX=${TARGET_PREFIX}g++' >> $script
 	echo 'export GDB=${TARGET_PREFIX}gdb' >> $script
@@ -94,8 +96,6 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export CXXFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export LDFLAGS="${TARGET_LD_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
 	echo 'export CPPFLAGS="${TARGET_CC_ARCH} --sysroot=##SDKTARGETSYSROOT##"' >> $script
-	echo 'export OECORE_NATIVE_SYSROOT="${SDKPATHNATIVE}"' >> $script
-	echo 'export OECORE_TARGET_SYSROOT="##SDKTARGETSYSROOT##"' >> $script
         echo 'export OECORE_ACLOCAL_OPTS="-I ${SDKPATHNATIVE}/usr/share/acloal"' >> $script
 	echo 'export POKY_DISTRO_VERSION="${DISTRO_VERSION}"' >> $script
 	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
@@ -124,3 +124,22 @@ toolchain_create_sdk_version () {
 	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
 	echo 'Timestamp: ${DATETIME}' >> $versionfile
 }
+
+IMAGE_PREPROCESS_COMMAND += "toolchain_create_rootfs_siteconfig ${IMAGE_ROOTFS} ${@base_contains('IMAGE_FEATURES', 'dev-pkgs', 'false', 'true' ,d)}; "
+#Use := to avoid cross-canadian polution
+COMMON_CONFIG_SITE := "${@siteinfo_get_files(d,True)}"
+# create the site config file in the rootfs 
+toolchain_create_rootfs_siteconfig () {
+	local allfiles='${COMMON_CONFIG_SITE}'
+
+	if $2; then
+		return
+	fi
+
+	for file in ${SITECONFIG_SYSROOTCACHE}/*; do
+		if [ -f $file ]; then
+			allfiles="$allfiles $file"
+		fi
+	done
+	toolchain_create_sdk_siteconfig $1${datadir}/cross_site_config $allfiles
+}
-- 
1.7.0.4



