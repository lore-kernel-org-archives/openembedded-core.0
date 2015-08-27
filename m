Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 17A41760FB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 11:49:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Aug 2015 04:49:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,422,1437462000"; d="scan'208";a="549519156"
Received: from njackson-mobl1.amr.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.25.89])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Aug 2015 04:49:55 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Aug 2015 14:49:50 +0300
Message-Id: <1440676190-2167-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1440676190-2167-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 3/3] devtool: run kernel dependencies
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
X-List-Received-Date: Thu, 27 Aug 2015 11:49:55 -0000

The kernel package needs "kern-tools-native" in order for it's
do_kernel_metadata. Thus, devtool extract for kernel in a pristine
environment fails. With the current bb.tinfoil implementation it is not
possible to run arbitrary bitbake commands - e.g. run
"bitbake kern-tools-native -c populate_sysroot" in our case. This patch
implements an ugly workaround for that problem, basically by hardcoding
this dependency and running the required bitbake task(s) before tinfoil
is initialized.

[YOCTO #6658]

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 3725d87..bf24e32 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -197,6 +197,8 @@ def extract(args, config, basepath, workspace):
     """Entry point for the devtool 'extract' subcommand"""
     import bb
 
+    _check_extract_deps(config, basepath, args.recipename)
+
     tinfoil = setup_tinfoil()
 
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
@@ -237,6 +239,20 @@ class BbTaskExecutor(object):
             self.executed.append(func)
 
 
+def _check_extract_deps(config, basepath, recipename):
+    """HACK: Ugly workaround for making sure that requirements are met when
+       trying to extract a package"""
+    tinfoil = setup_tinfoil()
+    rd = _parse_recipe(config, tinfoil, recipename, True)
+    if bb.data.inherits_class('kernel-yocto', rd):
+        tinfoil.shutdown()
+        try:
+            stdout, _ = exec_build_env_command(config.init_path, basepath,
+                                               'bitbake kern-tools-native')
+        except bb.process.ExecutionError as err:
+            raise DevtoolError("Failed to build kern-tools-native:\n%s" %
+                               err.stdout)
+
 def _extract_source(srctree, keep_temp, devbranch, d):
     """Extract sources of a recipe"""
     import bb.event
@@ -422,7 +438,8 @@ def modify(args, config, basepath, workspace):
         raise DevtoolError("directory %s does not exist or not a directory "
                            "(specify -x to extract source from recipe)" %
                            args.srctree)
-
+    if args.extract:
+        _check_extract_deps(config, basepath, args.recipename)
     tinfoil = setup_tinfoil()
 
     rd = _parse_recipe(config, tinfoil, args.recipename, True)
-- 
2.1.4


