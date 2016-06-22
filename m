Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7AE8A60132
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 11:52:06 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga103.jf.intel.com with ESMTP; 22 Jun 2016 04:52:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,509,1459839600"; d="scan'208";a="1007357235"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 22 Jun 2016 04:52:05 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Jun 2016 14:51:59 +0300
Message-Id: <cover.1466595928.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] Upgrades and misc. fixes
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
X-List-Received-Date: Wed, 22 Jun 2016 11:52:08 -0000

This contains an uppgrade to Gtk+3 (which I didn't add into
sato-gtk3 branch to keep it from changing too much between versions),
upgrades to other recipes related to Gtk+, and miscallaneous fixes. 

The following changes since commit 95f6e7bd0f7188f59e66e1769799e44a123b638b:

  bitbake: cooker: clean up EvertWriter (2016-06-20 17:23:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades-post-gtk3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades-post-gtk3

Jussi Kukkonen (10):
  gtk+3: Upgrade 3.18.8 -> 3.20.6
  atk: Upgrade 2.18.0 -> 2.20.0
  at-spi2-core: Upgrade 2.18.3 -> 2.20.2
  at-spi2-atk: Upgrade 2.18.1 -> 2.20.1
  clutter-gtk-1.0: Upgrade 1.6.6 -> 1.8.0
  puzzles: Keep building even with deprecation warnings
  cairo: inherit upstream-version-is-even
  gsettings-desktop-schemas: inherit upstream-version-is-even
  vte: don't build test app
  connman-gnome: StatusIcon adapts to size changes

 .../connman/connman-gnome/0001-Port-to-Gtk3.patch  | 136 ++++++++-
 .../gsettings-desktop-schemas_3.20.0.bb            |   2 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   9 +-
 ..._libtool.patch => 0001-Hardcoded-libtool.patch} |  26 +-
 ...o-not-try-to-initialize-GL-without-libGL.patch} |  12 +-
 ...0003-Add-disable-opengl-configure-option.patch} | 327 ++++++---------------
 ...4-configure.ac-Fix-wayland-protocols-path.patch |  36 +++
 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 --------
 .../gtk+/{gtk+3_3.18.8.bb => gtk+3_3.20.6.bb}      |  13 +-
 ...e_3.18.8.bb => gtk-icon-utils-native_3.20.6.bb} |   4 +-
 meta/recipes-graphics/cairo/cairo.inc              |   2 +-
 .../clutter/clutter-gtk-1.0_1.6.6.bb               |   6 -
 .../clutter/clutter-gtk-1.0_1.8.0.bb               |   6 +
 meta/recipes-sato/puzzles/puzzles_git.bb           |   2 +
 ...at-spi2-atk_2.18.1.bb => at-spi2-atk_2.20.1.bb} |   4 +-
 .../0001-build-Add-with-systemduserunitdir.patch   |  49 +++
 ...-spi2-core_2.18.3.bb => at-spi2-core_2.20.2.bb} |  18 +-
 .../atk/{atk_2.18.0.bb => atk_2.20.0.bb}           |   6 +-
 meta/recipes-support/vte/vte_0.44.1.bb             |   2 +-
 19 files changed, 371 insertions(+), 407 deletions(-)
 rename meta/recipes-gnome/gtk+/gtk+3/{hardcoded_libtool.patch => 0001-Hardcoded-libtool.patch} (70%)
 rename meta/recipes-gnome/gtk+/gtk+3/{Do-not-try-to-initialize-GL-without-libGL.patch => 0002-Do-not-try-to-initialize-GL-without-libGL.patch} (86%)
 rename meta/recipes-gnome/gtk+/gtk+3/{0001-Add-disable-opengl-configure-option.patch => 0003-Add-disable-opengl-configure-option.patch} (71%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/0004-configure.ac-Fix-wayland-protocols-path.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.18.8.bb => gtk+3_3.20.6.bb} (57%)
 rename meta/recipes-gnome/gtk+/{gtk-icon-utils-native_3.18.8.bb => gtk-icon-utils-native_3.20.6.bb} (93%)
 delete mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.6.6.bb
 create mode 100644 meta/recipes-graphics/clutter/clutter-gtk-1.0_1.8.0.bb
 rename meta/recipes-support/atk/{at-spi2-atk_2.18.1.bb => at-spi2-atk_2.20.1.bb} (81%)
 create mode 100644 meta/recipes-support/atk/at-spi2-core/0001-build-Add-with-systemduserunitdir.patch
 rename meta/recipes-support/atk/{at-spi2-core_2.18.3.bb => at-spi2-core_2.20.2.bb} (49%)
 rename meta/recipes-support/atk/{atk_2.18.0.bb => atk_2.20.0.bb} (69%)

-- 
2.1.4


