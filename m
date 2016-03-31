Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 73DBE6FEE0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 08:53:46 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 31 Mar 2016 01:53:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,421,1455004800"; d="scan'208";a="945099263"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.133.74])
	by orsmga002.jf.intel.com with ESMTP; 31 Mar 2016 01:53:44 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 31 Mar 2016 21:53:31 +1300
Message-Id: <989a467aa07088763d4df208cb59cd8cbcdfc9f5.1459414389.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1459414389.git.paul.eggleton@linux.intel.com>
References: <cover.1459414389.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/5] classes/populate_sdk_ext: support setting vars from environment at build time
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
X-List-Received-Date: Thu, 31 Mar 2016 08:53:46 -0000

When running bitbake you may pass in values of variables from the
external environment (making use of BB_ENV_EXTRAWHITE), and you may
choose to do this when building the extensible SDK, for example:

  MACHINE=qemuarm bitbake -c populate_sdk_ext core-image-minimal

You would naturally expect those settings to be reflected in the
extensible SDK itself; however they were not, since we were only
considering local.conf and auto.conf. Check the variables mentioned in
BB_ENV_EXTRAWHITE to see if any are different than the values set in
local.conf/auto.conf and add lines setting them in the SDK's local.conf
if so.

Fixes [YOCTO #9339].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/populate_sdk_ext.bbclass | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/meta/classes/populate_sdk_ext.bbclass b/meta/classes/populate_sdk_ext.bbclass
index 0ea974d..5e2ebd7 100644
--- a/meta/classes/populate_sdk_ext.bbclass
+++ b/meta/classes/populate_sdk_ext.bbclass
@@ -164,6 +164,9 @@ python copy_buildsystem () {
         f.write('    $' + '{SDKBASEMETAPATH}/workspace \\\n')
         f.write('    "\n')
 
+    env_whitelist = (d.getVar('BB_ENV_EXTRAWHITE', True) or '').split()
+    env_whitelist_values = {}
+
     # Create local.conf
     builddir = d.getVar('TOPDIR', True)
     if derivative:
@@ -176,6 +179,8 @@ python copy_buildsystem () {
                 newlines.append('# Removed original setting of %s\n' % varname)
                 return None, op, 0, True
             else:
+                if varname in env_whitelist:
+                    env_whitelist_values[varname] = origvalue
                 return origvalue, op, 0, True
         varlist = ['[^#=+ ]*']
         with open(builddir + '/conf/local.conf', 'r') as f:
@@ -241,6 +246,21 @@ python copy_buildsystem () {
                     if line.strip() and not line.startswith('#'):
                         f.write(line)
 
+    # Ensure any variables set from the external environment (by way of
+    # BB_ENV_EXTRAWHITE) are set in the SDK's configuration
+    extralines = []
+    for name, value in env_whitelist_values.iteritems():
+        actualvalue = d.getVar(name, True) or ''
+        if value != actualvalue:
+            extralines.append('%s = "%s"\n' % (name, actualvalue))
+    if extralines:
+        with open(baseoutpath + '/conf/local.conf', 'a') as f:
+            f.write('\n')
+            f.write('# Extra settings from environment:\n')
+            for line in extralines:
+                f.write(line)
+            f.write('\n')
+
     # Filter the locked signatures file to just the sstate tasks we are interested in
     excluded_targets = d.getVar('SDK_TARGETS', True)
     sigfile = d.getVar('WORKDIR', True) + '/locked-sigs.inc'
-- 
2.5.5


