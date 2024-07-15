Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78B5DC3DA4B
	for <webhook@archiver.kernel.org>; Mon, 15 Jul 2024 14:15:18 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web11.38951.1721052909029937683
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Jul 2024 07:15:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=X5YIGiDS;
 spf=pass (domain: gmail.com, ip: 209.85.221.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3678f36f154so2598942f8f.2
        for <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 07:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721052907; x=1721657707; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MXe2y7dfuUKdPidHGkGFtmXp9CHjbjDmtMfdI//qSHA=;
        b=X5YIGiDSsmZXnd3ktLkHe0RWBXe38nfLCCh9yhmxxkfdNAqBO5UUaN1Y15allvJx5b
         0LSnYua41wAmkS25lb0GS3i3ZD82584SjtTDPbJ4eg28IKQApw5eFACqlupHk+wKLJ+Z
         2sdeLMDBzxv+Ur4iRQa6HiTXZZ0zm1ioWMJCQkdpBUr5zN/PwsS7H0tOmL2inX9VTOSG
         41fxsrzbymeeYBujh3MbSu5zQP5YRqbF9LthnImfF3shH9en5cESTyFDSnUBEtZfNl+J
         9/2HFWWcT0I8AgzZSfPP2idcHHkFs/MPZP/vivWEErq2uk2B+T0YeUtVPAUsQt4qNQZf
         foSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721052907; x=1721657707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MXe2y7dfuUKdPidHGkGFtmXp9CHjbjDmtMfdI//qSHA=;
        b=qpPIYqA7+7HZWWmZGN96VtZWcVRM5JqwrAQyRXLE0qFZXQB+XoD+stbM5KvUkkKs2L
         Jp2/wzP4KJyFpSVxroxDLxYzbJCeRHqJX/OLVhhEOdvLOJkXB6toh6JJfICZeyB9BKXg
         fVXx+x89dN24aEKWe9DB+ajIJvLYof9wDh0zutMCBMmDNv4LBWvCL1w67uzHpTvMJvsW
         wkC/FNbtrc5X9YMWLbN96cvVFKKC3nq61Qa45WxAVHoXHqJaNuPiy1c1YBIGdCnGGlZI
         yey/pcLw6/YAEU4lmiJhFUn8YxNIlFgooLEJOwCeP8LZKu1qYOF2bfkJ/zKh306TM4Bg
         vrXw==
X-Gm-Message-State: AOJu0YyFeFTl+p/kqY4wIszJTaZ9SyH3o2g204f5tC+sFuphUjow2KIe
	zOM6L1nHwL8CR+3/LzWnRmDhVXvBL6GqRbE1foEZQEmV4y+flMJLWZmz/w==
X-Google-Smtp-Source: AGHT+IFj+rELt9eK2Rbuv1ffbSuvAZ4JcPlpSKp3xqh0064HrDGRV9602jq/PX3yBSQhoKykSm0pKA==
X-Received: by 2002:a05:6000:bcb:b0:367:8120:73ea with SMTP id ffacd0b85a97d-367ceadc95fmr11081869f8f.67.1721052906864;
        Mon, 15 Jul 2024 07:15:06 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3680daccbddsm6499074f8f.64.2024.07.15.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 07:15:06 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH v2 0/6] Use the kernel from sstate when building fitImages
Date: Mon, 15 Jul 2024 16:10:37 +0200
Message-ID: <20240715141448.2158477-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Jul 2024 14:15:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201926

Changes in comparison to v1:
- Add the missing dependency from do_image_wic to
  initramfs.do_image_complete which caused the build failure on the AB.
- Support symbolic links for $dtb_path again, as suggested by Mark.
- Simplify the refactoring of the uboot_prep_kimage function.
- Evaluate staging via sysroot instead of taking the kernel artifacts
  from the deploy folder. But there is an issue with this approach: It
  does not allow to remove the dependency from do_deploy on do_install.
