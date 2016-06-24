Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2BEE2731E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:20 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410456"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:19 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:38 +0300
Message-Id: <1466764661-24544-26-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 25/28] oe-build-perf-test: implement --globalres-file option
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:20 -0000

Using this option the script appends test results into a 'global results
file'. A CSV-formatted output of the results. This option is to provide
compatibility with the old build-perf-test.sh.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 meta/lib/oeqa/buildperf/base.py | 32 ++++++++++++++++++++++++++++++++
 scripts/oe-build-perf-test      |  5 +++++
 2 files changed, 37 insertions(+)

diff --git a/meta/lib/oeqa/buildperf/base.py b/meta/lib/oeqa/buildperf/base.py
index e10cbf4..527563b 100644
--- a/meta/lib/oeqa/buildperf/base.py
+++ b/meta/lib/oeqa/buildperf/base.py
@@ -152,6 +152,38 @@ class BuildPerfTestRunner(object):
         os.makedirs(os.path.dirname(tgt_dir))
         shutil.copytree(src_dir, tgt_dir)
 
+    def update_globalres_file(self, filename):
+        """Write results to globalres csv file"""
+        if self.repo:
+            git_tag_rev = self.repo.run_cmd(['describe', self.git_rev])
+        else:
+            git_tag_rev = self.git_rev
+        times = []
+        sizes = []
+        for test in self.results['tests'].values():
+            for measurement in test['measurements']:
+                res_type = measurement['type']
+                values = measurement['values']
+                if res_type == BuildPerfTest.SYSRES:
+                    e_sec = values['elapsed_time'].total_seconds()
+                    times.append('{:d}:{:02d}:{:.2f}'.format(
+                        int(e_sec / 3600),
+                        int((e_sec % 3600) / 60),
+                        e_sec % 60))
+                elif res_type == BuildPerfTest.DISKUSAGE:
+                    sizes.append(str(values['size']))
+                else:
+                    log.warning("Unable to handle '%s' values in "
+                                "globalres.log", res_type)
+
+        log.debug("Writing globalres log to %s", filename)
+        with open(filename, 'a') as fobj:
+            fobj.write('{},{}:{},{},'.format(self.results['tester_host'],
+                                             self.results['git_branch'],
+                                             self.results['git_revision'],
+                                             git_tag_rev))
+            fobj.write(','.join(times + sizes) + '\n')
+
 
 def perf_test_case(obj):
     """Decorator for adding test classes"""
diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index ca90f69..9dd073c 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -70,6 +70,8 @@ def parse_args(argv):
 
     parser.add_argument('-D', '--debug', action='store_true',
                         help='Enable debug level logging')
+    parser.add_argument('--globalres-file',
+                        help="Append results to 'globalres' csv file")
 
     return parser.parse_args(argv)
 
@@ -94,6 +96,9 @@ def main(argv=None):
     # Run actual tests
     runner = BuildPerfTestRunner(out_dir)
     ret = runner.run_tests()
+    if not ret:
+        if args.globalres_file:
+            runner.update_globalres_file(args.globalres_file)
 
     return ret
 
-- 
2.6.6


