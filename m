Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3971CC61D9C
	for <webhook@archiver.kernel.org>; Wed, 22 Nov 2023 12:45:18 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web10.18517.1700657110221785986
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Nov 2023 04:45:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ICrvYWDW;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: martin.jansa@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507ad511315so9569780e87.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 04:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700657108; x=1701261908; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ij/ZLFPM4I2Xc1bUFATl9Kak4goSomfuWsXelQesr7A=;
        b=ICrvYWDWO/FbAj828eatgSiYK9h3RHLqKAI+Bibw28B5VkKAUU1AZzJnaFOzPg2ST6
         lDzJJ9A8bGpuaVp1Srbq0tUA7XySsVmLNPXQ/t6UedVWVN+Tc+Awqa8n6g7CSTLRtDqD
         EcdWsuZcuE+69Sxb5GXE4bx8AYKZ3h7vcpyv2L9OymTn3aCsJEapcFD+z0clTU1sta8O
         5RL8v6j64QZpcVuUClNi6u5GSmz5PuDZRj/KH31Z+psjWBCFIW9T1XGjCEZBIawWbq9l
         WsSP142BjlSrBzkq/5wZYlew31nQj7lB+AAKGcw6N8pqN26mfATjut9la0RQoRpmcT/q
         4jTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700657108; x=1701261908;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ij/ZLFPM4I2Xc1bUFATl9Kak4goSomfuWsXelQesr7A=;
        b=IkLneF+wp6xBGFk2/icW4Umq7JZka4hcpuJcRxap7B44cxIw5w5VRGGOJFFLYSHira
         OSA6yPfKYpY6VVq09blq64wbh7oAMivbKDw+zmM70O9vSgg42zGskLWfh1/BVC+gl6Kv
         BcLVfjQdayHrGvYbAKQee6gM9hiAXRKIlanSwFZkG0toJoD2eoBCdpdwVSi3ujp/ylUD
         qtaBA8i9/ASyo/oBv2VX1/l5jLMKO55h7HZLQi+GK6M067gHEXaAM3aFsYgabIN7jNGO
         QneOnWFHmVqRmFju9ABmA8E/0Gw5yz3Na96PVO2PztUKJynbPwrrRTXOVSyB9r3AfV+d
         D7hA==
X-Gm-Message-State: AOJu0YzkDnvr6mwLj0YXgMek9bM3Oylee2hH1FjjWe5iZfU5D3xbv5GF
	eruEPCNMaNUvNFcLZ3Q9YaPTkX/9Gqo=
X-Google-Smtp-Source: AGHT+IFVdaw+FcwbaKQmedQKB4GgbCCwbz5SkZDFiJcSc1Cq9+JddpziZM1ZtCOKMKy/T48F6zU2Rw==
X-Received: by 2002:a05:6512:2307:b0:508:1a25:a190 with SMTP id o7-20020a056512230700b005081a25a190mr1938818lfu.23.1700657108012;
        Wed, 22 Nov 2023 04:45:08 -0800 (PST)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id hh10-20020a170906a94a00b009b2ca104988sm6592079ejb.98.2023.11.22.04.45.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 04:45:07 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 00/21] Consistent naming scheme for deployed artifacts
Date: Wed, 22 Nov 2023 13:44:30 +0100
Message-ID: <cover.1700600804.git.martin.jansa@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Nov 2023 12:45:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191077

