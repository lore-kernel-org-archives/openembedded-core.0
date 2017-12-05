Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 685EF786F8
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 12:57:26 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2017 04:57:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,364,1508828400"; d="scan'208";a="1252100005"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2017 04:57:27 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:57:46 +0200
Message-Id: <7e354f162f9550d96c0fba7b33f22be043a413fb.1512478515.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
In-Reply-To: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
References: <cover.1512478515.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 12/13] devtool: provide useful defaults for version/commit when upgrading recipes
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
X-List-Received-Date: Tue, 05 Dec 2017 12:57:26 -0000

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


