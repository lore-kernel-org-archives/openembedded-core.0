Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A77EB64DC
	for <webhook@archiver.kernel.org>; Wed, 28 Jun 2023 02:30:04 +0000 (UTC)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
 by mx.groups.io with SMTP id smtpd.web11.7371.1687919395102076902
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 19:29:55 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=K6rhBhJx;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.178, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-39ed11d6a50so3838585b6e.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:29:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687919393; x=1690511393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=oiiOnr0IjNlOZBgM1WYynyiyAbFg0ASvTfOUmQv9ejU=;
        b=K6rhBhJx4zuVQAazgc2uCBCOovuWAht0sJhMEY9ZcqiB+0AdEY5mvqooK9yOB3k7xr
         pXnZOTejfENB6ZJU0cqGsGUshAYqs/A7ujAh3lCbiGlKp+pvxlDV7HPCdjlI3wOUOSbz
         EBqsFGkEzvpoaH0lm/Y8vZ8leJonpP4OaGDPS1dfulFSRIgR3PkTQg60LC7qPQvDHikQ
         eKUgWRqtWYvbuzKJdBAEpy+R8Ytk6wiGNZkhMSDZbSf2FUq7Inq5N1V+U7Z0r4af3z9o
         CGgnl8zUT3NziJzSGCiPVHXyPnFnsUuiim5AiN2L+TQnJTN3/SyxbjUGoxyTWMAl5FJs
         Nr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687919393; x=1690511393;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oiiOnr0IjNlOZBgM1WYynyiyAbFg0ASvTfOUmQv9ejU=;
        b=kv91rNTKO5boUANRosJU6TgoDnzWwagOydgehdGyEZH3H+pqyl+OCFw+DYWOpg3OhY
         SQSN39rm1D1Lg20SyT5abbzIWWVgpcMpNeJntxQsrDpoUBJwA4bzbcsqeJaAdg+rO+sY
         uqFXC4j56y2Q/ifuY2at8TgsMFBJXlr7O0n7ieX7SNdZp+M84BawizsOhG0lpN2OgFOi
         +bSL/hGKMzCb8CPpOHpXnahsEg3Z4gAag1K/aFKpY8rxnno37OWoftmO4RYn2g6Ske9g
         bBR3YaAdO1k9gDpMF85GDvnq3IqqZLitElfd8a2yB/C1NQZXIY3EjR/WbHMe9f1tOsA1
         KW/g==
X-Gm-Message-State: AC+VfDzmEXIal1ZE/WF8Uq5LWa7rHJ9E2JFmg7DlPW0juv7L5QoiHTJy
	X1SLGEGVsUHfI3CUTvJshw3FF1Ti34+7oV7FyGTfWg==
X-Google-Smtp-Source: ACHHUZ6lX1PwO0e4YXqw6vV/Xd3lj91Oz8nOUmZlM3ZdwRHiL5bpoylqWMr2hd2Kmst0JkORp7xBFA==
X-Received: by 2002:a05:6808:1924:b0:39b:a87f:91e8 with SMTP id bf36-20020a056808192400b0039ba87f91e8mr49296771oib.45.1687919393215;
        Tue, 27 Jun 2023 19:29:53 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id c18-20020a62e812000000b0063d2d9990ecsm1568666pfi.87.2023.06.27.19.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 19:29:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/30] Patch review
Date: Tue, 27 Jun 2023 16:29:16 -1000
Message-Id: <cover.1687919241.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 28 Jun 2023 02:30:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183509

Please review this set of changes for mickledore and have comments back by
end of day Thursday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5529

The following changes since commit 677661c3e1795a1904a0d869866ea8a6442fb160:

  maintainers.inc: correct Carlos Rafael Giani's email address (2023-06-21 04:19:31 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alejandro Hernandez Samaniego (1):
  baremetal-helloworld: Update SRCREV to fix entry addresses for ARM
    architectures

Anuj Mittal (1):
  gstreamer1.0: upgrade 1.22.2 -> 1.22.3

BELOUARGA Mohamed (1):
  meta: lib: oe: npm_registry: Add more safe caracters

Bruce Ashfield (10):
  linux-yocto/5.15: update to v5.15.114
  linux-yocto/5.15: update to v5.15.115
  linux-yocto/5.15: update to v5.15.116
  linux-yocto/5.15: update to v5.15.117
  linux-yocto/5.15: update to v5.15.118
  linux-yocto/5.15: cfg: fix DECNET configuration warning
  linux-yocto/6.1: update to v6.1.33
  linux-yocto/6.1: fix intermittent x86 boot hangs
  linux-yocto/6.1: update to v6.1.34
  linux-yocto/6.1: update to v6.1.35

