Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id B304771633
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 07:33:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga103.jf.intel.com with ESMTP; 24 Aug 2015 00:33:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,736,1432623600"; d="scan'208";a="754184283"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 24 Aug 2015 00:33:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id AC7F16A4083;
	Mon, 24 Aug 2015 00:32:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 10:33:30 +0300
Message-Id: <833fcc1026046c895ab51fdeb58ec9b24a7516ca.1440401351.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1440401351.git.ed.bartosh@linux.intel.com>
References: <cover.1440401351.git.ed.bartosh@linux.intel.com>
Subject: [PATCH 1/2] devtool: make add_md5 a public API
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
X-List-Received-Date: Mon, 24 Aug 2015 07:33:55 -0000

Moved _add_md5 function from standard.py to __init__.py to
be able to call it from other modules.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 scripts/lib/devtool/__init__.py |  6 ++++++
 scripts/lib/devtool/standard.py | 14 ++++----------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index b54ddf5..1747fff 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -110,3 +110,9 @@ def setup_tinfoil(config_only=False):
     tinfoil.logger.setLevel(logger.getEffectiveLevel())
     return tinfoil
 
+def add_md5(config, recipename, filename):
+    """Record checksum of a recipe to the md5-file of the workspace"""
+    import bb.utils
+    md5 = bb.utils.md5_file(filename)
+    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
+        f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e1c5584..4aa6ebd 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -26,6 +26,7 @@ import argparse
 import scriptutils
 import errno
 from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+from devtool import add_md5
 
 logger = logging.getLogger('devtool')
 
@@ -104,7 +105,7 @@ def add(args, config, basepath, workspace):
     except bb.process.ExecutionError as e:
         raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
-    _add_md5(config, args.recipename, recipefile)
+    add_md5(config, args.recipename, recipefile)
 
     initial_rev = None
     if os.path.exists(os.path.join(srctree, '.git')):
@@ -120,7 +121,7 @@ def add(args, config, basepath, workspace):
         if initial_rev:
             f.write('\n# initial_rev: %s\n' % initial_rev)
 
-    _add_md5(config, args.recipename, appendfile)
+    add_md5(config, args.recipename, appendfile)
 
     return 0
 
@@ -371,13 +372,6 @@ def _extract_source(srctree, keep_temp, devbranch, d):
             shutil.rmtree(tempdir)
     return initial_rev
 
-def _add_md5(config, recipename, filename):
-    """Record checksum of a recipe to the md5-file of the workspace"""
-    import bb.utils
-    md5 = bb.utils.md5_file(filename)
-    with open(os.path.join(config.workspace_path, '.devtool_md5'), 'a') as f:
-        f.write('%s|%s|%s\n' % (recipename, os.path.relpath(filename, config.workspace_path), md5))
-
 def _check_preserve(config, recipename):
     """Check if a recipe was manually changed and needs to be saved in 'attic'
        directory"""
@@ -505,7 +499,7 @@ def modify(args, config, basepath, workspace):
             for commit in commits:
                 f.write('# commit: %s\n' % commit)
 
-    _add_md5(config, args.recipename, appendfile)
+    add_md5(config, args.recipename, appendfile)
 
     logger.info('Recipe %s now set up to build from %s' % (args.recipename, srctree))
 
-- 
2.1.4


