Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id AAD9A78350
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:11 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887945"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:12 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:59 -0500
Message-Id: <5da385cc47bc44bf5e43d4a6035a9fe0e4e7ba18.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 33/36] oeqa/selftest/case: Don't figure out the testlayer inside
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
X-List-Received-Date: Fri, 26 May 2017 20:39:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The test layer is added at init of selftest and is the same
across test runs so pass it as a attr in the context.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/case.py | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oeqa/selftest/case.py b/meta/lib/oeqa/selftest/case.py
index 1e6754a..31a11fd 100644
--- a/meta/lib/oeqa/selftest/case.py
+++ b/meta/lib/oeqa/selftest/case.py
@@ -9,7 +9,7 @@ import errno
 from unittest.util import safe_repr
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.core.case import OETestCase
 
 class OESelftestTestCase(OETestCase):
@@ -21,7 +21,6 @@ class OESelftestTestCase(OETestCase):
     local_bblayers_backup = os.path.join(builddir, "conf/bblayers.bk")
     testinc_bblayers_path = os.path.join(builddir, "conf/bblayers.inc")
     machineinc_path = os.path.join(builddir, "conf/machine.inc")
-    testlayer_path = get_test_layer()
 
     def __init__(self, methodName="runTest"):
         self._extra_tear_down_commands = []
@@ -35,6 +34,7 @@ class OESelftestTestCase(OETestCase):
     @classmethod
     def setUpClass(cls):
         super(OESelftestTestCase, cls).setUpClass()
+        cls.testlayer_path = cls.tc.testlayer_path
         cls.add_include()
 
     @classmethod
@@ -75,7 +75,7 @@ class OESelftestTestCase(OETestCase):
     def remove_inc_files(cls):
         try:
             os.remove(os.path.join(cls.builddir, "conf/selftest.inc"))
-            for root, _, files in os.walk(get_test_layer()):
+            for root, _, files in os.walk(cls.testlayer_path):
                 for f in files:
                     if f == 'test_recipe.inc':
                         os.remove(os.path.join(root, f))
-- 
2.1.4


