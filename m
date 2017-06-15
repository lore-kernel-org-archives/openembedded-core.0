Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5FBA2783FC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Jun 2017 22:09:54 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 15 Jun 2017 15:09:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.39,345,1493708400"; d="scan'208";a="1141724381"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.121])
	by orsmga001.jf.intel.com with ESMTP; 15 Jun 2017 15:09:52 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 15 Jun 2017 17:09:49 -0500
Message-Id: <1497564590-18707-2-git-send-email-anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1497564590-18707-1-git-send-email-anibal.limon@linux.intel.com>
References: <1497564590-18707-1-git-send-email-anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] oeqa/core/loader.py: Fix _make_failed_test for python >= 3.4.4
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
X-List-Received-Date: Thu, 15 Jun 2017 22:09:54 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Python unittest change the signature of the _make_failed_test
after python 3.4.4 don't pass the method name.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/loader.py | 22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

diff --git a/meta/lib/oeqa/core/loader.py b/meta/lib/oeqa/core/loader.py
index 229f094..80e3d28 100644
--- a/meta/lib/oeqa/core/loader.py
+++ b/meta/lib/oeqa/core/loader.py
@@ -12,15 +12,19 @@ from oeqa.core.case import OETestCase
 from oeqa.core.decorator import decoratorClasses, OETestDecorator, \
         OETestFilter, OETestDiscover
 
-def _make_failed_test(classname, methodname, exception, suiteClass):
-    """
-        When loading tests, the unittest framework stores any exceptions and
-        displays them only when the 'run' method is called.
-
-        For our purposes, it is better to raise the exceptions in the loading
-        step rather than waiting to run the test suite.
-    """
-    raise exception
+if sys.version_info >= (3,4,4):
+    def _make_failed_test(classname, methodname, exception, suiteClass):
+        """
+            When loading tests, the unittest framework stores any exceptions and
+            displays them only when the 'run' method is called.
+
+            For our purposes, it is better to raise the exceptions in the loading
+            step rather than waiting to run the test suite.
+        """
+        raise exception
+else:
+    def _make_failed_test(classname, exception, suiteClass):
+        raise exception
 unittest.loader._make_failed_test = _make_failed_test
 
 def _find_duplicated_modules(suite, directory):
-- 
2.1.4


