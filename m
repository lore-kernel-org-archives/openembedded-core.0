Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1RQQBu-0001VX-Es
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Nov 2011 22:05:14 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 15 Nov 2011 12:58:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.69,517,1315206000"; d="scan'208";a="37410678"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.35])
	by AZSMGA002.ch.intel.com with ESMTP; 15 Nov 2011 12:58:50 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2011 12:58:32 -0800
Message-Id: <cover.1321389699.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [CONSOLIDATED PULL 00/16] Various Updates and Fixes
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
X-List-Received-Date: Tue, 15 Nov 2011 21:05:15 -0000

Richard,

This request has the patches to correctly build subversion-native,
I tested this and ensured we do not have a circular dependency issue.

I am not sure about the FILESDIR addition in the libx11-diet patch, so I 
would like you review of that one.

Thanks
	Sau!


The following changes since commit da8425174529f10e16cde21fbea7f804284c38ae:

  alsa-lib: add nativesdk BBCLASSEXTEND (2011-11-15 12:22:58 +0000)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/stage

Dmitry Eremin-Solenikov (2):
  screenshot: rename to sato-screenshot
  gobject-introspection: update frome meta-oe

Martin Jansa (3):
  base.bbclass: add subversion-native to DEPENDS if there is svn:// in
    SRC_URI
  default-providers: add alsa to resolve multiple runtime providers
  apr-util: extend sed call to fix libtool patch for case without SHELL
    in LIBTOOL variable

Michael Brown (1):
  gcc-4.6: fix toolchain build for SH4

Saul Wold (8):
  libgcrypt: add BBCLASSEXTEND native for gnutls-native
  libgpg-error: add BBCLASSEXTEND native for libgcrypts and
    gnutls-native
  file: update to 5.09
  gnu-config: update to git HEAD
  gnu-config: Create 2011111 release
  bitbake.conf: Update ASSUME_PROVIDED
  boost: Update to 1.47.0 & Cleanup
  distro_tracking: Refect Recipe Updates & Status

