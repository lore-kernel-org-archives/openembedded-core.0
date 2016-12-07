Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5185571B4F
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172564"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:32 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:11 -0600
Message-Id: <8f40cc770389026daa63e41c88c57d333304c453.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 06/32] oeqa/core/decorator: Add support for OETimeout decorator
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:31 -0000
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


