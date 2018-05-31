Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4CAB574F09
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 08:31:09 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w4V8UipJ007674
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 May 2018 01:30:59 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Thu, 31 May 2018 01:30:33 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 31 May 2018 16:32:48 +0800
Message-ID: <23d9ef25030216df5bcfeccfe6dcf12defc53648.1527755434.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1527755434.git.Qi.Chen@windriver.com>
References: <cover.1527755434.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/14] oeqa/core/loader.py: support the 'auto' keyword
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
X-List-Received-Date: Thu, 31 May 2018 08:31:09 -0000
Content-Type: text/plain

In previous OEQA, having 'auto' in TEST_SUITES results in executing
as many test cases as possible.

This behaviour is broken for now. From the codes in core/loader.py,
I can see that it tries to use another keyword 'all'. But in fact,
it does not work.

I've checked the current manual. The manual says using 'auto'.
Below is the current information in manual.

  """
  Alternatively, you can provide the "auto" option to have all applicable
  tests run against the image.

  TEST_SUITES_append = " auto"
  """

So we should restore this behaviour. This patch does so.

Also, output warning message is some module is named as 'auto', as this
is a reserved keyword.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/lib/oeqa/core/loader.py | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index a4744de..98fc0f6 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -155,7 +155,16 @@ class OETestLoader(unittest.TestLoader):
         class_name = case.__class__.__name__
         test_name = case._testMethodName
 
-        if self.modules:
+        # 'auto' is a reserved key word to run test cases automatically
+        # warn users if their test case belong to a module named 'auto'
+        if module_name_small == "auto":
+            bb.warn("'auto' is a reserved key word for TEST_SUITES. "
+                    "But test case '%s' is detected to belong to auto module. "
+                    "Please condier using a new name for your module." % str(case))
+
+        # check if case belongs to any specified module
+        # if 'auto' is specified, such check is skipped
+        if self.modules and not 'auto' in self.modules:
             module = None
             try:
                 module = self.modules[module_name_small]
@@ -245,7 +254,7 @@ class OETestLoader(unittest.TestLoader):
         for tcName in testCaseNames:
             case = self._getTestCase(testCaseClass, tcName)
             # Filer by case id
-            if not (self.tests and not 'all' in self.tests
+            if not (self.tests and not 'auto' in self.tests
                     and not getCaseID(case) in self.tests):
                 self._handleTestCaseDecorators(case)
 
@@ -309,14 +318,14 @@ class OETestLoader(unittest.TestLoader):
         module_name = module.__name__
 
         # Normal test modules are loaded if no modules were specified,
-        # if module is in the specified module list or if 'all' is in
+        # if module is in the specified module list or if 'auto' is in
         # module list.
         # Underscore modules are loaded only if specified in module list.
         load_module = True if not module_name.startswith('_') \
                               and (not self.modules \
                                    or module_name in self.modules \
                                    or module_name_small in self.modules \
-                                   or 'all' in self.modules) \
+                                   or 'auto' in self.modules) \
                            else False
 
         load_underscore = True if module_name.startswith('_') \
-- 
1.9.1


