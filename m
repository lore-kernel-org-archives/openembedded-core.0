Return-Path: <randy.e.witt@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 6D5C6772D1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 20:31:58 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 04 Feb 2016 12:31:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="740710358"
Received: from bitbang.jf.intel.com ([10.7.199.151])
	by orsmga003.jf.intel.com with ESMTP; 04 Feb 2016 12:31:58 -0800
From: Randy Witt <randy.e.witt@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 12:31:44 -0800
Message-Id: <485165c87d3db038510d0b2888704320c4a8cdf5.1454614198.git.randy.e.witt@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
In-Reply-To: <cover.1454614198.git.randy.e.witt@linux.intel.com>
References: <cover.1454614198.git.randy.e.witt@linux.intel.com>
Subject: [PATCH 4/5] populate_sdk_ext: Add support for a "minimal" type
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
X-List-Received-Date: Thu, 04 Feb 2016 20:31:58 -0000

If the user sets the SDK_EXT_TYPE variable to "minimal" then the sdk won't
contain any sstate. The sstate can come from an sstate mirror and be
installed on demand as usual.

Signed-off-by: Randy Witt <randy.e.witt@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index ba30023..caf8b6e 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -18,6 +18,9 @@ SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 SDK_EXT = ""
 SDK_EXT_task-populate-sdk-ext = "-ext"
 
+# Options are full or minimal
+SDK_EXT_TYPE ?= "full"
+
 SDK_LOCAL_CONF_WHITELIST ?= ""
 SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION \
                              BB_NUMBER_THREADS \
@@ -29,7 +32,7 @@ SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 SDK_UPDATE_URL ?= ""
 
 SDK_TARGETS ?= "${PN}"
-SDK_INSTALL_TARGETS = "${SDK_TARGETS} ${@'meta-world-pkgdata:do_allpackagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''}"
+SDK_INSTALL_TARGETS = "${@SDK_TARGETS if d.getVar('SDK_EXT_TYPE', True) != 'minimal' else ''} ${@'meta-world-pkgdata:do_allpackagedata' if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1' else ''}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
 
 # The files from COREBASE that you want preserved in the COREBASE copied
@@ -203,10 +206,6 @@ python copy_buildsystem () {
     bb.utils.remove(sstate_out, True)
     # uninative.bbclass sets NATIVELSBSTRING to 'universal'
     fixedlsbstring = 'universal'
-    oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
-                                                   d.getVar('SSTATE_DIR', True),
-                                                   sstate_out, d,
-                                                   fixedlsbstring)
 
     # Add packagedata if enabled
     if d.getVar('SDK_INCLUDE_PKGDATA', True) == '1':
@@ -218,7 +217,9 @@ python copy_buildsystem () {
                                              d.getVar('STAGING_DIR_HOST', True) + '/world-pkgdata/locked-sigs-pkgdata.inc',
                                              lockedsigs_pruned,
                                              lockedsigs_copy)
-        oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_copy,
+
+    if d.getVar('SDK_EXT_TYPE', True) != 'minimal':
+        oe.copy_buildsystem.create_locked_sstate_cache(lockedsigs_pruned,
                                                        d.getVar('SSTATE_DIR', True),
                                                        sstate_out, d,
                                                        fixedlsbstring)
@@ -302,7 +303,7 @@ sdk_ext_postinst() {
 	# For now this is where uninative.bbclass expects the tarball
 	mv *-nativesdk-libc.tar.* $target_sdk_dir/`dirname ${oe_init_build_env_path}`
 
-	if [ "$prepare_buildsystem" != "no" ]; then
+	if [ "$prepare_buildsystem" != "no" -a -n "${@SDK_INSTALL_TARGETS.strip()}" ]; then
 		printf "Preparing build system...\n"
 		# dash which is /bin/sh on Ubuntu will not preserve the
 		# current working directory when first ran, nor will it set $1 when
-- 
2.5.0


