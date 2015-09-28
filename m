Return-Path: <george.l.musat@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CCFF8755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 11:49:53 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 28 Sep 2015 04:49:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,602,1437462000"; d="scan'208";a="778908219"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 28 Sep 2015 04:49:48 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 0D5816A4083;
	Mon, 28 Sep 2015 04:48:49 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 14:47:42 +0300
Message-Id: <1443440862-14585-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/testimage: Add ability to run single test from suite.
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
X-List-Received-Date: Mon, 28 Sep 2015 11:49:54 -0000

Just like we have in oe-selftest, you can add
<filename>.<Class>.<testname> in TEST_SUITES in order to
run just that test.

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2efab29..36ee782 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -146,6 +146,10 @@ def get_tests_list(d, type="runtime"):
                     testslist.append("oeqa." + type + "." + testname)
                     found = True
                     break
+                elif os.path.exists(os.path.join(p, 'lib', 'oeqa', type, testname.split(".")[0] + '.py')):
+                    testslist.append("oeqa." + type + "." + testname)
+                    found = True
+                    break
             if not found:
                 bb.fatal('Test %s specified in TEST_SUITES could not be found in lib/oeqa/runtime under BBPATH' % testname)
 
@@ -172,6 +176,7 @@ def exportTests(d,tc):
     import json
     import shutil
     import pkgutil
+    from re import search as re_search
 
     exportpath = d.getVar("TEST_EXPORT_DIR", True)
 
@@ -223,6 +228,8 @@ def exportTests(d,tc):
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
     # copy test modules, this should cover tests in other layers too
     for t in tc.testslist:
+        if re_search("\w+\.\w+\.test_\S+", t):
+            t = t.split('.')[0]+'.'+t.split('.')[1]+'.'+t.split('.')[2]
         mod = pkgutil.get_loader(t)
         shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
     # copy __init__.py files
-- 
2.1.4


