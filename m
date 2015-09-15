Return-Path: <george.l.musat@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 9247176710
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 15:14:11 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 15 Sep 2015 08:13:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,536,1437462000"; d="scan'208";a="562158977"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Sep 2015 08:13:48 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id ABAB76A4005;
	Tue, 15 Sep 2015 08:12:54 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Sep 2015 18:11:59 +0300
Message-Id: <1442329919-32413-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/decorators: Added decorator to restart the DUT in case of test hang.
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
X-List-Received-Date: Tue, 15 Sep 2015 15:14:12 -0000

Once the DUT is hanged during testing, currently all the following test
cases have to wait for default timeout to exit. Using this decorator the
user can choose a timeout at case by case basis and what happens when the
timeout is reached by overwriting the self.target.restart method.

[YOCTO #7853]

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/oetest.py           |  6 ++++++
 meta/lib/oeqa/utils/decorators.py | 25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/meta/lib/oeqa/oetest.py b/meta/lib/oeqa/oetest.py
index 0fe68d4..a6f89b6 100644
--- a/meta/lib/oeqa/oetest.py
+++ b/meta/lib/oeqa/oetest.py
@@ -151,6 +151,12 @@ class oeRuntimeTest(oeTest):
         elif (type(self.target).__name__ == "QemuTarget"):
             self.assertTrue(self.target.check(), msg = "Qemu not running?")
 
+        self.setUpLocal()
+
+    # a setup method before tests but after the class instantiation
+    def setUpLocal(self):
+        pass
+
     def tearDown(self):
         # If a test fails or there is an exception
         if not exc_info() == (None, None, None):
diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 162a88f..b6adcb1 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -220,3 +220,28 @@ def getAllTags(obj):
     ret = __gettags(obj)
     ret.update(__gettags(tc_method))
     return ret
+
+def timeout_handler(seconds):
+    def decorator(fn):
+        if hasattr(signal, 'alarm'):
+            @wraps(fn)
+            def wrapped_f(self, *args, **kw):
+                current_frame = sys._getframe()
+                def raiseTimeOut(signal, frame):
+                    if frame is not current_frame:
+                        try:
+                            self.target.restart()
+                            raise TimeOut('%s seconds' % seconds)
+                        except:
+                            raise TimeOut('%s seconds' % seconds)
+                prev_handler = signal.signal(signal.SIGALRM, raiseTimeOut)
+                try:
+                    signal.alarm(seconds)
+                    return fn(self, *args, **kw)
+                finally:
+                    signal.alarm(0)
+                    signal.signal(signal.SIGALRM, prev_handler)
+            return wrapped_f
+        else:
+            return fn
+    return decorator
-- 
2.1.4


