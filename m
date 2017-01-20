Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 271EF771E8
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567489"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:53 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:10 -0600
Message-Id: <b7a38eaad4015f2de9cb8824cd6110bd7209be09.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 39/55] oeqa/core/decorator: Add skipIfNotDataVar and skipIfNotInDataVar
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:53 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

skipIfNotDataVar will skip a test if a variable doesn't have certain value.

skipIfNotInDataVar will skip a test if a value is not in a certain variable.

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/data.py | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index fdeba9f..ff7bdd9 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -28,12 +28,46 @@ class skipIfDataVar(OETestDecorator):
     attrs = ('var', 'value', 'msg')
 
     def setUpDecorator(self):
-        msg = 'Checking if %r value is %r to skip test' % (self.var, self.value)
+        msg = ('Checking if %r value is %r to skip test' %
+               (self.var, self.value))
         self.logger.debug(msg)
         if self.case.td.get(self.var) == self.value:
             self.case.skipTest(self.msg)
 
 @registerDecorator
+class skipIfNotDataVar(OETestDecorator):
+    """
+        Skip test based on value of a data store's variable.
+
+        It will get the info of var from the data store and will
+        check it against value; if are not equal it will skip the
+        test with msg as the reason.
+    """
+
+    attrs = ('var', 'value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %r value is not %r to skip test' %
+               (self.var, self.value))
+        self.logger.debug(msg)
+        if not self.case.td.get(self.var) == self.value:
+            self.case.skipTest(self.msg)
+
+@registerDecorator
+class skipIfNotInDataVar(OETestDecorator):
+    """
+        Skip test if value is not in data store's variable.
+    """
+
+    attrs = ('var', 'value', 'msg')
+    def setUpDecorator(self):
+        msg = ('Checking if %r value is in %r to run '
+              'the test' % (self.var, self.value))
+        self.logger.debug(msg)
+        if not self.value in self.case.td.get(self.var):
+            self.case.skipTest(self.msg)
+
+@registerDecorator
 class OETestDataDepends(OETestDecorator):
     attrs = ('td_depends',)
 
-- 
2.1.4


