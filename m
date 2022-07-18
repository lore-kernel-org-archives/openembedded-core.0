Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91C6C433EF
	for <webhook@archiver.kernel.org>; Mon, 18 Jul 2022 14:49:22 +0000 (UTC)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com
 [209.85.210.179])
 by mx.groups.io with SMTP id smtpd.web11.28044.1658155756610267343
 for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=PV2q/pWE;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.179,
 mailfrom: steve@sakoman.com)
Received: by mail-pf1-f179.google.com with SMTP id d10so10813707pfd.9
        for <openembedded-core@lists.openembedded.org>;
 Mon, 18 Jul 2022 07:49:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qn9Qd/HCUFdS5IO6BwRr/MXcX7jJdczEuAauapRDJdU=;
        b=PV2q/pWEuukiD0N5LvmGrqF8kIG4/0FoJkbWr5FlfgCFGRkH1qU9BhlTdKoc03kSDC
         w/o22e/FKdZS2OUneMirQhBgOQxPEz+EQfddGWzp38PxpFuo1A5LAPUcqrh6tDe5fIYA
         mzB3DZb2kie4TEHPbdhtsucwL66aJs2DKI7mp9zDQxjLlIpMCdIqIG25zuGgxvsIpcob
         ZierReRE6YZ5L81Hnhg+l63SbVJbefzNW4gGiu+Vi27DAVpdyB0TSePvWox9uNmSxM9J
         GeaEMaqUaI8kN2deOSXiQ9ULTYWqznOXuZU4nio6fY92M5kU+UNK0MyCGaR1zzvu9KNq
         mVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Qn9Qd/HCUFdS5IO6BwRr/MXcX7jJdczEuAauapRDJdU=;
        b=8EncN7KsVPSM4bygqBG35t//LGfYq0Cey7Alb/YA6a+ZZxCXPTwQMNr7vNma7yWMBS
         XGnDFDczd8+M5VlNaO+nVMJ4RvvruWdr4ZSoJ7Xaw1+xC/c+XnAx+5xqfytDrd+H1MM5
         DHXdmVOm441xwjFdPbbt2h13UD232s5+vDgKlxRwu15FycnHTNDbRY/OkbC63J9bv7x1
         aJKFljszm+SqLCr2ny+yFt+IOfgc+kCKyv9gVRj8BTV5U16x8mzla8ek3aXYEWdU9GyG
         F5c16hOUZqG76QBJ7vhlLSpBET50aJIddczxJswQDIMNw/8tjL9RpqMw55PASbHVNIbl
         4SJw==
X-Gm-Message-State: AJIora/fJytNh+HVv2KgyCLa8eWh3InJfDK1wpX4ObpYzx6q8o6ZCzjP
	QAK6Z7+ooIfSiwiS1i2aiKjXzInLHVOs38X6
X-Google-Smtp-Source: 
 AGRyM1tcsbPsZduF88WSQ08Z/HU6xKB3gg6UhJnexbZO9B8r5eQZOlt6kNDDEuUV+IZced51qfODoQ==
X-Received: by 2002:a05:6a00:2407:b0:52b:29dd:915 with SMTP id
 z7-20020a056a00240700b0052b29dd0915mr21547185pfh.60.1658155755241;
        Mon, 18 Jul 2022 07:49:15 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 ij8-20020a170902ab4800b0016c066e566bsm9551517plb.164.2022.07.18.07.49.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 07:49:14 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 00/35] Patch review
Date: Mon, 18 Jul 2022 04:48:25 -1000
Message-Id: <cover.1658155579.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 18 Jul 2022 14:49:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168200

Please review this set of patches for kirkstone and have comments back by
end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3928

