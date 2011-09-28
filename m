Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1R8sWF-0003El-5d
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Sep 2011 13:41:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 28 Sep 2011 04:36:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="57501144"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga002.jf.intel.com with ESMTP; 28 Sep 2011 04:36:15 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Sep 2011 19:44:25 +0800
Message-Id: <cover.1317209357.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/6][PULL v2] multilib: bug fixes related with RPM backend
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
X-List-Received-Date: Wed, 28 Sep 2011 11:41:43 -0000

Hi Richard,

This pull request is to fix several multilib bugs related with RPM backend,
please help to review and pull.

Changes from v1:
 - Add a patch to handle PACKAGES dynamic setting in libc-package.bbclass in
multilib case. Otherwise IPK packaging logic will not find the correct
locale-base-* packages.

I've done a round of multilib testing agasint for following combinations for
both RPM and IPK packaging:

 - lib32 sato image on qemux86 machine
 - lib32 sato image on qemux86-64 machine
 - lib64 sato image on qemux86-64 machine
 - lib64 sato image on qemux86 machine (build pass but cannot boot)
 - sato image on qemux86-64 with several lib32 packages (lib32-connman)

All the above test cases can pass the build and most can successfully boot up
(except the lib64 on qemux86 since 64bit code could not run on 32bit machine).

Therefore the following bugs could be addressed:

[YOCTO #1496]
[YOCTO #1497]
[YOCTO #1498]
[YOCTO #1527]

Thanks,
Dongxiao

The following changes since commit 684a4b517d13884c315688967fadd5e6a4845b71:

  libffi: really populate -dev package (2011-09-26 20:50:27 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml

Dongxiao Xu (6):
  multilib.bbclass: map RDEPENDS and LINGUAS_INSTALL for image recipes
  multilib: remove the multilib handling to allarch
  multilib: add MLPREFIX to deploy folder
  tune-i586: fix hardcoded TUNE_PKGARCH
  package_rpm: combine normal and multilib solution manifest together
  libc-package.bbclass: add MLPREFIX when set values to PACKAGES

 meta/classes/libc-package.bbclass                  |    2 +-
 meta/classes/multilib.bbclass                      |   12 +++++-------
 meta/classes/multilib_global.bbclass               |    2 +-
 meta/classes/package_rpm.bbclass                   |   15 +++++++++++----
 meta/classes/rootfs_rpm.bbclass                    |    2 +-
 meta/conf/machine/include/tune-i586.inc            |    3 ++-
 meta/conf/multilib.conf                            |    7 +++++++
 .../python/python-pygobject_2.27.91.bb             |    2 +-
 8 files changed, 29 insertions(+), 16 deletions(-)



