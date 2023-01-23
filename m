Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC4EAC27C76
	for <webhook@archiver.kernel.org>; Mon, 23 Jan 2023 02:21:46 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web11.34072.1674440497861032178
 for <openembedded-core@lists.openembedded.org>;
 Sun, 22 Jan 2023 18:21:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=44CKAsbD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.180, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f180.google.com with SMTP id c26so7744327pfp.10
        for <openembedded-core@lists.openembedded.org>; Sun, 22 Jan 2023 18:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3qkadoOiUZSZRj2R1AHNxpVXKbFkHfIeLM+eCqB+w4=;
        b=44CKAsbDf6U9k8jVamDQATpBgvRcyu5fP7icoKW17M/nHjGWj4xh/LLmWjfJTjh5HI
         eZf2MMl0Hg6Py5vDI+5t6ZA7crOkTIRWdtIESB7gTf/k7tYA4i9R0MYmWD4td24G3hBm
         RA9jWkSR2dldUUp9tdnMA25CL79Fz6HeI9ZXALQrv1lDMpjzlMAOvy/G4ErG6MbqxSDd
         K/pM1bvMmCp9MpbdMw/Q+7ZasBWM+bZYmoIxaNB/zfQpKkyKxJkdU0pFTsWRTgHXw38P
         gQb0b0oNmu8+Jj8nTU3I2lZtpnnt8/PLw3a4F/bb0heCIuALunztgo3wez8wsxIqKIH1
         MDRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y3qkadoOiUZSZRj2R1AHNxpVXKbFkHfIeLM+eCqB+w4=;
        b=qdkyADIF+pOF+AgeTj4YgRtFfjuFlvBuSQ+QAoLRRBF1T/Tcbd8IDcyQU3+SmIRlSB
         96ASMVvV5Ng7Okxl6816uXy+SRbvFko+h4QKQcJ2X3NqNOlRVV8ZIaAsi7ZhrsAUaMKO
         Yi5VGc0zyKlkAPHnFh1K3LJoESgQ3MOcIY6K3xdZLa/Dwd0+YxXl9/L+h7uSLhmejF1U
         UFbev34PYmvaFpUIR1mvMtpvk+2iVDiP7CWQypajOjvGDmsZEXJ9ugXrGv6HCGQXP3o7
         LpXmSWiZjiwqBdwJNl9ir+qgGYIxTzQB/LM9Swo+pLvyEeSTlKH5g8zKdkDZmhQDhOGA
         eYBA==
X-Gm-Message-State: AFqh2kpjdF06fga/m/7EjqciASvxe0EmU5EXjfFZvVyLCq+8skbm3zb4
	4YOd+gKqP8meDQQwE2hYBF2kBhawU4qe2h2DhAM=
X-Google-Smtp-Source: AMrXdXs5VTWj+mZY7+dfqAqjZzLrfBSbhT9aU+4xwl3ek9GNP4MBFpePTxOII2zyqIZORGY5bqmYcw==
X-Received: by 2002:a05:6a00:2a04:b0:582:26bc:a75b with SMTP id ce4-20020a056a002a0400b0058226bca75bmr24830479pfb.9.1674440496416;
        Sun, 22 Jan 2023 18:21:36 -0800 (PST)
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id h11-20020a056a00000b00b0058dd9c46a8csm10384222pfk.64.2023.01.22.18.21.35
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jan 2023 18:21:35 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/32] Patch review
Date: Sun, 22 Jan 2023 16:20:54 -1000
Message-Id: <cover.1674440376.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 23 Jan 2023 02:21:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176264

Please review this set of patches for kirkstone and have comments back by
end of day Tuesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/4815

