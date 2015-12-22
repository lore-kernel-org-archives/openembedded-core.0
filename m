Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id AD4A3731B5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979125"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:09 +1300
Message-Id: <136b6cb3da40cc7ec6f302c415c97c83df59945a.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 16/26] devtool: add: allow source tree to be omitted
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:58 -0000

Assuming we're fetching source remotely (from a URI) we can default the
source tree that will be extracted from it to a "sources" directory
under the workspace in order to save the user specifying it if they
don't have a preferred location.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 195da1a..b129db3 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -49,7 +49,12 @@ def add(args, config, basepath, workspace):
     if '/' in args.recipename:
         raise DevtoolError('"/" is not a valid character in recipe names')
 
-    srctree = os.path.abspath(args.srctree)
+    if args.srctree:
+        srctree = os.path.abspath(args.srctree)
+    else:
+        srctree = get_default_srctree(config, args.recipename)
+        logger.info('Using default source tree path %s' % srctree)
+
     if os.path.exists(srctree):
         if args.fetch:
             if not os.path.isdir(srctree):
@@ -61,8 +66,16 @@ def add(args, config, basepath, workspace):
                                    "it already exists and is non-empty" %
                                    srctree)
     elif not args.fetch:
-        raise DevtoolError("Specified source tree %s could not be found" %
-                           srctree)
+        if args.srctree:
+            raise DevtoolError("Specified source tree %s could not be found" %
+                               args.srctree)
+        else:
+            raise DevtoolError("No source tree exists at default path %s - "
+                               "either create and populate this directory, "
+                               "or specify a path to a source tree, or use "
+                               "the -f/--fetch option to fetch source code "
+                               "and extract it to the source directory" %
+                               srctree)
 
     recipedir = os.path.join(config.workspace_path, 'recipes', args.recipename)
     bb.utils.mkdirhier(recipedir)
@@ -1168,13 +1181,22 @@ def edit_recipe(args, config, basepath, workspace):
 
     return 0
 
+def get_default_srctree(config, recipename=''):
+    """Get the default srctree path"""
+    srctreeparent = config.get('General', 'default_source_parent_dir', config.workspace_path)
+    if recipename:
+        return os.path.join(srctreeparent, 'sources', recipename)
+    else:
+        return os.path.join(srctreeparent, 'sources')
 
 def register_commands(subparsers, context):
     """Register devtool subcommands from this plugin"""
+
+    defsrctree = get_default_srctree(context.config)
     parser_add = subparsers.add_parser('add', help='Add a new recipe',
                                        description='Adds a new recipe to the workspace to build a specified source tree. Can optionally fetch a remote URI and unpack it to create the source tree.')
     parser_add.add_argument('recipename', help='Name for new recipe to add (just name - no version, path or extension)')
-    parser_add.add_argument('srctree', help='Path to external source tree')
+    parser_add.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     group = parser_add.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-- 
2.5.0


