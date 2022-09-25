Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4045AC04A95
	for <webhook@archiver.kernel.org>; Sun, 25 Sep 2022 19:18:02 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web09.20382.1664133476760241863
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:17:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=IiL9OW9U;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 j6-20020a17090a694600b00200bba67dadso4842738pjm.5
        for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Sep 2022 12:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=c+hMvcnw3YkixjOjhqD5QMGHG9719LrORFN3xA2Yn+s=;
        b=IiL9OW9UHvweIHy4EtruhlCclxo6mJLdPZM5yI04VbD/SOS/A2I4QTljvITrXuFCZq
         pBHxXzbhNBUULiPNh57yrxsgmrR3IqdpmWELbPUXaUcpFuwO9w9avZzb3Du5XDKMfxxD
         OrpUucWj4DrbNrOlqjByp2EI8FX2LNrUVGm56Fg60SDRqkN/3riBl6AVCipB/HxCBW3F
         6pE1uMHB19EU3MaOlduRz+sZnoTGSuIJ7t25RQKP+OtrDdfzlfAJAHimbvcUSj+aTfUT
         bMa3H3R0+7Bp5nHZGIqwekaXt4DQ57ta772C+H0LCZ8bnRZdJGYZa3ojHAkxHoPbFe3z
         fsYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=c+hMvcnw3YkixjOjhqD5QMGHG9719LrORFN3xA2Yn+s=;
        b=4f297kYg5Nzv68Dx9x4XwVHDbEHHg7v+f1tFAHndd/r8ZCqaCZRelgY92vDi79yi6k
         MpZosKXxAQvROQfuzYB5H8scF5fT/QeRbJVvZHD6aVoSPwj3Gi/+LUBKxgkaE4GV6W51
         arv6OawUaE96rxL0SgADyvLIluQMHW8LrHF6+TQjXfMHKDW86/ECQZvZipxh3+fSJTuY
         uEQvlexSZz7TPhiw4vsM1qyJFQwRVKZfOdLRQfuP0nulv6hxjcysHZfFHJfRga1NlC+3
         mxgNsxcbQk60ZDK6r4wljeyzUXg5qDPF89N9q3CYAvg+sNmOFNK2qRZ+X++tpvrRtqzB
         lwLA==
X-Gm-Message-State: ACrzQf0I3aveCvkiZPHUbY+keA+93nF+5/ZPG4YUPjgteM3a0zc1ZpXB
	Beo6h/lmx3ZGQpFTz0S2dNqcQ9bgloCM/nDU
X-Google-Smtp-Source: 
 AMsMyM60uZ1eqIYm/kBlbNFFyDNbzJw94oeiykjrjl7LM32slZTOlHxyqluCwa8y0/ZWUPEMG+iJsg==
X-Received: by 2002:a17:902:f602:b0:178:9818:48a4 with SMTP id
 n2-20020a170902f60200b00178981848a4mr18724925plg.148.1664133475406;
        Sun, 25 Sep 2022 12:17:55 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 f126-20020a625184000000b0053651308a1csm10311257pfb.195.2022.09.25.12.17.54
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 12:17:54 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/33] Patch review
Date: Sun, 25 Sep 2022 09:17:11 -1000
Message-Id: <cover.1664133308.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 25 Sep 2022 19:18:02 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171014

Please review this set of patches for kirkstone and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4265

