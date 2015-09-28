Return-Path: <george.l.musat@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id D1B4E75894
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 14:54:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 28 Sep 2015 07:54:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,603,1437462000"; d="scan'208";a="814725923"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2015 07:54:33 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 427D56A4005;
	Mon, 28 Sep 2015 07:53:36 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 28 Sep 2015 17:52:24 +0300
Message-Id: <1443451944-14838-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2] oeqa/testimage: Add ability to run single test from suite.
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
X-List-Received-Date: Mon, 28 Sep 2015 14:54:33 -0000

Just like we have in oe-selftest, you can add
<filename>.<Class>.<testname> in TEST_SUITES in order to
run just that test

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/classes/testimage.bbclass | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 2efab29..bde510c 100644
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
+    import re
 
     exportpath = d.getVar("TEST_EXPORT_DIR", True)
 
@@ -223,6 +228,8 @@ def exportTests(d,tc):
     bb.utils.mkdirhier(os.path.join(exportpath, "oeqa/utils"))
     # copy test modules, this should cover tests in other layers too
     for t in tc.testslist:
+        if re.search("\w+\.\w+\.test_\S+", t):
+            t = '.'.join(t.split('.')[:3])
         mod = pkgutil.get_loader(t)
         shutil.copy2(mod.filename, os.path.join(exportpath, "oeqa/runtime"))
     # copy __init__.py files
-- 
2.1.4


