Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id BAD1A6E660
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:45 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213380"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:45 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:26 +1300
Message-Id: <b46e4dc7880d559a23b8ca1aad990afc8dff8419.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1448244474.git.paul.eggleton@linux.intel.com>
References: <cover.1448244474.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 07/18] devtool: disable creating workspace for extract and search subcommands
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:46 -0000

For subcommands that don't actually involve the workspace, don't
auto-create the workspace.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py | 8 ++++----
 scripts/devtool                   | 4 ++--
 scripts/lib/devtool/search.py     | 2 +-
 scripts/lib/devtool/standard.py   | 2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index dcdef5a..0a44ae7 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -823,10 +823,10 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool extract remake %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
+        # devtool extract shouldn't create the workspace
+        self.assertFalse(os.path.exists(self.workspacedir))
         self._check_src_repo(tempdir)
 
     @testcase(1379)
@@ -834,10 +834,10 @@ class DevtoolTests(DevtoolBase):
         tempdir = tempfile.mkdtemp(prefix='devtoolqa')
         # Try devtool extract
         self.track_for_cleanup(tempdir)
-        self.track_for_cleanup(self.workspacedir)
-        self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         result = runCmd('devtool extract virtual/libx11 %s' % tempdir)
         self.assertTrue(os.path.exists(os.path.join(tempdir, 'Makefile.am')), 'Extracted source could not be found')
+        # devtool extract shouldn't create the workspace
+        self.assertFalse(os.path.exists(self.workspacedir))
         self._check_src_repo(tempdir)
 
     @testcase(1168)
diff --git a/scripts/devtool b/scripts/devtool
index e4d9db3..2a5a3d4 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -261,7 +261,7 @@ def main():
                                                         description='Sets up a new workspace. NOTE: other devtool subcommands will create a workspace automatically as needed, so you only need to use %(prog)s if you want to specify where the workspace should be located.')
         parser_create_workspace.add_argument('layerpath', nargs='?', help='Path in which the workspace layer should be created')
         parser_create_workspace.add_argument('--create-only', action="store_true", help='Only create the workspace layer, do not alter configuration')
-        parser_create_workspace.set_defaults(func=create_workspace)
+        parser_create_workspace.set_defaults(func=create_workspace, no_workspace=True)
 
     for plugin in plugins:
         if hasattr(plugin, 'register_commands'):
@@ -269,7 +269,7 @@ def main():
 
     args = parser.parse_args(unparsed_args, namespace=global_args)
 
-    if args.subparser_name != 'create-workspace':
+    if not getattr(args, 'no_workspace', False):
         read_workspace()
 
     try:
diff --git a/scripts/lib/devtool/search.py b/scripts/lib/devtool/search.py
index c2f420c..1c8eaff 100644
--- a/scripts/lib/devtool/search.py
+++ b/scripts/lib/devtool/search.py
@@ -77,4 +77,4 @@ def register_commands(subparsers, context):
     parser_search = subparsers.add_parser('search', help='Search available recipes',
                                             description='Searches for available target recipes. Matches on recipe name, package name, description and installed files, and prints the recipe name on match.')
     parser_search.add_argument('keyword', help='Keyword to search for (regular expression syntax allowed)')
-    parser_search.set_defaults(func=search)
+    parser_search.set_defaults(func=search, no_workspace=True)
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index ace3a4b..bc92456 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -1117,7 +1117,7 @@ def register_commands(subparsers, context):
     parser_extract.add_argument('srctree', help='Path to where to extract the source tree')
     parser_extract.add_argument('--branch', '-b', default="devtool", help='Name for development branch to checkout')
     parser_extract.add_argument('--keep-temp', action="store_true", help='Keep temporary directory (for debugging)')
-    parser_extract.set_defaults(func=extract)
+    parser_extract.set_defaults(func=extract, no_workspace=True)
 
     parser_update_recipe = subparsers.add_parser('update-recipe', help='Apply changes from external source tree to recipe',
                                        description='Applies changes from external source tree to a recipe (updating/adding/removing patches as necessary, or by updating SRCREV)')
-- 
2.1.0


