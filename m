Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QodKC-0008QH-3S
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Aug 2011 17:25:38 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga102.ch.intel.com with ESMTP; 03 Aug 2011 08:21:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,310,1309762800"; 
   d="scan'208";a="3779389"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by AZSMGA002.ch.intel.com with ESMTP; 03 Aug 2011 08:21:12 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  3 Aug 2011 23:19:32 +0800
Message-Id: <cover.1312384552.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/7][PULL] Multilib: various fixes
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
X-List-Received-Date: Wed, 03 Aug 2011 15:25:38 -0000

Hi Richard,

This pull request contains several multilib fixes, especially for rpm side.
Please help to review and pull.

Current status for rpm sato is, most of the error dependency issues have been solved except one error while do_rootfs:

error: Failed dependencies:
        /bin/sh is needed by dbus-1.4.12-r0.x86_64
        /bin/sh is needed by psplash-0.0+svnr424-r6.x86_64
        /bin/sh is needed by portmap-6.0-r7.x86_64
        /bin/sh is needed by dropbear-0.52-r3.x86_64
        ...

I am looking into that currently. Any suggestion would be appreciated.

Thanks,
Dongxiao

The following changes since commit 07864a16baf18046b726ec72b688594a91c6e4b4:

  local.conf.sample: Fix TUNENAME reference (should be DEFAULTTUNE) (2011-08-02 14:40:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (7):
  eglibc-locale: Specially handle FILES_eglibc-gconv for multilib
  libxml-simple-perl: Use BBCLASSEXTEND insteand of *-native recipe
  openjade-native: Change RDEPENDS of sgml-common-native
  multilib: Use BPN instead of PN for style like lib${PN}
  multilib: remove MULTILIB_PACKAGE_ARCHS variable
  package_rpm: fix strip_multilib function
  package_rpm: Fix package rename issue in multilib case

 meta/classes/libc-package.bbclass                  |    2 +-
 meta/classes/package_rpm.bbclass                   |   31 +++++++-------------
 meta/classes/populate_sdk_rpm.bbclass              |    3 --
 meta/classes/rootfs_rpm.bbclass                    |    3 --
 meta/recipes-core/eglibc/eglibc-locale.inc         |    5 ++-
 .../openjade/openjade-native_1.3.2.bb              |    2 +-
 .../perl/libxml-simple-perl-native_2.18.bb         |    7 ----
 .../perl/libxml-simple-perl_2.18.bb                |    2 +
 meta/recipes-devtools/python/python_2.6.6.bb       |    4 +-
 meta/recipes-extended/augeas/augeas.inc            |   12 ++++----
 meta/recipes-extended/gamin/gamin_0.1.10.bb        |    8 ++--
 meta/recipes-support/attr/ea-acl.inc               |    2 +-
 meta/recipes-support/sqlite/sqlite3.inc            |    6 ++--
 13 files changed, 35 insertions(+), 52 deletions(-)
 delete mode 100644 meta/recipes-devtools/perl/libxml-simple-perl-native_2.18.bb



