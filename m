Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2A4CF781F6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:37:01 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133772"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:37:01 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:55 -0500
Message-Id: <c0823367a93b4b5b63e36f03bc5222f85e947c57.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499887935.git.anibal.limon@linux.intel.com>
References: <cover.1499887935.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 09/29] oeqa/core/tests: Update test_loader threaded to cover main thread usage
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
X-List-Received-Date: Wed, 12 Jul 2017 19:37:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/tests/test_loader.py | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/meta/lib/oeqa/core/tests/test_loader.py b/meta/lib/oeqa/core/tests/test_loader.py
index e0d917d317d..c4d5eeb462b 100755
--- a/meta/lib/oeqa/core/tests/test_loader.py
+++ b/meta/lib/oeqa/core/tests/test_loader.py
@@ -88,25 +88,28 @@ class TestLoader(TestBase):
         self.cases_path = [os.path.join(self.cases_path, 'loader', 'threaded')]
 
         tc = self._testLoaderThreaded()
-        self.assertEqual(len(tc.suites), 3, "Expected to be 3 suites")
+        self.assertTrue(len(tc.suites['main']._tests),
+                "Expected to have tests in main suite")
+        self.assertEqual(len(tc.suites['pool']), 2,
+                "Expected to be 2 suites in pool")
 
         case_ids = ['threaded.ThreadedTest.test_threaded_no_depends',
                 'threaded.ThreadedTest2.test_threaded_same_module',
                 'threaded_depends.ThreadedTest3.test_threaded_depends']
-        for case in tc.suites[0]._tests:
+        for case in tc.suites['main']._tests:
             self.assertEqual(case.id(),
-                    case_ids[tc.suites[0]._tests.index(case)])
+                    case_ids[tc.suites['main']._tests.index(case)])
 
         case_ids = ['threaded_alone.ThreadedTestAlone.test_threaded_alone']
-        for case in tc.suites[1]._tests:
+        for case in tc.suites['pool'][0]._tests:
             self.assertEqual(case.id(),
-                    case_ids[tc.suites[1]._tests.index(case)])
+                    case_ids[tc.suites['pool'][0]._tests.index(case)])
 
         case_ids = ['threaded_module.ThreadedTestModule.test_threaded_module',
                 'threaded_module.ThreadedTestModule2.test_threaded_module2']
-        for case in tc.suites[2]._tests:
+        for case in tc.suites['pool'][1]._tests:
             self.assertEqual(case.id(),
-                    case_ids[tc.suites[2]._tests.index(case)])
+                    case_ids[tc.suites['pool'][1]._tests.index(case)])
 
         self.cases_path = cases_path
 
-- 
2.11.0


