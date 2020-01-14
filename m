Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id B87596B8BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 09:12:36 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id c14so11336366wrn.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2020 01:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=OTjuquAW3UaRtNImN+XWB5FhXK6cwe7hC9Fnpfh/NCI=;
	b=q0N/kv6Mu13DdVphSXRscMAdj6vck9gAQDl1Y2737b0WrO+YENfNsa++n6s4/2yse6
	o28/K8JibK3RCX73VEy6fkd+3FnUduRxnxsfy/RRTujkHNKk90Pp8ly06RaB4oUl9I7x
	+GOL5ilhg3HhN34CiCRIQS9XMf2SV7779J3Y4BAex5o62iA9tfEJOm9Ypp1aCoX7wFfI
	ZA3w+kPyHNV3qm5oLSwRtVtny7deynXRvcPIgslSXe87dK1o8DR8TYDDAX/uam7jAYSz
	02J8QV2uVehZ5M1DD6LtJ/t652yHXlJqpgKU1jh8AOg08dzF6DjCsOlPDFUBaJw3LsYs
	7fKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=OTjuquAW3UaRtNImN+XWB5FhXK6cwe7hC9Fnpfh/NCI=;
	b=hXy0RLyro6aCo3ddRkxa/Knr70jMeO3LxKrJ622vzj368DH+27o1aYOnzTavW5lQ4I
	C1ZklcsJK0G/6duQXCBLqHvWwSQDMDWuVXSJWRio5FEkXytmFvnW/9IDhsW7dcD+wLqD
	t8EO7AGYIvmmz44sNZeFAFguY1Y5Zb2Q9R4YUACy/DdkRmnj14JuYBICIHL5eXLSXlSC
	otftYqkXutNI+OIQFHfjnQq31CM03mC4CY0pS9BHbTaqxYsMMpno0XRf848ynHtY4WWj
	+d57kjjlbAD5OOvy+Zy7cOSWq6+xxtwjCaP5i+EbjrVTW1KlQxYbG+V3ykPTSATegc7z
	WV3g==
X-Gm-Message-State: APjAAAUuWaKZenEWxVto3tzDkCcMJKf60GbwlVQMOFvWN7B3fk5wH1AP
	dZCYSg4xwgz+OkrCDp70yl84ybHvPr4=
X-Google-Smtp-Source: APXvYqzEn+rLHdeYnkHlT9PkbgR6UN/gzBMf2j6wGQRHHBPExHNx9BmVLE+y6Mft+UzsEivg+q0aUw==
X-Received: by 2002:adf:fe90:: with SMTP id l16mr24972078wrr.265.1578993156758;
	Tue, 14 Jan 2020 01:12:36 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	k16sm19151181wru.0.2020.01.14.01.12.36
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 14 Jan 2020 01:12:36 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jan 2020 10:12:20 +0100
Message-Id: <cced9a46c1300145f5e9d6ac52de73f8a2d408e3.1578993027.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578993027.git.Martin.Jansa@gmail.com>
References: <cover.1578993027.git.Martin.Jansa@gmail.com>
MIME-Version: 1.0
Subject: [PATCHv5 1/8] image-artifact-names: introduce new bbclass and move some variables into it
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
X-List-Received-Date: Tue, 14 Jan 2020 09:12:37 -0000
Content-Transfer-Encoding: 8bit

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
index affdf272d7..cabdb9b935 100644
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
index 54058b350d..9ea5ddc312 100644
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
index f82f1d8862..c512bba405 100644
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
@@ -231,7 +225,8 @@ IMAGE_CMD_f2fs () {
 
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
index 2f171836fa..14a0cf4af0 100644
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
index 844ed87944..a1d0ddbb47 100644
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
index 62b5466b71..3c1e7589e6 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -449,11 +449,6 @@ STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifac
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
2.20.1


