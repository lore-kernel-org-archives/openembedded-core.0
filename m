Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 80E637833C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887896"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:01 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:54 -0500
Message-Id: <72bdc61a21d94d05195b8e87c0405967a568cb93.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 28/36] scripts/oe-test: Move load_test_components to oeqa.utils
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
X-List-Received-Date: Fri, 26 May 2017 20:39:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In order to maintain compatibility with oe-selftest, the
load_test_components needs to be re-used, so the script
executor needs to pass to only load components supported
by certain script (oe-test, oe-selftest).

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/context.py   |  1 +
 meta/lib/oeqa/utils/__init__.py | 37 ++++++++++++++++++++++++++++++++++++-
 scripts/oe-test                 | 31 ++-----------------------------
 3 files changed, 39 insertions(+), 30 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index 5f399fd..0dbf5c3 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -65,6 +65,7 @@ class OETestContext(object):
 
 class OETestContextExecutor(object):
     _context_class = OETestContext
+    _script_executor = 'oe-test'
 
     name = 'core'
     help = 'core test component example'
diff --git a/meta/lib/oeqa/utils/__init__.py b/meta/lib/oeqa/utils/__init__.py
index 485de03..d38a323 100644
--- a/meta/lib/oeqa/utils/__init__.py
+++ b/meta/lib/oeqa/utils/__init__.py
@@ -2,7 +2,6 @@
 from pkgutil import extend_path
 __path__ = extend_path(__path__, __name__)
 
-
 # Borrowed from CalledProcessError
 
 class CommandError(Exception):
@@ -66,3 +65,39 @@ def make_logger_bitbake_compatible(logger):
     logger.info = _bitbake_log_info
 
     return logger
+
+def load_test_components(logger, executor):
+    import sys
+    import os
+    import importlib
+
+    from oeqa.core.context import OETestContextExecutor
+
+    components = {}
+
+    for path in sys.path:
+        base_dir = os.path.join(path, 'oeqa')
+        if os.path.exists(base_dir) and os.path.isdir(base_dir):
+            for file in os.listdir(base_dir):
+                comp_name = file
+                comp_context = os.path.join(base_dir, file, 'context.py')
+                if os.path.exists(comp_context):
+                    comp_plugin = importlib.import_module('oeqa.%s.%s' % \
+                            (comp_name, 'context'))
+                    try:
+                        if not issubclass(comp_plugin._executor_class,
+                                OETestContextExecutor):
+                            raise TypeError("Component %s in %s, _executor_class "\
+                                "isn't derived from OETestContextExecutor."\
+                                % (comp_name, comp_context))
+
+                        if comp_plugin._executor_class._script_executor \
+                                != executor:
+                            continue
+
+                        components[comp_name] = comp_plugin._executor_class()
+                    except AttributeError:
+                        raise AttributeError("Component %s in %s don't have "\
+                                "_executor_class defined." % (comp_name, comp_context))
+
+    return components
diff --git a/scripts/oe-test b/scripts/oe-test
index f90d85b..0a36b78 100755
--- a/scripts/oe-test
+++ b/scripts/oe-test
@@ -8,7 +8,6 @@
 import os
 import sys
 import argparse
-import importlib
 import logging
 
 scripts_path = os.path.dirname(os.path.realpath(__file__))
@@ -25,37 +24,11 @@ try:
 except ImportError:
     pass
 
-from oeqa.core.context import OETestContextExecutor
+from oeqa.utils import load_test_components
 from oeqa.core.exception import OEQAPreRun
 
 logger = scriptutils.logger_create('oe-test')
 
-def _load_test_components(logger):
-    components = {}
-
-    for path in sys.path:
-        base_dir = os.path.join(path, 'oeqa')
-        if os.path.exists(base_dir) and os.path.isdir(base_dir):
-            for file in os.listdir(base_dir):
-                comp_name = file
-                comp_context = os.path.join(base_dir, file, 'context.py')
-                if os.path.exists(comp_context):
-                    comp_plugin = importlib.import_module('oeqa.%s.%s' % \
-                            (comp_name, 'context'))
-                    try:
-                        if not issubclass(comp_plugin._executor_class,
-                                OETestContextExecutor):
-                            raise TypeError("Component %s in %s, _executor_class "\
-                                "isn't derived from OETestContextExecutor."\
-                                % (comp_name, comp_context))
-
-                        components[comp_name] = comp_plugin._executor_class()
-                    except AttributeError:
-                        raise AttributeError("Component %s in %s don't have "\
-                                "_executor_class defined." % (comp_name, comp_context))
-
-    return components
-
 def main():
     parser = argparse_oe.ArgumentParser(description="OpenEmbedded test tool",
                                         add_help=False,
@@ -74,7 +47,7 @@ def main():
     elif global_args.quiet:
         logger.setLevel(logging.ERROR)
 
-    components = _load_test_components(logger)
+    components = load_test_components(logger, 'oe-test')
 
     subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
     subparsers.add_subparser_group('components', 'Test components')
-- 
2.1.4


