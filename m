Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QgAwV-0001WC-SD
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jul 2011 09:30:12 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 11 Jul 2011 00:26:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,513,1304319600"; d="scan'208";a="26361724"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga002.fm.intel.com with ESMTP; 11 Jul 2011 00:26:14 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Jul 2011 15:23:13 +0800
Message-Id: <cover.1310368636.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 00/10] [RFC] patch for non /usr/lib libdir - V2
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
X-List-Received-Date: Mon, 11 Jul 2011 07:30:12 -0000

This is the V2 patches. the changes compared to V1 are:
- revise python patch to make the sys.lib deriving from libdir, instead of hardcode to lib64
- add two more fixes: sat-solver and libzypp, with these two more fixes, i can build
  qemux86-64 core-image-sato and core-image-sato-sdk with libdir=/usr/lib64

Next step, I will do through test to make sure it does not impact normal libdir=/usr/lib case

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
  Tom Zanussi (1):
        systemtap: remove non-core COMPATIBLE_MACHINES

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/libdir-fix-v2
  http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/libdir-fix-v2

Yu Ke (10):
  native.bbclass: generate libdir from libdir_native
  openssl: fix for non /usr/lib libdir case
  libc-package.bbclass: fix for non /usr/lib libdir case
  python: fix for libdir=/usr/lib64 case
  python-native: fix for non /usr/lib libdir case
  perl: fix for non /usr/lib libdir case
  libcap: fix for non /usr/lib libdir case
  rpm: fix for non /usr/lib libdir case
  sat-solver: fix for non /usr/lib libdir case
  libzypp: fix for non /usr/lib libdir case

 meta/classes/cmake.bbclass                         |    4 +
 meta/classes/libc-package.bbclass                  |    4 +-
 meta/classes/native.bbclass                        |    2 +
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    3 +-
 ...2-distutils-prefix-is-inside-staging-area.patch |   15 +-
 .../recipes-devtools/python/python-native_2.6.6.bb |    2 +-
 meta/recipes-devtools/python/python/multilib.patch |  250 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 .../libzypp/libzypp/hardcode-lib-fix.patch         |   22 ++
 meta/recipes-extended/libzypp/libzypp_git.bb       |    5 +-
 meta/recipes-extended/sat-solver/sat-solver_git.bb |    6 +-
 meta/recipes-support/libcap/libcap.inc             |    5 +-
 meta/recipes-support/libcap/libcap_2.20.bb         |    2 +-
 16 files changed, 311 insertions(+), 19 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/multilib.patch
 create mode 100644 meta/recipes-extended/libzypp/libzypp/hardcode-lib-fix.patch



