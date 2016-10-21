Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id D257A71996
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Oct 2016 10:20:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga101.fm.intel.com with ESMTP; 21 Oct 2016 03:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,375,1473145200"; d="scan'208";a="892426875"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 21 Oct 2016 03:20:02 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 21 Oct 2016 13:19:59 +0300
Message-Id: <cover.1477032779.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/15] Make libinput default X input driver + upgrades
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
X-List-Received-Date: Fri, 21 Oct 2016 10:20:05 -0000

The only interesting bit is in the last commit: it removes all legacy
X input drivers from the machine configurations, and makes xserver-xorg
RRECOMMEND the libinput driver instead -- better design ideas for this
are welcome.

I wonder if VMware mouse device support is really needed? I have
removed the vmmouse X driver from the configs but the corresponding
kernel driver could be enabled instead if there is a need.

I've smoke tested this change on x86* and a few qemus.

Thanks, 
 Jussi


The following changes since commit ef627ab364d52fe19994c94c1a78fbe21620a32c:

  local.conf.sample.extended: remove RM_OLD_IMAGE (2016-10-19 17:07:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg

Jussi Kukkonen (15):
  libinput: Upgrade 1.4.1 -> 1.5.0
  libevdev: Upgrade 1.5.2 -> 1.5.4
  libdrm: Upgrade 2.4.70 -> 2.4.71
  xf86-input-libinput: Upgrade 0.19.0 -> 0.22.0
  xproto: Upgrade 7.0.29 -> 7.0.31
  libxvmc: Upgrade 1.0.9 -> 1.0.10
  libxv: Upgrade 1.0.10 -> 1.0.11
  libxtst: Upgrade 1.2.2 -> 1.2.3
  libxrender: Upgrade 0.9.9 -> 0.9.10
  libxi: Upgrade 1.7.6 -> 1.7.7
  libxfont: Upgrade 1.5.1 -> 1.5.2
  libxfixes: Upgrade 5.0.2 -> 5.0.3
  libx11: Upgrade 1.6.3 -> 1.6.4
  libx11-diet: Upgrade 1.6.3 -> 1.6.4
  conf: Use xf86-input-libinput by default

 meta/conf/machine/include/qemu.inc                 |  4 +-
 meta/conf/machine/include/x86-base.inc             |  4 --
 meta/conf/machine/qemux86-64.conf                  |  3 -
 meta/conf/machine/qemux86.conf                     |  3 -
 .../drm/{libdrm_2.4.70.bb => libdrm_2.4.71.bb}     |  4 +-
 .../packagegroups/packagegroup-core-x11-xserver.bb |  2 +-
 .../{libinput_1.4.1.bb => libinput_1.5.0.bb}       |  4 +-
 ...put_0.19.0.bb => xf86-input-libinput_0.22.0.bb} |  4 +-
 .../{libx11-diet_1.6.3.bb => libx11-diet_1.6.4.bb} |  4 +-
 .../libx11/libX11-Add-missing-NULL-check.patch     | 72 ----------------------
 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb     | 11 ----
 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb     | 10 +++
 .../{libxfixes_5.0.2.bb => libxfixes_5.0.3.bb}     |  5 +-
 .../{libxfont_1.5.1.bb => libxfont_1.5.2.bb}       |  4 +-
 .../xorg-lib/{libxi_1.7.6.bb => libxi_1.7.7.bb}    |  5 +-
 .../{libxrender_0.9.9.bb => libxrender_0.9.10.bb}  |  5 +-
 .../{libxtst_1.2.2.bb => libxtst_1.2.3.bb}         |  5 +-
 .../xorg-lib/{libxv_1.0.10.bb => libxv_1.0.11.bb}  |  5 +-
 .../{libxvmc_1.0.9.bb => libxvmc_1.0.10.bb}        |  4 +-
 .../{xproto_7.0.29.bb => xproto_7.0.31.bb}         |  4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  2 +-
 .../{libevdev_1.5.2.bb => libevdev_1.5.4.bb}       |  4 +-
 .../target/arch/arm/conf/machine/machine.conf      |  4 +-
 .../target/arch/mips/conf/machine/machine.conf     |  1 -
 .../target/arch/mips64/conf/machine/machine.conf   |  1 -
 .../target/arch/powerpc/conf/machine/machine.conf  |  1 -
 .../target/arch/qemu/conf/machine/machine.conf     |  3 -
 27 files changed, 45 insertions(+), 133 deletions(-)
 rename meta/recipes-graphics/drm/{libdrm_2.4.70.bb => libdrm_2.4.71.bb} (93%)
 rename meta/recipes-graphics/wayland/{libinput_1.4.1.bb => libinput_1.5.0.bb} (85%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-libinput_0.19.0.bb => xf86-input-libinput_0.22.0.bb} (63%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.6.3.bb => libx11-diet_1.6.4.bb} (73%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11/libX11-Add-missing-NULL-check.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.3.bb
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11_1.6.4.bb
 rename meta/recipes-graphics/xorg-lib/{libxfixes_5.0.2.bb => libxfixes_5.0.3.bb} (79%)
 rename meta/recipes-graphics/xorg-lib/{libxfont_1.5.1.bb => libxfont_1.5.2.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.6.bb => libxi_1.7.7.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{libxrender_0.9.9.bb => libxrender_0.9.10.bb} (82%)
 rename meta/recipes-graphics/xorg-lib/{libxtst_1.2.2.bb => libxtst_1.2.3.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxv_1.0.10.bb => libxv_1.0.11.bb} (78%)
 rename meta/recipes-graphics/xorg-lib/{libxvmc_1.0.9.bb => libxvmc_1.0.10.bb} (76%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.29.bb => xproto_7.0.31.bb} (74%)
 rename meta/recipes-support/libevdev/{libevdev_1.5.2.bb => libevdev_1.5.4.bb} (74%)

-- 
2.1.4


