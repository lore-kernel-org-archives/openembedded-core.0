Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BDAC27275B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Dec 2014 16:10:07 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 23 Dec 2014 08:08:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.07,632,1413270000"; d="scan'208";a="628280274"
Received: from unknown (HELO peggleto-mobl5.ger.corp.intel.com)
	([10.255.13.178])
	by orsmga001.jf.intel.com with ESMTP; 23 Dec 2014 08:08:55 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 23 Dec 2014 16:08:45 +0000
Message-Id: <883d7199a7e40a805dd7df2cce2797ee7652c238.1419350817.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1419350817.git.paul.eggleton@linux.intel.com>
References: <cover.1419350817.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 4/7] oeqa/selftest: skip test_incremental_image_generation if not using rpm
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
X-List-Received-Date: Tue, 23 Dec 2014 16:10:09 -0000

We have just implemented incremental ipk image generation, but at the
moment this test doesn't support that, so skip it if not using rpm.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index a250cae..381741e 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -13,6 +13,9 @@ class ImageOptionsTests(oeSelfTest):
 
     @testcase(761)
     def test_incremental_image_generation(self):
+        image_pkgtype = get_bb_var("IMAGE_PKGTYPE")
+        if image_pkgtype != 'rpm':
+            self.skipTest('Not using RPM as main package format')
         bitbake("-c cleanall core-image-minimal")
         self.write_config('INC_RPM_IMAGE_GEN = "1"')
         self.append_config('IMAGE_FEATURES += "ssh-server-openssh"')
-- 
1.9.3