- Rebasing to latest master

If the KERNEL_IMAGETYPES(S) contains fitImage, the kernel is always
rebuilt when something changes in the initramfs frequently.
This is even worse if the build runs from an empty TMPDIR. The kernel
re-build starts by fetching the large kernel git repository and
recompiling it from scratch.

This cannot be improved if INITRAMFS_IMAGE_BUNDLE = "1". If the kernel
Makefile is needed to generate the initramfs bundle the kernel build
folder is required.
But for a build configuration with INITRAMFS_IMAGE_BUNDLE = "" the
build folder is not needed. Creating the initramfs bundle requires:
linux.bin, DTBs and the initramfs which are available in the deploy
directory. That means creating the fitImage can be done with artifacts
which are already cached by the sstate.

There is an extra commit providing a html file. This html file provides
some graphics which show the changes in the kernel's task dependencies.
I hope this simplifies the re-view of this patch series.

Testing:
- oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg \
     reproducible -T yocto-mirrors -T machine -T toolchain-user \
     -T toolchain-system
- Build for core-image-minimal for MACHINE = "genericarm64"
  (failure from AB was reproducible and is fixed now)
- Build clean followed by build from sstate
  Note: Adding this test to oe-selftest failed because sstate is read only
  - Clean build config:
    KERNEL_IMAGETYPE = "Image"
    KERNEL_IMAGETYPES += " fitImage "
    KERNEL_CLASSES = " kernel-fitimage "
    IMAGE_FSTYPES += "cpio.gz"
    INITRAMFS_IMAGE = "core-image-minimal"
    IMAGE_NAME_SUFFIX:pn-core-image-minimal = ""
    UBOOT_RD_LOADADDRESS = "0x88000000"
    UBOOT_RD_ENTRYPOINT = "0x88000000"
    UBOOT_LOADADDRESS = "0x80080000"
    UBOOT_ENTRYPOINT = "0x80080000"
    FIT_DESC = "A model description"
    FOO_VAR = "1"
    INHERIT += "image-buildinfo"
    IMAGE_BUILDINFO_VARS:append = " FOO_VAR"
  - Append the following and rebuild with sstate:
    FOO_VAR = "2"
    TMPDIR = "${TOPDIR}/tmp-2"
  - Check the log files:
    - tmp/log/cooker/qemux86-64 contains:
      linux-yocto-6.6.35+git-r0: task do_deploy: Succeeded
      linux-yocto-6.6.35+git-r0: task do_deploy_fitimage_unbundled: Succeeded
    - tmp-2/log/cooker/qemux86-64 contains:
      linux-yocto-6.6.35+git-r0: task do_deploy_setscene: Succeeded
      linux-yocto-6.6.35+git-r0: task do_deploy_fitimage_unbundled: Succeeded
- To re-view the chagnes in the task dependencies, the script bellow
  has been used. It confirms:
  - For builds with fitImage and unbundled initramfs:
    - the do_deploy_fitimage_unbundled task runs after do_deploy
    - do_assemble_fitimage_initramfs is not executed
    - do_bundle_initramfs is not executed
    - It works for fitImage in KERNEL_IMAGETYPE as well as for fitImage
      in KERNEL_IMAGETYPES
  - For builds with fitImage and bundled initramfs: No changes
  - For builds with fitImage, without initramfs:
    - do_assemble_fitimage_initramfs is not executed
    - do_bundle_initramfs is not executed

OUTPUT_FILE=task-depends.md
GIT_BRANCH=master
GIT_BRANCH_NEXT=adrianf/kernel-fitimage-sstate

echo "# Task dependeny changes" > "$OUTPUT_FILE"
echo "" >> "$OUTPUT_FILE"