Chen Qi (1):
  qemurunner.py: fix error message about qmp

Denys Dmytriyenko (1):
  binutils: move packaging of gprofng static lib into common .inc

Dmitry Baryshkov (1):
  openssl: fix building on riscv32

Frieder Paape (1):
  image_types: Fix reproducible builds for initramfs and UKI img

Jörg Sommer (2):
  runqemu-gen-tapdevs: Refactoring
  runqemu-ifupdown/get-tapdevs: Add support for ip tuntap

Richard Purdie (2):
  v86d: Improve kernel dependency
  strace: Disable failing test

Riyaz Khan (1):
  openssh: Remove BSD-4-clause contents completely from codebase

Ross Burton (3):
  binutils: fix CVE-2023-1972
  pkgconf: upgrade 1.9.4 -> 1.9.5
  git: upgrade to 2.39.3

Sakib Sajal (1):
  go: Upgrade 1.20.4 -> 1.20.5

Steve Sakoman (1):
  maintainers.inc: update version for gcc-source

Sudip Mukherjee (1):
  dpkg: upgrade to v1.21.22

Sundeep KOKKONDA (1):
  gcc : upgrade to v12.3

nikhil (1):
  libwebp: Fix CVE-2023-1999

 meta/classes-recipe/image_types.bbclass       |   5 +-
 meta/conf/distro/include/maintainers.inc      |   2 +-
 meta/lib/oe/npm_registry.py                   |   2 +-
 meta/lib/oeqa/utils/qemurunner.py             |   4 +-
 meta/recipes-bsp/v86d/v86d_0.1.10.bb          |   1 -
 ...401bdd77ca54be6867a154cc01e0d72612e0.patch | 994 ++++++++++++++++++
 .../openssh/openssh_9.3p1.bb                  |   1 +
 .../openssl/openssl_3.1.1.bb                  |   2 +-
 .../binutils/binutils-2.40.inc                |   1 +
 meta/recipes-devtools/binutils/binutils.inc   |   2 +
 ...emory-access-when-an-accessing-a-zer.patch |  43 +
 .../binutils/binutils_2.40.bb                 |   1 -
 .../dpkg/{dpkg_1.21.21.bb => dpkg_1.21.22.bb} |   2 +-
 .../gcc/{gcc-12.2.inc => gcc-12.3.inc}        |   6 +-
 ...ian_12.2.bb => gcc-cross-canadian_12.3.bb} |   0
 .../{gcc-cross_12.2.bb => gcc-cross_12.3.bb}  |   0
 ...-crosssdk_12.2.bb => gcc-crosssdk_12.3.bb} |   0
 ...cc-runtime_12.2.bb => gcc-runtime_12.3.bb} |   0
 ...itizers_12.2.bb => gcc-sanitizers_12.3.bb} |   0
 ...{gcc-source_12.2.bb => gcc-source_12.3.bb} |   0
 .../gcc/{gcc_12.2.bb => gcc_12.3.bb}          |   0
 ...initial_12.2.bb => libgcc-initial_12.3.bb} |   0
 .../gcc/{libgcc_12.2.bb => libgcc_12.3.bb}    |   0
 ...ibgfortran_12.2.bb => libgfortran_12.3.bb} |   0
 .../git/{git_2.39.2.bb => git_2.39.3.bb}      |   2 +-
 .../go/{go-1.20.4.inc => go-1.20.5.inc}       |   2 +-
 ...e_1.20.4.bb => go-binary-native_1.20.5.bb} |   6 +-
 ..._1.20.4.bb => go-cross-canadian_1.20.5.bb} |   0
 ...{go-cross_1.20.4.bb => go-cross_1.20.5.bb} |   0
 ...osssdk_1.20.4.bb => go-crosssdk_1.20.5.bb} |   0
 ...o-native_1.20.4.bb => go-native_1.20.5.bb} |   0
 ...runtime_1.20.4.bb => go-runtime_1.20.5.bb} |   0
 .../go/{go_1.20.4.bb => go_1.20.5.bb}         |   0
 .../{pkgconf_1.9.4.bb => pkgconf_1.9.5.bb}    |   2 +-
 .../strace/strace/skip-sockopt-test.patch     |  37 +
 meta/recipes-devtools/strace/strace_6.2.bb    |   1 +
 .../baremetal-helloworld_git.bb               |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-rt_6.1.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 .../linux/linux-yocto-tiny_6.1.bb             |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 meta/recipes-kernel/linux/linux-yocto_6.1.bb  |  28 +-
 ...tools_1.22.2.bb => gst-devtools_1.22.3.bb} |   2 +-
 ...1.22.2.bb => gstreamer1.0-libav_1.22.3.bb} |   2 +-
 ...x_1.22.2.bb => gstreamer1.0-omx_1.22.3.bb} |   2 +-
 ....bb => gstreamer1.0-plugins-bad_1.22.3.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-base_1.22.3.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-good_1.22.3.bb} |   2 +-
 ...bb => gstreamer1.0-plugins-ugly_1.22.3.bb} |   2 +-
 ....22.2.bb => gstreamer1.0-python_1.22.3.bb} |   2 +-
 ....bb => gstreamer1.0-rtsp-server_1.22.3.bb} |   2 +-
 ...1.22.2.bb => gstreamer1.0-vaapi_1.22.3.bb} |   2 +-
 ...er1.0_1.22.2.bb => gstreamer1.0_1.22.3.bb} |   2 +-
 .../webp/files/CVE-2023-1999.patch            |  55 +
 meta/recipes-multimedia/webp/libwebp_1.3.0.bb |   4 +
 scripts/lib/wic/plugins/source/bootimg-efi.py |   2 +
 scripts/runqemu-gen-tapdevs                   |  89 +-
 scripts/runqemu-ifdown                        |  14 +-
 scripts/runqemu-ifup                          |  31 +-
 60 files changed, 1284 insertions(+), 131 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/7280401bdd77ca54be6867a154cc01e0d72612e0.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/0001-Fix-an-illegal-memory-access-when-an-accessing-a-zer.patch
 rename meta/recipes-devtools/dpkg/{dpkg_1.21.21.bb => dpkg_1.21.22.bb} (95%)
 rename meta/recipes-devtools/gcc/{gcc-12.2.inc => gcc-12.3.inc} (97%)
 rename meta/recipes-devtools/gcc/{gcc-cross-canadian_12.2.bb => gcc-cross-canadian_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-cross_12.2.bb => gcc-cross_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-crosssdk_12.2.bb => gcc-crosssdk_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-runtime_12.2.bb => gcc-runtime_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-sanitizers_12.2.bb => gcc-sanitizers_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc-source_12.2.bb => gcc-source_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{gcc_12.2.bb => gcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc-initial_12.2.bb => libgcc-initial_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgcc_12.2.bb => libgcc_12.3.bb} (100%)
 rename meta/recipes-devtools/gcc/{libgfortran_12.2.bb => libgfortran_12.3.bb} (100%)
 rename meta/recipes-devtools/git/{git_2.39.2.bb => git_2.39.3.bb} (98%)
 rename meta/recipes-devtools/go/{go-1.20.4.inc => go-1.20.5.inc} (89%)
 rename meta/recipes-devtools/go/{go-binary-native_1.20.4.bb => go-binary-native_1.20.5.bb} (78%)
 rename meta/recipes-devtools/go/{go-cross-canadian_1.20.4.bb => go-cross-canadian_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-cross_1.20.4.bb => go-cross_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-crosssdk_1.20.4.bb => go-crosssdk_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-native_1.20.4.bb => go-native_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go-runtime_1.20.4.bb => go-runtime_1.20.5.bb} (100%)
 rename meta/recipes-devtools/go/{go_1.20.4.bb => go_1.20.5.bb} (100%)
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.9.4.bb => pkgconf_1.9.5.bb} (96%)
 create mode 100644 meta/recipes-devtools/strace/strace/skip-sockopt-test.patch
 rename meta/recipes-multimedia/gstreamer/{gst-devtools_1.22.2.bb => gst-devtools_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-libav_1.22.2.bb => gstreamer1.0-libav_1.22.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-omx_1.22.2.bb => gstreamer1.0-omx_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.22.2.bb => gstreamer1.0-plugins-bad_1.22.3.bb} (98%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.22.2.bb => gstreamer1.0-plugins-base_1.22.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-good_1.22.2.bb => gstreamer1.0-plugins-good_1.22.3.bb} (97%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-ugly_1.22.2.bb => gstreamer1.0-plugins-ugly_1.22.3.bb} (94%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-python_1.22.2.bb => gstreamer1.0-python_1.22.3.bb} (91%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-rtsp-server_1.22.2.bb => gstreamer1.0-rtsp-server_1.22.3.bb} (90%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-vaapi_1.22.2.bb => gstreamer1.0-vaapi_1.22.3.bb} (95%)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0_1.22.2.bb => gstreamer1.0_1.22.3.bb} (97%)
 create mode 100644 meta/recipes-multimedia/webp/files/CVE-2023-1999.patch

-- 
2.34.1


