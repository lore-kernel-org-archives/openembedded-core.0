Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE397727C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 09:43:45 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 13 Nov 2015 01:43:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,286,1444719600"; d="scan'208";a="599686485"
Received: from theory.fi.intel.com ([10.237.72.196])
	by FMSMGA003.fm.intel.com with ESMTP; 13 Nov 2015 01:43:40 -0800
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 11:46:56 +0200
Message-Id: <cover.1447405312.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/19] X11 & GTK+ version upgrades
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
X-List-Received-Date: Fri, 13 Nov 2015 09:43:47 -0000

This patchset requires the patches in jku/glib-et-al branch,
and that branch _is included_ in the one linked here.

Most of the X upgrades are minor bumps as usual. xf86-video-omap upgrade
I could not test myself but the changes look innocent enough so I
included it.

Notable changes:
 * Pango is now a simple library (no modules, engines or configuration)
 * GdkPixbuf dropped support for some rare formats (wbmp, ras, pcx)
 * GTK upgraded to 3.18 series
 * XOrg 1.18 (video ABI 20)

 - Jussi


The following changes since commit 84d5b3dc3832a7cd24b5362d35556e86b28d2f26:

  libsoup-2.4: Upgrade 2.50.0 -> 2.52.1 (2015-11-09 14:29:50 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/x11-gtk-upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/x11-gtk-upgrades

Jussi Kukkonen (19):
  gdk-pixbuf: Upgrade 2.30.8 -> 2.32.1
  pango: Upgrade 1.36.8 -> 1.38.1
  librsvg: Upgrade 2.40.10 -> 2.40.11
  adwaita-icon-theme: Upgrade 3.16.2.1 -> 3.18.0
  gtk+3: Upgrade 3.16.6 -> 3.18.2
  package_regex.inc: Add gtk-icon-utils-native
  gtk-icon-utils-native: Upgrade 3.16.6 -> 3.18.2
  libxi: Upgrade 1.7.4 -> 1.7.5
  pixman: Upgrade 0.32.6 -> 0.32.8
  libxcb: Upgrade 1.11 -> 1.11.1
  libxcb: Remove unused git-version of the recipe
  xserver-xorg: Upgrade 1.17.2 -> 1.18.0
  xorg-driver-input: add xorg configuration to FILES
  xf86-input-evdev: Upgrade 2.9.2 -> 2.10.0
  xf86-input-synaptics: Upgrade 1.8.2 -> 1.8.3
  xf86-video-omap: Upgrade 0.4.3 -> 0.4.4
  xinput: Upgrade 1.6.1 -> 1.6.2
  xkbcomp: Upgrade 1.3.0 -> 1.3.1
  xkeyboard-config: Upgrade 2.15 -> 2.16

 meta/conf/distro/include/package_regex.inc         |   1 +
 ...ps-Be-more-careful-about-integer-overflow.patch |  89 -----------
 .../{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} |   5 +-
 .../Create-symlinks-when-installing-cursors.patch  | 178 ---------------------
 ...me_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} |   5 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   5 +-
 .../gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb}      |   4 +-
 ...e_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} |   4 +-
 .../{librsvg_2.40.10.bb => librsvg_2.40.11.bb}     |   4 +-
 meta/recipes-graphics/pango/pango.inc              |  50 +-----
 .../pango/pango/multilib-fix-clean.patch           |  75 ---------
 meta/recipes-graphics/pango/pango_1.36.8.bb        |  10 --
 meta/recipes-graphics/pango/pango_1.38.1.bb        |   9 ++
 .../xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb}  |   6 +-
 .../{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb}         |   4 +-
 ...t-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} |   4 +-
 ...tics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} |   6 +-
 ...put_dpms-Replace-logical-with-bitwise-ope.patch |  31 ----
 ...ideo-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} |   6 +-
 .../xorg-driver/xorg-driver-input.inc              |   4 +-
 .../xorg-lib/{libxcb.inc => libxcb_1.11.1.bb}      |  13 +-
 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb      |  10 --
 meta/recipes-graphics/xorg-lib/libxcb_git.bb       |  10 --
 .../xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb}    |   4 +-
 ...0001-v3-test-add-a-check-for-FE_DIVBYZERO.patch |   2 +-
 .../{pixman_0.32.6.bb => pixman_0.32.8.bb}         |   4 +-
 ...ard-config_2.15.bb => xkeyboard-config_2.16.bb} |   4 +-
 .../recipes-graphics/xorg-xserver/xserver-xorg.inc |   2 +-
 ...e-__GLIBC__-guard-for-glibc-specific-code.patch |  31 ----
 ...erver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} |   6 +-
 30 files changed, 57 insertions(+), 529 deletions(-)
 delete mode 100644 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf/0001-pixops-Be-more-careful-about-integer-overflow.patch
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.30.8.bb => gdk-pixbuf_2.32.1.bb} (94%)
 delete mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 rename meta/recipes-gnome/gnome/{adwaita-icon-theme_3.16.2.1.bb => adwaita-icon-theme_3.18.0.bb} (85%)
 rename meta/recipes-gnome/gtk+/{gtk+3_3.16.6.bb => gtk+3_3.18.2.bb} (83%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.16.6.bb => gtk-icon-utils-native_3.18.2.bb} (94%)
 rename meta/recipes-gnome/librsvg/{librsvg_2.40.10.bb => librsvg_2.40.11.bb} (92%)
 delete mode 100644 meta/recipes-graphics/pango/pango/multilib-fix-clean.patch
 delete mode 100644 meta/recipes-graphics/pango/pango_1.36.8.bb
 create mode 100644 meta/recipes-graphics/pango/pango_1.38.1.bb
 rename meta/recipes-graphics/xorg-app/{xinput_1.6.1.bb => xinput_1.6.2.bb} (66%)
 rename meta/recipes-graphics/xorg-app/{xkbcomp_1.3.0.bb => xkbcomp_1.3.1.bb} (78%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.9.2.bb => xf86-input-evdev_2.10.0.bb} (83%)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-synaptics_1.8.2.bb => xf86-input-synaptics_1.8.3.bb} (74%)
 delete mode 100644 meta/recipes-graphics/xorg-driver/xf86-video-omap/0001-drmmode_output_dpms-Replace-logical-with-bitwise-ope.patch
 rename meta/recipes-graphics/xorg-driver/{xf86-video-omap_0.4.3.bb => xf86-video-omap_0.4.4.bb} (84%)
 rename meta/recipes-graphics/xorg-lib/{libxcb.inc => libxcb_1.11.1.bb} (80%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_1.11.bb
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb_git.bb
 rename meta/recipes-graphics/xorg-lib/{libxi_1.7.4.bb => libxi_1.7.5.bb} (81%)
 rename meta/recipes-graphics/xorg-lib/{pixman_0.32.6.bb => pixman_0.32.8.bb} (90%)
 rename meta/recipes-graphics/xorg-lib/{xkeyboard-config_2.15.bb => xkeyboard-config_2.16.bb} (88%)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-use-__GLIBC__-guard-for-glibc-specific-code.patch
 rename meta/recipes-graphics/xorg-xserver/{xserver-xorg_1.17.2.bb => xserver-xorg_1.18.0.bb} (78%)

-- 
2.1.4


