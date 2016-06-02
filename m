Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C6729772A4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jun 2016 09:26:22 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga102.jf.intel.com with ESMTP; 02 Jun 2016 02:26:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,405,1459839600"; d="scan'208";a="114703300"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by fmsmga004.fm.intel.com with ESMTP; 02 Jun 2016 02:26:13 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Jun 2016 12:25:37 +0300
Message-Id: <cover.1464859158.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.8.1
Subject: [PATCH 00/31] Switch oe-core to Python 3
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
X-List-Received-Date: Thu, 02 Jun 2016 09:26:26 -0000

This is an updated and rebased patchset that switches oe-core
recipes to Python 3 whenever possible. See here for an overview:
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/121915.html

Changes:
- fixed issues found via autobuilder testing: gdbus-codegen issue and
python3-dbus issue are fixed explicitly; python3-numpy failure has
disappeared somewhere between rebasing and fixing those other items:
http://lists.openembedded.org/pipermail/openembedded-core/2016-May/122257.html

The following changes since commit 3c42280b8a5cac184311a59589849fec4e215a14:

  sanity: Drop setting C locale (2016-06-01 15:05:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib akanavin/deprecate-python2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=akanavin/deprecate-python2

Alexander Kanavin (31):
  bind: switch Python dependency to Python 3.x
  python-dbus: update to 1.2.4, port to python 3
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
  swig: move to Python 3
  python-pyrex: remove unused recipe
  python-imaging: remove unused recipe
  python-docutils: move to Python 3
  libuser: move to Python 3
  libnewt-python: move to Python 3
  gnome-doc-utils: remove recipe
  lttng-tools: move to Python 3
  lttng-ust: move to Python 3
  systemtap: move to Python 3
  libcap-ng: move to Python 3
  hwlatdetect: move to Python 3
  python3-numpy: add a recipe
  automake: drop the Python scriptlets to determine Python's directories

 meta/conf/distro/include/distro_alias.inc          |    2 -
 meta/conf/distro/include/security_flags.inc        |    1 -
 meta/recipes-connectivity/bind/bind_9.10.3-P3.bb   |    4 +-
 meta/recipes-connectivity/bluez5/bluez5.inc        |    6 +-
 meta/recipes-connectivity/connman/connman.inc      |    6 +-
 meta/recipes-connectivity/neard/neard_0.15.bb      |   13 +-
 .../nfs-utils/nfs-utils_1.3.3.bb                   |    6 +-
 meta/recipes-connectivity/ofono/ofono.inc          |    6 +-
 .../ofono/Revert-test-Convert-to-Python-3.patch    | 1270 --------------------
 meta/recipes-connectivity/ofono/ofono_1.17.bb      |    1 -
 meta/recipes-core/dbus/dbus-test_1.10.6.bb         |    2 +-
 meta/recipes-core/glib-2.0/glib.inc                |    8 +-
 meta/recipes-core/systemd/systemd_229.bb           |    2 +-
 meta/recipes-core/util-linux/util-linux.inc        |   11 +-
 .../automake/automake/python-libdir.patch          |   62 +-
 .../bootchart2/bootchart2_0.14.8.bb                |   16 +-
 meta/recipes-devtools/gdb/gdb-common.inc           |    2 +-
 meta/recipes-devtools/gdb/gdb-cross-canadian.inc   |   12 +-
 meta/recipes-devtools/gdb/gdb-cross.inc            |    4 +-
 meta/recipes-devtools/gdb/gdb_7.11.bb              |    6 +-
 .../python-numpy/python3-numpy_1.10.4.bb           |  101 ++
 ...ing-setup.py-force-paths-for-zlib-freetyp.patch |   55 -
 .../allow.to.disable.some.features.patch           |   65 -
 .../python-imaging/fix-freetype-includes.patch     |   30 -
 .../python/python-imaging_1.1.7.bb                 |   45 -
 .../python/python-pycairo_1.10.0.bb                |   41 -
 .../python/python-pyrex-native_0.9.9.bb            |    5 -
 .../python-pyrex/pyrex-fix-optimized-mode.patch    |   15 -
 meta/recipes-devtools/python/python-pyrex_0.9.9.bb |   22 -
 ...{python-dbus_1.2.0.bb => python3-dbus_1.2.4.bb} |   19 +-
 ...n-docutils_0.12.bb => python3-docutils_0.12.bb} |    4 +-
 .../python/python3-native_3.5.1.bb                 |    1 -
 .../python/python3-pycairo_1.10.0.bb               |   40 +
 ...c-add-sysroot-path-to-GI_DATADIR-don-t-se.patch |    0
 ...bject_3.18.2.bb => python3-pygobject_3.18.2.bb} |    8 +-
 .../python/python3/110-enable-zlib.patch           |   21 -
 meta/recipes-devtools/python/python3_3.5.1.bb      |    1 -
 meta/recipes-devtools/swig/swig.inc                |    7 +-
 meta/recipes-extended/libuser/libuser_0.62.bb      |    8 +-
 .../newt/libnewt-python_0.52.18.bb                 |    6 +-
 .../packagegroup-core-full-cmdline.bb              |    1 -
 meta/recipes-gnome/epiphany/epiphany_3.18.4.bb     |    1 -
 .../gnome-desktop/gnome-desktop3_3.18.2.bb         |    2 +-
 meta/recipes-gnome/gnome/gnome-doc-utils.inc       |   29 -
 .../gnome-doc-utils/sysrooted-pkg-config.patch     |   35 -
 .../use-usr-bin-env-for-python-in-xml2po.patch     |   30 -
 .../gnome/gnome-doc-utils/xsltproc_nonet.patch     |   95 --
 .../recipes-gnome/gnome/gnome-doc-utils_0.20.10.bb |   12 -
 ...d-look-for-python-3.0-when-building-pytho.patch |   30 -
 meta/recipes-kernel/lttng/lttng-tools_git.bb       |    7 +-
 meta/recipes-kernel/lttng/lttng-ust_git.bb         |    9 +-
 meta/recipes-kernel/systemtap/systemtap_git.bb     |    5 +-
 meta/recipes-rt/rt-tests/hwlatdetect_0.96.bb       |    6 +-
 meta/recipes-support/libcap-ng/libcap-ng_0.7.7.bb  |   12 +-
 54 files changed, 285 insertions(+), 1923 deletions(-)
 delete mode 100644 meta/recipes-connectivity/ofono/ofono/Revert-test-Convert-to-Python-3.patch
 create mode 100644 meta/recipes-devtools/python-numpy/python3-numpy_1.10.4.bb
 delete mode 100644 meta/recipes-devtools/python/python-imaging/0001-python-imaging-setup.py-force-paths-for-zlib-freetyp.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging/allow.to.disable.some.features.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging/fix-freetype-includes.patch
 delete mode 100644 meta/recipes-devtools/python/python-imaging_1.1.7.bb
 delete mode 100644 meta/recipes-devtools/python/python-pycairo_1.10.0.bb
 delete mode 100644 meta/recipes-devtools/python/python-pyrex-native_0.9.9.bb
 delete mode 100644 meta/recipes-devtools/python/python-pyrex/pyrex-fix-optimized-mode.patch
 delete mode 100644 meta/recipes-devtools/python/python-pyrex_0.9.9.bb
 rename meta/recipes-devtools/python/{python-dbus_1.2.0.bb => python3-dbus_1.2.4.bb} (55%)
 rename meta/recipes-devtools/python/{python-docutils_0.12.bb => python3-docutils_0.12.bb} (92%)
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


