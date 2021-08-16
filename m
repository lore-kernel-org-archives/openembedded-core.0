Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web08.31299.1629151306774519074
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Aug 2021 15:01:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=oMWt5Ukr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f171.google.com with SMTP id az7so20841854qkb.5
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Aug 2021 15:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w1zB4FF9GmLsBCTeM1knmmStNu8fPmt5zg8jDe0jKGo=;
        b=oMWt5UkrExnQOl5gW4UQwBpo3IxV39Lv0Cii86Fe97LcKwI1YLDQsthyKybNDU8CdN
         oMH0VSjTKq3/TzcjPTkBsD1OHCXwbeX7V3gEIqhd9w04ZV8G5qgmxc7hAps9wJpDABEx
         qCTXjCmy2eWqaqwPjzvT9xMh+mEkvqCJNN2914vszjtjWTHV+4/oebgDvcy+IDy5AnC0
         ueC4EJ04k5CxQHpwfLXgq9BANXDjtXbb3QCxJq2JAqQ0RpGZuHu2A6pmFDyuMHAWJSbH
         HofwEzYGfPPRi8RlngMuvS6p/sVctwzTtFYTHSntvnMrczWTC5ieAIR4XnxmZnh7M78y
         u0mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=w1zB4FF9GmLsBCTeM1knmmStNu8fPmt5zg8jDe0jKGo=;
        b=bpSHew+zDF69jZQcgr4eehsVJgFSbh8dLie3u+a5lZDJ2ckInX2nDU8FqkvE2JlFBl
         rkae8pKbKQaqd8kRVesEUHP9sWCqCPiIXzhuaBJyJBILV/SKo3eRxlUoKhJLznoxscLa
         jn8zXfWTqguEYuV1DnxL/RyxgG2OTaIfpiBi2Ai+KzRfWmQ2DajSFblIyit1vIj//8Ji
         VnGymYZntQ4CrCL4pxkF5fehP7C+YAlhLhJ1e4j6/+9SjqV5pIODETjl3Z4Rt8IMiSOU
         xFtQzl2huB4Bk7jS9J7a+U6s1dz/vO5m8OZA8axoXUp5NJNVA8UCs/vIkhO7yaPq1PM6
         LDEw==
X-Gm-Message-State: AOAM530e7LfUA/1wKSqFFHn4hIRkPsUOilGkdowEujcW8ND/YqM3MMaA
	HEAGR2pzxyctPEcd/zlA0j8o6uhKGxQyBQ==
X-Google-Smtp-Source: ABdhPJynTzuHyOoludSP+ekMnuHZRa95PtEjTLKmNVYuE/2p/J6ep4S5/0pjJkvjQgAZAE1KBjT+pA==
X-Received: by 2002:a05:620a:15a4:: with SMTP id f4mr497127qkk.379.1629151304938;
        Mon, 16 Aug 2021 15:01:44 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:f177:a44a:469d:7e14])
        by smtp.gmail.com with ESMTPSA id 14sm13434qtp.19.2021.08.16.15.01.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 15:01:44 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH v2 0/3] tunes: the great migration
Date: Mon, 16 Aug 2021 18:01:41 -0400
Message-Id: <20210816220144.26018-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

New in v2
* Fix relocation oversight issue found by Alexandre Belloni
* More aggressive sorting of Arm, putting each tune into it's respective
  design versioned family

I ran a quick and dirty CI on this via gitlab, though now including
machines for all present in meta-yocto-bsp.  The results can be found
at https://gitlab.com/jonmason00/poky/-/pipelines/353961908
NOTE: CI is also including patches from upcoming series to support
Cortex-R.  So, it's not 100% pristine. 

---

Move all tune files into their architecture directory.

I'm doing this all as one series, even though they are going to
different repos, as an attempt to make this as atomic as possible.


