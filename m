Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB423C52D7C
	for <webhook@archiver.kernel.org>; Mon, 12 Aug 2024 21:14:57 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web11.57819.1723497295593638425
 for <openembedded-core@lists.openembedded.org>;
 Mon, 12 Aug 2024 14:14:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VT2lLL6c;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-a7a8553db90so576352666b.2
        for <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 14:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723497294; x=1724102094; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BqejvGxDyJt3R2GyW0Zu9I6vGbi109WWOZLbusk1z5E=;
        b=VT2lLL6ck+tlYJXG32XELcHhkGA/qt1r5nPPbGS9swsRG3xTSSa4aPg5awGx928EUP
         oYDsF9WUDIEXsyjAynCFvMRdmAjDys1xNQSzPKoEQDzYxLbAgnZO0/j3pkUCVa3W/Wrd
         Z6WBAnCdVjuEsQy7j+a+885MP+fmK3SaUOpKPLUhZ/FVIGzPdWjaFkEFZERQ20VvCd28
         h/29D0aE7SfFUFBcPa+x9x5KewUoc7Gs8HQi9p6znW8Qn0bY17f3nZaD0D/Q0LNPnRrt
         KzUkGgkZw47v1Rw06rTmkudAzxhZ8Z2R3QPkC6hHIh/wLa/R0zgAxMMV58e+tbuCDb+U
         aVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723497294; x=1724102094;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BqejvGxDyJt3R2GyW0Zu9I6vGbi109WWOZLbusk1z5E=;
        b=M0w+0qqeFCJCaKSO7UKzg09jgrNycvkRQSywjBSJKOHxYHg0VPgG3Z6mnLzD7MWL6v
         2cQD26624SlIozF8ZmfAj8jl1eNmS4K6aXeYFAoy0QDEi/pErBvgJ7kwwnZ2vCORLf5R
         d1xRAIkBL90X0nVK15OtimqkLbtuTLMTYQwqlAvJ4s8W/WbS74MqXPT+KdT663Sbe2J6
         w+VQilrVgh2/BvCsL+ygIuSg2/MKaFKJp16GUU2hYvFlBIqyYFiX6ltvsUESfIKVYQBz
         YeidnpKookAzbwVBx77udeOlyoUW4pDlWkg6IyhJskby9GSKlHlkXOzVcEcewq0Hr2o/
         YeMw==
X-Gm-Message-State: AOJu0Yyi2yPLqnhL3uH2XOw70MgREEUcLaCgnVVCEwpPpE71I2kC5pSZ
	xH9l4WSim4jfUJ5PIIJMdOUwF3stmX869ajAGVC1t5Jkd1REhW+5ZUddXw==
X-Google-Smtp-Source: AGHT+IHjKVLrDSeBp3cK09U/ah33w4MOJpzP6vqf+480rckOWshrYceu9N4fuP0zrHDogyPFV1AnEg==
X-Received: by 2002:a17:907:6d20:b0:a6f:4f2c:1936 with SMTP id a640c23a62f3a-a80ed2c876cmr107344366b.44.1723497293079;
        Mon, 12 Aug 2024 14:14:53 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a80f3fb069dsm10828366b.80.2024.08.12.14.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Aug 2024 14:14:52 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH v3 0/4] Use the kernel from sstate when building fitImages
Date: Mon, 12 Aug 2024 23:12:53 +0200
Message-ID: <20240812211437.2736977-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 12 Aug 2024 21:14:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203235

Changes in comparison to v2:
The commit "kernel: refactor fitimage" dropped the task dependency from
kernel:do_deploy -> kernel:do_install. This is now fixed by adding "after
do_install" to the addtask deploy.

Note, there is also a dependendency like
do_deploy --> do_populate_sysroot --> do_install.
However since the do_populate_sysroot task is sstate cached, the build
folder is not available for the do_deploy task if the do_populate_sysroot
setscene tasks runs. This is what most probably caused the errors on the
AB with v2.

Additionally the test script got more non firImage related
configurations.

Summary:
If the KERNEL_IMAGETYPES(S) contains fitImage, the kernel is always
rebuilt when something changes in the initramfs, which happens
frequently.
This is even worse if the build runs from an empty TMPDIR. The kernel
re-build starts by fetching the large kernel git repository and gets
recompiled from scratch.

This cannot be improved if INITRAMFS_IMAGE_BUNDLE = "1". If the kernel
Makefile is needed to generate the initramfs bundle the kernel build
folder is required.
But for a build configuration with INITRAMFS_IMAGE_BUNDLE = "" the
build folder is not needed. Creating the initramfs bundle requires:
linux.bin, DTBs and the initramfs which are available in the deploy
directory. That means creating the fitImage can be done with artifacts
which are already cached by the sstate.

Testing:
- oe-selftest -a --skip-tests distrodata.Distrodata.test_checkpkg \
     reproducible -T yocto-mirrors -T machine -T toolchain-user \
     -T toolchain-system
- Build linux-yocto with empty TMPDIR and empty sstate, followed by a build
  with populated sstate.
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
  - bitbake linux-yocto
  - Append the following and rebuild with sstate:
    FOO_VAR = "2"
    TMPDIR = "${TOPDIR}/tmp-2"
  - bitbake linux-yocto
  - Check the log files:
    - tmp/log/cooker/qemux86-64 contains:
      linux-yocto-6.6.43+git-r0: task do_deploy: Succeeded
      linux-yocto-6.6.43+git-r0: task do_deploy_fitimage_unbundled: Succeeded
    - tmp-2/log/cooker/qemux86-64 contains:
      linux-yocto-6.6.43+git-r0: task do_deploy_setscene: Succeeded
      linux-yocto-6.6.43+git-r0: task do_deploy_fitimage_unbundled: Succeeded
- To re-view the changes in the task dependencies, the bash script bellow
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

    bitbake core-image-minimal -g
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

function cleanup {
  rm -f build/conf/auto.conf task-depends-filtered-old.dot task-depends-filtered.dot task-depends.dot
}
trap cleanup EXIT

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

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE = "Image"
EOF
run_bitbake_per_branch "image, no fitimage"

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE = "Image"
IMAGE_FSTYPES += "cpio.gz"
INITRAMFS_IMAGE = "core-image-minimal-initramfs"
INITRAMFS_IMAGE_BUNDLE = "1"
EOF
run_bitbake_per_branch "image, no fitimage, initramfs, bundled"

cat << EOF > build/conf/auto.conf
KERNEL_IMAGETYPE = "Image"
IMAGE_FSTYPES += "cpio.gz"
INITRAMFS_IMAGE = "core-image-minimal-initramfs"
INITRAMFS_IMAGE_BUNDLE = ""
EOF
run_bitbake_per_branch "image, no fitimage, initramfs, not bundled"

Adrian Freihofer (4):
  kernel: refactor linux compression
  kernel-fitimage: refactor fitimage_assemble
  kernel: refactor fitimage
  kernel-fitimage: run unbundled fitimage after deploy

 meta/classes-recipe/image.bbclass           |  12 +-
 meta/classes-recipe/kernel-fitimage.bbclass | 152 +++++++++++++-------
 meta/classes-recipe/kernel-uboot.bbclass    |   1 +
 meta/classes-recipe/kernel.bbclass          |  32 +++--
 4 files changed, 130 insertions(+), 67 deletions(-)

-- 
2.46.0


