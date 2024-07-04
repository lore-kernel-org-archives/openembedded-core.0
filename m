Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C2ECC3065C
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 07:10:23 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web11.4916.1720077023036196166
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 00:10:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Vr+ZOtBJ;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-424acf3226fso2000775e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720077020; x=1720681820; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Avxqbf3dsP9Y92ybo9lTQJlmoEBVoZGmtcKKMtosNkE=;
        b=Vr+ZOtBJmF87Dl7BPRamhExEcsEYe4jl1SlmH8q//s0IKGBb1SJvhQJj10SAGyeRpP
         KSVUrRl4KcHdU0TYX9I9r3rsZA3WUIymViD24HJx8SbgRqDkTrZ5OsJ+DszMQga4GP+5
         SFGUrvzF6e7MzC3m+MPdpHiML2AneoI22l+ZoZEXbnDM3S+g2FnhrYv/vkEFbfr0znE0
         hGkRgmqt5Yw7lZy2WYgAv7urJgCM5aG3Tr4cj7ItOSjmaLuJ+/x4tXjeupPqn5vcsLAw
         lRTVrdbxejrkyMj57PCCNflT/i3m7cSOAKJsun4yCIgI5JFYJHyADYW5ZE1FYn85tK8B
         boog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720077020; x=1720681820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Avxqbf3dsP9Y92ybo9lTQJlmoEBVoZGmtcKKMtosNkE=;
        b=tp+e7oyuG+LQyo5jQqMZhx9awZ3ZlTnaswQiCg8nRfaHPtWF4tGSiKH3gSmX9sFVSc
         6nd8aiwdlYiZM0eKaBEHvSwREZRF1+fMVkIucab22MzlGq/GUTJO0vbrMTmlYjpJ9GKI
         kIKMspVvsgGU+M9WasN4QOR7D7hbWPHXFqA7UnZYd3bUgILOcOPm7SlCNnQVqR8o1STo
         QdE0FIMc/qYYHNoEV/yfYrfvTxqDgU7+zlPyD8pMO0BEW8SzkzMmxZQx4+sTvV7sBZl+
         JdWzr0YdJ35nHk1NiSitETJ4ffj11EMwjn5oH6tZWnIWd28MjZGTd6XcZZHHU2aZNCJk
         9IzQ==
X-Gm-Message-State: AOJu0Yzial+A+lIDpzC10chmL/D6O/cLJJGaPIUVFGFn3/IyfH8p0JPk
	KEeV7t//dgu1q5pNEgeWUipo07Z7iFirRJ/yrPGmvckDjfSVUOIpz//hgQ==
X-Google-Smtp-Source: AGHT+IGVNIpsy4j6kE+CW7CH7lgnDnjV9SlKkqA2AnyUQ5b8MbEIu6nEkAlhxPcGlllrq1TKo7FHlg==
X-Received: by 2002:a7b:cbd4:0:b0:425:60c3:28ee with SMTP id 5b1f17b1804b1-4264a469e31mr4990835e9.40.1720077019820;
        Thu, 04 Jul 2024 00:10:19 -0700 (PDT)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1f23f9sm11597255e9.26.2024.07.04.00.10.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 00:10:19 -0700 (PDT)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>
Subject: [PATCH 00/14] Use the kernel from sstate when building fitImages
Date: Thu,  4 Jul 2024 09:09:36 +0200
Message-ID: <20240704071013.2982700-1-adrian.freihofer@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 07:10:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201506

If the KERNEL_IMAGETYPES(S) contains fitImage, the kernel is always
rebuilt when something changes in the initramfs, which happens
frequently.
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

Adrian Freihofer (14):
  oe-selftest: wic fix deps of test_efi_plugin_unified_kernel_image_qemu
  oe-selftest: fitimage refactor u-boot-tools-native
  oe-selftest: fitimage drop test-mkimage-wrapper
  oe-selftest: fitimage cleanup asserts
  oe-selftest: fitimage fix test_initramfs_bundle
  kernel-fitimage: fix handling of empty default dtb
  kernel-fitimage: fix external dtb check
  kernel: execute do_bundle_initramfs only when needed
  kernel-fitimage: refactor do_assemble_fitimage_initramfs
  kernel-fitimage: refactor creation of linux.bin
  kernel-fitimage: fix intentation
  kernel-fitimage: run unbundled fitimage after deploy
  image: depends do_deploy_fitimage_unbundled
  DO NOT MERGE: explanation and testing

 kernel-tasks.sh                               |   76 ++
 .../classes/test-mkimage-wrapper.bbclass      |   19 -
 meta/classes-recipe/image.bbclass             |   12 +-
 meta/classes-recipe/kernel-fitimage.bbclass   |  179 ++-
 meta/classes-recipe/kernel-uboot.bbclass      |   17 +
 meta/classes-recipe/kernel.bbclass            |   17 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  264 ++--
 meta/lib/oeqa/selftest/cases/wic.py           |    6 +-
 task-depends.html                             | 1122 +++++++++++++++++
 9 files changed, 1490 insertions(+), 222 deletions(-)
 create mode 100755 kernel-tasks.sh
 delete mode 100644 meta-selftest/classes/test-mkimage-wrapper.bbclass
 create mode 100644 task-depends.html

-- 
2.45.2


