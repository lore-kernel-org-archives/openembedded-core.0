Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RvlyZ-0001XA-0t
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:03 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213841"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:56 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:35 -0800
Message-Id: <cover.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
Subject: [CONSOLIDATED PULL 00/20] A load of patches before ELC
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:03 -0000

Richard,

Here is a load of patches that I have tested against the AB
on x86 and arm.

Khem's zlib patch has a large affect due to the dropping of the .la
file therefore a bunch of PR bumps and it also fixes some missing 
DEPENDS.

Once Lianhoa's patch is in, we can enable BasicHash in Poky, there
is a patch from him pending still on the poky alias.


The following changes since commit 4ef5e70f531f48cef90805402c16ec02ad3f2b92:

  tcmode-default: add preference for gdb/gdbserver (2012-02-08 10:16:48 -0600)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Christopher Larson (1):
  external-csl-toolchain: fix mtd-user.h issue

Joshua Lock (5):
  clutter-1.8: update to clutter-1.8.4
  mx: update to 1.4.2
  mx: ensure gettext and dbus are present
  clutter: upgrade git recipe to reflect 1.8.4 tag
  distro-tracking-fields: update clutter, clutter_git and mx

Khem Raj (3):
  zlib: Upgrade 1.2.5 -> 1.2.6
  sat-solver: Fix build with zlib 1.2.6
  gnupg: Add missing DEPENDS on libgcrypt

Lianhao Lu (1):
  gcc: Ensure same sstate hashes for shared soruce directory

Matthew McClintock (2):
  distutils.bbclass: override LDSHARED so we use the linker for this
    build and not the one used in sstate-cache
  powerpc64-linux: Update cached autoconf values for libpcap on
    powerpc64

Otavio Salvador (2):
  cross.bbclass: add virtclass handler
  useradd.bbclass: skip processing on virtclass-cross extended packages

Richard Purdie (4):
  sstate.bbclass: Optimise sstate_hardcode_path
  package.bbclass: Optimise the per file rpm handling
  gcc-4.6: Some small performance tweaks
  package_rpm.bbclass: Replace shell provides/requires script with
    python version

Saul Wold (1):
  valgrind: Fixed
    Added-support-for-PPC-instructions-mfatbu-mfatbl.patch
    Upstream-Status