Jon Mason (3):
  conf/machine: move tune files to architecture directories
  yocto-bsp: update machine confs with new tune locations
  docs: update docs with new tune locations

 documentation/bsp-guide/bsp.rst                               | 4 ++--
 documentation/dev-manual/common-tasks.rst                     | 2 +-
 documentation/ref-manual/variables.rst                        | 2 +-
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf             | 2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf                   | 2 +-
 meta-yocto-bsp/conf/machine/genericx86-64.conf                | 2 +-
 meta-yocto-bsp/conf/machine/genericx86.conf                   | 2 +-
 meta-yocto-bsp/conf/machine/include/genericx86-common.inc     | 4 ++--
 meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc    | 0
 meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc   | 0
 meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc     | 0
 .../machine/include/{ => arm/armv4}/tune-strongarm1100.inc    | 0
 meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc  | 0
 meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc     | 0
 meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc     | 0
 .../conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc | 0
 .../conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc | 0
 .../{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc}      | 0
 .../armv6m/tune-cortexm0plus.inc}                             | 0
 meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc  | 0
 meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc  | 0
 meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc  | 0
 meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc  | 0
 meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc  | 0
 .../machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc | 0
 .../include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc | 0
 .../include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc | 0
 .../include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc     | 0
 meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc  | 0
 meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc        | 0
 .../conf/machine/include/{ => microblaze}/tune-microblaze.inc | 0
 meta/conf/machine/include/{ => mips}/qemuboot-mips.inc        | 0
 meta/conf/machine/include/mips/tune-mips-24k.inc              | 2 +-
 meta/conf/machine/include/mips/tune-mips-74k.inc              | 2 +-
 meta/conf/machine/include/{ => mips}/tune-mips32.inc          | 0
 meta/conf/machine/include/{ => mips}/tune-mips32r2.inc        | 2 +-
 meta/conf/machine/include/{ => mips}/tune-mips32r6.inc        | 0
 meta/conf/machine/include/mips/tune-mips64.inc                | 3 +++
 meta/conf/machine/include/{ => mips}/tune-mips64r2.inc        | 2 +-
 meta/conf/machine/include/{ => mips}/tune-mips64r6.inc        | 0
 meta/conf/machine/include/{ => mips}/tune-octeon.inc          | 2 +-
 meta/conf/machine/include/{ => powerpc}/tune-power5.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-power6.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-power7.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-power9.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc       | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc      | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc      | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc      | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc    | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc     | 0
 meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc     | 0
 meta/conf/machine/include/{ => sh}/tune-sh3.inc               | 0
 meta/conf/machine/include/{ => sh}/tune-sh4.inc               | 2 +-
 meta/conf/machine/include/tune-mips64.inc                     | 3 ---
 meta/conf/machine/include/{ => x86}/qemuboot-x86.inc          | 0
 meta/conf/machine/include/{ => x86}/tune-atom.inc             | 2 +-
 meta/conf/machine/include/{ => x86}/tune-c3.inc               | 0
 meta/conf/machine/include/{ => x86}/tune-core2.inc            | 2 +-
 meta/conf/machine/include/{ => x86}/tune-corei7.inc           | 2 +-
 meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc         | 0
 meta/conf/machine/include/{ => x86}/tune-i586.inc             | 0
 meta/conf/machine/include/{ => x86}/tune-i686.inc             | 2 +-
 meta/conf/machine/include/{ => x86}/x86-base.inc              | 0
 meta/conf/machine/qemuarm.conf                                | 2 +-
 meta/conf/machine/qemuarm64.conf                              | 2 +-
 meta/conf/machine/qemuarmv5.conf                              | 2 +-
 meta/conf/machine/qemumips.conf                               | 4 ++--
 meta/conf/machine/qemumips64.conf                             | 4 ++--
 meta/conf/machine/qemuppc.conf                                | 2 +-
 meta/conf/machine/qemuppc64.conf                              | 2 +-
 meta/conf/machine/qemux86-64.conf                             | 4 ++--
 meta/conf/machine/qemux86.conf                                | 4 ++--
 86 files changed, 36 insertions(+), 36 deletions(-)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-arm920t.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-arm9tdmi.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-ep9312.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv4}/tune-strongarm1100.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv5}/tune-arm926ejs.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv5}/tune-iwmmxt.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv5}/tune-xscale.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1136jf-s.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv6}/tune-arm1176jz-s.inc (100%)
 rename meta/conf/machine/include/{tune-cortex-m0.inc => arm/armv6m/tune-cortexm0.inc} (100%)
 rename meta/conf/machine/include/{tune-cortex-m0plus.inc => arm/armv6m/tune-cortexm0plus.inc} (100%)
 rename meta/conf/machine/include/{ => arm/armv6m}/tune-cortexm1.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa15.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa17.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa5.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa7.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa8.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7a}/tune-cortexa9.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm3.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm4.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv7m}/tune-cortexm7.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8-2a}/tune-cortexa55.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa32.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa35.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa57.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa72.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-cortexa73-cortexa53.inc (100%)
 rename meta/conf/machine/include/{ => arm/armv8a}/tune-thunderx.inc (100%)
 rename meta/conf/machine/include/{ => m68k}/tune-mcf5441x.inc (100%)
 rename meta/conf/machine/include/{ => microblaze}/tune-microblaze.inc (100%)
 rename meta/conf/machine/include/{ => mips}/qemuboot-mips.inc (100%)
 rename meta/conf/machine/include/{ => mips}/tune-mips32.inc (100%)
 rename meta/conf/machine/include/{ => mips}/tune-mips32r2.inc (95%)
 rename meta/conf/machine/include/{ => mips}/tune-mips32r6.inc (100%)
 create mode 100644 meta/conf/machine/include/mips/tune-mips64.inc
 rename meta/conf/machine/include/{ => mips}/tune-mips64r2.inc (98%)
 rename meta/conf/machine/include/{ => mips}/tune-mips64r6.inc (100%)
 rename meta/conf/machine/include/{ => mips}/tune-octeon.inc (96%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power5.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power6.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power7.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-power9.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppc476.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppc603e.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppc7400.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c2.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce300c3.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce500.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce500mc.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce500v2.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce5500.inc (100%)
 rename meta/conf/machine/include/{ => powerpc}/tune-ppce6500.inc (100%)
 rename meta/conf/machine/include/{ => sh}/tune-sh3.inc (100%)
 rename meta/conf/machine/include/{ => sh}/tune-sh4.inc (93%)
 delete mode 100644 meta/conf/machine/include/tune-mips64.inc
 rename meta/conf/machine/include/{ => x86}/qemuboot-x86.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-atom.inc (50%)
 rename meta/conf/machine/include/{ => x86}/tune-c3.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-core2.inc (97%)
 rename meta/conf/machine/include/{ => x86}/tune-corei7.inc (97%)
 rename meta/conf/machine/include/{ => x86}/tune-i586-nlp.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-i586.inc (100%)
 rename meta/conf/machine/include/{ => x86}/tune-i686.inc (94%)
 rename meta/conf/machine/include/{ => x86}/x86-base.inc (100%)

-- 
2.20.1

