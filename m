Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by mx.groups.io with SMTP id smtpd.web09.6915.1620370974286995955
 for <openembedded-core@lists.openembedded.org>;
 Fri, 07 May 2021 00:02:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.20, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: for7t+xYdzWStWc9WZieq5tm4SS3xcHeMycv7+dcDtran+6KfqCKkzJvbdbyWAq4tUlpS2zBfp
 Tl51DEvAybWQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9976"; a="185794647"
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="185794647"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:51 -0700
IronPort-SDR: IQe3K/ghdE3CzcjSgXzc1BZk8slqJ1Of+REFVOJ3Du3k2Ls5xbYTo0VhU5mQBdh3rK+/n/rVZg
 cX4EbNl4tz/Q==
X-IronPort-AV: E=Sophos;i="5.82,279,1613462400"; 
   d="scan'208";a="407331529"
Received: from sthum-mobl6.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.243.238])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2021 00:02:50 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/31] review request
Date: Fri,  7 May 2021 15:02:12 +0800
Message-Id: <cover.1620370571.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Please review these changes for hardknott. Builds cleanly on autobuilder
except for a reproducibility failure for lsb-release.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2126

I have sent a patch to fix the reproducibility issue and will include it
in hardknott after it has been merged in master.

Thanks,

Anuj

The following changes since commit 940111cefa459bc7a5fd9de1cf70b2040ffb5229:

  rsync: fix CVE-2020-14387 (2021-04-26 11:41:25 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (2):
  Revert "oeqa: Set LD_LIBRARY_PATH when executing native commands"
  diffoscope: add native libraries to LD_LIBRARY_PATH

Anuj Mittal (1):
  qemu: fix CVE-2021-3392

Bruce Ashfield (8):
  linux-yocto/5.10: aufs fixes
  linux-yocto/5.10: qemuriscv32.cfg: RV32 only supports 1G physical
    memory
  linux-yocto/5.10: update to v5.10.32
  perf: fix python-audit RDEPENDS
  linux-yocto/5.4: update to v5.4.114
  linux-yocto/5.10: update to v5.10.34
  linux-yocto/5.4: update to v5.4.116
  linux-yocto/5.10: qemuppc32: reduce serial shutdown issues

Christophe Chapuis (1):
  rootfs.py: find .ko.gz and .ko.xz kernel modules as well

Jose Quaresma (1):
  ptest-runner: libgcc must be installed for pthread_cancel to work

Joshua Watt (1):
  classes/image: Use xargs to set file timestamps

Khem Raj (3):
  libjpeg-turbo: Use --reproducible option for nasm
  busybox: Fix reproducibility
  webkitgtk: Fix reproducibility in minibrowser

Reto Schneider (2):
  license_image.bbclass: Detect broken symlinks
  license_image.bbclass: Fix symlink to generic license files

Richard Purdie (5):
  patchelf: Fix note section alignment issues
  patchelf: Fix alignment patch
  pybootchart/draw: Avoid divide by zero error
  yocto-uninative: Update to 3.1 which includes a patchelf fix
  lib/package_manager: Use shutil.copy instead of bb.utils.copyfile for
    intercepts

Ross Burton (1):
  oe-buildenv-internal: add BitBake's library to PYTHONPATH

Sakib Sajal (2):
  qemu: fix CVE-2020-27821
  qemu: fix CVE-2021-20263

Stefan Ghinea (1):
  xserver-xorg: fix CVE-2021-3472

Yi Fan Yu (1):
  libevent: Increase ptest timing tolerance 50 ms -> 100 ms

wangmy (1):
  mesa: upgrade 21.0.2 -> 21.0.3

zhengruoqin (1):
  wireless-regdb: upgrade 2020.11.20 -> 2021.04.21

 meta/classes/image.bbclass                    |   2 +-
 meta/classes/license_image.bbclass            |  20 +-
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oe/package_manager/__init__.py       |   2 +-
 meta/lib/oe/rootfs.py                         |   2 +-
 meta/lib/oeqa/utils/commands.py               |   3 -
 ...Use-C-locale-when-calling-sed-on-glo.patch |  28 +++
 meta/recipes-core/busybox/busybox_1.33.0.bb   |   1 +
 .../patchelf/patchelf/alignmentfix.patch      |  44 ++++
 .../patchelf/patchelf_0.12.bb                 |   1 +
 meta/recipes-devtools/qemu/qemu.inc           |   3 +
 .../qemu/qemu/CVE-2020-27821.patch            | 143 ++++++++++++
 .../qemu/qemu/CVE-2021-20263.patch            | 214 ++++++++++++++++++
 .../qemu/qemu/CVE-2021-3392.patch             |  89 ++++++++
 .../jpeg/libjpeg-turbo_2.0.6.bb               |   2 +-
 .../{mesa-gl_21.0.2.bb => mesa-gl_21.0.3.bb}  |   0
 meta/recipes-graphics/mesa/mesa.inc           |   2 +-
 .../mesa/{mesa_21.0.2.bb => mesa_21.0.3.bb}   |   0
 .../xserver-xorg/CVE-2021-3472.patch          |  43 ++++
 .../xorg-xserver/xserver-xorg_1.20.10.bb      |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 meta/recipes-kernel/perf/perf.bb              |   2 +-
 ....11.20.bb => wireless-regdb_2021.04.21.bb} |   2 +-
 .../0001-MiniBrowser-Fix-reproduciblity.patch |  31 +++
 meta/recipes-sato/webkit/webkitgtk_2.30.5.bb  |   1 +
 .../diffoscope/diffoscope_172.bb              |   1 +
 ...ncrease-default-timeval-tolerance-50.patch |  33 +++
 .../libevent/libevent_2.1.12.bb               |   1 +
 .../ptest-runner/ptest-runner_2.4.1.bb        |   2 +
 scripts/oe-buildenv-internal                  |   4 +
 scripts/pybootchartgui/pybootchartgui/draw.py |   2 +-
 36 files changed, 705 insertions(+), 56 deletions(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch
 create mode 100644 meta/recipes-devtools/patchelf/patchelf/alignmentfix.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-27821.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-20263.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2021-3392.patch
 rename meta/recipes-graphics/mesa/{mesa-gl_21.0.2.bb => mesa-gl_21.0.3.bb} (100%)
 rename meta/recipes-graphics/mesa/{mesa_21.0.2.bb => mesa_21.0.3.bb} (100%)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/CVE-2021-3472.patch
 rename meta/recipes-kernel/wireless-regdb/{wireless-regdb_2020.11.20.bb => wireless-regdb_2021.04.21.bb} (94%)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-MiniBrowser-Fix-reproduciblity.patch
 create mode 100644 meta/recipes-support/libevent/libevent/0002-test-regress.h-Increase-default-timeval-tolerance-50.patch

-- 
2.30.2

