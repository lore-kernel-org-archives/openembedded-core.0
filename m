Return-Path: <maxin.john@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F385278062
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 08:34:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 Feb 2018 00:34:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,534,1511856000"; d="scan'208";a="32490144"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga001.jf.intel.com with ESMTP; 19 Feb 2018 00:34:50 -0800
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.84])
	by linux.intel.com (Postfix) with ESMTP id 44C4A58030D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Feb 2018 00:34:50 -0800 (PST)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 19 Feb 2018 10:36:51 +0200
Message-Id: <1519029438-11092-1-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
Subject: [PATCH 00/27] replace freedesktop.org pkg-config with pkgconf
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
X-List-Received-Date: Mon, 19 Feb 2018 08:34:50 -0000

Reasons behind this patch set:

1. pkgconf is actively maintained
2. pkgconf has better cross-compiling support (According to the author of
pkgconf, it was created as he got tired of patching .pc files to add ${pc_sysrootdir})
3. oe-core can drop a number of work-around patches that deals with pkg-config

pkgconf and freedesktop.org pkg-config intentionally have different behaviour
for cross-compile. So, when we use paths relative to inside the sysroot for
installation, pkgconf could break build.

example scenario where pkgconf could break build:

UDEVDIR := $(shell $(PKG_CONFIG) --variable=udevdir udev 2>/dev/null)
$(INSTALL) -D -m 644 test.rules $(DESTDIR)$(UDEVDIR)/rules.d/test.rules

here, freedesktop.org pkg-config, UDEVDIR can be:
"/usr/lib/udev"
For pkgconf, UDEVDIR can be:
"<path-to-build-dir>/tmp/work/i586-poky-linux/bluez5/5.48-r0/recipe-sysroot/lib/udev"

The right thing (TM) to do in this situation is to provide a
configuration option to override those paths. Otherwise, we can
prepend "unset PKG_CONFIG_SYSROOT_DIR" or "PKG_CONFIG_SYSROOT_DIR='/'"
to get the relative path.

We could move the freedesktop.org pkg-config recipe to meta-oe.

