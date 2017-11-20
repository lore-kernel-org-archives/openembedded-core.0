Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5FD6160750
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Nov 2017 12:15:32 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 Nov 2017 04:15:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,426,1505804400"; 
   d="scan'208";a="7294422"
Received: from marquiz2.fi.intel.com ([10.237.72.79])
	by orsmga001.jf.intel.com with ESMTP; 20 Nov 2017 04:15:33 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Nov 2017 14:15:17 +0200
Message-Id: <cover.1511179969.git.markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
References: <cover.1509094533.git.markus.lehtonen@linux.intel.com>
Subject: [PATCH v6 00/15] support profile-optimized build for Python
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
X-List-Received-Date: Mon, 20 Nov 2017 12:15:33 -0000

Sixth attempt on enabling profile-guided-optimization for Python 3.

Changes since v5:
- drop the patch adding 'scp' and 'ip' to HOSTTOOLS
- but, enable openssh-native and iproute2-native (and their native build deps)
  and use these, instead
- dependencies of 'do_profile' task of python-pgo-image are managed via DEPENDS
  instead of task depends (which were used in a bit awkward way in the previous
  version of the patchset)
- re-introduce get_target_controller() function into oeqa/targetcontrol
- one additional (unrelated) bugfix to oeqa/targetcontrol


The following changes since commit a17f3ec910366e9e7551fa24fbc07929b9584341:

  dhcp: fix build issue with libxml2 support (2017-11-10 14:44:31 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/fixes-9338
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=marquiz/fixes-9338

Markus Lehtonen (15):
  python3-native: support profile optimized build
  python3: fix depends of python3-tests
  python3: add python3-profile-opt recipe
  python3-profile-opt: rename libpython3
  openssh: extend to -native
  libmnl: enable native
  iptables: enable native
  iproute2: enable native
  oeqa/targetcontrol: re-introduce get_target_controller()
  oeqa/targetcontrol: add missing arg to SimpleRemoteTarget.__init__
  devtools/images: add python-pgo-image
  python3: support profile optimized build
  python3: fix profile-optimized build of modules
  python3: add python3-tools subpackage
  python3: remove two setup.py cross-compile hacks

 meta/lib/oeqa/targetcontrol.py                     |  29 +++++-
 meta/recipes-connectivity/iproute2/iproute2.inc    |   7 +-
 ...1-don-t-use-absolute-path-for-ssh-program.patch |  31 ++++++
 meta/recipes-connectivity/openssh/openssh_7.6p1.bb |   7 +-
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
 ...revent-absolute-path-in-installed-symlink.patch |  29 ++++++
 meta/recipes-extended/iptables/iptables_1.6.1.bb   |   3 +
 meta/recipes-extended/libmnl/libmnl_1.0.4.bb       |   2 +
 19 files changed, 453 insertions(+), 96 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/0001-don-t-use-absolute-path-for-ssh-program.patch
 create mode 100644 meta/recipes-devtools/images/python-pgo-image.bb
 create mode 120000 meta/recipes-devtools/python/python3-profile-opt
 create mode 100644 meta/recipes-devtools/python/python3-profile-opt_3.5.3.bb
 create mode 100644 meta/recipes-devtools/python/python3/Makefile-add-install_generate_profile-target.patch
 create mode 100644 meta/recipes-devtools/python/python3/Use-correct-CFLAGS-for-extensions-when-cross-compili.patch
 delete mode 100644 meta/recipes-devtools/python/python3/python3-setup.py-no-host-headers-libs.patch
 create mode 100644 meta/recipes-devtools/python/python3/rename-libpython3-to-libpython-profile-opt3.patch
 delete mode 100644 meta/recipes-devtools/python/python3/setup.py-find-libraries-in-staging-dirs.patch
 create mode 100644 meta/recipes-extended/iptables/iptables/prevent-absolute-path-in-installed-symlink.patch

-- 
2.13.6


