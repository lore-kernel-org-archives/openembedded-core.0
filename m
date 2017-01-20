Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9BE8B771E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567493"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:53 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:11 -0600
Message-Id: <1ed29ba3a707158522aafc133b6ef439c992d2fb.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 40/55] oeqa/core/context: Add option to select tests to run
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

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This add the option to select what tests to run in the
<module>[.<class>[.<test>]] format.

Currently it just support modules

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/context.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/core/context.py b/meta/lib/oeqa/core/context.py
index ba6ccf8..efed4e6 100644
--- a/meta/lib/oeqa/core/context.py
+++ b/meta/lib/oeqa/core/context.py
@@ -157,6 +157,7 @@ class OETestContextExecutor(object):
     default_cases = [os.path.join(os.path.abspath(os.path.dirname(__file__)),
             'cases/example')]
     default_test_data = os.path.join(default_cases[0], 'data.json')
+    default_tests = None
 
     def register_commands(self, logger, subparsers):
         self.parser = subparsers.add_parser(self.name, help=self.help,
@@ -167,6 +168,9 @@ class OETestContextExecutor(object):
         self.parser.add_argument('--output-log', action='store',
                 default=self.default_output_log,
                 help="results output log, default: %s" % self.default_output_log)
+        self.parser.add_argument('--run-tests', action='store',
+                default=self.default_tests,
+                help="tests to run in <module>[.<class>[.<name>]] format. Just works for modules now")
 
         if self.default_test_data:
             self.parser.add_argument('--test-data-file', action='store',
@@ -211,6 +215,8 @@ class OETestContextExecutor(object):
         else:
             self.tc_kwargs['init']['td'] = {}
 
+        self.tc_kwargs['load']['modules'] = args.run_tests.split()
+
         self.module_paths = args.CASES_PATHS
 
     def run(self, logger, args):
-- 
2.1.4


