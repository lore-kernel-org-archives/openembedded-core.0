Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web10.27383.1601258522743501940
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Sep 2020 19:02:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=TXZWCQ2n;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f196.google.com with SMTP id 19so7060528qtp.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Sep 2020 19:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8p7hNk5hRm2CjpxUl1Y65uOugu6iuyS6kti4vWqnpAc=;
        b=TXZWCQ2nGOzaY41Cb+a3VgV6MTJBWgoW1CYfHc5U/LAhaxOuGLq1nb6mo/pLvcoxHM
         mXjfXGh5v45AQip80yborpux/IzrzbwmfrlnA/wEZsfqVs1t/KYIEKYXoA5q1peNb5aJ
         JrvEA6uoNIKXsTHGmACArM6Znj9LA36ixdtFcnbz0aKYqNM13MIALv3KW6lN+kcO8cOi
         tl1jWvBRqguoiDJ3WxzQr1G2lBU9I7MmcXdzLMYffirIE2XW+gSQHeA4DFYIIz/Tf6Wt
         Dctcw6JpKI3fg42632d10Sm8mP3f9Q9IBEFyBPr0KYVWfFqiY1bAwXK7CydwLdp8J/JU
         zfMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8p7hNk5hRm2CjpxUl1Y65uOugu6iuyS6kti4vWqnpAc=;
        b=mP8aiU+uOrhCjuwfGHSqZ+nU0lLEsvAEqGkTnvI89HJo5cMtSFBwOJI7Tyu+Dyk1fz
         QpzTXCktxOwhNEhhMe2yT1Ec36NaQfIa60ClSEFiCOMc6CcAFMfAFTGykExe46V78+dD
         57Wr//RGo5zq0dC0duBEKjxt+1C274vdD22IQxa+cims4YQam5uOM3ENS3v1snujlywm
         /HotiamFXLsBvm6qFQaT6ou+KXNtwh/ijCf6NxCqnGKsaRi7fT2ErIjGxrqQG8wljSQ+
         cIqjVVuw+iXkyOJpUbvWb+G/D4L2JeaNd1IrKtLyz1t5QNjqraZAJf16iH+w7OtafPgV
         G4rQ==
X-Gm-Message-State: AOAM5303SqOSctWy7MZ7peQEhZJtyUrmZi5HIqOUrAtxOiivUthOGMb5
	YRJqFkOGdxkTkeyueplZyrdR2h48GW7yRERu
X-Google-Smtp-Source: ABdhPJxf+k/6Zwx/EJEd+hVzMrGoopZJeaCiaPDVWCugLnnBmH1SoiVfBqmiJYjc6LPOOUpMJevn0Q==
X-Received: by 2002:aed:2907:: with SMTP id s7mr9878199qtd.321.1601258521429;
        Sun, 27 Sep 2020 19:02:01 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id d9sm8794737qtg.51.2020.09.27.19.02.00
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 19:02:00 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v3 0/6] ARMv8 Tune add and reorg
Date: Sun, 27 Sep 2020 22:01:36 -0400
Message-Id: <20200928020142.5706-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v2:
* Removed errant files from the comma-space patch.  Still unknown how
  they are pulled in by that command.

