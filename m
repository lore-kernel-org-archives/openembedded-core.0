Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 09A7378558
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Nov 2017 15:30:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Nov 2017 07:30:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,441,1505804400"; 
   d="scan'208";a="8699576"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 23 Nov 2017 07:30:25 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Nov 2017 17:30:46 +0200
Message-Id: <20171123153046.16997-2-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <20171123153046.16997-1-alexander.kanavin@linux.intel.com>
References: <20171123153046.16997-1-alexander.kanavin@linux.intel.com>
Subject: [PATCH 2/2] devtool: provide useful defaults for version/commit when upgrading recipes
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
X-List-Received-Date: Thu, 23 Nov 2017 15:30:25 -0000

Specifically, 'devtool upgrade' will use the latest upstream release if available
or latest commit if upstream never makes releases.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 scripts/lib/devtool/upgrade.py | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 445e0642460..28fbdaee357 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -433,8 +433,6 @@ def upgrade(args, config, basepath, workspace):
 
     if args.recipename in workspace:
         raise DevtoolError("recipe %s is already in your workspace" % args.recipename)
-    if not args.version and not args.srcrev:
-        raise DevtoolError("You must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option")
     if args.srcbranch and not args.srcrev:
         raise DevtoolError("If you specify --srcbranch/-B then you must use --srcrev/-S to specify the revision" % args.recipename)
 
@@ -457,6 +455,16 @@ def upgrade(args, config, basepath, workspace):
         else:
             srctree = standard.get_default_srctree(config, pn)
 
+        # try to automatically discover latest version and revision if not provided on command line
+        if not args.version and not args.srcrev:
+            version_info = oe.recipeutils.get_recipe_upstream_version(rd)
+            if version_info['version'] and not version_info['version'].endswith("new-commits-available"):
+                args.version = version_info['version']
+            if version_info['revision']:
+                args.srcrev = version_info['revision']
+        if not args.version and not args.srcrev:
+            raise DevtoolError("Automatic discovery of latest version/revision failed - you must provide a version using the --version/-V option, or for recipes that fetch from an SCM such as git, the --srcrev/-S option.")
+
         standard._check_compatible_recipe(pn, rd)
         old_srcrev = rd.getVar('SRCREV')
         if old_srcrev == 'INVALID':
@@ -528,8 +536,8 @@ def register_commands(subparsers, context):
                                            group='starting')
     parser_upgrade.add_argument('recipename', help='Name of recipe to upgrade (just name - no version, path or extension)')
     parser_upgrade.add_argument('srctree',  nargs='?', help='Path to where to extract the source tree. If not specified, a subdirectory of %s will be used.' % defsrctree)
-    parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV)')
-    parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (required if fetching from an SCM such as git)')
+    parser_upgrade.add_argument('--version', '-V', help='Version to upgrade to (PV). If omitted, latest upstream version will be determined and used, if possible.')
+    parser_upgrade.add_argument('--srcrev', '-S', help='Source revision to upgrade to (useful when fetching from an SCM such as git)')
     parser_upgrade.add_argument('--srcbranch', '-B', help='Branch in source repository containing the revision to use (if fetching from an SCM such as git)')
     parser_upgrade.add_argument('--branch', '-b', default="devtool", help='Name for new development branch to checkout (default "%(default)s")')
     parser_upgrade.add_argument('--no-patch', action="store_true", help='Do not apply patches from the recipe to the new source code')
-- 
2.15.0


