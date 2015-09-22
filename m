Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6EA637700B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:18 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520464"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:33 +0100
Message-Id: <cedd8c5c18cde0dbe532673f4e2c5580376c5a17.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 19/27] devtool: add: set up fetched source as a git repository by default
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:19 -0000

If the fetched source isn't already a git repository, initialise it as
one and then branch and tag, just as we do with "devtool modify". This
makes it easier to make changes, commit them and then use the
"devtool update-recipe" command to turn those commits into patches
on the recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 17 +++++++++++++++++
 scripts/lib/devtool/standard.py | 13 ++++++-------
 2 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 07a3636..f815ef2 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -170,3 +170,20 @@ def use_external_build(same_dir, no_same_dir, d):
     else:
         b_is_s = False
     return b_is_s
+
+def setup_git_repo(repodir, version, devbranch, basetag='devtool-base'):
+    """
+    Set up the git repository for the source tree
+    """
+    import bb.process
+    if not os.path.exists(os.path.join(repodir, '.git')):
+        bb.process.run('git init', cwd=repodir)
+        bb.process.run('git add .', cwd=repodir)
+        if version:
+            commitmsg = "Initial commit from upstream at version %s" % version
+        else:
+            commitmsg = "Initial commit from upstream"
+        bb.process.run('git commit -q -m "%s"' % commitmsg, cwd=repodir)
+
+    bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
+    bb.process.run('git tag -f %s' % basetag, cwd=repodir)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ff79c05..4a05c1d 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -25,7 +25,7 @@ import logging
 import argparse
 import scriptutils
 import errno
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -102,6 +102,9 @@ def add(args, config, basepath, workspace):
 
     _add_md5(config, args.recipename, recipefile)
 
+    if args.fetch and not args.no_git:
+        setup_git_repo(srctree, args.version, 'devtool')
+
     initial_rev = None
     if os.path.exists(os.path.join(srctree, '.git')):
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
@@ -340,16 +343,11 @@ def _extract_source(srctree, keep_temp, devbranch, d):
                                "correct source directory could not be "
                                "determined" % pn)
 
-        if not os.path.exists(os.path.join(srcsubdir, '.git')):
-            bb.process.run('git init', cwd=srcsubdir)
-            bb.process.run('git add .', cwd=srcsubdir)
-            bb.process.run('git commit -q -m "Initial commit from upstream at version %s"' % crd.getVar('PV', True), cwd=srcsubdir)
+        setup_git_repo(srcsubdir, crd.getVar('PV', True), devbranch)
 
         (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srcsubdir)
         initial_rev = stdout.rstrip()
 
-        bb.process.run('git checkout -b %s' % devbranch, cwd=srcsubdir)
-        bb.process.run('git tag -f devtool-base', cwd=srcsubdir)
         crd.setVar('PATCHTOOL', 'git')
 
         logger.info('Patching...')
@@ -885,6 +883,7 @@ def register_commands(subparsers, context):
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
     parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree', metavar='URI')
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
+    parser_add.add_argument('--no-git', '-g', help='If -f/--fetch is specified, do not set up source tree as a git repository', action="store_true")
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
-- 
2.1.0


