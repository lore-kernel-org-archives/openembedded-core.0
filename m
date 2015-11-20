Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 5802560617
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 14:11:16 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga102.jf.intel.com with ESMTP; 20 Nov 2015 06:11:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,323,1444719600"; d="scan'208";a="855904221"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga002.fm.intel.com with ESMTP; 20 Nov 2015 06:11:16 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Nov 2015 16:08:45 +0200
Message-Id: <cover.1448028339.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
Subject: [PATCH 0/9] Deprecate package_regex.inc and split it into recipes
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
X-List-Received-Date: Fri, 20 Nov 2015 14:11:18 -0000

This patch series deprecates package_regex.inc and splits its contents into
respective recipes. This is done for same reasons as deprecating
upstream_tracking.inc: having upstream version check tweaks bundled into a
separate file makes the information prone to getting out of date.

Changes since the previous version of the patch:
- take the opportunity to rename REGEX and REGEX_URI to UPSTREAM_CHECK_REGEX and
UPSTREAM_CHECK_URI.

The following changes since commit 1b25a70991589ed1f123015c16ee4806c46e3199:

  yocto-project-qs, ref-manual, poky.ent: CentOS Package updates (2015-11-18 16:42:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/split-package-regex
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/split-package-regex

Alexander Kanavin (9):
  package_regex.inc: deprecate the file
  package_regex.inc: split entries with odd-even versioning into their
    own recipes
  package_regex.inc: split GITTAGREGEX entries into recipe files
  package_regex.inc: split Debian-related entries into their own recipes
  package_regex.inc: split PyPi related entries to their own recipes
  package_regex.inc: split sourceforge related entries to their own
    recipes
  package_regex.inc: split entries which blacklist specific versions to
    their recipes
  package_regex.inc: split the rest of the entries to their recipes
  bitbake: rename REGEX and REGEX_URI to UPSTREAM_CHECK_REGEX and
    UPSTREAM_CHECK_URI

 bitbake/lib/bb/fetch2/wget.py                      |   4 +-
 bitbake/lib/bb/tests/fetch.py                      |   6 +-
 meta/classes/upstream-version-is-even.bbclass      |   5 +
 meta/conf/distro/include/package_regex.inc         | 266 +--------------------
 meta/recipes-bsp/apmd/apmd_3.2.2-15.bb             |   4 +
 meta/recipes-bsp/libacpi/libacpi_0.2.bb            |   2 +
 meta/recipes-bsp/lrzsz/lrzsz_0.12.20.bb            |   2 +
 meta/recipes-connectivity/dhcp/dhcp.inc            |   3 +
 .../nfs-utils/libnfsidmap_0.25.bb                  |   2 +
 .../resolvconf/resolvconf_1.77.bb                  |   4 +
 .../wireless-tools/wireless-tools_30.pre9.bb       |   3 +
 .../recipes-core/base-passwd/base-passwd_3.5.29.bb |   4 +
 .../console-tools/console-tools_0.3.2.bb           |   3 +
 meta/recipes-core/dbus/dbus-test_1.8.20.bb         |   2 +-
 meta/recipes-core/dbus/dbus.inc                    |   2 +-
 meta/recipes-core/glib-2.0/glib.inc                |   2 +-
 .../glib-networking/glib-networking_2.44.0.bb      |   2 +-
 .../glibc/cross-localedef-native_2.22.bb           |   1 +
 meta/recipes-core/glibc/glibc_2.22.bb              |   1 +
 meta/recipes-core/libcgroup/libcgroup_0.41.bb      |   2 +
 meta/recipes-core/sysfsutils/sysfsutils_2.1.0.bb   |   4 +
 meta/recipes-core/uclibc/uclibc-git.inc            |   3 +
 meta/recipes-devtools/apt/apt.inc                  |   4 +
 .../autogen/autogen-native_5.18.5.bb               |   3 +
 meta/recipes-devtools/binutils/binutils-2.25.1.inc |   2 +
 .../bootchart2/bootchart2_0.14.7.bb                |   2 +
 .../cdrtools/cdrtools-native_3.01a31.bb            |   2 +
 meta/recipes-devtools/chrpath/chrpath_0.16.bb      |   2 +
 meta/recipes-devtools/cmake/cmake.inc              |   2 +
 .../docbook-dsssl-stylesheets-native_1.79.bb       |   3 +
 .../docbook-sgml-dtd-3.1-native_3.1.bb             |   3 +
 .../docbook-sgml-dtd-4.1-native_4.1.bb             |   3 +
 .../docbook-xml/docbook-xsl-stylesheets_1.78.1.bb  |   3 +
 .../dosfstools/dosfstools_3.0.28.bb                |   2 +
 meta/recipes-devtools/expect/expect_5.45.bb        |   3 +
 meta/recipes-devtools/fdisk/gptfdisk_1.0.0.bb      |   3 +
 meta/recipes-devtools/file/file_5.24.bb            |   3 +
 meta/recipes-devtools/gcc/gcc-4.9.inc              |   2 +
 meta/recipes-devtools/intltool/intltool.inc        |   3 +
 meta/recipes-devtools/json-c/json-c_0.12.bb        |   5 +
 .../openjade/openjade-native_1.3.2.bb              |   2 +
 meta/recipes-devtools/perl/perl.inc                |   2 +
 meta/recipes-devtools/python/python-async_0.6.2.bb |   2 +
 meta/recipes-devtools/python/python-git_1.0.1.bb   |   3 +
 meta/recipes-devtools/python/python-gitdb_0.6.4.bb |   2 +
 meta/recipes-devtools/python/python-mako_1.0.1.bb  |   3 +
 meta/recipes-devtools/python/python-nose_1.3.6.bb  |   3 +
 meta/recipes-devtools/python/python-pexpect_3.3.bb |   2 +
 meta/recipes-devtools/python/python-scons_2.3.6.bb |   3 +
 meta/recipes-devtools/python/python-smmap_0.9.0.bb |   3 +
 meta/recipes-devtools/python/python.inc            |   4 +
 .../python/python3-native_3.4.3.bb                 |   3 +
 meta/recipes-devtools/python/python3-pip_6.1.1.bb  |   2 +
 .../python/python3-setuptools_18.2.bb              |   2 +
 meta/recipes-devtools/python/python3_3.4.3.bb      |   3 +
 meta/recipes-devtools/remake/remake_4.1+dbg-1.1.bb |   1 +
 meta/recipes-devtools/rpm/rpm_5.4.14.bb            |   2 +
 .../recipes-devtools/sgmlspl/sgmlspl-native_git.bb |   1 +
 meta/recipes-devtools/tcf-agent/tcf-agent_git.bb   |   1 +
 meta/recipes-devtools/vala/vala.inc                |   2 +-
 meta/recipes-extended/blktool/blktool_4-7.bb       |   4 +
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |   2 +
 .../chkconfig-alternatives-native_1.3.59.bb        |   1 +
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |   3 +
 meta/recipes-extended/cups/cups.inc                |   3 +
 .../foomatic/foomatic-filters_4.0.17.bb            |   2 +
 meta/recipes-extended/iputils/iputils_s20121221.bb |   2 +
 meta/recipes-extended/less/less_479.bb             |   2 +
 meta/recipes-extended/lsb/lsb_4.1.bb               |   4 +
 meta/recipes-extended/lsof/lsof_4.89.bb            |   2 +
 meta/recipes-extended/mailx/mailx_12.5-5.bb        |   4 +
 meta/recipes-extended/minicom/minicom_2.7.bb       |   2 +
 .../net-tools/net-tools_1.60-26.bb                 |   8 +
 meta/recipes-extended/pbzip2/pbzip2_1.1.12.bb      |   2 +
 meta/recipes-extended/quota/quota_4.02.bb          |   3 +
 meta/recipes-extended/sysstat/sysstat.inc          |   2 +
 meta/recipes-extended/unzip/unzip_6.0.bb           |   4 +
 meta/recipes-extended/watchdog/watchdog_5.14.bb    |   3 +
 .../xdg-utils/xdg-utils_1.1.0-rc1.bb               |   2 +
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   3 +
 meta/recipes-extended/zip/zip_3.0.bb               |   3 +
 meta/recipes-gnome/epiphany/epiphany_3.16.3.bb     |   2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.30.8.bb |   2 +-
 .../gnome-desktop/gnome-desktop3_3.16.2.bb         |   2 +-
 .../gnome/adwaita-icon-theme_3.16.2.1.bb           |   2 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |   4 +
 meta/recipes-gnome/gtk+/gtk+3.inc                  |   2 +-
 .../gtk-engines/gtk-engines_2.20.2.bb              |   4 +
 meta/recipes-gnome/librsvg/librsvg_2.40.10.bb      |   2 +-
 meta/recipes-graphics/cairo/cairo_1.14.4.bb        |   2 +
 meta/recipes-graphics/clutter/clutter-1.0.inc      |   2 +-
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   2 +-
 meta/recipes-graphics/clutter/clutter-gtk-1.0.inc  |   2 +-
 meta/recipes-graphics/cogl/cogl-1.0.inc            |   2 +-
 meta/recipes-graphics/glew/glew_1.12.0.bb          |   3 +
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |   2 +
 .../menu-cache/menu-cache_1.0.0.bb                 |   2 +
 meta/recipes-graphics/mx/mx-1.0_1.4.7.bb           |   3 +
 meta/recipes-graphics/pango/pango.inc              |   2 +-
 meta/recipes-graphics/tslib/tslib_1.1.bb           |   1 +
 meta/recipes-graphics/waffle/waffle_1.5.1.bb       |   2 +
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb      |   3 +
 .../xorg-driver/xf86-video-omapfb_git.bb           |   3 +
 .../xorg-lib/libxkbcommon_0.5.0.bb                 |   2 +
 meta/recipes-kernel/libpfm/libpfm4_4.6.0.bb        |   2 +
 meta/recipes-kernel/linux/linux-yocto.inc          |   2 +
 meta/recipes-kernel/powertop/powertop_2.7.bb       |   2 +
 meta/recipes-lsb4/libpng/libpng12_1.2.53.bb        |   3 +
 .../gstreamer/gstreamer1.0-libav.inc               |   2 +-
 .../gstreamer/gstreamer1.0-plugins.inc             |   2 +-
 .../gstreamer/gstreamer1.0-rtsp-server.inc         |   2 +-
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc |   2 +-
 meta/recipes-multimedia/liba52/liba52_0.7.4.bb     |   3 +
 .../libsamplerate/libsamplerate0_0.1.8.bb          |   3 +
 .../libtheora/libtheora_1.1.1.bb                   |   2 +
 meta/recipes-multimedia/libtiff/tiff_4.0.4.bb      |   3 +
 meta/recipes-multimedia/mpeg2dec/mpeg2dec_0.4.1.bb |   2 +
 meta/recipes-multimedia/webp/libwebp_0.4.3.bb      |   2 +
 meta/recipes-qt/qt-apps/quicky_0.4.bb              |   2 +
 meta/recipes-qt/qt4/nativesdk-qt4-tools.inc        |   3 +
 meta/recipes-qt/qt4/qt4-4.8.7.inc                  |   3 +
 meta/recipes-qt/qt4/qt4-native.inc                 |   4 +
 meta/recipes-sato/pcmanfm/pcmanfm_1.2.3.bb         |   2 +
 meta/recipes-sato/webkit/webkitgtk_2.8.5.bb        |   2 +-
 meta/recipes-support/atk/at-spi2-atk_2.16.0.bb     |   2 +-
 meta/recipes-support/atk/at-spi2-core_2.16.0.bb    |   2 +-
 meta/recipes-support/atk/atk_2.16.0.bb             |   2 +-
 meta/recipes-support/db/db_6.0.30.bb               |   4 +
 meta/recipes-support/libevent/libevent_2.0.22.bb   |   2 +
 meta/recipes-support/libical/libical_1.0.0.bb      |   2 +
 meta/recipes-support/libmpc/libmpc_1.0.3.bb        |   2 +
 meta/recipes-support/libpcre/libpcre_8.37.bb       |   3 +
 meta/recipes-support/libsoup/libsoup-2.4_2.50.0.bb |   2 +-
 meta/recipes-support/libusb/libusb-compat_0.1.5.bb |   3 +
 meta/recipes-support/libxslt/libxslt_1.1.28.bb     |   3 +
 meta/recipes-support/mpfr/mpfr_3.1.3.bb            |   2 +
 meta/recipes-support/nettle/nettle.inc             |   2 +
 meta/recipes-support/nss/nss_3.19.2.bb             |   3 +
 meta/recipes-support/p11-kit/p11-kit_0.22.1.bb     |   2 +-
 meta/recipes-support/sqlite/sqlite3_3.9.0.bb       |   3 +
 meta/recipes-support/taglib/taglib_1.9.1.bb        |   2 +
 meta/recipes-support/vte/vte.inc                   |   2 +-
 142 files changed, 335 insertions(+), 293 deletions(-)
 create mode 100644 meta/classes/upstream-version-is-even.bbclass

-- 
2.6.2


