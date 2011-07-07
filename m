Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1QepLd-0006mf-3X
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 16:14:33 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 07 Jul 2011 07:10:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,493,1304319600"; d="scan'208";a="27433627"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.187])
	by fmsmga001.fm.intel.com with ESMTP; 07 Jul 2011 07:10:40 -0700
From: Yu Ke <ke.yu@intel.com>
To: openembedded-core@lists.openembedded.org,
	richard.purdie@linuxfoundation.org
Date: Thu,  7 Jul 2011 22:10:04 +0800
Message-Id: <cover.1310047266.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/8] [RFC] patch for non /usr/lib libdir
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
X-List-Received-Date: Thu, 07 Jul 2011 14:14:33 -0000

in multilib case, libdir is usually not standard /usr/lib, so this series of
patches are addressing some recipes's build failure when libdir is not /usr/lib,
for example, libdir=/usr/lib64.

All the patches have no impact to current libdir=/usr/lib situation, since
they just replace the hardcode /usr/lib with libdir.

Signed-off-by: Yu Ke <ke.yu@intel.com>

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:
  Tom Zanussi (1):
        systemtap: remove non-core COMPATIBLE_MACHINES

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kyu3/libdir-fix
  http://git.pokylinux.org/cgit.cgi//log/?h=kyu3/libdir

Yu Ke (8):
  native.bbclass: generate libdir from libdir_native
  openssl: fix for non /usr/lib libdir case
  libc-package.bbclass: fix for non /usr/lib libdir case
  python: fix for libdir=/usr/lib64 case
  python-native: fix for non /usr/lib libdir case
  perl: fix for non /usr/lib libdir case
  libcap: fix for non /usr/lib libdir case
  rpm: fix for non /usr/lib libdir case

 meta/classes/libc-package.bbclass                  |    4 +-
 meta/classes/native.bbclass                        |    2 +
 meta/recipes-connectivity/openssl/openssl.inc      |    2 +-
 .../recipes-connectivity/openssl/openssl_0.9.8r.bb |    2 +-
 meta/recipes-devtools/perl/perl_5.12.3.bb          |    3 +-
 ...2-distutils-prefix-is-inside-staging-area.patch |   15 +-
 .../recipes-devtools/python/python-native_2.6.6.bb |    2 +-
 meta/recipes-devtools/python/python/multilib.patch |  295 ++++++++++++++++++++
 meta/recipes-devtools/python/python_2.6.6.bb       |    3 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 meta/recipes-support/libcap/libcap.inc             |    5 +-
 meta/recipes-support/libcap/libcap_2.20.bb         |    2 +-
 12 files changed, 323 insertions(+), 15 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python/multilib.patch



