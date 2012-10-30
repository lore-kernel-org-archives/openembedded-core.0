Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TT8Lh-0002q1-KS
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Oct 2012 10:43:07 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9U9TSCD028851
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Oct 2012 02:29:28 -0700 (PDT)
Received: from localhost.localdomain (128.224.163.124) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 30 Oct 2012 02:29:28 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Oct 2012 17:33:41 +0800
Message-ID: <cover.1351496696.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 00/11] replace virtclass-native(sdk) with class-native(sdk)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2012 09:43:08 -0000
Content-Type: text/plain

The following overrides are deprecated:

virtclass-native
virtclass-nativesdk

We should use the new overrides:
class-target
class-native
class-nativesdk
class-cross
class-crosssdk
class-multilib

These patches replace the old ways with the new ones, but keep the
compatibility with the old ways, which means that the virtclass-native
and virtclass-nativesdk still work correctly.

Test info:

# With MACHINE=qemux86/qemux86-64/qemuarm/qemumips/qemuppc
$ bitbake core-image-minimal core-image-sato core-image-sato-sdk

# With MACHINE=qemux86
$ bitbake meta-toolchain-sdk world

Used the buildhistory.bbclass to verify that there isn't any apparent
changes which is caused by these patches.

Will send the patch for meta-yocto to its mailing list sooner.

// Robert

