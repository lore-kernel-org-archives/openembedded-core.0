Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com [209.85.222.195])
 by mx.groups.io with SMTP id smtpd.web11.5726.1601062094510610182
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Sep 2020 12:28:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=N7YMHeXo;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.195, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f195.google.com with SMTP id f142so3919791qke.13
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Sep 2020 12:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3vFRb1ZmVKEYnxbEgl9bg85xKI3sGuvadMn9nMN9TM=;
        b=N7YMHeXoXyr0CbANzgX8j4HKVp63udeWMpOUoZ1GHtRW9Ly9Yt8Xkc3704yS4SaUCP
         yhbylz+R9NlMLRab+fACURNqV/LiJqOKkuycpVNnlkkKx//oz0vLhw+STpy75h3yteOy
         4ExKXxwQG0khFk69nLTYrPmeaWHNlmCTIx4nTvVrYbXDW09HBuVv2Lb9qJAYhugXsuYq
         cl/nfY2/364sxiqfVHQjgI2kCUIZRr/an00mAeYAxML2kkYpx1StoT12lQMMC9W7Q7Dv
         S3ZgCams02YEDaG53dnUba5Dib0fCcv0ky1VaxGuuAPf/xHa1W67flkFkw/QHxOjJILs
         l+/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l3vFRb1ZmVKEYnxbEgl9bg85xKI3sGuvadMn9nMN9TM=;
        b=l22rlXVsDeD1biPegxJXvZnLe6Ng9eryi9W5ryWAo44TBqKEP7SH0pmYUFm7E34Y2n
         zKKEg6aC6dQ2cLm0BBK/kmRCJdK/5oQA+SWZ0mjC4F44GrSBsw7ceuMcen5JLIYhFo/D
         tnRatZzUWkJ1lhYsot1vv0uA6CRVFgR9fRVjJaBVkwlydMIBdpSNfbhG3lI5t3rDcDeD
         LMp/Eu4ETNR4W8gLLi7NmKxTZ6s/ZeHy4CagnaKiGnule69wVTLj1p/fAOMySGzcKK0F
         wZyp6MdsNziY44n5O4jyYQ/xsJYRNzNElnxA+8hqrFUqKgy9Vp1wG+iqAI2qYfR7nfK5
         kt6g==
X-Gm-Message-State: AOAM532+mbBCj11H9dK94wxLWjvN3UIDQ3/L5cHDBDgsyee0ewMkp5gt
	3Vg1hFEtNRLChozXcOzumP/Sry1lZSGB+gp+
X-Google-Smtp-Source: ABdhPJx65yGikXFcc0Ua3vD2KVpAbEZqdVMS3elR45qtuzKfrtYwBPpC2+78HeW6lW1L5v1dp6wwoQ==
X-Received: by 2002:a05:620a:141a:: with SMTP id d26mr1545214qkj.217.1601062092709;
        Fri, 25 Sep 2020 12:28:12 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id b28sm2327518qka.117.2020.09.25.12.28.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2020 12:28:12 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v2 0/6] ARMv8 Tune add and reorg
Date: Fri, 25 Sep 2020 15:28:04 -0400
Message-Id: <20200925192810.1372-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hopefully v2 is a little more palatable.

The first 3 are clean-ups, then two to add currently unsupported ARMv8a
cores, then the last one is to move them out of the generic tune area to 
an Arm specific one.  Given how late we are in the gatesgarth cycle, you 
can leave this last one off and I'll resend after the release.

Thanks,
Jon