Xiaofeng Yan (2):
  libx11-diet: update to 1.4.4
  directfb: update to 1.4.15

 meta/classes/base.bbclass                          |    8 +-
 meta/conf/bitbake.conf                             |    5 -
 meta/conf/distro/include/default-providers.inc     |    1 +
 .../conf/distro/include/distro_tracking_fields.inc |   50 ++--
 .../file/file/fix_version_check.patch              |   21 ++
 .../file/{file_5.04.bb => file_5.09.bb}            |    9 +-
 meta/recipes-devtools/gcc/gcc-cross4.inc           |    2 +
 .../gnu-config/config-guess-uclibc.patch           |  145 +++++------
 .../gnu-config/gnu-config_20111111.bb              |   41 +++
 .../{gnu-config_20080123.bb => gnu-config_git.bb}  |   15 +-
 .../gnome/gobject-introspection/configure.patch    |   27 --
 .../gnome/gobject-introspection/pathfix.patch      |   27 --
 .../use-usr-bin-env-for-python.patch               |   20 ++
 .../gnome/gobject-introspection_git.bb             |   32 ++-
 .../{directfb_1.4.12.bb => directfb_1.4.15.bb}     |    9 +-
 .../directfb-1.2.x-fix-pkgconfig-cflags.patch      |   36 ++--
 .../xorg-lib/libx11-diet-1.3/include_fix.patch     |   25 --
 .../xorg-lib/libx11-diet-1.3/nodolt.patch          |   14 -
 .../X18NCMSstubs.diff                              |    1 +
 .../fix-disable-xlocale.diff                       |    1 +
 .../fix-utf8-wrong-define.patch                    |    2 +
 .../libx11-diet-1.4.4/keysymdef_include.patch      |   23 ++
 .../x11_disable_makekeys.patch                     |   23 +-
 .../{libx11-diet_1.3.bb => libx11-diet_1.4.4.bb}   |   17 +-
 .../files/fix_ldadd_order.patch                    |    0
 .../sato-screenshot_git.bb}                        |    2 +-
 meta/recipes-sato/tasks/task-core-x11.bb           |    2 +-
 meta/recipes-support/apr/apr-util_1.3.12.bb        |    2 +
 meta/recipes-support/boost/boost-jam-native.inc    |   32 ---
 .../boost/boost-jam-native_3.1.18.bb               |    8 -
 .../boost/{boost-36.inc => boost.inc}              |   42 +++-
 .../boost/{boost_1.44.0.bb => boost_1.47.0.bb}     |   13 +-
 .../recipes-support/boost/files/1.34.1-gcc43.patch |  226 -----------------
 .../boost/files/atomic_count_gcc_atomicity.patch   |   15 --
 meta/recipes-support/boost/files/gcc41.patch       |   16 --
 meta/recipes-support/boost/files/gcc43.patch       |  258 --------------------
 .../recipes-support/boost/files/linux-uclibc.patch |   12 -
 .../boost/files/unit_test_log10f.patch             |   22 --
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    2 +
 .../libgpg-error/libgpg-error_1.10.bb              |    2 +
 40 files changed, 339 insertions(+), 869 deletions(-)
 create mode 100644 meta/recipes-devtools/file/file/fix_version_check.patch
 rename meta/recipes-devtools/file/{file_5.04.bb => file_5.09.bb} (79%)
 create mode 100644 meta/recipes-devtools/gnu-config/gnu-config_20111111.bb
 rename meta/recipes-devtools/gnu-config/{gnu-config_20080123.bb => gnu-config_git.bb} (73%)
 delete mode 100644 meta/recipes-gnome/gnome/gobject-introspection/configure.patch
 delete mode 100644 meta/recipes-gnome/gnome/gobject-introspection/pathfix.patch
 create mode 100644 meta/recipes-gnome/gnome/gobject-introspection/use-usr-bin-env-for-python.patch
 rename meta/recipes-graphics/directfb/{directfb_1.4.12.bb => directfb_1.4.15.bb} (63%)
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/include_fix.patch
 delete mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.3/nodolt.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/X18NCMSstubs.diff (99%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-disable-xlocale.diff (90%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/fix-utf8-wrong-define.patch (88%)
 create mode 100644 meta/recipes-graphics/xorg-lib/libx11-diet-1.4.4/keysymdef_include.patch
 rename meta/recipes-graphics/xorg-lib/{libx11-diet-1.3 => libx11-diet-1.4.4}/x11_disable_makekeys.patch (43%)
 rename meta/recipes-graphics/xorg-lib/{libx11-diet_1.3.bb => libx11-diet_1.4.4.bb} (49%)
 rename meta/recipes-sato/{screenshot => sato-screenshot}/files/fix_ldadd_order.patch (100%)
 rename meta/recipes-sato/{screenshot/screenshot_git.bb => sato-screenshot/sato-screenshot_git.bb} (92%)
 delete mode 100644 meta/recipes-support/boost/boost-jam-native.inc
 delete mode 100644 meta/recipes-support/boost/boost-jam-native_3.1.18.bb
 rename meta/recipes-support/boost/{boost-36.inc => boost.inc} (88%)
 rename meta/recipes-support/boost/{boost_1.44.0.bb => boost_1.47.0.bb} (66%)
 delete mode 100644 meta/recipes-support/boost/files/1.34.1-gcc43.patch
 delete mode 100644 meta/recipes-support/boost/files/atomic_count_gcc_atomicity.patch
 delete mode 100644 meta/recipes-support/boost/files/gcc41.patch
 delete mode 100644 meta/recipes-support/boost/files/gcc43.patch
 delete mode 100644 meta/recipes-support/boost/files/linux-uclibc.patch
 delete mode 100644 meta/recipes-support/boost/files/unit_test_log10f.patch

-- 
1.7.6.4



