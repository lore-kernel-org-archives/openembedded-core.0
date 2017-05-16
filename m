Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 54C8F77D94
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 13:18:55 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 May 2017 06:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,349,1491289200"; d="scan'208";a="102711766"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by fmsmga006.fm.intel.com with ESMTP; 16 May 2017 06:18:52 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 16 May 2017 16:18:30 +0300
Message-Id: <cover.1494939394.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v2 00/20] support profile-optimized build for Python
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
X-List-Received-Date: Tue, 16 May 2017 13:18:57 -0000

This patchset makes it possible to make a PGO (profile-guided-optimization)
build of python. This version of the patchset is almost identical to v1
submitted back in February, with these changes:
- rebased on top of latest oe-core master
- exclude profile data for Modules/posixmodule of Python 2.7 as it was not
  working correctly

[YOCTO #9338]

The following changes since commit 123962018251dfb1d6ca5aa5c0d02534007de3ab:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338

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

 meta/recipes-devtools/images/python-pgo-image.bb   | 121 +++++++++++++++++++++
 .../python/python-2.7-manifest.inc                 |   8 +-
 .../python/python-3.5-manifest.inc                 |  10 +-
 ...x-.so-loading-when-when-running-profile-t.patch |  26 +++++
 .../python/python-native_2.7.13.bb                 |  10 ++
 meta/recipes-devtools/python/python-profile-opt3   |   1 +
 .../python/python-profile-opt3_3.5.2.bb            |  15 +++
 .../python/python-profile-opt_2.7.13.bb            |  13 +++
 .../01-use-proper-tools-for-cross-build.patch      |  10 --
 ...rename-libpython-to-libpython-profile-opt.patch |  94 ++++++++++++++++
 .../python/python3-native_3.5.2.bb                 |   9 ++
 .../python/python3/000-cross-compile.patch         |   9 --
 ...efile-add-install_generate_profile-target.patch |  25 +++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch |  56 ++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    |  33 ------
 ...name-libpython3-to-libpython-profile-opt3.patch | 111 +++++++++++++++++++
 .../setup.py-find-libraries-in-staging-dirs.patch  |  30 -----
 meta/recipes-devtools/python/python3_3.5.2.bb      |  74 +++++++++----
 meta/recipes-devtools/python/python_2.7.13.bb      |  54 +++++++--
 19 files changed, 590 insertions(+), 119 deletions(-)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 100644 meta/recipes-devtools/python/python-native/Makefile-fix-.so-loading-when-when-running-profile-t.patch
 create mode 120000 meta/recipes-devtools/python/python-profile-opt3
 create mode 100644 meta/recipes-devtools/python/python-profile-opt3_3.5.2.bb
 create mode 100644 meta/recipes-devtools/python/python-profile-opt_2.7.13.bb
 create mode 100644 meta/recipes-devtools/python/python/rename-libpython-to-libpython-profile-opt.patch
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.12.0


