Return-Path: <costin.c.constantin@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D3A9A6AC37
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jun 2015 09:34:35 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 09 Jun 2015 02:34:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,579,1427785200"; d="scan'208";a="723750297"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 09 Jun 2015 02:34:32 -0700
Received: from localhost.localdomain (unknown [10.237.112.252])
	by linux.intel.com (Postfix) with ESMTP id 7E12E6A4083;
	Tue,  9 Jun 2015 02:33:57 -0700 (PDT)
From: Costin Constantin <costin.c.constantin@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Jun 2015 12:44:26 +0300
Message-Id: <1433843066-7433-1-git-send-email-costin.c.constantin@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] meta/testimage.bbclass: corrected the bug that prevented test cases to be loaded from layers other than meta when using TEST_SUITES = "auto"
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
X-List-Received-Date: Tue, 09 Jun 2015 09:34:37 -0000

Signed-off-by: Costin Constantin <costin.c.constantin@intel.com>
---
 meta/classes/testimage.bbclass | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 4074ff7..aadee45 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -88,19 +88,20 @@ def get_tests_list(d, type="runtime"):
 
     if "auto" in testsuites:
         def add_auto_list(path):
-            if not os.path.exists(os.path.join(path, '__init__.py')):
-                bb.fatal('Tests directory %s exists but is missing __init__.py' % path)
             files = sorted([f for f in os.listdir(path) if f.endswith('.py') and not f.startswith('_')])
             for f in files:
                 module = 'oeqa.' + type + '.' + f[:-3]
                 if module not in testslist:
                     testslist.append(module)
-
+        tests_found = False
         for p in bbpath:
             testpath = os.path.join(p, 'lib', 'oeqa', type)
             bb.debug(2, 'Searching for tests in %s' % testpath)
-            if os.path.exists(testpath):
+            if os.path.exists(os.path.join(testpath, '__init__.py')):
                 add_auto_list(testpath)
+                tests_found = True
+        if not tests_found:
+            bb.fatal('Couldn\'t find any test files inside  meta*/lib/oeqa/runtime or meta*/lib/oeqa/sdk directories.')
 
     return testslist
 
-- 
2.1.4


