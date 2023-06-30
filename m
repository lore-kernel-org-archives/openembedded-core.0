Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9362EB64D9
	for <webhook@archiver.kernel.org>; Fri, 30 Jun 2023 02:29:14 +0000 (UTC)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web11.3828.1688092153820491992
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Jun 2023 19:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=iHWJenq6;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3a1a0e5c2bcso996587b6e.2
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Jun 2023 19:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1688092153; x=1690684153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=dQd0P86COp0bcmR7smEeTkn348eGbmfJRWlqJ5l1hmA=;
        b=iHWJenq6YHVZsbNCBnyIgvMpQKkZS7lD9ZwehE2Zj729QFpoOiWidEW/VCDT8voHBH
         jxDK/jQdQR931Gtho8Pkfj5rIyYd6ufrLCWhhT4+vs5fR8+NwFW+9pMiNbZC/Q6SjrDL
         w5FjQ/7R40JyxnFFdGFyU22O5uoDRingZmFl5h1tpdezw4krmgxlCSXiRKHW9lLYFtx4
         UCA1R9XY8jqK6sSaxVqjTuK+/X65BUSOTsLDW5BeJotVAzhYsZTmxGjzLgAisDbSNHL/
         or2V4HQSqvsqPdGpPG0LA/194DorKaK0/KiYtIYr489zvi5mn727xV1En8UT1LHwYjQy
         tnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688092153; x=1690684153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dQd0P86COp0bcmR7smEeTkn348eGbmfJRWlqJ5l1hmA=;
        b=EiBtXz+6sB1EPEmEBrCpReQ9bfl2dfOGlfuwtJupJp9dA3wZ8FWdlN95++s/kTrz54
         M8n02ZwKukXCZvQgXsRCRXmTW3uhTOTclUq5JCCa82NJ1/8A8gEsHGWjPIMuLwB/zzua
         7k1XDjJ4PBaO8GZtLrsvLQgbzS3W8/rmHvdRIJdqV16TrJ+xXUdRlqlIDDNPBWryZhgD
         UxKE7Ve57Kbi8pJpYE6fG7u6dNQmEpeiyFKCr8glCEHsYF0LeUzL3RGahCsOE4fmhg4a
         89P9gLGHcEyfsLAnvIKbiTNCR8hm94sTXXEyG6Y81H3DEd5LXwEeaCxtWPCMVGxw3Hyv
         YQwA==
X-Gm-Message-State: AC+VfDxruPFdjp9rzV+rWondhgYcJ+RPYsJI9OM7akkpxEYecx11gGSm
	iaO+5XDT1mc+J+XxarKNK1cBrbgxHGPfVM707DdWmQ==
X-Google-Smtp-Source: ACHHUZ6+0xymYxronFJU1EdfEdb5/FkzMxAN5/QNVwdesib9LIxlmusiB4EdgA6zOz0x2/pgoegO1w==
X-Received: by 2002:a05:6808:199f:b0:3a1:e7ad:11a2 with SMTP id bj31-20020a056808199f00b003a1e7ad11a2mr1459324oib.18.1688092152635;
        Thu, 29 Jun 2023 19:29:12 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id g7-20020a62e307000000b0065016fffc81sm3132030pfh.216.2023.06.29.19.29.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 19:29:12 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 00/30] Patch review
Date: Thu, 29 Jun 2023 16:28:36 -1000
Message-Id: <cover.1688092011.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Jun 2023 02:29:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183640

Please review this set of changes for mickledore and comments back by
end of day Monday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/5547

The following changes since commit 4df0b835fae3af1dbde4a06568a652ce46d7af7a:

  maintainers.inc: update version for gcc-source (2023-06-27 12:12:05 -1000)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/mickledore-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/mickledore-nut

Alexander Kanavin (10):
  apr: upgrade 1.7.3 -> 1.7.4
  scripts/runqemu: split lock dir creation into a reusable function
  scripts/runqemu: allocate unfsd ports in a way that doesn't race or
    clash with unrelated processes
  qemu: a pending patch was submitted and accepted upstream
  maintainers.inc: unassign Adrian Bunk from wireless-regdb
  maintainers.inc: unassign Alistair Francis from opensbi
  maintainers.inc: unassign Chase Qi from libc-test
  maintainers.inc: unassign Oleksandr Kravchuk from python3 and all
    other items
  maintainers.inc: unassign Ricardo Neri from ovmf
  grub: submit determinism.patch upstream

Changqing Li (1):
  systemd: fix a dead link under /var/log

