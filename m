Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AF695755FA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 13:23:50 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga102.jf.intel.com with ESMTP; 11 Jun 2015 06:23:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,595,1427785200"; d="scan'208";a="725335533"
Received: from theory.fi.intel.com ([10.237.72.51])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jun 2015 06:23:50 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Jun 2015 16:24:09 +0300
Message-Id: <cover.1434028277.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/6] GTK+3 upgrade and related changes
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
X-List-Received-Date: Thu, 11 Jun 2015 13:23:51 -0000

Patch set upgrades GTK+3 and adds adwaita-icon-theme: Current GTK+
requires a theme with "symbolic" (single color) icons for the
widgets to look decent -- and gnome-icon-theme does not provide them.
In practice Adwaita is the successor of now unmaintained
gnome-icon-theme so dropping gnome-icon-theme at some point would
make sense.

Adwaita includes lots of symbolic svg icons: The build uses
gtk-encode-symbolic-svg at install time to convert them to png. This
means both smaller installed size and faster rendering on target but
takes a moment at install time: >2 minutes on my fairly beefy
machine.

The new symbolic icons have also increased the installed size:
    gnome-icon-theme: 14 MB
    adwaita-icon-theme: 24 MB
    adwaita-icon-theme-cursors: 12 MB
(gnome-icon-theme does not include cursors at all)


Cheers,
 Jussi


The following changes since commit 062678c4ab88fa94ed38efa6520c3b4e2d88ca73:

  sysvinit: Only enable recipe in builds where its applicable (2015-06-10 12:03:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/update-gtk3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/update-gtk3

Jussi Kukkonen (6):
  gtk+3: Upgrade to 3.16.3
  gtk-update-icon-cache-native: Upgrade, add binary
  matchbox-session-sato: set GTK_CSD env var
  adwaita-icon-theme: Add new icon theme for GTK+
  sato-icon-theme: Inherit Adwaita, not gnome-icon-theme
  midori: Depend on Adwaita, not gnome-icon-theme

 .../Create-symlinks-when-installing-cursors.patch  | 178 +++++++++++++++++++++
 .../gnome/adwaita-icon-theme_3.16.2.1.bb           |  34 ++++
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  14 +-
 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch | 118 ++++++++++++++
 .../gtk+/gtk+3/fix-flags-for-native.patch          |  33 ----
 .../gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.3.bb}      |   6 +-
 ...4.bb => gtk-update-icon-cache-native_3.16.3.bb} |  41 +++--
 ...k-dependency-from-gtk-encode-symbolic-svg.patch | 102 ++++++++++++
 .../matchbox-sato/matchbox-session-sato/session    |   4 +
 meta/recipes-sato/midori/midori_0.5.8.bb           |   2 +-
 .../0001-Inherit-the-GNOME-icon-theme.patch        |   2 +-
 11 files changed, 475 insertions(+), 59 deletions(-)
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme/Create-symlinks-when-installing-cursors.patch
 create mode 100644 meta/recipes-gnome/gnome/adwaita-icon-theme_3.16.2.1.bb
 create mode 100644 meta/recipes-gnome/gtk+/gtk+3/Dont-force-csd.patch
 delete mode 100644 meta/recipes-gnome/gtk+/gtk+3/fix-flags-for-native.patch
 rename meta/recipes-gnome/gtk+/{gtk+3_3.12.2.bb => gtk+3_3.16.3.bb} (75%)
 rename meta/recipes-gnome/gtk+/{gtk-update-icon-cache-native_3.4.4.bb => gtk-update-icon-cache-native_3.16.3.bb} (42%)
 create mode 100644 meta/recipes-gnome/gtk+/gtk-update-icon-cache/Remove-Gdk-dependency-from-gtk-encode-symbolic-svg.patch

-- 
2.1.4


