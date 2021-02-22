Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by mx.groups.io with SMTP id smtpd.web12.36963.1614009640008517381
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Feb 2021 08:00:40 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.93, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: AlrWapAndj8q/u1G4on7ameGetj8c1IRcrhRaIqVloVzFa9S5a3EpoXHtClseSoi9aLU7MYG3D
 VsCkios47cjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9903"; a="181049224"
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="181049224"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:39 -0800
IronPort-SDR: rN3Z1mj+HlOOwI7YuDnWyteQ0pS667WCrRDw/dGS0ai0P6qjou1SrsAoEUGec74MGSH4WrmPp9
 Yp1kBXKtvIVw==
X-IronPort-AV: E=Sophos;i="5.81,197,1610438400"; 
   d="scan'208";a="430301777"
Received: from yrajendx-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.255.147.39])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2021 08:00:37 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 00/30] patch review request
Date: Tue, 23 Feb 2021 00:00:03 +0800
Message-Id: <cover.1614009417.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review these next set of changes for gatesgarth. Builds fine on
autobuilder except for a known intermittent task hash mismatch failure.

Thanks,

Anuj

The following changes since commit ebaaee50cb3ac75112827f935c48affaf622ce7f:

  build-appliance-image: Update to gatesgarth head revision (2021-02-16 11:44:29 +0000)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib anujm/gatesgarth

Chee Yang Lee (1):
  initrdscripts: init-install-efi.sh install extra files for ESP

Dorinda (1):
  oe-pkgdata-util: Check if environment script is initialized

Joshua Watt (7):
  libomxil: Fix up commercial license flag
  weston: remoting backend requires GStreamer base plugins
  oeqa: reproducible: Fix SSTATE_MIRRORS variable
  oeqa: reproducible: Add more logging
  systemd: Re-enable chvt as non-root user without polkit
  bison: Fix up file name mapping
  acpica: Fix reproducibility issues

Khem Raj (1):
  tcf-agent: Fix build on riscv32

Lee Chee Yang (3):
  wic: debug mode to keep tmp directory
  qemu: fix CVE-2020-29443 CVE-2020-35517
  openssh: fix CVE-2020-14145

Marek Vasut (1):
  weston-init: Fix weston-keyboard path in weston.ini

Richard Leitner (1):
  deb: export INTERCEPT_DIR for remove actions

Richard Purdie (13):
  pseudo: Update for rename and faccessat fixes
  pseudo: Update to include fixes for glibc 2.33
  opkg: Fix build reproducibility issue
  opkg: Fix patch glitches
  cwautomacros: Ensure version is set deterministically
  vim: Improve determinism
  vim: Fix a race over creation of the desktop files
  package_manager/deb: Fix image generation with package removal
  quilt: Be determnistic about column presence
  buildtools-extended-tarball: Add glibc-gconvs needed for build
  watchdog: Fix determinism issue from sendmail host path
  watchdog: Avoid reproducibility failures after fixing build
  xmlto: Fix reproducibility

Vivien Didelot (1):
  local.conf.sample.extended: fix double 'of' typo

akuster (1):
  connman: update to 1.39

 meta/conf/local.conf.sample.extended          |   2 +-
 meta/lib/oe/package_manager/deb/__init__.py   |   6 +
 meta/lib/oeqa/selftest/cases/reproducible.py  |   5 +-
 meta/lib/oeqa/selftest/cases/wic.py           |   2 +
 .../{connman_1.38.bb => connman_1.39.bb}      |   3 +-
 .../openssh/openssh/CVE-2020-14145.patch      |  90 +++++++
 .../openssh/openssh_8.3p1.bb                  |   1 +
 .../initrdscripts/files/init-install-efi.sh   |   5 +
 .../meta/buildtools-extended-tarball.bb       |  10 +
 ...chvt-as-non-root-user-without-polkit.patch | 227 ++++++++++++++++++
 meta/recipes-core/systemd/systemd_246.9.bb    |   1 +
 ...001-Use-mapped-file-name-for-symbols.patch |  62 +++++
 meta/recipes-devtools/bison/bison_3.7.2.bb    |   1 +
 .../opkg/opkg/sourcedateepoch.patch           |  24 ++
 meta/recipes-devtools/opkg/opkg_0.4.3.bb      |   1 +
 meta/recipes-devtools/pseudo/pseudo_git.bb    |   2 +-
 meta/recipes-devtools/qemu/qemu.inc           |   2 +
 .../qemu/qemu/CVE-2020-29443.patch            |  46 ++++
 .../qemu/qemu/CVE-2020-35517.patch            | 126 ++++++++++
 meta/recipes-devtools/quilt/quilt.inc         |   2 +-
 .../tcf-agent/tcf-agent_git.bb                |   1 +
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb   |   2 +-
 .../acpica/acpica_20200717.bb                 |   2 +
 .../cwautomacros/cwautomacros_20110201.bb     |   2 +-
 .../watchdog/watchdog_5.16.bb                 |   6 +
 .../wayland/weston-init/weston.ini            |   2 +-
 meta/recipes-graphics/wayland/weston_9.0.0.bb |   2 +-
 .../libomxil/libomxil_0.9.3.bb                |   6 +-
 meta/recipes-support/vim/files/racefix.patch  |  33 +++
 meta/recipes-support/vim/vim.inc              |   3 +
 scripts/lib/wic/plugins/imager/direct.py      |   6 +-
 scripts/oe-pkgdata-util                       |   3 +
 32 files changed, 673 insertions(+), 13 deletions(-)
 rename meta/recipes-connectivity/connman/{connman_1.38.bb => connman_1.39.bb} (78%)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2020-14145.patch
 create mode 100644 meta/recipes-core/systemd/systemd/0001-logind-Restore-chvt-as-non-root-user-without-polkit.patch
 create mode 100644 meta/recipes-devtools/bison/bison/0001-Use-mapped-file-name-for-symbols.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-29443.patch
 create mode 100644 meta/recipes-devtools/qemu/qemu/CVE-2020-35517.patch
 create mode 100644 meta/recipes-support/vim/files/racefix.patch

-- 
2.29.2

