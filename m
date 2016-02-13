Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 5BAD67680A
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 11:12:38 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 13 Feb 2016 03:12:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,440,1449561600"; d="scan'208";a="47336525"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 13 Feb 2016 03:12:37 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id BF8A86A4004
	for <openembedded-core@lists.openembedded.org>;
	Sat, 13 Feb 2016 04:00:28 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 13 Feb 2016 11:02:15 +0200
Message-Id: <79aff77d30926de3710482a704bd56ffa2515962.1455353103.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
In-Reply-To: <cover.1455353103.git.ed.bartosh@linux.intel.com>
References: <cover.1455353103.git.ed.bartosh@linux.intel.com>
Subject: [wic][PATCH v3 08/14] wic-image-minimal: change IMAGE_FSTYPES
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
X-List-Received-Date: Sat, 13 Feb 2016 11:12:38 -0000

Replaced wic.bz2 -> wic in the recipe.
Replaced wic.bz2 -> wic in oe-selftest test case.

wic-image-minimal is going to be booted in qemu and tested.
As runqemu doesn't support compressed images this recipe needs
to produce raw wic image.

(From OE-Core rev: 3ce91db94f4b921566dce0dc6f91a422009be06b)

Signed-off-by: Ed Bartosh <ed.bartosh@linux.intel.com>
---
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 +-
 meta/lib/oeqa/selftest/wic.py                          | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 95c7a9b..ced22c8 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -4,7 +4,7 @@ SRC_URI = "file://${FILE_DIRNAME}/${BPN}.wks"
 
 IMAGE_INSTALL = "packagegroup-core-boot ${ROOTFS_PKGMANAGE_BOOTSTRAP}"
 
-IMAGE_FSTYPES = "wic.bz2"
+IMAGE_FSTYPES = "wic"
 RM_OLD_IMAGE = "1"
 
 DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native"
diff --git a/meta/lib/oeqa/selftest/wic.py b/meta/lib/oeqa/selftest/wic.py
index df826ed..a739f69 100644
--- a/meta/lib/oeqa/selftest/wic.py
+++ b/meta/lib/oeqa/selftest/wic.py
@@ -228,7 +228,7 @@ class Wic(oeSelfTest):
         prefix = os.path.join(deploy_dir, 'wic-image-minimal-%s.' % machine)
         # check if we have result image and manifests symlinks
         # pointing to existing files
-        for suffix in ('wic.bz2', 'manifest'):
+        for suffix in ('wic', 'manifest'):
             path = prefix + suffix
             self.assertTrue(os.path.islink(path))
             self.assertTrue(os.path.isfile(os.path.realpath(path)))
-- 
2.1.4


