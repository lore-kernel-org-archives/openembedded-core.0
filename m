Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217C7C7EE2E
	for <webhook@archiver.kernel.org>; Fri,  9 Jun 2023 16:54:06 +0000 (UTC)
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
 by mx.groups.io with SMTP id smtpd.web10.149.1686329644746744163
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Jun 2023 09:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=umIYOt/9;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.177, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-65311774e52so1587931b3a.3
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 09:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686329644; x=1688921644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=R3+/R4NYtB/fUowLkpkDYYbAdZConBatLz5y0tsiwGA=;
        b=umIYOt/9j9YDs0nMBU7CX7InrqdZX+M2vufNnUPFpO26hxfEUMADMBiW+RADe5aMQ1
         mYz8n9yFbssewqxYfV69SEC7IYsySN45XVqNCUj2ZUkDAW1FKFAyLlok8pBEW4BzCZeN
         PpK2JJxdlODV00BwzZbPkaNrMqaxJG0Zzgam5tehGoamQJddArplqtdf8JvsxZKtYHZo
         +eLkFjuAO4LQhUpahcbwCi1cR8vHGnNG6Gywhk9tncDGh9ztOgHBJNL95Pg30KVJDnzy
         gGURV7erYLnu8l9p1xBqZ39bkK66P4QO1cRqI3GpnLJ4Nf6OCyGRbzX6uiD6zbMLIXtI
         iZ6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686329644; x=1688921644;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R3+/R4NYtB/fUowLkpkDYYbAdZConBatLz5y0tsiwGA=;
        b=OGIjFW0lfszpgUMiNi/D2Q1rJuDct25Qc3bVeqnsgQm5lKSGXcloHSOqAG2OsEHCCM
         Vt9FIkmpSB8/PHCc5gNlUSWt65S8ot75cNT8TLjKy80+S59fwSOpR1YgFqEn5igBsWW6
         6/jtOJtO/gmfM0MtgzZfOlImyi3MEKoslYQNunH9vDOevbU5aY5IyH4nbK3lNr1bbAp2
         7/ieeeMS3W7oMqugg24gFgLOAsMD6aNJRBy8TFDoVHGY5Bb+LSxIOHyAirxlziMqXBF9
         5U2jHkc2D6PuEBUmY6w4N3ysPRlZ1tyt6nxxAHSE81g2RU/6Ud31IFBywrH/uZxZpjbR
         nEPQ==
X-Gm-Message-State: AC+VfDzba9mBmqKclbDCH9ZnSRl9gFyXaxw6nhPDLXGd5NdXZsDoafgH
	qWjl3EDSn/bdU3tkwp27VOZ6bI1o7gtwhX9DDuA=
X-Google-Smtp-Source: ACHHUZ5V+tz5YpCqQtDxdtLtQt6Sl1TbIHlKuJIj3KHCMaiiyUGXiMQP9470Zs1t48RGtwvXiqQJEA==
X-Received: by 2002:a05:6a00:23ca:b0:64d:5f9c:7b75 with SMTP id g10-20020a056a0023ca00b0064d5f9c7b75mr1874256pfc.16.1686329643382;
        Fri, 09 Jun 2023 09:54:03 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id j24-20020a62b618000000b0065980654baasm2901071pff.130.2023.06.09.09.54.02
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 09:54:02 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/30] Patch review
Date: Fri,  9 Jun 2023 06:53:27 -1000
Message-Id: <cover.1686329289.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Jun 2023 16:54:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182566

Please review this set of changes for mickledore and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5432

with the exception of oe-selftest-fedora:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5301

which failed due to a transient outage at gitlab:

Could not list remote: Fetcher failure: Fetch command export PSEUDO_DISABLED=1; git -c gc.autoDetach=false -c core.pager=cat ls-remote https://gitlab.gnome.org/GNOME/sysprof.git refs/tags/* failed with exit code 128, output:
remote: GitLab is not responding
fatal: unable to access 'https://gitlab.gnome.org/GNOME/sysprof.git/': The requested URL returned error: 502

Subsequent retest of oe-selftest-fedora passed:

https://autobuilder.yoctoproject.org/typhoon/#/builders/86/builds/5306

