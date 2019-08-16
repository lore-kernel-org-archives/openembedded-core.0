Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 846567F34B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 17:17:00 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t16so2225582wra.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Aug 2019 10:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=XW0cSwaGhF6ZvSQ1GxcFNbvmyXcRpnzxin67fhw7+lY=;
	b=HNVxTCYC4/R3FkzCjfCMB0HGuDelgzRnrLlzcZGspDf1U6ixQ5dbi2BJxWbrRDSuNf
	97812ie75BiARYtg3E2hLLrie+21xUYYH2DkH6djJR4924gw4SJ7WtUa5RlX635+yUed
	fAV2s+1s5c58VFujqfAZjJ9pIiBL2n9WlNH3ei0O/BJaLoD2V4qT76GRTe3GSA+GVfNw
	cyJ/x3iqz7NCfuXqSzKa0PofvERC5+433F/BSpGUc3zxio08fD3zib6zbB+wIP/JRRHN
	LgsTxb4V++2G0HVRqItTMZKFNNPBlMcaxMLmWPw8XwjgTDcyvYkFoJba2UWl5qQ8jfqE
	PAMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=XW0cSwaGhF6ZvSQ1GxcFNbvmyXcRpnzxin67fhw7+lY=;
	b=Om5fFpjEqZhTe8Alp11REwF8ZCWkjqVdFmGmHrub6Mud4MjZAQcEiTPvUN8BSPRYse
	K6LModMx9bY82ac08Rk0lBhq5pHjQLhEDJ6MwiJp5mLun5Oh5N9qh7PGv7+HXPTS6VtI
	LfRIH9uZGyLH+pdvueVqWjAO7sA6oUjajLFf/U+vL3igX8FN3fxBl23PxRa7RXHaiQwU
	THRm05h6LqKPxrn0nVBzppz9RT9q129i/2kcXCFrtfNeSUP64zgmvAzYUL4peCWiDHYy
	ZQFc3dbSpgSgXQEFl74Zz6QoyYqeLWEDvyftk5Lyvl8vOV0rH4Kq06JVqmlbvFZODIJf
	WZBw==
X-Gm-Message-State: APjAAAWxvjbWhsMHXM2DY2cyPU5LlANdFtLkPJJogwHXrDJe7kZwblD1
	XN9GyIzGmYp/JEQrpjZk5NvSje4o3x8=
X-Google-Smtp-Source: APXvYqyBomGxHdJRFPg/cTI+WhLNouliBD6QY87t9pvj4DXjQFg7FhZbYDJxjQu8qUayTmp1jsiEhQ==
X-Received: by 2002:a5d:4e06:: with SMTP id p6mr12672795wrt.336.1565975820716; 
	Fri, 16 Aug 2019 10:17:00 -0700 (PDT)
Received: from localhost (ip-217-030-068-212.aim-net.cz. [217.30.68.212])
	by smtp.gmail.com with ESMTPSA id
	r23sm4062360wmc.38.2019.08.16.10.17.00
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Aug 2019 10:17:00 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Aug 2019 17:16:57 +0000
Message-Id: <8f28e043eb1eb97512940b3ed22ffef79ece3e5f.1565973637.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1565973637.git.Martin.Jansa@gmail.com>
References: <cover.1565973637.git.Martin.Jansa@gmail.com>
Subject: [RFC][PATCH 1/6] image-artifact-names: introduce new bbclass and move some variables into it
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
X-List-Received-Date: Fri, 16 Aug 2019 17:17:00 -0000

* similar to kernel-artifact-names for other recipes/bbclasses which
  need to use some deployed artifacts

* bitbake.conf: move IMAGE_BASENAME, IMAGE_VERSION_SUFFIX, IMAGE_NAME,
  IMAGE_LINK_NAME variables

* image_types.bbclass: move IMAGE_NAME_SUFFIX variable

