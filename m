Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 0BCAF731D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979181"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:11 +1300
Message-Id: <eaf256010ae6354aa4841e9650c4eb9a94493579.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 18/26] devtool: add: allow specifying URL as positional argument
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:04 -0000

Having to specify -f is a little bit ugly when a URI is distinctive
enough to recognise amongst the other positional parameters, so take it
as an optional positional parameter. -f/--fetch is still supported, but
deprecated.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 |  2 ++
 scripts/lib/argparse_oe.py      | 16 +++++++++++++
 scripts/lib/devtool/standard.py | 52 +++++++++++++++++++++++++++++------------
 3 files changed, 55 insertions(+), 15 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 955495e..93ba58e 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -280,6 +280,8 @@ def main():
         if str(err):
             logger.error(str(err))
         ret = 1
+    except argparse_oe.ArgumentUsageError as ae:
+        parser.error_subcommand(ae.message, ae.subcommand)
 
     return ret
 
diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index ec7eb8d..fd86692 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -1,6 +1,12 @@
 import sys
 import argparse
 
+class ArgumentUsageError(Exception):
+    """Exception class you can raise (and catch) in order to show the help"""
+    def __init__(self, message, subcommand=None):
+        self.message = message
+        self.subcommand = subcommand
+
 class ArgumentParser(argparse.ArgumentParser):
     """Our own version of argparse's ArgumentParser"""
 
@@ -9,6 +15,16 @@ class ArgumentParser(argparse.ArgumentParser):
         self.print_help()
         sys.exit(2)
 
+    def error_subcommand(self, message, subcommand):
+        if subcommand:
+            for action in self._actions:
+                if isinstance(action, argparse._SubParsersAction):
+                    for choice, subparser in action.choices.items():
+                        if choice == subcommand:
+                            subparser.error(message)
+                            return
+        self.error(message)
+
     def add_subparsers(self, *args, **kwargs):
         ret = super(ArgumentParser, self).add_subparsers(*args, **kwargs)
         ret._parser_class = ArgumentSubParser
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 6cdd44c..e249661 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -23,6 +23,7 @@ import shutil
 import tempfile
 import logging
 import argparse
+import argparse_oe
 import scriptutils
 import errno
 from collections import OrderedDict
@@ -37,16 +38,38 @@ def add(args, config, basepath, workspace):
     import bb
     import oe.recipeutils
 
-    if args.recipename and not args.srctree:
-        # These are positional arguments, but because we're nice, allow
-        # specifying source tree without name if we can detect that that
-        # is what the user meant
+    if not args.recipename and not args.srctree and not args.fetch and not args.fetchuri:
+        raise argparse_oe.ArgumentUsageError('At least one of recipename, srctree, fetchuri or -f/--fetch must be specified', 'add')
+
+    # These are positional arguments, but because we're nice, allow
+    # specifying e.g. source tree without name, or fetch URI without name or
+    # source tree (if we can detect that that is what the user meant)
+    if '://' in args.recipename:
+        if not args.fetchuri:
+            if args.fetch:
+                raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
+            args.fetchuri = args.recipename
+            args.recipename = ''
+    elif '://' in args.srctree:
+        if not args.fetchuri:
+            if args.fetch:
+                raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
+            args.fetchuri = args.srctree
+            args.srctree = ''
+    elif args.recipename and not args.srctree:
         if os.sep in args.recipename:
             args.srctree = args.recipename
             args.recipename = None
         elif os.path.isdir(args.recipename):
             logger.warn('Ambiguous argument %s - assuming you mean it to be the recipe name')
 
+    if args.fetch:
+        if args.fetchuri:
+            raise DevtoolError('URI specified as positional argument as well as -f/--fetch')
+        else:
+            # FIXME should show a warning that -f/--fetch is deprecated here
+            args.fetchuri = args.fetch
+
     if args.recipename:
         if args.recipename in workspace:
             raise DevtoolError("recipe %s is already in your workspace" %
@@ -70,7 +93,7 @@ def add(args, config, basepath, workspace):
         tmpsrcdir = tempfile.mkdtemp(prefix='devtoolsrc', dir=srctreeparent)
 
     if srctree and os.path.exists(srctree):
-        if args.fetch:
+        if args.fetchuri:
             if not os.path.isdir(srctree):
                 raise DevtoolError("Cannot fetch into source tree path %s as "
                                    "it exists and is not a directory" %
@@ -79,20 +102,18 @@ def add(args, config, basepath, workspace):
                 raise DevtoolError("Cannot fetch into source tree path %s as "
                                    "it already exists and is non-empty" %
                                    srctree)
-    elif not args.fetch:
+    elif not args.fetchuri:
         if args.srctree:
             raise DevtoolError("Specified source tree %s could not be found" %
                                args.srctree)
         elif srctree:
             raise DevtoolError("No source tree exists at default path %s - "
                                "either create and populate this directory, "
-                               "or specify a path to a source tree, or use "
-                               "the -f/--fetch option to fetch source code "
-                               "and extract it to the source directory" %
-                               srctree)
+                               "or specify a path to a source tree, or a "
+                               "URI to fetch source from" % srctree)
         else:
             raise DevtoolError("You must either specify a source tree "
-                               "or -f to fetch source")
+                               "or a URI to fetch source from")
 
     if args.version:
         if '_' in args.version or ' ' in args.version:
@@ -103,8 +124,8 @@ def add(args, config, basepath, workspace):
     else:
         color = args.color
     extracmdopts = ''
-    if args.fetch:
-        source = args.fetch
+    if args.fetchuri:
+        source = args.fetchuri
         if srctree:
             extracmdopts += ' -x %s' % srctree
         else:
@@ -1250,12 +1271,13 @@ def register_commands(subparsers, context):
                                        description='Adds a new recipe to the workspace to build a specified source tree. Can optionally fetch a remote URI and unpack it to create the source tree.')
     parser_add.add_argument('recipename', nargs='?', help='Name for new recipe to add (just name - no version, path or extension). If not specified, will attempt to auto-detect it.')
     parser_add.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
+    parser_add.add_argument('fetchuri', nargs='?', help='Fetch the specified URI and extract it to create the source tree')
     group = parser_add.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-    parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree', metavar='URI')
+    parser_add.add_argument('--fetch', '-f', help='Fetch the specified URI and extract it to create the source tree (deprecated - pass as positional argument instead)', metavar='URI')
     parser_add.add_argument('--version', '-V', help='Version to use within recipe (PV)')
-    parser_add.add_argument('--no-git', '-g', help='If -f/--fetch is specified, do not set up source tree as a git repository', action="store_true")
+    parser_add.add_argument('--no-git', '-g', help='If fetching source, do not set up source tree as a git repository', action="store_true")
     parser_add.add_argument('--binary', '-b', help='Treat the source tree as something that should be installed verbatim (no compilation, same directory structure). Useful with binary packages e.g. RPMs.', action='store_true')
     parser_add.set_defaults(func=add)
 
-- 
2.5.0


