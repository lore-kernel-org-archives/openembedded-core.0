Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 4945A6FF56
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Mar 2016 15:06:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 09 Mar 2016 07:06:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,311,1455004800"; d="scan'208";a="933083517"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 09 Mar 2016 07:06:14 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Mar 2016 17:01:46 +0200
Message-Id: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.7.0
Subject: [PATCH 00/24] Add gobject introspection support to oe-core
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
X-List-Received-Date: Wed, 09 Mar 2016 15:06:51 -0000

0. Changelog

09 Mar 2016
- a lot of fixes based on review comments and autobuilder runs
- moved 'gobject-introspection-data' from DISTRO_FEATURES_DEFAULT
to DISTRO/MACHINE_FEATURES_BACKFILL
- gnombase.bbclass no longer enables gobject-introspection by default,
any gnome-related package should enable it individually.
- a complementary patchset for meta-oe has been developed:
http://cgit.openembedded.org/meta-openembedded-contrib/log/?h=akanavin/gobject-introspection-fixes

26 Nov 2015
- added a DISTRO_FEATURE that makes it possible to skip generation
of introspection data, and therefore avoid running qemu
- rebased the patchset to latest oe-core master
- updated gobject-introspection and pygobject recipes to latest
upstream versions

9 Nov 2015
- initial version

1. Introduction

This patchset adds support for gobject introspection to oe-core.

Gir files go to -dev packages, typelib files go to main packages
(they are packaged together with libraries that are introspected)

The work is based on a meta-gir layer, which was used as a proof of
concept; overall approach is same and some implementation ideas were
used, but this implementation is otherwise different, and hopefully
simpler and cleaner.

Generation of introspection data (.gir and typelib files) is done by
running target architecture binaries through qemu. This may not work
for all architectures/machines, so when it doesn't work, it can be
disabled distro-wide by adding 'gobject-introspection-data' to
DISTRO_FEATURES_BACKFILL_CONSIDERED or only for a specific machine by
adding the same string to MACHINE_FEATURES_BACKFILL_CONSIDERED. In this
case, introspection data can be obtained through other means (for
example, by copying the data from a suitable sysroot, or generating
it on the target hardware).

2. 30 second tutorial for adding introspection support to a package:

a. Inherit gobject-introspection class (or a class that inherits it,
such as gnome-base).

b. Make sure introspection is not disabled anywhere in the recipe or
its includes. Also, make sure that 'gobject-introspection-data' is neither in
DISTRO_FEATURES_BACKFILL_CONSIDERED nor in MACHINE_FEATURES_BACKFILL_CONSIDERED,
or nothing will happen.

c. Try to build the recipe; if this results in build errors that look
like something is unable to find .so libraries, check where these libraries
are in the source tree and add GIR_EXTRA_LIBS_PATH=${B}/something/.libs
to the recipe.

c. Any other errors probably mean that introspection support in a package
is not entirely standard, and breaks down in a cross-compilation environment.
Custom-made fixing is needed then.


3. How to verify that introspection works in an image:

a. Make sure that 'gobject-introspection-data' is not in
DISTRO_FEATURES_BACKFILL_CONSIDERED or MACHINE_FEATURES_BACKFILL_CONSIDERED.

b. Build core-image-sato.

c. Start terminal, start python3 in the terminal.

d. Type out something like:

>>> from gi.repository import GLib
>>> GLib.get_host_name()

e. Also, try something more advanced, for example:
http://python-gtk-3-tutorial.readthedocs.org/en/latest/introduction.html


4. Request for testing - I would like this patchset to be checked on three
levels:

a. Test it in all of the build environments you have. Let me know any errors
or warnings. Also let me know, if some package can be built with introspection
enabled, but is not.

b. Check the patchset for correct use of Yocto idioms. It touches a lot of things
in a lot of different ways, and maybe there are better ways to do what it does.

c. Check that the overall design is sensible: how things work is hopefully
explained in comments and commit messages.


5. Known issues:

- qemu-ppc64 crashes out immediately; so introspection data
cannot be built on that architecture:
Invalid data memory access: 0x00000040d89c5008
...

- x32 is not supported by qemu; therefore introspection data is disabled there.

- musl is causing transient glib binaries to crash on assertion failures,
so generating introspection data is disabled there as well

- there are sporadic qemu crashes when building for ppc32 and mips32 architectures,
these haven't yet been investigated

- gcr introspection is disabled in x86_64, because introspection helper binary
goes into an infinite loop under qemu (on that architecture only).

- gcr and libsecret introspection is disabled in mips64, because introspection helper
binary fails an assertion in libgpg-error

- webkit introspection is disabled in powerpc, because qemu-ppc crashes out when
running g-ir-compiler

- the whole thing should be documented in Yocto manuals