* currently IMAGE_NAME_SUFFIX is used only by image.bbclass,
  image_types.bbclass and meta/recipes-core/images/build-appliance-image_15.0.0.bb
  but if it's needed by some recipe which isn't itself an image, then
  it's useful in bitbake.conf, e.g. we have a recipe for creating
  VirtualBox appliances which combines .wic.vmdk with .ovf file to
  create .zip with appliance, but for that we need the filename of
  .wic.vmdk which now contains IMAGE_NAME_SUFFIX
  https://github.com/webOS-ports/meta-webos-ports/blob/4980ce52a43ac6897657602810313af359f0b839/meta-luneos/recipes-core/images/luneos-emulator-appliance.inc#L24

* we were hardcoding .rootfs suffix where needed, but for quite long
  time it's configurable with IMAGE_NAME_SUFFIX since:

  commit 380ee36811939d947024bf78de907e3c071b834f
  Author: Patrick Ohly <patrick.ohly@intel.com>
  Date:   Mon Mar 7 18:07:52 2016 +0100

    image creation: allow overriding .rootfs suffix

  and might not match with hardcoded .rootfs, so make it easier to
  use IMAGE_NAME_SUFFIX where needed even without inheritting whole
  image_types.bbclass

[YOCTO #12937]

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/classes/buildhistory.bbclass          |  2 ++
 meta/classes/image-artifact-names.bbclass  | 15 +++++++++++++++
 meta/classes/image-live.bbclass            |  2 +-
 meta/classes/image_types.bbclass           |  9 ++-------
 meta/classes/kernel-artifact-names.bbclass |  8 ++++++++
 meta/classes/qemuboot.bbclass              |  2 ++
 meta/classes/rootfs-postcommands.bbclass   |  2 ++
 meta/classes/testimage.bbclass             |  2 ++
 meta/conf/bitbake.conf                     |  5 -----
 9 files changed, 34 insertions(+), 13 deletions(-)
 create mode 100644 meta/classes/image-artifact-names.bbclass

diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.bbclass
index f986f7c794..fb244bc04e 100644
--- a/meta/classes/buildhistory.bbclass
+++ b/meta/classes/buildhistory.bbclass
@@ -7,6 +7,8 @@
 # Copyright (C) 2007-2011 Koen Kooi <koen@openembedded.org>
 #
 
+inherit image-artifact-names
+
 BUILDHISTORY_FEATURES ?= "image package sdk"
 BUILDHISTORY_DIR ?= "${TOPDIR}/buildhistory"
 BUILDHISTORY_DIR_IMAGE = "${BUILDHISTORY_DIR}/images/${MACHINE_ARCH}/${TCLIBC}/${IMAGE_BASENAME}"
diff --git a/meta/classes/image-artifact-names.bbclass b/meta/classes/image-artifact-names.bbclass
new file mode 100644
index 0000000000..5ab8f1b7aa
--- /dev/null
+++ b/meta/classes/image-artifact-names.bbclass
@@ -0,0 +1,15 @@
+##################################################################
+# Specific image creation and rootfs population info.
+##################################################################
+
+IMAGE_BASENAME = "${PN}"
+IMAGE_VERSION_SUFFIX = "-${DATETIME}"
+IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
+IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
+IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
+
+# IMAGE_NAME is the base name for everything produced when building images.
+# The actual image that contains the rootfs has an additional suffix (.rootfs
+# by default) followed by additional suffices which describe the format (.ext4,
+# .ext4.xz, etc.).
+IMAGE_NAME_SUFFIX ??= ".rootfs"
diff --git a/meta/classes/image-live.bbclass b/meta/classes/image-live.bbclass
index af71be5093..d44573efe8 100644
--- a/meta/classes/image-live.bbclass
+++ b/meta/classes/image-live.bbclass
@@ -22,7 +22,7 @@
 # ${HDDIMG_ID} - FAT image volume-id
 # ${ROOTFS} - indicates a filesystem image to include as the root filesystem (optional)
 
-inherit live-vm-common
+inherit live-vm-common image-artifact-names
 
 do_bootimg[depends] += "dosfstools-native:do_populate_sysroot \
                         mtools-native:do_populate_sysroot \
diff --git a/meta/classes/image_types.bbclass b/meta/classes/image_types.bbclass
index 2eeffbb366..a6d42c03e4 100644
--- a/meta/classes/image_types.bbclass
+++ b/meta/classes/image_types.bbclass
@@ -1,9 +1,3 @@
-# IMAGE_NAME is the base name for everything produced when building images.
-# The actual image that contains the rootfs has an additional suffix (.rootfs
-# by default) followed by additional suffices which describe the format (.ext4,
-# .ext4.xz, etc.).
-IMAGE_NAME_SUFFIX ??= ".rootfs"
-
 # The default aligment of the size of the rootfs is set to 1KiB. In case
 # you're using the SD card emulation of a QEMU system simulator you may
 # set this value to 2048 (2MiB alignment).
@@ -229,7 +223,8 @@ IMAGE_CMD_f2fs () {
 
 EXTRA_IMAGECMD = ""
 
-inherit siteinfo kernel-arch
+inherit siteinfo kernel-arch image-artifact-names
+
 JFFS2_ENDIANNESS ?= "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '-l', '-b', d)}"
 JFFS2_ERASEBLOCK ?= "0x40000"
 EXTRA_IMAGECMD_jffs2 ?= "--pad ${JFFS2_ENDIANNESS} --eraseblock=${JFFS2_ERASEBLOCK} --no-cleanmarkers"
diff --git a/meta/classes/kernel-artifact-names.bbclass b/meta/classes/kernel-artifact-names.bbclass
index bbeecba7bd..a65cdddb3e 100644
--- a/meta/classes/kernel-artifact-names.bbclass
+++ b/meta/classes/kernel-artifact-names.bbclass
@@ -1,3 +1,11 @@
+##################################################################
+# Specific kernel creation info
+# for recipes/bbclasses which need to reuse some of the kernel
+# artifacts, but aren't kernel recipes themselves
+##################################################################
+
+inherit image-artifact-names
+
 KERNEL_ARTIFACT_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
 KERNEL_ARTIFACT_LINK_NAME ?= "${MACHINE}"
 
diff --git a/meta/classes/qemuboot.bbclass b/meta/classes/qemuboot.bbclass
index 15a9e63f2b..694798ad2b 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -67,6 +67,8 @@ QB_NETWORK_DEVICE ?= "-device virtio-net-pci,netdev=net0,mac=@MAC@"
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
 
+inherit image-artifact-names
+
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 IMGDEPLOYDIR ?= "${WORKDIR}/deploy-${PN}-image-complete"
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 6cec23ef1a..91c824a535 100644
--- a/meta/classes/rootfs-postcommands.bbclass
+++ b/meta/classes/rootfs-postcommands.bbclass
@@ -39,6 +39,8 @@ ROOTFS_POSTPROCESS_COMMAND += '${@bb.utils.contains("DISTRO_FEATURES", "systemd"
 
 ROOTFS_POSTPROCESS_COMMAND += 'empty_var_volatile;'
 
+inherit image-artifact-names
+
 # Sort the user and group entries in /etc by ID in order to make the content
 # deterministic. Package installs are not deterministic, causing the ordering
 # of entries to change between builds. In case that this isn't desired,
diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index 525c5a6173..f6a9c3fac2 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -3,6 +3,8 @@
 # Released under the MIT license (see COPYING.MIT)
 
 inherit metadata_scm
+inherit image-artifact-names
+
 # testimage.bbclass enables testing of qemu images using python unittests.
 # Most of the tests are commands run on target image over ssh.
 # To use it add testimage to global inherit and call your target image with -c testimage
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index ddcac09c5c..c2012abd41 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -455,11 +455,6 @@ STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifac
 ##################################################################
 
 IMAGE_ROOTFS = "${WORKDIR}/rootfs"
-IMAGE_BASENAME = "${PN}"
-IMAGE_VERSION_SUFFIX = "-${DATETIME}"
-IMAGE_VERSION_SUFFIX[vardepsexclude] += "DATETIME"
-IMAGE_NAME = "${IMAGE_BASENAME}-${MACHINE}${IMAGE_VERSION_SUFFIX}"
-IMAGE_LINK_NAME = "${IMAGE_BASENAME}-${MACHINE}"
 
 # This option allows for a percentage overage of the actual image size rather than a
 # fixed extra space, this is space needed for initial startup and basic operations.
-- 
2.17.1


