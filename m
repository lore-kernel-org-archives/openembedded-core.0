Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 7558173F7F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jun 2015 12:35:23 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP; 18 Jun 2015 05:35:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,638,1427785200"; d="scan'208";a="713247606"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by orsmga001.jf.intel.com with ESMTP; 18 Jun 2015 05:35:22 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 Jun 2015 15:35:29 +0300
Message-Id: <cover.1434630758.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCHv2 00/21] Update webkitgtk to latest stable upstream; replace midori with epiphany
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
X-List-Received-Date: Thu, 18 Jun 2015 12:35:23 -0000

This patch series updates webkitgtk to latest stable upstream release
and replaces midori browser with epiphany.

These patches should be applied on top of Jussi Kukkonen's gtk3 update to 3.16.

Version 2 of the patchset fixes the commit messages and drops the patch intended for poky

The following changes since commit fafb8fcc291dcda89a88f8b88d86b0f0195d182c:

  midori: Depend on Adwaita, not gnome-icon-theme (2015-06-11 16:04:33 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/webkitgtk-update
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/webkitgtk-update

Alexander Kanavin (21):
  classes/gnomebase: change tarball compression to xz
  harfbuzz: enable icu feature
  classes/cmake: add arch conversion routine
  jpeg: update to version 9a
  libnotify: update to version 0.7.6
  giflib: add a recipe from meta-oe
  libyaml: add a recipe from meta-oe
  ruby: add a recipe from meta-ruby
  libsecret: add a recipe from meta-gnome
  libwebp: add a recipe from meta-oe
  webkitgtk: add a new recipe for version 2.8.3
  p11-kit: add a recipe from meta-oe
  gcr: add a recipe from meta-gnome
  iso-codes: add a recipe from meta-oe
  libwnck3: add a recipe from meta-gnome
  gnome-desktop3: add a recipe from meta-gnome
  glib: add a warning suppression patch to glib
  gsettings-desktop-schemas: add a recipe from meta-gnome
  epiphany: add a recipe from meta-gnome
  webkit-gtk: remove the recipe for the obsolete version 1.8.3
  midori: remove the recipe and replace references to midori with
    epiphany

 meta/classes/cmake.bbclass                         |   12 +-
 meta/classes/gnomebase.bbclass                     |    2 +-
 meta/conf/distro/include/security_flags.inc        |    2 -
 ...warning-about-deprecated-paths-in-schemas.patch |   32 +
 meta/recipes-core/glib-2.0/glib-2.0_2.44.1.bb      |    1 +
 .../glib-networking/glib-networking_2.44.0.bb      |    2 -
 .../jpeg/jpeg-8d/debian-libjpeg7_7-1.diff          | 1070 --------------------
 .../jpeg/jpeg-8d/fix_for_automake_1.12.1.patch     |   44 -
 meta/recipes-core/jpeg/{jpeg_8d.bb => jpeg_9a.bb}  |   28 +-
 .../packagegroups/packagegroup-self-hosted.bb      |   10 +-
 meta/recipes-devtools/giflib/giflib_5.1.1.bb       |   20 +
 meta/recipes-devtools/ruby/ruby.inc                |   40 +
 meta/recipes-devtools/ruby/ruby/extmk.patch        |   13 +
 meta/recipes-devtools/ruby/ruby_2.2.2.bb           |   42 +
 meta/recipes-gnome/epiphany/epiphany_3.16.1.bb     |   23 +
 meta/recipes-gnome/gcr/gcr_3.16.0.bb               |   18 +
 .../gnome-desktop/gnome-desktop3_3.16.2.bb         |   25 +
 meta/recipes-gnome/gnome/gnome-common_3.14.0.bb    |    2 -
 .../recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb |    2 -
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |    1 +
 .../gsettings-desktop-schemas_3.16.1.bb            |   13 +
 .../gtk-engines/gtk-engines_2.20.2.bb              |    1 +
 meta/recipes-gnome/json-glib/json-glib_1.0.4.bb    |    2 -
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    1 +
 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb    |   21 -
 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb    |   12 +
 meta/recipes-gnome/librsvg/librsvg_2.40.9.bb       |    2 -
 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb   |   12 +
 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb      |   17 +
 .../builder/files/builder_hob_start.sh             |    8 +-
 meta/recipes-graphics/harfbuzz/harfbuzz_0.9.40.bb  |    2 +-
 meta/recipes-graphics/pango/pango_1.36.8.bb        |    2 -
 meta/recipes-multimedia/webp/libwebp_0.4.3.bb      |   47 +
 meta/recipes-sato/midori/midori/liststore.patch    |   29 -
 meta/recipes-sato/midori/midori_0.5.8.bb           |   31 -
 .../packagegroups/packagegroup-core-x11-sato.bb    |    2 +-
 meta/recipes-sato/webkit/files/bison-2.6.patch     |  558 ----------
 meta/recipes-sato/webkit/files/no-gtkdoc.patch     |   20 -
 meta/recipes-sato/webkit/files/nodolt.patch        |   19 -
 .../webgit-gtk_fix_build_with_automake_1.12.patch  |   62 --
 ...bkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch |   26 -
 .../0001-Enable-mips64-build.patch                 |   69 --
 .../webkit/webkit-gtk-1.8.3/aarch64.patch          |   41 -
 .../obsolete_automake_macros.patch                 |   14 -
 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb       |  116 ---
 meta/recipes-sato/webkit/webkitgtk_2.8.3.bb        |   58 ++
 meta/recipes-support/atk/atk_2.16.0.bb             |    2 -
 meta/recipes-support/iso-codes/iso-codes_3.58.bb   |   15 +
 meta/recipes-support/libcroco/libcroco_0.6.8.bb    |    2 -
 meta/recipes-support/libyaml/libyaml_0.1.6.bb      |   20 +
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     |   18 +
 meta/recipes-support/vte/vte_0.28.2.bb             |    4 +-
 52 files changed, 458 insertions(+), 2177 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/0001-Remove-the-warning-about-deprecated-paths-in-schemas.patch
 delete mode 100644 meta/recipes-core/jpeg/jpeg-8d/debian-libjpeg7_7-1.diff
 delete mode 100644 meta/recipes-core/jpeg/jpeg-8d/fix_for_automake_1.12.1.patch
 rename meta/recipes-core/jpeg/{jpeg_8d.bb => jpeg_9a.bb} (55%)
 create mode 100644 meta/recipes-devtools/giflib/giflib_5.1.1.bb
 create mode 100644 meta/recipes-devtools/ruby/ruby.inc
 create mode 100644 meta/recipes-devtools/ruby/ruby/extmk.patch
 create mode 100644 meta/recipes-devtools/ruby/ruby_2.2.2.bb
 create mode 100644 meta/recipes-gnome/epiphany/epiphany_3.16.1.bb
 create mode 100644 meta/recipes-gnome/gcr/gcr_3.16.0.bb
 create mode 100644 meta/recipes-gnome/gnome-desktop/gnome-desktop3_3.16.2.bb
 create mode 100644 meta/recipes-gnome/gsettings-desktop-schemas/gsettings-desktop-schemas_3.16.1.bb
 delete mode 100644 meta/recipes-gnome/libnotify/libnotify_0.6.0.bb
 create mode 100644 meta/recipes-gnome/libnotify/libnotify_0.7.6.bb
 create mode 100644 meta/recipes-gnome/libsecret/libsecret_0.18.2.bb
 create mode 100644 meta/recipes-gnome/libwnck/libwnck3_3.14.0.bb
 create mode 100644 meta/recipes-multimedia/webp/libwebp_0.4.3.bb
 delete mode 100644 meta/recipes-sato/midori/midori/liststore.patch
 delete mode 100644 meta/recipes-sato/midori/midori_0.5.8.bb
 delete mode 100644 meta/recipes-sato/webkit/files/bison-2.6.patch
 delete mode 100644 meta/recipes-sato/webkit/files/no-gtkdoc.patch
 delete mode 100644 meta/recipes-sato/webkit/files/nodolt.patch
 delete mode 100644 meta/recipes-sato/webkit/files/webgit-gtk_fix_build_with_automake_1.12.patch
 delete mode 100644 meta/recipes-sato/webkit/files/webkit-gtk-ANGLE-doesn-t-build-with-bison-3.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/0001-Enable-mips64-build.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/aarch64.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk-1.8.3/obsolete_automake_macros.patch
 delete mode 100644 meta/recipes-sato/webkit/webkit-gtk_1.8.3.bb
 create mode 100644 meta/recipes-sato/webkit/webkitgtk_2.8.3.bb
 create mode 100644 meta/recipes-support/iso-codes/iso-codes_3.58.bb
 create mode 100644 meta/recipes-support/libyaml/libyaml_0.1.6.bb
 create mode 100644 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb

-- 
2.1.4


