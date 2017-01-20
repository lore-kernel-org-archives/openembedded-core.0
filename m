Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id D19C9771D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567367"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:39 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:41 -0600
Message-Id: <a7b698d3c1e5ff87b6c18cf15651476cd4d1ca2b.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 10/55] oeqa/core/context: Add support of OETestContextExecutor
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:39 -0000
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
 meta/lib/oeqa/core/context.py | 85 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index cbab2f8..ba6ccf8 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -146,3 +146,88 @@ class OETestContext(object):
             else:
                 self.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
                     oeid, 'PASSED'))
+
+class OETestContextExecutor(object):
+    _context_class = OETestContext
+
+    name = 'core'
+    help = 'core test component example'
+    description = 'executes core test suite example'
+
+    default_cases = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
+            'cases/example')]
+    default_test_data = os.path.join(default_cases[0], 'data.json')
+
+    def register_commands(self, logger, subparsers):
+        self.parser = subparsers.add_parser(self.name, help=self.help,
+                description=self.description, group='components')
+
+        self.default_output_log = '%s-results-%s.log' % (self.name,
+                time.strftime("%Y%m%d%H%M%S"))
+        self.parser.add_argument('--output-log', action='store',
+                default=self.default_output_log,
+                help="results output log, default: %s" % self.default_output_log)
+
+        if self.default_test_data:
+            self.parser.add_argument('--test-data-file', action='store',
+                    default=self.default_test_data,
+                    help="data file to load, default: %s" % self.default_test_data)
+        else:
+            self.parser.add_argument('--test-data-file', action='store',
+                    help="data file to load")
+
+        if self.default_cases:
+            self.parser.add_argument('CASES_PATHS', action='store',
+                    default=self.default_cases, nargs='*',
+                    help="paths to directories with test cases, default: %s"\
+                            % self.default_cases)
+        else:
+            self.parser.add_argument('CASES_PATHS', action='store',
+                    nargs='+', help="paths to directories with test cases")
+
+        self.parser.set_defaults(func=self.run)
+
+    def _setup_logger(self, logger, args):
+        formatter = logging.Formatter('%(asctime)s - ' + self.name + \
+                ' - %(levelname)s - %(message)s')
+        sh = logger.handlers[0]
+        sh.setFormatter(formatter)
+        fh = logging.FileHandler(args.output_log)
+        fh.setFormatter(formatter)
+        logger.addHandler(fh)
+
+        return logger
+
+    def _process_args(self, logger, args):
+        self.tc_kwargs = {}
+        self.tc_kwargs['init'] = {}
+        self.tc_kwargs['load'] = {}
+        self.tc_kwargs['run'] = {}
+
+        self.tc_kwargs['init']['logger'] = self._setup_logger(logger, args)
+        if args.test_data_file:
+            self.tc_kwargs['init']['td'] = json.load(
+                    open(args.test_data_file, "r"))
+        else:
+            self.tc_kwargs['init']['td'] = {}
+
+        self.module_paths = args.CASES_PATHS
+
+    def run(self, logger, args):
+        self._process_args(logger, args)
+
+        self.tc = self._context_class(**self.tc_kwargs['init'])
+        self.tc.loadTests(self.module_paths, **self.tc_kwargs['load'])
+        rc = self.tc.runTests(**self.tc_kwargs['run'])
+        self.tc.logSummary(rc, self.name)
+        self.tc.logDetails()
+
+        output_link = os.path.join(os.path.dirname(args.output_log),
+                "%s-results.log" % self.name)
+        if os.path.exists(output_link):
+            os.remove(output_link)
+        os.symlink(args.output_log, output_link)
+
+        return rc
+
+_executor_class = OETestContextExecutor
-- 
2.1.4


