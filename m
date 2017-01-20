Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8B9BA77235
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:55 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567503"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:55 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:15 -0600
Message-Id: <9fe01787b581f3c6ef7ae11866cfee19b3edbad5.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 44/55] oeqa/runtime/context.py: Prepare for qemu
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

This commit will prepare context to use qemu and not just
simpleremote.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/context.py | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index ab7caa6..f0f6e62 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -5,6 +5,7 @@ import os
 
 from oeqa.core.context import OETestContext, OETestContextExecutor
 from oeqa.core.target.ssh import OESSHTarget
+from oeqa.core.target.qemu import OEQemuTarget
 from oeqa.utils.dump import HostDumper
 
 from oeqa.runtime.loader import OERuntimeTestLoader
@@ -16,6 +17,7 @@ class OERuntimeTestContext(OETestContext):
 
     def __init__(self, td, logger, target, host_dumper, image_packages):
         super(OERuntimeTestContext, self).__init__(td, logger)
+
         self.target = target
         self.image_packages = image_packages
         self.host_dumper = host_dumper
@@ -70,17 +72,19 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         runtime_group.add_argument('--packages-manifest', action='store',
                 help="Package manifest of the image under test")
 
+        runtime_group.add_argument('--qemu-boot', action='store',
+                help="Qemu boot configuration, only needed when target_type is QEMU.")
 
     @staticmethod
-    def getTarget(target_type, target_ip, server_ip):
+    def getTarget(target_type, target_ip, server_ip, **kwargs):
         target = None
 
         if target_type == 'simpleremote':
-            target = OESSHTarget(target_ip)
+            target = OESSHTarget(target_ip, server_ip, kwargs)
         elif target_type == 'qemu':
-            raise NotImplementedError("target_type %s isn't implemented yet" % \
-                    target_type)
+            target = OEQemuTarget(target_ip, server_ip, kwargs)
         else:
+            # TODO: Implement custom target module loading
             raise TypeError("target_type %s isn't supported" % target_type)
 
         return target
@@ -109,8 +113,12 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         super(OERuntimeTestContextExecutor, self)._process_args(logger, args)
 
+        target_kwargs = {}
+        target_kwargs['qemuboot'] = args.qemu_boot
+
         self.tc_kwargs['init']['target'] = \
-                OERuntimeTestContextExecutor.getTarget(args.target_type)
+                OERuntimeTestContextExecutor.getTarget(args.target_type,
+                        args.target_ip, args.server_ip, **target_kwargs)
         self.tc_kwargs['init']['host_dumper'] = \
                 OERuntimeTestContextExecutor.getHostDumper(None,
                         args.host_dumper_dir)
-- 
2.1.4


