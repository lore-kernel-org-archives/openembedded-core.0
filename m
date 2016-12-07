Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id B835D71B52
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:31 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172567"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:33 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:12 -0600
Message-Id: <c618fe69fce3d2a436b5633c88cada094651d71b.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 07/32] oeqa/core/decorator: Add support for OETestDataDepends and skipIfDataVar
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

The OETestDataDepends decorator skips a test case if a variable
isn't into test data (d).

The skipIfDataVar decorator skips a test case if a variable
has certain value.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/data.py | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 meta/lib/oeqa/core/decorator/data.py

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
new file mode 100644
index 0000000..51ef6fe
--- /dev/null
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -0,0 +1,36 @@
+# Copyright (C) 2016 Intel Corporation
+# Released under the MIT license (see COPYING.MIT)
+
+from oeqa.core.exception import OEQAMissingVariable
+
+from . import OETestDecorator, registerDecorator
+
+@registerDecorator
+class skipIfDataVar(OETestDecorator):
+    """
+        Skip test based on value of a data store's variable.
+
+        It will get the info of var from the data store and will
+        check it against value; if are equal it will skip the test
+        with msg as the reason.
+    """
+
+    attrs = ('var', 'value', 'msg')
+
+    def setUpDecorator(self):
+        msg = 'Checking if %r value is %r to skip test' % (self.var, self.value)
+        self.logger.debug(msg)
+        if self.case.tc.d.get(self.var) == self.value:
+            self.case.skipTest(self.msg)
+
+@registerDecorator
+class OETestDataDepends(OETestDecorator):
+    attrs = ('data_depends',)
+
+    def setUpDecorator(self):
+        for v in self.data_depends:
+            try:
+                value = self.case.d[v]
+            except KeyError:
+                raise OEQAMissingVariable("Test case need %s variable but"\
+                        " isn't into d" % v)
-- 
2.1.4


