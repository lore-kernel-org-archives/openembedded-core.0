Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 584DE60069
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 08:42:58 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 May 2017 01:42:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,358,1491289200"; d="scan'208";a="88535174"
Received: from dmcgahon-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.14.225])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2017 01:42:58 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 18 May 2017 11:42:50 +0300
Message-Id: <cover.1495095863.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v3 0/8] support profile-optimized build for Python
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
X-List-Received-Date: Thu, 18 May 2017 08:42:59 -0000

Third incarnation of enabling profile-guided-optimization (PGO) for Python. The
patchset is significantly simplified from the previous version, mainly because
Python 2.x is not supported, and because of that, there is no need to install
packages under modified (opt/) prefix. Also, RSS made libpython soname mangling
unnecessary.

The last patch of this changeset is not obligatory after the changes since v2.
However, it will remove some hacks that should not be needed.

Changes since v2:
- support for Python 2.x dropped
- profiling recipe name changed from python-profile-opt3 to python3-profile-opt
- python3-profile-opt now uses standard 'usr/' prefix, and thus, it now also
  rconflicts with "regular" python3
- libpython name mangling in python3-profile-opt removed
- all patches to python-pgo-image squashed into one

[YOCTO #9338]

The following changes since commit 138f3e3f81d866e8272b01dd88c164b367adc4cd:

  byacc: remove the recipe (2017-05-16 14:08:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338

Markus Lehtonen (8):
  python3-native: support profile optimized build
  python3: fix depends of python3-tests
  python3: add python3-profile-opt recipe
  devtools/images: add python-pgo-image
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python3: add python3-tools subpackage
  python3: remove two setup.py cross-compile hacks

 meta/recipes-devtools/images/python-pgo-image.bb   | 85 ++++++++++++++++++++++
 .../python/python-3.5-manifest.inc                 | 10 ++-
 .../python/python3-native_3.5.2.bb                 |  9 +++
 meta/recipes-devtools/python/python3-profile-opt   |  1 +
 .../python/python3-profile-opt_3.5.2.bb            | 15 ++++
 .../python/python3/000-cross-compile.patch         |  9 ---
 ...efile-add-install_generate_profile-target.patch | 25 +++++++
 ...-CFLAGS-for-extensions-when-cross-compili.patch | 56 ++++++++++++++
 .../python3-setup.py-no-host-headers-libs.patch    | 33 ---------
 .../setup.py-find-libraries-in-staging-dirs.patch  | 30 --------
 meta/recipes-devtools/python/python3_3.5.2.bb      | 58 +++++++++++----
 11 files changed, 239 insertions(+), 92 deletions(-)
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 120000 meta/recipes-devtools/python/python3-profile-opt
 create mode 100644 meta/recipes-devtools/python/python3-profile-opt_3.5.2.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch

-- 
2.12.0