The following changes since commit f7766da462905ec67bf549d46b8017be36cd5b2a:

  build-appliance-image: Update to kirkstone head revision (2022-09-20 16:07:21 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexandre Belloni (1):
  oeqa/runtime/dnf: fix typo

Bruce Ashfield (9):
  linux-yocto/5.10: update to v5.10.141
  linux-yocto/5.10: update to v5.10.143
  linux-yocto/5.15: update to v5.15.63
  linux-yocto/5.15: update to v5.15.65
  linux-yocto/5.15: update to v5.15.68
  linux-yocto/5.15: cfg: fix ACPI warnings for -tiny
  kernel-yocto: allow patch author date to be commit date
  kern-tools: fix queue processing in relative TOPDIR configurations
  kern-tools: allow 'y' or 'm' to avoid config audit warnings

Dmitry Baryshkov (2):
  linux-firmware: upgrade 20220708 -> 20220913
  linux-firmware: package new Qualcomm firmware

Florin Diaconescu (2):
  expat: upgrade 2.4.7 -> 2.4.8
  expat: upgrade 2.4.8 -> 2.4.9

Mikko Rapeli (5):
  u-boot: switch from append to += in SRC_URI
  glibc-tests: use += instead of :append
  go-native: switch from SRC_URI:append to SRC_URI +=
  python3-rfc3986-validator: switch from SRC_URI:append to SRC_URI +=
  linux-libc-headers: switch from SRC_URI:append to SRC_URI +=

Mingli Yu (1):
  busybox: add devmem 128-bit support

Richard Purdie (3):
  libpng: upgrade 1.6.37 -> 1.6.38
  vim: Upgrade 9.0.453 -> 9.0.541
  perf: Fix for recent kernel upgrades

Robert Joslyn (1):
  tzdata: Update from 2022b to 2022c

Ruiqiang Hao (2):
  gcc: add arm-v9 support
  tune-neoversen2: support tune-neoversen2 base on armv9a

Samuli Piippo (2):
  Revert "gcc-cross-canadian: Add symlink to real-ld alongside other
    symlinks"
  gcc-cross-canadian: add default plugin linker

Sundeep KOKKONDA (1):
  glibc: stable 2.35 branch updates.

Teoh Jay Shen (2):
  go: fix CVE-2022-27664
  inetutils: fix CVE-2022-39028 - remote DoS vulnerability in
    inetutils-telnetd

Xiangyu Chen (1):
  ltp: Fix pread02 case trigger the glibc overflow detection

pgowda (1):
  binutils: fix CVE-2022-38126

 meta/classes/kernel-yocto.bbclass             |   6 +-
 meta/conf/machine/include/arm/arch-armv9a.inc |  28 ++
 .../include/arm/armv9a/tune-neoversen2.inc    |  10 +-
 meta/lib/oeqa/runtime/cases/dnf.py            |   2 +-
 meta/recipes-bsp/u-boot/u-boot_2022.01.bb     |   2 +-
 .../inetutils/inetutils/CVE-2022-39028.patch  |  54 ++++
 .../inetutils/inetutils_2.2.bb                |   1 +
 .../0001-devmem-add-128-bit-width.patch       | 128 ++++++++
 meta/recipes-core/busybox/busybox_1.35.0.bb   |   1 +
 .../expat/{expat_2.4.7.bb => expat_2.4.9.bb}  |   4 +-
 meta/recipes-core/glibc/glibc-tests_2.35.bb   |   4 +-
 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../binutils/binutils-2.38.inc                |   1 +
 .../binutils/0016-CVE-2022-38126.patch        |  34 ++
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   5 +
 .../gcc/gcc-cross-canadian.inc                |   3 +-
 ...rch64-Update-Neoverse-N2-core-defini.patch |  42 +++
 .../0002-aarch64-add-armv9-a-to-march.patch   |  89 ++++++
 ...le-FP16-feature-by-default-for-Armv9.patch |  38 +++
 ...rm-add-armv9-a-architecture-to-march.patch | 294 ++++++++++++++++++
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-27664.patch           | 102 ++++++
 meta/recipes-devtools/go/go-native_1.17.13.bb |   2 +-
 .../python/python3-rfc3986-validator_0.1.1.bb |   2 +-
 ...er-to-avoid-glibc-overflow-detection.patch |  58 ++++
 meta/recipes-extended/ltp/ltp_20220121.bb     |   1 +
 meta/recipes-extended/timezone/timezone.inc   |   6 +-
 .../kern-tools/kern-tools-native_git.bb       |   2 +-
 ...20220708.bb => linux-firmware_20220913.bb} |  26 +-
 .../linux-libc-headers_5.16.bb                |   2 +-
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-kernel/perf/perf.bb              |   6 +
 .../{libpng_1.6.37.bb => libpng_1.6.38.bb}    |   5 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 39 files changed, 973 insertions(+), 68 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv9a.inc
 create mode 100644 meta/recipes-connectivity/inetutils/inetutils/CVE-2022-39028.patch
 create mode 100644 meta/recipes-core/busybox/busybox/0001-devmem-add-128-bit-width.patch
 rename meta/recipes-core/expat/{expat_2.4.7.bb => expat_2.4.9.bb} (84%)
 create mode 100644 meta/recipes-devtools/binutils/binutils/0016-CVE-2022-38126.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0001-aarch64-Update-Neoverse-N2-core-defini.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0002-aarch64-add-armv9-a-to-march.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0003-aarch64-Enable-FP16-feature-by-default-for-Armv9.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc/0004-arm-add-armv9-a-architecture-to-march.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-27664.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-syscalls-pread02-extend-buffer-to-avoid-glibc-overflow-detection.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220708.bb => linux-firmware_20220913.bb} (96%)
 rename meta/recipes-multimedia/libpng/{libpng_1.6.37.bb => libpng_1.6.38.bb} (83%)

-- 
2.25.1


