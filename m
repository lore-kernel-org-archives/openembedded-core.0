Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 70EF072FBC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:12:45 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga105.jf.intel.com with ESMTP; 21 Feb 2017 10:12:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="67380822"
Received: from yctb01.ostc.intel.com ([10.54.69.55])
	by orsmga005.jf.intel.com with ESMTP; 21 Feb 2017 10:12:46 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 10:11:00 +0000
Message-Id: <f4b6705a2066877e3122a7a69d4570f2d6bbf813.1487671715.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <cover.1487671715.git.mariano.lopez@linux.intel.com>
References: <cover.1487671715.git.mariano.lopez@linux.intel.com>
Subject: [PATCH 1/1] oeqa/runtime/context.py: Fix use of getTarget() with testexport
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
X-List-Received-Date: Tue, 21 Feb 2017 18:12:45 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The idea on getTarget is to use kwargs to send custom variables
to different targets, instead of this, a new variable was added
(just used for custom targets) and this broke testexport. So
in order to fix it, just add the custom variable to kwargs.

This fixes the use of getTarget() in testexport class that was
introduced in 1dc8010afd71fe46fb28bb86fb7c07a5fbd3d7cf.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/classes/testimage.bbclass    |  6 +++++-
 meta/lib/oeqa/core/target/qemu.py |  2 +-
 meta/lib/oeqa/runtime/context.py  | 11 ++++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 09cc6d2..82557a8 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -229,6 +229,10 @@ def testimage_main(d):
                       'kvm'         : kvm,
                     }
 
+    # TODO: Currently BBPATH is needed for custom loading of targets.
+    # It would be better to find these modules using instrospection.
+    target_kwargs['target_modules_path'] = d.getVar('BBPATH')
+
     # runtime use network for download projects for build
     export_proxies(d)
 
@@ -239,7 +243,7 @@ def testimage_main(d):
 
     # the robot dance
     target = OERuntimeTestContextExecutor.getTarget(
-        d.getVar("TEST_TARGET"), d.getVar("BBPATH"), None, d.getVar("TEST_TARGET_IP"),
+        d.getVar("TEST_TARGET"), None, d.getVar("TEST_TARGET_IP"),
         d.getVar("TEST_SERVER_IP"), **target_kwargs)
 
     # test context
diff --git a/meta/lib/oeqa/core/target/qemu.py b/meta/lib/oeqa/core/target/qemu.py
index 9d3f68c..2dc521c 100644
--- a/meta/lib/oeqa/core/target/qemu.py
+++ b/meta/lib/oeqa/core/target/qemu.py
@@ -15,7 +15,7 @@ class OEQemuTarget(OESSHTarget):
     def __init__(self, logger, ip, server_ip, timeout=300, user='root',
             port=None, machine='', rootfs='', kernel='', kvm=False,
             dump_dir='', dump_host_cmds='', display='', bootlog='',
-            tmpdir='', dir_image='', boottime=60):
+            tmpdir='', dir_image='', boottime=60, **kwargs):
 
         super(OEQemuTarget, self).__init__(logger, ip, server_ip, timeout,
                 user, port)
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index ea1b4a6..c4cd76c 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -89,7 +89,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
 
     @staticmethod
-    def getTarget(target_type, target_modules_path, logger, target_ip, server_ip, **kwargs):
+    def getTarget(target_type, logger, target_ip, server_ip, **kwargs):
         target = None
 
         if target_type == 'simpleremote':
@@ -97,8 +97,17 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         elif target_type == 'qemu':
             target = OEQemuTarget(logger, target_ip, server_ip, **kwargs)
         else:
+            # XXX: This code uses the old naming convention for controllers and
+            # targets, the idea it is to leave just targets as the controller
+            # most of the time was just a wrapper.
+            # XXX: This code tries to import modules from lib/oeqa/controllers
+            # directory and treat them as controllers, it will less error prone
+            # to use introspection to load such modules.
+            # XXX: Don't base your targets on this code it will be refactored
+            # in the near future.
             # Custom target module loading
             try:
+                target_modules_path = kwargs.get('target_modules_path', '')
                 controller = OERuntimeTestContextExecutor.getControllerModule(target_type, target_modules_path)
                 target = controller(logger, target_ip, server_ip, **kwargs)
             except ImportError as e:
-- 
2.6.6