Jon Mason (6):
  Space-comma Cleanups
  armv8/tunes: Move TUNECONFLICTS
  armv8/tunes: reference parent's TUNE_FEATURES
  armv8/tunes: Add tunes for supported ARMv8a cores
  armv8/tunes: Add tunes for supported ARMv8.2a cores
  tunes/armv8: move to a new location

 meta/classes/linuxloader.bbclass              |   2 +-
 meta/classes/rootfs_rpm.bbclass               |   2 +-
 meta/conf/machine/include/arm/arch-arm64.inc  |  11 +-
 meta/conf/machine/include/arm/arch-armv4.inc  |   2 +-
 meta/conf/machine/include/arm/arch-armv5.inc  |   2 +-
 meta/conf/machine/include/arm/arch-armv6.inc  |   2 +-
 meta/conf/machine/include/arm/arch-armv6m.inc |   2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc |   2 +-
 .../conf/machine/include/arm/arch-armv7ve.inc |   2 +-
 .../machine/include/arm/arch-armv8-2a.inc     |   2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc |   2 +-
 .../{ => arm/armv8-2a}/tune-cortexa55.inc     |   2 +-
 .../include/arm/armv8-2a/tune-cortexa65.inc   |  16 ++
 .../include/arm/armv8-2a/tune-cortexa65ae.inc |  16 ++
 .../arm/armv8-2a/tune-cortexa75-cortexa55.inc |  20 ++
 .../include/arm/armv8-2a/tune-cortexa75.inc   |  16 ++
 .../arm/armv8-2a/tune-cortexa76-cortexa55.inc |  20 ++
 .../include/arm/armv8-2a/tune-cortexa76.inc   |  16 ++
 .../include/arm/armv8-2a/tune-cortexa76ae.inc |  16 ++
 .../include/arm/armv8-2a/tune-cortexa77.inc   |  16 ++
 .../{ => arm/armv8a}/tune-cortexa32.inc       |   3 +-
 .../include/arm/armv8a/tune-cortexa34.inc     |  20 ++
 .../{ => arm/armv8a}/tune-cortexa35.inc       |   2 +-
 .../{ => arm/armv8a}/tune-cortexa53.inc       |   3 +-
 .../armv8a}/tune-cortexa57-cortexa53.inc      |   5 +-
 .../{ => arm/armv8a}/tune-cortexa57.inc       |   2 +-
 .../armv8a}/tune-cortexa72-cortexa53.inc      |   5 +-
 .../{ => arm/armv8a}/tune-cortexa72.inc       |   2 +-
 .../arm/armv8a/tune-cortexa73-cortexa35.inc   |  21 ++
 .../armv8a}/tune-cortexa73-cortexa53.inc      |   5 +-
 .../include/arm/armv8a/tune-cortexa73.inc     |  16 ++
 meta/conf/machine/include/mips/arch-mips.inc  |  16 +-
 .../conf/machine/include/tune-arm1136jf-s.inc |   2 +-
 .../conf/machine/include/tune-arm1176jz-s.inc |   2 +-
 meta/conf/machine/include/tune-arm920t.inc    |   2 +-
 meta/conf/machine/include/tune-arm926ejs.inc  |   2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa15.inc  |   2 +-
 meta/conf/machine/include/tune-cortexa17.inc  |   2 +-
 meta/conf/machine/include/tune-cortexa5.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa7.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa8.inc   |   2 +-
 meta/conf/machine/include/tune-cortexa9.inc   |   2 +-
 meta/conf/machine/include/tune-ep9312.inc     |   2 +-
 meta/conf/machine/include/tune-iwmmxt.inc     |   2 +-
 meta/conf/machine/include/tune-neoversee1.inc |  16 ++
 meta/conf/machine/include/tune-neoversen1.inc |  17 ++
 .../machine/include/tune-strongarm1100.inc    |   2 +-
 meta/conf/machine/include/tune-xscale.inc     |   2 +-
 meta/conf/machine/include/x86/arch-x86.inc    |  12 +-
 meta/conf/machine/qemuarm64.conf              |   2 +-
 .../recipes-core/images/core-image-minimal.bb |   2 +-
 .../qemu/qemu-system-native_5.1.0.bb          |   2 +-
 meta/recipes-devtools/qemu/qemu_5.1.0.bb      |   4 +-
 .../vulkan/vulkan-demos_git.bb                |   2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |   2 +-
 .../linux/linux-yocto-rt_5.4.bb               |   2 +-
 .../linux/linux-yocto-rt_5.8.bb               |   2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |   4 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |   4 +-
 .../libpng/libpng_1.6.37.bb                   |   2 +-
 scripts/pybootchartgui/pybootchartgui/main.py | 184 +++++++++++++++++-
 62 files changed, 480 insertions(+), 76 deletions(-)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (84%)
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa65ae.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75-cortexa55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa75.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76-cortexa55.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa76ae.inc
 create mode 100644 meta/conf/machine/include/arm/armv8-2a/tune-cortexa77.inc
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (90%)
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa34.inc
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (90%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (90%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (78%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (90%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (85%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (84%)
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73-cortexa35.inc
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (85%)
 create mode 100644 meta/conf/machine/include/arm/armv8a/tune-cortexa73.inc
 create mode 100644 meta/conf/machine/include/tune-neoversee1.inc
 create mode 100644 meta/conf/machine/include/tune-neoversen1.inc
 mode change 120000 => 100644 scripts/pybootchartgui/pybootchartgui/main.py

-- 
2.20.1

