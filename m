Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 391C571B2A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Feb 2017 10:34:29 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga105.fm.intel.com with ESMTP; 20 Feb 2017 02:34:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,186,1484035200"; d="scan'208";a="227450376"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 20 Feb 2017 02:34:29 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Feb 2017 12:34:28 +0200
Message-Id: <20170220103428.19790-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCH 00/20] support profile-optimized build for Python
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
X-List-Received-Date: Mon, 20 Feb 2017 10:34:30 -0000

This patchset makes it possible to build Python with
profile-guided-optimization (PGO) enabled. Both Python 2.7 and Python 3 as well
as native and target recipes are supported. The patchset is basically identical
to the two RFC patchsets (separate for Python 2 and Python 3) I posted earlier
- I just rebased those on top of the latest master.


The following changes since commit def3800c7e58d9d1b54ea1df27b190a0f6d1d544:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:38:59 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338


Markus Lehtonen (20):
  python-native: support profile optimized build
  python: add python-profile-opt recipe
  python: remove path hack from setup.py
  python-profile-opt: rename libpython
  devtools/images: add python-pgo-image
  python: make profile-optimized build possible
  python-pgo-image: exclude tests from the default profile target
  python: add python-tools subpackage
  python-pgo-image: switch python default profile task to pybench
  python-pgo-image: enable sstate for do_profile
  python3-native: support profile optimized build
  python3: fix depends of python-tests
  python3: add python-profile-opt3 recipe
  python-pgo-image: profiling for python3
  python3: remove two setup.py cross-compile hacks
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python-pgo-image: exclude tests from the python3 profile target
  python3: add python3-tools subpackage
  python-pgo-image: change python3 profile target to pybench

 meta/recipes-devtools/images/python-pgo-image.bb   | 114 +++++++++++++++++++++
 .../python/python-2.7-manifest.inc                 |   8 +-
 .../python/python-3.5-manifest.inc                 |  10 +-
 ...x-.so-loading-when-when-running-profile-t.patch |  26 +++++
 .../python/python-native_2.7.12.bb                 |  10 ++
 meta/recipes-devtools/python/python-profile-opt3   |   1 +
 .../python/python-profile-opt3_3.5.2.bb            |  15 +++
 .../python/python-profile-opt_2.7.12.bb            |  13 +++
 .../01-use-proper-tools-for-cross-build.patch      |  10 --
 ...rename-libpython-to-libpython-profile-opt.patch |  94 +++++++++++++++++
 .../python/python3-native_3.5.2.bb                 |   9 ++
 .../python/python3/000-cross-compile.patch         |   9 --
 ...efile-add-install_generate_profile-target.patch |  25 +++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch |  56 ++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    |  33 ------
 ...name-libpython3-to-libpython-profile-opt3.patch | 111 ++++++++++++++++++++
 .../setup.py-find-libraries-in-staging-dirs.patch  |  30 ------
 meta/recipes-devtools/python/python3_3.5.2.bb      |  74 +++++++++----
 meta/recipes-devtools/python/python_2.7.12.bb      |  54 ++++++++--
 19 files changed, 583 insertions(+), 119 deletions(-)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 100644 meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch
 create mode 120000 meta/recipes-devtools/python/python-profile-opt3
 create mode 100644 meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb
 create mode 100644 meta/recipes-devtools/python/python-profile-opt_2.7.12.bb
 create mode 100644 meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.10.2