The following changes since commit fb1de20b22119fd62b338ab69cd2b6a6c4e9dd8f:

  qemurunner: avoid leaking server_socket (2023-06-01 06:33:14 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (1):
  rpm: update 4.18.0 -> 4.18.1

Bruce Ashfield (2):
  kernel: don't force PAHOLE=false
  linux-yocto: move build / debug dependencies to .inc

Chen Qi (1):
  staging.bbclass: do not add extend_recipe_sysroot to prefuncs of
    prepare_recipe_sysroot

Deepthi Hemraj (1):
  binutils: stable 2.40 branch updates

Denys Dmytriyenko (1):
  xz: upgrade 5.4.2 -> 5.4.3

Eero Aaltonen (1):
  avahi: fix D-Bus introspection

Khem Raj (2):
  go: Upgrade 1.20.1 -> 1.20.4
  go: Use -no-pie to build target cgo

Lorenzo Arena (1):
  conf: add nice level to the hash config ignred variables

Martin Jansa (4):
  binutils: package static libs from gprofng
  go.bbclass: don't use test to check output from ls
  image-live.bbclass: respect IMAGE_MACHINE_SUFFIX
  rpm: drop unused
    0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch

Michael Halstead (2):
  uninative: Upgrade to 3.10 to support gcc 13
  uninative: Upgrade to 4.0 to include latest gcc 13.1.1

Pavel Zhukov (1):
  lib/terminal.py: Add urxvt terminal

Peter Kjellerstedt (2):
  musl: Correct SRC_URI
  xf86-video-intel: Use the HTTPS protocol to fetch the Git repositories

Qiu Tingting (1):
  e2fsprogs: Fix error SRCDIR when using usrmerge DISTRO_FEATURES

Randy MacLeod (1):
  vim: upgrade 9.0.1429 -> 9.0.1527

Ranjitsinh Rathod (1):
  kmscube: Correct DEPENDS to avoid overwrite

Richard Purdie (1):
  selftest/reproducible: Allow native/cross reuse in test

Ross Burton (1):
  meta: depend on autoconf-archive-native, not autoconf-archive

Sudip Mukherjee (1):
  libxi: upgrade to v1.8.1

Thomas Roos (2):
  oeqa/selftest/cases/devtool.py: skip all tests require folder a git
    repo
  oeqa: adding selftest-hello and use it to speed up tests

Tom Hochstein (1):
  piglit: Add missing glslang dependencies

Wang Mingyu (1):
  iso-codes: upgrade 4.13.0 -> 4.15.0

Xiangyu Chen (1):
  sysstat: Fix CVE-2023-33204

 .../selftest-hello/files/helloworld.c         |   8 +
 .../selftest-hello/selftest-hello_1.0.bb      |  19 ++
 meta/classes-global/staging.bbclass           |   2 +-
 meta/classes-recipe/go.bbclass                |   2 +-
 meta/classes-recipe/image-live.bbclass        |   2 +-
 meta/classes-recipe/kernel.bbclass            |   2 +-
 meta/conf/bitbake.conf                        |   2 +-
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oe/terminal.py                       |   4 +
 meta/lib/oeqa/selftest/cases/bbtests.py       |  18 +-
 meta/lib/oeqa/selftest/cases/devtool.py       |   8 +
 meta/lib/oeqa/selftest/cases/reproducible.py  |   4 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   3 +-
 meta/recipes-connectivity/neard/neard_0.18.bb |   2 +-
 meta/recipes-core/dbus/dbus_1.14.6.bb         |   2 +-
 meta/recipes-core/musl/musl_git.bb            |   2 +-
 .../binutils/binutils-2.40.inc                |   3 +-
 ...s-crosssdk-Generate-relocatable-SDKs.patch |   2 +-
 ...o-not-generate-linker-script-directo.patch |   2 +-
 ...dk-Search-for-alternative-ld.so.conf.patch |   8 +-
 ...004-Point-scripts-location-to-libdir.patch |   6 +-
 ...stro-compiler-point-to-the-wrong-ins.patch |   2 +-
 ...-system-directories-when-cross-linki.patch |   8 +-
 ...ect-assembling-for-ppc-wait-mnemonic.patch |   2 +-
 .../binutils/0008-Use-libtool-2.4.patch       | 252 +++++++++---------
 ...h-in-libtool-when-sysroot-is-enabled.patch |   2 +-
 .../0010-sync-with-OE-libtool-changes.patch   |   2 +-
 ...or-clang-before-checking-gcc-version.patch |   6 +-
 ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |   2 +-
 ...sing-_Alignof-when-using-C11-or-newe.patch |   2 +-
 ...-dependencies-on-gmp-and-mpfr-when-g.patch |  56 ----
 .../binutils/binutils_2.40.bb                 |   3 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs.inc |   2 +-
 .../e2fsprogs/e2fsprogs/ptest.patch           |   4 +-
 .../e2fsprogs/e2fsprogs_1.47.0.bb             |   1 +
 .../go/{go-1.20.1.inc => go-1.20.4.inc}       |   5 +-
 ...e_1.20.1.bb => go-binary-native_1.20.4.bb} |   6 +-
 ..._1.20.1.bb => go-cross-canadian_1.20.4.bb} |   0
 ...{go-cross_1.20.1.bb => go-cross_1.20.4.bb} |   0
 ...osssdk_1.20.1.bb => go-crosssdk_1.20.4.bb} |   0
 ...o-native_1.20.1.bb => go-native_1.20.4.bb} |   0
 ...runtime_1.20.1.bb => go-runtime_1.20.4.bb} |   0
 ...ompile-instantiated-generic-methods-.patch |  90 -------
 .../go/go/CVE-2023-24532.patch                | 208 ---------------
 .../go/go/CVE-2023-24537.patch                |  89 -------
 .../go/{go_1.20.1.bb => go_1.20.4.bb}         |   2 +-
 ...olor-setting-for-mips64_n32-binaries.patch |  26 +-
 ...lib-rpm-as-the-installation-path-for.patch |  30 +--
 ...support-for-unused-MD2-and-RIPEMD160.patch |  81 ------
 ...o-not-build-manpages-requires-pandoc.patch |  23 --
 meta/recipes-devtools/rpm/files/fifofix.patch |  22 --
 .../rpm/files/fix-declaration.patch           |  39 +++
 .../rpm/{rpm_4.18.0.bb => rpm_4.18.1.bb}      |   7 +-
 .../sysstat/sysstat/CVE-2023-33204.patch      |  46 ++++
 .../sysstat/sysstat_12.6.2.bb                 |   4 +-
 meta/recipes-extended/wget/wget.inc           |   2 +-
 .../xz/{xz_5.4.2.bb => xz_5.4.3.bb}           |   2 +-
 .../gobject-introspection_1.74.0.bb           |   2 +-
 meta/recipes-graphics/kmscube/kmscube_git.bb  |   3 +-
 meta/recipes-graphics/piglit/piglit_git.bb    |   2 +-
 .../xorg-driver/xf86-video-intel_git.bb       |   3 +-
 .../recipes-graphics/xorg-lib/libx11_1.8.4.bb |   2 +-
 .../xorg-lib/{libxi_1.8.bb => libxi_1.8.1.bb} |   4 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |  10 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |   4 -
 meta/recipes-kernel/powertop/powertop_2.15.bb |   2 +-
 meta/recipes-support/icu/icu_72-1.bb          |   3 +-
 ...so-codes_4.13.0.bb => iso-codes_4.15.0.bb} |   2 +-
 meta/recipes-support/mpfr/mpfr_4.2.0.bb       |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 70 files changed, 365 insertions(+), 813 deletions(-)
 create mode 100644 meta-selftest/recipes-test/selftest-hello/files/helloworld.c
 create mode 100644 meta-selftest/recipes-test/selftest-hello/selftest-hello_1.0.bb
 delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch
 rename meta/recipes-devtools/go/{go-1.20.1.inc => go-1.20.4.inc} (77%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.1.bb => go-binary-native_1.20.4.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.1.bb => go-cross-canadian_1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.1.bb => go-cross_1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.1.bb => go-crosssdk_1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.1.bb => go-native_1.20.4.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.1.bb => go-runtime_1.20.4.bb} (100%)
 delete mode 100644 meta/recipes-devtools/go/go/0010-cmd-compile-re-compile-instantiated-generic-methods-.patch
 delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24532.patch
 delete mode 100644 meta/recipes-devtools/go/go/CVE-2023-24537.patch
 rename meta/recipes-devtools/go/{go_1.20.1.bb => go_1.20.4.bb} (92%)
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-Rip-out-partial-support-for-unused-MD2-and-RIPEMD160.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/0001-docs-do-not-build-manpages-requires-pandoc.patch
 delete mode 100644 meta/recipes-devtools/rpm/files/fifofix.patch
 create mode 100644 meta/recipes-devtools/rpm/files/fix-declaration.patch
 rename meta/recipes-devtools/rpm/{rpm_4.18.0.bb => rpm_4.18.1.bb} (97%)
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2023-33204.patch
 rename meta/recipes-extended/xz/{xz_5.4.2.bb => xz_5.4.3.bb} (95%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.8.bb => libxi_1.8.1.bb} (85%)
 rename meta/recipes-support/iso-codes/{iso-codes_4.13.0.bb => iso-codes_4.15.0.bb} (94%)

-- 
2.34.1


