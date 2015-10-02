Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 567CB77084
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Oct 2015 13:03:22 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 02 Oct 2015 06:03:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,623,1437462000"; d="scan'208";a="656553554"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Oct 2015 06:03:22 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id B30C86A4083;
	Fri,  2 Oct 2015 06:02:25 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Oct 2015 16:03:17 +0300
Message-Id: <1443790997-7994-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] oe-selftest: wic: fix LocalSetup
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
X-List-Received-Date: Fri, 02 Oct 2015 13:03:23 -0000

Appended required features to build config every time
LocalSetup is run to ensure that core-image-minimal is not
rebuilt due to configuration changes.

This should fix test22_mkgummidisk and test23_mkefidisk testcases as
they depend on specific features set in LocalSetup.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/lib/oeqa/selftest/wic.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index 0a35935..7625505 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -48,10 +48,10 @@ class Wic(oeSelfTest):
 
     def setUpLocal(self):
         """This code is executed before each test method."""
+        features = 'IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(features)
         if not Wic.image_is_ready:
             # build core-image-minimal with required features
-            features = 'IMAGE_FSTYPES += " hddimg"\nMACHINE_FEATURES_append = " efi"\n'
-            self.append_config(features)
             bitbake('core-image-minimal')
             # set this class variable to avoid buiding image many times
             Wic.image_is_ready = True
-- 
2.1.4


