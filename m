Received: from mail-iy0-f171.google.com ([209.85.210.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QvHBn-0002Ck-5K
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Aug 2011 01:12:24 +0200
Received: by iyf13 with SMTP id 13so9620198iyf.16
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Aug 2011 16:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JPiZjd+2e9jDIZb76nBWgaMzx3G1yRRs4wjy6fN2Wlk=;
	b=eiyipfxBswxizXrdIctpdbWBgH5nmserBnQc+WtNz8tmqGx6dohqTubFSqszKglUiA
	KaFBOuteEtyuJfWILXgz3ZsniLQjSbPbBeMaMOBgBXfp3oV8i3dA9GX3nirhwspcxaTT
	hSdwE50INfmvSJFau3Ea00DhyMmQg274gfg7Q=
Received: by 10.42.197.3 with SMTP id ei3mr1888109icb.115.1313968050329;
	Sun, 21 Aug 2011 16:07:30 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id g21sm3042742ibl.7.2011.08.21.16.07.28
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 21 Aug 2011 16:07:28 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 21 Aug 2011 16:07:02 -0700
Message-Id: <cover.1313967536.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.5.4
Subject: [PATCHv2 0/3] Redefine LINKER_HASH_STYLE and SRC_URI cleanups
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 21 Aug 2011 23:12:24 -0000

Modify the way we pass linker hash style so it can be used in multiple
methods.

Pass information about default linker hash style to gcc configure
so that it passes the right flags to runtime libraries builds e.g.
libgcc libstdc++ etc.

In v2:

Backport upstream with-linker-hash-style patch to gcc-4.6

Cleanup SRC_URIs:
remove patch=1 which is redundant
pnum is now striplevel so rename it
remove pnum=1 since strip level of 1 is default

scratch built angstrom-bleeding/console-image and booted on all supported
qemu machines with all these changes applied.

The following changes since commit dc5592140ac6d0b5953019fe0384bb0992636a6d:

  uclibc-git: Merge future branch (2011-08-21 15:58:41 -0700)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib kraj/linker-hash-choice
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=kraj/linker-hash-choice

Khem Raj (3):
  conf,recipes: Redefine LINKER_HASH_STYLE
  gcc-4.6: Use --with-linker-hash-style configure option
  recipes: Delete patch=1, its default and replace pnum with striplevel

 meta/conf/bitbake.conf                             |    4 +-
 meta/conf/distro/include/tcmode-default.inc        |    6 +-
 .../eee-acpi-scripts/eee-acpi-scripts_git.bb       |    4 +-
 meta/recipes-bsp/hostap/hostap-utils.inc           |    2 +-
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |    2 +-
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |    6 +-
 .../recipes-connectivity/galago/libgalago_0.5.2.bb |    4 +-
 meta/recipes-connectivity/gsm/gsmd.inc             |    2 +-
 meta/recipes-connectivity/gypsy/gypsy_git.bb       |    2 +-
 meta/recipes-connectivity/portmap/portmap.inc      |    2 +-
 .../telepathy/libtelepathy_0.3.3.bb                |    4 +-
 meta/recipes-connectivity/zeroconf/zeroconf_0.9.bb |    2 +-
 .../console-tools/console-tools_0.3.2.bb           |   10 +-
 meta/recipes-core/tinylogin/tinylogin_1.4.bb       |    8 +-
 meta/recipes-core/uclibc/uclibc.inc                |    2 +-
 meta/recipes-core/udev/udev_145.bb                 |    2 +-
 meta/recipes-core/update-rc.d/update-rc.d_0.7.bb   |    2 +-
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    2 +-
 .../binutils/binutils_csl-arm-2008q1.bb            |   14 +-
 .../dosfstools/dosfstools-native_2.10.bb           |   16 +-
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |    8 +-
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    6 +-
 meta/recipes-devtools/dpkg/dpkg.inc                |    2 +-
 meta/recipes-devtools/dpkg/dpkg_1.15.8.7.bb        |    2 +-
 .../e2fsprogs/e2fsprogs_1.41.14.bb                 |    4 +-
 meta/recipes-devtools/gcc/gcc-4.5.1.inc            |    8 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |   12 +-
 .../gcc/gcc-4.6/gcc-with-linker-hash-style.patch   |  211 ++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-csl-arm-2005q3.inc   |    4 +-
 meta/recipes-devtools/gcc/gcc-csl-arm-2008q1.inc   |   46 ++--
 meta/recipes-devtools/gdb/gdb-cross_7.3.bb         |    2 +-
 meta/recipes-devtools/m4/m4_1.4.16.bb              |    2 +-
 meta/recipes-devtools/make/make.inc                |    2 +-
 meta/recipes-devtools/mtd/mtd-utils_1.1.0+git.bb   |    6 +-
 meta/recipes-devtools/mtd/mtd-utils_1.4.1.bb       |    2 +-
 meta/recipes-devtools/mtools/mtools_3.9.9.bb       |    6 +-
 meta/recipes-devtools/patch/patch_2.5.9.bb         |    8 +-
 meta/recipes-devtools/patch/patch_2.6.1.bb         |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb   |    2 +-
 .../python/python-pycurl_7.19.0.bb                 |    2 +-
 .../subversion/subversion_1.6.15.bb                |    6 +-
 meta/recipes-devtools/ubootchart/ubootchart_svn.bb |    2 +-
 meta/recipes-extended/gzip/gzip_1.3.12.bb          |    4 +-
 meta/recipes-extended/hdparm/hdparm_6.3.bb         |    4 +-
 meta/recipes-extended/man/man_1.6f.bb              |   42 ++--
 meta/recipes-extended/minicom/minicom_2.4.bb       |    2 +-
 meta/recipes-extended/psmisc/psmisc.inc            |    2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |   10 +-
 meta/recipes-extended/time/time_1.7.bb             |    6 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.22.1.bb |    4 +-
 meta/recipes-gnome/gnome/gnome-common_2.28.0.bb    |    2 +-
 meta/recipes-gnome/gnome/gnome-mime-data_2.18.0.bb |    2 +-
 meta/recipes-gnome/gnome/gnome-vfs_2.24.4.bb       |    4 +-
 .../gnome/gobject-introspection_git.bb             |    6 +-
 meta/recipes-gnome/gnome/libart-lgpl_2.3.21.bb     |    2 +-
 meta/recipes-gnome/gnome/metacity_2.30.3.bb        |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.12.7.bb             |   34 ++--
 meta/recipes-gnome/gtk+/gtk+_2.16.6.bb             |   32 ++--
 meta/recipes-gnome/gtk+/gtk+_2.22.1.bb             |   32 ++--
 meta/recipes-gnome/gtkhtml2/gtkhtml2_svn.bb        |   12 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    2 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    4 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    6 +-
 .../libmatchbox/libmatchbox_git.bb                 |    6 +-
 meta/recipes-graphics/libsdl/libsdl_1.2.11.bb      |    4 +-
 .../matchbox-wm/matchbox-wm_1.2.bb                 |    2 +-
 .../matchbox-wm/matchbox-wm_git.bb                 |    2 +-
 meta/recipes-graphics/mesa/mesa-dri_git.bb         |    4 +-
 meta/recipes-graphics/mutter/mutter_git.bb         |   10 +-
 meta/recipes-graphics/tslib/tslib_1.0.bb           |    4 +-
 meta/recipes-graphics/xcb/libxcb.inc               |    2 +-
 .../xcursor-transparent-theme_0.1.1.bb             |    4 +-
 .../xorg-driver/xf86-input-mouse_git.bb            |    2 +-
 meta/recipes-graphics/xorg-lib/libx11-diet_git.bb  |    6 +-
 meta/recipes-graphics/xorg-lib/libx11_git.inc      |    6 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.3.bb   |    2 +-
 .../xorg-xserver/xserver-kdrive_1.7.99.2.bb        |   28 ++--
 meta/recipes-graphics/xtscal/xtscal_0.6.3.bb       |    4 +-
 meta/recipes-kernel/oprofile/oprofile_cvs.bb       |    2 +-
 meta/recipes-multimedia/alsa/alsa-lib_1.0.24.1.bb  |    2 +-
 meta/recipes-multimedia/flac/flac_1.2.1.bb         |    4 +-
 meta/recipes-multimedia/lame/lame_3.98.4.bb        |    2 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
 meta/recipes-multimedia/libtiff/tiff_3.8.2.bb      |    2 +-
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc  |    2 +-
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    4 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |   10 +-
 .../matchbox-config-gtk/matchbox-config-gtk_git.bb |    2 +-
 .../matchbox-keyboard/matchbox-keyboard_git.bb     |    4 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../matchbox-stroke/matchbox-stroke_git.bb         |    4 +-
 meta/recipes-sato/pcmanfm/pcmanfm_0.9.8.bb         |    2 +-
 meta/recipes-sato/puzzles/oh-puzzles_svn.bb        |    2 +-
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    4 +-
 meta/recipes-support/libpcre/libpcre_8.12.bb       |    2 +-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.5.bb           |    2 +-
 meta/recipes-support/taglib/taglib_1.6.3.bb        |    4 +-
 100 files changed, 511 insertions(+), 294 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-4.6/gcc-with-linker-hash-style.patch

-- 
1.7.5.4



