Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 644787703A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:21 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:22:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520525"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:22:12 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:40 +0100
Message-Id: <35776122600e3f8b83c55806a048f47b005359f3.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1442934838.git.paul.eggleton@linux.intel.com>
References: <cover.1442934838.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 26/27] devtool: add basic means of running runqemu within the extensible SDK
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:21 -0000

We ship the runqemu script and if we build QEMU itself within the
extensible SDK, then it would be nice to be able to run it. This is a
very thin wrapper around runqemu, supplying the machine and image name
so the user doesn't need to. (This subcommand is only available within
the extensible SDK since it only really makes sense there where it is
otherwise hard to run runqemu directly.)

Implements [YOCTO #6657].

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/runqemu.py | 64 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 scripts/lib/devtool/runqemu.py

diff --git a/scripts/lib/devtool/runqemu.py b/scripts/lib/devtool/runqemu.py
new file mode 100644
index 0000000..e7f26ab
--- /dev/null
+++ b/scripts/lib/devtool/runqemu.py
@@ -0,0 +1,64 @@
+# Development tool - runqemu command plugin
+#
+# Copyright (C) 2015 Intel Corporation
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
+
+"""Devtool runqemu plugin"""
+
+import os
+import bb
+import logging
+import argparse
+import glob
+from devtool import exec_build_env_command, setup_tinfoil, DevtoolError
+
+logger = logging.getLogger('devtool')
+
+def runqemu(args, config, basepath, workspace):
+    """Entry point for the devtool 'runqemu' subcommand"""
+
+    tinfoil = setup_tinfoil()
+    machine = tinfoil.config_data.getVar('MACHINE', True)
+    bindir_native = tinfoil.config_data.getVar('STAGING_BINDIR_NATIVE', True)
+    tinfoil.shutdown()
+
+    if not glob.glob(os.path.join(bindir_native, 'qemu-system-*')):
+        raise DevtoolError('QEMU is not available within this SDK')
+
+    imagename = args.imagename
+    if not imagename:
+        sdk_targets = config.get('SDK', 'sdk_targets', '').split()
+        if sdk_targets:
+            imagename = sdk_targets[0]
+    if not imagename:
+        raise DevtoolError('Unable to determine image name to run, please specify one')
+
+    try:
+        exec_build_env_command(config.init_path, basepath, 'runqemu %s %s %s' % (machine, imagename, " ".join(args.args)), watch=True)
+    except bb.process.ExecutionError as e:
+        # We've already seen the output since watch=True, so just ensure we return something to the user
+        return e.exitcode
+
+    return 0
+
+def register_commands(subparsers, context):
+    """Register devtool subcommands from this plugin"""
+    if context.fixed_setup:
+        parser_runqemu = subparsers.add_parser('runqemu', help='Run QEMU on the specified image',
+                                               description='Runs QEMU to boot the specified image')
+        parser_runqemu.add_argument('imagename', help='Name of built image to boot within QEMU', nargs='?')
+        parser_runqemu.add_argument('args', help='Any remaining arguments are passed to the runqemu script (pass --help after imagename to see what these are)',
+                                    nargs=argparse.REMAINDER)
+        parser_runqemu.set_defaults(func=runqemu)
-- 
2.1.0


