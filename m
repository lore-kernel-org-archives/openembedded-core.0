Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AE65A71BF9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:18:52 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2016 08:18:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496469"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:54 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:34 -0600
Message-Id: <fbfdc4bd93068049cca8b8ad5a11f79e1027dc9e.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481213961.git.anibal.limon@linux.intel.com>
References: <cover.1481213961.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv3 06/30] oeqa/core/decorator: Add support for OETimeout decorator
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
X-List-Received-Date: Thu, 08 Dec 2016 16:18:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Mariano Lopez <mariano.lopez@linux.intel.com>

The OETimeout provides support for specify certain timeout
in seconds for a test case, if the timeout is reach the SIGALRM
is sent and an exception is raised to notify the timeout.

[YOCTO #10235]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/oetimeout.py | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)
 create mode 100644 meta/lib/oeqa/core/decorator/oetimeout.py

diff --git a/meta/lib/oeqa/core/decorator/oetimeout.py b/meta/lib/oeqa/core/decorator/oetimeout.py
new file mode 100644
index 0000000..a247583
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/oetimeout.py
@@ -0,0 +1,25 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+import signal
+from . import OETestDecorator, registerDecorator
+from oeqa.core.exception import OEQATimeoutError
+
+@registerDecorator
+class OETimeout(OETestDecorator):
+    attrs = ('oetimeout',)
+
+    def setUpDecorator(self):
+        timeout = self.oetimeout
+        def _timeoutHandler(signum, frame):
+            raise OEQATimeoutError("Timed out after %s "
+                    "seconds of execution" % timeout)
+
+        self.logger.debug("Setting up a %d second(s) timeout" % self.oetimeout)
+        self.alarmSignal = signal.signal(signal.SIGALRM, _timeoutHandler)
+        signal.alarm(self.oetimeout)
+
+    def tearDownDecorator(self):
+        signal.alarm(0)
+        signal.signal(signal.SIGALRM, self.alarmSignal)
+        self.logger.debug("Removed SIGALRM handler")
-- 
2.1.4