The following changes since commit 34de16fd86775c0f2ede1670fec90217e4d11776:

  gtk-icon-cache: Fix GTKIC_CMD if-else condition (2023-01-16 04:41:29 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alex Kiernan (1):
  classes: image: Set empty weak default IMAGE_LINGUAS

Alexander Kanavin (5):
  libksba: update 1.6.2 -> 1.6.3
  linux-firmware: upgrade 20221109 -> 20221214
  xwayland: upgrade 22.1.5 -> 22.1.7
  xserver-xorg: upgrade 21.1.4 -> 21.1.6
  selftest/virgl: use pkg-config from the host

Antonin Godard (2):
  busybox: always start do_compile with orig config files
  busybox: rm temporary files if do_compile was interrupted

Benoît Mauduit (1):
  lib/oe/reproducible: Use git log without gpg signature

Bruce Ashfield (5):
  linux-yocto/5.15: ltp and squashfs fixes
  linux-yocto/5.15: fix perf build with clang
  linux-yocto/5.15: libbpf: Fix build warning on ref_ctr_off
  linux-yocto/5.15: update to v5.15.84
  linux-yocto/5.15: powerpc: Fix reschedule bug in KUAP-unlocked user
    copy

Chen Qi (2):
  dhcpcd: backport two patches to fix runtime error
  libseccomp: fix typo in DESCRIPTION

He Zhe (1):
  lttng-modules: update 2.13.7 -> 2.13.8

Hitendra Prajapati (1):
  go: fix CVE-2022-41717 Excessive memory use in got server

Jan Kircher (1):
  toolchain-scripts: compatibility with unbound variable protection

Jermain Horsman (1):
  cve-check: write the cve manifest to IMGDEPLOYDIR

Khem Raj (1):
  tiff: Add packageconfig knob for webp

Marta Rybczynska (1):
  cve-update-db-native: avoid incomplete updates

Narpat Mali (1):
  ffmpeg: fix for CVE-2022-3341

Pavel Zhukov (1):
  gcc: Refactor linker patches and fix linker on arm with usrmerge

Petr Kubizňák (1):
  harfbuzz: remove bindir only if it exists

Quentin Schulz (1):
  cairo: fix CVE patches assigned wrong CVE number

Randy MacLeod (1):
  vim: upgrade 9.0.0947 -> 9.0.1211

Ross Burton (1):
  cve-update-db-native: show IP on failure

Sandeep Gundlupet Raju (2):
  kernel-fitimage: Adjust order of dtb/dtbo files
  kernel-fitimage: Allow user to select dtb when multiple dtb exists

Saul Wold (1):
  at: Change when files are copied

Steve Sakoman (1):
  Revert "libksba: fix CVE-2022-47629"

 meta/classes/cve-check.bbclass                |   6 +-
 meta/classes/image.bbclass                    |   3 +-
 meta/classes/kernel-fitimage.bbclass          |  21 +-
 meta/classes/toolchain-scripts.bbclass        |   2 +-
 meta/lib/oe/reproducible.py                   |   3 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 .../dhcpcd/dhcpcd_9.4.1.bb                    |   2 +
 ...low-getrandom-sysctl-for-newer-glibc.patch |  30 ++
 ...sep-Allow-newfstatat-syscall-as-well.patch |  31 ++
 meta/recipes-core/busybox/busybox.inc         |  26 +-
 .../recipes-core/meta/cve-update-db-native.bb |  88 ++++--
 meta/recipes-devtools/gcc/gcc-11.3.inc        |   1 -
 ...rm-add-armv9-a-architecture-to-march.patch |  89 +++---
 ...AMIC_LINKER-and-UCLIBC_DYNAMIC_LINKE.patch | 269 +++++++++++++-----
 ...s-fix-v4bx-to-linker-to-support-EABI.patch |  10 +-
 ...019-nios2-Define-MUSL_DYNAMIC_LINKER.patch |  25 --
 meta/recipes-devtools/go/go-1.17.13.inc       |   1 +
 .../go/go-1.18/CVE-2022-41717.patch           |  89 ++++++
 meta/recipes-extended/at/at_3.2.5.bb          |   6 +-
 .../cairo/cairo/CVE-2019-6461.patch           |  46 +--
 .../cairo/cairo/CVE-2019-6462.patch           |  46 ++-
 .../harfbuzz/harfbuzz_4.0.1.bb                |   6 +-
 ...possible-memleaks-in-XkbGetKbdByName.patch |  63 ----
 ...ntedString-against-request-length-at.patch |  38 ---
 ...-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} |   4 +-
 ...{xwayland_22.1.5.bb => xwayland_22.1.7.bb} |   2 +-
 ...20221109.bb => linux-firmware_20221214.bb} |   4 +-
 .../linux/linux-yocto-rt_5.15.bb              |   6 +-
 .../linux/linux-yocto-tiny_5.15.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_5.15.bb |  26 +-
 ...ules_2.13.7.bb => lttng-modules_2.13.8.bb} |   2 +-
 ...ec-Add-check-for-avformat_new_stream.patch |  67 +++++
 .../recipes-multimedia/ffmpeg/ffmpeg_5.0.1.bb |   3 +-
 meta/recipes-multimedia/libtiff/tiff_4.3.0.bb |   1 +
 ...overflow-in-the-CRL-signature-parser.patch |  72 -----
 .../libksba/ksba-add-pkgconfig-support.patch  |   6 +-
 .../{libksba_1.6.2.bb => libksba_1.6.3.bb}    |   5 +-
 .../libseccomp/libseccomp_2.5.3.bb            |   2 +-
 meta/recipes-support/vim/vim.inc              |   4 +-
 39 files changed, 662 insertions(+), 451 deletions(-)
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0001-privsep-Allow-getrandom-sysctl-for-newer-glibc.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/0002-privsep-Allow-newfstatat-syscall-as-well.patch
 delete mode 100644 meta/recipes-devtools/gcc/gcc/0019-nios2-Define-MUSL_DYNAMIC_LINKER.patch
 create mode 100644 meta/recipes-devtools/go/go-1.18/CVE-2022-41717.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-fix-some-possible-memleaks-in-XkbGetKbdByName.patch
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-xkb-proof-GetCountedString-against-request-length-at.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_21.1.4.bb => xserver-xorg_21.1.6.bb} (80%)
 rename meta/recipes-graphics/xwayland/{xwayland_22.1.5.bb => xwayland_22.1.7.bb} (95%)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20221109.bb => linux-firmware_20221214.bb} (99%)
 rename meta/recipes-kernel/lttng/{lttng-modules_2.13.7.bb => lttng-modules_2.13.8.bb} (94%)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-avformat-nutdec-Add-check-for-avformat_new_stream.patch
 delete mode 100644 meta/recipes-support/libksba/libksba/0001-Fix-an-integer-overflow-in-the-CRL-signature-parser.patch
 rename meta/recipes-support/libksba/{libksba_1.6.2.bb => libksba_1.6.3.bb} (86%)

-- 
2.25.1


