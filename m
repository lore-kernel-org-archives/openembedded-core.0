Return-Path: <jussi.kukkonen@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 14F0660107
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:14:34 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga102.fm.intel.com with ESMTP; 14 Jun 2016 01:14:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,470,1459839600"; d="scan'208";a="121489532"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga004.fm.intel.com with ESMTP; 14 Jun 2016 01:14:34 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jun 2016 11:14:18 +0300
Message-Id: <cover.1465891164.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv3 00/30] Port Sato to Gtk+3
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
X-List-Received-Date: Tue, 14 Jun 2016 08:14:35 -0000

Latest version of Sato-gtk3 branch. The main problem is with vte
and I'd appreciate input on that: First, it fails to link with
"-pie -fpie". I've added a workaround (see below) but on musl vte
still fails at runtime because /lib/gcc_s.so.1 seems to be missing
symbols?
    # ldd /lib/libgcc_s.so.1 
    ...
    Error relocating /lib/libgcc_s.so.1: __cpu_indicator_init: symbol not found
    Error relocating /lib/libgcc_s.so.1: __cpu_model: symbol not found
Is this a gcc bug?


Changes since v2:
* Rebased
* avahi-ui: Make sure GtkBuilder ui files are installed with GTK+3
* sysprof: Add patch to fix "cast to pointer from integer of
  different size" (on 32bit)
* sysprof: Forward port memory barrier patches for arm & mips
* sysprof: Avoid Werror by setting "--enable-compile-warnings"
* matchbox-desktop: Don't use "install -D --target-directory":
  some versions of install do not like it
* vte: Add SECURITY_NO_PIE_CFLAGS as workaround to avoid linking
  failure in libc_nonshared.a: "undefined reference to 
  __init_array_start" when building with security_flags.inc
* gnome-themes-standard: Add distro feature check


Changes since v1:
* vte: disable vala if gobject-introspection is disabled. This
  fixes build on musl.
* matchbox-desktop: combine the configuration from
  matchbox-desktop-sato into matchbox-desktop recipe
* connman-gnome: Squash two patches that were not supposed to
  be separate


Issues:
* vte link failure worked around with SECURITY_NO_PIE_CFLAGS
* vte on musl fails to work, see discussion above

Original cover letter is included below.

Thanks, 
  Jussi




This patchset updates Sato desktop to Gtk+3. This means some work
on matchbox-* components maintained on yp.org, quite a bit of
integration work, and changes to other recipes to build with Gtk+3
instead of Gtk+2. It's not visually amazing but works in my tests
so I think it's time to get it to master so others can start
improving/complaining on the work so far.


Main changes:
 * Separate panel and window title bars: The combo was clever
   but does not work with client side window decorations.
 * No more green: The Gtk+ theme is Adwaita (upstream default) and
   the window manager theme tries to work with that.
 * gtk+ is no longer part of core-image-sato, gtk+3 is.
 * matchbox-desktop-2 had major refactoring, should function the same
 * Image size seems to increase 3-4% (would have increased more but
   icon packages were split).
 * Leafpad editor was replaced with L3afpad, a GTK+3 fork.
   Suggestions for a better alternative are welcome.

