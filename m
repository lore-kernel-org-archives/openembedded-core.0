Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8656660797
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Nov 2016 20:52:50 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 24 Nov 2016 12:52:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,543,1473145200"; d="scan'208";a="1063828204"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.38])
	by orsmga001.jf.intel.com with ESMTP; 24 Nov 2016 12:52:51 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Thu, 24 Nov 2016 14:58:04 -0600
Message-Id: <f350c192196fcad1a06adbd757fbdbb1936abbf0.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<0da7db38df1c325040e9fa55ede5d5dbe0d24ae2.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1480020435.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH v2 04/13] selftest: buildoptions: skip read-only-image test depending on distro
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
X-List-Received-Date: Thu, 24 Nov 2016 20:52:50 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

Poky-tiny cannot build core-image-sato, so skip test (read-only-image)
in this case.

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 9487898..b228c56 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -43,6 +43,8 @@ class ImageOptionsTests(oeSelfTest):
 
     @testcase(1435)
     def test_read_only_image(self):
+        if self.distro == 'poky-tiny':
+            self.skipTest('core-image-sato is not buildable with poky-tiny')
         self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
         bitbake("core-image-sato")
         # do_image will fail if there are any pending postinsts
-- 
2.1.4


