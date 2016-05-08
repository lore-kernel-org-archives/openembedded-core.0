Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9DF64731C6
	for <openembedded-core@lists.openembedded.org>;
	Sun,  8 May 2016 23:58:29 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 08 May 2016 16:58:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,598,1455004800"; d="scan'208";a="801873941"
Received: from hschan-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.140.99])
	by orsmga003.jf.intel.com with ESMTP; 08 May 2016 16:58:28 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 May 2016 11:58:11 +1200
Message-Id: <eb016e1073f3390514b97006c33b337fe526673e.1462751689.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1462751689.git.paul.eggleton@linux.intel.com>
References: <cover.1462751689.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1462751689.git.paul.eggleton@linux.intel.com>
References: <cover.1462751689.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] Drop unneeded LIC_FILES_CHKSUM values
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
X-List-Received-Date: Sun, 08 May 2016 23:58:29 -0000

With the changes to insane.bbclass we don't need LIC_FILES_CHKSUM to be
set for recipes that don't actually pull in any source.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta-selftest/recipes-test/images/test-empty-image.bb  | 1 -
 meta-selftest/recipes-test/images/wic-image-minimal.bb | 2 --
 meta/classes/core-image.bbclass                        | 5 +----
 meta/classes/packagegroup.bbclass                      | 3 ---
 meta/recipes-core/meta/meta-world-pkgdata.bb           | 1 -
 meta/recipes-graphics/images/core-image-directfb.bb    | 4 ----
 6 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/meta-selftest/recipes-test/images/test-empty-image.bb b/meta-selftest/recipes-test/images/test-empty-image.bb
index 7847f83..88d8d61 100644
--- a/meta-selftest/recipes-test/images/test-empty-image.bb
+++ b/meta-selftest/recipes-test/images/test-empty-image.bb
@@ -2,6 +2,5 @@ SUMMARY = "An empty image."
 IMAGE_INSTALL = ""
 IMAGE_LINGUAS = ""
 PACKAGE_INSTALL = ""
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 inherit image
diff --git a/meta-selftest/recipes-test/images/wic-image-minimal.bb b/meta-selftest/recipes-test/images/wic-image-minimal.bb
index 754689f..a294ba7 100644
--- a/meta-selftest/recipes-test/images/wic-image-minimal.bb
+++ b/meta-selftest/recipes-test/images/wic-image-minimal.bb
@@ -9,8 +9,6 @@ RM_OLD_IMAGE = "1"
 
 DEPENDS = "syslinux syslinux-native parted-native dosfstools-native mtools-native gptfdisk-native"
 
-LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 # core-image-minimal is referenced in .wks, so we need its rootfs
 # to be ready before our rootfs
 do_rootfs[depends] += "core-image-minimal:do_image core-image-minimal:do_rootfs_wicenv"
diff --git a/meta/classes/core-image.bbclass b/meta/classes/core-image.bbclass
index 705cad8..da51409 100644
--- a/meta/classes/core-image.bbclass
+++ b/meta/classes/core-image.bbclass
@@ -1,10 +1,7 @@
 # Common code for generating core reference images
 #
 # Copyright (C) 2007-2011 Linux Foundation
-
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
+#
 # IMAGE_FEATURES control content of the core reference images
 # 
 # By default we install packagegroup-core-boot and packagegroup-base-extended packages;
diff --git a/meta/classes/packagegroup.bbclass b/meta/classes/packagegroup.bbclass
index 3674894..3928c8a 100644
--- a/meta/classes/packagegroup.bbclass
+++ b/meta/classes/packagegroup.bbclass
@@ -15,9 +15,6 @@ PACKAGE_ARCH ?= "all"
 PACKAGE_ARCH_EXPANDED := "${PACKAGE_ARCH}"
 
 LICENSE ?= "MIT"
-LIC_FILES_CHKSUM ?= "${@oe.utils.ifelse(d.getVar('LICENSE', True) == 'MIT', \
-                     'file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420', \
-                    '')}"
 
 inherit ${@oe.utils.ifelse(d.getVar('PACKAGE_ARCH_EXPANDED', True) == 'all', 'allarch', '')}
 
diff --git a/meta/recipes-core/meta/meta-world-pkgdata.bb b/meta/recipes-core/meta/meta-world-pkgdata.bb
index b3989cd..81c8647 100644
--- a/meta/recipes-core/meta/meta-world-pkgdata.bb
+++ b/meta/recipes-core/meta/meta-world-pkgdata.bb
@@ -1,6 +1,5 @@
 SUMMARY = "Pulls in pkgdata for world"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM ?= "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
 
 INHIBIT_DEFAULT_DEPS = "1"
 
diff --git a/meta/recipes-graphics/images/core-image-directfb.bb b/meta/recipes-graphics/images/core-image-directfb.bb
index 5641195..c6ce658 100644
--- a/meta/recipes-graphics/images/core-image-directfb.bb
+++ b/meta/recipes-graphics/images/core-image-directfb.bb
@@ -1,10 +1,6 @@
 SUMMARY = "An image that uses DirectFB instead of X11"
 LICENSE = "MIT"
 
-
-LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=4d92cd373abda3937c2bc47fbc49d690 \
-                    file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-
 inherit core-image distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "directfb"
-- 
2.5.5


