Return-Path: <laurentiu.palcu@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id D3C1F6077F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 31 Jul 2013 13:10:14 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 31 Jul 2013 06:10:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.89,787,1367996400"; d="scan'208";a="354884313"
Received: from lpalcu-linux.rb.intel.com ([10.237.105.165])
	by orsmga001.jf.intel.com with ESMTP; 31 Jul 2013 06:10:00 -0700
From: Laurentiu Palcu <laurentiu.palcu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 31 Jul 2013 16:09:44 +0300
Message-Id: <cover.1375275560.git.laurentiu.palcu@intel.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 00/13] Package upgrades
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
X-List-Received-Date: Wed, 31 Jul 2013 13:10:15 -0000

Hi,

Tests done:
 * build tested on AB running following nightlies: x86, x86_64, ppc, mips, arm;
 * basic functionality for X, powertop, nasm, xhost and xranr was tested on an
   ideapad s10-3t with a core-image-sato image. No issues spotted;
 * makedepend, flex, git, subversion are needed during the build process for
   various packages and were not tested directly. AB caught a grub compilation
   issue caused by the new flex version and this patchset contains a fix for
   that too;

Thanks,
Laurentiu

The following changes since commit 9de0ad47462c13ac4a2d73e12e92be6c1b4e0415:

  genericx86: ship all the driver firmware by default (2013-07-31 07:00:00 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lpalcu/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lpalcu/upgrades

Laurentiu Palcu (13):
  xf86-video-intel: upgrade to 2.21.13
  git: upgrade to 1.8.3.4
  nasm: upgrade to 2.10.09
  powertop: upgrade to 2.4
  libdrm: upgrade to 2.4.46
  libpciaccess: upgrade to 0.13.2
  xrandr: upgrade to 1.4.1
  xf86-input-evdev: upgrade to 2.8.1
  subversion: upgrade to 1.8.1
  xhost: upgrade to 1.0.6
  makedepend: upgrade to 1.0.5
  flex: upgrade to 2.5.37
  grub_2.00: fix compilation when using flex 2.5.37

 .../grub-2.00/fix-issue-with-flex-2.5.37.patch     |   21 +++++++
 meta/recipes-bsp/grub/grub_2.00.bb                 |    4 +-
 .../flex/files/do_not_create_pdf_doc.patch         |   17 ++++++
 .../flex/flex/avoid-FORTIFY-warnings.patch         |   59 --------------------
 .../flex/int-is-not-the-same-size-as-size_t.patch  |   42 --------------
 meta/recipes-devtools/flex/flex_2.5.35.bb          |   11 ----
 meta/recipes-devtools/flex/flex_2.5.37.bb          |   10 ++++
 .../git/{git_1.8.3.bb => git_1.8.3.4.bb}           |    4 +-
 .../nasm/{nasm_2.10.07.bb => nasm_2.10.09.bb}      |    5 +-
 .../subversion-1.8.1/disable_mac_checks.patch      |   21 +++++++
 .../libtool2.patch                                 |   14 +++--
 .../subversion/disable-revision-install.patch      |   36 ------------
 .../subversion/fix-install-depends.patch           |   45 ---------------
 .../{subversion_1.6.15.bb => subversion_1.8.1.bb}  |   24 ++++----
 .../drm/{libdrm_2.4.45.bb => libdrm_2.4.46.bb}     |    4 +-
 .../xorg-app/{xhost_1.0.5.bb => xhost_1.0.6.bb}    |    5 +-
 .../xorg-app/{xrandr_1.4.0.bb => xrandr_1.4.1.bb}  |    5 +-
 ...ut-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} |    4 +-
 ...intel_2.21.9.bb => xf86-video-intel_2.21.13.bb} |    4 +-
 ...bpciaccess_0.13.1.bb => libpciaccess_0.13.2.bb} |    8 +--
 .../obsolete_automake_macros.patch                 |   15 -----
 .../{makedepend_1.0.4.bb => makedepend_1.0.5.bb}   |    7 +--
 .../powertop/{powertop_2.3.bb => powertop_2.4.bb}  |    4 +-
 23 files changed, 112 insertions(+), 257 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-2.00/fix-issue-with-flex-2.5.37.patch
 create mode 100644 meta/recipes-devtools/flex/files/do_not_create_pdf_doc.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/avoid-FORTIFY-warnings.patch
 delete mode 100644 meta/recipes-devtools/flex/flex/int-is-not-the-same-size-as-size_t.patch
 delete mode 100644 meta/recipes-devtools/flex/flex_2.5.35.bb
 create mode 100644 meta/recipes-devtools/flex/flex_2.5.37.bb
 rename meta/recipes-devtools/git/{git_1.8.3.bb => git_1.8.3.4.bb} (67%)
 rename meta/recipes-devtools/nasm/{nasm_2.10.07.bb => nasm_2.10.09.bb} (80%)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.1/disable_mac_checks.patch
 rename meta/recipes-devtools/subversion/{subversion => subversion-1.8.1}/libtool2.patch (54%)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/disable-revision-install.patch
 delete mode 100644 meta/recipes-devtools/subversion/subversion/fix-install-depends.patch
 rename meta/recipes-devtools/subversion/{subversion_1.6.15.bb => subversion_1.8.1.bb} (54%)
 rename meta/recipes-graphics/drm/{libdrm_2.4.45.bb => libdrm_2.4.46.bb} (46%)
 rename meta/recipes-graphics/xorg-app/{xhost_1.0.5.bb => xhost_1.0.6.bb} (79%)
 rename meta/recipes-graphics/xorg-app/{xrandr_1.4.0.bb => xrandr_1.4.1.bb} (70%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.0.bb => xf86-input-evdev_2.8.1.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-video-intel_2.21.9.bb => xf86-video-intel_2.21.13.bb} (85%)
 rename meta/recipes-graphics/xorg-lib/{libpciaccess_0.13.1.bb => libpciaccess_0.13.2.bb} (50%)
 delete mode 100644 meta/recipes-graphics/xorg-util/makedepend-1.0.4/obsolete_automake_macros.patch
 rename meta/recipes-graphics/xorg-util/{makedepend_1.0.4.bb => makedepend_1.0.5.bb} (76%)
 rename meta/recipes-kernel/powertop/{powertop_2.3.bb => powertop_2.4.bb} (87%)

-- 
1.7.9.5