The following changes since commit 171415e38e526033a0423f4dc39e9d8e9dc4e5f6:

  perf: fix reproducibility in 5.19+ (2022-07-16 08:20:22 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/kirkstone-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/kirkstone-nut

Alejandro Hernandez Samaniego (2):
  package.bbclass: Fix base directory for debugsource files when using
    externalsrc
  package.bbclass: Fix kernel source handling when not using externalsrc

Alexander Kanavin (1):
  waffle: correctly request wayland-scanner executable

Chanho Park (2):
  cargo_common.bbclass: enable bitbake vendoring for externalsrc
  externalsrc.bbclass: support crate fetcher on externalsrc

Christoph Lauer (1):
  package.bbclass: Avoid stripping signed kernel modules in
    splitdebuginfo

Khem Raj (1):
  libmodule-build-perl: Use env utility to find perl interpreter

Markus Volk (1):
  python3: Backport patch to fix an issue in subinterpreters

Ming Liu (3):
  udev-extraconf: let automount base directory configurable
  udev-extraconf: fix some systemd automount issues
  udev-extraconf:mount.sh: fix path mismatching issues

Muhammad Hamza (5):
  udev-extraconf/mount.sh: add LABELs to mountpoints
  udev-extraconf/mount.sh: save mount name in our tmp filecache
  udev-extraconf/mount.sh: only mount devices on hotplug
  udev-extraconf: force systemd-udevd to use shared MountFlags
  udev-extraconf/mount.sh: ignore lvm in automount

Pascal Bach (1):
  bin_package: install into base_prefix

Paul Eggleton (4):
  devtool: ignore pn- overrides when determining SRC_URI overrides
  patch: handle if S points to a subdirectory of a git repo
  devtool: finish: handle patching when S points to subdir of a git repo
  oe-selftest: devtool: test modify git recipe building from a subdir

Pavel Zhukov (1):
  harfbuzz: Fix compilation with clang

Peter Marko (1):
  alsa-state: correct license

Richard Purdie (9):
  udev-extraconf/initrdscripts/parted: Rename mount.blacklist ->
    mount.ignorelist
  insane: Fix buildpaths test to work with special devices
  lua: Fix multilib buildpath reproducibility issues
  vala: Fix on target wrapper buildpaths issue
  gtk-doc: Remove hardcoded buildpath
  kernel-arch: Fix buildpaths leaking into external module compiles
  gcc-runtime: Fix build when using gold
  gcc-runtime: Fix missing MLPREFIX in debug mappings
  selftest/runtime_test/virgl: Disable for all almalinux

Robert Joslyn (1):
  curl: Fix multiple CVEs

Ross Burton (2):
  perl: don't install Makefile.old into perl-ptest
  pulseaudio: add m4-native to DEPENDS

 meta/classes/bin_package.bbclass              |   3 +-
 meta/classes/cargo_common.bbclass             |   2 +-
 meta/classes/externalsrc.bbclass              |   2 +-
 meta/classes/insane.bbclass                   |   6 +-
 meta/classes/kernel-arch.bbclass              |   2 +-
 meta/classes/package.bbclass                  |  36 ++-
 meta/lib/oe/patch.py                          |   8 +-
 meta/lib/oe/recipeutils.py                    |   9 +-
 meta/lib/oeqa/selftest/cases/devtool.py       | 114 +++++--
 meta/lib/oeqa/selftest/cases/runtime_test.py  |   2 +-
 meta/recipes-bsp/alsa-state/alsa-state.bb     |   7 +-
 .../alsa-state/alsa-state/alsa-state-init     |   3 +-
 .../files/init-install-efi-testfs.sh          |   2 +-
 .../initrdscripts/files/init-install-efi.sh   |   2 +-
 .../files/init-install-testfs.sh              |   2 +-
 .../initrdscripts/files/init-install.sh       |   2 +-
 .../{mount.blacklist => mount.ignorelist}     |   0
 .../recipes-core/udev/udev-extraconf/mount.sh |  90 ++++--
 meta/recipes-core/udev/udev-extraconf_1.1.bb  |  27 +-
 meta/recipes-devtools/gcc/gcc-runtime.inc     |   5 +-
 meta/recipes-devtools/lua/lua/lua.pc.in       |   5 +-
 meta/recipes-devtools/lua/lua_5.4.4.bb        |   2 +-
 .../perl/libmodule-build-perl_0.4231.bb       |   1 +
 meta/recipes-devtools/perl/perl-ptest.inc     |   4 +-
 ...h-92036-Fix-gc_fini_untrack-GH-92037.patch |  54 ++++
 .../recipes-devtools/python/python3_3.10.4.bb |   1 +
 meta/recipes-devtools/vala/vala.inc           |   6 +
 meta/recipes-extended/parted/files/run-ptest  |   6 +-
 meta/recipes-gnome/gtk-doc/gtk-doc_1.33.2.bb  |   2 +
 .../harfbuzz/0001-Fix-conditional.patch       |  25 ++
 .../harfbuzz/harfbuzz_4.0.1.bb                |   5 +-
 ...build-request-native-wayland-scanner.patch |  27 ++
 meta/recipes-graphics/waffle/waffle_1.7.0.bb  |   1 +
 .../pulseaudio/pulseaudio.inc                 |   2 +-
 .../curl/curl/CVE-2022-32205.patch            | 174 +++++++++++
 .../curl/curl/CVE-2022-32206.patch            |  51 ++++
 .../curl/curl/CVE-2022-32207.patch            | 283 ++++++++++++++++++
 .../curl/curl/CVE-2022-32208.patch            |  67 +++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   4 +
 scripts/lib/devtool/standard.py               |  29 +-
 40 files changed, 982 insertions(+), 91 deletions(-)
 rename meta/recipes-core/udev/udev-extraconf/{mount.blacklist => mount.ignorelist} (100%)
 create mode 100644 meta/recipes-devtools/python/python3/0001-gh-92036-Fix-gc_fini_untrack-GH-92037.patch
 create mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz/0001-Fix-conditional.patch
 create mode 100644 meta/recipes-graphics/waffle/waffle/0001-meson.build-request-native-wayland-scanner.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32205.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32206.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32207.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2022-32208.patch

-- 
2.25.1


