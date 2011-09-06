Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1R0vT6-0004eF-6b
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 15:13:36 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 06 Sep 2011 06:08:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,338,1312182000"; d="scan'208";a="45955681"
Received: from dcui-desktop.sh.intel.com (HELO localhost) ([10.239.36.112])
	by azsmga001.ch.intel.com with ESMTP; 06 Sep 2011 06:08:33 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 21:08:34 +0800
Message-Id: <cover.1315313790.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/5] patches to fix deb packaging: bug 1070
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
X-List-Received-Date: Tue, 06 Sep 2011 13:13:36 -0000

The DEB packaging for core-image-sato-sdk(previously called poky-image-sdk) and
meta-toolchain-gmae(previously called meta-toolchain-sdk) has been broken for
quite a long period of time -- at least it was broken in Oct 2010 (I didn't try
to test older commits).

The patches try to improve the situation.

With the patches, core-image-sato-sdk for qemu{x86, x86-64, ppc, mips} can
build fine, but qemuarm still has a do_rootfs issue:
| The following packages have unmet dependencies:
|   task-base-extended: Depends: task-base but it is not going to be installed

And, meta-toolchain-gmae is still broken. The error is:
| + apt-get install task-sdk-host-nativesdk --force-yes --allow-unauthenticated
| Reading package lists...
| Building dependency tree...
| Reading state information...
| E: Couldn't find package task-sdk-host-nativesdk

I'm working on the left issues.

Does anybody know if OE has the similar issue or not?
Any comment/suggestions for the patch and left isseus are appreciated.

Thanks!

-- Dexuan

The following changes since commit 41b7c955cfdc7b4d5c667c8a8742237d5edaca4f:

  icu-3.6: fix building with big make -j (2011-09-05 20:38:50 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/distro

Dexuan Cui (5):
  populate_sdk_deb.bbclass: add the missing parameter - for tar
  package_deb.bbclass: put the stderr into log.do_xxx-attemptonly.xxx
  dpkg, dpkg-native: fix DEPENDS, RDEPENDS and pkg_postinst_dpkg
  opkg: it should Rdepend on update-alternatives-cworth
  default-providers.inc: define update-alternatives and -native
    properly

 meta/classes/package_deb.bbclass               |    2 +-
 meta/classes/populate_sdk_deb.bbclass          |    2 +-
 meta/conf/distro/include/default-providers.inc |    5 ++---
 meta/recipes-devtools/dpkg/dpkg.inc            |   23 ++++++++++-------------
 meta/recipes-devtools/opkg/opkg_0.1.8.bb       |    4 ++--
 meta/recipes-devtools/opkg/opkg_svn.bb         |    4 ++--
 6 files changed, 18 insertions(+), 22 deletions(-)

-- 
1.7.6



