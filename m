Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D9E0C54F65
	for <webhook@archiver.kernel.org>; Thu, 21 Apr 2022 16:46:08 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.8026.1650463710947798683
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Jhk5hzez;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id o5so2080279pjr.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Apr 2022 07:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=doOeY2oul7ymz6SsPN1U9NM3iKp1iQRsZDEZCiQQYQw=;
        b=Jhk5hzezOrF16CZrJKHe2+E/OXUOWS/kBMN92LFNHNaWz+8WqeB7ZVH7P0VXAy7qPO
         /XQg8+Lum7YvfI2ns2IQalJvF2mkmU6iWO5hO6n6pV4FYs/6d3aNIw9pi0oUGotqACvx
         9hNmt+cXDYmFl5L3jugGL64Po71Jswg2YlJevlMXlR4FfWriQrtXriFS/Q8jase5JFve
         69X9CuJ6ulKe93XVTxEqPjEgOmCiblAy/A0aC11UBQqRcewKZ6MKRsFJSn+pATrhoVCH
         DT5WZD8Cuf1pH4Y1ZZm1sx8HIn2D3FWLGYItiQ0LoIm1CvJFBNo2MfKuu0pG7CzK55qG
         bFfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=doOeY2oul7ymz6SsPN1U9NM3iKp1iQRsZDEZCiQQYQw=;
        b=zPlzX/pU5Wjda6XOzGcEzztPfOXJr35EmUlDXXPLwoELaiiT6Wu5wVgPWUCfRzLNNF
         bbsxNqD3EBWnJ5MFwC3HxhBTsGlKp0KrPAUL2k1cymGlHwOx3VB2tzEyCPNuzao2mZlc
         qviMaxqAzno8LkCNQ/q+KFLGjpw3uLk/lXl/vE72GgFSYNVzVuQZdtXfYjv/3vuMezw0
         v/EB5NjXh7eSly/aUp3H1N3pV4eMQudihxLfqJYRiOYAasxB9WBy9XajGaI+dCItVsoV
         dSw9/0iYZ4KLb0kpoAtoFybgabOxblG10Y2sBjhStqUZK0zhC5+7GksXieX6ox8igE+I
         5N1A==
X-Gm-Message-State: AOAM531P1o3RzAxktKSrkRFCTdZK+ye4D10gOHb8jS0EAH+Nhzzd1yij
	Sa5JiP2NaGBWrVKfvuTOxNxdPKB4fLTgbds2Deo=
X-Google-Smtp-Source: 
 ABdhPJzvNR0QGwS1rXi+OtV7mRKi9wIo0nZDSfC0jyynV6jpQEoCjeL+y4tHt/xMqrMhDHUjg5NOog==
X-Received: by 2002:a17:90b:3b8c:b0:1d4:c5e9:db89 with SMTP id
 pc12-20020a17090b3b8c00b001d4c5e9db89mr2203098pjb.178.1650463709441;
        Wed, 20 Apr 2022 07:08:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 96-20020a17090a09e900b001cb62ee05besm22941091pjo.55.2022.04.20.07.08.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 07:08:28 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/27] Patch review
Date: Wed, 20 Apr 2022 04:07:48 -1000
Message-Id: <cover.1650463004.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 21 Apr 2022 16:46:08 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164668

Please review this set of patches for kirkstone and have comments back by
end of day Friday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3547

