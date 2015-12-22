Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id ED619731AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 04:04:48 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 21 Dec 2015 20:04:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,462,1444719600"; d="scan'208";a="621979085"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.148.44])
	by FMSMGA003.fm.intel.com with ESMTP; 21 Dec 2015 20:04:46 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 17:03:06 +1300
Message-Id: <01f1082e51d20b3033f45847592247fddb3c37ea.1450756555.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1450756555.git.paul.eggleton@linux.intel.com>
References: <cover.1450756555.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 13/26] devtool: split out function for naming bbappend
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
X-List-Received-Date: Tue, 22 Dec 2015 04:04:49 -0000

We're repeating this in a couple of places, so we might as well have a
function to do it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/__init__.py | 15 +++++++++++++++
 scripts/lib/devtool/standard.py | 18 +++++-------------
 2 files changed, 20 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index e617d60..7f16e17 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -22,6 +22,7 @@ import os
 import sys
 import subprocess
 import logging
+import re
 
 logger = logging.getLogger('devtool')
 
@@ -199,3 +200,17 @@ def setup_git_repo(repodir, version, devbranch, basetag='devtool-base'):
 
     bb.process.run('git checkout -b %s' % devbranch, cwd=repodir)
     bb.process.run('git tag -f %s' % basetag, cwd=repodir)
+
+def recipe_to_append(recipefile, config, wildcard=False):
+    """
+    Convert a recipe file to a bbappend file path within the workspace.
+    NOTE: if the bbappend already exists, you should be using
+    workspace[args.recipename]['bbappend'] instead of calling this
+    function.
+    """
+    appendname = os.path.splitext(os.path.basename(recipefile))[0]
+    if wildcard:
+        appendname = re.sub(r'_.*', '_%', appendname)
+    appendpath = os.path.join(config.workspace_path, 'appends')
+    appendfile = os.path.join(appendpath, appendname + '.bbappend')
+    return appendfile
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 57175a4..0103d93 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -26,7 +26,7 @@ import argparse
 import scriptutils
 import errno
 from collections import OrderedDict
-from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, DevtoolError
+from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, use_external_build, setup_git_repo, recipe_to_append, DevtoolError
 from devtool import parse_recipe
 
 logger = logging.getLogger('devtool')
@@ -64,10 +64,6 @@ def add(args, config, basepath, workspace):
         raise DevtoolError("Specified source tree %s could not be found" %
                            srctree)
 
-    appendpath = os.path.join(config.workspace_path, 'appends')
-    if not os.path.exists(appendpath):
-        os.makedirs(appendpath)
-
     recipedir = os.path.join(config.workspace_path, 'recipes', args.recipename)
     bb.utils.mkdirhier(recipedir)
     rfv = None
@@ -121,7 +117,8 @@ def add(args, config, basepath, workspace):
     if not rd:
         return 1
 
-    appendfile = os.path.join(appendpath, '%s.bbappend' % bp)
+    appendfile = recipe_to_append(recipefile, config)
+    bb.utils.mkdirhier(os.path.dirname(appendfile))
     with open(appendfile, 'w') as f:
         f.write('inherit externalsrc\n')
         f.write('EXTERNALSRC = "%s"\n' % srctree)
@@ -584,11 +581,7 @@ def modify(args, config, basepath, workspace):
                            pn)
 
     recipefile = rd.getVar('FILE', True)
-    appendname = os.path.splitext(os.path.basename(recipefile))[0]
-    if args.wildcard:
-        appendname = re.sub(r'_.*', '_%', appendname)
-    appendpath = os.path.join(config.workspace_path, 'appends')
-    appendfile = os.path.join(appendpath, appendname + '.bbappend')
+    appendfile = recipe_to_append(recipefile, config, args.wildcard)
     if os.path.exists(appendfile):
         raise DevtoolError("Another variant of recipe %s is already in your "
                            "workspace (only one variant of a recipe can "
@@ -632,8 +625,7 @@ def modify(args, config, basepath, workspace):
         srcsubdir = os.path.relpath(s, workdir).split(os.sep, 1)[1]
         srctree = os.path.join(srctree, srcsubdir)
 
-    if not os.path.exists(appendpath):
-        os.makedirs(appendpath)
+    bb.utils.mkdirhier(os.path.dirname(appendfile))
     with open(appendfile, 'w') as f:
         f.write('FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"\n')
         # Local files can be modified/tracked in separate subdir under srctree
-- 
2.5.0


