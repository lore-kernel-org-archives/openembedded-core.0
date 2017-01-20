Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 18C48771EA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:37 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567348"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:37 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:38 -0600
Message-Id: <e0325258e343c979422a7ae3f942885528b7e7d5.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 07/55] oeqa/core/decorator: Add support for OETestDataDepends and skipIfDataVar
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:37 -0000
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
index 0000000..73cca88
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
+        if self.case.td.get(self.var) == self.value:
+            self.case.skipTest(self.msg)
+
+@registerDecorator
+class OETestDataDepends(OETestDecorator):
+    attrs = ('td_depends',)
+
+    def setUpDecorator(self):
+        for v in self.td_depends:
+            try:
+                value = self.case.td[v]
+            except KeyError:
+                raise OEQAMissingVariable("Test case need %s variable but"\
+                        " isn't into td" % v)
-- 
2.1.4


