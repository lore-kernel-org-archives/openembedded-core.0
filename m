Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 9A7F0731EF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 11:17:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 06 Jan 2016 03:17:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,528,1444719600"; d="scan'208";a="875594576"
Received: from ngochun1-mobl.ccr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.179])
	by fmsmga001.fm.intel.com with ESMTP; 06 Jan 2016 03:17:06 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 00:15:54 +1300
Message-Id: <040cf3a11638a584c086fd636a5b181821671bfb.1452078721.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1452078721.git.paul.eggleton@linux.intel.com>
References: <cover.1452078721.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/14] devtool: reset: support recipes with BBCLASSEXTEND
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
X-List-Received-Date: Wed, 06 Jan 2016 11:17:07 -0000

If the recipe file itself was created in the workspace, and it uses
BBCLASSEXTEND (e.g. through devtool add --also-native), then we need to
clean the other variants as well.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 24 ++++++++++++++++++++++++
 scripts/lib/devtool/standard.py | 13 +++++++++++--
 2 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 7f16e17..253e4d5 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -214,3 +214,27 @@ def recipe_to_append(recipefile, config, wildcard=False):
     appendpath = os.path.join(config.workspace_path, 'appends')
     appendfile = os.path.join(appendpath, appendname + '.bbappend')
     return appendfile
+
+def get_bbclassextend_targets(recipefile, pn):
+    """
+    Cheap function to get BBCLASSEXTEND and then convert that to the
+    list of targets that would result.
+    """
+    import bb.utils
+
+    values = {}
+    def get_bbclassextend_varfunc(varname, origvalue, op, newlines):
+        values[varname] = origvalue
+        return origvalue, None, 0, True
+    with open(recipefile, 'r') as f:
+        bb.utils.edit_metadata(f, ['BBCLASSEXTEND'], get_bbclassextend_varfunc)
+
+    targets = []
+    bbclassextend = values.get('BBCLASSEXTEND', '').split()
+    if bbclassextend:
+        for variant in bbclassextend:
+            if variant == 'nativesdk':
+                targets.append('%s-%s' % (variant, pn))
+            elif variant in ['native', 'cross', 'crosssdk']:
+                targets.append('%s-%s' % (pn, variant))
+    return targets
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index e26ce5a..5390f51 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -28,7 +28,7 @@ import scriptutils
 import errno
 import glob
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, get_bbclassextend_targets, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -1203,8 +1203,17 @@ def reset(args, config, basepath, workspace):
             logger.info('Cleaning sysroot for recipe %s...' % recipes[0])
         else:
             logger.info('Cleaning sysroot for recipes %s...' % ', '.join(recipes))
+        # If the recipe file itself was created in the workspace, and
+        # it uses BBCLASSEXTEND, then we need to also clean the other
+        # variants
+        targets = []
+        for recipe in recipes:
+            targets.append(recipe)
+            recipefile = workspace[recipe]['recipefile']
+            if recipefile:
+                targets.extend(get_bbclassextend_targets(recipefile, recipe))
         try:
-            exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % ' '.join(recipes))
+            exec_build_env_command(config.init_path, basepath, 'bitbake -c clean %s' % ' '.join(targets))
         except bb.process.ExecutionError as e:
             raise DevtoolError('Command \'%s\' failed, output:\n%s\nIf you '
                                 'wish, you may specify -n/--no-clean to '
-- 
2.5.0


