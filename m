Return-Path: <anibal.limon@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 62097731A5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:08:00 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 20 Jan 2017 09:08:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567547"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:08:00 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:24 -0600
Message-Id: <dbd3ebfb48a6f2c21776d14995f4edc9dd9bcc45.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 53/55] oeqa/runtime/context.py: Add defaults for runtime context
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
X-List-Received-Date: Fri, 20 Jan 2017 17:08:00 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds default values to OERuntimeTestContextExecutor class in
order to make easier the execution of exported test that were
generated with testexport class.

[YOCTO #10686]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/runtime/context.py | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 10b8b54..e5e0141 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -42,12 +42,15 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_cases = os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases')
     default_data = None
+    default_test_data = 'data/testdata.json'
+    default_tests = ''
 
     default_target_type = 'simpleremote'
+    default_manifest = 'data/manifest'
     default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
     default_host_dumper_dir = '/tmp/oe-saved-tests'
-    default_extract_dir = 'extract_dir'
+    default_extract_dir = 'packages/extracted'
 
     def register_commands(self, logger, subparsers):
         super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
@@ -73,10 +76,14 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
                 % self.default_host_dumper_dir)
 
         runtime_group.add_argument('--packages-manifest', action='store',
-                help="Package manifest of the image under test")
+                default=self.default_manifest,
+                help="Package manifest of the image under testi, default: %s" \
+                % self.default_manifest)
 
         runtime_group.add_argument('--extract-dir', action='store',
-                help='Directory where extracted packages reside')
+                default=self.default_extract_dir,
+                help='Directory where extracted packages reside, default: %s' \
+                % self.default_extract_dir)
 
         runtime_group.add_argument('--qemu-boot', action='store',
                 help="Qemu boot configuration, only needed when target_type is QEMU.")
@@ -97,7 +104,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
     @staticmethod
     def readPackagesManifest(manifest):
-        if not os.path.exists(manifest):
+        if not manifest or not os.path.exists(manifest):
             raise OSError("Manifest file not exists: %s" % manifest)
 
         image_packages = set()
@@ -124,16 +131,13 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         self.tc_kwargs['init']['target'] = \
                 OERuntimeTestContextExecutor.getTarget(args.target_type,
-                        args.target_ip, args.server_ip, **target_kwargs)
+                        None, args.target_ip, args.server_ip, **target_kwargs)
         self.tc_kwargs['init']['host_dumper'] = \
                 OERuntimeTestContextExecutor.getHostDumper(None,
                         args.host_dumper_dir)
         self.tc_kwargs['init']['image_packages'] = \
                 OERuntimeTestContextExecutor.readPackagesManifest(
                         args.packages_manifest)
-
-        self.tc_kwargs['init']['extract_dir'] = \
-                OERuntimeTestContextExecutor.readPackagesManifest(
-                        args.extract_dir)
+        self.tc_kwargs['init']['extract_dir'] = args.extract_dir
 
 _executor_class = OERuntimeTestContextExecutor
-- 
2.1.4