[YOCTO #11308]

Maxin B. John (27):
  pkgconf: upgrade to version 1.4.2
  default-providers.inc: set pkgconf as default pkg-config provider
  pkgconfig: remove from oe-core
  webkitgtk: remove PKG_CONFIG_SYSROOT_DIR work-around
  gstreamer1.0: remove PKG_CONFIG_SYSROOT_DIR work-around
  gstreamer1.0-plugins-base: remove PKG_CONFIG_SYSROOT_DIR work-around
  libxcb: remove PKG_CONFIG_SYSROOT_DIR work-around
  meson: remove PKG_CONFIG_SYSROOT_DIR work-around
  libdnf: remove PKG_CONFIG_SYSROOT_DIR work-around
  vala: remove PKG_CONFIG_SYSROOT_DIR work-around
  gobject-introspection: remove PKG_CONFIG_SYSROOT_DIR work-around
  kmod: define bashcompletiondir
  util-linux: define bashcompletiondir
  systemd: define bashcompletiondir
  libinput: fix udev path for pkgconf
  pulseaudio: fix udev path for pkgconf
  alsa-utils: fix udev path for pkgconf
  ofono: specify dbusconfdir
  connman: specify dbusconfdir
  bluez5: specify udev, dbus and systemd configurations
  xf86-input-synaptics: fix installation paths
  xf86-input-mouse: fix header-file installation path
  xf86-input-libinput: fix header-file installation path
  xf86-input-evdev: fix header-file installation path
  glib-networking: unset PKG_CONFIG_SYSROOT_DIR for relative path
  btrfs-tools: unset PKG_CONFIG_SYSROOT_DIR for relative path
  librsvg: unset PKG_CONFIG_SYSROOT_DIR for relative path

 meta/conf/distro/include/default-providers.inc     |   6 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |   8 +-
 meta/recipes-connectivity/connman/connman.inc      |   1 +
 meta/recipes-connectivity/ofono/ofono.inc          |   2 +-
 ...c-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch |  31 +++
 .../glib-networking/glib-networking_2.54.1.bb      |   2 +
 meta/recipes-core/systemd/systemd_234.bb           |   1 +
 meta/recipes-core/util-linux/util-linux.inc        |   1 +
 ...c-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch |  31 +++
 .../btrfs-tools/btrfs-tools_4.13.3.bb              |   1 +
 ...-sysroot-path-to-introspection-tools-path.patch |  36 ---
 meta/recipes-devtools/libdnf/libdnf_0.11.1.bb      |   1 -
 ...rospection-determine-g-ir-scanner-and-g-i.patch |   4 +-
 .../pkgconf/pkgconf/pkg-config-esdk.in             |   4 +-
 .../pkgconf/pkgconf/pkg-config-native.in           |   1 -
 .../pkgconf/pkgconf/pkg-config-wrapper             |   9 -
 .../pkgconf/{pkgconf_1.4.0.bb => pkgconf_1.4.2.bb} |   4 +-
 ...t.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch |  41 ---
 .../fix-glib-configure-libtool-usage.patch         |  45 ----
 .../pkgconfig/pkgconfig/pkg-config-esdk.in         |  24 --
 .../pkgconfig/pkgconfig/pkg-config-native.in       |   7 -
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |  73 -----
 ...001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch |  38 ---
 meta/recipes-devtools/vala/vala_0.38.6.bb          |   1 -
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  96 -------
 .../gobject-introspection_1.54.1.bb                |   1 -
 .../0001-configure.ac-fix-build-with-pkgconf.patch |  32 +++
 meta/recipes-gnome/librsvg/librsvg_2.40.20.bb      |   4 +-
 meta/recipes-graphics/wayland/libinput_1.9.4.bb    |   2 +-
 .../xorg-driver/xf86-input-evdev_2.10.5.bb         |   1 +
 .../xorg-driver/xf86-input-libinput_0.26.0.bb      |   2 +
 .../xorg-driver/xf86-input-mouse_1.9.2.bb          |   2 +
 .../xorg-driver/xf86-input-synaptics_1.9.0.bb      |   2 +
 .../xorg-lib/libxcb/xcbincludedir.patch            |  28 --
 meta/recipes-graphics/xorg-lib/libxcb_1.12.bb      |   1 -
 meta/recipes-kernel/kmod/kmod_git.bb               |   2 +
 meta/recipes-multimedia/alsa/alsa-utils_1.1.5.bb   |   5 +-
 ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  42 ---
 .../gstreamer/gstreamer1.0-plugins-bad_1.12.4.bb   |   1 -
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   1 -
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 ---------------------
 .../gstreamer/gstreamer1.0-plugins-base_1.12.4.bb  |   1 -
 .../gstreamer/gstreamer1.0-plugins-good_1.12.4.bb  |   1 -
 .../gstreamer/gstreamer1.0-plugins-ugly_1.12.4.bb  |   1 -
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |   1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   1 -
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |   2 +-
 ...Introspection.cmake-prefix-variables-obta.patch |  27 --
 meta/recipes-sato/webkit/webkitgtk_2.18.6.bb       |   1 -
 49 files changed, 132 insertions(+), 795 deletions(-)
 create mode 100644 meta/recipes-core/glib-networking/glib-networking/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-configure.ac-unset-PKG_CONFIG_SYSROOT_DIR-for-relati.patch
 delete mode 100644 meta/recipes-devtools/libdnf/libdnf/0002-Prefix-sysroot-path-to-introspection-tools-path.patch
 rename meta/recipes-devtools/pkgconf/{pkgconf_1.4.0.bb => pkgconf_1.4.2.bb} (95%)
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/0001-glib-gettext.m4-Update-AM_GLIB_GNU_GETTEXT-to-match-.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/fix-glib-configure-libtool-usage.patch
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-esdk.in
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig/pkg-config-native.in
 delete mode 100644 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
 delete mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
 delete mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0005-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
 create mode 100644 meta/recipes-gnome/librsvg/librsvg/0001-configure.ac-fix-build-with-pkgconf.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libxcb/xcbincludedir.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
 delete mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch

-- 
2.4.0


