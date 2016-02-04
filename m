Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ADE657736F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Feb 2016 22:27:55 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 04 Feb 2016 14:27:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,397,1449561600"; d="scan'208";a="647384179"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 04 Feb 2016 14:27:55 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Feb 2016 16:29:32 -0600
Message-Id: <b3cd078e060019564c121d4c08b9ca502a96a7ad.1454624835.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454624835.git.anibal.limon@linux.intel.com>
References: <cover.1454624835.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com,
	=?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <limon.anibal@gmail.com>
Subject: [PATCH v3 15/22] classes/testsdk: Add compatibility SDK testsuite to eSDK
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
X-List-Received-Date: Thu, 04 Feb 2016 22:27:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Aníbal Limón <limon.anibal@gmail.com>

Extensible SDK is compatible with SDK test suite so it need
to execute the same tests over it.

Signed-off-by: Aníbal Limón <limon.anibal@gmail.com>
---
 meta/classes/testsdk.bbclass | 24 +++++++++++++++++++-----
 1 file changed, 19 insertions(+), 5 deletions(-)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index 88057e5..a0c50fe 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -75,17 +75,25 @@ TEST_LOG_SDKEXT_DIR ?= "${WORKDIR}/testsdkext"
 TESTSDKEXTLOCK = "${TMPDIR}/testsdkext.lock"
 
 def testsdkext_main(d):
-    import unittest
     import os
-    import glob
     import oeqa.sdkext
-    import time
     import subprocess
-    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
+    from oeqa.oetest import SDKTestContext, SDKExtTestContext
     from bb.utils import export_proxies
 
+    # extensible sdk use network
     export_proxies(d)
 
+    # extensible sdk shows a warning if found bitbake in the path
+    # because can cause problems so clean it
+    new_path = ''
+    for p in os.environ['PATH'].split(':'):
+       if 'bitbake/bin' in p or 'poky/scripts' in p:
+           continue
+       new_path = new_path + p + ':'
+    new_path = new_path[:-1]
+    os.environ['PATH'] = new_path
+
     pn = d.getVar("PN", True)
     bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
 
@@ -98,10 +106,16 @@ def testsdkext_main(d):
     bb.utils.remove(testdir, True)
     bb.utils.mkdirhier(testdir)
     try:
-        subprocess.check_output("%s -y -d %s" % (tcname, testdir), shell=True)
+        subprocess.check_output("%s -y -d %s/tc" % (tcname, testdir), shell=True)
     except subprocess.CalledProcessError as e:
         bb.fatal("Couldn't install the SDK EXT:\n%s" % e.output)
 
+    try:
+        bb.plain("Running SDK Compatibility tests ...")
+        run_test_context(SDKTestContext, d, testdir, tcname, pn)
+    finally:
+        bb.utils.remove(testdir, True)
+
 testsdkext_main[vardepsexclude] =+ "BB_ORIGENV"
 
 python do_testsdkext() {
-- 
2.1.4


