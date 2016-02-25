Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id C02F9773A3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Feb 2016 23:34:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Feb 2016 15:34:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,498,1449561600"; d="scan'208";a="924096183"
Received: from yctb02.ostc.intel.com (HELO yctb02.otcr.jf.intel.com)
	([10.54.69.56])
	by fmsmga002.fm.intel.com with ESMTP; 25 Feb 2016 15:34:00 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 Feb 2016 23:34:10 +0000
Message-Id: <cover.1456442768.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/4] Replaces udev with eudev for compatibility when using sysvinit on newer kernels
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 25 Feb 2016 23:34:15 -0000

udev has started to fail on new kernels (4.4), due to being deprecated in favor
of systemd's udev implementation. To maintain a sysvinit alternative we also
need to provide an alternative to udev. Eudev is a fork of systemds udev,
this new eudev recipe provides upstream udev 220 funcitonality.

- libgudev is not provided by eudev as it was with udev before
- We can now drop usbutils_007 since usbutils_008 is now compatible
  also with eudev, and not only with systemd's udev
- Adds new eudev package to maintainers.inc

The following changes since commit 23056103c949b498c23b47579e8dd57ce78e6ed9:

  uclibc: Do not use immediate expansion operator (2016-02-22 20:42:48 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/eudev
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/eudev

Alejandro Hernandez (4):
  eudev: Replaces udev with eudev for compatibility when sysvinit on
    newer kernels
  libgudev: Fix for new eudev implementation
  usbutils: Fix for new eudev implementation
  maintainers.inc: Add new eudev package and change maintainership for
    udev

 meta-yocto/conf/distro/include/maintainers.inc     |   2 +-
 meta/conf/distro/include/default-providers.inc     |   2 +-
 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch |  41 --------
 meta/recipes-bsp/usbutils/usbutils/iconv.patch     |  29 +++---
 meta/recipes-bsp/usbutils/usbutils_007.bb          |  31 ------
 meta/recipes-bsp/usbutils/usbutils_008.bb          |   5 +-
 .../udev/{udev => eudev}/devfs-udev.rules          |   0
 meta/recipes-core/udev/{udev => eudev}/init        |   0
 meta/recipes-core/udev/{udev => eudev}/links.conf  |   0
 meta/recipes-core/udev/{udev => eudev}/local.rules |   0
 .../udev/{udev => eudev}/permissions.rules         |   0
 meta/recipes-core/udev/{udev => eudev}/run.rules   |   0
 meta/recipes-core/udev/{udev => eudev}/udev-cache  |   0
 .../udev/{udev => eudev}/udev-cache.default        |   0
 meta/recipes-core/udev/{udev => eudev}/udev.rules  |   0
 meta/recipes-core/udev/eudev_3.1.5.bb              |  83 +++++++++++++++
 meta/recipes-core/udev/udev.inc                    | 112 ---------------------
 ...yboard_force_release.sh-shell-script-path.patch |  35 -------
 ...-Add-stdint.h-as-it-was-removed-from-mtd-.patch |  29 ------
 ...c-Makefile.am-Check-for-input.h-and-input.patch |  52 ----------
 .../recipes-core/udev/udev/add-install-ptest.patch |  86 ----------------
 .../udev/udev/avoid-mouse-autosuspend.patch        |  25 -----
 .../udev/udev/fix_rule-syntax-regex-ptest.patch    |  58 -----------
 meta/recipes-core/udev/udev/run-ptest              |   5 -
 meta/recipes-core/udev/udev_182.bb                 |   9 --
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   3 +-
 26 files changed, 102 insertions(+), 505 deletions(-)
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils-008/iconv.patch
 delete mode 100644 meta/recipes-bsp/usbutils/usbutils_007.bb
 rename meta/recipes-core/udev/{udev => eudev}/devfs-udev.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/init (100%)
 rename meta/recipes-core/udev/{udev => eudev}/links.conf (100%)
 rename meta/recipes-core/udev/{udev => eudev}/local.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/permissions.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/run.rules (100%)
 rename meta/recipes-core/udev/{udev => eudev}/udev-cache (100%)
 rename meta/recipes-core/udev/{udev => eudev}/udev-cache.default (100%)
 rename meta/recipes-core/udev/{udev => eudev}/udev.rules (100%)
 create mode 100644 meta/recipes-core/udev/eudev_3.1.5.bb
 delete mode 100644 meta/recipes-core/udev/udev.inc
 delete mode 100644 meta/recipes-core/udev/udev/0001-Fixing-keyboard_force_release.sh-shell-script-path.patch
 delete mode 100644 meta/recipes-core/udev/udev/0001-mtd_probe.h-Add-stdint.h-as-it-was-removed-from-mtd-.patch
 delete mode 100644 meta/recipes-core/udev/udev/0002-configure.ac-Makefile.am-Check-for-input.h-and-input.patch
 delete mode 100644 meta/recipes-core/udev/udev/add-install-ptest.patch
 delete mode 100644 meta/recipes-core/udev/udev/avoid-mouse-autosuspend.patch
 delete mode 100644 meta/recipes-core/udev/udev/fix_rule-syntax-regex-ptest.patch
 delete mode 100644 meta/recipes-core/udev/udev/run-ptest
 delete mode 100644 meta/recipes-core/udev/udev_182.bb

-- 
2.6.2