This is the final part of changes for [YOCTO #12937].

I've run complete selftest with this and didn't see any failures.

Only these 4 fail once, but pass when re-executed (and the same is
reproducible here with master):
pkgdata.OePkgdataUtilTests.test_lookup_recipe
spdx.SPDXCheck.test_spdx_base_files
esdk.oeSDKExtSelfTest.test_image_generation_binary_feeds
esdk.oeSDKExtSelfTest.test_install_libraries_headers

runtime_test.TestImage.test_testimage_virgl_gtk_sdl and this one
needs extra "xhost +local" otherwise fails with:
  runqemu - ERROR - Failed to run qemu: Invalid MIT-MAGIC-COOKIE-1 key
  qemu-system-x86_64: OpenGL is not supported by the display

The short description of these changes is that instead of symlinks
it creates hardlinks in deploy dir and the kernel do_deploy creates
the artifacts without version suffix and the do_deploy_links task
adds those versioned hardlinks (this way do_deploy can be reused from
sstate and only quick do_deploy_links is re-executed when the
IMAGE_VERSION_SUFFIX changes - before that if you cannot re-use do_deploy
from sstate due to different artifact filenames you had to re-run e.g.
do_compile as well if you haven't built the same in the same TMPDIR
before).

Here are some examples how the artifacts change with these changes.
To shows more artifacts all 3 builds are executed with this in local.conf:

IMAGE_FSTYPES:append:pn-core-image-base = " ubi"
MKUBIFS_ARGS = "-m 2048 -e 129024 -c 968 -x zlib"
UBINIZE_ARGS = "-m 2048 -p 131072 -s 512"

IMAGE_GEN_DEBUGFS = "1"
IMAGE_FSTYPES_DEBUGFS = "tar.bz2"

## RAM disk variables including load address and entrypoint for kernel and RAM disk
IMAGE_FSTYPES += "cpio.gz"
INITRAMFS_IMAGE = "core-image-minimal"
## core-image-minimal is used as initramfs here, drop the rootfs suffix
IMAGE_NAME_SUFFIX:pn-core-image-minimal = "" 

MACHINE = "qemuarm"
UBOOT_MACHINE = "am57xx_evm_defconfig"
SPL_BINARY = "MLO"

# Enable creation of the U-Boot fitImage
UBOOT_FITIMAGE_ENABLE = "1"

# (U-boot) fitImage properties
UBOOT_LOADADDRESS = "0x80080000"
UBOOT_ENTRYPOINT = "0x80080000"
UBOOT_FIT_DESC = "A model description"

# Enable creation of Kernel fitImage
KERNEL_IMAGETYPES += " fitImage "
KERNEL_CLASSES = " kernel-fitimage"
UBOOT_SIGN_ENABLE = "1"
FIT_GENERATE_KEYS = "1"
UBOOT_SIGN_KEYDIR = "${TOPDIR}/signing-keys"
UBOOT_SIGN_IMG_KEYNAME = "img-oe-selftest"
UBOOT_SIGN_KEYNAME = "cfg-oe-selftest"
FIT_SIGN_INDIVIDUAL = "1"

And in all 4 cases I'm building:
bitbake -k core-image-base virtual/bootloader

1) current state without these changes (poky master 4d6c63a56c50536806b21cbe72416d8f1b84f589):
$ ls -lai tmp/deploy/images/qemuarm/
total 953640
50382661 drwxr-xr-x 2 martin martin      4096 Nov 21 21:09 .
50343736 drwxr-xr-x 3 martin martin      4096 Nov 21 18:38 ..
55399695 lrwxrwxrwx 2 martin martin        22 Nov 21 21:06 MLO -> MLO-qemuarm-2023.10-r0
55399694 lrwxrwxrwx 2 martin martin        22 Nov 21 21:06 MLO-qemuarm -> MLO-qemuarm-2023.10-r0
55399696 -rw-r--r-- 2 martin martin    127376 Nov 21 21:06 MLO-qemuarm-2023.10-r0
56663681 -rw-r--r-- 2 martin martin  27929206 Nov 21 21:09 core-image-base-qemuarm.rootfs-20231121200800.cpio.gz
56663745 -rw-r--r-- 2 martin martin  68956160 Nov 21 21:09 core-image-base-qemuarm.rootfs-20231121200800.ext4
56653281 -rw-r--r-- 2 martin martin      3902 Nov 21 21:08 core-image-base-qemuarm.rootfs-20231121200800.manifest
56653982 -rw-r--r-- 2 martin martin      1855 Nov 21 21:08 core-image-base-qemuarm.rootfs-20231121200800.qemuboot.conf
56653221 -rw-r--r-- 2 martin martin    412044 Nov 21 21:08 core-image-base-qemuarm.rootfs-20231121200800.spdx.tar.zst
56664021 -rw-r--r-- 2 martin martin  27268823 Nov 21 21:09 core-image-base-qemuarm.rootfs-20231121200800.tar.bz2
56653314 -rw-r--r-- 2 martin martin    263900 Nov 21 21:08 core-image-base-qemuarm.rootfs-20231121200800.testdata.json
56663665 -rw-r--r-- 2 martin martin  34209792 Nov 21 21:09 core-image-base-qemuarm.rootfs-20231121200800.ubi
56653782 -rw-r--r-- 2 martin martin  33417216 Nov 21 21:09 core-image-base-qemuarm.rootfs-20231121200800.ubifs
56664023 -rw-r--r-- 2 martin martin 381871540 Nov 21 21:09 core-image-base-qemuarm.rootfs-dbg-20231121200800-dbg.tar.bz2
56653980 lrwxrwxrwx 2 martin martin        61 Nov 21 21:09 core-image-base-qemuarm.rootfs-dbg.tar.bz2 -> core-image-base-qemuarm.rootfs-dbg-20231121200800-dbg.tar.bz2
56663713 lrwxrwxrwx 2 martin martin        53 Nov 21 21:09 core-image-base-qemuarm.rootfs.cpio.gz -> core-image-base-qemuarm.rootfs-20231121200800.cpio.gz
56663729 lrwxrwxrwx 2 martin martin        50 Nov 21 21:09 core-image-base-qemuarm.rootfs.ext4 -> core-image-base-qemuarm.rootfs-20231121200800.ext4
56653265 lrwxrwxrwx 2 martin martin        54 Nov 21 21:08 core-image-base-qemuarm.rootfs.manifest -> core-image-base-qemuarm.rootfs-20231121200800.manifest
56653981 lrwxrwxrwx 2 martin martin        59 Nov 21 21:08 core-image-base-qemuarm.rootfs.qemuboot.conf -> core-image-base-qemuarm.rootfs-20231121200800.qemuboot.conf
56653214 lrwxrwxrwx 2 martin martin        58 Nov 21 21:08 core-image-base-qemuarm.rootfs.spdx.tar.zst -> core-image-base-qemuarm.rootfs-20231121200800.spdx.tar.zst
56664022 lrwxrwxrwx 2 martin martin        53 Nov 21 21:09 core-image-base-qemuarm.rootfs.tar.bz2 -> core-image-base-qemuarm.rootfs-20231121200800.tar.bz2
56653302 lrwxrwxrwx 2 martin martin        59 Nov 21 21:08 core-image-base-qemuarm.rootfs.testdata.json -> core-image-base-qemuarm.rootfs-20231121200800.testdata.json
56663649 lrwxrwxrwx 2 martin martin        49 Nov 21 21:09 core-image-base-qemuarm.rootfs.ubi -> core-image-base-qemuarm.rootfs-20231121200800.ubi
56664020 lrwxrwxrwx 2 martin martin        51 Nov 21 21:09 core-image-base-qemuarm.rootfs.ubifs -> core-image-base-qemuarm.rootfs-20231121200800.ubifs
55403633 -rw-r--r-- 2 martin martin   4246096 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.cpio.gz
55403425 -rw-r--r-- 2 martin martin  13312000 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.ext4
55399673 -rw-r--r-- 2 martin martin      1100 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.manifest
55388983 -rw-r--r-- 2 martin martin      1853 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.qemuboot.conf
55399650 -rw-r--r-- 2 martin martin    121444 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.spdx.tar.zst
55402991 -rw-r--r-- 2 martin martin   4051489 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.tar.bz2
55399657 -rw-r--r-- 2 martin martin    264570 Nov 21 21:06 core-image-minimal-qemuarm-20231121200604.testdata.json
55402853 -rw-r--r-- 2 martin martin 320490408 Nov 21 21:06 core-image-minimal-qemuarm-dbg-20231121200604-dbg.tar.bz2
55402737 lrwxrwxrwx 2 martin martin        57 Nov 21 21:06 core-image-minimal-qemuarm-dbg.tar.bz2 -> core-image-minimal-qemuarm-dbg-20231121200604-dbg.tar.bz2
55403601 lrwxrwxrwx 2 martin martin        49 Nov 21 21:06 core-image-minimal-qemuarm.cpio.gz -> core-image-minimal-qemuarm-20231121200604.cpio.gz
55403441 lrwxrwxrwx 2 martin martin        46 Nov 21 21:06 core-image-minimal-qemuarm.ext4 -> core-image-minimal-qemuarm-20231121200604.ext4
55399672 lrwxrwxrwx 2 martin martin        50 Nov 21 21:06 core-image-minimal-qemuarm.manifest -> core-image-minimal-qemuarm-20231121200604.manifest
55388981 lrwxrwxrwx 2 martin martin        55 Nov 21 21:06 core-image-minimal-qemuarm.qemuboot.conf -> core-image-minimal-qemuarm-20231121200604.qemuboot.conf
55399649 lrwxrwxrwx 2 martin martin        54 Nov 21 21:06 core-image-minimal-qemuarm.spdx.tar.zst -> core-image-minimal-qemuarm-20231121200604.spdx.tar.zst
55402961 lrwxrwxrwx 2 martin martin        49 Nov 21 21:06 core-image-minimal-qemuarm.tar.bz2 -> core-image-minimal-qemuarm-20231121200604.tar.bz2
55399656 lrwxrwxrwx 2 martin martin        55 Nov 21 21:06 core-image-minimal-qemuarm.testdata.json -> core-image-minimal-qemuarm-20231121200604.testdata.json
55345065 lrwxrwxrwx 2 martin martin        73 Nov 21 20:41 fitImage -> fitImage--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345068 -rw-r--r-- 2 martin martin   7151161 Nov 21 20:41 fitImage--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345081 -rw-r--r-- 2 martin martin  11398625 Nov 21 20:41 fitImage-core-image-minimal-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345054 lrwxrwxrwx 2 martin martin       100 Nov 21 20:41 fitImage-core-image-minimal-qemuarm-qemuarm -> fitImage-core-image-minimal-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345084 -rw-r--r-- 2 martin martin      1638 Nov 21 20:41 fitImage-its--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.its
55345052 -rw-r--r-- 2 martin martin      2425 Nov 21 20:41 fitImage-its-core-image-minimal-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.its
55345056 lrwxrwxrwx 2 martin martin       104 Nov 21 20:41 fitImage-its-core-image-minimal-qemuarm-qemuarm -> fitImage-its-core-image-minimal-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.its
55345063 lrwxrwxrwx 2 martin martin        77 Nov 21 20:41 fitImage-its-qemuarm -> fitImage-its--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.its
55345058 -rw-r--r-- 2 martin martin   7149168 Nov 21 20:41 fitImage-linux.bin--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345059 lrwxrwxrwx 2 martin martin        83 Nov 21 20:41 fitImage-linux.bin-qemuarm -> fitImage-linux.bin--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345053 lrwxrwxrwx 2 martin martin        73 Nov 21 20:41 fitImage-qemuarm.bin -> fitImage--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345089 -rw-r--r-- 2 martin martin  45290074 Nov 21 20:41 modules--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.tgz
55345086 lrwxrwxrwx 2 martin martin        72 Nov 21 20:41 modules-qemuarm.tgz -> modules--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.tgz
55399706 lrwxrwxrwx 2 martin martin        34 Nov 21 21:06 u-boot-fitImage -> u-boot-fitImage-qemuarm-2023.10-r0
55399705 lrwxrwxrwx 2 martin martin        34 Nov 21 21:06 u-boot-fitImage-qemuarm -> u-boot-fitImage-qemuarm-2023.10-r0
55399719 -rw-r--r-- 2 martin martin    786682 Nov 21 21:06 u-boot-fitImage-qemuarm-2023.10-r0
55399697 lrwxrwxrwx 2 martin martin        37 Nov 21 21:06 u-boot-initial-env -> u-boot-initial-env-qemuarm-2023.10-r0
55399698 lrwxrwxrwx 2 martin martin        37 Nov 21 21:06 u-boot-initial-env-qemuarm -> u-boot-initial-env-qemuarm-2023.10-r0
55399699 -rw-r--r-- 2 martin martin     12284 Nov 21 21:06 u-boot-initial-env-qemuarm-2023.10-r0
55399707 lrwxrwxrwx 2 martin martin        29 Nov 21 21:06 u-boot-its-qemuarm -> u-boot-its-qemuarm-2023.10-r0
55399714 -rw-r--r-- 2 martin martin       805 Nov 21 21:06 u-boot-its-qemuarm-2023.10-r0
55399715 -rw-r--r-- 2 martin martin    645864 Nov 21 21:06 u-boot-nodtb-qemuarm-2023.10-r0.bin
55399710 lrwxrwxrwx 2 martin martin        35 Nov 21 21:06 u-boot-nodtb-qemuarm.bin -> u-boot-nodtb-qemuarm-2023.10-r0.bin
55399709 lrwxrwxrwx 2 martin martin        35 Nov 21 21:06 u-boot-nodtb.bin -> u-boot-nodtb-qemuarm-2023.10-r0.bin
55399704 -rw-r--r-- 2 martin martin    785024 Nov 21 21:06 u-boot-qemuarm-2023.10-r0.bin
55399716 -rw-r--r-- 2 martin martin    139160 Nov 21 21:06 u-boot-qemuarm-2023.10-r0.dtb
55399700 lrwxrwxrwx 2 martin martin        34 Nov 21 21:06 u-boot-qemuarm.bin -> u-boot-fitImage-qemuarm-2023.10-r0
55399711 lrwxrwxrwx 2 martin martin        29 Nov 21 21:06 u-boot-qemuarm.dtb -> u-boot-qemuarm-2023.10-r0.dtb
55399693 lrwxrwxrwx 2 martin martin        34 Nov 21 21:06 u-boot.bin -> u-boot-fitImage-qemuarm-2023.10-r0
55399713 lrwxrwxrwx 2 martin martin        29 Nov 21 21:06 u-boot.dtb -> u-boot-qemuarm-2023.10-r0.dtb
55399708 lrwxrwxrwx 2 martin martin        29 Nov 21 21:06 u-boot.its -> u-boot-its-qemuarm-2023.10-r0
36783108 -rw-r--r-- 2 martin martin       261 Nov 21 21:09 ubinize-core-image-base-qemuarm.rootfs-20231121200800.cfg
55345074 lrwxrwxrwx 2 martin martin        71 Nov 21 20:41 zImage -> zImage--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345061 -rw-r--r-- 2 martin martin   7149168 Nov 21 20:41 zImage--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin
55345077 lrwxrwxrwx 2 martin martin        71 Nov 21 20:41 zImage-qemuarm.bin -> zImage--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-qemuarm-20231121193746.bin

