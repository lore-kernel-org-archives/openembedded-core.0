Received: from smtp01.udag.de (smtp01.udag.de [62.146.106.17])
 by mx.groups.io with SMTP id smtpd.web11.26318.1585177896669160520
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2020 16:11:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: typedivision.de, ip: 62.146.106.17, mailfrom: sk@typedivision.de)
Received: from localhost.localdomain (x4e36161a.dyn.telefonica.de [78.54.22.26])
	by smtp01.udag.de (Postfix) with ESMTPA id 48F9D397;
	Thu, 26 Mar 2020 00:11:34 +0100 (CET)
From: "Stefan Kral" <sk@typedivision.de>
To: openembedded-core@lists.openembedded.org
Cc: Stefan Kral <sk@typedivision.de>
Subject: [PATCH] oeqa: default runtime json results for testexport
Date: Thu, 26 Mar 2020 00:11:05 +0100
Message-Id: <20200325231105.24851-1-sk@typedivision.de>
X-Mailer: git-send-email 2.17.2 (Apple Git-113)
Authentication-Results: smtp01.udag.de;
	auth=pass smtp.auth=typedivision-de-0001 smtp.mailfrom=sk@typedivision.de

Set the json result output dir in the oeqe runtime context to create
testresults.json file by default for exported runtime test runs.

Use current datetime for the json result property name (not DATETIME
from build) to allow multiple result entries.

Signed-off-by: Stefan Kral <sk@typedivision.de>
---
 meta/lib/oeqa/core/context.py    | 10 ++++++----
 meta/lib/oeqa/runtime/context.py |  1 +
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index b9a28ce319..4705d608ac 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -100,24 +100,26 @@ class OETestContextExecutor(object):
     name = 'core'
     help = 'core test component example'
     description = 'executes core test suite example'
+    datetime = time.strftime("%Y%m%d%H%M%S")
 
     default_cases = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases/example')]
     default_test_data = os.path.join(default_cases[0], 'data.json')
     default_tests = None
+    default_json_result_dir = None
 
     def register_commands(self, logger, subparsers):
         self.parser = subparsers.add_parser(self.name, help=self.help,
                 description=self.description, group='components')
 
-        self.default_output_log = '%s-results-%s.log' % (self.name,
-                time.strftime("%Y%m%d%H%M%S"))
+        self.default_output_log = '%s-results-%s.log' % (self.name, self.datetime)
         self.parser.add_argument('--output-log', action='store',
                 default=self.default_output_log,
                 help="results output log, default: %s" % self.default_output_log)
 
         self.parser.add_argument('--json-result-dir', action='store',
-                help="json result output dir, create testresults.json here if set")
+                default=self.default_json_result_dir,
+                help="json result output dir, default: %s" % self.default_json_result_dir)
 
         group = self.parser.add_mutually_exclusive_group()
         group.add_argument('--run-tests', action='store', nargs='+',
@@ -195,7 +197,7 @@ class OETestContextExecutor(object):
 
     def _get_result_id(self, configuration):
         return '%s_%s_%s_%s' % (configuration['TEST_TYPE'], configuration['IMAGE_BASENAME'],
-                                configuration['MACHINE'], configuration['DATETIME'])
+                                configuration['MACHINE'], self.datetime)
 
     def _pre_run(self):
         pass
diff --git a/meta/lib/oeqa/runtime/context.py b/meta/lib/oeqa/runtime/context.py
index 101434a595..3826f27642 100644
--- a/meta/lib/oeqa/runtime/context.py
+++ b/meta/lib/oeqa/runtime/context.py
@@ -47,6 +47,7 @@ class OERuntimeTestContextExecutor(OETestContextExecutor):
     default_data = None
     default_test_data = 'data/testdata.json'
     default_tests = ''
+    default_json_result_dir = '%s-results' % name
 
     default_target_type = 'simpleremote'
     default_manifest = 'data/manifest'
-- 
2.17.2 (Apple Git-113)

