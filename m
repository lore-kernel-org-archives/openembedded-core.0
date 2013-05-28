Return-Path: <sgw@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [143.182.124.37])
	by mail.openembedded.org (Postfix) with ESMTP id 6F3DF6A49C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 May 2013 23:23:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by azsmga102.ch.intel.com with ESMTP; 28 May 2013 16:23:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.87,761,1363158000"; d="scan'208";a="341629213"
Received: from unknown (HELO swold-linux.amr.corp.intel.com) ([10.255.13.104])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2013 16:23:37 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 May 2013 08:23:19 +0900
Message-Id: <cover.1369783207.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [CONSOLIDATED PULL 00/28] Updates and /run fixes
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
X-List-Received-Date: Tue, 28 May 2013 23:23:30 -0000

Richard,

Here is a batch of Updates and a couple of fixes.  The big part of 
this pull request is Jonathan's /run clean up.  There has been a 
good deal of review and testing, and should address a good cleanup
for the /run and /var situation.

Sorry for being a little slow with this due to travels.

A reminder to all, RC1 Cut off is Sunday 6/2 Midnight GMT!

Sau!


The following changes since commit 8f5bc47729edb8cb051d81e9ff1680cb8d2eca25:

  dropbear: a fix for hang in dropbearkey, built for x32 (2013-05-24 14:14:30 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Andrea Adami (1):
  cramfs: import recipe from meta-oe

Bogdan Marinescu (3):
  git: upgraded to 1.8.3
  python-dbus: upgraded to 1.2.0
  autogen-native: upgraded to 5.17.4

Ionut Radu (3):
  apt: Updated from 0.9.7.8 to 0.9.8.1
  libtasn1: Updated from 2.14 to 3.3
  settings-daemon: Update to git HEAD
    9a99528b02255450db81176abd9bbcc1dab9a4c1

Jonathan Liu (12):
  systemd: fix ordering for machineid and run-postinsts services
  findutils: backport fixes for documentation build errors
  base-files: add /run directory from FHS 3 draft specification
  systemd: do not create /var/volatile/run and /var/volatile/lock
  systemd: do not create symbolic link from /run to /var/run
  systemd: remove old /var/run workarounds
  udev: do not create /var/volatile/run in init script
  udev: do not create symbolic link from /run to /var/run
  bind: remove empty /var/run directory
  cups: remove /var/run from package as cupsd will populate it on
    startup
  resolvconf: remove /var/volatile/run/resolvconf/interface from package
  consolekit: remove /var/run from package

Marcin Juszkiewicz (1):
  binutils: add two AArch64 related backports to 2.23.2

Mark Hatle (1):
  cracklib: Allow byte order patch to work on older Linux hosts

Marko Lindqvist (5):
  harfbuzz: update to upstream version 0.9.17
  gtk+: update to upstream version 2.24.18
  curl: update to upstream version 7.30.0
  zlib: update to upstream version 1.2.8
  freetype: update to upstream version 2.4.12

Martin Jansa (1):
  libdrm: fix packaging after last upgrade

Samuli Piippo (1):
  gdb-cross-canadian: use correct exec-prefix path for python

 meta/files/fs-perms.txt                            |   5 +-
 meta/recipes-connectivity/bind/bind_9.8.1.bb       |   2 +
 .../resolvconf/resolvconf_1.72.bb                  |  22 ++-
 meta/recipes-core/base-files/base-files/fstab      |   1 +
 meta/recipes-core/base-files/base-files_3.0.14.bb  |  10 +-
 .../initscripts/initscripts-1.0/volatiles          |   7 +-
 .../systemd/systemd-compat-units/machineid.service |   2 +-
 .../systemd-compat-units/run-postinsts.service     |   2 +-
 .../systemd/systemd/00-create-volatile.conf        |   2 -
 meta/recipes-core/systemd/systemd/init             |   4 -
 meta/recipes-core/systemd/systemd/var-run.conf     |   4 -
 meta/recipes-core/systemd/systemd_204.bb           |   3 -
 meta/recipes-core/udev/udev.inc                    |   6 +-
 meta/recipes-core/udev/udev/init                   |   1 -
 meta/recipes-core/udev/udev/volatiles              |   1 -
 .../remove.ldconfig.call.patch                     |   0
 .../zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb}          |  11 +-
 .../disable-configure-in-makefile.patch            |   0
 .../fix-gcc-4.6-null-not-defined.patch             |   0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/makerace.patch    |   0
 .../no-ko-translation.patch                        |   0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/no-nls-dpkg.patch |   0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/noconfigure.patch |   0
 .../apt/{apt-0.9.7.8 => apt-0.9.8.1}/nodoc.patch   |   0
 .../truncate-filename.patch                        |   0
 .../{apt-0.9.7.8 => apt-0.9.8.1}/use-host.patch    |   0
 ...apt-native_0.9.7.8.bb => apt-native_0.9.8.1.bb} |   0
 .../apt/{apt_0.9.7.8.bb => apt_0.9.8.1.bb}         |   4 +-
 ...n-native_5.17.3.bb => autogen-native_5.17.4.bb} |   4 +-
 meta/recipes-devtools/autogen/files/guile.patch    |  19 ++-
 meta/recipes-devtools/binutils/binutils-2.23.2.inc |   2 +
 .../binutils-2.23.2/backport/aarch64-crn.patch     | 117 ++++++++++++++
 .../binutils-2.23.2/backport/aarch64-movi.patch    | 144 +++++++++++++++++
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   2 +-
 .../git/{git_1.8.2.2.bb => git_1.8.3.bb}           |   4 +-
 .../obsolete_automake_macros.patch                 |  14 --
 .../{python-dbus_1.1.1.bb => python-dbus_1.2.0.bb} |   8 +-
 ...c-support-dictionary-byte-order-dependent.patch | 120 ++++++++-------
 meta/recipes-extended/cups/cups16.inc              |   6 +-
 .../findutils-4.4.2/findutils_fix_doc.patch        |  50 ++++++
 meta/recipes-extended/findutils/findutils_4.4.2.bb |   1 +
 ...utton-do-not-prelight-in-touchscreen-mode.patch |   0
 ...Duplicate-the-exec-string-returned-by-gtk.patch |   0
 .../cellrenderer-cairo.patch                       |   0
 .../configure-nm.patch                             |   0
 .../configurefix.patch                             |   0
 .../{gtk+-2.24.15 => gtk+-2.24.18}/doc-fixes.patch |   0
 .../entry-cairo.patch                              |   0
 .../hardcoded_libtool.patch                        |   0
 .../{gtk+-2.24.15 => gtk+-2.24.18}/no-demos.patch  |   0
 .../run-iconcache.patch                            |   0
 .../toggle-font.diff                               |   0
 .../{gtk+-2.24.15 => gtk+-2.24.18}/xsettings.patch |   0
 .../gtk+/{gtk+_2.24.15.bb => gtk+_2.24.18.bb}      |   6 +-
 meta/recipes-graphics/drm/libdrm.inc               |   3 +-
 .../freetype/freetype-2.4.11/no-hardcode.patch     |  13 --
 .../{freetype_2.4.11.bb => freetype_2.4.12.bb}     |   8 +-
 .../harfbuzz-0.9.12/avoid_double_version_h.patch   |  14 --
 .../disable_graphite.patch                         |   0
 .../{harfbuzz_0.9.12.bb => harfbuzz_0.9.17.bb}     |   5 +-
 .../settings-daemon/settings-daemon_git.bb         |   2 +-
 .../recipes-support/consolekit/consolekit_0.4.5.bb |   5 +
 meta/recipes-support/cramfs/cramfs_1.1.bb          |  29 ++++
 ...inter-reference-when-closing-an-unused-mu.patch | 170 ---------------------
 .../curl/{curl_7.29.0.bb => curl_7.30.0.bb}        |   7 +-
 .../gnutls/{libtasn1_2.14.bb => libtasn1_3.3.bb}   |   6 +-
 66 files changed, 495 insertions(+), 351 deletions(-)
 delete mode 100644 meta/recipes-core/systemd/systemd/var-run.conf
 delete mode 100644 meta/recipes-core/udev/udev/volatiles
 rename meta/recipes-core/zlib/{zlib-1.2.7 => zlib-1.2.8}/remove.ldconfig.call.patch (100%)
 rename meta/recipes-core/zlib/{zlib_1.2.7.bb => zlib_1.2.8.bb} (73%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/disable-configure-in-makefile.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/fix-gcc-4.6-null-not-defined.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/makerace.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/no-ko-translation.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/no-nls-dpkg.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/noconfigure.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/nodoc.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/truncate-filename.patch (100%)
 rename meta/recipes-devtools/apt/{apt-0.9.7.8 => apt-0.9.8.1}/use-host.patch (100%)
 rename meta/recipes-devtools/apt/{apt-native_0.9.7.8.bb => apt-native_0.9.8.1.bb} (100%)
 rename meta/recipes-devtools/apt/{apt_0.9.7.8.bb => apt_0.9.8.1.bb} (74%)
 rename meta/recipes-devtools/autogen/{autogen-native_5.17.3.bb => autogen-native_5.17.4.bb} (90%)
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-crn.patch
 create mode 100644 meta/recipes-devtools/binutils/binutils-2.23.2/backport/aarch64-movi.patch
 rename meta/recipes-devtools/git/{git_1.8.2.2.bb => git_1.8.3.bb} (67%)
 delete mode 100644 meta/recipes-devtools/python/python-dbus-1.1.1/obsolete_automake_macros.patch
 rename meta/recipes-devtools/python/{python-dbus_1.1.1.bb => python-dbus_1.2.0.bb} (70%)
 create mode 100644 meta/recipes-extended/findutils/findutils-4.4.2/findutils_fix_doc.patch
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/0001-GtkButton-do-not-prelight-in-touchscreen-mode.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/0001-bgo-584832-Duplicate-the-exec-string-returned-by-gtk.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/cellrenderer-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/configure-nm.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/configurefix.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/doc-fixes.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/entry-cairo.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/hardcoded_libtool.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/no-demos.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/run-iconcache.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/toggle-font.diff (100%)
 rename meta/recipes-gnome/gtk+/{gtk+-2.24.15 => gtk+-2.24.18}/xsettings.patch (100%)
 rename meta/recipes-gnome/gtk+/{gtk+_2.24.15.bb => gtk+_2.24.18.bb} (93%)
 delete mode 100644 meta/recipes-graphics/freetype/freetype-2.4.11/no-hardcode.patch
 rename meta/recipes-graphics/freetype/{freetype_2.4.11.bb => freetype_2.4.12.bb} (84%)
 delete mode 100644 meta/recipes-graphics/harfbuzz/harfbuzz-0.9.12/avoid_double_version_h.patch
 rename meta/recipes-graphics/harfbuzz/{harfbuzz-0.9.12 => harfbuzz-0.9.17}/disable_graphite.patch (100%)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_0.9.12.bb => harfbuzz_0.9.17.bb} (83%)
 create mode 100644 meta/recipes-support/cramfs/cramfs_1.1.bb
 delete mode 100644 meta/recipes-support/curl/curl/0001-Fix-NULL-pointer-reference-when-closing-an-unused-mu.patch
 rename meta/recipes-support/curl/{curl_7.29.0.bb => curl_7.30.0.bb} (89%)
 rename meta/recipes-support/gnutls/{libtasn1_2.14.bb => libtasn1_3.3.bb} (81%)

-- 
1.8.1.4


