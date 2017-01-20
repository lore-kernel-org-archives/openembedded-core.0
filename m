Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id B2F45771E0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:51 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567482"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:52 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:07 -0600
Message-Id: <86a352484a694e1f41fef8c7a5d74423728e039e.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
Subject: [PATCH 36/55] oeqa/core/decorator/data.py: Add skipIfNotFeature decorator
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:51 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

This adds a new decorator to check if image under tests has
certain DISTRO_FEATURE or IMAGE_FEATURE.

[YOCTO #10234]

Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/core/decorator/data.py | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/meta/lib/oeqa/core/decorator/data.py b/meta/lib/oeqa/core/decorator/data.py
index 73cca88..fdeba9f 100644
--- a/meta/lib/oeqa/core/decorator/data.py
+++ b/meta/lib/oeqa/core/decorator/data.py
@@ -5,6 +5,16 @@ from oeqa.core.exception import OEQAMissingVariable
 
 from . import OETestDecorator, registerDecorator
 
+def has_feature(td, feature):
+    """
+        Checks for feature in DISTRO_FEATURES or IMAGE_FEATURES.
+    """
+
+    if (feature in td.get('DISTRO_FEATURES', '') or
+        feature in td.get('IMAGE_FEATURES', '')):
+        return True
+    return False
+
 @registerDecorator
 class skipIfDataVar(OETestDecorator):
     """
@@ -34,3 +44,21 @@ class OETestDataDepends(OETestDecorator):
             except KeyError:
                 raise OEQAMissingVariable("Test case need %s variable but"\
                         " isn't into td" % v)
+
+@registerDecorator
+class skipIfNotFeature(OETestDecorator):
+    """
+        Skip test based on DISTRO_FEATURES.
+
+        value must be in distro features or it will skip the test
+        with msg as the reason.
+    """
+
+    attrs = ('value', 'msg')
+
+    def setUpDecorator(self):
+        msg = ('Checking if %s is in DISTRO_FEATURES '
+               'or IMAGE_FEATURES' % (self.value))
+        self.logger.debug(msg)
+        if not has_feature(self.case.td, self.value):
+            self.case.skipTest(self.msg)
-- 
2.1.4


