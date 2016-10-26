Return-Path: <jussi.kukkonen@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 8B60560123
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:37:25 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP; 26 Oct 2016 01:37:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,549,1473145200"; d="scan'208";a="23758149"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 26 Oct 2016 01:37:26 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id 785016A4006;
	Wed, 26 Oct 2016 01:36:51 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Oct 2016 11:37:21 +0300
Message-Id: <cover.1477469885.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 00/16] Make libinput default X input driver + upgrades
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
X-List-Received-Date: Wed, 26 Oct 2016 08:37:25 -0000

Changes since v1:
* Remove references to legacy drivers in xorg.conf files. As far as
  I can tell no input driver configuration is needed nowadays: I'm no
  qemu expert so advice on this is welcome though.
* Drop the changes to scripts/lib/bsp/ (as they are for meta-yocto)

So the last commit is new, the one before it was modified. Otherwise
commits are as in v1.


original cover letter follows:

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




The following changes since commit 30d1af89ce2a2fb30f32a898ec12c9a51db57013:

  image_types: Use softer setting of WKS_FILE (2016-10-25 17:58:59 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/xorg
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/xorg

Jussi Kukkonen (16):
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
  xserver-xf86-config: Remove legacy drivers from xorg.conf

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
 .../xserver-xf86-config/qemuarm/xorg.conf          | 31 ----------
 .../xserver-xf86-config/qemumips/xorg.conf         | 31 ----------
 .../xserver-xf86-config/qemumips64/xorg.conf       | 31 ----------
 .../xserver-xf86-config/qemuppc/xorg.conf          | 31 ----------
 .../xserver-xf86-config/qemush4/xorg.conf          | 31 ----------
 .../xserver-xf86-config/qemux86-64/xorg.conf       | 31 ----------
 .../xserver-xf86-config/qemux86/xorg.conf          | 31 ----------
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |  2 +-
 .../{libevdev_1.5.2.bb => libevdev_1.5.4.bb}       |  4 +-
 29 files changed, 44 insertions(+), 341 deletions(-)
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


