Received: from mail-qk1-f196.google.com (mail-qk1-f196.google.com [209.85.222.196])
 by mx.groups.io with SMTP id smtpd.web12.36222.1601298357465232057
 for <openembedded-core@lists.openembedded.org>;
 Mon, 28 Sep 2020 06:05:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=DdKjxKY2;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.196, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f196.google.com with SMTP id q5so832550qkc.2
        for <openembedded-core@lists.openembedded.org>; Mon, 28 Sep 2020 06:05:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rp7NHhEdPmvztJJsK1rI+FhrF75fCJS6nAxildU9nSs=;
        b=DdKjxKY2mJkoxRZ7fHc4Ery/WVT02uxmCRX/4MAVKD3cG1xIyRg1MiX6T5vnW4q7zb
         LzNOraUGr/cQ9ZvkhlUKRB3oH0awbL1kliO34n/G8A+gFgPI+LctNyhHJ5jgDCwLvIDE
         iuviOtkFVYuJ2OdohzGS7kMA7e3wNORIjHHkO4Jcm5Ucq8ShOb61v4Ttu0Vr6uuE74L1
         XxsmpjmibJgAPkPaqbz8wNVt/349ppWxTsUhgyGk1jY8H9JtD78SqDYaGeA0I/armlmG
         tvDovdOGL3oYTFu4+5uJ8i/hR0cwQ3bOEi2itglbHjCM/McGMbEA/t0TUL39OQB6D/2p
         dOjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Rp7NHhEdPmvztJJsK1rI+FhrF75fCJS6nAxildU9nSs=;
        b=hnIK0aYWbejgJrDek1S9rQIyU9c6uoNx/UJGnQWG2l6cq8U7uQcKO79FRhqwvBEvzQ
         /Qgt88FtVEw+iwZw/zQndC3SxH2S324gNCQAcIQOe8gJqJZCMIcoU5KzQByW2mtbukXz
         E1W4wcuG5XoqSX9Tr3LQUpb9U2QZJZQcZE0F5pMa7l8ieavWtsR60y8y9+iXFKYeasLl
         IIWVYut7YxznEZ/ecCE6nFvswu9dwlaR/vEc2+8NLd1QOMIzbb8GM3AQ9R8Ar58RKstQ
         lqR+u0uO7Zd58BbtiZlk7jClRLLRhz5FhQClKSgqClXxsid+2l9gOl9jsY3u9qQD1mfx
         g6wg==
X-Gm-Message-State: AOAM530JPTTnt275qPRJHFTzykKdX5A5wePcXotlZHyM92zQSvoIfrT7
	FfalFUIafY3o9m+Vcx1H27tRYxkwmjr+RzLR
X-Google-Smtp-Source: ABdhPJw34iLgVpITjc+ePEucCy+G7hK9GUtQwcS4ZsTtB0DALW2L8lfhbKP6CevL55z8fcKwabmpSA==
X-Received: by 2002:a37:6248:: with SMTP id w69mr1225085qkb.448.1601298355976;
        Mon, 28 Sep 2020 06:05:55 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([136.56.1.171])
        by smtp.gmail.com with ESMTPSA id s18sm898104qks.44.2020.09.28.06.05.55
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2020 06:05:55 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: openembedded-core@lists.openembedded.org
Subject: [meta-oe][PATCH v4 0/6] ARMv8 Tune add and reorg
Date: Mon, 28 Sep 2020 09:05:45 -0400
Message-Id: <20200928130551.21346-1-jon.mason@arm.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes since v3:
* Tweaked commit message to reflect the comma-space patch should've used
  --follow-symlinks to get the correct output.
* Fixed bug in A55.inc found by Andreas Oberritter

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

