Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 08A4A78226
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:07:31 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Jul 2017 03:07:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,380,1496127600"; d="scan'208";a="994656325"
Received: from gsena-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.48.213])
	by orsmga003.jf.intel.com with ESMTP; 19 Jul 2017 03:07:25 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jul 2017 12:07:16 +0200
Message-Id: <c149d0c847ce0f789b2d1a6e202c73e6ed38fe25.1500458777.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1500458777.git.paul.eggleton@linux.intel.com>
References: <cover.1500458777.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 3/5] devtool: extract: refactor kern-tools-native handling
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
X-List-Received-Date: Wed, 19 Jul 2017 10:07:32 -0000

When extracting linux-yocto kernel source, we don't need to dance around
shutting down and starting up tinfoil anymore, we can just execute the
tasks as needed. This allows us to tidy up the code structure a bit.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 37 +++++--------------------------------
 1 file changed, 5 insertions(+), 32 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 008cfa3..b1cc23d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -371,7 +371,7 @@ def extract(args, config, basepath, workspace):
     """Entry point for the devtool 'extract' subcommand"""
     import bb
 
-    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    tinfoil = setup_tinfoil(basepath=basepath)
     if not tinfoil:
         # Error already shown
         return 1
@@ -395,7 +395,7 @@ def sync(args, config, basepath, workspace):
     """Entry point for the devtool 'sync' subcommand"""
     import bb
 
-    tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+    tinfoil = setup_tinfoil(basepath=basepath)
     if not tinfoil:
         # Error already shown
         return 1
@@ -416,29 +416,6 @@ def sync(args, config, basepath, workspace):
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
@@ -463,6 +440,9 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d, tinfoil):
             raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
                                "extract source" % pn, 4)
 
+    if bb.data.inherits_class('kernel-yocto', d):
+        tinfoil.build_targets('kern-tools-native')
+
     if not sync:
         # Prepare for shutil.move later on
         bb.utils.mkdirhier(srctree)
@@ -761,13 +741,6 @@ def modify(args, config, basepath, workspace):
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


