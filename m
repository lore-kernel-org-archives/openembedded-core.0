Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2991B7806D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:59:26 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 18:59:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,273,1496127600"; d="scan'208";a="985963848"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2017 18:59:26 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jun 2017 09:59:18 +0800
Message-Id: <1498615159-6719-3-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
References: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
Subject: [PATCH 2/3] scriptutils: pass in logger as parameter
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
X-List-Received-Date: Wed, 28 Jun 2017 01:59:26 -0000

logger was not defined in scriptutils.py based on the
observation in python traceback.

Traceback (most recent call last):
  File "/workdir/poky/scripts/devtool", line 351, in <module>
    ret = main()
  File "/workdir/poky/scripts/devtool", line 338, in main
    ret = args.func(args, config, basepath, workspace)
  File "/workdir/poky/scripts/lib/devtool/utilcmds.py", line 55, in
edit_recipe
    return scriptutils.run_editor(find_recipe(args, config, basepath,
workspace))
  File "/workdir/poky/scripts/lib/scriptutils.py", line 141, in
run_editor
    logger.error("Execution of '%s' failed: %s" % (editor, exc))
NameError: name 'logger' is not defined

We pass in logger as parameter to run_editor() from where it has
been called (devtool/utilcmds.py and recipetool/newappend.py),
which both modules already has logger setup.

Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
---
 scripts/lib/devtool/utilcmds.py     | 2 +-
 scripts/lib/recipetool/newappend.py | 2 +-
 scripts/lib/scriptutils.py          | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/lib/devtool/utilcmds.py b/scripts/lib/devtool/utilcmds.py
index 0437e64..938d88a 100644
--- a/scripts/lib/devtool/utilcmds.py
+++ b/scripts/lib/devtool/utilcmds.py
@@ -49,7 +49,7 @@ def edit_recipe(args, config, basepath, workspace):
             raise DevtoolError("Recipe file for %s is not under the workspace" %
                                args.recipename)
 
-    return scriptutils.run_editor(recipefile)
+    return scriptutils.run_editor(recipefile, logger)
 
 
 def configure_help(args, config, basepath, workspace):
diff --git a/scripts/lib/recipetool/newappend.py b/scripts/lib/recipetool/newappend.py
index 0b63759..decce83 100644
--- a/scripts/lib/recipetool/newappend.py
+++ b/scripts/lib/recipetool/newappend.py
@@ -74,7 +74,7 @@ def newappend(args):
             return 1
 
     if args.edit:
-        return scriptutils.run_editor([append_path, recipe_path])
+        return scriptutils.run_editor([append_path, recipe_path], logger)
     else:
         print(append_path)
 
diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index 2b3f3fc..c2539a3 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -123,7 +123,7 @@ def fetch_uri(d, uri, destdir, srcrev=None):
         shutil.rmtree(tmpworkdir)
     return ret
 
-def run_editor(fn):
+def run_editor(fn, logger=None):
     if isinstance(fn, str):
         params = '"%s"' % fn
     else:
-- 
2.7.4


