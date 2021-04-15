Received: from dent.vctlabs.com (dent.vctlabs.com [207.154.65.135])
 by mx.groups.io with SMTP id smtpd.web12.1686.1618453946423089125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 Apr 2021 19:32:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: vctlabs.com, ip: 207.154.65.135, mailfrom: sjl@vctlabs.com)
Received: by dent.vctlabs.com (Postfix, from userid 112)
	id 2FE6F2802F9; Wed, 14 Apr 2021 19:32:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on dent.vctlabs.com
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham autolearn_force=no version=3.4.2
Received: from codepurple (c-73-158-3-176.hsd1.ca.comcast.net [73.158.3.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dent.vctlabs.com (Postfix) with ESMTPSA id 02DFE2801DF
	for <openembedded-core@lists.openembedded.org>; Wed, 14 Apr 2021 19:32:06 -0700 (PDT)
Date: Wed, 14 Apr 2021 19:32:08 -0700
From: "S. Lockwood-Childs" <sjl@vctlabs.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH] image_types.bbclass: tar: support EXTRA_IMGAGECMD
Message-ID: <20210415023208.GQ1189447@codepurple>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The primary motivation for making tar image options configurable
is to provide choice on a per-machine basis between gnu and posix
formats. Neither one is suitable for all use cases.
* gnu isn't compatible when xattrs are required
* posix can cause locale headaches
  https://groups.google.com/g/swupdate/c/zUOSqmkk7cA

One could say "just fix your image installer" but it's nice to be able
to still produce images that currently-deployed systems can handle,
for instance to make update packages to update your updater :)

Default is still posix format, so current behavior is unchanged
unless EXTRA_IMAGECMD_tar is customized.

Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
---
 meta/classes/image_types.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 30951ae366..c0dca351d5 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -110,7 +110,7 @@ IMAGE_CMD_squashfs-lz4 = "mksquashfs ${IMAGE_ROOTFS} ${IMGDEPLOYDIR}/${IMAGE_NAM
 
 IMAGE_CMD_TAR ?= "tar"
 # ignore return code 1 "file changed as we read it" as other tasks(e.g. do_image_wic) may be hardlinking rootfs
-IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --format=posix --numeric-owner -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
+IMAGE_CMD_tar = "${IMAGE_CMD_TAR} --sort=name --numeric-owner ${EXTRA_IMAGECMD} -cf ${IMGDEPLOYDIR}/${IMAGE_NAME}${IMAGE_NAME_SUFFIX}.tar -C ${IMAGE_ROOTFS} . || [ $? -eq 1 ]"
 
 do_image_cpio[cleandirs] += "${WORKDIR}/cpio_append"
 IMAGE_CMD_cpio () {
@@ -228,6 +228,9 @@ EXTRA_IMAGECMD_ext4 ?= "-i 4096"
 EXTRA_IMAGECMD_btrfs ?= "-n 4096"
 EXTRA_IMAGECMD_f2fs ?= ""
 
+# Customize tar format if needed, since gnu and posix have different drawbacks
+EXTRA_IMAGECMD_tar ?= "--format=posix"
+
 do_image_cpio[depends] += "cpio-native:do_populate_sysroot"
 do_image_jffs2[depends] += "mtd-utils-native:do_populate_sysroot"
 do_image_cramfs[depends] += "util-linux-native:do_populate_sysroot"
-- 
2.20.1

