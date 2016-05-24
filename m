Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id BB91460118
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 11:53:52 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 24 May 2016 04:53:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,359,1459839600"; d="scan'208";a="109497951"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 24 May 2016 04:53:39 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:53:49 +0300
Message-Id: <cover.1464088997.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 00/45] Move recipes to use Python 3 whenever possible
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
X-List-Received-Date: Tue, 24 May 2016 11:53:53 -0000

This patchset updates recipes to use Python 3 whenever possible. A few items
cannot be moved at the moment for various reasons, here they are:

1) Smartpm package manager has not been ported to Python 3 and it is unlikely
to happen:
https://github.com/smartpm/smart/issues/4
We need to look into alternatives such as yum or dnf (the 'next generation' fork of yum).

Consequently, rpm's python bindings (required by smartpm) stay at python 2 as well
for now, even tough python 3 seems to be supported.

2) Scons build system is python 2 only, due to lack of resources.

3) createrepo recipe is using an upstream version from 2007, before createrepo was
rewritten on top of yum's python modules.

We need to look into adding yum recipe which will allow updating createrepo to latest upstream.
Also, libxml2 is currently a createrepo dependency, and so stays at Python 2 for now.

4) varous recipes that haven't been ported: kconfig-frontends, mklibs, opkg-utils,
ltp, mc, parted, libepoxy, mesa, perf, rt-tests, webkitgtk.

5) LSB spec is implicitly requiring Python 2 (via requirement for '/usr/bin/python').

6) gobject introspection has been ported to Python 3 in release 1.48. I'll send this
update separately, as a part of normal version update patches.

7) piglit has been ported to Python 3 as well in the latest upstream releases, Jussi
Kukkonen should take care of it. I've added piglit's python dependencies in their
Python 3 versions - python3-mako and python3-numpy, so that the task should be a little
easier.

