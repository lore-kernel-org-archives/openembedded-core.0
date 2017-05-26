Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 410047830A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:50 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887840"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:50 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:48 -0500
Message-Id: <7678aa51322f83191f525159748d5e64e8ee8c6d.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 22/36] oeqa/core/README: Improve documentation
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
X-List-Received-Date: Fri, 26 May 2017 20:38:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Most of the text include on this text refactor came from [1].

[1] http://lists.openembedded.org/pipermail/openembedded-architecture/2016-December/000351.html

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/core/README | 81 +++++++++++++++++++++++++++++++++++------------
 1 file changed, 60 insertions(+), 21 deletions(-)

diff --git a/meta/lib/oeqa/core/README b/meta/lib/oeqa/core/README
index 0c859fd..f67dff7 100644
--- a/meta/lib/oeqa/core/README
+++ b/meta/lib/oeqa/core/README
@@ -1,38 +1,77 @@
-= OEQA Framework =
+= OEQA (v2) Framework =
 
 == Introduction ==
 
-This is the new OEQA framework the base clases of the framework
-are in this module oeqa/core the subsequent components needs to
-extend this classes.
+This is the new (version 2) OEQA framework. Base clases are located inside the
+'oeqa/core' folder and subsequent components needs to extend from these.
 
-A new/unique runner was created called oe-test and is under scripts/
-oe-test, this new runner scans over oeqa module searching for test
-components that supports OETestContextExecutor implemented in context
-module (i.e. oeqa/core/context.py).
+The main design consideration was to implement the needed functionality
+on top of Python unittest framework. To archive the latter, the following
+modules are present:
 
-For execute an example:
+    * oeqa/core/runner.py: Provides OETestResult and OETestRunner base
+      classes extending the unittest ones. This class has the support for
+      export results to different formats currently RAW and XML.
 
-$ source oe-init-build-env
-$ oe-test core
+    * oeqa/core/loader.py: Provides OETestLoader extending unittest ones,
+      also implements unified way for decorator support and for filtering test
+      cases.
 
-For list supported components:
+    * oeqa/core/case.py: Provides OETestCase base class extending
+      unittest.TestCase and provides access to the Test data (td), Test context
+      and Logger functionality.
 
-$ oe-test -h
+    * oeqa/core/decorator: Provides OETestDecorator a new class to implement
+      decorators for Test cases.
 
-== Create new Test component ==
+    * oeqa/core/context: Provides OETestContext a high-level API for
+      loadTests and runTests of certain Test component and
+      OETestContextExecutor a base class to enable oe-test to discover/use
+      the Test component.
 
-Usally for add a new Test component the developer needs to extend
-OETestContext/OETestContextExecutor in context.py and OETestCase in
-case.py.
+In the other hand, a new 'oe-test' runner is located under 'scripts', allowing scans for components
+that supports OETestContextExecutor (see below).
 
-== How to run the testing of the OEQA framework ==
+== Terminology ==
+
+    * Test component: The area of testing in the Project, for example: runtime, SDK, eSDK, selftest.
+
+    * Test data: Data associated with the Test component. Currently we use bitbake datastore as
+      a Test data input.
+
+    * Test context: A context of what tests needs to be run and how to do it, additionally provides
+      access to the Test data and could have custom methods, attrs.
+
+== oe-test ==
+
+The new tool oe-test (located at scripts) has the ability to scan the code base for test
+components and provide a unified way to run test cases. Internally it scans folders inside
+oeqa module in order to find specific classes that
+implements a test component.
+
+== Usage ==
+
+Executing the example test component
+
+    $ source oe-init-build-env
+    $ oe-test core
+
+Getting help
+
+    $ oe-test -h
+
+== Creating new Test Component ==
+
+Adding a new test component the developer needs to extend OETestContext/OETestContextExecutor
+(from context.py) and OETestCase (from case.py)
+
+== Selftesting the framework ==
 
 Run all tests:
 
-$ PATH=$PATH:../../ python3 -m unittest discover -s tests
+    $ PATH=$PATH:../../ python3 -m unittest discover -s tests
 
 Run some test:
 
-$ cd tests/
-$ ./test_data.py
+    $ cd tests/
+    $ ./test_data.py
-- 
2.1.4


