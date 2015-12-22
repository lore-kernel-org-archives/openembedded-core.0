Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 6448F731D3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:05:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:05:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979273"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:05:04 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:12 +1300
Message-Id: <5ab8ba76221b435159122310b9f6311751661671.1450756556.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 19/26] devtool: modify: default source tree path
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
X-List-Received-Date: Tue, 22 Dec 2015 04:05:06 -0000

As per the changes to "devtool add", make the source tree path optional
and use the default path if none is specified.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 |  4 ++++
 scripts/lib/devtool/standard.py | 26 +++++++++++++++-----------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index 93ba58e..bda05e1 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -152,6 +152,10 @@ def _create_workspace(workspacedir, config, basepath):
             f.write('\nIf you no longer need to use devtool you can remove the path to this\n')
             f.write('workspace layer from your conf/bblayers.conf file (and then delete the\n')
             f.write('layer, if you wish).\n')
+            f.write('\nNote that by default, if devtool fetches and unpacks source code, it\n')
+            f.write('will place it in a subdirectory of a "sources" subdirectory of the\n')
+            f.write('layer. If you prefer it to be elsewhere you can specify the source\n')
+            f.write('tree path on the command line.\n')
 
 def _enable_workspace_layer(workspacedir, config, basepath):
     """Ensure the workspace layer is in bblayers.conf"""
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e249661..c710c16 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -644,10 +644,15 @@ def modify(args, config, basepath, workspace):
         raise DevtoolError("recipe %s is already in your workspace" %
                            args.recipename)
 
-    if not args.extract and not os.path.isdir(args.srctree):
+    if args.srctree:
+        srctree = os.path.abspath(args.srctree)
+    else:
+        srctree = get_default_srctree(config, args.recipename)
+
+    if not args.extract and not os.path.isdir(srctree):
         raise DevtoolError("directory %s does not exist or not a directory "
                            "(specify -x to extract source from recipe)" %
-                           args.srctree)
+                           srctree)
     if args.extract:
         tinfoil = _prep_extract_operation(config, basepath, args.recipename)
         if not tinfoil:
@@ -679,29 +684,28 @@ def modify(args, config, basepath, workspace):
 
     initial_rev = None
     commits = []
-    srctree = os.path.abspath(args.srctree)
     if args.extract:
-        initial_rev = _extract_source(args.srctree, False, args.branch, False, rd)
+        initial_rev = _extract_source(srctree, False, args.branch, False, rd)
         if not initial_rev:
             return 1
         logger.info('Source tree extracted to %s' % srctree)
         # Get list of commits since this revision
-        (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=args.srctree)
+        (stdout, _) = bb.process.run('git rev-list --reverse %s..HEAD' % initial_rev, cwd=srctree)
         commits = stdout.split()
     else:
-        if os.path.exists(os.path.join(args.srctree, '.git')):
+        if os.path.exists(os.path.join(srctree, '.git')):
             # Check if it's a tree previously extracted by us
             try:
-                (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=args.srctree)
+                (stdout, _) = bb.process.run('git branch --contains devtool-base', cwd=srctree)
             except bb.process.ExecutionError:
                 stdout = ''
             for line in stdout.splitlines():
                 if line.startswith('*'):
-                    (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=args.srctree)
+                    (stdout, _) = bb.process.run('git rev-parse devtool-base', cwd=srctree)
                     initial_rev = stdout.rstrip()
             if not initial_rev:
                 # Otherwise, just grab the head revision
-                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=args.srctree)
+                (stdout, _) = bb.process.run('git rev-parse HEAD', cwd=srctree)
                 initial_rev = stdout.rstrip()
 
     # Check that recipe isn't using a shared workdir
@@ -1282,9 +1286,9 @@ def register_commands(subparsers, context):
     parser_add.set_defaults(func=add)
 
     parser_modify = subparsers.add_parser('modify', help='Modify the source for an existing recipe',
-                                       description='Enables modifying the source for an existing recipe')
+                                       description='Enables modifying the source for an existing recipe. You can either provide your own pre-prepared source tree, or specify -x/--extract to extract the source being fetched by the recipe.')
     parser_modify.add_argument('recipename', help='Name of existing recipe to edit (just name - no version, path or extension)')
-    parser_modify.add_argument('srctree', help='Path to external source tree')
+    parser_modify.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     parser_modify.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
     parser_modify.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
     group = parser_modify.add_mutually_exclusive_group()
-- 
2.5.0