The following changes since commit d2ba3b8850d461bc7b773240cdf15b22b31a3f9e:

  lua: fix CVE-2022-28805 (2022-04-19 14:02:08 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alexander Kanavin (1):
  webkitgtk: adjust patch status

Davide Gardenal (1):
  create-spdx: fix error when symlink cannot be created

Ferry Toth (2):
  apt: add apt selftest to test signed package feeds
  package_manager: fix missing dependency on gnupg when signing deb
    package feeds

Jon Mason (1):
  qemuarm64: use virtio pci interfaces

Kai Kang (1):
  update_udev_hwdb: fix multilib issue with systemd

Khem Raj (5):
  babeltrace: Disable warnings as errors
  xserver-xorg: Fix build with gcc12
  systemtap: Fix build with gcc-12
  gnupg: Disable FORTIFY_SOURCES on mips
  mdadm: Drop clang specific cflags

Konrad Weihmann (2):
  git: correct license
  ncurses: use COPYING file

Martin Jansa (1):
  systemd-boot: remove outdated EFI_LD comment

Paulo Neves (1):
  selftest/lic_checksum: Add test for filename containing space

Peter Kjellerstedt (2):
  u-boot: Correct the SRC_URI
  u-boot: Inherit pkgconfig

Richard Purdie (1):
  buildtools-tarball: Only add cert envvars if certs are included

Ross Burton (1):
  zlib: upgrade to 1.2.12

wangmy (5):
  linux-firmware: upgrade 20220310 -> 20220411
  libsoup: upgrade 3.0.5 -> 3.0.6
  apt: upgrade 2.4.3 -> 2.4.4
  libusb1: upgrade 1.0.25 -> 1.0.26
  libgit2: upgrade 1.4.2 -> 1.4.3

zhengruoqin (3):
  wireless-regdb: upgrade 2022.02.18 -> 2022.04.08
  git: upgrade 2.35.2 -> 2.35.3
  ruby: upgrade 3.1.1 -> 3.1.2

 meta/classes/create-spdx.bbclass              |  10 +-
 meta/classes/sign_package_feed.bbclass        |   1 +
 meta/conf/machine/qemuarm64.conf              |   8 +-
 meta/lib/oeqa/runtime/cases/apt.py            |  38 +-
 meta/lib/oeqa/selftest/cases/lic_checksum.py  |  18 +
 meta/lib/oeqa/selftest/cases/runtime_test.py  |  38 ++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |   6 +-
 meta/recipes-core/meta/buildtools-tarball.bb  |   6 +-
 meta/recipes-core/ncurses/ncurses.inc         |   2 +-
 .../systemd/systemd-boot_250.4.bb             |   1 -
 meta/recipes-core/systemd/systemd_250.4.bb    |   5 -
 meta/recipes-core/udev/eudev_3.2.10.bb        |   4 -
 ...configure-Pass-LDFLAGS-to-link-tests.patch |  25 +-
 .../zlib/zlib/CVE-2018-25032.patch            | 347 ------------------
 meta/recipes-core/zlib/zlib/cc.patch          |  27 ++
 .../zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb}   |   7 +-
 .../apt/{apt_2.4.3.bb => apt_2.4.4.bb}        |   2 +-
 .../git/{git_2.35.2.bb => git_2.35.3.bb}      |  15 +-
 .../ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb}     |   2 +-
 meta/recipes-extended/mdadm/mdadm_4.2.bb      |   2 -
 .../0001-render-Fix-build-with-gcc-12.patch   |  90 +++++
 .../xorg-xserver/xserver-xorg_21.1.3.bb       |   1 +
 ...20220310.bb => linux-firmware_20220411.bb} |   4 +-
 .../recipes-kernel/lttng/babeltrace2_2.0.4.bb |   2 +-
 ...ility-re-tweak-for-rhel6-use-functio.patch |  49 +++
 .../recipes-kernel/systemtap/systemtap_git.bb |   3 +-
 ....02.18.bb => wireless-regdb_2022.04.08.bb} |   2 +-
 ...spection.cmake-prefix-variables-obta.patch |   5 +-
 meta/recipes-support/gnupg/gnupg_2.3.4.bb     |   3 +
 .../{libgit2_1.4.2.bb => libgit2_1.4.3.bb}    |   2 +-
 .../{libsoup_3.0.5.bb => libsoup_3.0.6.bb}    |   2 +-
 .../{libusb1_1.0.25.bb => libusb1_1.0.26.bb}  |   2 +-
 scripts/postinst-intercepts/update_udev_hwdb  |   5 +-
 33 files changed, 322 insertions(+), 412 deletions(-)
 delete mode 100644 meta/recipes-core/zlib/zlib/CVE-2018-25032.patch
 create mode 100644 meta/recipes-core/zlib/zlib/cc.patch
 rename meta/recipes-core/zlib/{zlib_1.2.11.bb => zlib_1.2.12.bb} (83%)
 rename meta/recipes-devtools/apt/{apt_2.4.3.bb => apt_2.4.4.bb} (97%)
 rename meta/recipes-devtools/git/{git_2.35.2.bb => git_2.35.3.bb} (86%)
 rename meta/recipes-devtools/ruby/{ruby_3.1.1.bb => ruby_3.1.2.bb} (97%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-render-Fix-build-with-gcc-12.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20220310.bb => linux-firmware_20220411.bb} (99%)
 create mode 100644 meta/recipes-kernel/systemtap/systemtap/0001-gcc12-c-compatibility-re-tweak-for-rhel6-use-functio.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2022.02.18.bb => wireless-regdb_2022.04.08.bb} (94%)
 rename meta/recipes-support/libgit2/{libgit2_1.4.2.bb => libgit2_1.4.3.bb} (91%)
 rename meta/recipes-support/libsoup/{libsoup_3.0.5.bb => libsoup_3.0.6.bb} (94%)
 rename meta/recipes-support/libusb/{libusb1_1.0.25.bb => libusb1_1.0.26.bb} (94%)

-- 
2.25.1


