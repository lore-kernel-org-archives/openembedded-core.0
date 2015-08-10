Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 493B6767C4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 03:17:54 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t7A3Hs2p021527
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 9 Aug 2015 20:17:54 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Sun, 9 Aug 2015 20:17:54 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 10 Aug 2015 11:18:01 +0800
Message-ID: <c0e4561d6e6207cff65b3d32bc5d873ff5538584.1438667914.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1438667914.git.Qi.Chen@windriver.com>
References: <cover.1438667914.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/8] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Mon, 10 Aug 2015 03:17:54 -0000
Content-Type: text/plain

Copy the contents of local.conf under TOPDIR into the final generated
local.conf. In this way, custom settings are also made into the final
local.conf like IMAGE_INSTALL, DISTRO_FEATURES, VIRTUAL-RUNTIME_xxx, etc.

Before this change, installing extensible SDK would usually report failure
when preparing the build system if the user has custom configuration for
DISTRO_FEATURES in local.conf. Also, items in IMAGE_INSTALL_append in local.conf
also don't get built correctly.

This patch solves the above problem by making use of the bb.utils.edit_metadata.

In addition, we check to avoid any setting that might lead to host path
bleeding into SDK's configuration. Basically, variables with values starting
with '/' are removed. A whitelist mechanism is introduced so that users could
specify variables that should not be ignored. The name of the whitelist is
SDK_LOCAL_CONF_WHITELIST.

The SDK_META_CONF_WHITELIST is removed as it's of no use after this change.

Add SDK_INHERIT_BLACKLIST to forbit local.conf in SDK to herit certain classes
like 'buildhistory' or 'icecc'.

[YOCTO #7616]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index b6725e0..b111bdc 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -15,7 +15,8 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
 
 SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 
-SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
+SDK_LOCAL_CONF_WHITELIST ?= ""
+SDK_INHERIT_BLACKLIST ?= "buildhistory icecc"
 
 SDK_TARGETS ?= "${PN}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
@@ -109,15 +110,33 @@ python copy_buildsystem () {
         f.write('    "\n')
 
     # Create local.conf
+    local_conf_whitelist = d.getVar('SDK_LOCAL_CONF_WHITELIST', True).split()
+    def handle_var(varname, origvalue, op, newlines):
+        if origvalue.strip().startswith('/') and not varname in local_conf_whitelist:
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
+            f.write(line)
 
         f.write('INHERIT += "%s"\n\n' % 'uninative')
         f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION', False))
 
+        # Some classes are not suitable for SDK, remove them from INHERIT
+        f.write('INHERIT_remove = "%s"\n' % d.getVar('SDK_INHERIT_BLACKLIST'))
+    
         # This is a bit of a hack, but we really don't want these dependencies
         # (we're including them in the SDK as nativesdk- versions instead)
         f.write('POKYQEMUDEPS_forcevariable = ""\n\n')
@@ -134,8 +153,6 @@ python copy_buildsystem () {
         # Ensure locked sstate cache objects are re-used without error
         f.write('SIGGEN_LOCKEDSIGS_CHECK_LEVEL = "warn"\n\n')
 
-        for varname in d.getVar('SDK_META_CONF_WHITELIST', True).split():
-            f.write('%s = "%s"\n' % (varname, d.getVar(varname, True)))
         f.write('require conf/locked-sigs.inc\n')
         f.write('require conf/work-config.inc\n')
 
-- 
1.9.1


