Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id B81D865D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Sep 2015 00:10:45 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so5386975wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 17:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=thGAn5J+OgIYFkJpY5psqFyCRNDuGTlbaIeKdYR8CWE=;
	b=LKu4vVyZLYaIRj4kmWwTW7Li1XOac0wiJxDa5L8jG5F6XxTLOoGpVnq3hJut1eBQfu
	6QBbt6gORupquFIyvxQC1cD8IyBJ5rfacRG9W2LK36qufyqdARt4AfdwRfmLaroxFaDB
	TLH52YaDseDg8HhmiRA7q87BuI3P527MmMEUwCuT/BpiP8ZNxHY/mFhA3gfJTEzhwxZL
	N0oLfJdkrGIfJPqNQrpaqHySabAyvGefxO3/KbVZVe5ANaNG3Dqw2A4+xbVcPxyfLEcG
	o2aTNu48Rn2Ecu26gLzRFXagmguV5KpEugRnSjyvDc7AFGpVOcwtmfR6QD7Cyjs7cTE8
	f9sA==
X-Received: by 10.180.85.74 with SMTP id f10mr1206957wiz.45.1442275845787;
	Mon, 14 Sep 2015 17:10:45 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	s16sm16868184wik.13.2015.09.14.17.10.43
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 17:10:44 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 17:10:37 -0700
Message-Id: <1442275837-23562-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] image.bbclass: add do_rootfs vardeps for {COMPRESS, IMAGE}_CMD_*
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
X-List-Received-Date: Tue, 15 Sep 2015 00:10:49 -0000

From: Christopher Larson <chris_larson@mentor.com>

We want do_rootfs to rerun if the fstype or compression commands or
dependencies change for any of our configured fstypes (IMAGE_FSTYPES).
IMAGE_TYPEDEP isn't explicitly handled, as it's traversed already, so the end
result will change if it does, and we only really care about the results, not
how we got there. This uses oe.image.Image()._get_image_types() to get the
info about the image and compression types in use.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fc7d64d..86a98bb 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -106,14 +106,30 @@ python () {
             d.setVarFlag(var, 'func', '1')
 }
 
+def fstype_variables(d):
+    import oe.image
+
+    image = oe.image.Image(d)
+    alltypes, fstype_groups, cimages = image._get_image_types()
+    fstype_vars = set()
+    for fstype_group in fstype_groups:
+        for fstype in fstype_group:
+            fstype_vars.add('IMAGE_CMD_' + fstype)
+            if fstype in cimages:
+                for ctype in cimages[fstype]:
+                    fstype_vars.add('COMPRESS_CMD_' + ctype)
+
+    return sorted(fstype_vars)
+
 def rootfs_variables(d):
     from oe.rootfs import variable_depends
-    variables = ['IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPEDEP_','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
+    variables = ['IMAGE_DEVICE_TABLES','BUILD_IMAGES_FROM_FEEDS','IMAGE_TYPES_MASKED','IMAGE_ROOTFS_ALIGNMENT','IMAGE_OVERHEAD_FACTOR','IMAGE_ROOTFS_SIZE','IMAGE_ROOTFS_EXTRA_SPACE',
                  'IMAGE_ROOTFS_MAXSIZE','IMAGE_NAME','IMAGE_LINK_NAME','IMAGE_MANIFEST','DEPLOY_DIR_IMAGE','RM_OLD_IMAGE','IMAGE_FSTYPES','IMAGE_INSTALL_COMPLEMENTARY','IMAGE_LINGUAS','SDK_OS',
                  'SDK_OUTPUT','SDKPATHNATIVE','SDKTARGETSYSROOT','SDK_DIR','SDK_VENDOR','SDKIMAGE_INSTALL_COMPLEMENTARY','SDK_PACKAGE_ARCHS','SDK_OUTPUT','SDKTARGETSYSROOT','MULTILIBRE_ALLOW_REP',
                  'MULTILIB_TEMP_ROOTFS','MULTILIB_VARIANTS','MULTILIBS','ALL_MULTILIB_PACKAGE_ARCHS','MULTILIB_GLOBAL_VARIANTS','BAD_RECOMMENDATIONS','NO_RECOMMENDATIONS','PACKAGE_ARCHS',
                  'PACKAGE_CLASSES','TARGET_VENDOR','TARGET_VENDOR','TARGET_ARCH','TARGET_OS','OVERRIDES','BBEXTENDVARIANT','FEED_DEPLOYDIR_BASE_URI','INTERCEPT_DIR','USE_DEVFS',
                  'COMPRESSIONTYPES', 'IMAGE_GEN_DEBUGFS']
+    variables.extend(fstype_variables(d))
     variables.extend(command_variables(d))
     variables.extend(variable_depends(d))
     return " ".join(variables)
-- 
2.2.1