2) with these changes:
$ ls -lai tmp/deploy/images/qemuarm/
total 1909580
50382661 drwxr-xr-x  2 martin martin      4096 Nov 21 21:16 .
50343736 drwxr-xr-x  3 martin martin      4096 Nov 21 18:38 ..
55400346 -rw-r--r--  6 martin martin    127376 Nov 21 21:15 MLO
55400346 -rw-r--r--  6 martin martin    127376 Nov 21 21:15 MLO-qemuarm
55400346 -rw-r--r--  6 martin martin    127376 Nov 21 21:15 MLO-qemuarm-1-2023.10-r0-20231002143959
56664035 -rw-r--r--  4 martin martin  27929209 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.cpio.gz
56653965 -rw-r--r--  4 martin martin  68956160 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.ext4
56653974 -rw-r--r--  4 martin martin      3902 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.manifest
56653966 -rw-r--r--  4 martin martin      1863 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.qemuboot.conf
56653972 -rw-r--r--  4 martin martin    411979 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.spdx.tar.zst
56653502 -rw-r--r--  4 martin martin  27269124 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.tar.bz2
56653980 -rw-r--r--  4 martin martin    263127 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.testdata.json
56653504 -rw-r--r--  4 martin martin  34209792 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.ubi
56653745 -rw-r--r--  4 martin martin  33417216 Nov 21 21:16 core-image-base-qemuarm.rootfs--1.0-r0-20110405230000.ubifs
56653601 -rw-r--r--  4 martin martin 381865904 Nov 21 21:16 core-image-base-qemuarm.rootfs-dbg--1.0-r0-20110405230000.tar.bz2
56653601 -rw-r--r--  4 martin martin 381865904 Nov 21 21:16 core-image-base-qemuarm.rootfs-dbg.tar.bz2
56664035 -rw-r--r--  4 martin martin  27929209 Nov 21 21:16 core-image-base-qemuarm.rootfs.cpio.gz
56653965 -rw-r--r--  4 martin martin  68956160 Nov 21 21:16 core-image-base-qemuarm.rootfs.ext4
56653974 -rw-r--r--  4 martin martin      3902 Nov 21 21:16 core-image-base-qemuarm.rootfs.manifest
56653966 -rw-r--r--  4 martin martin      1863 Nov 21 21:16 core-image-base-qemuarm.rootfs.qemuboot.conf
56653972 -rw-r--r--  4 martin martin    411979 Nov 21 21:16 core-image-base-qemuarm.rootfs.spdx.tar.zst
56653502 -rw-r--r--  4 martin martin  27269124 Nov 21 21:16 core-image-base-qemuarm.rootfs.tar.bz2
56653980 -rw-r--r--  4 martin martin    263127 Nov 21 21:16 core-image-base-qemuarm.rootfs.testdata.json
56653504 -rw-r--r--  4 martin martin  34209792 Nov 21 21:16 core-image-base-qemuarm.rootfs.ubi
56653745 -rw-r--r--  4 martin martin  33417216 Nov 21 21:16 core-image-base-qemuarm.rootfs.ubifs
55410186 -rw-r--r--  4 martin martin   4246097 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.cpio.gz
55410200 -rw-r--r--  4 martin martin  13312000 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.ext4
55400439 -rw-r--r--  4 martin martin      1100 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.manifest
55389154 -rw-r--r--  4 martin martin      1861 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.qemuboot.conf
55400421 -rw-r--r--  4 martin martin    121444 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.spdx.tar.zst
55410228 -rw-r--r--  4 martin martin   4052845 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.tar.bz2
55400426 -rw-r--r--  4 martin martin    263797 Nov 21 21:16 core-image-minimal-qemuarm--1.0-r0-20110405230000.testdata.json
55410236 -rw-r--r--  4 martin martin 320483523 Nov 21 21:16 core-image-minimal-qemuarm-dbg--1.0-r0-20110405230000.tar.bz2
55410236 -rw-r--r--  4 martin martin 320483523 Nov 21 21:16 core-image-minimal-qemuarm-dbg.tar.bz2
55410186 -rw-r--r--  4 martin martin   4246097 Nov 21 21:16 core-image-minimal-qemuarm.cpio.gz
55410200 -rw-r--r--  4 martin martin  13312000 Nov 21 21:16 core-image-minimal-qemuarm.ext4
55400439 -rw-r--r--  4 martin martin      1100 Nov 21 21:16 core-image-minimal-qemuarm.manifest
55389154 -rw-r--r--  4 martin martin      1861 Nov 21 21:16 core-image-minimal-qemuarm.qemuboot.conf
55400421 -rw-r--r--  4 martin martin    121444 Nov 21 21:16 core-image-minimal-qemuarm.spdx.tar.zst
55410228 -rw-r--r--  4 martin martin   4052845 Nov 21 21:16 core-image-minimal-qemuarm.tar.bz2
55400426 -rw-r--r--  4 martin martin    263797 Nov 21 21:16 core-image-minimal-qemuarm.testdata.json
55342817 lrwxrwxrwx  2 martin martin        20 Nov 21 18:38 fitImage -> fitImage-qemuarm.bin
55342785 -rw-r--r--  3 martin martin  11398629 Nov 21 18:38 fitImage-core-image-minimal-qemuarm-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.bin
55342785 -rw-r--r--  3 martin martin  11398629 Nov 21 18:38 fitImage-core-image-minimal-qemuarm-qemuarm.bin
55342721 -rw-r--r--  3 martin martin      2425 Nov 21 18:38 fitImage-its-core-image-minimal-qemuarm-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.its
55342721 -rw-r--r--  3 martin martin      2425 Nov 21 18:38 fitImage-its-core-image-minimal-qemuarm-qemuarm.its
55342801 -rw-r--r--  3 martin martin      1638 Nov 21 18:38 fitImage-its-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.its
55342801 -rw-r--r--  3 martin martin      1638 Nov 21 18:38 fitImage-its-qemuarm.its
55342737 -rw-r--r--  3 martin martin   7149168 Nov 21 18:38 fitImage-linux-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.bin
55342737 -rw-r--r--  3 martin martin   7149168 Nov 21 18:38 fitImage-linux-qemuarm.bin
55342833 -rw-r--r--  3 martin martin   7151161 Nov 21 18:38 fitImage-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.bin
55342833 -rw-r--r--  3 martin martin   7151161 Nov 21 18:38 fitImage-qemuarm.bin
55342705 -rw-r--r--  3 martin martin  45290074 Nov 21 18:38 modules-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.tgz
55342705 -rw-r--r--  3 martin martin  45290074 Nov 21 18:38 modules-qemuarm.tgz
55400356 -rw-r--r-- 10 martin martin    786682 Nov 21 21:15 u-boot-fitImage
55400356 -rw-r--r-- 10 martin martin    786682 Nov 21 21:15 u-boot-fitImage-qemuarm
55400356 -rw-r--r-- 10 martin martin    786682 Nov 21 21:15 u-boot-fitImage-qemuarm-1-2023.10-r0-20231002143959
55400348 -rw-r--r--  4 martin martin     12284 Nov 21 21:15 u-boot-initial-env-qemuarm
55400348 -rw-r--r--  4 martin martin     12284 Nov 21 21:15 u-boot-initial-env-qemuarm-1-2023.10-r0-20231002143959
55400355 -rw-r--r--  6 martin martin       805 Nov 21 21:15 u-boot-its-qemuarm
55400355 -rw-r--r--  6 martin martin       805 Nov 21 21:15 u-boot-its-qemuarm-1-2023.10-r0-20231002143959
55400358 -rw-r--r--  6 martin martin    645864 Nov 21 21:15 u-boot-nodtb-qemuarm-1-2023.10-r0-20231002143959.bin
55400358 -rw-r--r--  6 martin martin    645864 Nov 21 21:15 u-boot-nodtb-qemuarm.bin
55400358 -rw-r--r--  6 martin martin    645864 Nov 21 21:15 u-boot-nodtb.bin
55400356 -rw-r--r-- 10 martin martin    786682 Nov 21 21:15 u-boot-qemuarm-1-2023.10-r0-20231002143959.bin
55400359 -rw-r--r--  6 martin martin    139160 Nov 21 21:15 u-boot-qemuarm-1-2023.10-r0-20231002143959.dtb
55400351 -rw-r--r--  2 martin martin    785024 Nov 21 21:15 u-boot-qemuarm.bin
55400359 -rw-r--r--  6 martin martin    139160 Nov 21 21:15 u-boot-qemuarm.dtb
55400356 -rw-r--r-- 10 martin martin    786682 Nov 21 21:15 u-boot.bin
55400359 -rw-r--r--  6 martin martin    139160 Nov 21 21:15 u-boot.dtb
55400355 -rw-r--r--  6 martin martin       805 Nov 21 21:15 u-boot.its
36783110 -rw-r--r--  2 martin martin       246 Nov 21 21:16 ubinize-core-image-base-qemuarm.rootfs.cfg
55342769 lrwxrwxrwx  2 martin martin        18 Nov 21 18:38 zImage -> zImage-qemuarm.bin
55342753 -rw-r--r--  3 martin martin   7149168 Nov 21 18:38 zImage-qemuarm--6.5.10+git0+e4aaaaddfa_eb2eba60c7-r0-20110405230000.bin
55342753 -rw-r--r--  3 martin martin   7149168 Nov 21 18:38 zImage-qemuarm.bin

