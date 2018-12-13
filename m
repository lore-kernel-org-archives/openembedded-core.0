Return-Path: <akuster808@gmail.com>
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3B6C579D7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 21:39:36 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id c72so1736260pfc.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 13:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=5X5fFSOxhzyx79RaJzPZtIus8U0792flCv81fb8oXaw=;
	b=ETq+RRlUXIo/Anav75P3hX8Gmodd2PLIIkcG9M2T+qAwGsouUaemrKpj/64E/W/aBU
	2tpAVDz7tJX8PdX+W7tvHJTNFqf9NTFSq264dcfZQXuhld//YhoLgkH6KXaMPvn7oL53
	IamJ3nXJZzdxqCEd6j8+EzDyJKgJbbC60wCYAV59GRTjSh5uqp8ISTdsdChu9STJAu7R
	xiNTYMxPIf2jV6XkKodfeq45QXYJrLJ0tzGoZOS7wcIGPBUmMphZEWxB7wBNz0QUerBG
	PhxIV0FcsSnBZ36wT5F4vrvw5BvlnecxFaybFaO9WgsF7yMAGEdc4u3AwspWKZEZsqIO
	LheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=5X5fFSOxhzyx79RaJzPZtIus8U0792flCv81fb8oXaw=;
	b=PrGYew7wwu3CBeGK4slEDqIxwjfIcr2CkwBWyeU9znZF+OKcHHAaVqUBzeqyxEN+PN
	+UoxViJlwy8RIiZW2jbeWNFRXdG/xlXnM+IwluRF3PDMW03XBvuvEXO8XKB38qw7uvU1
	gpYEKvPa1eDRgtjDY4Ck8WVZB9sPy3nKoQowrQ7iWS4Eu7nk4dXOwpfkbbAQvIsaUpzC
	i0jinh2X5XajTfK6qY6do0uMONkodpI6o3o06pjVWJXouy/5W657DmRCOUJ+das46lfc
	caSJKGqgZtkJ4za2hQh0FZNIHdxvTy4U34UKbcRoD9zE+V/8h/3yh9JutOfrJ4XOP9dC
	X0Aw==
X-Gm-Message-State: AA+aEWZmw6VjTxiITuf+XjgVbKOqOqtEIok+eVtsVr2M2A2yVpkM0IIF
	we+h6f8cFYvnycxRAPdenJKmZceM
X-Google-Smtp-Source: AFSGD/VtQvDvq3snEF9I1Y0dQlwyQJp63G3ou30HpaFHVKXfl5QmQU+ZZXP4WER7HYCzGA5uSYRlBA==
X-Received: by 2002:a63:a452:: with SMTP id c18mr433343pgp.204.1544737177191; 
	Thu, 13 Dec 2018 13:39:37 -0800 (PST)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:79af:1f36:1822:3801])
	by smtp.gmail.com with ESMTPSA id
	b9sm3288912pfi.118.2018.12.13.13.39.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 13 Dec 2018 13:39:36 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org,
	akuster808@gmail.com
Date: Thu, 13 Dec 2018 13:38:38 -0800
Message-Id: <9e5facf3c5f4b128d893ee671b3bd70e5049cf79.1544735897.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1544735897.git.akuster808@gmail.com>
References: <cover.1544735897.git.akuster808@gmail.com>
Subject: [PATCH 30/45] oeqa/core/runner: refactor for OEQA to write json testresult
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
X-List-Received-Date: Thu, 13 Dec 2018 21:39:36 -0000

From: Yeoh Ee Peng <ee.peng.yeoh@intel.com>

Refactor the original _getDetailsNotPassed method to return
testresult details (test status and log), which will be reused
by future OEQA code to write json testresult.

Take the opportunity to consolidate and simplify the logic used
to gather test status and log within the TestResult instance.

(From OE-Core rev: 79ee7d1c371a86edeb61c99679985118da657e5d)

(From OE-Core rev: bc444181f9658423856621b2f2c60364642ae5b1)

