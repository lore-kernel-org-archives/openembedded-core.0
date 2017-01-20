Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 0D3F1772CF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:54 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567496"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:54 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:12 -0600
Message-Id: <060d3dc98a21dd3edb382d247d12e0f1c605b8b8.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 41/55] oeqa/runtime/context: Add runtime option group and options for target type and server ip.
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
 meta/lib/oeqa/runtime/context.py | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 10a8872..e692bc0 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -44,17 +44,34 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     name = 'runtime'
     help = 'runtime test component'
     description = 'executes runtime tests over targets'
+
     default_cases = os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases')
+    default_data = None
+
+    default_target_type = 'simpleremote'
+    default_server_ip = '192.168.7.1'
     default_target_ip = '192.168.7.2'
 
     def register_commands(self, logger, subparsers):
         super(OERuntimeTestContextExecutor, self).register_commands(logger, subparsers)
-        self.parser.add_argument('--target-ip', action='store',
+
+        runtime_group = self.parser.add_argument_group('runtime options')
+
+        runtime_group.add_argument('--target-type', action='store',
+                default=self.default_target_type, choices=['simpleremote', 'qemu'],
+                help="Target type of device under test, default: %s" \
+                % self.default_target_type)
+        runtime_group.add_argument('--target-ip', action='store',
                 default=self.default_target_ip,
                 help="IP address of device under test, default: %s" \
                 % self.default_target_ip)
-        self.parser.add_argument('--packages-manifest', action='store',
+        runtime_group.add_argument('--server-ip', action='store',
+                default=self.default_target_ip,
+                help="IP address of device under test, default: %s" \
+                % self.default_server_ip)
+
+        runtime_group.add_argument('--packages-manifest', action='store',
                 help="Package manifest of the image under test")
 
     def _process_args(self, logger, args):
@@ -63,6 +80,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
 
         super(OERuntimeTestContextExecutor, self)._process_args(logger, args)
         target = OESSHTarget(args.target_ip)
+
         self.tc_kwargs['init']['target'] = target
 
         packages_manifest = os.path.join(os.getcwd(), args.packages_manifest)
-- 
2.1.4


