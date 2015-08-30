Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id AF39776E6A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 16:08:53 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 30 Aug 2015 09:08:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,435,1437462000"; d="scan'208";a="778575337"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 30 Aug 2015 09:08:54 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 42D6A6A4005
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Aug 2015 09:08:03 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 30 Aug 2015 19:08:36 +0300
Message-Id: <20e6f80771d2c601217604a1053f8e96d8adcf81.1440950164.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1440950164.git.ed.bartosh@linux.intel.com>
References: <cover.1440950164.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 03/11] Revert "devtool: make add_md5 a public API"
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
X-List-Received-Date: Sun, 30 Aug 2015 16:08:53 -0000

This reverts commit 69c63728dae38d5b1cc9874268f235a07e04d3db.

Moved add_md5 back to standard.py as it's not used in
any plugin anymore.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/__init__.py |  7 -------
 scripts/lib/devtool/standard.py | 15 +++++++++++----
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 97ac6ae..404d3e6 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -110,13 +110,6 @@ def setup_tinfoil(config_only=False):
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
     return tinfoil
 
-def add_md5(config, recipename, filename):
-    """Record checksum of a recipe to the md5-file of the workspace"""
-    import bb.utils
-    md5 = bb.utils.md5_file(filename)
-    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
-        f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
-
 def get_recipe_file(cooker, pn):
     """Find recipe file corresponding a package name"""
     import oe.recipeutils
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 97c45d9..de7afd9 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -26,7 +26,7 @@ import argparse
 import scriptutils
 import errno
 from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
-from devtool import add_md5, parse_recipe
+from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
 
@@ -105,7 +105,7 @@ def add(args, config, basepath, workspace):
     except bb.process.ExecutionError as e:
         raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
-    add_md5(config, args.recipename, recipefile)
+    _add_md5(config, args.recipename, recipefile)
 
     initial_rev = None
     if os.path.exists(os.path.join(srctree, '.git')):
@@ -121,7 +121,7 @@ def add(args, config, basepath, workspace):
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
 
-    add_md5(config, args.recipename, appendfile)
+    _add_md5(config, args.recipename, appendfile)
 
     return 0
 
@@ -344,6 +344,13 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             shutil.rmtree(tempdir)
     return initial_rev
 
+def _add_md5(config, recipename, filename):
+    """Record checksum of a recipe to the md5-file of the workspace"""
+    import bb.utils
+    md5 = bb.utils.md5_file(filename)
+    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
+        f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
+
 def _check_preserve(config, recipename):
     """Check if a recipe was manually changed and needs to be saved in 'attic'
        directory"""
@@ -471,7 +478,7 @@ def modify(args, config, basepath, workspace):
             for commit in commits:
                 f.write('# commit: %s\n' % commit)
 
-    add_md5(config, args.recipename, appendfile)
+    _add_md5(config, args.recipename, appendfile)
 
     logger.info('Recipe %s now set up to build from %s' % (args.recipename, srctree))
 
-- 
2.1.4


