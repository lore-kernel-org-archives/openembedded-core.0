Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9911077156
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773694"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:37 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:50 +1300
Message-Id: <cfbd0681fff33450f3fc8c1e6f94aca767e38bb9.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 02/14] devtool / recipetool: use common code for launching editor
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:39 -0000

Looking at Chris Larson's code for starting the user's editor for
"recipetool newappend" it was slightly better than what I wrote for
"devtool edit-recipe" in that it checks VISUAL as well as EDITOR and
defaults to vi if neither are set, so break this out to its own function
and call it from both places. The broken out version passes shell=True
however in case it's a more complicated command rather than just a name
of an executable.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/utilcmds.py     | 13 ++-----------
 scripts/lib/recipetool/newappend.py |  8 ++------
 scripts/lib/scriptutils.py          | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 17 deletions(-)

diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index a8f5e97..18eddb7 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -24,6 +24,7 @@ import tempfile
 import logging
 import argparse
 import subprocess
+import scriptutils
 from devtool import exec_build_env_command, setup_tinfoil, check_workspace_recipe, DevtoolError
 from devtool import parse_recipe
 
@@ -48,17 +49,7 @@ def edit_recipe(args, config, basepath, workspace):
             raise DevtoolError("Recipe file for %s is not under the workspace" %
                                args.recipename)
 
-    editor = os.environ.get('EDITOR', None)
-    if not editor:
-        raise DevtoolError("EDITOR environment variable not set")
-
-    import subprocess
-    try:
-        subprocess.check_call('%s "%s"' % (editor, recipefile), shell=True)
-    except subprocess.CalledProcessError as e:
-        return e.returncode
-
-    return 0
+    return scriptutils.run_editor(recipefile)
 
 
 def configure_help(args, config, basepath, workspace):
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 5625a8e..bdf0693 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -27,6 +27,7 @@ import os
 import re
 import subprocess
 import sys
+import scriptutils
 
 
 logger = logging.getLogger('recipetool')
@@ -96,12 +97,7 @@ def newappend(args):
             return 1
 
     if args.edit:
-        editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
-        try:
-            return subprocess.check_call([editor, append_path, recipe_path])
-        except OSError as exc:
-            logger.error("Execution of editor '%s' failed: %s", editor, exc)
-            return 1
+        return scriptutils.run_editor([append_path, recipe_path])
     else:
         print(append_path)
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 69e76d8..aef19d3 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -20,6 +20,7 @@ import os
 import logging
 import glob
 import argparse
+import subprocess
 
 def logger_create(name):
     logger = logging.getLogger(name)
@@ -101,3 +102,17 @@ def fetch_uri(d, uri, destdir, srcrev=None):
         os.chdir(olddir)
     return ret
 
+def run_editor(fn):
+    if isinstance(fn, basestring):
+        params = '"%s"' % fn
+    else:
+        params = ''
+        for fnitem in fn:
+            params += ' "%s"' % fnitem
+
+    editor = os.getenv('VISUAL', os.getenv('EDITOR', 'vi'))
+    try:
+        return subprocess.check_call('%s %s' % (editor, params), shell=True)
+    except OSError as exc:
+        logger.error("Execution of editor '%s' failed: %s", editor, exc)
+        return 1
-- 
2.5.0


