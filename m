Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id ED975782DF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:39:19 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887974"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:39:18 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:38:02 -0500
Message-Id: <e48da35278f4373e3d8d28e6fe272cd0d9e096c5.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1495830706.git.anibal.limon@linux.intel.com>
References: <cover.1495830706.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 36/36] selftest: Migrate systemd_boot test case to the new framework
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
X-List-Received-Date: Fri, 26 May 2017 20:39:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

- systemd_boot.py: Use the new case class and change decorator for id
- __init__.py: Because isn't needed now

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta-yocto-bsp/lib/oeqa/selftest/__init__.py               |  0
 .../lib/oeqa/selftest/{ => cases}/systemd_boot.py          | 14 +++++---------
 2 files changed, 5 insertions(+), 9 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/__init__.py
 rename meta-yocto-bsp/lib/oeqa/selftest/{ => cases}/systemd_boot.py (91%)

diff --git a/meta-yocto-bsp/lib/oeqa/selftest/__init__.py b/meta-yocto-bsp/lib/oeqa/selftest/__init__.py
deleted file mode 100644
index e69de29..0000000
diff --git a/meta-yocto-bsp/lib/oeqa/selftest/systemd_boot.py b/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
similarity index 91%
rename from meta-yocto-bsp/lib/oeqa/selftest/systemd_boot.py
rename to meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
index f7f74db..848cdf7 100644
--- a/meta-yocto-bsp/lib/oeqa/selftest/systemd_boot.py
+++ b/meta-yocto-bsp/lib/oeqa/selftest/cases/systemd_boot.py
@@ -1,14 +1,10 @@
-from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
-from oeqa.utils.decorators import testcase
-import re
 import os
-import sys
-import logging
-
 
-class Systemdboot(oeSelfTest):
+from oeqa.selftest.case import OESelftestTestCase
+from oeqa.core.decorator.oeid import OETestID
+from oeqa.utils.commands import runCmd, bitbake, get_bb_var, runqemu
 
+class Systemdboot(OESelftestTestCase):
     def _common_setup(self):
         """
         Common setup for test cases: 1445, XXXX
@@ -28,7 +24,7 @@ class Systemdboot(oeSelfTest):
         bitbake('mtools-native core-image-minimal')
 
 
-    @testcase(1445)
+    @OETestID(1445)
     def test_efi_systemdboot_images_can_be_built(self):
         """
         Summary:     Check if systemd-boot images can be built correctly
-- 
2.1.4