The following changes since commit 5ac3dc76a5afc2ed35b1abfc8e330e0c580eadf0:

  image.bbclass: fix incomplete .rootfs customization (2016-03-07 22:10:54 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/gobject-introspection-experimental
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/gobject-introspection-experimental

Alexander Kanavin (23):
  qemu.bbclass: add qemu_wrapper_cmdline()
  python3-native: use the previous version of python-config script
  python3: fix patching get_python_lib() in distutils/sysconfig.py
  gobject-introspection: add the recipe
  gtk-doc-stub: remove introspection stubs
  gobject-introspection.bbclass: add a class that enables gobject
    introspection
  vala: enable the use of vapigen by packages with vala support
  vala.bbclass: remove pre-packaged vapigen.m4 from tarballs
  avahi-ui: remove the dependency on python-pygtk by disabling
    avahi-discover
  python-pygtk: remove the recipe
  avahi: enable gobject-introspection
  gtk+: enable gobject introspection
  gtk+3: enable gobject-introspection
  clutter: enable gobject introspection
  libsoup-2.4: enable gobject introspection
  gstreamer: enable gobject introspection
  gnomebase.bbclass: do not disable gobject introspection
  python-pygobject: update to 3.18.2
  recipes-gnome: fix introspection support
  webkitgtk: enable gobject introspection
  packagegroup-core-x11-sato: add python-pygobject and gtk+3
  bitbake.conf: add 'gobject-introspection-data' to
    DISTRO/MACHINE_FEATURES_BACKFILL
  musl: disable building of gobject introspection data

Richard Purdie (1):
  machine/include/arch-x86: Make x32 ABI not supporting
    gobject-introspection-data

 meta/classes/gnomebase.bbclass                     |   3 -
 meta/classes/gobject-introspection.bbclass         |  39 +++
 meta/classes/qemu.bbclass                          |  23 +-
 meta/classes/vala.bbclass                          |   6 +
 meta/conf/bitbake.conf                             |   4 +-
 meta/conf/distro/include/distro_alias.inc          |   1 -
 meta/conf/distro/include/tclibc-musl.inc           |   4 +
 meta/conf/machine/include/x86/arch-x86.inc         |   2 +
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |  16 +-
 meta/recipes-connectivity/avahi/avahi.inc          |  15 +-
 .../packagegroups/packagegroup-self-hosted.bb      |   1 -
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch |  41 +++
 .../obsolete_automake_macros.patch                 |  23 --
 .../python/python-pygobject_2.28.3.bb              |  53 ----
 .../python/python-pygobject_3.18.2.bb              |  25 ++
 .../python/python-pygtk/acinclude.m4               |  90 ------
 .../add-gtk-types.defs-into-gdk.c-dependence.patch |  32 ---
 .../python/python-pygtk/fix-gtkunixprint.patch     |  20 --
 .../python/python-pygtk/fix-pygtk-2.0.pc.patch     |  13 -
 .../python/python-pygtk/nodocs.patch               |  15 -
 .../prevent_to_get_display_during_import.patch     |  16 --
 .../python/python-pygtk/python-pygtk2/acinclude.m4 |  90 ------
 .../update-dependences-of-defs.c.patch             |  38 ---
 .../recipes-devtools/python/python-pygtk_2.24.0.bb |  55 ----
 .../python/python3-native_3.5.1.bb                 |   1 +
 ...the-shell-version-of-python-config-that-w.patch |  38 +++
 ...2-distutils-prefix-is-inside-staging-area.patch |  35 ++-
 meta/recipes-devtools/vala/vala.inc                |  34 +++
 ...001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch |  38 +++
 meta/recipes-devtools/vala/vala_0.30.1.bb          |   4 +-
 meta/recipes-gnome/gcr/gcr_3.18.0.bb               |  22 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.32.3.bb |   7 +-
 .../gnome-desktop/gnome-desktop3_3.18.2.bb         |   2 +-
 meta/recipes-gnome/gnome/gconf_3.2.6.bb            |   6 +-
 ...config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch |  97 +++++++
 ...c-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch | 204 ++++++++++++++
 ...01-giscanner-add-a-use-ldd-wrapper-option.patch |  48 ++++
 ...1-giscanner-add-use-binary-wrapper-option.patch |  52 ++++
 .../gobject-introspection_1.46.0.bb                | 159 +++++++++++
 .../gsettings-desktop-schemas_3.19.3.bb            |   4 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   9 +-
 meta/recipes-gnome/gtk+/gtk+3.inc                  |  10 +-
 ...t-Import-introspection-stub-machinery-too.patch | 305 +++++++++++++++++++++
 .../recipes-gnome/gtk-doc-stub/gtk-doc-stub_git.bb |   6 +-
 meta/recipes-gnome/json-glib/json-glib_1.0.4.bb    |   2 +-
 meta/recipes-gnome/libgudev/libgudev_230.bb        |   2 +-
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb    |   2 +-
 meta/recipes-gnome/librsvg/librsvg_2.40.13.bb      |   5 +-
 meta/recipes-gnome/libsecret/libsecret_0.18.4.bb   |  14 +-
 meta/recipes-gnome/libwnck/libwnck3_3.14.1.bb      |   4 +-
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   5 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   4 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   3 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   8 +-
 meta/recipes-graphics/mx/mx.inc                    |   5 +-
 ...op-introspection-macros-from-acinclude.m4.patch | 121 ++++++++
 meta/recipes-graphics/pango/pango_1.38.1.bb        |  10 +-
 ...on.m4-prefix-pkgconfig-paths-with-PKG_CON.patch |  42 +++
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   2 +-
 .../gstreamer/gst-plugins-package.inc              |   1 +
 ...-don-t-hardcode-libtool-name-when-running.patch |  57 ++++
 .../gstreamer/gstreamer1.0-plugins-bad_1.6.3.bb    |   1 +
 .../gstreamer/gstreamer1.0-plugins-base.inc        |   4 +
 ...-don-t-hardcode-libtool-name-when-running.patch | 168 ++++++++++++
 ...-prefix-calls-to-pkg-config-with-PKG_CONF.patch | 298 ++++++++++++++++++++
 ...ssing-include-directories-when-calling-in.patch |  28 ++
 ...ncorrect-reference-to-gstreamer-sdp-in-Ma.patch |  27 ++
 .../gstreamer/gstreamer1.0-plugins-base_1.6.3.bb   |   4 +
 .../gstreamer/gstreamer1.0-plugins.inc             |  11 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |  14 +-
 ...ode-libtool-name-when-using-introspection.patch |  27 ++
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |  13 +-
 .../gstreamer/gstreamer1.0_1.6.3.bb                |   1 +
 .../packagegroups/packagegroup-core-x11-sato.bb    |   2 +
 ...Introspection.cmake-prefix-variables-obta.patch |  27 ++
 ...cmake-drop-the-hardcoded-introspection-gt.patch |  35 +++
 ...ng-introspection-files-add-CMAKE_C_FLAGS-.patch |  40 +++
 meta/recipes-sato/webkit/webkitgtk_2.10.7.bb       |  14 +-
 meta/recipes-support/atk/at-spi2-core_2.18.3.bb    |   4 +-
 meta/recipes-support/atk/atk_2.18.0.bb             |   4 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.52.2.bb |   2 +-
 meta/recipes-support/vte/vte.inc                   |   6 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |   3 +-
 83 files changed, 2170 insertions(+), 556 deletions(-)
 create mode 100644 meta/classes/gobject-introspection.bbclass
 create mode 100644 meta/recipes-devtools/python/python-pygobject/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygobject/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygobject_2.28.3.bb
 create mode 100644 meta/recipes-devtools/python/python-pygobject_3.18.2.bb
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/acinclude.m4
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/add-gtk-types.defs-into-gdk.c-dependence.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-gtkunixprint.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/fix-pygtk-2.0.pc.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/nodocs.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/prevent_to_get_display_during_import.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/python-pygtk2/acinclude.m4
 delete mode 100644 meta/recipes-devtools/python/python-pygtk/update-dependences-of-defs.c.patch
 delete mode 100644 meta/recipes-devtools/python/python-pygtk_2.24.0.bb
 create mode 100644 meta/recipes-devtools/python/python3/0001-Do-not-use-the-shell-version-of-python-config-that-w.patch
 create mode 100644 meta/recipes-devtools/vala/vala/0001-vapigen.m4-use-PKG_CONFIG_SYSROOT_DIR.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-Prefix-pkg-config-paths-with-PKG_CONFIG_SYSROOT_DIR-.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-add-host-gi-gi-cross-wrapper-and-gi-ldd.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-a-use-ldd-wrapper-option.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-giscanner-add-use-binary-wrapper-option.patch
 create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection_1.46.0.bb
 create mode 100644 meta/recipes-gnome/gtk-doc-stub/files/0001-Revert-Import-introspection-stub-machinery-too.patch
 create mode 100644 meta/recipes-graphics/pango/pango/0001-Drop-introspection-macros-from-acinclude.m4.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/files/0001-introspection.m4-prefix-pkgconfig-paths-with-PKG_CON.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0001-Makefile.am-don-t-hardcode-libtool-name-when-running.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0002-Makefile.am-prefix-calls-to-pkg-config-with-PKG_CONF.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0003-riff-add-missing-include-directories-when-calling-in.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/0004-rtsp-drop-incorrect-reference-to-gstreamer-sdp-in-Ma.patch
 create mode 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-rtsp-server/0001-Don-t-hardcode-libtool-name-when-using-introspection.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-FindGObjectIntrospection.cmake-prefix-variables-obta.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-OptionsGTK.cmake-drop-the-hardcoded-introspection-gt.patch
 create mode 100644 meta/recipes-sato/webkit/files/0001-When-building-introspection-files-add-CMAKE_C_FLAGS-.patch

-- 
2.7.0


