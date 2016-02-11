Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5ADCC6612D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Feb 2016 01:15:23 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 10 Feb 2016 17:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,428,1449561600"; d="scan'208";a="900462042"
Received: from pngang-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.182.110])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2016 17:15:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Feb 2016 14:13:31 +1300
Message-Id: <98d5fda526adb77759ccce110f1d556b37b060df.1455151881.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455151881.git.paul.eggleton@linux.intel.com>
References: <cover.1455151881.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/11] devtool: modify: make -x the default behaviour
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
X-List-Received-Date: Thu, 11 Feb 2016 01:15:23 -0000

It's going to be more common for users not to have the prepared source
tree for a recipe already, so the default behaviour ought to be to
extract it for them from the recipe. Change the default to extract
(effectively making the -x option a no-op) and add a --no-extract/-n
option to disable it. Later we can look at trying to be smart and
reusing an existing source tree instead of erroring out if it exists;
for now this is just the default reversal.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/devtool.py |  3 ++-
 scripts/lib/devtool/standard.py   | 14 ++++++++------
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/selftest/devtool.py b/meta/lib/oeqa/selftest/devtool.py
index d95cb08..345cabb 100644
--- a/meta/lib/oeqa/selftest/devtool.py
+++ b/meta/lib/oeqa/selftest/devtool.py
@@ -570,7 +570,8 @@ class DevtoolTests(DevtoolBase):
         self.track_for_cleanup(self.workspacedir)
         self.add_command_to_tearDown('bitbake-layers remove-layer */workspace')
         # (don't bother with cleaning the recipe on teardown, we won't be building it)
-        result = runCmd('devtool modify %s -x %s' % (testrecipe, tempdir))
+        # We don't use -x here so that we test the behaviour of devtool modify without it
+        result = runCmd('devtool modify %s %s' % (testrecipe, tempdir))
         # Check git repo
         self._check_src_repo(tempdir)
         # Add a couple of commits
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 262ba09..f1b2e12 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -685,11 +685,11 @@ def modify(args, config, basepath, workspace):
     else:
         srctree = get_default_srctree(config, args.recipename)
 
-    if not args.extract and not os.path.isdir(srctree):
-        raise DevtoolError("directory %s does not exist or not a directory "
-                           "(specify -x to extract source from recipe)" %
+    if args.no_extract and not os.path.isdir(srctree):
+        raise DevtoolError("--no-extract specified and source path %s does "
+                           "not exist or is not a directory" %
                            srctree)
-    if args.extract:
+    if not args.no_extract:
         tinfoil = _prep_extract_operation(config, basepath, args.recipename)
         if not tinfoil:
             # Error already shown
@@ -720,7 +720,7 @@ def modify(args, config, basepath, workspace):
 
     initial_rev = None
     commits = []
-    if args.extract:
+    if not args.no_extract:
         initial_rev = _extract_source(srctree, False, args.branch, False, rd)
         if not initial_rev:
             return 1
@@ -1319,7 +1319,9 @@ def register_commands(subparsers, context):
     parser_modify.add_argument('recipename', help='Name of existing recipe to edit (just name - no version, path or extension)')
     parser_modify.add_argument('srctree', nargs='?', help='Path to external source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
     parser_modify.add_argument('--wildcard', '-w', action="store_true", help='Use wildcard for unversioned bbappend')
-    parser_modify.add_argument('--extract', '-x', action="store_true", help='Extract source as well')
+    group = parser_modify.add_mutually_exclusive_group()
+    group.add_argument('--extract', '-x', action="store_true", help='Extract source for recipe (default)')
+    group.add_argument('--no-extract', '-n', action="store_true", help='Do not extract source, expect it to exist')
     group = parser_modify.add_mutually_exclusive_group()
     group.add_argument('--same-dir', '-s', help='Build in same directory as source', action="store_true")
     group.add_argument('--no-same-dir', help='Force build in a separate build directory', action="store_true")
-- 
2.5.0


