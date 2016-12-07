Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id EAC9871B37
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:32 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172570"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:33 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:14 -0600
Message-Id: <d5587d0b3ac150cb6223849716fd44ab41381825.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 09/32] scripts/oe-test: Add new oe-test script
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:33 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new oe-test script will be use to run test components with
one single script.

The oe-test script search for test components inside meta/lib/oeqa,
the test components needs to implement OETestContextExecutor inside
context module in order to be supported by oe-test.

[YOCTO #10230]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 scripts/oe-test | 98 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100755 scripts/oe-test

diff --git a/scripts/oe-test b/scripts/oe-test
new file mode 100755
index 0000000..9222dea
--- /dev/null
+++ b/scripts/oe-test
@@ -0,0 +1,98 @@
+#!/usr/bin/env python3
+
+# OpenEmbedded test tool
+#
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+import sys
+import argparse
+import importlib
+import logging
+
+scripts_path = os.path.dirname(os.path.realpath(__file__))
+lib_path = scripts_path + '/lib'
+sys.path = sys.path + [lib_path]
+import argparse_oe
+import scriptutils
+import scriptpath
+scriptpath.add_oe_lib_path()
+
+from oeqa.core.context import OETestContextExecutor
+
+logger = scriptutils.logger_create('oe-test')
+
+def _load_test_components(logger):
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
+                        components[comp_name] = comp_plugin._executor_class()
+                    except AttributeError:
+                        raise AttributeError("Component %s in %s don't have "\
+                                "_executor_class defined." % (comp_name, comp_context))
+
+    return components
+
+def main():
+    parser = argparse_oe.ArgumentParser(description="OpenEmbedded test tool",
+                                        add_help=False,
+                                        epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-q', '--quiet', help='Print only errors', action='store_true')
+    global_args, unparsed_args = parser.parse_known_args()
+
+    # Help is added here rather than via add_help=True, as we don't want it to
+    # be handled by parse_known_args()
+    parser.add_argument('-h', '--help', action='help', default=argparse.SUPPRESS,
+                        help='show this help message and exit')
+
+    if global_args.debug:
+        logger.setLevel(logging.DEBUG)
+    elif global_args.quiet:
+        logger.setLevel(logging.ERROR)
+
+    components = _load_test_components(logger)
+
+    subparsers = parser.add_subparsers(dest="subparser_name", title='subcommands', metavar='<subcommand>')
+    subparsers.add_subparser_group('components', 'Test components')
+    subparsers.required = True
+    for comp_name in sorted(components.keys()):
+        comp = components[comp_name]
+        comp.register_commands(logger, subparsers)
+
+    try:
+        args = parser.parse_args(unparsed_args, namespace=global_args)
+        ret = args.func(logger, args)
+    except SystemExit as err:
+        if err.code != 0:
+            raise err
+        ret = err.code
+    except argparse_oe.ArgumentUsageError as ae:
+        parser.error_subcommand(ae.message, ae.subcommand)
+
+    return ret
+
+if __name__ == '__main__':
+    try:
+        ret = main()
+    except Exception:
+        ret = 1
+        import traceback
+        traceback.print_exc()
+    sys.exit(ret)
-- 
2.1.4


