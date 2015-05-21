Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 0E6D474031
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 May 2015 10:01:38 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 21 May 2015 03:01:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,468,1427785200"; d="scan'208";a="574764925"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 21 May 2015 03:01:39 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 183926A4005;
	Thu, 21 May 2015 03:01:07 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 21 May 2015 11:07:58 +0300
Message-Id: <1432195678-6715-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] oe-selftest: Build wic runtime requirements and images before testing
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
X-List-Received-Date: Thu, 21 May 2015 10:01:41 -0000

Some native tools (syslinux, parted, mtools, etc) are required
by wic to produce images. Unit tests fail if the tools are
not available.

Baked tools and image-core-minimal used by wic before running tests.

[YOCTO #7730]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index c628b59..817685d 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -36,6 +36,12 @@ class Wic(oeSelfTest):
 
     resultdir = "/var/tmp/wic/build/"
 
+    @classmethod
+    def setUpClass(cls):
+        """Build wic runtime dependencies and images used in the tests."""
+        runCmd('bitbake syslinux syslinux-native parted-native '
+               'dosfstools-native mtools-native core-image-minimal')
+
     def setUp(self):
         """This code is executed before each test method."""
         rmtree(self.resultdir, ignore_errors=True)
-- 
2.1.4


