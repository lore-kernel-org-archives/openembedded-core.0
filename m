Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 10C286612D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2016 19:48:49 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga102.fm.intel.com with ESMTP; 29 Aug 2016 12:48:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.30,252,1470726000"; d="scan'208";a="872304276"
Received: from dthoumin-mobl2.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.6.138])
	by orsmga003.jf.intel.com with ESMTP; 29 Aug 2016 12:48:48 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Aug 2016 22:48:22 +0300
Message-Id: <1472500111-12358-4-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1472500111-12358-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 03/12] oe-build-perf-test: rename log file and implement --log-file
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
X-List-Received-Date: Mon, 29 Aug 2016 19:48:49 -0000

Rename the (main) log file of the oe-build-perf-test script from
'output.log' to 'oe-build-perf-test.log'. Also, add a new command line
option --log-file which makes it possible to use an alternative log file
name/path, if needed.  Note that the file name/path is relative to the
output directory.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 3dab070..8d7fdf2 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -131,6 +131,9 @@ def parse_args(argv):
     parser.add_argument('-o', '--out-dir', default='results-{date}',
                         type=os.path.abspath,
                         help="Output directory for test results")
+    parser.add_argument('--log-file', type=os.path.abspath,
+                        default='{out_dir}/oe-build-perf-test.log',
+                        help="Log file of this script")
     parser.add_argument('--run-tests', nargs='+', metavar='TEST',
                         help="List of tests to run")
     parser.add_argument('--commit-results', metavar='GIT_DIR',
@@ -152,7 +155,7 @@ def main(argv=None):
 
     # Set-up log file
     out_dir = args.out_dir.format(date=datetime.now().strftime('%Y%m%d%H%M%S'))
-    setup_file_logging(os.path.join(out_dir, 'output.log'))
+    setup_file_logging(args.log_file.format(out_dir=out_dir))
 
     if args.debug:
         log.setLevel(logging.DEBUG)
-- 
2.6.6


