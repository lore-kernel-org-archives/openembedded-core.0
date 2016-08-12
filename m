Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 533D77724B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:47 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239506"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:38 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:25 +0300
Message-Id: <1470993086-23718-9-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 8/9] oe-build-perf-test: write logger output into file only
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:48 -0000

Write the output from the Python logger only into the log file. This way
the console output from the script is cleaner and not mixed with the
logger records.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 786c715..e857ca6 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -33,10 +33,7 @@ from oeqa.buildperf import (BuildPerfTestLoader, BuildPerfTestResult,
 from oeqa.utils.commands import runCmd
 
 
-# Set-up logging
-LOG_FORMAT = '[%(asctime)s] %(levelname)s: %(message)s'
-logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
-log = logging.getLogger()
+log = None
 
 
 def acquire_lock(lock_f):
@@ -71,15 +68,18 @@ def pre_run_sanity_check():
     return True
 
 
-def setup_file_logging(log_file):
+def setup_logging(log_file):
     """Setup loggin to file"""
+    global log
+
     log_dir = os.path.dirname(log_file)
     if not os.path.exists(log_dir):
         os.makedirs(log_dir)
-    formatter = logging.Formatter(LOG_FORMAT)
-    handler = logging.FileHandler(log_file)
-    handler.setFormatter(formatter)
-    log.addHandler(handler)
+
+    log_format = '[%(asctime)s] %(levelname)s: %(message)s'
+    logging.basicConfig(level=logging.INFO, filename=log_file,
+                        format=log_format)
+    log = logging.getLogger()
 
 
 def archive_build_conf(out_dir):
@@ -112,6 +112,10 @@ def main(argv=None):
     """Script entry point"""
     args = parse_args(argv)
 
+    # Set-up logging
+    out_dir = args.out_dir.format(date=datetime.now().strftime('%Y%m%d%H%M%S'))
+    setup_logging(os.path.join(out_dir, 'output.log'))
+
     if args.debug:
         log.setLevel(logging.DEBUG)
 
@@ -129,9 +133,6 @@ def main(argv=None):
     # Load build perf tests
     loader = BuildPerfTestLoader()
     suite = loader.discover(start_dir=os.path.dirname(oeqa.buildperf.__file__))
-    # Set-up log file
-    out_dir = args.out_dir.format(date=datetime.now().strftime('%Y%m%d%H%M%S'))
-    setup_file_logging(os.path.join(out_dir, 'output.log'))
 
     # Run actual tests
     archive_build_conf(out_dir)
-- 
2.6.6


