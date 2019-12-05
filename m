Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BA9737F895
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2019 16:55:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id xB5GtKgt003487
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Thu, 5 Dec 2019 08:55:20 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Thu, 5 Dec 2019 08:55:20 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2019 11:55:19 -0500
Message-ID: <20191205165519.1670922-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [PATCH] oescripts.py: use unittest.SkipUnless for class skip
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
X-List-Received-Date: Thu, 05 Dec 2019 16:55:20 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Yocto Bug: https://bugzilla.yoctoproject.org/show_bug.cgi?id=13663

Prior to this fix, the try/except block in OEScriptTests' setUpClass
did both the import and the raise unittest.SkipTest for the
subsequent OEPybootchartguyTests. The consequence of the this meant
that, when cairo was not available on the test host, the raise was
counted only once as a class setup issue, instead of once for each
of the tests to be run, resulting in incorrect skip counts in the
test results.

Instead of raising unittest.SkipTest in setUpClass, the more
proper method is to use the unittest.skipUnless method along with
importlib.util.find_spec to check for the presence of the
python3-cairo module. This allows the entire class to be skipped
if cairo is not present, while also correctly passing along the
skip state for each of the class's tests, and avoiding the UNKNOWN
results to appear in cases where the -j option was provided to
oe-selftest, but the tests were still skipped.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta/lib/oeqa/selftest/cases/oescripts.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 41cbe04808..2f18d8f29c 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -4,6 +4,7 @@
 
 import os
 import shutil
+import importlib
 import unittest
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
@@ -33,15 +34,13 @@ class BuildhistoryDiffTests(BuildhistoryBase):
         if expected_endlines:
             self.fail('Missing expected line endings:\n  %s' % '\n  '.join(expected_endlines))
 
+@unittest.skipUnless(importlib.util.find_spec("cairo"), "Python cairo module is not present")
 class OEScriptTests(OESelftestTestCase):
 
     @classmethod
     def setUpClass(cls):
         super(OEScriptTests, cls).setUpClass()
-        try:
-            import cairo
-        except ImportError:
-            raise unittest.SkipTest('Python module cairo is not present')
+        import cairo
         bitbake("core-image-minimal -c rootfs -f")
         cls.tmpdir = get_bb_var('TMPDIR')
         cls.buildstats = cls.tmpdir + "/buildstats/" + sorted(os.listdir(cls.tmpdir + "/buildstats"))[-1]
-- 
2.23.0


