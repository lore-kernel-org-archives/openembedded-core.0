Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5109E77B99
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Jul 2017 03:39:00 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id 77so4667999wrb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 20:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=ZeoJ/3O7iXbdg3eUr+SPXFX6gtvl6EGb7vmYseYMf5E=;
	b=U/nEHPjrsFfdx+hiPM2nH5uUbGH1ixyCx2AwonCP3wj9f752wi7rfM+CtOp3nzICZL
	aPT5fsVZu8lbUq+9bM8IK11rQJwfhSCOgGc+fGDGvv07gRV/llh9+40MYKzKDUi3f1hb
	SQesj5F3Zt2ANhyZZgpOZBMOFP49X6yiuenLaJCaRKVIfeFFpfVZqxRLqDGPVTutfTLl
	AU/miPy6/z/F6+ORCZ+BkePUUvqhnr5hJs94Qhlombssfva3TkK+9VacgleclWLELZWb
	t6HnWR21OdcdNyKZuYAB2kxWKrzd1TFD+7E4ieavXBxgqOWxNgJdMc1l8TwNdyhT7v9u
	HAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ZeoJ/3O7iXbdg3eUr+SPXFX6gtvl6EGb7vmYseYMf5E=;
	b=unMCRY6jKAxPLQhTrL/LqHEzfztXLJFoI1I0+IzNGJLiT7RR5vJSnN8BbQw929rs5Q
	hesLv6rH8cADmGBunK0x+f2U4m+85RctuG5Zz4JNuQzzfLWjjXdjBaf6s4ASl/pwppG5
	4R/4L7pgvRJqwBslbov+tpOj+BFDC2AjY7RSHI7a38xCvnQ4NM7Gkdw3VegDM1kwVAsW
	ZbF+yIcRZLyXyVcVwKSfbOa6VHnqRCLcyuhY+EOgRNmUwN9jMXxz6WQ2Tg+FfQExln4V
	20e6vpNEw72XxeS4DZvwZyeFUBJCafPd3I/acr1E0mzEpAsm4iS1Hgm2yiOAvD0v6Bjo
	uqLQ==
X-Gm-Message-State: AIVw110meE2OzQnputUriw6TwPDy4i0u4LG0UFYM1nzjqf1uLeUNiSUD
	aAOO5dVh77BEgEqw
X-Received: by 10.80.167.163 with SMTP id i32mr713261edc.101.1499398741717;
	Thu, 06 Jul 2017 20:39:01 -0700 (PDT)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([27.191.201.242])
	by smtp.gmail.com with ESMTPSA id c8sm1190775edc.13.2017.07.06.20.38.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 06 Jul 2017 20:39:01 -0700 (PDT)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Fri,  7 Jul 2017 05:38:46 +0200
Message-Id: <1499398726-1534-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH V2] meta: move image-mklibs image-prelink to IMAGE_CLASSES
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
X-List-Received-Date: Fri, 07 Jul 2017 03:39:01 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

The code logic in image-mklibs.bbclass and image-prelink.bbclass is all
about optimizing the rootfs image, so it makes more sense to put them
into IMAGE_CLASSES rather than USER_CLASSES.

What's more, this fixes a potential issue by moving out image-mklibs
from INHERIT, considering that, I found a following dependency is
missing in image-mklibs.bblcass:
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

Also change the image_types_uboot example in local.conf.sample.extended
to be appended to IMAGE_CLASSES, since now IMAGE_CLASSES has a default
value in local.conf.sample.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/conf/local.conf.sample                  | 14 ++++++++++----
 meta/conf/local.conf.sample.extended         |  9 ++++++---
 meta/recipes-devtools/prelink/prelink_git.bb |  2 +-
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
index b754853..e9faa97 100644
--- a/meta/conf/local.conf.sample
+++ b/meta/conf/local.conf.sample
@@ -118,18 +118,24 @@ PACKAGE_CLASSES ?= "package_ipk"
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
 # NOTE: if listing mklibs & prelink both, then make sure mklibs is before prelink
 # NOTE: mklibs also needs to be explicitly enabled for a given image, see local.conf.extended
-USER_CLASSES ?= "buildstats image-mklibs image-prelink"
-
+IMAGE_CLASSES ?= "image-mklibs image-prelink"
 
 #
 # Runtime testing of images
diff --git a/meta/conf/local.conf.sample.extended b/meta/conf/local.conf.sample.extended
index 5d6c37d..cb39240 100644
--- a/meta/conf/local.conf.sample.extended
+++ b/meta/conf/local.conf.sample.extended
@@ -165,9 +165,12 @@
 
 # Additional image generation features
 #
-# The following is a list of classes to import to use in the generation of images
-# currently an example class is image_types_uboot
-# IMAGE_CLASSES = " image_types_uboot"
+# The following is a list of extra classes to import to use in the generation
+# of images, currently an example class is image_types_uboot.
+# Note: IMAGE_CLASSES defaults to "image-mklibs image-prelink" in local.conf,
+# copy this appended variable definition to local.conf if you want use this
+# option.
+# IMAGE_CLASSES += "image_types_uboot"
 
 # The following options will build a companion 'debug filesystem' in addition
 # to the normal deployable filesystem.  This companion system allows a
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