Signed-off-by: Yeoh Ee Peng <ee.peng.yeoh@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/lib/oeqa/core/runner.py | 70 ++++++++++++++++++--------------------------
 1 file changed, 29 insertions(+), 41 deletions(-)

diff --git a/meta/lib/oeqa/core/runner.py b/meta/lib/oeqa/core/runner.py
index 429c216..a7b7463 100644
--- a/meta/lib/oeqa/core/runner.py
+++ b/meta/lib/oeqa/core/runner.py
@@ -61,40 +61,43 @@ class OETestResult(_TestResult):
         else:
             msg = "%s - FAIL - Required tests failed" % component
         skipped = len(self.skipped)
-        if skipped: 
+        if skipped:
             msg += " (skipped=%d)" % skipped
         self.tc.logger.info(msg)
 
-    def _getDetailsNotPassed(self, case, type, desc):
-        found = False
+    def _getTestResultDetails(self, case):
+        result_types = {'failures': 'FAILED', 'errors': 'ERROR', 'skipped': 'SKIPPED',
+                        'expectedFailures': 'EXPECTEDFAIL', 'successes': 'PASSED'}
 
-        for (scase, msg) in getattr(self, type):
-            if case.id() == scase.id():
-                found = True
-                break
-            scase_str = str(scase.id())
-
-            # When fails at module or class level the class name is passed as string
-            # so figure out to see if match
-            m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
-            if m:
-                if case.__class__.__module__ == m.group('module_name'):
+        for rtype in result_types:
+            found = False
+            for (scase, msg) in getattr(self, rtype):
+                if case.id() == scase.id():
                     found = True
                     break
+                scase_str = str(scase.id())
 
-            m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
-            if m:
-                class_name = "%s.%s" % (case.__class__.__module__,
-                        case.__class__.__name__)
+                # When fails at module or class level the class name is passed as string
+                # so figure out to see if match
+                m = re.search("^setUpModule \((?P<module_name>.*)\)$", scase_str)
+                if m:
+                    if case.__class__.__module__ == m.group('module_name'):
+                        found = True
+                        break
 
-                if class_name == m.group('class_name'):
-                    found = True
-                    break
+                m = re.search("^setUpClass \((?P<class_name>.*)\)$", scase_str)
+                if m:
+                    class_name = "%s.%s" % (case.__class__.__module__,
+                                            case.__class__.__name__)
+
+                    if class_name == m.group('class_name'):
+                        found = True
+                        break
 
-        if found:
-            return (found, msg)
+            if found:
+                return result_types[rtype], msg
 
-        return (found, None)
+        return 'UNKNOWN', None
 
     def addSuccess(self, test):
         #Added so we can keep track of successes too
@@ -106,17 +109,7 @@ class OETestResult(_TestResult):
         for case_name in self.tc._registry['cases']:
             case = self.tc._registry['cases'][case_name]
 
-            result_types = ['failures', 'errors', 'skipped', 'expectedFailures', 'successes']
-            result_desc = ['FAILED', 'ERROR', 'SKIPPED', 'EXPECTEDFAIL', 'PASSED']
-
-            fail = False
-            desc = None
-            for idx, name in enumerate(result_types):
-                (fail, msg) = self._getDetailsNotPassed(case, result_types[idx],
-                        result_desc[idx])
-                if fail:
-                    desc = result_desc[idx]
-                    break
+            (status, log) = self._getTestResultDetails(case)
 
             oeid = -1
             if hasattr(case, 'decorators'):
@@ -124,12 +117,7 @@ class OETestResult(_TestResult):
                     if hasattr(d, 'oeid'):
                         oeid = d.oeid
 
-            if fail:
-                self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, desc))
-            else:
-                self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(),
-                    oeid, 'UNKNOWN'))
+            self.tc.logger.info("RESULTS - %s - Testcase %s: %s" % (case.id(), oeid, status))
 
 class OEListTestsResult(object):
     def wasSuccessful(self):
-- 
2.7.4