The following changes since commit c7e614c438706fb3ed7520b4990ebb3973366942:

  useradd: Fix infinite build loop (2016-05-23 10:33:45 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/deprecate-python2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/deprecate-python2

Alexander Kanavin (45):
  python-native, python3-native: remove the use of exported HOST_SYS and
    BUILD_SYS variables
  distutils-native-base.bbclass, distutils3-native-base.bbclass: remove
  python3-dir.bbclass: add a separate class for Python 3
  default-versions.inc: drop python-related defaults
  sip.bbclass: remove
  avahi-ui: remove support for building a python module
  bind: switch Python dependency to Python 3.x
  python-dbus: update to 1.2.4, port to python 3
  python3: manipulate all of the config*/Makefile files, not just
    config/Makefile
  python3: drop 110-enable-zlib.patch
  glib: move to Python 3
  dbus-test: remove unneeded pygobject dependency
  python-pygobject: port to Python 3
  neard: do not package python test scripts
  bluez5: switch to Python 3
  connman: do not install Python test scripts
  ofono: drop the custom-made revert to Python 2 from Python 3
  packagegroup-core-full-cmdline: drop python-dbus from the list of
    services
  nfs-utils: switch to Python 3
  systemd: drop python dependency for ptests
  util-linux: move to Python 3
  python-pycairo: move to Python 3
  bootchart2: move to Python 3
  gdb: move to Python 3
  git: remove Python package (to which nothing was packaged)
  qemu: remove runtime python dependency
  subversion: remove unnecessary python dependency
  swig: move to Python 3
  python-pyrex: remove unused recipe
  python-imaging: remove unused recipe
  python-docutils: move to Python 3
  cracklib: disable building the python module
  libuser: move to Python 3
  libnewt-python: move to Python 3
  gnome-doc-utils: remove recipe
  lttng-tools: move to Python 3
  lttng-ust: move to Python 3
  systemtap: move to Python 3
  libcap-ng: move to Python 3
  hwlatdetect: move to Python 3
  python3-mako: add a Python 3 recipe
  python3-nose: add a recipe
  python3: add = to -L linking option only when the path is absolute
  python-numpy: move recipe to own directory
  python3-numpy: add a recipe

 meta/classes/distutils-common-base.bbclass         |    2 -
 meta/classes/distutils-native-base.bbclass         |    3 -
 meta/classes/distutils-tools.bbclass               |    4 -
 meta/classes/distutils.bbclass                     |    4 -
 meta/classes/distutils3-base.bbclass               |    3 -
 meta/classes/distutils3-native-base.bbclass        |    4 -
 meta/classes/distutils3.bbclass                    |   24 -
 meta/classes/gobject-introspection.bbclass         |    2 -
 meta/classes/python-dir.bbclass                    |    6 +-
 meta/classes/python3-dir.bbclass                   |    5 +
 meta/classes/python3native.bbclass                 |    4 +-
 meta/classes/sip.bbclass                           |   61 -
 meta/conf/distro/include/default-versions.inc      |    5 -
 meta/conf/distro/include/distro_alias.inc          |    2 -
 meta/conf/distro/include/security_flags.inc        |    1 -
 meta/recipes-connectivity/avahi/avahi-ui_0.6.32.bb |   11 +-
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |    4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |    6 +-
 meta/recipes-connectivity/connman/connman.inc      |    6 +-
 meta/recipes-connectivity/neard/neard_0.15.bb      |   13 +-
 .../nfs-utils/nfs-utils_1.3.3.bb                   |    6 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    6 +-
 .../ofono/Revert-test-Convert-to-Python-3.patch    | 1270 --------------------
 meta/recipes-connectivity/ofono/ofono_1.17.bb      |    1 -
 meta/recipes-core/dbus/dbus-test_1.10.6.bb         |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |   11 +-
 meta/recipes-core/libxml/libxml2_2.9.3.bb          |    2 -
 meta/recipes-core/systemd/systemd_229.bb           |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   11 +-
 .../bootchart2/bootchart2_0.14.8.bb                |   16 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   12 +-
 meta/recipes-devtools/gdb/gdb-cross.inc            |    6 +-
 meta/recipes-devtools/gdb/gdb_7.11.bb              |    6 +-
 meta/recipes-devtools/git/git.inc                  |    7 +-
 ...h-usr-and-so-on-for-libraries-by-default-.patch |    0
 .../files}/aarch64/_numpyconfig.h                  |    0
 .../files/aarch64}/config.h                        |    0
 .../files}/add-glibc-check.patch                   |    0
 .../mipsel => python-numpy/files/arm}/config.h     |    0
 .../files/arm}/numpyconfig.h                       |    0
 .../files}/armeb/config.h                          |    0
 .../files}/armeb/numpyconfig.h                     |    0
 .../files}/mips/_numpyconfig.h                     |    0
 .../files}/mips/config.h                           |    0
 .../files/mips64}/_numpyconfig.h                   |    0
 .../files/mips64}/config.h                         |    0
 .../files}/mips64n32/_numpyconfig.h                |    0
 .../files/mips64n32}/config.h                      |    0
 .../arm => python-numpy/files/mipsel}/config.h     |    0
 .../files/mipsel}/numpyconfig.h                    |    0
 .../files}/powerpc/_numpyconfig.h                  |    0
 .../files}/powerpc/config.h                        |    0
 .../files/powerpc64}/_numpyconfig.h                |    0
 .../files/powerpc64}/config.h                      |    0
 .../files}/remove-build-path-in-comments.patch     |    0
 .../files}/x86-64/_numpyconfig.h                   |    0
 .../files}/x86-64/config.h                         |    0
 .../files}/x86/config.h                            |    0
 .../files}/x86/numpyconfig.h                       |    0
 .../python-numpy_1.10.4.bb                         |    1 -
 .../python-numpy/python3-numpy_1.10.4.bb           |  101 ++
 ...ing-setup.py-force-paths-for-zlib-freetyp.patch |   55 -
 .../allow.to.disable.some.features.patch           |   65 -
 .../python-imaging/fix-freetype-includes.patch     |   30 -
 .../python/python-imaging_1.1.7.bb                 |   45 -
 meta/recipes-devtools/python/python-mako_1.0.3.bb  |    6 +
 ...2-distutils-prefix-is-inside-staging-area.patch |   65 -
 .../python/python-native_2.7.11.bb                 |    4 +-
 .../python/python-pycairo_1.10.0.bb                |   41 -
 .../python/python-pyrex-native_0.9.9.bb            |    5 -
 .../python-pyrex/pyrex-fix-optimized-mode.patch    |   15 -
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |   22 -
 ...et-the-prefix-to-be-inside-staging-direct.patch |   51 +
 ...{python-dbus_1.2.0.bb => python3-dbus_1.2.4.bb} |   22 +-
 ...n-docutils_0.12.bb => python3-docutils_0.12.bb} |    4 +-
 meta/recipes-devtools/python/python3-mako_1.0.3.bb |   24 +
 .../python/python3-native_3.5.1.bb                 |    3 -
 meta/recipes-devtools/python/python3-nose_1.3.7.bb |   24 +
 .../python/python3-pycairo_1.10.0.bb               |   40 +
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch |    0
 ...bject_3.18.2.bb => python3-pygobject_3.18.2.bb} |    8 +-
 .../python/python3/110-enable-zlib.patch           |   21 -
 ...2-distutils-prefix-is-inside-staging-area.patch |   49 +-
 .../python/python3/unixccompiler.patch             |    6 +-
 meta/recipes-devtools/python/python3_3.5.1.bb      |    8 +-
 meta/recipes-devtools/python/python_2.7.11.bb      |    3 -
 meta/recipes-devtools/qemu/qemu.inc                |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4+cvs.bb           |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |    2 +-
 .../subversion/subversion_1.9.3.bb                 |    2 +-
 meta/recipes-devtools/swig/swig.inc                |    7 +-
 meta/recipes-extended/cracklib/cracklib_2.9.5.bb   |   25 +-
 meta/recipes-extended/libuser/libuser_0.62.bb      |    8 +-
 .../newt/libnewt-python_0.52.18.bb                 |    6 +-
 meta/recipes-extended/newt/libnewt_0.52.18.bb      |    3 -
 .../packagegroup-core-full-cmdline.bb              |    1 -
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |    1 -
 .../gnome-desktop/gnome-desktop3_3.18.2.bb         |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |   29 -
 .../gnome-doc-utils/sysrooted-pkg-config.patch     |   35 -
 .../use-usr-bin-env-for-python-in-xml2po.patch     |   30 -
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |   95 --
 .../recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb |   12 -
 .../gobject-introspection_1.46.0.bb                |    2 -
 ...d-look-for-python-3.0-when-building-pytho.patch |   30 -
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |    7 +-
 meta/recipes-kernel/lttng/lttng-ust_git.bb         |    9 +-
 meta/recipes-kernel/perf/perf.bb                   |    2 -
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    5 +-
 meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb       |    5 +-
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  |   12 +-
 112 files changed, 384 insertions(+), 2198 deletions(-)
 delete mode 100644 meta/classes/distutils-native-base.bbclass
 delete mode 100644 meta/classes/distutils3-native-base.bbclass
 create mode 100644 meta/classes/python3-dir.bbclass
 delete mode 100644 meta/classes/sip.bbclass
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/Revert-test-Convert-to-Python-3.patch
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/aarch64/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/powerpc64 => python-numpy/files/aarch64}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/add-glibc-check.patch (100%)
 rename meta/recipes-devtools/{python/python-numpy/mipsel => python-numpy/files/arm}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mipsel => python-numpy/files/arm}/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/armeb/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/armeb/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/mips/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/mips/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/powerpc64 => python-numpy/files/mips64}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mips64n32 => python-numpy/files/mips64}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/mips64n32/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mips64 => python-numpy/files/mips64n32}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/arm => python-numpy/files/mipsel}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/arm => python-numpy/files/mipsel}/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/powerpc/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/powerpc/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/mips64 => python-numpy/files/powerpc64}/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy/aarch64 => python-numpy/files/powerpc64}/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/remove-build-path-in-comments.patch (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86-64/_numpyconfig.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86-64/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86/config.h (100%)
 rename meta/recipes-devtools/{python/python-numpy => python-numpy/files}/x86/numpyconfig.h (100%)
 rename meta/recipes-devtools/{python => python-numpy}/python-numpy_1.10.4.bb (98%)
 create mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb
 delete mode 100644 meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging_1.1.7.bb
 delete mode 100644 meta/recipes-devtools/python/python-native/12-distutils-prefix-is-inside-staging-area.patch
 delete mode 100644 meta/recipes-devtools/python/python-pycairo_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
 delete mode 100644 meta/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
 delete mode 100644 meta/recipes-devtools/python/python-pyrex_0.9.9.bb
 create mode 100644 meta/recipes-devtools/python/python/0001-distutils-set-the-prefix-to-be-inside-staging-direct.patch
 rename meta/recipes-devtools/python/{python-dbus_1.2.0.bb => python3-dbus_1.2.4.bb} (53%)
 rename meta/recipes-devtools/python/{python-docutils_0.12.bb => python3-docutils_0.12.bb} (92%)
 create mode 100644 meta/recipes-devtools/python/python3-mako_1.0.3.bb
 create mode 100644 meta/recipes-devtools/python/python3-nose_1.3.7.bb
 create mode 100644 meta/recipes-devtools/python/python3-pycairo_1.10.0.bb
 rename meta/recipes-devtools/python/{python-pygobject => python3-pygobject}/0001-configure.ac-add-sysroot-path-to-GI_DATADIR-don-t-se.patch (100%)
 rename meta/recipes-devtools/python/{python-pygobject_3.18.2.bb => python3-pygobject_3.18.2.bb} (72%)
 delete mode 100644 meta/recipes-devtools/python/python3/110-enable-zlib.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils.inc
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/sysrooted-pkg-config.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/use-usr-bin-env-for-python-in-xml2po.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils/xsltproc_nonet.patch
 delete mode 100644 meta/recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb
 delete mode 100644 meta/recipes-kernel/lttng/lttng-tools/Revert-Build-look-for-python-3.0-when-building-pytho.patch

-- 
2.8.1


