Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
 by mx.groups.io with SMTP id smtpd.web12.21727.1600260898361528065
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Sep 2020 05:54:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OnoXmXPy;
 spf=pass (domain: gmail.com, ip: 209.85.208.42, mailfrom: martin.jansa@gmail.com)
Received: by mail-ed1-f42.google.com with SMTP id e22so6184359edq.6
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Sep 2020 05:54:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/KheMnj1hGGev9mNHvwDo8bL9TpCNXpLRGVAfcflrE=;
        b=OnoXmXPy1o1GBNHskrJO1lygkx1lErodb7sYgMt5jMUVrW0F5ao7KMwjIzC9/ZDoCj
         Ie5DNGDeXcTdB8c07SO67XLWKgxVPjiLHGgQlPn1Sq6n9E/ZuLYDyyAgONSj8wAtI5dG
         UqSDRLKZ4QJ41ZlqrYvv8cHz9tfiIikydJXSaKxSTE4kmfTJowr4XWCOHJ12Uif/NTAK
         KMBYZ+/W77LGB2ymzE0vJRpkrz4F6eADg13hkfGVe4lXt17Fl5RYS40JByPql7ux1cCD
         aqRA9EPyFKAAgwmyHrM3egJbAU72UC3gnj7m9vfJ62ms6cvFMcscr4+nsqqhxFnvdHUN
         JIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=e/KheMnj1hGGev9mNHvwDo8bL9TpCNXpLRGVAfcflrE=;
        b=RUpQAZDZvid4jPVsERmYUmLM1wEiZq8wIIHVIllPI3jUZKyjNlzNzzjoumRB7QrFtL
         pKiRBiprZ0p47yXgyTcb/HraJqEHVa2gWaRkZ668E7D0oPIhASwoYS8l/wMEe/Bf9uGe
         EnBG7VbaR/vj37J7CYjJzCRDdAul6du4Vn84735eyJKcgkfhxstoLclRI4BS2V++S6DZ
         5PIKsocpFCDWDvpty7thibJRfoAbSDi72G8MYBY2Lra5k84T1eA0syoo79D6VMKZQXDC
         5PCxHm9fy399hIurPS3e+5eUscl9UCnWGq1x6qGt2eokEcjBJ24FOrbbjKKm4wUPrQOn
         ZJRg==
X-Gm-Message-State: AOAM532j+AyAA8ACSe03Brs3VgDD6w9/qWrjbu7f6sBrNJFza0nGYXSO
	yDCp54t2grS5jae0BnYxAsA8Pc5qADQ=
X-Google-Smtp-Source: ABdhPJx0JPaxT1W1proRv6MObuvgRtth7UhEENFsasJA5oYTGYSA9VfViszYkBun95DmPnu9BcYPig==
X-Received: by 2002:aa7:d40f:: with SMTP id z15mr27912454edq.247.1600260895706;
        Wed, 16 Sep 2020 05:54:55 -0700 (PDT)
Return-Path: <martin.jansa@gmail.com>
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id r8sm13921965edy.87.2020.09.16.05.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 05:54:54 -0700 (PDT)
From: "Martin Jansa" <Martin.Jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <Martin.Jansa@gmail.com>
Subject: [PATCH 1/5] image-artifact-names: introduce new bbclass and move some variables into it
Date: Wed, 16 Sep 2020 14:54:45 +0200
Message-Id: <20200916125449.1564380-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
index fbdb1d3161..0f26c3c07b 100644
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
index ab05cc90ff..66884af8e0 100644
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
index 4162c4e790..d8f62ef6ea 100644
--- a/meta/classes/qemuboot.bbclass
+++ b/meta/classes/qemuboot.bbclass
@@ -86,6 +86,8 @@ QB_ROOTFS_EXTRA_OPT ?= ""
 # This should be kept align with ROOT_VM
 QB_DRIVE_TYPE ?= "/dev/sd"
 
+inherit image-artifact-names
+
 # Create qemuboot.conf
 addtask do_write_qemuboot_conf after do_rootfs before do_image
 
diff --git a/meta/classes/rootfs-postcommands.bbclass b/meta/classes/rootfs-postcommands.bbclass
index 984730ebe8..1f27a3d07a 100644
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
index 00f0c29836..6c8bedcd65 100644
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
index 65b4432c63..5d994f067d 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -452,11 +452,6 @@ STAGING_KERNEL_BUILDDIR = "${TMPDIR}/work-shared/${MACHINE}/kernel-build-artifac
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
2.25.1