3) with "release" version IMAGE_VERSION_SUFFIX = "-V1":
$ ls -lai tmp/deploy/images/qemuarm/
total 1909556
51150241 drwxr-xr-x  2 martin martin      4096 Nov 21 22:22 .
50343736 drwxr-xr-x  3 martin martin      4096 Nov 21 22:22 ..
55362504 -rw-r--r--  6 martin martin    127376 Nov 21 22:22 MLO
55362504 -rw-r--r--  6 martin martin    127376 Nov 21 22:22 MLO-qemuarm
55362504 -rw-r--r--  6 martin martin    127376 Nov 21 22:22 MLO-qemuarm-V1
56625100 -rw-r--r--  4 martin martin  27929207 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.cpio.gz
56628289 -rw-r--r--  4 martin martin  68956160 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.ext4
56624965 -rw-r--r--  4 martin martin      3902 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.manifest
56628401 -rw-r--r--  4 martin martin      1843 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.qemuboot.conf
56624784 -rw-r--r--  4 martin martin    412033 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.spdx.tar.zst
56628225 -rw-r--r--  4 martin martin  27268318 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.tar.bz2
56632632 -rw-r--r--  4 martin martin    263083 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.testdata.json
56628209 -rw-r--r--  4 martin martin  34209792 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.ubi
56628273 -rw-r--r--  4 martin martin  33417216 Nov 21 22:22 core-image-base-qemuarm.rootfs-V1.ubifs
56628241 -rw-r--r--  4 martin martin 381864544 Nov 21 22:22 core-image-base-qemuarm.rootfs-dbg-V1.tar.bz2
56628241 -rw-r--r--  4 martin martin 381864544 Nov 21 22:22 core-image-base-qemuarm.rootfs-dbg.tar.bz2
56625100 -rw-r--r--  4 martin martin  27929207 Nov 21 22:22 core-image-base-qemuarm.rootfs.cpio.gz
56628289 -rw-r--r--  4 martin martin  68956160 Nov 21 22:22 core-image-base-qemuarm.rootfs.ext4
56624965 -rw-r--r--  4 martin martin      3902 Nov 21 22:22 core-image-base-qemuarm.rootfs.manifest
56628401 -rw-r--r--  4 martin martin      1843 Nov 21 22:22 core-image-base-qemuarm.rootfs.qemuboot.conf
56624784 -rw-r--r--  4 martin martin    412033 Nov 21 22:22 core-image-base-qemuarm.rootfs.spdx.tar.zst
56628225 -rw-r--r--  4 martin martin  27268318 Nov 21 22:22 core-image-base-qemuarm.rootfs.tar.bz2
56632632 -rw-r--r--  4 martin martin    263083 Nov 21 22:22 core-image-base-qemuarm.rootfs.testdata.json
56628209 -rw-r--r--  4 martin martin  34209792 Nov 21 22:22 core-image-base-qemuarm.rootfs.ubi
56628273 -rw-r--r--  4 martin martin  33417216 Nov 21 22:22 core-image-base-qemuarm.rootfs.ubifs
51138044 -rw-r--r--  4 martin martin   4246092 Nov 21 22:22 core-image-minimal-qemuarm-V1.cpio.gz
51138052 -rw-r--r--  4 martin martin  13312000 Nov 21 22:22 core-image-minimal-qemuarm-V1.ext4
51137094 -rw-r--r--  4 martin martin      1100 Nov 21 22:22 core-image-minimal-qemuarm-V1.manifest
51138053 -rw-r--r--  4 martin martin      1841 Nov 21 22:22 core-image-minimal-qemuarm-V1.qemuboot.conf
51138054 -rw-r--r--  4 martin martin    121496 Nov 21 22:22 core-image-minimal-qemuarm-V1.spdx.tar.zst
51138046 -rw-r--r--  4 martin martin   4052033 Nov 21 22:22 core-image-minimal-qemuarm-V1.tar.bz2
51138056 -rw-r--r--  4 martin martin    263753 Nov 21 22:22 core-image-minimal-qemuarm-V1.testdata.json
51138047 -rw-r--r--  4 martin martin 320499203 Nov 21 22:22 core-image-minimal-qemuarm-dbg-V1.tar.bz2
51138047 -rw-r--r--  4 martin martin 320499203 Nov 21 22:22 core-image-minimal-qemuarm-dbg.tar.bz2
51138044 -rw-r--r--  4 martin martin   4246092 Nov 21 22:22 core-image-minimal-qemuarm.cpio.gz
51138052 -rw-r--r--  4 martin martin  13312000 Nov 21 22:22 core-image-minimal-qemuarm.ext4
51137094 -rw-r--r--  4 martin martin      1100 Nov 21 22:22 core-image-minimal-qemuarm.manifest
51138053 -rw-r--r--  4 martin martin      1841 Nov 21 22:22 core-image-minimal-qemuarm.qemuboot.conf
51138054 -rw-r--r--  4 martin martin    121496 Nov 21 22:22 core-image-minimal-qemuarm.spdx.tar.zst
51138046 -rw-r--r--  4 martin martin   4052033 Nov 21 22:22 core-image-minimal-qemuarm.tar.bz2
51138056 -rw-r--r--  4 martin martin    263753 Nov 21 22:22 core-image-minimal-qemuarm.testdata.json
51143764 lrwxrwxrwx  2 martin martin        20 Nov 21 22:22 fitImage -> fitImage-qemuarm.bin
51143844 -rw-r--r--  3 martin martin  11398621 Nov 21 22:22 fitImage-core-image-minimal-qemuarm-qemuarm-V1.bin
51143844 -rw-r--r--  3 martin martin  11398621 Nov 21 22:22 fitImage-core-image-minimal-qemuarm-qemuarm.bin
51143828 -rw-r--r--  3 martin martin      2425 Nov 21 22:22 fitImage-its-core-image-minimal-qemuarm-qemuarm-V1.its
51143828 -rw-r--r--  3 martin martin      2425 Nov 21 22:22 fitImage-its-core-image-minimal-qemuarm-qemuarm.its
51143796 -rw-r--r--  3 martin martin      1638 Nov 21 22:22 fitImage-its-qemuarm-V1.its
51143796 -rw-r--r--  3 martin martin      1638 Nov 21 22:22 fitImage-its-qemuarm.its
51143812 -rw-r--r--  3 martin martin   7149168 Nov 21 22:22 fitImage-linux-qemuarm-V1.bin
51143812 -rw-r--r--  3 martin martin   7149168 Nov 21 22:22 fitImage-linux-qemuarm.bin
51143748 -rw-r--r--  3 martin martin   7151161 Nov 21 22:22 fitImage-qemuarm-V1.bin
51143748 -rw-r--r--  3 martin martin   7151161 Nov 21 22:22 fitImage-qemuarm.bin
51143780 -rw-r--r--  3 martin martin  45290074 Nov 21 22:22 modules-qemuarm-V1.tgz
51143780 -rw-r--r--  3 martin martin  45290074 Nov 21 22:22 modules-qemuarm.tgz
55362520 -rw-r--r-- 10 martin martin    786682 Nov 21 22:22 u-boot-fitImage
55362520 -rw-r--r-- 10 martin martin    786682 Nov 21 22:22 u-boot-fitImage-qemuarm
55362520 -rw-r--r-- 10 martin martin    786682 Nov 21 22:22 u-boot-fitImage-qemuarm-V1
55362507 -rw-r--r--  4 martin martin     12284 Nov 21 22:22 u-boot-initial-env-qemuarm
55362507 -rw-r--r--  4 martin martin     12284 Nov 21 22:22 u-boot-initial-env-qemuarm-V1
55362518 -rw-r--r--  6 martin martin       805 Nov 21 22:22 u-boot-its-qemuarm
55362518 -rw-r--r--  6 martin martin       805 Nov 21 22:22 u-boot-its-qemuarm-V1
55362521 -rw-r--r--  6 martin martin    645864 Nov 21 22:22 u-boot-nodtb-qemuarm-V1.bin
55362521 -rw-r--r--  6 martin martin    645864 Nov 21 22:22 u-boot-nodtb-qemuarm.bin
55362521 -rw-r--r--  6 martin martin    645864 Nov 21 22:22 u-boot-nodtb.bin
55362520 -rw-r--r-- 10 martin martin    786682 Nov 21 22:22 u-boot-qemuarm-V1.bin
55362522 -rw-r--r--  6 martin martin    139160 Nov 21 22:22 u-boot-qemuarm-V1.dtb
55362511 -rw-r--r--  2 martin martin    785024 Nov 21 22:22 u-boot-qemuarm.bin
55362522 -rw-r--r--  6 martin martin    139160 Nov 21 22:22 u-boot-qemuarm.dtb
55362520 -rw-r--r-- 10 martin martin    786682 Nov 21 22:22 u-boot.bin
55362522 -rw-r--r--  6 martin martin    139160 Nov 21 22:22 u-boot.dtb
55362518 -rw-r--r--  6 martin martin       805 Nov 21 22:22 u-boot.its
36738385 -rw-r--r--  2 martin martin       246 Nov 21 22:22 ubinize-core-image-base-qemuarm.rootfs.cfg
51143732 lrwxrwxrwx  2 martin martin        18 Nov 21 22:22 zImage -> zImage-qemuarm.bin
51143716 -rw-r--r--  3 martin martin   7149168 Nov 21 22:22 zImage-qemuarm-V1.bin
51143716 -rw-r--r--  3 martin martin   7149168 Nov 21 22:22 zImage-qemuarm.bin