Charlie Wu (1):
  devtool: Fix the wrong variable in srcuri_entry

Fabien Mahot (2):
  useradd-example: package typo correction
  oeqa/selftest/bbtests: add non-existent prefile/postfile tests

Khem Raj (3):
  glibc: Pass linker choice via compiler flags
  babeltrace2: Always use BFD linker when building tests with ld-is-lld
    distro feature
  parted: Add missing libuuid to linker cmdline for
    libparted-fs-resize.so

Markus Volk (1):
  gtk4: upgrade 4.10.3 -> 4.10.4

Mikko Rapeli (1):
  useradd-staticids.bbclass: improve error message

Mingli Yu (1):
  python3-numpy: remove NPY_INLINE, use inline instead

Randolph Sapp (6):
  weston-init: make sure the render group exists
  weston-init: add weston user to the render group
  weston-init: add the weston user to the wayland group
  weston-init: fix the mixed indentation
  weston-init: guard against systemd configs
  weston-init: add profile to point users to global socket

Ross Burton (1):
  gobject-introspection: remove obsolete DEPENDS

Sakib Sajal (1):
  bno_plot.py, btt_plot.py: Ask for python3 specifically

Siddharth (1):
  tiff: Security fix for CVE-2023-25434 and CVE-2023-26965

Wang Mingyu (1):
  libxml2: upgrade 2.10.3 -> 2.10.4

 .../useradd/useradd-example.bb                |   2 +-
 meta/classes/useradd-staticids.bbclass        |   2 +-
 meta/conf/distro/include/maintainers.inc      |  44 ++---
 meta/lib/oeqa/selftest/cases/bbtests.py       |   8 +
 meta/recipes-bsp/grub/files/determinism.patch |   2 +-
 meta/recipes-core/glibc/glibc_2.37.bb         |   4 +-
 .../{libxml2_2.10.3.bb => libxml2_2.10.4.bb}  |   2 +-
 ...on-t-create-symlink-README-in-this-f.patch |  42 +++++
 meta/recipes-core/systemd/systemd_253.1.bb    |   1 +
 ....inc.src-Change-NPY_INLINE-to-inline.patch | 135 +++++++++++++++
 .../python/python3-numpy_1.24.2.bb            |   1 +
 ...lative-paths-for-line-preprocessor-d.patch |   2 +-
 ...o-linker-flags-for-libparted-fs-resi.patch |  34 ++++
 meta/recipes-extended/parted/parted_3.5.bb    |   1 +
 .../gobject-introspection_1.74.0.bb           |   2 +-
 .../gtk+/{gtk4_4.10.3.bb => gtk4_4.10.4.bb}   |   2 +-
 meta/recipes-graphics/wayland/weston-init.bb  |  46 ++---
 .../wayland/weston-init/weston-socket.sh      |  20 +++
 ...plot.py-Ask-for-python3-specifically.patch |  35 ++++
 meta/recipes-kernel/blktrace/blktrace_git.bb  |   4 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.5.bb |   1 +
 .../libtiff/files/CVE-2023-25434.patch        | 159 ++++++++++++++++++
 .../libtiff/files/CVE-2023-26965.patch        |  99 +++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.5.0.bb |   2 +
 .../apr/{apr_1.7.3.bb => apr_1.7.4.bb}        |   2 +-
 scripts/lib/devtool/standard.py               |   2 +-
 scripts/runqemu                               |  48 +++---
 27 files changed, 623 insertions(+), 79 deletions(-)
 rename meta/recipes-core/libxml/{libxml2_2.10.3.bb => libxml2_2.10.4.bb} (97%)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-legacy.conf.in-Don-t-create-symlink-README-in-this-f.patch
 create mode 100644 meta/recipes-devtools/python/python3-numpy/0001-simd.inc.src-Change-NPY_INLINE-to-inline.patch
 create mode 100644 meta/recipes-extended/parted/files/0001-fs-Add-libuuid-to-linker-flags-for-libparted-fs-resi.patch
 rename meta/recipes-gnome/gtk+/{gtk4_4.10.3.bb => gtk4_4.10.4.bb} (98%)
 create mode 100755 meta/recipes-graphics/wayland/weston-init/weston-socket.sh
 create mode 100644 meta/recipes-kernel/blktrace/blktrace/0001-bno_plot.py-btt_plot.py-Ask-for-python3-specifically.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-25434.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2023-26965.patch
 rename meta/recipes-support/apr/{apr_1.7.3.bb => apr_1.7.4.bb} (98%)

-- 
2.34.1


