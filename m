Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4F0FA71CA5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jan 2017 18:29:25 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 19 Jan 2017 10:29:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,255,1477983600"; d="scan'208";a="32818922"
Received: from zpchu5-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.128.210])
	by orsmga002.jf.intel.com with ESMTP; 19 Jan 2017 10:29:24 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 07:29:16 +1300
Message-Id: <44665c81d2059a0ea8a31b73cb1bff790855a423.1484850485.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1484850485.git.paul.eggleton@linux.intel.com>
References: <cover.1484850485.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/populate_sdk_ext: force a known value for TMPDIR
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 19 Jan 2017 18:29:25 -0000

If TMPDIR is configured to be somewhere outside of TOPDIR (a not
uncommon configuration where you have multiple disks and space on /home
is at a premium) then our attempt to find out the location of paths
under TMPDIR by using a relative path led to horribly broken paths
ending up in the eSDK. To save pain, just force a known value for TMPDIR
(i.e. ${TOPDIR}/tmp) and then we can assume that everywhere else.

Fixes [YOCTO #10797].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass             | 5 +++--
 meta/recipes-core/meta/meta-environment-extsdk.bb | 4 ++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index f21ae8b..d5f6de9 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -282,6 +282,7 @@ python copy_buildsystem () {
             # Write a newline just in case there's none at the end of the original
             f.write('\n')
 
+            f.write('TMPDIR = "${TOPDIR}/tmp"\n')
             f.write('DL_DIR = "${TOPDIR}/downloads"\n')
 
             f.write('INHERIT += "%s"\n' % 'uninative')
@@ -512,8 +513,8 @@ install_tools() {
 	# (they get populated from sstate on installation)
 	unfsd_path="${SDK_OUTPUT}/${SDKPATHNATIVE}${bindir_nativesdk}/unfsd"
 	if [ "${SDK_INCLUDE_TOOLCHAIN}" == "1" -a ! -e $unfsd_path ] ; then
-		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE'), d.getVar('TOPDIR'))}
-		lnr ${SDK_OUTPUT}/${SDKPATH}/$binrelpath/unfsd $unfsd_path
+		binrelpath=${@os.path.relpath(d.getVar('STAGING_BINDIR_NATIVE'), d.getVar('TMPDIR'))}
+		lnr ${SDK_OUTPUT}/${SDKPATH}/tmp/$binrelpath/unfsd $unfsd_path
 	fi
 	touch ${SDK_OUTPUT}/${SDKPATH}/.devtoolbase
 
diff --git a/meta/recipes-core/meta/meta-environment-extsdk.bb b/meta/recipes-core/meta/meta-environment-extsdk.bb
index 76d2661..757afc1 100644
--- a/meta/recipes-core/meta/meta-environment-extsdk.bb
+++ b/meta/recipes-core/meta/meta-environment-extsdk.bb
@@ -5,8 +5,8 @@ require meta-environment.bb
 PN = "meta-environment-extsdk-${MACHINE}"
 
 create_sdk_files_append() {
-	local sysroot=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET'), d.getVar('TOPDIR'))}
-	local sdkpathnative=${SDKPATH}/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE'), d.getVar('TOPDIR'))}
+	local sysroot=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR_TARGET'), d.getVar('TMPDIR'))}
+	local sdkpathnative=${SDKPATH}/tmp/${@os.path.relpath(d.getVar('STAGING_DIR_NATIVE'), d.getVar('TMPDIR'))}
 
 	toolchain_create_sdk_env_script '' '' $sysroot '' ${bindir_native} ${prefix_native} $sdkpathnative
 }
-- 
2.5.5


