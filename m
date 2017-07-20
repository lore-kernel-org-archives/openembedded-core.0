Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5B11B78303
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 14:48:51 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Jul 2017 07:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,384,1496127600"; d="scan'208";a="129748639"
Received: from rpieper-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.39.83])
	by fmsmga006.fm.intel.com with ESMTP; 20 Jul 2017 07:48:52 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Jul 2017 16:48:08 +0200
Message-Id: <3535b61b9a52aaa7d626252de8504c3378a6d0d7.1500561823.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500561823.git.paul.eggleton@linux.intel.com>
References: <cover.1500561823.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 2/7] devtool: extract: refactor kern-tools-native handling
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
X-List-Received-Date: Thu, 20 Jul 2017 14:48:51 -0000

When extracting linux-yocto kernel source, we don't need to dance around
shutting down and starting up tinfoil anymore, we can just execute the
tasks as needed when needed using tinfoil's new build_targets()
function. This allows us to tidy up the code structure a bit.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 7e342e7..0104e67 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -383,7 +383,7 @@ def extract(args, config, basepath, workspace):
     """Entry point for the devtool 'extract' subcommand"""
     import bb
 
-    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    tinfoil = setup_tinfoil(basepath=basepath)
     if not tinfoil:
         # Error already shown
         return 1
@@ -407,7 +407,7 @@ def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
     import bb
 
-    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    tinfoil = setup_tinfoil(basepath=basepath)
     if not tinfoil:
         # Error already shown
         return 1
@@ -428,29 +428,6 @@ def sync(args, config, basepath, workspace):
         tinfoil.shutdown()
 
 
-def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
-    """HACK: Ugly workaround for making sure that requirements are met when
-       trying to extract a package. Returns the tinfoil instance to be used."""
-    if not tinfoil:
-        tinfoil = setup_tinfoil(basepath=basepath)
-
-    rd = parse_recipe(config, tinfoil, recipename, True)
-    if not rd:
-        tinfoil.shutdown()
-        return None
-
-    if bb.data.inherits_class('kernel-yocto', rd):
-        tinfoil.shutdown()
-        try:
-            stdout, _ = exec_build_env_command(config.init_path, basepath,
-                                               'bitbake kern-tools-native')
-            tinfoil = setup_tinfoil(basepath=basepath)
-        except bb.process.ExecutionError as err:
-            raise DevtoolError("Failed to build kern-tools-native:\n%s" %
-                               err.stdout)
-    return tinfoil
-
-
 def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
     """Extract sources of a recipe"""
     import oe.recipeutils
@@ -475,6 +452,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
             raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
                                "extract source" % pn, 4)
 
+    if bb.data.inherits_class('kernel-yocto', d):
+        tinfoil.build_targets('kern-tools-native')
+
     if not sync:
         # Prepare for shutil.move later on
         bb.utils.mkdirhier(srctree)
@@ -773,13 +753,6 @@ def modify(args, config, basepath, workspace):
             raise DevtoolError("--no-extract specified and source path %s does "
                             "not exist or is not a directory" %
                             srctree)
-        if not args.no_extract:
-            tinfoil = _prep_extract_operation(config, basepath, pn, tinfoil)
-            if not tinfoil:
-                # Error already shown
-                return 1
-            # We need to re-parse because tinfoil may have been re-initialised
-            rd = parse_recipe(config, tinfoil, args.recipename, True)
 
         recipefile = rd.getVar('FILE')
         appendfile = recipe_to_append(recipefile, config, args.wildcard)
-- 
2.9.4


