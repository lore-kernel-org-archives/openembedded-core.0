Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web09.17006.1627890765018628590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Aug 2021 00:52:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.136, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10063"; a="193001985"
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="193001985"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:43 -0700
X-IronPort-AV: E=Sophos;i="5.84,288,1620716400"; 
   d="scan'208";a="478650946"
Received: from chewchoo-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.228.46])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2021 00:52:42 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 00/37] review request
Date: Mon,  2 Aug 2021 15:51:47 +0800
Message-Id: <cover.1627890114.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these next set of changes for hardknott. There were
intermittent ptest failures in lttng-tools, valgrind and strace for
which we have bugs and two other intermittent failures caused by bitbake
timeout while executing oe-selftest and qemu timeout in qemuarm-alt.

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/2405

Thanks,

Anuj

The following changes since commit e458c15627e7b27392d158cbb9417f66424aa7d5:

  xserver-xorg: Fix builds without glx (2021-07-14 00:04:22 +0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/hardknott

Alexander Kanavin (1):
  devtool: correctly handle non-standard source tree locations in
    upgrades

Bruce Ashfield (7):
  linux-yocto: add vfat KERNEL_FEATURE when MACHINE_FEATURES include
    vfat
  linux-yocto/5.10: update to v5.10.49
  linux-yocto/5.4: update to v5.4.131
  linux-yocto/5.10: update to v5.10.50
  linux-yocto/5.4: update to v5.4.132
  linux-yocto/5.10: update to v5.10.52
  linux-yocto/5.4: update to v5.4.134

Changqing Li (1):
  archiver.bbclass: fix do_ar_configured failure for kernel

Chen Qi (1):
  systemd: fix CVE-2020-13529

Damian Wrobel (1):
  gobject-introspection: Fix the license (add MIT)

Khairul Rohaizzat Jamaluddin (1):
  glibc: Fix CVE-2021-33574

Khem Raj (1):
  ovmf: Fix VLA warnings with GCC 11

Marek Vasut (1):
  update-rc.d: update SRCREV to pull in fix for non-bash shell support

Matthias Schiffer (1):
  initscripts: fix creation order for /var/log with
    VOLATILE_LOG_DIR=true

Michael Opdenacker (1):
  oe-setup-builddir: update YP docs and OE URLs

Mingli Yu (1):
  netbase: use git fetcher

Nicolas Dechesne (4):
  yocto-check-layer: improve missed dependencies
  checklayer: new function get_layer_dependencies()
  checklayer: rename _find_layer_depends
  yocto-check-layer: ensure that all layer dependencies are tested too

Oleksandr Kravchuk (1):
  bitbake.conf: change GNOME_MIRROR to new one

Ralph Siemsen (1):
  oeqa/manual/toaster: fix small typo

Richard Purdie (3):
  pseudo: Add uninative configuration sanity check
  pseudo: Update to latest version including statx fix
  sstate: Drop pseudo exclusion

Ross Burton (5):
  parted: improve ptest execution
  parted: fix ptest RRECOMMENDS
  parted: skip tests that need vfat support
  avahi: fix CVE-2021-36217, crash on pinging '.local'
  glew: fix Makefile race

Sakib Sajal (1):
  go: fix CVE-2020-29509, CVE-2020-29511

Tony Tascioglu (1):
  valgrind: skip flaky ptest fb_test_amd64

Trevor Gamblin (1):
  python3-pip: fix CVE-2021-3572

Ulrich Ölmann (2):
  initramfs-framework: fix whitespace issue
  initramfs-framework/setup-live: fix shebang

leimaohui (1):
  archiver.bbclass: Fix patch error for recipes that inherit dos2unix.

 meta/classes/archiver.bbclass                 |   8 +-
 meta/classes/sstate.bbclass                   |   2 -
 meta/conf/bitbake.conf                        |   2 +-
 .../lib/oeqa/manual/toaster-managed-mode.json |   2 +-
 meta/recipes-connectivity/avahi/avahi_0.8.bb  |   1 +
 .../avahi/files/local-ping.patch              | 152 ++++++++++++++++
 .../glibc/glibc/CVE-2021-33574_1.patch        |  76 ++++++++
 .../glibc/glibc/CVE-2021-33574_2.patch        |  61 +++++++
 meta/recipes-core/glibc/glibc_2.33.bb         |   2 +
 .../initramfs-framework/setup-live            |   2 +-
 .../initrdscripts/initramfs-framework_1.0.bb  |   2 +-
 .../initscripts/initscripts_1.0.bb            |   3 +-
 meta/recipes-core/netbase/netbase_6.2.bb      |   5 +-
 .../ovmf/0001-Fix-VLA-parameter-warning.patch |  51 ++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   1 +
 ...heck-error-earlier-and-reduce-indent.patch | 172 ++++++++++++++++++
 ...02-sd-dhcp-client-shorten-code-a-bit.patch |  66 +++++++
 ...ogs-when-dhcp-client-unexpectedly-ga.patch |  69 +++++++
 ...entatively-ignore-FORCERENEW-command.patch |  42 +++++
 meta/recipes-core/systemd/systemd_247.6.bb    |   4 +
 .../update-rc.d/update-rc.d_0.8.bb            |   2 +-
 meta/recipes-devtools/go/go-1.16.5.inc        |   1 +
 ...dle-leading-trailing-or-double-colon.patch | 123 +++++++++++++
 meta/recipes-devtools/pseudo/pseudo.inc       |  13 ++
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 ...git-references-on-unicode-separators.patch |  40 ++++
 .../python/python3-pip_20.0.2.bb              |   4 +-
 .../valgrind/valgrind/remove-for-all          |   1 +
 .../parted/files/check-vfat.patch             |  51 ++++++
 meta/recipes-extended/parted/files/run-ptest  |   2 +-
 meta/recipes-extended/parted/parted_3.4.bb    |  10 +-
 .../gobject-introspection_1.66.1.bb           |   2 +-
 .../0001-Fix-build-race-in-Makefile.patch     |  56 ++++++
 meta/recipes-graphics/glew/glew_2.2.0.bb      |   1 +
 .../linux/linux-yocto-rt_5.10.bb              |   6 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.10.bb            |   8 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto.inc     |   1 +
 meta/recipes-kernel/linux/linux-yocto_5.10.bb |  24 +--
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +--
 scripts/lib/checklayer/__init__.py            |  11 +-
 scripts/lib/devtool/upgrade.py                |  15 +-
 scripts/oe-setup-builddir                     |   4 +-
 scripts/yocto-check-layer                     |  23 ++-
 45 files changed, 1092 insertions(+), 67 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/local-ping.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_1.patch
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2021-33574_2.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-Fix-VLA-parameter-warning.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-sd-dhcp-client-check-error-earlier-and-reduce-indent.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0002-sd-dhcp-client-shorten-code-a-bit.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0003-sd-dhcp-client-logs-when-dhcp-client-unexpectedly-ga.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0004-sd-dhcp-client-tentatively-ignore-FORCERENEW-command.patch
 create mode 100644 meta/recipes-devtools/go/go-1.16/0001-encoding-xml-handle-leading-trailing-or-double-colon.patch
 create mode 100644 meta/recipes-devtools/python/python3-pip/0001-Don-t-split-git-references-on-unicode-separators.patch
 create mode 100644 meta/recipes-extended/parted/files/check-vfat.patch
 create mode 100644 meta/recipes-graphics/glew/glew/0001-Fix-build-race-in-Makefile.patch

-- 
2.31.1

