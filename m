Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 01B1B76104
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 12:42:47 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 07 Sep 2015 05:42:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,485,1437462000"; d="scan'208";a="556940049"
Received: from wmurray-mobl3.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.25.6])
	by FMSMGA003.fm.intel.com with ESMTP; 07 Sep 2015 05:42:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Sep 2015 13:42:23 +0100
Message-Id: <b41ca31fa65b1bec5beecc58dedd7fae45d22427.1441629547.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1441629547.git.paul.eggleton@linux.intel.com>
References: <cover.1441629547.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/11] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Mon, 07 Sep 2015 12:42:48 -0000

From: "Qi.Chen@windriver.com" <Qi.Chen@windriver.com>

Copy the contents of local.conf under TOPDIR into the final generated
local.conf. In this way, custom settings are also made into the final
local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx,
etc. Comments and blank lines are filtered out.

Before this change, installing extensible SDK would usually report failure
when preparing the build system if the user has custom configuration for
DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in
local.conf also don't get built correctly.

This patch solves the above problem by making use of bb.utils.edit_metadata.

In addition, we check to avoid any setting that might lead to host paths
bleeding into the SDK's configuration. Basically, variables with values
starting with '/' are removed. A whitelist mechanism is introduced so that
users could specify variables that should not be ignored. The name of the
whitelist is SDK_LOCAL_CONF_WHITELIST.

The SDK_META_CONF_WHITELIST is removed as it's of no use after this
change.

SDK_LOCAL_CONF_BLACKLIST can be used to prevent copying specific
variable settings to the extensible SDK's local.conf; the default is to
exclude PRSERV_HOST (since this is likely to be internal). Similarly,
SDK_INHERIT_BLACKLIST to forbit local.conf in SDK to inherit certain
classes such as 'buildhistory' or 'icecc' that would not normally make
sense in an SDK environment.

[YOCTO #7616]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 26 +++++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 5dd6051..fa36a91 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -15,7 +15,9 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
 
 SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 
-SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
+SDK_LOCAL_CONF_WHITELIST ?= ""
+SDK_LOCAL_CONF_BLACKLIST ?= "CONF_VERSION BB_NUMBER_THREADS PARALLEL_MAKE PRSERV_HOST"
+SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 
 SDK_TARGETS ?= "${PN}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
@@ -109,15 +111,35 @@ python copy_buildsystem () {
         f.write('    "\n')
 
     # Create local.conf
+    local_conf_whitelist = (d.getVar('SDK_LOCAL_CONF_WHITELIST', True) or '').split()
+    local_conf_blacklist = (d.getVar('SDK_LOCAL_CONF_BLACKLIST', True) or '').split()
+    def handle_var(varname, origvalue, op, newlines):
+        if varname in local_conf_blacklist or (origvalue.strip().startswith('/') and not varname in local_conf_whitelist):
+            newlines.append('# Removed original setting of %s\n' % varname)
+            return None, op, 0, True
+        else:
+            return origvalue, op, 0, True
+    varlist = ['[^#=+ ]*']
+    builddir = d.getVar('TOPDIR', True)
+    with open(builddir + '/conf/local.conf', 'r') as f:
+        oldlines = f.readlines()
+    (updated, newlines) = bb.utils.edit_metadata(oldlines, varlist, handle_var)
+
     with open(baseoutpath + '/conf/local.conf', 'w') as f:
         f.write('# WARNING: this configuration has been automatically generated and in\n')
         f.write('# most cases should not be edited. If you need more flexibility than\n')
         f.write('# this configuration provides, it is strongly suggested that you set\n')
         f.write('# up a proper instance of the full build system and use that instead.\n\n')
+        for line in newlines:
+            if line.strip() and not line.startswith('#'):
+                f.write(line)
 
         f.write('INHERIT += "%s"\n\n' % 'uninative')
         f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
+        # Some classes are not suitable for SDK, remove them from INHERIT
+        f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST'))
+
         # This is a bit of a hack, but we really don't want these dependencies
         # (we're including them in the SDK as nativesdk- versions instead)
         f.write('POKYQEMUDEPS_forcevariable = ""\n\n')
@@ -134,8 +156,6 @@ python copy_buildsystem () {
         # Ensure locked sstate cache objects are re-used without error
         f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n\n')
 
-        for varname in d.getVar('SDK_META_CONF_WHITELIST', True).split():
-            f.write('%s = "%s"\n' % (varname, d.getVar(varname, True)))
         f.write('require conf/locked-sigs.inc\n')
         f.write('require conf/work-config.inc\n')
 
-- 
2.1.0


