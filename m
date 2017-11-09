Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 42C957853A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:47 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401063"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:13 +1300
Message-Id: <162a5b8225f05c4528c7f3968bcce6da6e613d30.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 12/24] devtool: finish: ensure repository is clean before proceeding
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:47 -0000

If the git repository for a recipe in the workspace has uncommitted
changes in it then it's possible that the user has forgotten to commit
something, so check and exit if there are any. Provide a -f/--force
option to continue in the case where the uncommitted changes aren't
needed.

Separately, if the repository is in the middle of a rebase or git am /
apply then error out (without the opportunity to force) since the user
really needs to sort this out before finishing.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 17 +++++++++++++++++
 scripts/lib/devtool/standard.py | 17 +++++++++++++++--
 2 files changed, 32 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 20ab83f..07d774d 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -350,3 +350,20 @@ def check_prerelease_version(ver, operation):
                        'If you prefer not to reset and re-try, you can change '
                        'the version after %s succeeds using "devtool rename" '
                        'with -V/--version.' % (ver, operation))
+
+def check_git_repo_dirty(repodir):
+    """Check if a git repository is clean or not"""
+    stdout, _ = bb.process.run('git status --porcelain', cwd=repodir)
+    return stdout
+
+def check_git_repo_op(srctree, ignoredirs=None):
+    """Check if a git repository is in the middle of a rebase"""
+    stdout, _ = bb.process.run('git rev-parse --show-toplevel', cwd=srctree)
+    topleveldir = stdout.strip()
+    if ignoredirs and topleveldir in ignoredirs:
+        return
+    gitdir = os.path.join(topleveldir, '.git')
+    if os.path.exists(os.path.join(gitdir, 'rebase-merge')):
+        raise DevtoolError("Source tree %s appears to be in the middle of a rebase - please resolve this first" % srctree)
+    if os.path.exists(os.path.join(gitdir, 'rebase-apply')):
+        raise DevtoolError("Source tree %s appears to be in the middle of 'git am' or 'git apply' - please resolve this first" % srctree)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 9bd2d86..7fee304 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -30,7 +30,7 @@ import errno
 import glob
 import filecmp
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, check_git_repo_dirty, check_git_repo_op, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -1675,6 +1675,18 @@ def finish(args, config, basepath, workspace):
 
     check_workspace_recipe(workspace, args.recipename)
 
+    # Grab the equivalent of COREBASE without having to initialise tinfoil
+    corebasedir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..', '..', '..'))
+
+    srctree = workspace[args.recipename]['srctree']
+    check_git_repo_op(srctree, [corebasedir])
+    dirty = check_git_repo_dirty(srctree)
+    if dirty:
+        if args.force:
+            logger.warning('Source tree is not clean, continuing as requested by -f/--force')
+        else:
+            raise DevtoolError('Source tree is not clean:\n\n%s\nEnsure you have committed your changes or use -f/--force if you are sure there\'s nothing that needs to be committed' % dirty)
+
     no_clean = False
     tinfoil = setup_tinfoil(basepath=basepath, tracking=True)
     try:
@@ -1867,10 +1879,11 @@ def register_commands(subparsers, context):
     parser_reset.set_defaults(func=reset)
 
     parser_finish = subparsers.add_parser('finish', help='Finish working on a recipe in your workspace',
-                                         description='Pushes any committed changes to the specified recipe to the specified layer and removes it from your workspace. Roughly equivalent to an update-recipe followed by reset, except the update-recipe step will do the "right thing" depending on the recipe and the destination layer specified.',
+                                         description='Pushes any committed changes to the specified recipe to the specified layer and removes it from your workspace. Roughly equivalent to an update-recipe followed by reset, except the update-recipe step will do the "right thing" depending on the recipe and the destination layer specified. Note that your changes must have been committed to the git repository in order to be recognised.',
                                          group='working', order=-100)
     parser_finish.add_argument('recipename', help='Recipe to finish')
     parser_finish.add_argument('destination', help='Layer/path to put recipe into. Can be the name of a layer configured in your bblayers.conf, the path to the base of a layer, or a partial path inside a layer. %(prog)s will attempt to complete the path based on the layer\'s structure.')
     parser_finish.add_argument('--mode', '-m', choices=['patch', 'srcrev', 'auto'], default='auto', help='Update mode (where %(metavar)s is %(choices)s; default is %(default)s)', metavar='MODE')
     parser_finish.add_argument('--initial-rev', help='Override starting revision for patches')
+    parser_finish.add_argument('--force', '-f', action="store_true", help='Force continuing even if there are uncommitted changes in the source tree repository')
     parser_finish.set_defaults(func=finish)
-- 
2.9.5


