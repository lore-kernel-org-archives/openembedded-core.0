Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 553C778670
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Nov 2017 12:02:41 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Nov 2017 04:02:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,409,1505804400"; 
   d="scan'208";a="3341741"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga003.jf.intel.com with ESMTP; 17 Nov 2017 04:02:42 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Nov 2017 14:02:45 +0200
Message-Id: <cover.1510920094.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH 0/9] Introduce meson build system
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
X-List-Received-Date: Fri, 17 Nov 2017 12:02:42 -0000

This patch series introduces meson recipe and class (that recipes
should inherit in order to be built with meson).

It also converts a few recipes from autotools to meson to establish
that things basically work. Note that I haven't tackled the bigger
items: gstreamer family of recipes, systed and gdk-pixbuf. I'd like
to request that maintainers of these recipes start looking into
the conversion, based on this patchset.

The following changes since commit 4ed19ac8c19afd56d445d84e02b622cb056b8359:

  poky: Switch to post release name/version (2017-11-14 17:26:58 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/meson
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/meson

Alexander Kanavin (6):
  meson: add a recipe and class from meta-oe
  gnomebase.bbclass: split into autotools and meson versions
  json-glib: convert to meson build
  libepoxy: convert to meson build
  libinput: convert to meson build
  sysprof: convert to meson build

Jussi Kukkonen (1):
  gst-player: Upgrade, rename to gst-examples

Martin Kelly (1):
  meson: export native env only for native build

Ricardo Ribalda Delgado (1):
  meson: Port pkgconfig-native patch to 0.43.0

 meta/classes/gnomebase-meson.bbclass               |   1 +
 meta/classes/gnomebase-nobuildsystem.bbclass       |  27 +++++
 meta/classes/gnomebase.bbclass                     |  30 +-----
 meta/classes/meson.bbclass                         | 112 ++++++++++++++++++++
 .../packagegroup-core-tools-testapps.bb            |   2 +-
 ...s-move-cross_args-in-front-of-output_args.patch |  30 ++++++
 ...ix-issues-that-arise-when-cross-compiling.patch | 113 +++++++++++++++++++++
 ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
 .../meson/meson/0003-native_bindir.patch           |  95 +++++++++++++++++
 meta/recipes-devtools/meson/meson_0.43.0.bb        |  21 ++++
 ...ble-gobject-introspection-when-cross-comp.patch |  32 ++++++
 meta/recipes-gnome/json-glib/json-glib_1.2.8.bb    |  23 ++++-
 ...sible-to-disable-the-use-of-dlvsym-needed.patch |  55 ++++++++++
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |  12 ++-
 .../0001-Fix-meson-options-default-values.patch    |  50 +++++++++
 meta/recipes-graphics/wayland/libinput_1.8.3.bb    |  13 +--
 .../sysprof/files/0001-Avoid-building-docs.patch   |  42 --------
 .../0001-Disable-check-for-polkit-for-UI.patch     |  32 ------
 ...d-anything-in-help-as-it-requires-itstool.patch |  26 +++++
 ...igure-Add-option-to-enable-disable-polkit.patch |  41 --------
 meta/recipes-kernel/sysprof/sysprof_3.26.1.bb      |  23 ++---
 .../0001-Make-player-examples-installable.patch    |  39 +++++++
 .../gst-player.desktop                             |   0
 .../{gst-player_git.bb => gst-examples_git.bb}     |  18 ++--
 .../packagegroups/packagegroup-core-x11-sato.bb    |   2 +-
 25 files changed, 700 insertions(+), 180 deletions(-)
 create mode 100644 meta/classes/gnomebase-meson.bbclass
 create mode 100644 meta/classes/gnomebase-nobuildsystem.bbclass
 create mode 100644 meta/classes/meson.bbclass
 create mode 100644 meta/recipes-devtools/meson/meson/0001-Linker-rules-move-cross_args-in-front-of-output_args.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0003-native_bindir.patch
 create mode 100644 meta/recipes-devtools/meson/meson_0.43.0.bb
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
 create mode 100644 meta/recipes-graphics/libepoxy/libepoxy/0001-Make-it-possible-to-disable-the-use-of-dlvsym-needed.patch
 create mode 100644 meta/recipes-graphics/wayland/libinput/0001-Fix-meson-options-default-values.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gst-examples/0001-Make-player-examples-installable.patch
 rename meta/recipes-multimedia/gstreamer/{gst-player => gst-examples}/gst-player.desktop (100%)
 rename meta/recipes-multimedia/gstreamer/{gst-player_git.bb => gst-examples_git.bb} (65%)

-- 
2.15.0


