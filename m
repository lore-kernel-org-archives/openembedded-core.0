Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QtATJ-0005qN-1T
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 05:37:45 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 15 Aug 2011 20:33:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,378,1309762800"; d="scan'208";a="38865594"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 15 Aug 2011 20:33:06 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 Aug 2011 11:34:14 +0800
Message-Id: <844deaa2a05b429c261a49b7ebf85b35812b79eb.1313465312.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1313465312.git.lianhao.lu@intel.com>
References: <cover.1313465312.git.lianhao.lu@intel.com>
Subject: [PATCH v3 Bug #892 1/2] toolchain-script.bbclass: Collected cached site config in runtime.
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
X-List-Received-Date: Tue, 16 Aug 2011 03:37:45 -0000

[YOCTO #892]
Modify the function toolchain_create_sdk_siteconfig to collect the
cached site config files which are specified by
TOOLCHAIN_NEED_CONFIGSITE_CACHE in runtime.

Also added task dependency to ensure the cached site config files are
generated.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/siteinfo.bbclass          |    4 +++-
 meta/classes/toolchain-scripts.bbclass |   24 +++++++++++++++++++++---
 2 files changed, 24 insertions(+), 4 deletions(-)

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
index f7b52be..6fc67f8 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -101,17 +101,28 @@ toolchain_create_sdk_env_script_for_installer () {
 	echo 'export POKY_SDK_VERSION="${SDK_VERSION}"' >> $script
 }
 
+#we get the cached site config in the runtime
+TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
+TOOLCHAIN_CONFIGSITE_SYSROOTCACHE := "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = "eglibc ncurses"
+
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
 	local siteconfig=$1
-	shift
-	local files=$@
 
 	rm -f $siteconfig
 	touch $siteconfig
-	for sitefile in ${files} ; do
+
+	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
 		cat $sitefile >> $siteconfig
 	done
+
+	#get cached site config
+	for sitefile in ${TOOLCHAIN_NEED_CONFIGSITE_CACHE}; do
+		if [ -r ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config ]; then
+			cat ${TOOLCHAIN_CONFIGSITE_SYSROOTCACHE}/${sitefile}_config >> $siteconfig
+		fi
+	done
 }
 
 #This function create a version information file
@@ -124,3 +135,10 @@ toolchain_create_sdk_version () {
 	echo 'Metadata Revision: ${METADATA_REVISION}' >> $versionfile
 	echo 'Timestamp: ${DATETIME}' >> $versionfile
 }
+
+python __anonymous () {
+    deps = bb.data.getVarFlag('do_configure', 'depends', d) or ""
+    for dep in (bb.data.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', d, True) or "").split():
+        deps += " %s:do_populate_sysroot" % dep
+    bb.data.setVarFlag('do_configure', 'depends', deps, d)
+}
-- 
1.7.0.4



