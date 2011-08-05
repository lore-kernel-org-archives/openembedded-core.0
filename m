Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QpDMM-0002Xw-Vm
	for openembedded-core@lists.openembedded.org;
	Fri, 05 Aug 2011 07:54:15 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 04 Aug 2011 22:49:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,321,1309762800"; d="scan'208";a="35618441"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.52])
	by orsmga001.jf.intel.com with ESMTP; 04 Aug 2011 22:49:49 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Aug 2011 13:48:24 +0800
Message-Id: <cover.1312522526.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][PULL] fix /bin/sh missing in multilib case
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
X-List-Received-Date: Fri, 05 Aug 2011 05:54:15 -0000

Hi Richard,

This pull request fixes the /bin/sh missing issue in doing multilib rootfs of
lib32-core-image-sato.

multilib.bbclass will check whether PACKAGES are begin with MLPREFIX. If not,
it will tries to rename variables like: FILES_pkg, RDEPENDS_pkg, etc.

Recipe task-core-boot RDEPENDS some key recipes like busybox, tinylogin, etc,
while it doesn't have PACKAGES defined, so it will use default PACKAGES
definition in bitbake:

"${PN}-dbg ${PN} ${PN}-doc ${PN}-dev ${PN}-staticdev ${PN}-locale".

${PN} is begin with MLPREFIX, therefore for PACKAGES of task-core-boot, no
rename occurred, resulting that RDEPENDS_lib32-task-core-boot is empty.
busybox, tinylogin, etc. are not built out, which caused the missing of /bin/sh.

Like the other task-core-xxx.bb files, this commit explicitly defines PACKAGES
in task-core-boot.bb to fix this issue.

Thanks,
Dongxiao

The following changes since commit 8a731122e7811275f20065ba27645b97fadf362d:

  eglibc: Fix patch merge breakage (2011-08-04 15:41:08 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/ml2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/ml2

Dongxiao Xu (1):
  task-core-boot.bb: Add PACKAGE definition to facilitate multilib

 meta/recipes-core/tasks/task-core-boot.bb |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)



