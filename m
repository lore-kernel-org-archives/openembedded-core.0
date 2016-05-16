Return-Path: <jussi.kukkonen@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 9781060767
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 13:22:40 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 16 May 2016 06:22:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,627,1455004800"; d="scan'208";a="982013062"
Received: from theory.fi.intel.com ([10.237.72.196])
	by fmsmga002.fm.intel.com with ESMTP; 16 May 2016 06:22:40 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2016 16:22:27 +0300
Message-Id: <cover.1463404035.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/13] wayland V2 and misc upgrades
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
X-List-Received-Date: Mon, 16 May 2016 13:22:41 -0000

This set includes v2 of the wayland patches, changes since v1:
* weston: prefix the protocol path with the machine sysroot as 
  that's where allarch wayland-protocols is
* use HTTPS for all wayland tarball uris
* "wayland-protocols" is now the name of the package,
  weston-dev now RRECOMMENDS it

The other upgrades are fairly uneventful: gdk-pixbuf-ptest looks nasty
on buildhistory but the files are mostly just moved around in directories.

Thanks,
  Jussi


The following changes since commit 9094ea9fdd1f23cbc9f7a9d0d95fb330c5ea8906:

  classes/oeqa: Update for print statements and file() -> open() for python3 (2016-05-16 09:31:23 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/upgrades
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/upgrades

Jussi Kukkonen (13):
  glib-2.0: Upgrade 2.46.2 -> 2.48.1
  glib-networking: Upgrade 2.46.1 -> 2.48.2
  pango: Upgrade 1.38.1 -> 1.40.1
  gdk-pixbuf: Upgrade 2.32.3 -> 2.34.0
  gsettings-desktop-schemas: Upgrade 3.19.3 -> 3.20.0
  inputproto: Upgrade 2.3.1 -> 2.3.2
  json-glib: Upgrade 1.0.4 -> 1.2.0
  libsoup-2.4: Upgrade 2.52.2 -> 2.54.1
  expat: Upgrade 2.1.0 -> 2.1.1
  xproto: Upgrade 7.0.28 -> 7.0.29
  wayland: Upgrade 1.9.0 -> 1.10.0
  wayland-protocols: Add recipe
  weston: Upgrade 1.9.0 -> 1.10.0

 .../expat/expat-2.1.0/expat-CVE-2015-1283.patch    | 62 -------------------
 meta/recipes-core/expat/expat.inc                  |  3 +-
 .../expat/{expat-2.1.0 => expat}/autotools.patch   |  4 +-
 meta/recipes-core/expat/expat_2.1.0.bb             |  5 --
 meta/recipes-core/expat/expat_2.1.1.bb             |  5 ++
 ...c-Do-not-use-readlink-when-cross-compilin.patch | 31 ----------
 .../glib-2.0/glib-2.0-configure-readlink.patch     | 29 ---------
 .../ignore-format-nonliteral-warning.patch         | 39 ------------
 .../glib-2.0/glib-2.0/relocate-modules.patch       | 66 ++++++++++----------
 .../{glib-2.0_2.46.2.bb => glib-2.0_2.48.1.bb}     |  7 +--
 meta/recipes-core/glib-2.0/glib.inc                |  3 +-
 ...working_2.46.1.bb => glib-networking_2.48.2.bb} |  4 +-
 .../{gdk-pixbuf_2.32.3.bb => gdk-pixbuf_2.34.0.bb} |  4 +-
 ...19.3.bb => gsettings-desktop-schemas_3.20.0.bb} |  5 +-
 .../{json-glib_1.0.4.bb => json-glib_1.2.0.bb}     |  4 +-
 .../pango/{pango_1.38.1.bb => pango_1.40.1.bb}     |  5 +-
 .../wayland-protocols/dont-use-AC_CANONICAL.patch  | 29 +++++++++
 .../wayland/wayland-protocols_1.3.bb               | 20 +++++++
 .../{wayland_1.9.0.bb => wayland_1.10.0.bb}        |  8 +--
 ...1-configure.ac-Fix-wayland-protocols-path.patch | 34 +++++++++++
 .../weston/explicit-enable-disable-systemd.patch   | 70 ----------------------
 .../wayland/weston/libsystemd.patch                | 53 ----------------
 .../weston/make-lcms-explicitly-configurable.patch | 43 -------------
 .../wayland/{weston_1.9.0.bb => weston_1.10.0.bb}  | 14 ++---
 .../{inputproto_2.3.1.bb => inputproto_2.3.2.bb}   |  4 +-
 .../{xproto_7.0.28.bb => xproto_7.0.29.bb}         |  5 +-
 ...libsoup-2.4_2.52.2.bb => libsoup-2.4_2.54.1.bb} |  4 +-
 27 files changed, 154 insertions(+), 406 deletions(-)
 delete mode 100644 meta/recipes-core/expat/expat-2.1.0/expat-CVE-2015-1283.patch
 rename meta/recipes-core/expat/{expat-2.1.0 => expat}/autotools.patch (79%)
 delete mode 100644 meta/recipes-core/expat/expat_2.1.0.bb
 create mode 100644 meta/recipes-core/expat/expat_2.1.1.bb
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-configure.ac-Do-not-use-readlink-when-cross-compilin.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib-2.0-configure-readlink.patch
 delete mode 100644 meta/recipes-core/glib-2.0/glib-2.0/ignore-format-nonliteral-warning.patch
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.46.2.bb => glib-2.0_2.48.1.bb} (73%)
 rename meta/recipes-core/glib-networking/{glib-networking_2.46.1.bb => glib-networking_2.48.2.bb} (88%)
 rename meta/recipes-gnome/gdk-pixbuf/{gdk-pixbuf_2.32.3.bb => gdk-pixbuf_2.34.0.bb} (96%)
 rename meta/recipes-gnome/gsettings-desktop-schemas/{gsettings-desktop-schemas_3.19.3.bb => gsettings-desktop-schemas_3.20.0.bb} (68%)
 rename meta/recipes-gnome/json-glib/{json-glib_1.0.4.bb => json-glib_1.2.0.bb} (78%)
 rename meta/recipes-graphics/pango/{pango_1.38.1.bb => pango_1.40.1.bb} (92%)
 create mode 100644 meta/recipes-graphics/wayland/wayland-protocols/dont-use-AC_CANONICAL.patch
 create mode 100644 meta/recipes-graphics/wayland/wayland-protocols_1.3.bb
 rename meta/recipes-graphics/wayland/{wayland_1.9.0.bb => wayland_1.10.0.bb} (85%)
 create mode 100644 meta/recipes-graphics/wayland/weston/0001-configure.ac-Fix-wayland-protocols-path.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/explicit-enable-disable-systemd.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/libsystemd.patch
 delete mode 100644 meta/recipes-graphics/wayland/weston/make-lcms-explicitly-configurable.patch
 rename meta/recipes-graphics/wayland/{weston_1.9.0.bb => weston_1.10.0.bb} (89%)
 rename meta/recipes-graphics/xorg-proto/{inputproto_2.3.1.bb => inputproto_2.3.2.bb} (77%)
 rename meta/recipes-graphics/xorg-proto/{xproto_7.0.28.bb => xproto_7.0.29.bb} (73%)
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.52.2.bb => libsoup-2.4_2.54.1.bb} (89%)

-- 
2.1.4


