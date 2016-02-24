Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 25BF57739F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Feb 2016 05:09:15 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 23 Feb 2016 21:09:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,492,1449561600"; d="scan'208";a="658305523"
Received: from sloi-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.175])
	by FMSMGA003.fm.intel.com with ESMTP; 23 Feb 2016 21:09:01 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Feb 2016 18:07:22 +1300
Message-Id: <e474588d78295fdc662489f56688ce6ada0acdd2.1456290353.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1456290353.git.paul.eggleton@linux.intel.com>
References: <cover.1456290353.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/14] devtool: modify: fix source tree default name when mapping virtuals
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
X-List-Received-Date: Wed, 24 Feb 2016 05:09:15 -0000

If you for example ran devtool modify virtual/libusb0 without specifying
a source tree path, the default was <workspace>/sources/virtual/libusb0
which isn't correct - it should be using the mapped name i.e.
libusb-compat (in the default OE-Core configuration). Reorder some of
the code to ensure that the mapped name is used.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 35 ++++++++++++++++++-----------------
 1 file changed, 18 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index bcf6520..acd21c7 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -425,10 +425,12 @@ class PatchTaskExecutor(BbTaskExecutor):
                 bb.process.run('git add .; git commit -a -m "Committing changes from %s\n\n%s"' % (func, GitApplyTree.ignore_commit_prefix + ' - from %s' % func), cwd=srcsubdir)
 
 
-def _prep_extract_operation(config, basepath, recipename):
+def _prep_extract_operation(config, basepath, recipename, tinfoil=None):
     """HACK: Ugly workaround for making sure that requirements are met when
        trying to extract a package. Returns the tinfoil instance to be used."""
-    tinfoil = setup_tinfoil(basepath=basepath)
+    if not tinfoil:
+        tinfoil = setup_tinfoil(basepath=basepath)
+
     rd = parse_recipe(config, tinfoil, recipename, True)
     if not rd:
         return None
@@ -680,33 +682,32 @@ def modify(args, config, basepath, workspace):
         raise DevtoolError("recipe %s is already in your workspace" %
                            args.recipename)
 
+    tinfoil = setup_tinfoil(basepath=basepath)
+    rd = parse_recipe(config, tinfoil, args.recipename, True)
+    if not rd:
+        return 1
+
+    pn = rd.getVar('PN', True)
+    if pn != args.recipename:
+        logger.info('Mapping %s to %s' % (args.recipename, pn))
+    if pn in workspace:
+        raise DevtoolError("recipe %s is already in your workspace" %
+                           pn)
+
     if args.srctree:
         srctree = os.path.abspath(args.srctree)
     else:
-        srctree = get_default_srctree(config, args.recipename)
+        srctree = get_default_srctree(config, pn)
 
     if args.no_extract and not os.path.isdir(srctree):
         raise DevtoolError("--no-extract specified and source path %s does "
                            "not exist or is not a directory" %
                            srctree)
     if not args.no_extract:
-        tinfoil = _prep_extract_operation(config, basepath, args.recipename)
+        tinfoil = _prep_extract_operation(config, basepath, pn, tinfoil)
         if not tinfoil:
             # Error already shown
             return 1
-    else:
-        tinfoil = setup_tinfoil(basepath=basepath)
-
-    rd = parse_recipe(config, tinfoil, args.recipename, True)
-    if not rd:
-        return 1
-
-    pn = rd.getVar('PN', True)
-    if pn != args.recipename:
-        logger.info('Mapping %s to %s' % (args.recipename, pn))
-    if pn in workspace:
-        raise DevtoolError("recipe %s is already in your workspace" %
-                           pn)
 
     recipefile = rd.getVar('FILE', True)
     appendfile = recipe_to_append(recipefile, config, args.wildcard)
-- 
2.5.0


