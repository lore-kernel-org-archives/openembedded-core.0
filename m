Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 19EF371AEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Dec 2016 23:48:16 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 02 Dec 2016 15:48:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,289,1477983600"; d="scan'208";a="198457037"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga004.fm.intel.com with ESMTP; 02 Dec 2016 15:48:16 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 7A8B66A4080;
	Fri,  2 Dec 2016 15:47:31 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  3 Dec 2016 01:48:06 +0200
Message-Id: <1480722486-28719-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH] selftest: wic: fix test_qemu
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
X-List-Received-Date: Fri, 02 Dec 2016 23:48:18 -0000

Setting WKS_FILE variable in qemux86-64 made wic test to
use wrong wks file to produce an image and resulted in
test_qemu failure.

Used conditional assignment in qemux86-64 and explicitly
set WKS_FILE in wic testing suite to make the suite to use
wic-image-minimal.wsk. This should fix test_qemu failure.

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta/conf/machine/qemux86-64.conf | 2 +-
 meta/lib/oeqa/selftest/wic.py     | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/conf/machine/qemux86-64.conf b/meta/conf/machine/qemux86-64.conf
index 7559724..3117ca1 100644
--- a/meta/conf/machine/qemux86-64.conf
+++ b/meta/conf/machine/qemux86-64.conf
@@ -29,5 +29,5 @@ MACHINE_FEATURES += "x86"
 
 MACHINE_ESSENTIAL_EXTRA_RDEPENDS += "v86d"
 
-WKS_FILE = "directdisk.wks"
+WKS_FILE ?= "directdisk.wks"
 do_image_wic[depends] += "syslinux:do_build syslinux-native:do_populate_sysroot mtools-native:do_populate_sysroot dosfstools-native:do_populate_sysroot"
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index faac11e..e652fad 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -42,7 +42,8 @@ class Wic(oeSelfTest):
     def setUpLocal(self):
         """This code is executed before each test method."""
         self.write_config('IMAGE_FSTYPES += " hddimg"\n'
-                          'MACHINE_FEATURES_append = " efi"\n')
+                          'MACHINE_FEATURES_append = " efi"\n'
+                          'WKS_FILE = "wic-image-minimal"\n')
 
         # Do this here instead of in setUpClass as the base setUp does some
         # clean up which can result in the native tools built earlier in
-- 
2.1.4


