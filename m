Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E7FC378307
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:30 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887714"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:31 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:40 -0500
Message-Id: <097a5cd7c1162ae6e42263de2a38b009f1f9dab8.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 14/36] oeqa/core/decorator/oetimeout: Add support for OEQA threaded mode
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
X-List-Received-Date: Fri, 26 May 2017 20:38:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In python signals are only allowed to delivery into the main thread,
to support the threading mode test if the runner is threaded and
use threading.Timer instead.

There are some considerations like SIGALRM interrupts the execution
after N seconds but the Timer only starts a Thread to notice the
timeout and the exception will be raised when the test run ends.

[YOCTO #11450]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/oetimeout.py | 40 +++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
index a247583..f85e7d9 100644
--- a/meta/lib/oeqa/core/decorator/oetimeout.py
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -1,8 +1,12 @@
 # Copyright (C) 2016 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
-import signal
 from . import OETestDecorator, registerDecorator
+
+import signal
+from threading import Timer
+
+from oeqa.core.threaded import OETestRunnerThreaded
 from oeqa.core.exception import OEQATimeoutError
 
 @registerDecorator
@@ -10,16 +14,32 @@ class OETimeout(OETestDecorator):
     attrs = ('oetimeout',)
 
     def setUpDecorator(self):
-        timeout = self.oetimeout
-        def _timeoutHandler(signum, frame):
-            raise OEQATimeoutError("Timed out after %s "
+        self.logger.debug("Setting up a %d second(s) timeout" % self.oetimeout)
+
+        if isinstance(self.case.tc.runner, OETestRunnerThreaded):
+            self.timeouted = False
+            def _timeoutHandler():
+                self.timeouted = True
+
+            self.timer = Timer(self.oetimeout, _timeoutHandler)
+            self.timer.start()
+        else:
+            timeout = self.oetimeout
+            def _timeoutHandler(signum, frame):
+                raise OEQATimeoutError("Timed out after %s "
                     "seconds of execution" % timeout)
 
-        self.logger.debug("Setting up a %d second(s) timeout" % self.oetimeout)
-        self.alarmSignal = signal.signal(signal.SIGALRM, _timeoutHandler)
-        signal.alarm(self.oetimeout)
+            self.alarmSignal = signal.signal(signal.SIGALRM, _timeoutHandler)
+            signal.alarm(self.oetimeout)
 
     def tearDownDecorator(self):
-        signal.alarm(0)
-        signal.signal(signal.SIGALRM, self.alarmSignal)
-        self.logger.debug("Removed SIGALRM handler")
+        if isinstance(self.case.tc.runner, OETestRunnerThreaded):
+            self.timer.cancel()
+            self.logger.debug("Removed Timer handler")
+            if self.timeouted:
+                raise OEQATimeoutError("Timed out after %s "
+                    "seconds of execution" % self.oetimeout)
+        else:
+            signal.alarm(0)
+            signal.signal(signal.SIGALRM, self.alarmSignal)
+            self.logger.debug("Removed SIGALRM handler")
-- 
2.1.4


