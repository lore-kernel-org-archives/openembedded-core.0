Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id B99D077BE4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:05 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467458"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:06 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:09 -0500
Message-Id: <3138eb79c8834f75fc4dcfaa2aaee829f2f90250.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 01/30] oeqa/core/loader: Generate function _make_failed_test dynamically
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:05 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python versions has different features from branches 3.4.x, 3.5.x and
3.6.x, i expected in wrong mode that was incremental for example changes
in 3.4.4 be in 3.5.x but that's not true.

The _make_failed_test internal method differs and is only available in
certain versions >= 3.4.4 and in 3.5.x and 3.6.x branches but not
realeses have been made including it.

So to avoid futher problems inspect the _make_failed_test and generates
function definition according what parameters are needed, the unique
supossition is that exception argument is always passed.

Related to,
http://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?id=d8380d098a290510b442a7abd2dd5a50cabf5844

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 80e3d2800cd..e4c218b57f0 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -4,6 +4,7 @@
 import os
 import sys
 import unittest
+import inspect
 
 from oeqa.core.utils.path import findFile
 from oeqa.core.utils.test import getSuiteModules, getCaseID
@@ -12,19 +13,17 @@ from oeqa.core.case import OETestCase
 from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
         OETestFilter, OETestDiscover
 
-if sys.version_info >= (3,4,4):
-    def _make_failed_test(classname, methodname, exception, suiteClass):
-        """
-            When loading tests, the unittest framework stores any exceptions and
-            displays them only when the 'run' method is called.
-
-            For our purposes, it is better to raise the exceptions in the loading
-            step rather than waiting to run the test suite.
-        """
-        raise exception
-else:
-    def _make_failed_test(classname, exception, suiteClass):
-        raise exception
+# When loading tests, the unittest framework stores any exceptions and
+# displays them only when the run method is called.
+#
+# For our purposes, it is better to raise the exceptions in the loading
+# step rather than waiting to run the test suite.
+#
+# Generate the function definition because this differ across python versions
+# Python >= 3.4.4 uses tree parameters instead four but for example Python 3.5.3
+# ueses four parameters so isn't incremental.
+_failed_test_args = inspect.getargspec(unittest.loader._make_failed_test).args
+exec("""def _make_failed_test(%s): raise exception""" % ', '.join(_failed_test_args))
 unittest.loader._make_failed_test = _make_failed_test
 
 def _find_duplicated_modules(suite, directory):
-- 
2.11.0


