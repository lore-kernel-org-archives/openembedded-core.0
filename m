Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id DD1BE76FFA
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:12 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520262"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:56 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:23 +0100
Message-Id: <5a493aecb300e724f6454642e97b60e5a5c397b3.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 09/27] scripts/contrib: add devtool stress tester
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:13 -0000

Add a script to run "devtool modify" followed by a build on every target
recipe in the environment (with the option to skip/resume from/only
include specific recipes). This takes far too long to run as an
oe-selftest test but is still something that is useful to be able to
run. There's also a slightly quicker mode that just runs "devtool
extract" on each recipe.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/contrib/devtool-stress.py | 241 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 241 insertions(+)
 create mode 100755 scripts/contrib/devtool-stress.py

diff --git a/scripts/contrib/devtool-stress.py b/scripts/contrib/devtool-stress.py
new file mode 100755
index 0000000..4b35fc9
--- /dev/null
+++ b/scripts/contrib/devtool-stress.py
@@ -0,0 +1,241 @@
+#!/usr/bin/env python
+
+# devtool stress tester
+#
+# Written by: Paul Eggleton <paul.eggleton@linux.intel.com>
+#
+# Copyright 2015 Intel Corporation
+#
+# This program is free software; you can redistribute it and/or modify
+# it under the terms of the GNU General Public License version 2 as
+# published by the Free Software Foundation.
+#
+# This program is distributed in the hope that it will be useful,
+# but WITHOUT ANY WARRANTY; without even the implied warranty of
+# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+# GNU General Public License for more details.
+#
+# You should have received a copy of the GNU General Public License along
+# with this program; if not, write to the Free Software Foundation, Inc.,
+# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+#
+
+import sys
+import os
+import os.path
+import subprocess
+import re
+import argparse
+import logging
+import tempfile
+import shutil
+import signal
+import fnmatch
+
+scripts_lib_path = os.path.abspath(os.path.join(os.path.dirname(os.path.realpath(__file__)), '..', 'lib'))
+sys.path.insert(0, scripts_lib_path)
+import scriptutils
+logger = scriptutils.logger_create('devtool-stress')
+
+def select_recipes(args):
+    import bb.tinfoil
+    tinfoil = bb.tinfoil.Tinfoil()
+    tinfoil.prepare(False)
+
+    pkg_pn = tinfoil.cooker.recipecache.pkg_pn
+    (latest_versions, preferred_versions) = bb.providers.findProviders(tinfoil.config_data, tinfoil.cooker.recipecache, pkg_pn)
+
+    skip_classes = args.skip_classes.split(',')
+
+    recipelist = []
+    for pn in sorted(pkg_pn):
+        pref = preferred_versions[pn]
+        inherits = [os.path.splitext(os.path.basename(f))[0] for f in tinfoil.cooker.recipecache.inherits[pref[1]]]
+        for cls in skip_classes:
+            if cls in inherits:
+                break
+        else:
+            recipelist.append(pn)
+
+    tinfoil.shutdown()
+
+    resume_from = args.resume_from
+    if resume_from:
+        if not resume_from in recipelist:
+            print('%s is not a testable recipe' % resume_from)
+            return 1
+    if args.only:
+        only = args.only.split(',')
+        for onlyitem in only:
+            for pn in recipelist:
+                if fnmatch.fnmatch(pn, onlyitem):
+                    break
+            else:
+                print('%s does not match any testable recipe' % onlyitem)
+                return 1
+    else:
+        only = None
+    if args.skip:
+        skip = args.skip.split(',')
+    else:
+        skip = []
+
+    recipes = []
+    for pn in recipelist:
+        if resume_from:
+            if pn == resume_from:
+                resume_from = None
+            else:
+                continue
+
+        if args.only:
+            for item in only:
+                if fnmatch.fnmatch(pn, item):
+                    break
+            else:
+                continue
+
+        skipit = False
+        for item in skip:
+            if fnmatch.fnmatch(pn, item):
+                skipit = True
+        if skipit:
+            continue
+
+        recipes.append(pn)
+
+    return recipes
+
+
+def stress_extract(args):
+    import bb.process
+
+    recipes = select_recipes(args)
+
+    failures = 0
+    tmpdir = tempfile.mkdtemp()
+    os.setpgrp()
+    try:
+        for pn in recipes:
+            sys.stdout.write('Testing %s ' % (pn + ' ').ljust(40, '.'))
+            sys.stdout.flush()
+            failed = False
+
+            srctree = os.path.join(tmpdir, pn)
+            try:
+                bb.process.run('devtool extract %s %s' % (pn, srctree))
+            except bb.process.CmdError as exc:
+                failed = True
+                with open('stress_%s_extract.log' % pn, 'w') as f:
+                    f.write(str(exc))
+
+            if os.path.exists(srctree):
+                shutil.rmtree(srctree)
+
+            if failed:
+                print('failed')
+                failures += 1
+            else:
+                print('ok')
+    except KeyboardInterrupt:
+        # We want any child processes killed. This is crude, but effective.
+        os.killpg(0, signal.SIGTERM)
+
+    if failures:
+        return 1
+    else:
+        return 0
+
+
+def stress_modify(args):
+    import bb.process
+
+    recipes = select_recipes(args)
+
+    failures = 0
+    tmpdir = tempfile.mkdtemp()
+    os.setpgrp()
+    try:
+        for pn in recipes:
+            sys.stdout.write('Testing %s ' % (pn + ' ').ljust(40, '.'))
+            sys.stdout.flush()
+            failed = False
+            reset = True
+
+            srctree = os.path.join(tmpdir, pn)
+            try:
+                bb.process.run('devtool modify -x %s %s' % (pn, srctree))
+            except bb.process.CmdError as exc:
+                with open('stress_%s_modify.log' % pn, 'w') as f:
+                    f.write(str(exc))
+                failed = 'modify'
+                reset = False
+
+            if not failed:
+                try:
+                    bb.process.run('bitbake -c install %s' % pn)
+                except bb.process.CmdError as exc:
+                    with open('stress_%s_install.log' % pn, 'w') as f:
+                        f.write(str(exc))
+                    failed = 'build'
+            if reset:
+                try:
+                    bb.process.run('devtool reset %s' % pn)
+                except bb.process.CmdError as exc:
+                    print('devtool reset failed: %s' % str(exc))
+                    break
+
+            if os.path.exists(srctree):
+                shutil.rmtree(srctree)
+
+            if failed:
+                print('failed (%s)' % failed)
+                failures += 1
+            else:
+                print('ok')
+    except KeyboardInterrupt:
+        # We want any child processes killed. This is crude, but effective.
+        os.killpg(0, signal.SIGTERM)
+
+    if failures:
+        return 1
+    else:
+        return 0
+
+
+def main():
+    parser = argparse.ArgumentParser(description="devtool stress tester",
+                                     epilog="Use %(prog)s <subcommand> --help to get help on a specific command")
+    parser.add_argument('-d', '--debug', help='Enable debug output', action='store_true')
+    parser.add_argument('-r', '--resume-from', help='Resume from specified recipe', metavar='PN')
+    parser.add_argument('-o', '--only', help='Only test specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST')
+    parser.add_argument('-s', '--skip', help='Skip specified recipes (comma-separated without spaces, wildcards allowed)', metavar='PNLIST')
+    parser.add_argument('-c', '--skip-classes', help='Skip recipes inheriting specified classes (comma-separated) - default %(default)s', metavar='CLASSLIST', default='native,nativesdk,cross,cross-canadian,image,populate_sdk,meta,packagegroup')
+    subparsers = parser.add_subparsers(title='subcommands', metavar='<subcommand>')
+
+    parser_modify = subparsers.add_parser('modify',
+                                          help='Run "devtool modify" followed by a build with bitbake on matching recipes',
+                                          description='Runs "devtool modify" followed by a build with bitbake on matching recipes')
+    parser_modify.set_defaults(func=stress_modify)
+
+    parser_extract = subparsers.add_parser('extract',
+                                           help='Run "devtool extract" on matching recipes',
+                                           description='Runs "devtool extract" on matching recipes')
+    parser_extract.set_defaults(func=stress_extract)
+
+    args = parser.parse_args()
+
+    if args.debug:
+        logger.setLevel(logging.DEBUG)
+
+    import scriptpath
+    bitbakepath = scriptpath.add_bitbake_lib_path()
+    if not bitbakepath:
+        logger.error("Unable to find bitbake by searching parent directory of this script or PATH")
+        return 1
+    logger.debug('Found bitbake path: %s' % bitbakepath)
+
+    ret = args.func(args)
+
+if __name__ == "__main__":
+    main()
-- 
2.1.0


