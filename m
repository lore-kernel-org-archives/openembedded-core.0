Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 90FBD71A89
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 Dec 2016 21:51:30 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP; 06 Dec 2016 13:51:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,310,1477983600"; d="scan'208";a="39533284"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by orsmga005.jf.intel.com with ESMTP; 06 Dec 2016 13:51:29 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Dec 2016 15:43:55 -0600
Message-Id: <99b8b2cad4303440f572a193ce198398b5ff52cb.1481059445.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481059445.git.anibal.limon@linux.intel.com>
References: <cover.1481059445.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 10/32] oeqa/core/context: Add support of OETestContextExecutor
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
X-List-Received-Date: Tue, 06 Dec 2016 21:51:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The OETestContextExecutor class supports to use oe-test for run core
test component also is a base class for the other test components
(runtime, sdk, selftest).

Te principal functionality is to support cmdline parsing and execution
of OETestContext, the test components could extend the common options
to provide specific ones. The common options between test components
are test data file, output log and test cases path's to scan.

Also it initializes the logger to be passed to the whole OEQA framework.

[YOCTO #10230]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/context.py | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index d5caf53..c7d6db3 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -148,7 +148,7 @@ class OETestContextExecutor(object):
 
     default_cases = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases/example')]
-    default_test_data = os.path.join(default_cases[0], 'data.json')
+    default_data = os.path.join(default_cases[0], 'data.json')
 
     def register_commands(self, logger, subparsers):
         self.parser = subparsers.add_parser(self.name, help=self.help,
@@ -160,12 +160,12 @@ class OETestContextExecutor(object):
                 default=self.default_output_log,
                 help="results output log, default: %s" % self.default_output_log)
 
-        if self.default_test_data:
-            self.parser.add_argument('--test-data-file', action='store',
-                    default=self.default_test_data,
-                    help="data file to load, default: %s" % self.default_test_data)
+        if self.default_data:
+            self.parser.add_argument('--data-file', action='store',
+                    default=self.default_data,
+                    help="data file to load, default: %s" % self.default_data)
         else:
-            self.parser.add_argument('--test-data-file', action='store',
+            self.parser.add_argument('--data-file', action='store',
                     help="data file to load")
 
         if self.default_cases:
@@ -197,11 +197,11 @@ class OETestContextExecutor(object):
         self.tc_kwargs['run'] = {}
 
         self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
-        if args.test_data_file:
-            self.tc_kwargs['init']['td'] = json.load(
-                    open(args.test_data_file, "r"))
+        if args.data_file:
+            self.tc_kwargs['init']['d'] = json.load(
+                    open(args.data_file, "r"))
         else:
-            self.tc_kwargs['init']['td'] = {}
+            self.tc_kwargs['init']['d'] = {}
 
         self.module_paths = args.CASES_PATHS
 
-- 
2.1.4