4) without various suffixes in filenames (if you prefer to fetch just the
   whole MACHINE named folder and don't care about artifact names):
   IMAGE_MACHINE_SUFFIX = ""   # remove -${MACHINE} from artifact names
   IMAGE_NAME_SUFFIX = ""      # remove .rootfs from artifact names
   IMAGE_VERSION_SUFFIX = ""   # remove version suffix (disables creating additional links)

$ ls -lai tmp/deploy/images/qemuarm/
total 953620
55386418 drwxr-xr-x 2 martin martin      4096 Nov 21 22:00 .
50343736 drwxr-xr-x 3 martin martin      4096 Nov 21 21:19 ..
55394328 -rw-r--r-- 2 martin martin    127376 Nov 21 21:59 MLO
56551946 -rw-r--r-- 2 martin martin 381870727 Nov 21 21:59 core-image-base-dbg.tar.bz2
56551971 -rw-r--r-- 2 martin martin  27929207 Nov 21 22:00 core-image-base.cpio.gz
56551957 -rw-r--r-- 2 martin martin  68956160 Nov 21 21:59 core-image-base.ext4
56551844 -rw-r--r-- 2 martin martin      3902 Nov 21 21:59 core-image-base.manifest
56551851 -rw-r--r-- 2 martin martin      1810 Nov 21 21:59 core-image-base.qemuboot.conf
56551846 -rw-r--r-- 2 martin martin    411780 Nov 21 21:59 core-image-base.spdx.tar.zst
56551954 -rw-r--r-- 2 martin martin  27268304 Nov 21 21:59 core-image-base.tar.bz2
56551838 -rw-r--r-- 2 martin martin    262158 Nov 21 21:59 core-image-base.testdata.json
56551965 -rw-r--r-- 2 martin martin  34209792 Nov 21 21:59 core-image-base.ubi
56551945 -rw-r--r-- 2 martin martin  33417216 Nov 21 21:59 core-image-base.ubifs
55388091 -rw-r--r-- 2 martin martin 320496929 Nov 21 21:59 core-image-minimal-dbg.tar.bz2
55388035 -rw-r--r-- 2 martin martin   4246092 Nov 21 21:59 core-image-minimal.cpio.gz
55388059 -rw-r--r-- 2 martin martin  13312000 Nov 21 21:59 core-image-minimal.ext4
55388330 -rw-r--r-- 2 martin martin      1100 Nov 21 21:59 core-image-minimal.manifest
55388232 -rw-r--r-- 2 martin martin      1822 Nov 21 21:59 core-image-minimal.qemuboot.conf
55388251 -rw-r--r-- 2 martin martin    121406 Nov 21 21:59 core-image-minimal.spdx.tar.zst
55388163 -rw-r--r-- 2 martin martin   4052081 Nov 21 21:59 core-image-minimal.tar.bz2
55389029 -rw-r--r-- 2 martin martin    263255 Nov 21 21:59 core-image-minimal.testdata.json
55387973 lrwxrwxrwx 2 martin martin        12 Nov 21 21:59 fitImage -> fitImage.bin
55387964 -rw-r--r-- 2 martin martin  11398621 Nov 21 21:59 fitImage-core-image-minimal.bin
55387965 -rw-r--r-- 2 martin martin      2417 Nov 21 21:59 fitImage-its-core-image-minimal.its
55387968 -rw-r--r-- 2 martin martin      1638 Nov 21 21:59 fitImage-its.its
55387966 -rw-r--r-- 2 martin martin   7149168 Nov 21 21:59 fitImage-linux.bin
55386185 -rw-r--r-- 2 martin martin   7151161 Nov 21 21:59 fitImage.bin
55387972 -rw-r--r-- 2 martin martin  45290074 Nov 21 21:59 modules.tgz
55394322 -rw-r--r-- 4 martin martin    786682 Nov 21 21:59 u-boot-fitImage
55394327 -rw-r--r-- 2 martin martin     12284 Nov 21 21:59 u-boot-initial-env
55394325 -rw-r--r-- 4 martin martin       805 Nov 21 21:59 u-boot-its
55394319 -rw-r--r-- 2 martin martin    645864 Nov 21 21:59 u-boot-nodtb.bin
55394322 -rw-r--r-- 4 martin martin    786682 Nov 21 21:59 u-boot.bin
55386290 -rw-r--r-- 2 martin martin    139160 Nov 21 21:59 u-boot.dtb
55394325 -rw-r--r-- 4 martin martin       805 Nov 21 21:59 u-boot.its
36783106 -rw-r--r-- 2 martin martin       231 Nov 21 21:59 ubinize-core-image-base.cfg
55342465 lrwxrwxrwx 2 martin martin        10 Nov 21 21:59 zImage -> zImage.bin
55342449 -rw-r--r-- 2 martin martin   7149168 Nov 21 21:59 zImage.bin

The following changes since commit faa32bbb35e92a14b8064715c12e1007fd106b34:

  ffmpeg: Upgrade 6.0 -> 6.1 (2023-11-20 15:30:46 +0000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib jansa/artifacts
  https://git.openembedded.org/openembedded-core-contrib/log/?h=jansa/artifacts

Martin Jansa (21):
  image*.bbclass, kernel*.bbclass: create version-less artifacts and
    versioned hard links
  create-spdx-2.2.bbclass: use hardlink as well
  image, kernel: allow to disable creating the hardlinks by setting
    *LINK_NAME variables to empty
  kernel: move the leading dash into KERNEL_ARTIFACT_NAME
  kernel-fitimage.bbclass: avoid duplicate .bin extension
  kernel-fitimage.bbclass: add .its extension also to links
  uboot: use ${IMAGE_MACHINE_SUFFIX} instead of -${MACHINE} and use
    hardlinks
  image.bbclass: rename create_symlinks to create_hardlinks
  image-artifact-names.bbclass: add IMAGE_VERSION_SUFFIX_DATETIME which
    uses SOURCE_DATE_EPOCH
  oeqa: bbtests.BitbakeTests.test_image_manifest: use just isfile()
    instead of islink()
  oeqa: wic: use just isfile() instead of islink()
  linux-dummy: add do_deploy_links task
  kernel.bbclass: inherit KERNEL_CLASSES at the end
  image.bbclass: don't append -dbg suffix twice
  oeqa: imagefeatures: append -dbg suffix at the end of IMAGE_NAME not
    IMAGE_LINK_NAME
  oeqa: gdbserver: append -dbg suffix at the end of IMAGE_NAME not
    IMAGE_LINK_NAME
  oeqa: fitimage: respect KERNEL_FIT_NAME
  selftest: multiconfig-image-packager: use IMAGE_NAME instead of
    IMAGE_LINK_NAME
  image.bbclass: remove hardlinks as well
  populate_sdk_ext.bbclass: add *:do_shared_workdir to
    BB_SETSCENE_ENFORCE_IGNORE_TASKS
  u-boot.inc: don't replace the binary with symlink

 .../multiconfig-image-packager_0.1.bb         |  12 +-
 meta/classes-global/base.bbclass              |   3 +
 .../image-artifact-names.bbclass              |  18 +-
 meta/classes-recipe/image-live.bbclass        |   2 +-
 meta/classes-recipe/image.bbclass             |  25 ++-
 .../kernel-artifact-names.bbclass             |  12 +-
 meta/classes-recipe/kernel-devicetree.bbclass |  41 ++--
 meta/classes-recipe/kernel-fitimage.bbclass   |  40 ++--
 meta/classes-recipe/kernel.bbclass            |  97 +++++----
 meta/classes-recipe/populate_sdk_ext.bbclass  |   2 +-
 meta/classes-recipe/qemuboot.bbclass          |   2 +-
 .../rootfs-postcommands.bbclass               |   4 +-
 meta/classes-recipe/uboot-config.bbclass      |  22 +-
 meta/classes-recipe/uboot-sign.bbclass        |  68 +++---
 meta/classes/create-spdx-2.2.bbclass          |   2 +-
 meta/classes/cve-check.bbclass                |  14 +-
 meta/lib/oe/cve_check.py                      |   6 +-
 meta/lib/oeqa/selftest/cases/bbtests.py       |   2 +-
 meta/lib/oeqa/selftest/cases/fitimage.py      |  98 +++++----
 meta/lib/oeqa/selftest/cases/gdbserver.py     |   6 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py |   4 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   2 +-
 meta/recipes-bsp/u-boot/u-boot.inc            | 200 +++++++++---------
 meta/recipes-kernel/linux/linux-dummy.bb      |   5 +
 24 files changed, 368 insertions(+), 319 deletions(-)

-- 
2.43.0


