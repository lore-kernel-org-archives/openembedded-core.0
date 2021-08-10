Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.1361.1628631905355682319
 for <openembedded-core@lists.openembedded.org>;
 Tue, 10 Aug 2021 14:45:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=rpEtI1t1;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.173, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f173.google.com with SMTP id 14so49221qkc.4
        for <openembedded-core@lists.openembedded.org>; Tue, 10 Aug 2021 14:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKiPIgD4ML9IEb4rORk6Z7rrk/NaG9++rcMT4mlYkcw=;
        b=rpEtI1t1zAYNhs6G99lFDoSvCNixMK4LoFNkCFxfHOsYN/YHeUvp+1fWRDCJtfsCdr
         xy0GL1SUoEl5byHpCHn662NFhOQaRgREMOq4CzoFRqsVLW5Ws1/Dev75O/C/ZDxYW2Cb
         pUTWXgzFidEYFrRxfLsjMLj6aXO5I2co/hADA7pBNR9ZUN1FUHPSf4te4ViyfK9UeZDM
         3v0lhRGtdQcNpZpon6GY8pqWzTxLCaBsjqwhLlH0Zn2smBicFJqVEcgxVemQ6kLhTqoW
         JcvPR9BIUAozZxI+5eI/Zascg/NCfy6bsiujk4ThfKvZ+5z/DqFDLBp/fbVF7IjIEokz
         ZAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=IKiPIgD4ML9IEb4rORk6Z7rrk/NaG9++rcMT4mlYkcw=;
        b=j3ObjNmtAnuoH/7QmLbUgV+ouyChJ12t9R51Ovdn7uDx62gQQ2rgdRRMStMwinEgYD
         xmf9GlyK1mftLPMXS4VO1oK+8lYsSYdTvprD1f7M+FwSPp6dzqfP1bGdHxFI4FchUCWm
         d+x0KiP1kArMQT2vRJ/KMdE97uDEzUBYilJ89+ps3wG+VSQg6+4SENsL4CMHh5NqM5aO
         2wXosgQ2ZKOQxSyoi4v1Sj5QQR3i2c3/m3sv95UvwQPHcnYbie9mZdeiftxKgUWcAs9j
         jdYedmeyMiGyvWceG/vWuup/Sh0NsS3f0O7MHi7LHj1BHn0whAO6t3/yQYkogticwW3b
         n/Ww==
X-Gm-Message-State: AOAM531x4nqOMqAXm50dxav645/nKt83dVIL34I16qAvMPMJ4LyDJA26
	7EpRE9uUWUNvvqUUR0qukudjhv5KdP3tUg==
X-Google-Smtp-Source: ABdhPJz3/U88paIUks2nvYdeWYxUVs+oEE1XAS+XHn6VF/xgGkr4ulaWb6Us9rQs6YXAMa4K/QT9jA==
X-Received: by 2002:a37:a303:: with SMTP id m3mr29970774qke.299.1628631904252;
        Tue, 10 Aug 2021 14:45:04 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from localhost ([2605:a601:a632:4e00:3d70:ad83:63ae:3283])
        by smtp.gmail.com with ESMTPSA id y11sm3970858qtx.13.2021.08.10.14.45.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Aug 2021 14:45:04 -0700 (PDT)
From: "Jon Mason" <jdmason@kudzu.us>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] tunes: the great migration
Date: Tue, 10 Aug 2021 17:45:00 -0400
Message-Id: <20210810214503.17791-1-jdmason@kudzu.us>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move all tune files into their architecture directory. 

I'm doing this all as one series, even though they are going to
different repos, as an attempt to make this as atomic as possible.

It might be preferable to be more aggressive in the sorting of arm
machines into unique architecture versioned directories, but I only did
this for ARMv8.  If doing all of them that way is desired, let me know
and I'll do a v2.

I ran a quick and dirty CI on this via gitlab.  The results can be found
at https://gitlab.com/jonmason00/poky/-/pipelines/351075314
The "failures" on riscv are just warnings and they passed a slimmed down
testimage (only ssh tests).  I opened a bug for the warning,
https://bugzilla.yoctoproject.org/show_bug.cgi?id=14504


Jon Mason (3):
  conf/machine: move tune files to architecture directories
  yocto-bsp: update machine confs with new tune locations
  docs: update docs with new tune locations

 documentation/bsp-guide/bsp.rst                               | 4 ++--
 documentation/ref-manual/variables.rst                        | 2 +-
 meta-yocto-bsp/conf/machine/beaglebone-yocto.conf             | 2 +-
 meta-yocto-bsp/conf/machine/edgerouter.conf                   | 2 +-
 meta-yocto-bsp/conf/machine/genericx86-64.conf                | 2 +-
 meta-yocto-bsp/conf/machine/genericx86.conf                   | 2 +-
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
 meta/conf/machine/include/{ => arm}/tune-arm1136jf-s.inc      | 0
 meta/conf/machine/include/{ => arm}/tune-arm1176jz-s.inc      | 0
 meta/conf/machine/include/{ => arm}/tune-arm920t.inc          | 0
 meta/conf/machine/include/{ => arm}/tune-arm926ejs.inc        | 0
 meta/conf/machine/include/{ => arm}/tune-arm9tdmi.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexa15.inc        | 0
 meta/conf/machine/include/{ => arm}/tune-cortexa17.inc        | 0
 meta/conf/machine/include/{ => arm}/tune-cortexa5.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexa7.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexa8.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexa9.inc         | 0
 .../include/{tune-cortex-m0.inc => arm/tune-cortexm0.inc}     | 0
 .../{tune-cortex-m0plus.inc => arm/tune-cortexm0plus.inc}     | 0
 meta/conf/machine/include/{ => arm}/tune-cortexm1.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexm3.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexm4.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-cortexm7.inc         | 0
 meta/conf/machine/include/{ => arm}/tune-ep9312.inc           | 0
 meta/conf/machine/include/{ => arm}/tune-iwmmxt.inc           | 0
 meta/conf/machine/include/{ => arm}/tune-strongarm1100.inc    | 0
 meta/conf/machine/include/{ => arm}/tune-xscale.inc           | 0
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
 meta/conf/machine/include/{ => sh}/tune-sh4.inc               | 0
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
 84 files changed, 32 insertions(+), 32 deletions(-)
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
 rename meta/conf/machine/include/{ => arm}/tune-arm1136jf-s.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-arm1176jz-s.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-arm920t.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-arm926ejs.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-arm9tdmi.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexa15.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexa17.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexa5.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexa7.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexa8.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexa9.inc (100%)
 rename meta/conf/machine/include/{tune-cortex-m0.inc => arm/tune-cortexm0.inc} (100%)
 rename meta/conf/machine/include/{tune-cortex-m0plus.inc => arm/tune-cortexm0plus.inc} (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexm1.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexm3.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexm4.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-cortexm7.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-ep9312.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-iwmmxt.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-strongarm1100.inc (100%)
 rename meta/conf/machine/include/{ => arm}/tune-xscale.inc (100%)
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
 rename meta/conf/machine/include/{ => sh}/tune-sh4.inc (100%)
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

