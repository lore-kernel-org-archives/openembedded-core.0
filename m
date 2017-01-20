Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 8794B772D1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567498"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:54 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:13 -0600
Message-Id: <3963de5452c58315e51bcb9b863ee4b616f577b9.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 42/55] oeqa/runtime/context: Move helper functions for process args to executor
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/runtime/context.py | 56 ++++++++++++++++++++++++++--------------
 1 file changed, 36 insertions(+), 20 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index e692bc0..ec378bb 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -12,10 +12,10 @@ class OERuntimeTestContext(OETestContext):
     runtime_files_dir = os.path.join(
                         os.path.dirname(os.path.abspath(__file__)), "files")
 
-    def __init__(self, td, logger, target, packages_manifest):
+    def __init__(self, td, logger, target, image_packages):
         super(OERuntimeTestContext, self).__init__(td, logger)
         self.target = target
-        self.image_packages = self.readPackagesManifest(packages_manifest)
+        self.image_packages = image_packages
         self._set_target_cmds()
 
     def _set_target_cmds(self):
@@ -25,19 +25,6 @@ class OERuntimeTestContext(OETestContext):
         if 'procps' in self.image_packages:
             self.target_cmds['ps'] = self.target_cmds['ps'] + ' -ef'
 
-    def readPackagesManifest(self, manifest):
-        if not os.path.exists(manifest):
-            raise OSError("Couldn't find manifest file: %s" % manifest)
-
-        image_packages = set()
-        with open(manifest, 'r') as f:
-            for line in f.readlines():
-                line = line.strip()
-                if line and not line.startswith("#"):
-                    image_packages.add(line.split()[0])
-
-        return image_packages
-
 class OERuntimeTestContextExecutor(OETestContextExecutor):
     _context_class = OERuntimeTestContext
 
@@ -74,16 +61,45 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
         runtime_group.add_argument('--packages-manifest', action='store',
                 help="Package manifest of the image under test")
 
+
+    @staticmethod
+    def getTarget(target_type, target_ip, server_ip):
+        target = None
+
+        if target_type == 'simpleremote':
+            target = OESSHTarget(target_ip)
+        elif target_type == 'qemu':
+            raise NotImplementedError("target_type %s isn't implemented yet" % \
+                    target_type)
+        else:
+            raise TypeError("target_type %s isn't supported" % target_type)
+
+        return target
+
+    @staticmethod
+    def readPackagesManifest(manifest):
+        if not os.path.exists(manifest):
+            raise OSError("Manifest file not exists: %s" % manifest)
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
     def _process_args(self, logger, args):
         if not args.packages_manifest:
             raise TypeError('Manifest file not provided')
 
         super(OERuntimeTestContextExecutor, self)._process_args(logger, args)
-        target = OESSHTarget(args.target_ip)
-
-        self.tc_kwargs['init']['target'] = target
 
-        packages_manifest = os.path.join(os.getcwd(), args.packages_manifest)
-        self.tc_kwargs['init']['packages_manifest'] = packages_manifest
+        self.tc_kwargs['init']['target'] = \
+                OERuntimeTestContextExecutor.getTarget(args.target_type)
+        self.tc_kwargs['init']['image_packages'] = \
+                OERuntimeTestContextExecutor.readPackagesManifest(
+                        args.packages_manifest)
 
 _executor_class = OERuntimeTestContextExecutor
-- 
2.1.4


