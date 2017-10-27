Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BA6F878287
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 10:07:53 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Oct 2017 03:07:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,304,1505804400"; d="scan'208";a="1236012565"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by fmsmga002.fm.intel.com with ESMTP; 27 Oct 2017 03:07:54 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Oct 2017 13:07:43 +0300
Message-Id: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
Subject: [PATCH v5 00/10] support profile-optimized build for Python
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
X-List-Received-Date: Fri, 27 Oct 2017 10:07:53 -0000

Fifth iteration of my patchset for enabling profile-guided-optimization for
Python3.

Changes since v4:
- Rebased on latest oe-core
- Usage of EXCLUDE_FROM_SHLIBS in python3-profile-opt is dropped, in favor of
  renaming of libpython3 in python3-profile-opt (re-introduced as this was
  dropped in v3). Need this so that the shlib dependencies are correctly tracked,
  and at the same time, soname clashes between libpython3 and
  libpython3-profile-opt are prevented.
- Patch bitbake.conf to include ip and scp in HOSTTOOLS. These are required to
  run the profile task on device.


The following changes since commit 3b413a80578caacd9a7f405f3c51a3921d78a60d:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:27 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338

Markus Lehtonen (10):
  python3-native: support profile optimized build
  python3: fix depends of python3-tests
  python3: add python3-profile-opt recipe
  python3-profile-opt: rename libpython3
  bitbake.conf: add ip and scp to HOSTTOOLS unconditionally
  devtools/images: add python-pgo-image
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python3: add python3-tools subpackage
  python3: remove two setup.py cross-compile hacks

 meta/conf/bitbake.conf                             |   6 +-
 meta/recipes-devtools/images/python-pgo-image.bb   |  92 ++++++++++++++++++
 .../python/python-3.5-manifest.inc                 |  10 +-
 .../python/python3-native_3.5.3.bb                 |   9 ++
 meta/recipes-devtools/python/python3-profile-opt   |   1 +
 .../python/python3-profile-opt_3.5.3.bb            |  10 ++
 .../python3/0001-cross-compile-support.patch       |   9 --
 ...efile-add-install_generate_profile-target.patch |  25 +++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch |  56 +++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    |  33 -------
 ...name-libpython3-to-libpython-profile-opt3.patch | 108 +++++++++++++++++++++
 .../setup.py-find-libraries-in-staging-dirs.patch  |  30 ------
 meta/recipes-devtools/python/python3_3.5.3.bb      |  58 ++++++++---
 13 files changed, 352 insertions(+), 95 deletions(-)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 120000 meta/recipes-devtools/python/python3-profile-opt
 create mode 100644 meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.13.6


