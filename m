Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id DA25D7564B
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jul 2015 12:27:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 06 Jul 2015 05:27:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,414,1432623600"; d="scan'208";a="759143619"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 06 Jul 2015 05:27:35 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jul 2015 15:28:17 +0300
Message-Id: <cover.1436184775.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v4 0/7] GTK+3 upgrade and related changes
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
X-List-Received-Date: Mon, 06 Jul 2015 12:27:37 -0000

Changes since v3:
* Upgrade intltool: intltool.m4 did a compile test on
  configure and that prevented adwaita from inheriting "allarch".
  intltool 0.51.0 does not have have that problem anymore.
* Bump GTK+3 to 3.16.4 (forgot to do this on v3, apologies).
* adwaita-icon-theme inherits allarch, no longer recommends librsvg-gtk.
  Hires icons are packaged separately.
* rename gtk-update-icon-cache-native recipe to gtk-icon-utils-native
  to better reflect the contents. This also required changes in
  other recipes.



The following changes since commit 7a402301c9c8fa9a5262d6d29b2ea199ff0dc07a:

  distro/package_regex.inc: Use GNOME_STABLE rule for vala (2015-07-02 23:08:41 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/update-gtk3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-gtk3

Jussi Kukkonen (7):
  intltool: Upgrade 0.50.2 -> 0.51.0
  gtk-icon-utils: Rename, upgrade, add binary
  adwaita-icon-theme: Add new icon theme for GTK+
  gtk+3: Upgrade to 3.16.4
  matchbox-session-sato: set GTK_CSD env var
  sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
  midori: Depend on Adwaita, not gnome-icon-theme

 meta-yocto/conf/distro/include/distro_alias.inc    |   2 +-
 meta-yocto/conf/distro/include/maintainers.inc     |   2 +-
 meta/classes/gtk-icon-cache.bbclass                |   2 +-
 meta/classes/sstate.bbclass                        |   2 +-
 .../intltool/intltool-0.50.2/uclibc.patch          |  19 ---
 .../intltool-nowarn.patch                          |   0
 .../noperlcheck.patch                              |   0
 .../remove-xml-check.patch                         |   0
 .../use-nativeperl.patch                           |   0
 .../{intltool_0.50.2.bb => intltool_0.51.0.bb}     |   5 +-
 .../Create-symlinks-when-installing-cursors.patch  | 178 +++++++++++++++++++++
 .../gnome/adwaita-icon-theme_3.16.2.1.bb           |  34 ++++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  17 +-
 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 ++++++++++++++
 .../gtk+/gtk+3/fix-flags-for-native.patch          |  33 ----
 .../gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.4.bb}      |   6 +-
 .../gtk+/gtk-icon-utils-native_3.16.4.bb           |  63 ++++++++
 ...k-dependency-from-gtk-encode-symbolic-svg.patch | 102 ++++++++++++
 .../gtk+/gtk-update-icon-cache-native_3.4.4.bb     |  47 ------
 .../matchbox-sato/matchbox-session-sato/session    |   4 +
 meta/recipes-sato/midori/midori_0.5.8.bb           |   2 +-
 .../0001-Inherit-the-GNOME-icon-theme.patch        |   2 +-
 22 files changed, 519 insertions(+), 119 deletions(-)
 delete mode 100644 meta/recipes-devtools/intltool/intltool-0.50.2/uclibc.patch
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/intltool-nowarn.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/noperlcheck.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/remove-xml-check.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool-0.50.2 => intltool}/use-nativeperl.patch (100%)
 rename meta/recipes-devtools/intltool/{intltool_0.50.2.bb => intltool_0.51.0.bb} (76%)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.4.bb} (75%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils-native_3.16.4.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk-icon-utils/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache-native_3.4.4.bb

-- 
2.1.4


