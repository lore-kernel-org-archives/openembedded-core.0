Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 049E1772D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567500"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:55 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:14 -0600
Message-Id: <0646f65301ed3473f744fd51033b41fce13d310c.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 43/55] oeqa/utils/dump: Move get_host_dumper to OERuntimeTestContextExecutor class
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To avoid getVar calls inside a utils module, also moves
get_host_dumper import inside testexport isn't needed.

[YOCTO #10231]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testexport.bbclass  |  1 -
 meta/classes/testimage.bbclass   |  5 +++--
 meta/lib/oeqa/runtime/context.py | 18 +++++++++++++++++-
 meta/lib/oeqa/utils/dump.py      | 11 ++---------
 4 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/meta/classes/testexport.bbclass b/meta/classes/testexport.bbclass
index 00cf24e..5398b3c 100644
--- a/meta/classes/testexport.bbclass
+++ b/meta/classes/testexport.bbclass
@@ -163,7 +163,6 @@ def exportTests(d,tc):
 def testexport_main(d):
     from oeqa.oetest import ExportTestContext
     from oeqa.targetcontrol import get_target_controller
-    from oeqa.utils.dump import get_host_dumper
 
     test_create_extract_dirs(d)
     export_dir = d.getVar("TEST_EXPORT_DIR")
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 6fed408..62ecaef 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -128,8 +128,8 @@ def testimage_main(d):
     import signal
     from oeqa.oetest import ImageTestContext
     from oeqa.targetcontrol import get_target_controller
-    from oeqa.utils.dump import get_host_dumper
     from bb.utils import export_proxies
+    from oeqa.utils.dump import HostDumper
 
     pn = d.getVar("PN")
     bb.utils.mkdirhier(d.getVar("TEST_LOG_DIR"))
@@ -139,7 +139,8 @@ def testimage_main(d):
     export_proxies(d)
 
     # we need the host dumper in test context
-    host_dumper = get_host_dumper(d)
+    host_dumper = HostDumper(d.getVar("testimage_dump_host", True),
+        d.getVar("TESTIMAGE_DUMP_DIR", True))
 
     # the robot dance
     target = get_target_controller(d)
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index ec378bb..ab7caa6 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -5,6 +5,8 @@ import os
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
+from oeqa.utils.dump import HostDumper
+
 from oeqa.runtime.loader import OERuntimeTestLoader
 
 class OERuntimeTestContext(OETestContext):
@@ -12,10 +14,11 @@ class OERuntimeTestContext(OETestContext):
     runtime_files_dir = os.path.join(
                         os.path.dirname(os.path.abspath(__file__)), "files")
 
-    def __init__(self, td, logger, target, image_packages):
+    def __init__(self, td, logger, target, host_dumper, image_packages):
         super(OERuntimeTestContext, self).__init__(td, logger)
         self.target = target
         self.image_packages = image_packages
+        self.host_dumper = host_dumper
         self._set_target_cmds()
 
     def _set_target_cmds(self):
@@ -39,6 +42,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_target_type = 'simpleremote'
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
+    default_host_dumper_dir = '/tmp/oe-saved-tests'
 
     def register_commands(self, logger, subparsers):
         super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
@@ -58,6 +62,11 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 help="IP address of device under test, default: %s" \
                 % self.default_server_ip)
 
+        runtime_group.add_argument('--host-dumper-dir', action='store',
+                default=self.default_host_dumper_dir,
+                help="Directory where host status is dumped, if tests fails, default: %s" \
+                % self.default_host_dumper_dir)
+
         runtime_group.add_argument('--packages-manifest', action='store',
                 help="Package manifest of the image under test")
 
@@ -90,6 +99,10 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         return image_packages
 
+    @staticmethod
+    def getHostDumper(cmds, directory):
+        return HostDumper(cmds, directory)
+
     def _process_args(self, logger, args):
         if not args.packages_manifest:
             raise TypeError('Manifest file not provided')
@@ -98,6 +111,9 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         self.tc_kwargs['init']['target'] = \
                 OERuntimeTestContextExecutor.getTarget(args.target_type)
+        self.tc_kwargs['init']['host_dumper'] = \
+                OERuntimeTestContextExecutor.getHostDumper(None,
+                        args.host_dumper_dir)
         self.tc_kwargs['init']['image_packages'] = \
                 OERuntimeTestContextExecutor.readPackagesManifest(
                         args.packages_manifest)
diff --git a/meta/lib/oeqa/utils/dump.py b/meta/lib/oeqa/utils/dump.py
index 44037a9..5a7edc1 100644
--- a/meta/lib/oeqa/utils/dump.py
+++ b/meta/lib/oeqa/utils/dump.py
@@ -5,12 +5,6 @@ import datetime
 import itertools
 from .commands import runCmd
 
-def get_host_dumper(d):
-    cmds = d.getVar("testimage_dump_host")
-    parent_dir = d.getVar("TESTIMAGE_DUMP_DIR")
-    return HostDumper(cmds, parent_dir)
-
-
 class BaseDumper(object):
     """ Base class to dump commands from host/target """
 
@@ -77,13 +71,12 @@ class HostDumper(BaseDumper):
             result = runCmd(cmd, ignore_status=True)
             self._write_dump(cmd.split()[0], result.output)
 
-
 class TargetDumper(BaseDumper):
     """ Class to get dumps from target, it only works with QemuRunner """
 
-    def __init__(self, cmds, parent_dir, qemurunner):
+    def __init__(self, cmds, parent_dir, runner):
         super(TargetDumper, self).__init__(cmds, parent_dir)
-        self.runner = qemurunner
+        self.runner = runner
 
     def dump_target(self, dump_dir=""):
         if dump_dir:
-- 
2.1.4


