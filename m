Return-Path: <prvs=765f72d04=Richard.Leitner@skidata.com>
X-Greylist: delayed 591 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 22 Aug 2018 09:32:10 UTC
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 1A4C479007
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2018 09:32:10 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.53,273,1531778400"; 
   d="scan'208";a="1618928"
From: Richard Leitner <richard.leitner@skidata.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Aug 2018 11:22:52 +0200
Message-ID: <20180822092252.26067-1-richard.leitner@skidata.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: [PATCH] oeqa/core/decorator: add skipIfInDataVar
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
X-List-Received-Date: Wed, 22 Aug 2018 09:32:11 -0000
Content-Type: text/plain

skipIfInDataVar will skip a test if a value is in a certain variable.

Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
---
 meta/lib/oeqa/core/decorator/data.py | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 31c6dd6be7..f0f65abb39 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -54,6 +54,20 @@ class skipIfNotDataVar(OETestDecorator):
             self.case.skipTest(self.msg)
 
 @registerDecorator
+class skipIfInDataVar(OETestDecorator):
+    """
+        Skip test if value is in data store's variable.
+    """
+
+    attrs = ('var', 'value', 'msg')
+    def setUpDecorator(self):
+        msg = ('Checking if %r value contains %r to skip '
+              'the test' % (self.var, self.value))
+        self.logger.debug(msg)
+        if self.value in (self.case.td.get(self.var)):
+            self.case.skipTest(self.msg)
+
+@registerDecorator
 class skipIfNotInDataVar(OETestDecorator):
     """
         Skip test if value is not in data store's variable.
-- 
2.11.0


