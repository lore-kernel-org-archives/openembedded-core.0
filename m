Return-Path: <corneliux.stoicescu@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 2518370EE6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Aug 2014 08:00:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 26 Aug 2014 01:00:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,402,1406617200"; d="scan'208";a="589898203"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 26 Aug 2014 01:00:16 -0700
Received: from localhost.localdomain (unknown [10.237.112.162])
	by linux.intel.com (Postfix) with ESMTP id 6BEA62C8001;
	Tue, 26 Aug 2014 00:59:35 -0700 (PDT)
From: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Aug 2014 13:05:43 +0300
Message-Id: <1409047544-7026-4-git-send-email-corneliux.stoicescu@intel.com>
X-Mailer: git-send-email 1.8.3.2
In-Reply-To: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
References: <1409047544-7026-1-git-send-email-corneliux.stoicescu@intel.com>
Subject: [PATCH 3/4] oeqa/oetest.py: enable sdk tests to use hasFeature and hasPackage methods.
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
X-List-Received-Date: Tue, 26 Aug 2014 08:00:34 -0000

In order to use the hasFeature and hasPackage methods, we need to make oeSDKTest extend oeTest and also set the test context (tc) attribute in the oeTest class when loading the tests.

Signed-off-by: Corneliu Stoicescu <corneliux.stoicescu@intel.com>
---
 meta/lib/oeqa/oetest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 5552c43..ed8b3b2 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -23,7 +23,7 @@ def loadTests(tc, type="runtime"):
         suite = unittest.TestSuite()
     elif type == "sdk":
         # set the context object passed from the test class
-        setattr(oeSDKTest, "tc", tc)
+        setattr(oeTest, "tc", tc)
     testloader = unittest.TestLoader()
     testloader.sortTestMethodsUsing = None
     suite = testloader.loadTestsFromNames(tc.testslist)
@@ -66,7 +66,7 @@ class oeRuntimeTest(oeTest):
         self.target = oeRuntimeTest.tc.target
         super(oeRuntimeTest, self).__init__(methodName)
 
-class oeSDKTest(unittest.TestCase):
+class oeSDKTest(oeTest):
     def __init__(self, methodName='runTest'):
         self.sdktestdir = oeSDKTest.tc.sdktestdir
         super(oeSDKTest, self).__init__(methodName)
-- 
1.8.3.2


