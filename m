Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 112D578055
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:46 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279791"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:46 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:35 -0500
Message-Id: <0ba0ca75258dc5f62b1c79a7b87f85c136ca8ab7.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1499803885.git.anibal.limon@linux.intel.com>
References: <cover.1499803885.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 20/30] oeqa/selftest/cases: runqemu enable thraded runs
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- Update to use wrappers {bitbake,get_bb_var} from OESelfTestCase class.
- Run into the main thread because it needs tinfoil to run.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/selftest/cases/runqemu.py | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/runqemu.py b/meta/lib/oeqa/selftest/cases/runqemu.py
index 4050a4123ba..e30cb24046f 100644
--- a/meta/lib/oeqa/selftest/cases/runqemu.py
+++ b/meta/lib/oeqa/selftest/cases/runqemu.py
@@ -6,12 +6,11 @@ import re
 import logging
 
 from oeqa.selftest.case import OESelftestTestCase
-from oeqa.utils.commands import bitbake, runqemu, get_bb_var
+from oeqa.utils.commands import runqemu
 from oeqa.core.decorator.oeid import OETestID
 
 class RunqemuTests(OESelftestTestCase):
     """Runqemu test class"""
-
     image_is_ready = False
     deploy_dir_image = ''
 
@@ -37,8 +36,8 @@ SYSLINUX_TIMEOUT = "10"
         )
 
         if not RunqemuTests.image_is_ready:
-            RunqemuTests.deploy_dir_image = get_bb_var('DEPLOY_DIR_IMAGE')
-            bitbake(self.recipe)
+            RunqemuTests.deploy_dir_image = self.get_bb_var('DEPLOY_DIR_IMAGE')
+            self.bitbake(self.recipe)
             RunqemuTests.image_is_ready = True
 
     @OETestID(2001)
-- 
2.11.0


