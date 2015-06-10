Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4759E6AC38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 07:25:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t5A7P7Ec023941
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 00:25:07 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.211) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.224.2; Wed, 10 Jun 2015 00:25:07 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Jun 2015 15:25:24 +0800
Message-ID: <bc18698031a835a0d945a70fa89e4f8551687b57.1433920984.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1433920984.git.Qi.Chen@windriver.com>
References: <cover.1433920984.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH V2 3/3] populate_sdk_ext: consider custom configuration in local.conf
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
X-List-Received-Date: Wed, 10 Jun 2015 07:25:06 -0000
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

[YOCTO #7616]

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/classes/populate_sdk_ext.bbclass | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 2fc4c11..08130d4 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -16,6 +16,7 @@ SDK_RDEPENDS_append_task-populate-sdk-ext = " ${SDK_TARGETS}"
 SDK_RELOCATE_AFTER_INSTALL_task-populate-sdk-ext = "0"
 
 SDK_META_CONF_WHITELIST ?= "MACHINE DISTRO PACKAGE_CLASSES"
+SDK_LOCAL_CONF_WHITELIST ?= ""
 
 SDK_TARGETS ?= "${PN}"
 OE_INIT_ENV_SCRIPT ?= "oe-init-build-env"
@@ -108,12 +109,28 @@ python copy_buildsystem () {
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
+
         f.write('INHERIT += "%s"\n\n' % 'uninative')
         f.write('CONF_VERSION = "%s"\n\n' % d.getVar('CONF_VERSION'))
 
-- 
1.9.1


