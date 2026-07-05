Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34546C44501
	for <webhook@archiver.kernel.org>; Sun,  5 Jul 2026 22:42:46 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.139204.1783291362796790354
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Jul 2026 15:42:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=SSIeNwvQ;
 spf=pass (domain: smile.fr, ip: 209.85.128.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-490cf3000f0so23871195e9.1
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783291361; x=1783896161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f9B45MqJ9gFRJqqgqOcA25QivJteALey21QE+Bixj7E=;
        b=SSIeNwvQ/nrskQqSDzYzvPgG8OdlcX2jbuMS2mO0Q/HZ2UGr893c2X3osDPX9SmQx8
         t+A+qsxZS1liM3IlDgUXfEuaz9VXCVMtlbheoKHQN3Q3F4d0b9Wpu2KGNitEuYrntTDt
         zdiGMCRG4n2dpuFqFwi2HWN5o3tkZnMJ+kHOc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783291361; x=1783896161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f9B45MqJ9gFRJqqgqOcA25QivJteALey21QE+Bixj7E=;
        b=WHo2JYGqb4RNV2RSwd6PBhpH6TRQJMopZzHvLsbvtGSSGGGU59gSrJmYfusoAkrkzC
         qIqdOM3jD8qQd1KHFRFcUkZ0iE75nm/Cbyu+bxG/8lHcmkjefj711y4uKNWmpiULgY9A
         8AkIi7ZlWv9pI6SxmDaZAwsatu+QHuWWeAT5DZr+9b6+Ra63cw2l0zKYHcbWUSHeptYd
         NtBGY/bw/VMP9g4vnV9mUv2LlUapeVOI2Izlj3sH5UKQRnhKWv+YbaJsu4q1a6Ejw6RJ
         0rQurA9cYy582X6dFzWkXUAj+deUIC+smnMA0vu9HgRBVPN3D0HAuq/9q34+GzPzbhcu
         8/WQ==
X-Gm-Message-State: AOJu0Yz0u+8AoT6xnk1O7LEwLpXzvryf0//KhWCcCMJKXJc4ZzRgeO+C
	57bkblva0TMJlxIfM2zpfkv6hoPWD1NzmvQn3OcgS9+EM4VlbsBbXreucI+9AkVmNwhrr5zYZmx
	1tSgLG4U=
X-Gm-Gg: AfdE7cleKrgEHfrun1CD3reYMEQ5lj6MB8bwAPgGXSGMMoryUdZhl/eDb/GJGYlB+Es
	mavASgqPKHfbQDGh7+B4R0mt0YDq+lnMYftuKn3hXf0+w/xez/5mF42lE2gfd8FKi2O4cOZY/ij
	e8UEnzznTTzWIEZ0zG/u6h2ocFiKclLpXwN2PYku1RSqsggM9jsqYyFUGlLrBaozgMWRmaXg17y
	PH18LoXQvupF1OVD5OzXV7pGHpb9wQdu9B8UEcIlDGBRM6qirE2YQ4eTrBTyKWh+38KMLBn0urz
	EI7r96tjjQAzVKVW3uFPlj7ewZRmLEoxUC1DLKKp7/1Sn0GEM+zEwJDcBudTaUNI56HbxDEZd+u
	FmbrunCiQgo84XIS70gfI6a1su29hHZmAiqZfDmF+/k/IoquQ+5VV/O4d7k0tef7b++JhHMvFEM
	J68EjdfKUUuLZX70S1q1q8ZCGYMQ==
X-Received: by 2002:a05:600c:1908:b0:493:be3e:cc3 with SMTP id 5b1f17b1804b1-493d11f03fcmr93678495e9.21.1783291360581;
        Sun, 05 Jul 2026 15:42:40 -0700 (PDT)
Received: from FRSMI25-LASER.lan ([2001:861:8010:5750:6d3a:72ff:5857:d2a8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0960af0sm17943606f8f.30.2026.07.05.15.42.39
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 15:42:40 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 00/55] Patch review
Date: Mon,  6 Jul 2026 00:40:50 +0200
Message-ID: <cover.1783289522.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Jul 2026 22:42:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240154

Please review this set of changes for wrynose and have comments back by
end of day Tuesday, July 7. Since this is a relatively big series, if
you plan to review it but need more time to do so, ping me and I'll
delay the pull-request.

Notable changes:
* kernel upgrade -> v6.18.35 cherry-picked from master
* clang/llvm upgrade -> 22.1.18 (following master)
* Licensing fixes

A previous version of the series, with 4 more patches that I removed and
should not change test outcome, passed a-full on autobuilder:
https://autobuilder.yoctoproject.org/valkyrie/#/builders/29/builds/4151
* oe-selftest-armhost failed with Bug 16236 - AB-INT: test_list_pkg_files: ResourceWarning: unclosed transport
  retried as https://autobuilder.yoctoproject.org/valkyrie/#/builders/23/builds/4280

I've started a new build with this version of the series:
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/29/builds/4156

The following changes since commit 5d1aa5c806c061a2994f4decb59016610f093213:

  build-appliance-image: Update to wrynose head revisions (2026-06-24 14:17:46 +0100)

are available in the Git repository at:

  https://git.openembedded.org/openembedded-core-contrib stable/wrynose-nut
  https://git.openembedded.org/openembedded-core-contrib/log/?h=stable/wrynose-nut

for you to fetch changes up to 728e70d7c681402d8e797691825bfd9929aa79cb:

  clang/llvm: Upgrade to 22.1.8 release (2026-07-06 00:04:52 +0200)

----------------------------------------------------------------

Alexander Kanavin (1):
  strace: remove skip-bpf.patch

Anil Dongare (4):
  cargo: Fix CVE-2026-5222
  cargo: Fix CVE-2026-5223
  cups: fix CVE-2026-27447
  cups: fix CVE-2026-41079

Anton Skorup (1):
  libxml2: patch CVE-2026-11979

Ashishkumar Parmar (3):
  qemu: Fix CVE-2026-2243
  qemu: Fix CVE-2026-0665
  qemu: Fix CVE-2025-14876

Bruce Ashfield (8):
  linux-yocto/6.18: update to v6.18.25
  linux-yocto/6.18: update to v6.18.26
  linux-yocto/6.18: update to v6.18.28
  linux-yocto/6.18: update to v6.18.32
  linux-yocto/6.18: qat/intel configuration warning fixes
  linux-yocto/6.18: update to v6.18.33
  linux-yocto/6.18: update to v6.18.34
  linux-yocto/6.18: update to v6.18.35

Daniel Turull (3):
  libssh2: fix CVE-2026-55200
  libssh2: fix CVE-2026-55199
  bc: set CVE_PRODUCT

Deepesh Varatharajan (1):
  clang/llvm: Upgrade to 22.1.8 release

Hiago De Franco (1):
  nospdx: also drop do_create_recipe_sbom

Himanshu Jadon (1):
  tar: Fix CVE-2026-5704

Hitendra Prajapati (2):
  vim: fix for CVE-2026-41411 & CVE-2026-44656
  vim: fix for CVE-2026-45130 & CVE-2026-46483

Jaipaul Cheernam (2):
  binutils: Fix CVE-2026-6846
  cmake-native: prevent host libidn2 contamination

Jinwang Li (1):
  bluez5: fix set volume failure

João Marcos Costa (1):
  ptest-packagelists.inc: disable glib-2.0 for RISCV64

Khem Raj (1):
  baremetal-helloworld: Fix override order

Kris Gavvala (1):
  python3: skiptest tracemalloc_track_race

Mengshi Wu (1):
  bluez5: fix gatt cache sync issue

Nate Kent (1):
  sudo: fix pam-wheel sed for sudo 1.9.17p2 sudoers

Otavio Salvador (1):
  quota: use native rpcgen and a single-word RPCGEN_CPP

Peter Kjellerstedt (1):
  common-licenses/PHP-3.0: Correct the license text

Richard Purdie (3):
  libxpm: upgrade 3.5.18 -> 3.5.19
  python3-click: Fixes for new pytest and flaky ptest
  sstate: Reduce native sysroot execution race potential

Roland Kovacs (1):
  gnupg: fix CVE-2026-57062

Ross Burton (2):
  tcl: disable the timer tests in run-ptest
  libjitterentropy: fix license statement

Sai Sneha (1):
  i2c-tools: add LGPL-2.1-or-later license for libi2c

Shubham Pushpkar (1):
  libsolv: Fix CVE-2026-9149

Siva Balasubramanian (1):
  qemuboot.bbclass: add missing task dependency on kernel deploy

Theo Gaige (Schneider Electric) (5):
  dhcpcd: patch CVE-2026-56113
  dhcpcd: patch CVE-2026-56114
  dhcpcd: patch CVE-2026-56116
  dhcpcd: patch CVE-2026-56117
  perl: patch CVE-2026-8376

Walter Werner Schneider (1):
  devtool: provide explicit error for missing "script" command

Wei Deng (1):
  bluez5: set L2CAP IMTU for OBEX profile listeners

Wei Gao (1):
  dmidecode: fix x86-only tools being installed on ARM targets

Xiaozhan Li (1):
  texinfo: add missing perl module runtime dependencies

Xiuzhuo Shang (1):
  bluez5: Fix sending extra bytes with MGMT_OP_ADD_EXT_ADV_DATA

Yoann Congal (1):
  dropbear: Add missing WTFPL & Unlicense in LICENSE and
    LIC_FILES_CHKSUM

 meta/classes-global/sstate.bbclass            |   4 +
 meta/classes-recipe/nospdx.bbclass            |   1 +
 meta/classes-recipe/qemuboot.bbclass          |   1 +
 meta/conf/distro/include/maintainers.inc      |   2 +-
 .../distro/include/ptest-packagelists.inc     |   4 +-
 meta/files/common-licenses/PHP-3.0            |  76 +--
 meta/recipes-connectivity/bluez5/bluez5.inc   |   4 +
 ...sending-extra-bytes-with-MGMT_OP_ADD.patch |  33 ++
 ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++
 ...x-stored-gatt-cache-DB-Hash-value-no.patch |  84 +++
 ...t-volume-failure-with-invalid-device.patch |  46 ++
 .../dhcpcd/dhcpcd_10.3.1.bb                   |   4 +
 .../dhcpcd/files/CVE-2026-56113.patch         |  92 +++
 .../dhcpcd/files/CVE-2026-56114.patch         |  34 ++
 .../dhcpcd/files/CVE-2026-56116.patch         |  31 +
 .../dhcpcd/files/CVE-2026-56117.patch         | 167 ++++++
 .../recipes-core/dropbear/dropbear_2025.89.bb |   8 +-
 .../libxml/libxml2/CVE-2026-11979.patch       |  81 +++
 meta/recipes-core/libxml/libxml2_2.15.2.bb    |   1 +
 .../meta/nativesdk-buildtools-perl-dummy.bb   |   2 +
 .../binutils/binutils-2.46.inc                |   1 +
 .../binutils/binutils/CVE-2026-6846.patch     |  59 ++
 meta/recipes-devtools/clang/common-clang.inc  |   2 +-
 meta/recipes-devtools/clang/common.inc        |   2 +-
 .../cmake/cmake-native_4.3.1.bb               |   1 +
 .../dmidecode/dmidecode_3.7.bb                |   1 +
 .../i2c-tools/i2c-tools_4.4.bb                |   5 +-
 .../perl/files/CVE-2026-8376-01.patch         |  62 ++
 .../perl/files/CVE-2026-8376-02.patch         |  49 ++
 meta/recipes-devtools/perl/perl_5.42.0.bb     |   2 +
 ...7494c991c9197902fdf4995e11b2da3e9762.patch | 173 ++++++
 .../python/python3-click/pytest-fix.patch     |  29 +
 .../python/python3-click_8.3.1.bb             |   1 +
 .../recipes-devtools/python/python3_3.14.5.bb |   7 +
 meta/recipes-devtools/qemu/qemu.inc           |   4 +
 .../qemu/qemu/CVE-2025-14876_p1.patch         |  52 ++
 .../qemu/qemu/CVE-2025-14876_p2.patch         |  56 ++
 .../qemu/qemu/CVE-2026-0665.patch             |  38 ++
 .../qemu/qemu/CVE-2026-2243.patch             |  45 ++
 .../rust/files/CVE-2026-5222.patch            |  92 +++
 .../rust/files/CVE-2026-5223.patch            | 125 ++++
 meta/recipes-devtools/rust/rust-source.inc    |   2 +
 .../strace/strace/skip-bpf.patch              |  25 -
 meta/recipes-devtools/strace/strace_6.19.bb   |   1 -
 meta/recipes-devtools/tcltk/tcl/run-ptest     |   2 +
 meta/recipes-devtools/tcltk8/tcl8/run-ptest   |   2 +
 .../baremetal-helloworld_git.bb               |   2 +-
 meta/recipes-extended/bc/bc_1.08.2.bb         |   3 +
 meta/recipes-extended/cups/cups.inc           |   4 +
 .../cups/CVE-2026-27447-regression_p1.patch   |  46 ++
 .../cups/CVE-2026-27447-regression_p2.patch   |  58 ++
 .../cups/cups/CVE-2026-27447.patch            | 120 ++++
 .../cups/cups/CVE-2026-41079.patch            |  73 +++
 .../libsolv/libsolv/CVE-2026-9149.patch       | 152 +++++
 .../libsolv/libsolv_0.7.36.bb                 |   1 +
 meta/recipes-extended/quota/quota_4.11.bb     |   6 +-
 meta/recipes-extended/sudo/sudo_1.9.17p2.bb   |   2 +-
 .../tar/tar/CVE-2026-5704-dependent_p1.patch  | 484 +++++++++++++++
 .../tar/tar/CVE-2026-5704-dependent_p2.patch  | 169 ++++++
 .../tar/tar/CVE-2026-5704-regression.patch    | 176 ++++++
 .../tar/tar/CVE-2026-5704.patch               | 556 ++++++++++++++++++
 meta/recipes-extended/tar/tar_1.35.bb         |   4 +
 meta/recipes-extended/texinfo/texinfo_7.3.bb  |   4 +
 .../{libxpm_3.5.18.bb => libxpm_3.5.19.bb}    |   2 +-
 .../linux/linux-yocto-rt_6.18.bb              |   6 +-
 .../linux/linux-yocto-tiny_6.18.bb            |   6 +-
 meta/recipes-kernel/linux/linux-yocto_6.18.bb |  24 +-
 .../gnupg/gnupg/CVE-2026-57062.patch          |  43 ++
 meta/recipes-support/gnupg/gnupg_2.5.17.bb    |   1 +
 .../libjitterentropy_3.6.3.bb                 |   3 +-
 .../libssh2/libssh2/CVE-2026-55199.patch      |  44 ++
 .../libssh2/libssh2/CVE-2026-55200.patch      |  36 ++
 .../recipes-support/libssh2/libssh2_1.11.1.bb |   2 +
 .../vim/files/CVE-2026-41411.patch            |  75 +++
 .../vim/files/CVE-2026-44656.patch            | 124 ++++
 .../vim/files/CVE-2026-45130.patch            | 115 ++++
 .../vim/files/CVE-2026-46483.patch            |  77 +++
 meta/recipes-support/vim/vim.inc              |   4 +
 scripts/lib/devtool/__init__.py               |   3 +
 79 files changed, 3938 insertions(+), 118 deletions(-)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-transport-Fix-set-volume-failure-with-invalid-device.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56113.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56114.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56116.patch
 create mode 100644 meta/recipes-connectivity/dhcpcd/files/CVE-2026-56117.patch
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-11979.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils/CVE-2026-6846.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-01.patch
 create mode 100644 meta/recipes-devtools/perl/files/CVE-2026-8376-02.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/ffcc7494c991c9197902fdf4995e11b2da3e9762.patch
 create mode 100644 meta/recipes-devtools/python/python3-click/pytest-fix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p1.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2025-14876_p2.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-0665.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2026-2243.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5222.patch
 create mode 100644 meta/recipes-devtools/rust/files/CVE-2026-5223.patch
 delete mode 100644 meta/recipes-devtools/strace/strace/skip-bpf.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p1.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447-regression_p2.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-27447.patch
 create mode 100644 meta/recipes-extended/cups/cups/CVE-2026-41079.patch
 create mode 100644 meta/recipes-extended/libsolv/libsolv/CVE-2026-9149.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p1.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-dependent_p2.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704-regression.patch
 create mode 100644 meta/recipes-extended/tar/tar/CVE-2026-5704.patch
 rename meta/recipes-graphics/xorg-lib/{libxpm_3.5.18.bb => libxpm_3.5.19.bb} (88%)
 create mode 100644 meta/recipes-support/gnupg/gnupg/CVE-2026-57062.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55199.patch
 create mode 100644 meta/recipes-support/libssh2/libssh2/CVE-2026-55200.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-41411.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-44656.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-45130.patch
 create mode 100644 meta/recipes-support/vim/files/CVE-2026-46483.patch


