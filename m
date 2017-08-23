Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 15B5B7829F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 17:09:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Aug 2017 10:09:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,417,1498546800"; d="scan'208";a="1187402115"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga001.fm.intel.com with ESMTP; 23 Aug 2017 10:09:31 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Aug 2017 20:06:18 +0300
Message-Id: <cover.1503507784.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.14.1
Subject: [PATCH 0/7] Introduce meson build system
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
X-List-Received-Date: Wed, 23 Aug 2017 17:09:31 -0000

This patch series introduces meson recipe and class (that recipes
should inherit in order to be built with meson).

It also converts a few recipes from autotools to meson to establish
that things basically work. Note that I haven't tackled the bigger
items: gstreamer family of recipes, systed and gdk-pixbuf. I'd like
to request that maintainers of these recipes start looking into
the conversion, based on this patchset.

I also didn't test this super-well; there might well be corner cases
where things break down.

The following changes since commit 5f6945f5031e1a4ca116cc1eccf4c2f9dc228547:

  buildhistory.bbclass: add ptest (2017-08-23 14:16:01 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/meson
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/meson

Alexander Kanavin (7):
  meson: add a recipe and class from meta-oe
  gnomebase.bbclass: split into autotools and meson versions
  gtk-doc.bbclass: add all directories where .so files are found to
    library search path
  json-glib: convert to meson build
  libepoxy: convert to meson build
  libinput: convert to meson build
  sysprof: convert to meson build

 meta/classes/gnomebase-meson.bbclass               |   1 +
 meta/classes/gnomebase-nobuildsystem.bbclass       |  27 +++++
 meta/classes/gnomebase.bbclass                     |  30 +-----
 meta/classes/gtk-doc.bbclass                       |   1 +
 meta/classes/meson.bbclass                         | 103 +++++++++++++++++++
 ...ix-issues-that-arise-when-cross-compiling.patch | 113 +++++++++++++++++++++
 ...rospection-determine-g-ir-scanner-and-g-i.patch |  41 ++++++++
 meta/recipes-devtools/meson/meson_0.42.0.bb        |  18 ++++
 ...ble-gobject-introspection-when-cross-comp.patch |  32 ++++++
 meta/recipes-gnome/json-glib/json-glib_1.2.8.bb    |  23 ++++-
 meta/recipes-graphics/libepoxy/libepoxy_1.4.3.bb   |   6 +-
 .../0001-tools-Fix-race-in-autotools-install.patch |  37 -------
 meta/recipes-graphics/wayland/libinput_1.8.1.bb    |  10 +-
 .../sysprof/files/0001-Avoid-building-docs.patch   |  42 --------
 .../0001-Disable-check-for-polkit-for-UI.patch     |  32 ------
 ...d-anything-in-help-as-it-requires-itstool.patch |  26 +++++
 ...igure-Add-option-to-enable-disable-polkit.patch |  41 --------
 ...-not-prepend-the-current-dir-path-to-util.patch |  30 ++++++
 meta/recipes-kernel/sysprof/sysprof_3.24.1.bb      |  22 ++--
 19 files changed, 433 insertions(+), 202 deletions(-)
 create mode 100644 meta/classes/gnomebase-meson.bbclass
 create mode 100644 meta/classes/gnomebase-nobuildsystem.bbclass
 create mode 100644 meta/classes/meson.bbclass
 create mode 100644 meta/recipes-devtools/meson/meson/0001-gtkdoc-fix-issues-that-arise-when-cross-compiling.patch
 create mode 100644 meta/recipes-devtools/meson/meson/0002-gobject-introspection-determine-g-ir-scanner-and-g-i.patch
 create mode 100644 meta/recipes-devtools/meson/meson_0.42.0.bb
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-Do-not-disable-gobject-introspection-when-cross-comp.patch
 delete mode 100644 meta/recipes-graphics/wayland/libinput/0001-tools-Fix-race-in-autotools-install.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Do-not-build-anything-in-help-as-it-requires-itstool.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/0001-configure-Add-option-to-enable-disable-polkit.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0002-Do-not-prepend-the-current-dir-path-to-util.patch

-- 
2.14.1


