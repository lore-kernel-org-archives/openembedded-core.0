Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 93A56731A5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Aug 2016 07:13:24 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga104.fm.intel.com with ESMTP; 24 Aug 2016 00:13:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,569,1464678000"; d="scan'208";a="1040620574"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by orsmga002.jf.intel.com with ESMTP; 24 Aug 2016 00:13:11 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Aug 2016 10:12:51 +0300
Message-Id: <1472022789-13028-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472022789-13028-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 01/19] oe-build-perf-test: implement --run-tests option
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
X-List-Received-Date: Wed, 24 Aug 2016 07:13:24 -0000

Makes it possible to run only a subset of tests.

NOTE: The tests currently have (unwritten) dependencies on each other so
use this option with care. Mainly for debugging.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 88af40a..808531e 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -105,6 +105,8 @@ def parse_args(argv):
                         help="Lock file to use")
     parser.add_argument('-o', '--out-dir', default='results-{date}',
                         help="Output directory for test results")
+    parser.add_argument('--run-tests', nargs='+', metavar='TEST',
+                        help="List of tests to run")
 
     return parser.parse_args(argv)
 
@@ -133,7 +135,10 @@ def main(argv=None):
 
     # Load build perf tests
     loader = BuildPerfTestLoader()
-    suite = loader.discover(start_dir=os.path.dirname(oeqa.buildperf.__file__))
+    if args.run_tests:
+        suite = loader.loadTestsFromNames(args.run_tests, oeqa.buildperf)
+    else:
+        suite = loader.loadTestsFromModule(oeqa.buildperf)
 
     archive_build_conf(out_dir)
     runner = BuildPerfTestRunner(out_dir, verbosity=2)
-- 
2.6.6


