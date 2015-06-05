Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8E9667586D
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:11:06 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 05 Jun 2015 02:11:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="705795565"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 05 Jun 2015 02:11:08 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 953B46A4083;
	Fri,  5 Jun 2015 02:10:33 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:17:15 +0300
Message-Id: <1433488636-4540-9-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
References: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v2 8/9] wic: oe-selftest: Configure testing of gpt/UUID image
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
X-List-Received-Date: Fri, 05 Jun 2015 09:11:06 -0000

Added runtime dependency to gptfdisk-native to wic test suite to
be able to test modified directdisk-gpt with UUID support.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index e97dd1d..358f09e 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -39,7 +39,7 @@ class Wic(oeSelfTest):
     @classmethod
     def setUpClass(cls):
         """Build wic runtime dependencies and images used in the tests."""
-        bitbake('syslinux syslinux-native parted-native '
+        bitbake('syslinux syslinux-native parted-native gptfdisk-native '
                 'dosfstools-native mtools-native core-image-minimal')
 
     def setUp(self):
@@ -75,7 +75,7 @@ class Wic(oeSelfTest):
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
 
     def test06_gpt_image(self):
-        """Test creation of core-image-minimal with gpt table"""
+        """Test creation of core-image-minimal with gpt table and UUID boot"""
         self.assertEqual(0, runCmd("wic create directdisk-gpt "
                                    "--image-name core-image-minimal").status)
         self.assertEqual(1, len(glob(self.resultdir + "directdisk-*.direct")))
-- 
2.1.4


