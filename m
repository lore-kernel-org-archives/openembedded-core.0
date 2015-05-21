Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7FE146E5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 12:17:28 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 21 May 2015 05:17:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="713620386"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 21 May 2015 05:17:29 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 02F816A4005;
	Thu, 21 May 2015 05:16:57 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 13:23:54 +0300
Message-Id: <1432203834-29718-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <2409378.FaPFWFNbiH@peggleto-mobl.ger.corp.intel.com>
References: <2409378.FaPFWFNbiH@peggleto-mobl.ger.corp.intel.com>
Subject: [PATCH v2] oe-selftest: Build wic runtime requirements and images before testing
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
X-List-Received-Date: Thu, 21 May 2015 12:17:29 -0000

Some native tools (syslinux, parted, mtools, etc) are required
by wic to produce images. Unit tests fail if the tools are
not available.

Baked tools and image-core-minimal used by wic before running tests.

[YOCTO #7730]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index c628b59..a2ce2cb 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -29,13 +29,19 @@ from glob import glob
 from shutil import rmtree
 
 from oeqa.selftest.base import oeSelfTest
-from oeqa.utils.commands import runCmd
+from oeqa.utils.commands import runCmd, bitbake
 
 class Wic(oeSelfTest):
     """Wic test class."""
 
     resultdir = "/var/tmp/wic/build/"
 
+    @classmethod
+    def setUpClass(cls):
+        """Build wic runtime dependencies and images used in the tests."""
+        bitbake('syslinux syslinux-native parted-native '
+                'dosfstools-native mtools-native core-image-minimal')
+
     def setUp(self):
         """This code is executed before each test method."""
         rmtree(self.resultdir, ignore_errors=True)
-- 
2.1.4