The following changes since commit 93c04c16e45a3c8f60f8ffc0b26a78c24bda71da:

  bitbake: hob: reordering the layers in the Hob Layers dialog (2012-10-27 09:55:55 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/virtclass
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/virtclass

Robert Yang (11):
  classes: replace virtclass-native(sdk) with class-native(sdk)
  multilib.bbclass: add class-multilib to override
  conf: replace virtclass-native(sdk) with class-native(sdk)
  recipes-core: replace virtclass-native(sdk) with class-native(sdk)
  recipes-devtools: replace virtclass-native(sdk) with
    class-native(sdk)
  recipes-extended: replace virtclass-native(sdk) with
    class-native(sdk)
  recipes-graphics: replace virtclass-native(sdk) with
    class-native(sdk)
  recipes-support: replace virtclass-native(sdk) with class-native(sdk)
  recipes-gnome: replace virtclass-native(sdk) with class-native(sdk)
  recipes-kernel: replace virtclass-native(sdk) with class-native(sdk)
  recipes-connectivity: replace virtclass-native(sdk) with
    class-native(sdk)

 meta/classes/cross.bbclass                         |  2 +-
 meta/classes/insane.bbclass                        |  4 ++--
 meta/classes/multilib.bbclass                      |  4 +++-
 meta/classes/multilib_global.bbclass               |  4 ++--
 meta/classes/native.bbclass                        |  6 +++---
 meta/classes/populate_sdk_rpm.bbclass              |  2 +-
 meta/classes/rootfs_rpm.bbclass                    |  2 +-
 meta/classes/sanity.bbclass                        |  3 ++-
 meta/classes/update-rc.d.bbclass                   |  6 +++---
 meta/classes/useradd.bbclass                       | 24 +++++++++++-----------
 meta/conf/distro/include/default-distrovars.inc    |  2 +-
 meta/recipes-connectivity/openssl/openssl.inc      |  2 +-
 meta/recipes-core/coreutils/coreutils_6.9.bb       |  4 ++--
 meta/recipes-core/coreutils/coreutils_8.14.bb      |  4 ++--
 meta/recipes-core/dbus/dbus-glib.inc               |  4 ++--
 meta/recipes-core/dbus/dbus.inc                    | 12 +++++------
 meta/recipes-core/eglibc/eglibc-initial.inc        |  2 +-
 meta/recipes-core/eglibc/eglibc.inc                |  6 +++---
 meta/recipes-core/eglibc/eglibc_2.16.bb            |  2 +-
 meta/recipes-core/gettext/gettext_0.16.1.bb        |  4 ++--
 meta/recipes-core/gettext/gettext_0.18.1.1.bb      |  6 +++---
 meta/recipes-core/glib-2.0/glib-2.0_2.32.4.bb      |  6 +++---
 meta/recipes-core/glib-2.0/glib.inc                |  6 +++---
 meta/recipes-core/jpeg/jpeg_8d.bb                  |  2 +-
 meta/recipes-core/libxml/libxml2.inc               |  6 +++---
 meta/recipes-core/ncurses/ncurses.inc              |  4 ++--
 meta/recipes-core/uclibc/uclibc-initial_0.9.33.bb  |  2 +-
 meta/recipes-core/uclibc/uclibc-initial_git.bb     |  2 +-
 meta/recipes-core/uclibc/uclibc_0.9.33.bb          |  2 +-
 meta/recipes-core/uclibc/uclibc_git.bb             |  2 +-
 meta/recipes-core/util-linux/util-linux.inc        |  6 +++---
 meta/recipes-core/util-linux/util-linux_2.21.2.bb  |  2 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |  6 +++---
 meta/recipes-devtools/autoconf/autoconf_2.69.bb    |  2 +-
 meta/recipes-devtools/automake/automake_1.12.3.bb  |  8 ++++----
 meta/recipes-devtools/binutils/binutils_2.22.bb    |  4 ++--
 meta/recipes-devtools/bison/bison_2.3.bb           |  6 +++---
 meta/recipes-devtools/bison/bison_2.5.1.bb         |  6 +++---
 meta/recipes-devtools/chrpath/chrpath_0.14.bb      |  4 ++--
 meta/recipes-devtools/dpkg/dpkg.inc                | 10 ++++-----
 meta/recipes-devtools/elfutils/elfutils_0.148.bb   |  6 +++---
 meta/recipes-devtools/file/file_5.11.bb            |  4 ++--
 meta/recipes-devtools/flex/flex.inc                |  2 +-
 meta/recipes-devtools/git/git.inc                  |  4 ++--
 .../gnu-config/gnu-config_20120814.bb              |  2 +-
 meta/recipes-devtools/gnu-config/gnu-config_git.bb |  2 +-
 meta/recipes-devtools/guile/guile_2.0.6.bb         |  2 +-
 meta/recipes-devtools/insserv/insserv_1.14.0.bb    |  2 +-
 meta/recipes-devtools/intltool/intltool.inc        |  8 ++++----
 meta/recipes-devtools/intltool/intltool_0.50.0.bb  |  2 +-
 meta/recipes-devtools/opensp/opensp_1.5.2.bb       |  4 ++--
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  4 ++--
 meta/recipes-devtools/opkg/opkg.inc                |  8 ++++----
 .../perl/libxml-parser-perl_2.41.bb                |  2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb          |  2 +-
 meta/recipes-devtools/pkgconfig/pkgconfig.inc      |  8 ++++----
 meta/recipes-devtools/pseudo/pseudo.inc            | 12 +++++------
 .../python/python-pygobject_2.27.91.bb             |  4 ++--
 .../python/python-setuptools_0.6c11.bb             |  2 +-
 meta/recipes-devtools/python/python_2.7.3.bb       |  2 +-
 meta/recipes-devtools/qemu/qemu.inc                | 12 +++++------
 meta/recipes-devtools/qemu/qemu_1.2.0.bb           |  6 +++---
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |  6 +++---
 meta/recipes-devtools/rpm/rpmresolve_1.0.bb        |  2 +-
 meta/recipes-devtools/tcltk/tcl_8.5.11.bb          |  6 +++---
 .../unfs-server/unfs-server_2.1+2.2beta47.bb       |  4 ++--
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  4 ++--
 .../ghostscript/ghostscript_9.05.bb                | 10 ++++-----
 meta/recipes-extended/groff/groff_1.20.1.bb        |  4 ++--
 meta/recipes-extended/gzip/gzip_1.5.bb             |  2 +-
 .../recipes-extended/perl/libtimedate-perl_1.20.bb |  2 +-
 meta/recipes-extended/pigz/pigz.inc                |  2 +-
 meta/recipes-extended/stat/stat_3.3.bb             |  2 +-
 meta/recipes-extended/texinfo/texinfo_4.13a.bb     |  6 +++---
 meta/recipes-extended/unzip/unzip_6.0.bb           |  2 +-
 meta/recipes-gnome/gdk-pixbuf/gdk-pixbuf_2.24.1.bb |  6 +++---
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |  6 +++---
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |  4 ++--
 meta/recipes-gnome/gtk+/gtk+_2.24.8.bb             |  4 ++--
 meta/recipes-gnome/librsvg/librsvg_2.32.1.bb       |  4 ++--
 meta/recipes-graphics/freetype/freetype_2.4.10.bb  |  4 ++--
 meta/recipes-graphics/libsdl/libsdl_1.2.15.bb      |  2 +-
 meta/recipes-graphics/pango/pango.inc              |  2 +-
 meta/recipes-graphics/xcb/xcb-proto.inc            |  2 +-
 meta/recipes-graphics/xorg-app/mkfontdir_1.0.7.bb  |  2 +-
 .../recipes-graphics/xorg-font/font-alias_1.0.3.bb |  2 +-
 meta/recipes-graphics/xorg-font/font-util_1.3.0.bb |  4 ++--
 meta/recipes-kernel/systemtap/systemtap_git.bb     |  4 ++--
 meta/recipes-support/apr/apr-util_1.4.1.bb         |  4 ++--
 meta/recipes-support/attr/ea-acl.inc               |  4 ++--
 meta/recipes-support/boost/boost.inc               | 12 +++++------
 .../createrepo/createrepo_0.4.11.bb                |  4 ++--
 meta/recipes-support/curl/curl_7.26.0.bb           |  8 ++++----
 meta/recipes-support/icu/icu-3.6.inc               |  4 ++--
 meta/recipes-support/libcap/libcap.inc             |  8 +++-----
 meta/recipes-support/neon/neon_0.29.6.bb           |  2 +-
 .../shared-mime-info/shared-mime-info.inc          |  4 ++--
 meta/recipes-support/sqlite/sqlite3.inc            |  4 ++--
 98 files changed, 222 insertions(+), 221 deletions(-)

-- 
1.7.11.2



