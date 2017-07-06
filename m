Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id E8033601F2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:40:27 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id b207so4382687lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=1F92VvkCHLxaQhQtEBFYI3ccJohvdvUXPBRwgVLaFfY=;
	b=Bp2cpqeFKdFYQ0SPDHhZsk17rM+0xJL8vQTJhtE7kCWgW4MpwpFPj0h1EQRM5B4zms
	xqez+/UKGxCnQsc0hlaqnr8dgqLQ70SDkY8zX2OYr+ouzs3VL4q0eNl2bW3hUCbd845a
	Brm6aiZqt9odHexGpd0NVlwo7xOlEJTixe/SrsYLqcztNM+ipYGa4gUuc6yn3rI4o0J0
	LQ/xGzG4iBHbcbCe4gsXn8QODEPXNrmSLwUVsLSEQG+7LqSmjQJcnKGpHtH9hrbbpslL
	QabE+EViGj0Y6n7Y8R2iSFW7HZUXkZ/dn5wT2I6bnWW+YkO0p1r5YtwrDP95WGArp28o
	AWmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1F92VvkCHLxaQhQtEBFYI3ccJohvdvUXPBRwgVLaFfY=;
	b=oBVsAivUt0RgUn4seRkCpnbjPkq8tR9TuToJZctYtQswJr4EVKpzZ3zfOI91Z8LwsQ
	LO2ZaQ3fHzFSpWHUpVrJIgnE/DNjuKOmJm5iL9hxkUtgWSYJORaLEVau/Cqjk0paZOQH
	GtUEvTQoOhlFNudO0PKKng/S7Znr9eUciq2SeFVZ7RkiAaOU/BU0983Mwq3ve2+RxHzC
	gZfNKYrvqQHLWK1R/S/kj+ao76tk+QFjWSnhSmlST8zSbRT37fRbjkpssD70NPcCR4wG
	OttrC1K+QoziTsxK2f+oOsbDUfPwfvFIv9tMLm2eMzdMmRTgRdrygFrcVjn2ny6LA9C0
	CEbA==
X-Gm-Message-State: AKS2vOyJVj/3T7PwFxP2zvgQgdpcYGyU8zKF4u+qATIKRHYnnYpdE25a
	qp1QNqv4eygl2J+J
X-Received: by 10.80.149.209 with SMTP id x17mr25486060eda.175.1499352028102; 
	Thu, 06 Jul 2017 07:40:28 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.242])
	by smtp.gmail.com with ESMTPSA id n26sm231664edd.51.2017.07.06.07.40.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 07:40:27 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 16:40:19 +0200
Message-Id: <1499352019-27001-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] meta: move image-mklibs image-prelink to IMAGE_CLASSES
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
X-List-Received-Date: Thu, 06 Jul 2017 14:40:28 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The code logic in image-mklibs.bbclass and image-prelink.bbclass is all
about optimizing the rootfs image, so it makes more sense to put them
into IMAGE_CLASSES rather than USER_CLASSES.

What's more, this fixes a potential issue by moving out image-mklibs
from INHERIT, considering that, a following dependency is missing in
image-mklibs.bblcass:
...
do_rootfs[depends] += "virtual/${MLPREFIX}${TARGET_PREFIX}binutils:do_populate_sysroot"
...

but if I add it in, I got a following error:
...
NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'virtual/none-oe-none-binutils'. Close matches:
virtual/i586-oe-linux-binutils
ERROR: Nothing PROVIDES 'virtual/none-oe-none-binutils'. Close matches:
virtual/i586-oe-linux-binutils
ERROR: Nothing PROVIDES 'virtual/none-oe-none-binutils'. Close matches:
virtual/i586-oe-linux-binutils
ERROR: Nothing PROVIDES 'virtual/none-oe-none-binutils'. Close matches:
virtual/i586-oe-linux-binutils
ERROR: Nothing PROVIDES 'virtual/none-oe-none-binutils'. Close matches:
virtual/i586-oe-linux-binutils
ERROR: Nothing PROVIDES 'virtual/none-oe-none-binutils'. Close matches:
virtual/i586-oe-linux-binutils
...

this can be fixed by moving image-mklibs to IMAGE_CLASSES per test.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/local.conf.sample                  | 15 +++++++++++----
 meta/conf/local.conf.sample.extended         |  6 ------
 meta/recipes-devtools/prelink/prelink_git.bb |  2 +-
 3 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index b754853..b8d9532 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -118,18 +118,25 @@ PACKAGE_CLASSES ?= "package_ipk"
 EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
 
 #
-# Additional image features
+# Additional user features
 #
-# The following is a list of additional classes to use when building images which
+# The following is a list of additional classes to use when bitbaking recipes which
 # enable extra features. Some available options which can be included in this variable
 # are:
 #   - 'buildstats' collect build statistics
+USER_CLASSES ?= "buildstats"
+
+#
+# Additional image generation features
+#
+# The following is a list of classes to import to use in the generation of images.
+# Some available options which can be included in this variable are:
 #   - 'image-mklibs' to reduce shared library files size for an image
 #   - 'image-prelink' in order to prelink the filesystem image
+#   - 'image_types_uboot' in order to generate various uboot images
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
-
+IMAGE_CLASSES ?= "image-mklibs image-prelink"
 
 #
 # Runtime testing of images
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5d6c37d..63475c6 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -163,12 +163,6 @@
 # Set to other values to use remote PRService.
 #PRSERV_HOST = "localhost:0"
 
-# Additional image generation features
-#
-# The following is a list of classes to import to use in the generation of images
-# currently an example class is image_types_uboot
-# IMAGE_CLASSES = " image_types_uboot"
-
 # The following options will build a companion 'debug filesystem' in addition
 # to the normal deployable filesystem.  This companion system allows a
 # debugger to know the symbols and related sources.  It can be used to
diff --git a/meta/recipes-devtools/prelink/prelink_git.bb b/meta/recipes-devtools/prelink/prelink_git.bb
index 4529dbf..573157d 100644
--- a/meta/recipes-devtools/prelink/prelink_git.bb
+++ b/meta/recipes-devtools/prelink/prelink_git.bb
@@ -156,7 +156,7 @@ pkg_postinst_prelink() {
 #!/bin/sh
 
 if [ "x$D" != "x" ]; then
-  ${@bb.utils.contains('USER_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
+  ${@bb.utils.contains('IMAGE_CLASSES', 'image-prelink', 'exit 0', 'exit 1', d)}
 fi
 
 prelink -a
-- 
2.7.4


