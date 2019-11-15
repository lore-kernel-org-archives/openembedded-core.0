Return-Path: <chee.yang.lee@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 426E77FA16
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Nov 2019 01:58:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Nov 2019 17:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.68,306,1569308400"; d="scan'208";a="257629552"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by FMSMGA003.fm.intel.com with ESMTP; 14 Nov 2019 17:58:49 -0800
From: chee.yang.lee@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Nov 2019 09:58:47 +0800
Message-Id: <1573783128-17519-1-git-send-email-chee.yang.lee@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 1/2] selftest/wic: test wic rm with -r flag
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
X-List-Received-Date: Fri, 15 Nov 2019 01:58:51 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

selftest to make sure wic rm with -r flag for ext partition
could remove directory and all its content.

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index ea75300..0c03b4b 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -1025,3 +1025,10 @@ class Wic2(WicTestCase):
         # check if it's removed
         result = runCmd("wic ls %s:2/etc/ -n %s" % (images[0], sysroot))
         self.assertTrue('fstab' not in [line.split()[-1] for line in result.output.split('\n') if line])
+
+        # remove non-empty directory
+        runCmd("wic rm -r %s:2/etc/ -n %s" % (images[0], sysroot))
+
+        # check if it's removed
+        result = runCmd("wic ls %s:2/ -n %s" % (images[0], sysroot))
+        self.assertTrue('etc' not in [line.split()[-1] for line in result.output.split('\n') if line])
-- 
2.7.4


