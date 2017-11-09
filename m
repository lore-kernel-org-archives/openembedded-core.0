Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id A138D78527
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:36 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171401044"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:10 +1300
Message-Id: <18de4c3e2011d97316586d2bf0c37a972b8bf6e1.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1510192329.git.paul.eggleton@linux.intel.com>
References: <cover.1510192329.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/24] devtool: show some warnings for upgrade versions
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:36 -0000

* Show a warning in devtool upgrade if the version is less than the
  current version suggesting that the user may need to bump PE in the
  recipe
* Show a warning in devtool add and devtool upgrade if the version looks
  like a pre-release version suggesting using a version number that
  won't mess up the progression when you come to upgrade to the final
  release version.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 13 +++++++++++++
 scripts/lib/devtool/standard.py |  4 +++-
 scripts/lib/devtool/upgrade.py  |  9 +++++++--
 3 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 94e3d7d..20ab83f 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -337,3 +337,16 @@ def update_unlockedsigs(basepath, workspace, fixed_setup, extra=None):
             for pn in newunlocked:
                 f.write('    ' + pn)
             f.write('"')
+
+def check_prerelease_version(ver, operation):
+    if 'pre' in ver or 'rc' in ver:
+        logger.warning('Version "%s" looks like a pre-release version. '
+                       'If that is the case, in order to ensure that the '
+                       'version doesn\'t appear to go backwards when you '
+                       'later upgrade to the final release version, it is '
+                       'recommmended that instead you use '
+                       '<current version>+<pre-release version> e.g. if '
+                       'upgrading from 1.9 to 2.0-rc2 use "1.9+2.0-rc2". '
+                       'If you prefer not to reset and re-try, you can change '
+                       'the version after %s succeeds using "devtool rename" '
+                       'with -V/--version.' % (ver, operation))
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8e4c7f7..b6e532b 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -30,7 +30,7 @@ import errno
 import glob
 import filecmp
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, update_unlockedsigs, check_prerelease_version, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -298,6 +298,8 @@ def add(args, config, basepath, workspace):
 
         _add_md5(config, recipename, appendfile)
 
+        check_prerelease_version(rd.getVar('PV'), 'devtool add')
+
         logger.info('Recipe %s has been automatically created; further editing may be required to make it fully functional' % recipefile)
 
     finally:
diff --git a/scripts/lib/devtool/upgrade.py b/scripts/lib/devtool/upgrade.py
index 441dd35..ab7acd1 100644
--- a/scripts/lib/devtool/upgrade.py
+++ b/scripts/lib/devtool/upgrade.py
@@ -33,7 +33,7 @@ sys.path = sys.path + [devtool_path]
 
 import oe.recipeutils
 from devtool import standard
-from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe, use_external_build, update_unlockedsigs
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError, parse_recipe, use_external_build, update_unlockedsigs, check_prerelease_version
 
 logger = logging.getLogger('devtool')
 
@@ -420,8 +420,13 @@ def upgrade(args, config, basepath, workspace):
             old_srcrev = None
         if old_srcrev and not args.srcrev:
             raise DevtoolError("Recipe specifies a SRCREV value; you must specify a new one when upgrading")
-        if rd.getVar('PV') == args.version and old_srcrev == args.srcrev:
+        old_ver = rd.getVar('PV')
+        if old_ver == args.version and old_srcrev == args.srcrev:
             raise DevtoolError("Current and upgrade versions are the same version")
+        if args.version:
+            if bb.utils.vercmp_string(args.version, old_ver) < 0:
+                logger.warning('Upgrade version %s compares as less than the current version %s. If you are using a package feed for on-target upgrades or providing this recipe for general consumption, then you should increment PE in the recipe (or if there is no current PE value set, set it to "1")' % (args.version, old_ver))
+            check_prerelease_version(args.version, 'devtool upgrade')
 
         rf = None
         try:
-- 
2.9.5