Related To-Do list:
 * Desktop styling could use some work (e.g. panel should probably
   be more distinguishable from the desktop)
 * GTK+3 depends on libepoxy which depends on virtual/egl, there's
   no runtime dependency though (#8643)
 * gst-plugins-bad and gst-player should be updated (#9715)
 * connman-gnome should be replaced at some point (#8606)
 * gtk-engines should be moved to meta-gnome (will send a patch)


The following changes since commit a1a0ce1a0064e29159555011ebd667192132e0ce:

  scripts/lib/bsp/engine.py: Added missing parentheses to string formatting (2016-06-12 23:47:19 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/sato-gtk3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/sato-gtk3

Jussi Kukkonen (28):
  matchbox-theme-sato: Upgrade to 0.2
  matchbox-desktop: Ugrade to 2.1
  matchbox-panel-2: Upgrade to 2.10
  sato-screenshot: Upgrade to 0.2
  settings-daemon: Upgrade to 0.0.2
  matchbox-wm: Upgrade to 1.2.1
  connman-gnome: Add patch to port to Gtk+3
  matchbox-keyboard: Enable GTK+3 IM module
  packagegroup-core-x11: Use adwaita icons instead of sato
  vte: Upgrade to 0.44.1
  matchbox-terminal: Upgrade to 0.1
  puzzles: Use Gtk+3 by default
  gst-player: Start building with Gtk+3
  matchbox-config-gtk: Upgrade to 0.2
  leafpad: Replace with L3afpad
  libowl: Remove as unused
  packagegroup-core-x11-sato: Remove gtk-sato-engine
  gtk+: RRECOMMEND adwaita theme
  webkitgtk: Disable Gtk2 plugin process by default
  avahi-ui: Build with Gtk+3
  sysprof: Upgrade to git version slightly past 3.20
  matchbox-session-sato: Update session startup
  matchbox-desktop: Add Sato folder configuration
  packagegroup-self-hosted: Remove unused theme, use Adwaita icons
  gtk-sato-engine: Remove as unused
  sato-icon-theme: remove as unused
  gtk-engines: Remove as unused
  gnome-themes-standard: Use distro_features_check for GTK+2

Maxin B. John (2):
  pcmanfm: switch to GTK3 version
  libfm: switch to GTK3 version

 meta/conf/distro/include/security_flags.inc        |   2 +
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |  11 +-
 ...c-install-GtkBuilder-interface-files-for-.patch |  28 +++
 .../connman/connman-gnome/0001-Port-to-Gtk3.patch  | 277 +++++++++++++++++++++
 .../connman/connman-gnome_0.7.bb                   |   5 +-
 .../packagegroups/packagegroup-self-hosted.bb      |   6 +-
 .../gnome/gnome-themes-standard_3.18.0.bb          |   4 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   9 +-
 .../gtk-engines/gtk-engines-2.20.2/glib-2.32.patch |  23 --
 .../gtk-engines-2.20.2/substitute-tests.patch      |  37 ---
 .../gtk-engines/gtk-engines_2.20.2.bb              |  55 ----
 .../builder/files/builder_session.sh               |   4 +-
 .../{matchbox-wm_git.bb => matchbox-wm_1.2.1.bb}   |   5 +-
 .../sysprof/files/0001-Avoid-building-docs.patch   |  42 ++++
 .../0001-Disable-check-for-polkit-for-UI.patch     |  32 +++
 ...ward-port-mips-arm-memory-barrier-patches.patch |  38 +++
 .../files/0001-callgraph-Use-U64_TO_POINTER.patch  |  29 +++
 .../sysprof/files/define-NT_GNU_BUILD_ID.patch     |   4 +-
 .../sysprof/files/gui-argument.patch               |  35 ---
 meta/recipes-kernel/sysprof/files/rmb-arm.patch    |  21 --
 meta/recipes-kernel/sysprof/files/rmb-mips.patch   |  22 --
 meta/recipes-kernel/sysprof/sysprof_git.bb         |  34 +--
 .../gstreamer/gst-player/gst-player.desktop        |   2 +-
 .../gstreamer/gst-player/gtk2.patch                |  71 ------
 .../recipes-multimedia/gstreamer/gst-player_git.bb |   5 +-
 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc  |  25 --
 .../gtk-engines/gtk-sato-engine_git.bb             |  14 --
 meta/recipes-sato/l3afpad/l3afpad_git.bb           |  23 ++
 meta/recipes-sato/leafpad/files/leafpad.desktop    |  10 -
 meta/recipes-sato/leafpad/files/owl-menu.patch     |  63 -----
 ...gtkprint-.c-Fix-security-formatting-issue.patch |  81 ------
 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb      |  37 ---
 meta/recipes-sato/libowl/libowl_git.bb             |  23 --
 .../matchbox-config-gtk/files/no-handed.patch      |  26 +-
 ...onfig-gtk_git.bb => matchbox-config-gtk_0.2.bb} |  11 +-
 .../matchbox-desktop-sato_git.bb                   |  22 --
 .../matchbox-desktop/files/vfolders/All.directory  |   5 +
 .../files/vfolders/Applications.directory          |   6 +
 .../files/vfolders/Games.directory                 |   9 +
 .../matchbox-desktop/files/vfolders/Root.order     |   4 +
 .../files/vfolders/Settings.directory              |   8 +
 ...hbox-desktop_git.bb => matchbox-desktop_2.1.bb} |  16 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |   6 +-
 .../matchbox-panel-2/files/silence-warnings.patch  |  64 -----
 ...box-panel-2_git.bb => matchbox-panel-2_2.10.bb} |  15 +-
 .../matchbox-session-sato/index.theme              |   7 +
 .../matchbox-sato/matchbox-session-sato/session    |   9 +-
 .../matchbox-sato/matchbox-session-sato_0.1.bb     |  11 +-
 ...ox-terminal_git.bb => matchbox-terminal_0.1.bb} |   8 +-
 .../matchbox-theme-sato/matchbox-theme-sato_0.1.bb |   8 -
 .../matchbox-theme-sato/matchbox-theme-sato_0.2.bb |   7 +
 .../matchbox-theme-sato/matchbox-theme-sato_git.bb |  12 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |   5 +-
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.4.bb         |   5 +-
 meta/recipes-sato/puzzles/puzzles_git.bb           |  18 +-
 .../0001-Inherit-the-GNOME-icon-theme.patch        |  31 ---
 .../sato-icon-theme/sato-icon-theme_0.4.1.bb       |  40 ---
 ...to-screenshot_git.bb => sato-screenshot_0.2.bb} |   7 +-
 .../files/dso_linking_change_build_fix.patch       |  31 ---
 ...ings-daemon_git.bb => settings-daemon_0.0.2.bb} |   9 +-
 meta/recipes-sato/webkit/webkitgtk_2.12.3.bb       |   1 -
 meta/recipes-support/libfm/libfm_1.2.4.bb          |   6 +-
 .../vte/vte-0.28.2/cve-2012-2738.patch             | 136 ----------
 .../vte/vte-0.28.2/obsolete_automake_macros.patch  |  14 --
 meta/recipes-support/vte/vte.inc                   |  15 --
 ...-Don-t-enable-stack-protection-by-default.patch |  29 +++
 meta/recipes-support/vte/vte_0.28.2.bb             |  16 --
 meta/recipes-support/vte/vte_0.44.1.bb             |  24 ++
 68 files changed, 708 insertions(+), 1010 deletions(-)
 create mode 100644 meta/recipes-connectivity/avahi/files/0001-configure.ac-install-GtkBuilder-interface-files-for-.patch
 create mode 100644 meta/recipes-connectivity/connman/connman-gnome/0001-Port-to-Gtk3.patch
 delete mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/glib-2.32.patch
 delete mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines-2.20.2/substitute-tests.patch
 delete mode 100644 meta/recipes-gnome/gtk-engines/gtk-engines_2.20.2.bb
 rename meta/recipes-graphics/matchbox-wm/{matchbox-wm_git.bb => matchbox-wm_1.2.1.bb} (94%)
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Avoid-building-docs.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Disable-check-for-polkit-for-UI.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-Forward-port-mips-arm-memory-barrier-patches.patch
 create mode 100644 meta/recipes-kernel/sysprof/files/0001-callgraph-Use-U64_TO_POINTER.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/gui-argument.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-arm.patch
 delete mode 100644 meta/recipes-kernel/sysprof/files/rmb-mips.patch
 delete mode 100644 meta/recipes-multimedia/gstreamer/gst-player/gtk2.patch
 delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine.inc
 delete mode 100644 meta/recipes-sato/gtk-engines/gtk-sato-engine_git.bb
 create mode 100644 meta/recipes-sato/l3afpad/l3afpad_git.bb
 delete mode 100644 meta/recipes-sato/leafpad/files/leafpad.desktop
 delete mode 100644 meta/recipes-sato/leafpad/files/owl-menu.patch
 delete mode 100644 meta/recipes-sato/leafpad/files/src-dialog-gtkprint-.c-Fix-security-formatting-issue.patch
 delete mode 100644 meta/recipes-sato/leafpad/leafpad_0.8.18.1.bb
 delete mode 100644 meta/recipes-sato/libowl/libowl_git.bb
 rename meta/recipes-sato/matchbox-config-gtk/{matchbox-config-gtk_git.bb => matchbox-config-gtk_0.2.bb} (80%)
 delete mode 100644 meta/recipes-sato/matchbox-desktop-sato/matchbox-desktop-sato_git.bb
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/All.directory
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Applications.directory
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Games.directory
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Root.order
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/vfolders/Settings.directory
 rename meta/recipes-sato/matchbox-desktop/{matchbox-desktop_git.bb => matchbox-desktop_2.1.bb} (67%)
 delete mode 100644 meta/recipes-sato/matchbox-panel-2/files/silence-warnings.patch
 rename meta/recipes-sato/matchbox-panel-2/{matchbox-panel-2_git.bb => matchbox-panel-2_2.10.bb} (74%)
 create mode 100644 meta/recipes-sato/matchbox-sato/matchbox-session-sato/index.theme
 rename meta/recipes-sato/matchbox-terminal/{matchbox-terminal_git.bb => matchbox-terminal_0.1.bb} (76%)
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.1.bb
 create mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_0.2.bb
 delete mode 100644 meta/recipes-sato/matchbox-theme-sato/matchbox-theme-sato_git.bb
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme/0001-Inherit-the-GNOME-icon-theme.patch
 delete mode 100644 meta/recipes-sato/sato-icon-theme/sato-icon-theme_0.4.1.bb
 rename meta/recipes-sato/sato-screenshot/{sato-screenshot_git.bb => sato-screenshot_0.2.bb} (86%)
 delete mode 100644 meta/recipes-sato/settings-daemon/files/dso_linking_change_build_fix.patch
 rename meta/recipes-sato/settings-daemon/{settings-daemon_git.bb => settings-daemon_0.0.2.bb} (85%)
 delete mode 100644 meta/recipes-support/vte/vte-0.28.2/cve-2012-2738.patch
 delete mode 100644 meta/recipes-support/vte/vte-0.28.2/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-support/vte/vte.inc
 create mode 100644 meta/recipes-support/vte/vte/0001-Don-t-enable-stack-protection-by-default.patch
 delete mode 100644 meta/recipes-support/vte/vte_0.28.2.bb
 create mode 100644 meta/recipes-support/vte/vte_0.44.1.bb

-- 
2.1.4


