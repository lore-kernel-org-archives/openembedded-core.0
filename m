Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f173.google.com (mail-wi0-f173.google.com
	[209.85.212.173])
	by mail.openembedded.org (Postfix) with ESMTP id 6764C6E26B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 21:38:22 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so2514041wic.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Sep 2015 14:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=wDUUAQGuOhBc37DjTwA8v2O2FJgK+GheQp7zuebZGdo=;
	b=xQ/tXpv3PGNdvP5GCQxMi1iQdLNxOGrPd852m6/5oqcLzVNQ2BuqEMtP6VWczHEimo
	3woy7mNKmAPcl3+kjrTDRlZKVT3zD31gkx8/keNw48FYm4bQ4sXY0XUdr0E4BMeMJiTk
	ZRLC3eHZDmtcRWyBotqCtLoXhwfektDz9yzYCSKSuK/9JQN+QhGNZbol0z3OEWggO4zb
	rP0hAI0aorN0vXIQXyHEexZFFyvMO8To0iLZuyZisuKL2e7p/UYSWliRjdGbKZtmEXc9
	9/GoOt1uNtalKpg2niBxfNpYzPxOK7O8vYwB/q7CgJRj4uuZLf6rjrpnSdl+ORE2ZnWr
	to4Q==
X-Received: by 10.180.216.108 with SMTP id op12mr209009wic.43.1442266702197;
	Mon, 14 Sep 2015 14:38:22 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	ex8sm16414981wib.14.2015.09.14.14.38.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Sep 2015 14:38:21 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Sep 2015 14:38:16 -0700
Message-Id: <1442266696-6751-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] image.bbclass: add do_rootfs vardeps for IMAGE_{CMD, TYPEDEP}_*
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
X-List-Received-Date: Mon, 14 Sep 2015 21:38:24 -0000

From: Christopher Larson <chris_larson@mentor.com>

We want do_rootfs to rerun if the image commands or dependencies change for any of
our configured fstypes (IMGE_FSTYPES).

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/classes/image.bbclass | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
index fc7d64d..d81fa27 100644
--- a/meta/classes/image.bbclass
+++ b/meta/classes/image.bbclass
@@ -106,14 +106,36 @@ python () {
             d.setVarFlag(var, 'func', '1')
 }
 
+def fstype_variables(d):
+    fstype_vars = set()
+    fstypes = set(d.getVar('IMAGE_FSTYPES', True).split())
+    def _typedeps(fstype, seen):
+        if fstype in seen:
+            return
+
+        yield fstype
+        for typedep in (d.getVar('IMAGE_TYPEDEP_%s' % fstype, True) or "").split():
+            for _typedep in _typedeps(typedep, seen):
+                yield _typedep
+
+    seen = set()
+    for fstype in list(fstypes):
+        fstypes |= set(_typedeps(fstype, seen))
+
+    for fstype in fstypes:
+        fstype_vars.add('IMAGE_TYPEDEP_%s' % fstype)
+        fstype_vars.add('IMAGE_CMD_%s' % fstype)
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


