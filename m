Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 7268E73BB7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Jun 2015 13:19:26 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 17 Jun 2015 06:19:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,632,1427785200"; d="scan'208";a="729205320"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.143])
	by fmsmga001.fm.intel.com with ESMTP; 17 Jun 2015 06:19:26 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 Jun 2015 16:19:10 +0300
Message-Id: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/22] Update webkitgtk to latest stable upstream; replace midori with epiphany
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
X-List-Received-Date: Wed, 17 Jun 2015 13:19:27 -0000

This patch series updates webkitgtk to latest stable upstream release
and replaces midori browser with epiphany.

These patches should be applied on top of Jussi Kukkonen's gtk3 update to 3.16.

Alexander Kanavin (22):
  Change tarball compression to xz for gnome recipes
  Enable icu feature in harfbuzz recipe
  Add arch conversion routine to cmake.bbclass
  Update jpeg recipe to version 9a
  Update libnotify to version 0.7.6
  Add a recipe for giflib
  Add a recipe for libyaml
  Add a recipe for ruby
  Add a recipe for libsecret
  Add a recipe for libwebp
  Add a recipe for webkitgtk 2.8.3
  Add a recipe for p11-kit
  Add a recipe for gcr
  Add a recipe for iso-codes
  Add a recipe for libwnck3
  Add a recipe for gnome-desktop3
  Add a warning suppression patch to glib
  Add a recipe gsettings-desktop-schemas
  Add a recipe for epiphany
  Remove the recipe for the obsolete webkit-gtk 1.8.3
  Remove the midori recipe and replace references to midori with
    epiphany
  poky: update distro files related to webkitgtk update and epiphany
    addition

 meta-yocto/conf/distro/include/distro_alias.inc    |    2 +-
 meta-yocto/conf/distro/include/maintainers.inc     |    4 +-
 meta-yocto/conf/distro/include/package_regex.inc   |    5 +-
 .../distro/include/poky-floating-revisions.inc     |    1 -
 meta-yocto/conf/distro/include/recipe_color.inc    |    1 -
 .../conf/distro/include/upstream_tracking.inc      |    2 -
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
 .../{libnotify_0.6.0.bb => libnotify_0.7.6.bb}     |    8 +-
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
 57 files changed, 455 insertions(+), 2170 deletions(-)
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
 rename meta/recipes-gnome/libnotify/{libnotify_0.6.0.bb => libnotify_0.7.6.bb} (66%)
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


