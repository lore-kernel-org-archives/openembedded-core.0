Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 472767807A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Sep 2017 20:43:07 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 Sep 2017 13:43:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,441,1500966000"; d="scan'208";a="156343368"
Received: from scchinx-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.141.101])
	by fmsmga006.fm.intel.com with ESMTP; 26 Sep 2017 13:43:04 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Sep 2017 09:42:24 +1300
Message-Id: <030db676026ca3fc525399c0fcf9aa5edaf42748.1506458497.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1506458497.git.paul.eggleton@linux.intel.com>
References: <cover.1506458497.git.paul.eggleton@linux.intel.com>
Subject: [pyro][PATCH 1/2] image.bbclass: drop initramfs bundle related code
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
X-List-Received-Date: Tue, 26 Sep 2017 20:43:07 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The original purpose of this code snippet was to repackage initramfs
bundled kernel images before do_image_complete, to be able to be
included by rootfs, but it's not going to achieve that since the
initramfs bundled kernel images are not even installed to ${D}/boot
after commit a49569e3a7534779bbe3f01a0647fd076c95798d:
[ kernel.bbclass: do not copy bundled initramfs to /boot ]

So there is not a initramfs bundled kernel package at all, we should
drop the code, because it is leading kernel do_initramfs_bundle
unnecessarily rerun and it's very time consuming and hence is impacting
the performance a lot.

(From OE-Core master rev: eca501aeb4f2cc9255fabab14c68f6910367aaf9)

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/image.bbclass | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 9c9f14a..77e10a8 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -184,10 +184,6 @@ python () {
     d.setVar('IMAGE_FEATURES', ' '.join(sorted(list(remain_features))))
 
     check_image_features(d)
-    initramfs_image = d.getVar('INITRAMFS_IMAGE') or ""
-    if initramfs_image != "":
-        d.appendVarFlag('do_build', 'depends', " %s:do_bundle_initramfs" %  d.getVar('PN'))
-        d.appendVarFlag('do_bundle_initramfs', 'depends', " %s:do_image_complete" % initramfs_image)
 }
 
 IMAGE_CLASSES += "image_types"
@@ -609,11 +605,3 @@ do_package_write_ipk[noexec] = "1"
 do_package_write_deb[noexec] = "1"
 do_package_write_rpm[noexec] = "1"
 
-# Allow the kernel to be repacked with the initramfs and boot image file as a single file
-do_bundle_initramfs[depends] += "virtual/kernel:do_bundle_initramfs"
-do_bundle_initramfs[nostamp] = "1"
-do_bundle_initramfs[noexec] = "1"
-do_bundle_initramfs () {
-	:
-}
-addtask bundle_initramfs after do_image_complete
-- 
2.9.5