run_bitbake(){
    echo "$1" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    bitbake virtual/kernel -g
    grep -E '(digraph depends|linux-yocto|\})' task-depends.dot \
    | grep -v -E '(spdx|do_kernel_configcheck|do_prepare_recipe_sysroot|do_populate_lic|native.do_populate_sysroot)' \
    | grep -v -E '(depmodwrapper-cross.do_populate_sysroot|binutils-cross-x86_64.do_populate_sysroot|do_package)' \
    | grep -v -E '(do_validate_branches|do_unpack|do_recipe_qa|do_patch|do_kernel_checkout|do_kernel_configme|do_kernel_metadata)' \
    | grep -v -E '(do_sizecheck|do_strip|do_compile_kernelmodules|do_shared_workdir|do_transform_kernel|do_kernel_link_images)' \
    | grep -v -E '(do_kernel_version_sanity_check|do_symlink_kernsrc|do_deploy_source_date_epoch|do_configure|do_fetch)' \
    | sed -e 's;\\n\:.*.bb;;g' -e 's;linux-yocto[. ];;g' > task-depends-filtered.dot

    echo '```plantuml' >> "$OUTPUT_FILE"
    cat task-depends-filtered.dot >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
}

run_bitbake_per_branch(){
    echo "## Configuration: $1" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo '```raw' >> "$OUTPUT_FILE"
    cat build/conf/auto.conf >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"

    git checkout $GIT_BRANCH
    run_bitbake "### branch: $GIT_BRANCH"
    mv -f task-depends-filtered.dot task-depends-filtered-old.dot

    git checkout $GIT_BRANCH_NEXT
    run_bitbake "### branch: $GIT_BRANCH_NEXT"

    echo "## Diff" >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
    echo '```patch' >> "$OUTPUT_FILE"
    diff task-depends-filtered-old.dot task-depends-filtered.dot >> "$OUTPUT_FILE"
    echo '```' >> "$OUTPUT_FILE"
    echo "" >> "$OUTPUT_FILE"
}

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE = "Image"
KERNEL_IMAGETYPES += " fitImage "
KERNEL_CLASSES = " kernel-fitimage "
IMAGE_FSTYPES += "cpio.gz"
INITRAMFS_IMAGE = "core-image-minimal-initramfs"
EOF
run_bitbake_per_branch "image, fitimage, initramfs, unbundled"

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE:forcevariable = "fitImage"
KERNEL_CLASSES = " kernel-fitimage "
IMAGE_FSTYPES += "cpio.gz"
INITRAMFS_IMAGE = "core-image-minimal-initramfs"
EOF
run_bitbake_per_branch "fitimage, initramfs, unbundled"

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE = "Image"
KERNEL_IMAGETYPES += " fitImage "
KERNEL_CLASSES = " kernel-fitimage "
IMAGE_FSTYPES += "cpio.gz"
INITRAMFS_IMAGE = "core-image-minimal-initramfs"
INITRAMFS_IMAGE_BUNDLE = "1"
EOF
run_bitbake_per_branch "image, fitimage, initramfs, bundled"

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE = "Image"
KERNEL_IMAGETYPES += " fitImage "
KERNEL_CLASSES = " kernel-fitimage "
EOF
run_bitbake_per_branch "image, fitimage"

rm -f build/conf/auto.conf task-depends-filtered-old.dot task-depends-filtered.dot task-depends.dot

Adrian Freihofer (6):
  kernel-fitimage: fix intentation
  kernel-fitimage: fix external dtb check
  kernel: refactor linux compression
  kernel-fitimage: refactor fitimage_assemble
  kernel: refactor fitimage
  kernel-fitimage: run unbundled fitimage after deploy

 meta/classes-recipe/image.bbclass           |  12 +-
 meta/classes-recipe/kernel-fitimage.bbclass | 188 ++++++++++++--------
 meta/classes-recipe/kernel-uboot.bbclass    |   1 +
 meta/classes-recipe/kernel.bbclass          |  31 ++--
 4 files changed, 148 insertions(+), 84 deletions(-)

-- 
2.45.2


