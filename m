Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8E7771D2
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:12:34 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 07:12:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="645913228"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 07:12:34 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:14:09 -0600
Message-Id: <a7ba70970f40316e3f60118a5738a261e021156e.1454424743.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1454424743.git.anibal.limon@linux.intel.com>
References: <cover.1454424743.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 06/20] classes/testsdk: Add testsdkext task only install.
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
X-List-Received-Date: Tue, 02 Feb 2016 15:12:34 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add task for test extensible sdk for now only install the SDK.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/classes/testsdk.bbclass | 45 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/meta/classes/testsdk.bbclass b/meta/classes/testsdk.bbclass
index d81c456..c169742 100644
--- a/meta/classes/testsdk.bbclass
+++ b/meta/classes/testsdk.bbclass
@@ -98,3 +98,48 @@ python do_testsdk() {
 addtask testsdk
 do_testsdk[nostamp] = "1"
 do_testsdk[lockfiles] += "${TESTSDKLOCK}"
+
+TEST_LOG_SDKEXT_DIR ?= "${WORKDIR}/testsdkext"
+TESTSDKEXTLOCK = "${TMPDIR}/testsdkext.lock"
+
+def testsdkext_main(d):
+    import unittest
+    import os
+    import glob
+    import oeqa.sdkext
+    import time
+    import subprocess
+    from oeqa.oetest import loadTests, runTests, get_test_suites, get_tests_list
+
+    pn = d.getVar("PN", True)
+    bb.utils.mkdirhier(d.getVar("TEST_LOG_SDKEXT_DIR", True))
+
+    # tests in TEST_SUITES become required tests
+    # they won't be skipped even if they aren't suitable.
+    # testslist is what we'll actually pass to the unittest loader
+    testslist = get_tests_list(get_test_suites(d, "sdkext"),
+                    d.getVar("BBPATH", True).split(':'), "sdkext")
+    testsrequired = [t for t in (d.getVar("TEST_SUITES_SDKEXT", True) or \
+                    "auto").split() if t != "auto"]
+
+    tcname = d.expand("${SDK_DEPLOY}/${TOOLCHAINEXT_OUTPUTNAME}.sh")
+    if not os.path.exists(tcname):
+        bb.fatal("The toolchain ext is not built. Build it before running the" \
+                 " tests: 'bitbake <image> -c populate_sdk_ext' .")
+
+    testdir = d.expand("${WORKDIR}/testsdkext/")
+    bb.utils.remove(testdir, True)
+    bb.utils.mkdirhier(testdir)
+    try:
+        subprocess.check_output("%s -y -d %s" % (tcname, testdir), shell=True)
+    except subprocess.CalledProcessError as e:
+        bb.fatal("Couldn't install the SDK EXT:\n%s" % e.output)
+
+testsdkext_main[vardepsexclude] =+ "BB_ORIGENV"
+
+python do_testsdkext() {
+    testsdkext_main(d)
+}
+addtask testsdkext
+do_testsdkext[nostamp] = "1"
+do_testsdkext[lockfiles] += "${TESTSDKEXTLOCK}"
-- 
2.1.4


