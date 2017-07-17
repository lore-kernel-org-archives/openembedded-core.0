Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id C792877E4A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Jul 2017 21:45:26 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 17 Jul 2017 14:45:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,375,1496127600"; d="scan'208";a="1152467619"
Received: from unknown (HELO alimonb-mobl1.zpn.intel.com) ([10.219.128.142])
	by orsmga001.jf.intel.com with ESMTP; 17 Jul 2017 14:45:27 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 17 Jul 2017 16:45:24 -0500
Message-Id: <a605d55131209dd507e35340e295f05187bc3d61.1500327589.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1500327589.git.anibal.limon@linux.intel.com>
References: <cover.1500327589.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv3 16/30] oeqa/selftest/cases: Use testlayer_path instead of call get_test_layer()
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
X-List-Received-Date: Mon, 17 Jul 2017 21:45:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The testlayer_path is set at init of selftest so isn't need to call
every time get_test_layer to get it.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py | 2 +-
 meta/lib/oeqa/selftest/cases/devtool.py             | 4 ++--
 meta/lib/oeqa/selftest/cases/oescripts.py           | 2 +-
 meta/lib/oeqa/selftest/cases/sstate.py              | 2 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py         | 2 +-
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
index 0e5896234c3..b42aa3638d5 100644
--- a/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
+++ b/meta/lib/oeqa/selftest/cases/_sstatetests_noauto.py
@@ -2,7 +2,7 @@ import os
 import shutil
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.selftest.cases.sstate import SStateBase
 
 
diff --git a/meta/lib/oeqa/selftest/cases/devtool.py b/meta/lib/oeqa/selftest/cases/devtool.py
index 88d69724f93..28c84679a17 100644
--- a/meta/lib/oeqa/selftest/cases/devtool.py
+++ b/meta/lib/oeqa/selftest/cases/devtool.py
@@ -8,7 +8,7 @@ import fnmatch
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.utils.commands import runCmd, bitbake, get_bb_var, create_temp_layer
-from oeqa.utils.commands import get_bb_vars, runqemu, get_test_layer
+from oeqa.utils.commands import get_bb_vars, runqemu
 from oeqa.core.decorator.oeid import OETestID
 
 class DevtoolBase(OESelftestTestCase):
@@ -1530,7 +1530,7 @@ class DevtoolTests(DevtoolBase):
         # Ensure the recipe is where we think it should be (so that cleanup doesn't trash things)
         self.assertIn('/meta/', recipedir)
         relpth = os.path.relpath(recipedir, os.path.join(get_bb_var('COREBASE'), 'meta'))
-        appenddir = os.path.join(get_test_layer(), relpth)
+        appenddir = os.path.join(self.testlayer_path, relpth)
         self.track_for_cleanup(appenddir)
         # Try finish to the original layer
         self.add_command_to_tearDown('rm -rf %s ; cd %s ; git checkout %s' % (recipedir, os.path.dirname(recipedir), recipedir))
diff --git a/meta/lib/oeqa/selftest/cases/oescripts.py b/meta/lib/oeqa/selftest/cases/oescripts.py
index 1ee753763ec..f7fe200cfac 100644
--- a/meta/lib/oeqa/selftest/cases/oescripts.py
+++ b/meta/lib/oeqa/selftest/cases/oescripts.py
@@ -1,6 +1,6 @@
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.selftest.cases.buildhistory import BuildhistoryBase
-from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import Command, runCmd, bitbake, get_bb_var
 from oeqa.core.decorator.oeid import OETestID
 
 class BuildhistoryDiffTests(BuildhistoryBase):
diff --git a/meta/lib/oeqa/selftest/cases/sstate.py b/meta/lib/oeqa/selftest/cases/sstate.py
index bc2fdbd8ccb..b8c2880ad06 100644
--- a/meta/lib/oeqa/selftest/cases/sstate.py
+++ b/meta/lib/oeqa/selftest/cases/sstate.py
@@ -6,7 +6,7 @@ import shutil
 
 import oeqa.utils.ftools as ftools
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_vars, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_vars
 
 
 class SStateBase(OESelftestTestCase):
diff --git a/meta/lib/oeqa/selftest/cases/sstatetests.py b/meta/lib/oeqa/selftest/cases/sstatetests.py
index 07a206824aa..4617d16d212 100644
--- a/meta/lib/oeqa/selftest/cases/sstatetests.py
+++ b/meta/lib/oeqa/selftest/cases/sstatetests.py
@@ -4,7 +4,7 @@ import glob
 import subprocess
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, get_test_layer
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var
 from oeqa.selftest.cases.sstate import SStateBase
 from oeqa.core.decorator.oeid import OETestID
 
-- 
2.11.0


