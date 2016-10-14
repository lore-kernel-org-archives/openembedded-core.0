Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3C8F4719FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2016 16:36:31 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP; 14 Oct 2016 09:36:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,493,1473145200"; d="scan'208";a="19705483"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.5.48])
	by orsmga005.jf.intel.com with ESMTP; 14 Oct 2016 09:36:32 -0700
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Oct 2016 11:40:28 -0500
Message-Id: <c41808ff150629815c3dc6cd6291ebcc305e6025.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
In-Reply-To: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
References: <cover.1476462963.git.leonardo.sandoval.gonzalez@linux.intel.com>
Subject: [PATCH 3/9] selftest: skip test_read_only_image on poky-tiny distro
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
X-List-Received-Date: Fri, 14 Oct 2016 16:36:31 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

The test test_read_only_image builds core-image-sato which
is not buildable in poky-tiny so skip it if this is the case.

[YOCTO #8525]

Signed-off-by: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
---
 meta/lib/oeqa/selftest/buildoptions.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/lib/oeqa/selftest/buildoptions.py b/meta/lib/oeqa/selftest/buildoptions.py
index 86e4836..fca541b 100644
--- a/meta/lib/oeqa/selftest/buildoptions.py
+++ b/meta/lib/oeqa/selftest/buildoptions.py
@@ -60,6 +60,8 @@ class ImageOptionsTests(oeSelfTest):
     @testcase(1435)
     def test_read_only_image(self):
         self.write_config('IMAGE_FEATURES += "read-only-rootfs"')
+        if self.distro == 'poky-tiny':
+            self.skipTest('core-image-sato is not buildable with poky-tiny')
         bitbake("core-image-sato")
         # do_image will fail if there are any pending postinsts
 
-- 
2.1.4


