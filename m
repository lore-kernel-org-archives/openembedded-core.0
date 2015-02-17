Return-Path: <alejandro.hernandez@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 700007182C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Feb 2015 22:22:33 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP; 17 Feb 2015 14:22:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,595,1418112000"; d="scan'208";a="653495509"
Received: from unknown (HELO aehernan-DevStation.zpn.intel.com)
	([10.219.4.158])
	by orsmga001.jf.intel.com with ESMTP; 17 Feb 2015 14:22:34 -0800
From: Alejandro Hernandez <alejandro.hernandez@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Feb 2015 16:22:37 -0600
Message-Id: <cover.1424210642.git.alejandro.hernandez@linux.intel.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH v2 0/1] Python: Upgrade from 2.7.3 to 2.7.9
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
X-List-Received-Date: Tue, 17 Feb 2015 22:22:35 -0000

I tested build locally on my machine, on a Minnowboard MAX build
and on the Autobuilder using archs qemux86, qemux86-64, qemuarm,
qemuppc, qemumips.

Also ran some personal python programs to test runtime behavior
everything seemed to work fine.

v2 is now rebased due to some changes in the manifest file and
a backported patch made in the last few weeks.

- Based on Paul Eggletons work to partially upgrade to Python 2.7.6


The following changes since commit 51bdf3ba5f229f2a6ff60661b82912bb95591381:

  ref-manual: Review edits to the AUTOREV variable. (2015-02-17 15:17:03 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib hsalejandro/py2uprebased
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=hsalejandro/py2uprebased

Alejandro Hernandez (1):
  Python: Upgrade from 2.7.3 to 2.7.9:

 meta/conf/distro/include/default-versions.inc      |    4 +-
 .../python/python-2.7-manifest.inc                 |    8 +-
 .../python/python-native/multilib.patch            |  104 +-
 .../python/python-native/nohostlibs.patch          |   49 +-
 ...thon-native_2.7.3.bb => python-native_2.7.9.bb} |    6 +-
 meta/recipes-devtools/python/python.inc            |   10 +-
 .../01-use-proper-tools-for-cross-build.patch      |  137 +-
 .../python/python/03-fix-tkinter-detection.patch   |   26 +-
 .../python/05-enable-ctypes-cross-build.patch      |   17 +-
 .../06-avoid_usr_lib_termcap_path_in_linking.patch |   16 +-
 .../python/06-ctypes-libffi-fix-configure.patch    |   44 -
 .../python/python/CVE-2013-4073_py27.patch         |  251 ----
 .../python/avoid_warning_about_tkinter.patch       |   15 +-
 meta/recipes-devtools/python/python/builddir.patch |   27 +-
 .../python/fix_for_using_different_libdir.patch    |   63 +-
 .../python/gcc-4.8-fix-configure-Wformat.patch     |   20 -
 .../python/python/host_include_contamination.patch |   23 +-
 .../python/python/json-flaw-fix.patch              |   27 -
 meta/recipes-devtools/python/python/multilib.patch |  205 +--
 .../python/python/posix_close.patch                |   43 -
 .../python/python/pypirc-secure.patch              |   35 -
 .../python/python/python-2.7.3-CVE-2012-2135.patch |   73 -
 .../python-2.7.3-CVE-2013-1752-smtplib-fix.patch   |  101 --
 .../python/python/python-2.7.3-CVE-2014-1912.patch |   26 -
 .../python/python/python-2.7.3-CVE-2014-7185.patch |   75 -
 .../python/python-2.7.3-berkeley-db-5.3.patch      | 1572 --------------------
 .../python-fix-build-error-with-Readline-6.3.patch |   62 -
 .../python/python/python2.7.3-nossl3.patch         |   37 -
 .../python/python/remove-BOM-insection-code.patch  |   24 -
 .../python/python/remove_sqlite_rpath.patch        |   19 -
 ...search_db_h_in_inc_dirs_and_avoid_warning.patch |   23 +-
 .../use_sysroot_ncurses_instead_of_host.patch      |   20 +
 .../python/{python_2.7.3.bb => python_2.7.9.bb}    |   22 +-
 scripts/contrib/python/generate-manifest-2.7.py    |    4 +-
 34 files changed, 368 insertions(+), 2820 deletions(-)
 rename meta/recipes-devtools/python/{python-native_2.7.3.bb => python-native_2.7.9.bb} (90%)
 delete mode 100644 meta/recipes-devtools/python/python/06-ctypes-libffi-fix-configure.patch
 delete mode 100644 meta/recipes-devtools/python/python/CVE-2013-4073_py27.patch
 delete mode 100644 meta/recipes-devtools/python/python/gcc-4.8-fix-configure-Wformat.patch
 delete mode 100644 meta/recipes-devtools/python/python/json-flaw-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/posix_close.patch
 delete mode 100644 meta/recipes-devtools/python/python/pypirc-secure.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2012-2135.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2013-1752-smtplib-fix.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-1912.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-CVE-2014-7185.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-2.7.3-berkeley-db-5.3.patch
 delete mode 100644 meta/recipes-devtools/python/python/python-fix-build-error-with-Readline-6.3.patch
 delete mode 100644 meta/recipes-devtools/python/python/python2.7.3-nossl3.patch
 delete mode 100644 meta/recipes-devtools/python/python/remove-BOM-insection-code.patch
 delete mode 100644 meta/recipes-devtools/python/python/remove_sqlite_rpath.patch
 create mode 100644 meta/recipes-devtools/python/python/use_sysroot_ncurses_instead_of_host.patch
 rename meta/recipes-devtools/python/{python_2.7.3.bb => python_2.7.9.bb} (89%)

-- 
1.9.1


