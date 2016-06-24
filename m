Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D4B42731B9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:49 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410330"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:49 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:19 +0300
Message-Id: <1466764661-24544-7-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 06/28] oe-build-perf-test: add pre-run sanity check
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:50 -0000

The script will be required to be run in an initialized bitbake build
environment.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 66477eb..9fb4310 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -16,8 +16,14 @@
 """Build performance test script"""
 import argparse
 import logging
+import os
 import sys
 
+sys.path.insert(0, os.path.dirname(os.path.realpath(__file__)) + '/lib')
+import scriptpath
+scriptpath.add_oe_lib_path()
+from oeqa.utils.commands import runCmd
+
 
 # Set-up logging
 LOG_FORMAT = '[%(asctime)s] %(levelname)s: %(message)s'
@@ -25,6 +31,25 @@ logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)
 log = logging.getLogger()
 
 
+def pre_run_sanity_check():
+    """Sanity check of build environment"""
+    build_dir = os.environ.get("BUILDDIR")
+    if not build_dir:
+        log.error("BUILDDIR not set. Please run the build environmnent setup "
+                  "script.")
+        return False
+    if os.getcwd() != build_dir:
+        log.error("Please run this script under BUILDDIR (%s)", build_dir)
+        return False
+
+    ret = runCmd('which bitbake', ignore_status=True)
+    if ret.status:
+        log.error("bitbake command not found")
+        return False
+
+    return True
+
+
 def parse_args(argv):
     """Parse command line arguments"""
     parser = argparse.ArgumentParser(
@@ -43,6 +68,9 @@ def main(argv=None):
     if args.debug:
         log.setLevel(logging.DEBUG)
 
+    if not pre_run_sanity_check():
+        return 1
+
     return 0
 
 
-- 
2.6.6


