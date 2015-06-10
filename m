Return-Path: <george.l.musat@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87E9B6AC36
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Jun 2015 10:55:27 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 10 Jun 2015 03:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,587,1427785200"; d="scan'208";a="744208149"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 10 Jun 2015 03:55:10 -0700
Received: from localhost.localdomain (unknown [10.237.112.173])
	by linux.intel.com (Postfix) with ESMTP id 6FA066A4005;
	Wed, 10 Jun 2015 03:54:35 -0700 (PDT)
From: Lucian Musat <george.l.musat@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Jun 2015 13:52:40 +0300
Message-Id: <1433933560-24318-1-git-send-email-george.l.musat@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oeqa/utils: Added timeout decorator for testcases.
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
X-List-Received-Date: Wed, 10 Jun 2015 10:55:28 -0000

Signed-off-by: Lucian Musat <george.l.musat@intel.com>
---
 meta/lib/oeqa/utils/decorators.py | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/meta/lib/oeqa/utils/decorators.py b/meta/lib/oeqa/utils/decorators.py
index 61a1a73..b9fc76c 100644
--- a/meta/lib/oeqa/utils/decorators.py
+++ b/meta/lib/oeqa/utils/decorators.py
@@ -11,6 +11,8 @@ import logging
 import sys
 import unittest
 import threading
+import signal
+from functools import wraps
 
 #get the "result" object from one of the upper frames provided that one of these upper frames is a unittest.case frame
 class getResults(object):
@@ -160,3 +162,27 @@ def LogResults(original_class):
 
     original_class.run = run
     return original_class
+
+class TimeOut(BaseException):
+    pass
+
+def timeout(seconds):
+    def decorator(fn):
+        if hasattr(signal, 'alarm'):
+            @wraps(fn)
+            def wrapped_f(*args, **kw):
+                current_frame = sys._getframe()
+                def raiseTimeOut(signal, frame):
+                    if frame is not current_frame:
+                        raise TimeOut('%s seconds' % seconds)
+                prev_handler = signal.signal(signal.SIGALRM, raiseTimeOut)
+                try:
+                    signal.alarm(seconds)
+                    return fn(*args, **kw)
+                finally:
+                    signal.alarm(0)
+                    signal.signal(signal.SIGALRM, prev_handler)
+            return wrapped_f
+        else:
+            return fn
+    return decorator
\ No newline at end of file
-- 
2.1.4


