Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC36C3DA4A
	for <webhook@archiver.kernel.org>; Mon, 19 Aug 2024 15:22:08 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.web10.213177.1724080926873414703
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Aug 2024 08:22:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=N17I56YI;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-429ec9f2155so29557255e9.2
        for <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 08:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724080925; x=1724685725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNiOQbu4mVbF9IEwDnnp014V0PghCka+W+X7uLEOfx0=;
        b=N17I56YIIFDdOkh/cZz4otOPHPcN+kmOWR091xsTnjo2rk41D6ejcU+H8UUB63fH8M
         nmHfOHy3NiS7Iomo9BSu3ZWDYar1StlJEx+vjYiPiDEJrkJ+zPpIua06ihUHxxx3pygO
         EWQcMrVPHys6sYWijFKecsS3V+CDYkeIZQ86Nkg8Dz/7p/rjooIJ5zJUNns2N1EvaNCR
         +aBQ1MGNn6bXz37l1JuectdJQikurZ1k73zowv0vw99ikWHPA5schprKjQLk4zukT5Fr
         7sNg1b0hySkynvOKAT9sJB9vam/NViyKP8ao8uF4hS0QFYchj+Sklj0PNBF5H6rQj9Qm
         F5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724080925; x=1724685725;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNiOQbu4mVbF9IEwDnnp014V0PghCka+W+X7uLEOfx0=;
        b=T1YjrATw1es0xMIxcHb/c6Ao8LOwVgELelO1kAt3fuKZiE9xLMtKosnsRuqaJgBGvc
         wJDNTxM0ZxAXoJP0GLYPlskHZX2bR7AkvJIdUr+s3ce6kOwlI6IqonrdCAw9nFuvVYmv
         KHTawo5At8gP/4Yn2Hut6dA90NHRT/EmY4eUfJHf8Y7iwT2sga4aIzPQwt+MtwnIz84/
         g2V3IQT9B8I3VNi21q58q7Za2vurQ5UEPm2Xxk0nBzh6BrkHLQOngm6FMQ77W9AUL6Bn
         e428iO34E3KQXuNiYpe5WkaEdm0IRkQVDBMR97Si83sxZUs0gU5N65Ceo2G0Viq+DZ6t
         TXyg==
X-Gm-Message-State: AOJu0Yyes/6/R9vz1WsXsazaoHAW+WaHsoWmdWRQGiIkLb2yIDinZTdO
	x3dyb0OBXfcSYeYl6H662T4fp0Uz3TwHpo1DQcQ7tbXuZNqE9JCdcA4LMg==
X-Google-Smtp-Source: AGHT+IGFHI+4FAddWmZOVL/v9Vk5Hm27rlvv0Hm3jpJp80i+8XQ4fpeMcd0Fo9ZJNSNDQEf0M85m4A==
X-Received: by 2002:a5d:4dce:0:b0:36b:555a:e966 with SMTP id ffacd0b85a97d-3719465fc3amr8368934f8f.35.1724080924657;
        Mon, 19 Aug 2024 08:22:04 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718985a286sm10782649f8f.54.2024.08.19.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 08:22:01 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH v4 0/4] Use the kernel from sstate when building fitImages
Date: Mon, 19 Aug 2024 17:17:04 +0200
Message-ID: <20240819152136.1185744-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Aug 2024 15:22:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203510

Compared to v3, only one space changes. Unfortunately it is an important
white space. The diff between v3 and v4 is:

--- a/meta/classes-recipe/kernel-fitimage.bbclass
+++ b/meta/classes-recipe/kernel-fitimage.bbclass
@@ -65,7 +65,7 @@ python __anonymous () {
                 fit_assemble_task = 'do_deploy_fitimage_unbundled'
                 bb.build.addtask(fit_assemble_task, 'do_build', 'do_deploy', d)
                 bb.build.addtask(fit_assemble_task + '_setscene', '', '', d)
-                d.appendVar('SSTATETASKS', fit_assemble_task)
+                d.appendVar('SSTATETASKS', ' ' + fit_assemble_task)

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
- To re-view the changes in the task dependencies, the bash script which was sent as a
  separate (html formated) e-mail with v3 has been used. It confirms:
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


