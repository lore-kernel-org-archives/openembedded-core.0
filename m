Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id BC68E771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:50 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567477"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:51 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:05 -0600
Message-Id: <cba9c0db89b510e7af38e5330bff6f4db34c8786.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 34/55] oeqa/runtime: Add case, context and loader classes for runtime testing
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:51 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds OERuntimeTestCase, OERuntimeTestContext, and OERuntimeTestLoader
to be used for runtime testing.

As expected there are some changes in runtime context:

- Adds the target to be used for runtime testing, the default
is a SSH connection to the device under test running a OE image.
- Runtime context requires image manifest because several
tests are skipped if a package is missing or installed.
- Several tests require the output of the ps command and it changes
its output and arguments if busybox o procps is installed, so the
case must use the correct ps command.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/case.py    |  8 +++++
 meta/lib/oeqa/runtime/context.py | 69 ++++++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/runtime/loader.py  | 16 ++++++++++
 3 files changed, 93 insertions(+)
 create mode 100644 meta/lib/oeqa/runtime/case.py
 create mode 100644 meta/lib/oeqa/runtime/context.py
 create mode 100644 meta/lib/oeqa/runtime/loader.py

diff --git a/meta/lib/oeqa/runtime/case.py b/meta/lib/oeqa/runtime/case.py
new file mode 100644
index 0000000..43f1b2f
--- /dev/null
+++ b/meta/lib/oeqa/runtime/case.py
@@ -0,0 +1,8 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.case import OETestCase
+
+class OERuntimeTestCase(OETestCase):
+    # target instance set by OERuntimeTestLoader.
+    target = None
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
new file mode 100644
index 0000000..496730d
--- /dev/null
+++ b/meta/lib/oeqa/runtime/context.py
@@ -0,0 +1,69 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import os
+
+from oeqa.core.context import OETestContext, OETestContextExecutor
+from oeqa.core.target.ssh import OESSHTarget
+from oeqa.runtime.loader import OERuntimeTestLoader
+
+class OERuntimeTestContext(OETestContext):
+    loaderClass = OERuntimeTestLoader
+
+    def __init__(self, td, logger, target, packages_manifest):
+        super(OERuntimeTestContext, self).__init__(td, logger)
+        self.target = target
+        self.image_packages = self.readPackagesManifest(packages_manifest)
+        self._set_target_cmds()
+
+    def _set_target_cmds(self):
+        self.target_cmds = {}
+
+        self.target_cmds['ps'] = 'ps'
+        if 'procps' in self.image_packages:
+            self.target_cmds['ps'] = self.target_cmds['ps'] + ' -ef'
+
+    def readPackagesManifest(self, manifest):
+        if not os.path.exists(manifest):
+            raise OSError("Couldn't find manifest file: %s" % manifest)
+
+        image_packages = set()
+        with open(manifest, 'r') as f:
+            for line in f.readlines():
+                line = line.strip()
+                if line and not line.startswith("#"):
+                    image_packages.add(line.split()[0])
+
+        return image_packages
+
+class OERuntimeTestContextExecutor(OETestContextExecutor):
+    _context_class = OERuntimeTestContext
+
+    name = 'runtime'
+    help = 'runtime test component'
+    description = 'executes runtime tests over targets'
+    default_cases = os.path.join(os.path.abspath(os.path.dirname(__file__)),
+            'cases')
+    default_target_ip = '192.168.7.2'
+
+    def register_commands(self, logger, subparsers):
+        super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
+        self.parser.add_argument('--target-ip', action='store',
+                default=self.default_target_ip,
+                help="IP address of device under test, default: %s" \
+                % self.default_target_ip)
+        self.parser.add_argument('--packages-manifest', action='store',
+                help="Package manifest of the image under test")
+
+    def _process_args(self, logger, args):
+        if not args.packages_manifest:
+            raise TypeError('Manifest file not provided')
+
+        super(OERuntimeTestContextExecutor, self)._process_args(logger, args)
+        target = OESSHTarget(args.target_ip)
+        self.tc_kwargs['init']['target'] = target
+
+        packages_manifest = os.path.join(os.getcwd(), args.packages_manifest)
+        self.tc_kwargs['init']['packages_manifest'] = packages_manifest
+
+_executor_class = OERuntimeTestContextExecutor
diff --git a/meta/lib/oeqa/runtime/loader.py b/meta/lib/oeqa/runtime/loader.py
new file mode 100644
index 0000000..041ef97
--- /dev/null
+++ b/meta/lib/oeqa/runtime/loader.py
@@ -0,0 +1,16 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.loader import OETestLoader
+from oeqa.runtime.case import OERuntimeTestCase
+
+class OERuntimeTestLoader(OETestLoader):
+    caseClass = OERuntimeTestCase
+
+    def _getTestCase(self, testCaseClass, tcName):
+        case = super(OERuntimeTestLoader, self)._getTestCase(testCaseClass, tcName)
+
+        # Adds custom attributes to the OERuntimeTestCase
+        setattr(case, 'target', self.tc.target)
+
+        return case
-- 
2.1.4


