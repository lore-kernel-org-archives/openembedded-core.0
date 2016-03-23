Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6BC5860616
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Mar 2016 11:29:25 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP; 23 Mar 2016 04:29:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,382,1455004800"; d="scan'208";a="917129048"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga001.jf.intel.com with ESMTP; 23 Mar 2016 04:29:25 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 6E41D6A4002;
	Wed, 23 Mar 2016 05:17:08 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Mar 2016 11:09:18 +0200
Message-Id: <1458724158-10490-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1458594701.20442.20.camel@linuxfoundation.org>
References: <1458594701.20442.20.camel@linuxfoundation.org>
Subject: [PATCH v2] image.bbclass: run wicenv task only for wic images
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
X-List-Received-Date: Wed, 23 Mar 2016 11:29:26 -0000

Currently do_wicenv task is run for all images. However, its
result is used only to produce wic image. It's better to
run this task only for wic images. If another rootfs is
required to produce wic image, dependency to its do_wicenv
must be added to the wic image recipy.

Stopped running do_wicenv for all images. Added explicit
dependency to this task in wic-image-minimal recipe.

[YOCTO #9095]

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 meta/classes/image.bbclass                             | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 9c50ddb..a294ba7 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -11,7 +11,7 @@ DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-nativ
 
 # core-image-minimal is referenced in .wks, so we need its rootfs
 # to be ready before our rootfs
-do_rootfs[depends] += "core-image-minimal:do_rootfs_wicenv"
+do_rootfs[depends] += "core-image-minimal:do_image core-image-minimal:do_rootfs_wicenv"
 
 IMAGE_ROOTFS_EXTRA_SPACE = "2000"
 
diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index 3ab432e..82a87a6 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -275,7 +275,7 @@ python do_rootfs_wicenv () {
             if value:
                 envf.write('%s="%s"\n' % (var, value.strip()))
 }
-addtask do_rootfs_wicenv after do_image before do_image_wic do_image_complete
+addtask do_rootfs_wicenv after do_image before do_image_wic
 do_rootfs_wicenv[vardeps] += "${WICVARS}"
 do_rootfs_wicenv[prefuncs] = 'set_image_size'
 
-- 
2.1.4