---

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

 meta/classes/linuxloader.bbclass              |  2 +-
 meta/classes/rootfs_rpm.bbclass               |  2 +-
 meta/conf/machine/include/arm/arch-arm64.inc  | 11 +++++-----
 meta/conf/machine/include/arm/arch-armv4.inc  |  2 +-
 meta/conf/machine/include/arm/arch-armv5.inc  |  2 +-
 meta/conf/machine/include/arm/arch-armv6.inc  |  2 +-
 meta/conf/machine/include/arm/arch-armv6m.inc |  2 +-
 meta/conf/machine/include/arm/arch-armv7a.inc |  2 +-
 .../conf/machine/include/arm/arch-armv7ve.inc |  2 +-
 .../machine/include/arm/arch-armv8-2a.inc     |  2 +-
 meta/conf/machine/include/arm/arch-armv8a.inc |  2 +-
 .../{ => arm/armv8-2a}/tune-cortexa55.inc     |  2 +-
 .../include/arm/armv8-2a/tune-cortexa65.inc   | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa65ae.inc | 16 ++++++++++++++
 .../arm/armv8-2a/tune-cortexa75-cortexa55.inc | 20 ++++++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa75.inc   | 16 ++++++++++++++
 .../arm/armv8-2a/tune-cortexa76-cortexa55.inc | 20 ++++++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa76.inc   | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa76ae.inc | 16 ++++++++++++++
 .../include/arm/armv8-2a/tune-cortexa77.inc   | 16 ++++++++++++++
 .../{ => arm/armv8a}/tune-cortexa32.inc       |  3 +--
 .../include/arm/armv8a/tune-cortexa34.inc     | 20 ++++++++++++++++++
 .../{ => arm/armv8a}/tune-cortexa35.inc       |  2 +-
 .../{ => arm/armv8a}/tune-cortexa53.inc       |  3 +--
 .../armv8a}/tune-cortexa57-cortexa53.inc      |  5 ++---
 .../{ => arm/armv8a}/tune-cortexa57.inc       |  2 +-
 .../armv8a}/tune-cortexa72-cortexa53.inc      |  5 ++---
 .../{ => arm/armv8a}/tune-cortexa72.inc       |  2 +-
 .../arm/armv8a/tune-cortexa73-cortexa35.inc   | 21 +++++++++++++++++++
 .../armv8a}/tune-cortexa73-cortexa53.inc      |  5 ++---
 .../include/arm/armv8a/tune-cortexa73.inc     | 16 ++++++++++++++
 meta/conf/machine/include/mips/arch-mips.inc  | 16 +++++++-------
 .../conf/machine/include/tune-arm1136jf-s.inc |  2 +-
 .../conf/machine/include/tune-arm1176jz-s.inc |  2 +-
 meta/conf/machine/include/tune-arm920t.inc    |  2 +-
 meta/conf/machine/include/tune-arm926ejs.inc  |  2 +-
 meta/conf/machine/include/tune-arm9tdmi.inc   |  2 +-
 meta/conf/machine/include/tune-cortexa15.inc  |  2 +-
 meta/conf/machine/include/tune-cortexa17.inc  |  2 +-
 meta/conf/machine/include/tune-cortexa5.inc   |  2 +-
 meta/conf/machine/include/tune-cortexa7.inc   |  2 +-
 meta/conf/machine/include/tune-cortexa8.inc   |  2 +-
 meta/conf/machine/include/tune-cortexa9.inc   |  2 +-
 meta/conf/machine/include/tune-ep9312.inc     |  2 +-
 meta/conf/machine/include/tune-iwmmxt.inc     |  2 +-
 meta/conf/machine/include/tune-neoversee1.inc | 16 ++++++++++++++
 meta/conf/machine/include/tune-neoversen1.inc | 17 +++++++++++++++
 .../machine/include/tune-strongarm1100.inc    |  2 +-
 meta/conf/machine/include/tune-xscale.inc     |  2 +-
 meta/conf/machine/include/x86/arch-x86.inc    | 12 +++++------
 meta/conf/machine/qemuarm64.conf              |  2 +-
 .../recipes-core/images/core-image-minimal.bb |  2 +-
 .../qemu/qemu-system-native_5.1.0.bb          |  2 +-
 meta/recipes-devtools/qemu/qemu_5.1.0.bb      |  4 ++--
 .../vulkan/vulkan-demos_git.bb                |  2 +-
 meta/recipes-kernel/linux/linux-yocto-dev.bb  |  2 +-
 .../linux/linux-yocto-rt_5.4.bb               |  2 +-
 .../linux/linux-yocto-rt_5.8.bb               |  2 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  4 ++--
 meta/recipes-kernel/linux/linux-yocto_5.8.bb  |  4 ++--
 .../libpng/libpng_1.6.37.bb                   |  2 +-
 61 files changed, 297 insertions(+), 75 deletions(-)
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

-- 
2.20.1