Tom Rini (1):
  u-boot-fw-utils: Add for v2011.06

 meta/classes/cross.bbclass                         |   17 +++
 meta/classes/distutils.bbclass                     |    2 +
 meta/classes/package.bbclass                       |   52 ++++++----
 meta/classes/package_rpm.bbclass                   |   22 +++--
 meta/classes/sstate.bbclass                        |   27 +++--
 meta/classes/useradd.bbclass                       |    3 +
 .../conf/distro/include/distro_tracking_fields.inc |   16 ++--
 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb |   26 +++++
 meta/recipes-core/busybox/busybox.inc              |    4 +-
 meta/recipes-core/eggdbus/eggdbus_0.6.bb           |    2 +-
 meta/recipes-core/glib-2.0/glib-2.0_2.30.2.bb      |    2 +-
 meta/recipes-core/libxml/libxml2_2.7.8.bb          |    2 +-
 meta/recipes-core/meta/external-csl-toolchain.bb   |    1 +
 meta/recipes-core/zlib/files/Makefile.am           |    9 --
 meta/recipes-core/zlib/files/configure.ac          |   48 ---------
 .../zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch   |   20 ----
 meta/recipes-core/zlib/zlib_1.2.5.bb               |   41 --------
 meta/recipes-core/zlib/zlib_1.2.6.bb               |   26 +++++
 meta/recipes-devtools/binutils/binutils_2.22.bb    |    2 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |   14 ++-
 meta/recipes-devtools/gcc/gcc-common.inc           |    1 +
 ...upport-for-PPC-instructions-mfatbu-mfatbl.patch |    2 +
 meta/recipes-extended/cracklib/cracklib_2.8.18.bb  |    4 +-
 meta/recipes-extended/pam/libpam_1.1.5.bb          |    2 +-
 meta/recipes-extended/polkit/polkit-gnome_0.102.bb |    2 +-
 meta/recipes-extended/polkit/polkit_0.104.bb       |    2 +-
 ...fopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch |   57 +++++++++++
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    3 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.0.bb |    2 +-
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    2 +-
 meta/recipes-gnome/gnome/gnome-keyring_2.32.1.bb   |    2 +-
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |    2 +-
 meta/recipes-gnome/libglade/libglade_2.6.4.bb      |    4 +-
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |    2 +-
 meta/recipes-gnome/libunique/libunique_1.1.6.bb    |    2 +-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb        |    2 +-
 .../{clutter-1.8_1.8.2.bb => clutter-1.8_1.8.4.bb} |    7 +-
 meta/recipes-graphics/clutter/clutter_git.bb       |    6 +-
 .../libmatchbox/libmatchbox_1.9.bb                 |    2 +-
 .../menu-cache/menu-cache_0.3.2.bb                 |    4 +-
 .../mx/files/introspection-m4.patch                |  106 ++++++++++++++++++++
 .../mx/{mx_1.3.2.bb => mx_1.4.2.bb}                |   15 ++-
 meta/recipes-graphics/pango/pango_1.28.4.bb        |    2 +-
 meta/recipes-graphics/xorg-lib/libfontenc_1.1.0.bb |    2 +-
 meta/recipes-graphics/xorg-lib/libxfont_1.4.4.bb   |    4 +-
 .../xorg-lib/libxfontcache_1.0.5.bb                |    4 +-
 meta/recipes-graphics/xorg-lib/pixman_0.24.2.bb    |    3 +-
 meta/recipes-multimedia/gstreamer/gst-plugins.inc  |    2 +
 .../gstreamer/gstreamer_0.10.35.bb                 |    2 +-
 .../libid3tag/libid3tag_0.15.1b.bb                 |    2 +-
 meta/recipes-multimedia/libpng/libpng_1.2.46.bb    |    2 +-
 meta/recipes-multimedia/libtiff/tiff_3.9.5.bb      |    2 +-
 meta/recipes-sato/eds/eds-dbus_2.20.0.bb           |    2 +-
 meta/recipes-sato/eds/eds-dbus_git.bb              |    2 +-
 .../matchbox-panel-2/matchbox-panel-2_git.bb       |    2 +-
 .../recipes-sato/owl-video-widget/libowl-av_git.bb |    2 +-
 meta/recipes-support/gnupg/gnupg_2.0.18.bb         |    2 +-
 meta/recipes-support/gnutls/gnutls.inc             |    2 +-
 meta/recipes-support/libcroco/libcroco_0.6.3.bb    |    2 +-
 meta/recipes-support/libfm/libfm_0.1.17.bb         |    2 +-
 meta/recipes-support/libsoup/libsoup-2.4_2.36.1.bb |    2 +-
 meta/recipes-support/libsoup/libsoup_2.2.105.bb    |    2 +-
 meta/recipes-support/libxslt/libxslt_1.1.26.bb     |    2 +-
 meta/recipes-support/neon/neon_0.29.6.bb           |    2 +-
 meta/recipes-support/vte/vte_0.28.2.bb             |    2 +-
 meta/site/powerpc64-linux                          |    3 +-
 66 files changed, 387 insertions(+), 234 deletions(-)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2011.06.bb
 delete mode 100644 meta/recipes-core/zlib/files/Makefile.am
 delete mode 100644 meta/recipes-core/zlib/files/configure.ac
 delete mode 100644 meta/recipes-core/zlib/zlib-1.2.5/fix.inverted.LFS.logic.patch
 delete mode 100644 meta/recipes-core/zlib/zlib_1.2.5.bb
 create mode 100644 meta/recipes-core/zlib/zlib_1.2.6.bb
 create mode 100644 meta/recipes-extended/sat-solver/sat-solver/0001-sat_xfopen.c-Forward-port-to-zlib-1.2.6-gzFile.patch
 rename meta/recipes-graphics/clutter/{clutter-1.8_1.8.2.bb => clutter-1.8_1.8.4.bb} (79%)
 create mode 100644 meta/recipes-graphics/mx/files/introspection-m4.patch
 rename meta/recipes-graphics/mx/{mx_1.3.2.bb => mx_1.4.2.bb} (40%)

-- 
1.7.6.5



