Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7C583731A3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Jul 2016 23:08:42 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 10 Jul 2016 16:08:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,343,1464678000"; d="scan'208";a="732288717"
Received: from unknown (HELO peggleto-mobl.ger.corp.intel.com)
	([10.255.164.140])
	by FMSMGA003.fm.intel.com with ESMTP; 10 Jul 2016 16:08:34 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2016 11:07:56 +1200
Message-Id: <dc4b7dcfe2a1a7a9efb20903b5cb9232aedd3716.1468191874.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1468191874.git.paul.eggleton@linux.intel.com>
References: <cover.1468191874.git.paul.eggleton@linux.intel.com>
Subject: [PATCH v2 6/7] devtool: return specific exit code for incompatible recipes
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
X-List-Received-Date: Sun, 10 Jul 2016 23:08:42 -0000

Certain recipes cannot be used with devtool extract / modify / upgrade -
usually because they don't provide any source. Return a specific exit
code (4) so that scripts such as scripts/contrib/devtool-stress.py know
the difference between this and a genuine failure.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/devtool                 |  2 +-
 scripts/lib/devtool/__init__.py |  5 +++--
 scripts/lib/devtool/standard.py | 16 +++++++++-------
 3 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/scripts/devtool b/scripts/devtool
index a93a11f..b1274d6 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -334,7 +334,7 @@ def main():
     except DevtoolError as err:
         if str(err):
             logger.error(str(err))
-        ret = 1
+        ret = err.exitcode
     except argparse_oe.ArgumentUsageError as ae:
         parser.error_subcommand(ae.message, ae.subcommand)
 
diff --git a/scripts/lib/devtool/__init__.py b/scripts/lib/devtool/__init__.py
index 77b1fd9..65eb452 100644
--- a/scripts/lib/devtool/__init__.py
+++ b/scripts/lib/devtool/__init__.py
@@ -26,10 +26,11 @@ import re
 
 logger = logging.getLogger('devtool')
 
-
 class DevtoolError(Exception):
     """Exception for handling devtool errors"""
-    pass
+    def __init__(self, message, exitcode=1):
+        super(DevtoolError, self).__init__(message)
+        self.exitcode = exitcode
 
 
 def exec_build_env_command(init_path, builddir, cmd, watch=False, **options):
diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index 8236dd5..f2ba699 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -268,28 +268,30 @@ def _check_compatible_recipe(pn, d):
     """Check if the recipe is supported by devtool"""
     if pn == 'perf':
         raise DevtoolError("The perf recipe does not actually check out "
-                           "source and thus cannot be supported by this tool")
+                           "source and thus cannot be supported by this tool",
+                           4)
 
     if pn in ['kernel-devsrc', 'package-index'] or pn.startswith('gcc-source'):
-        raise DevtoolError("The %s recipe is not supported by this tool" % pn)
+        raise DevtoolError("The %s recipe is not supported by this tool" % pn, 4)
 
     if bb.data.inherits_class('image', d):
         raise DevtoolError("The %s recipe is an image, and therefore is not "
-                           "supported by this tool" % pn)
+                           "supported by this tool" % pn, 4)
 
     if bb.data.inherits_class('populate_sdk', d):
         raise DevtoolError("The %s recipe is an SDK, and therefore is not "
-                           "supported by this tool" % pn)
+                           "supported by this tool" % pn, 4)
 
     if bb.data.inherits_class('packagegroup', d):
         raise DevtoolError("The %s recipe is a packagegroup, and therefore is "
-                           "not supported by this tool" % pn)
+                           "not supported by this tool" % pn, 4)
 
     if bb.data.inherits_class('meta', d):
         raise DevtoolError("The %s recipe is a meta-recipe, and therefore is "
-                           "not supported by this tool" % pn)
+                           "not supported by this tool" % pn, 4)
 
     if bb.data.inherits_class('externalsrc', d) and d.getVar('EXTERNALSRC', True):
+        # Not an incompatibility error per se, so we don't pass the error code
         raise DevtoolError("externalsrc is currently enabled for the %s "
                            "recipe. This prevents the normal do_patch task "
                            "from working. You will need to disable this "
@@ -502,7 +504,7 @@ def _extract_source(srctree, keep_temp, devbranch, sync, d):
 
         if 'noexec' in (d.getVarFlags('do_unpack', False) or []):
             raise DevtoolError("The %s recipe has do_unpack disabled, unable to "
-                               "extract source" % pn)
+                               "extract source" % pn, 4)
 
     if not sync:
         # Prepare for shutil.move later on
-- 
2.5.5


