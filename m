Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D67F9731DA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:38:14 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:38:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410442"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:38:14 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:35 +0300
Message-Id: <1466764661-24544-23-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 22/28] oe-build-perf-test: enable logging into file
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
X-List-Received-Date: Fri, 24 Jun 2016 10:38:14 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 0a9fc9e..ca90f69 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -52,6 +52,17 @@ def pre_run_sanity_check():
     return True
 
 
+def setup_file_logging(log_file):
+    """Setup loggin to file"""
+    log_dir = os.path.dirname(log_file)
+    if not os.path.exists(log_dir):
+        os.makedirs(log_dir)
+    formatter = logging.Formatter(LOG_FORMAT)
+    handler = logging.FileHandler(log_file)
+    handler.setFormatter(formatter)
+    log.addHandler(handler)
+
+
 def parse_args(argv):
     """Parse command line arguments"""
     parser = argparse.ArgumentParser(
@@ -76,8 +87,11 @@ def main(argv=None):
     # Check our capability to drop caches and ask pass if needed
     KernelDropCaches.check()
 
-    # Run actual tests
+    # Set-up log file
     out_dir = 'results-{}'.format(datetime.now().strftime('%Y%m%d%H%M%S'))
+    setup_file_logging(os.path.join(out_dir, 'output.log'))
+
+    # Run actual tests
     runner = BuildPerfTestRunner(out_dir)
     ret = runner.run_tests()
 
-- 
2.6.6


