Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SB06U-0004eN-Iv
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 09:44:10 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 23 Mar 2012 01:35:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="132331025"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.110])
	by fmsmga001.fm.intel.com with ESMTP; 23 Mar 2012 01:35:13 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Mar 2012 16:33:05 +0800
Message-Id: <5d23ea40f1f69d0f8b3ce11262c9f16750405313.1332491511.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <cover.1332491511.git.lianhao.lu@intel.com>
References: <cover.1332491511.git.lianhao.lu@intel.com>
Subject: [PATCH 1/1] meta-toolchain: Popluated the libc siteconfig files.
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
X-List-Received-Date: Fri, 23 Mar 2012 08:44:10 -0000

Fixed bug [YOCTO #2159] by correctly populate the libc's siteconfig
files.

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/classes/toolchain-scripts.bbclass     |    8 ++------
 meta/recipes-core/meta/meta-environment.bb |    2 +-
 meta/recipes-core/meta/meta-toolchain.bb   |    2 +-
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/meta/classes/toolchain-scripts.bbclass b/meta/classes/toolchain-scripts.bbclass
index 711efd3..2099c4d 100644
--- a/meta/classes/toolchain-scripts.bbclass
+++ b/meta/classes/toolchain-scripts.bbclass
@@ -105,7 +105,7 @@ toolchain_create_sdk_env_script_for_installer () {
 #we get the cached site config in the runtime
 TOOLCHAIN_CONFIGSITE_NOCACHE := "${@siteinfo_get_files(d, True)}"
 TOOLCHAIN_CONFIGSITE_SYSROOTCACHE := "${STAGING_DATADIR}/${TARGET_SYS}_config_site.d"
-TOOLCHAIN_NEED_CONFIGSITE_CACHE = "ncurses"
+TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TCLIBC} ncurses"
 
 #This function create a site config file
 toolchain_create_sdk_siteconfig () {
@@ -113,9 +113,7 @@ toolchain_create_sdk_siteconfig () {
 
 	rm -f $siteconfig
 	touch $siteconfig
-	if [ "${LIBC}" = "eglibc" ]; then
-		TOOLCHAIN_NEED_CONFIGSITE_CACHE = "${TOOLCHAIN_NEED_CONFIGSITE_CACHE} eglibc"
-	fi
+
 	for sitefile in ${TOOLCHAIN_CONFIGSITE_NOCACHE} ; do
 		cat $sitefile >> $siteconfig
 	done
@@ -146,7 +144,5 @@ python __anonymous () {
     deps = ""
     for dep in (d.getVar('TOOLCHAIN_NEED_CONFIGSITE_CACHE', True) or "").split():
         deps += " %s:do_populate_sysroot" % dep
-    if d.getVar('TCLIBC', True) is "uclibc":
-	deps += "uclibc:do_populate_sysroot"
     d.appendVarFlag('do_configure', 'depends', deps)
 }
diff --git a/meta/recipes-core/meta/meta-environment.bb b/meta/recipes-core/meta/meta-environment.bb
index 8f9391a..9731300 100644
--- a/meta/recipes-core/meta/meta-environment.bb
+++ b/meta/recipes-core/meta/meta-environment.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Package of environment files for SDK"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 LICENSE = "MIT"
-PR = "r7"
+PR = "r8"
 
 EXCLUDE_FROM_WORLD = "1"
 
diff --git a/meta/recipes-core/meta/meta-toolchain.bb b/meta/recipes-core/meta/meta-toolchain.bb
index 1058c68..61f9d34 100644
--- a/meta/recipes-core/meta/meta-toolchain.bb
+++ b/meta/recipes-core/meta/meta-toolchain.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Meta package for building a installable toolchain"
 LICENSE = "MIT"
 
-PR = "r6"
+PR = "r7"
 
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-- 
1.7.0.4



