Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dongxiao.xu@intel.com>) id 1QUEeU-0005d1-A4
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Jun 2011 11:02:14 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 08 Jun 2011 01:57:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,337,1304319600"; d="scan'208";a="13412755"
Received: from dongxiao-osel.sh.intel.com (HELO localhost) ([10.239.36.20])
	by fmsmga002.fm.intel.com with ESMTP; 08 Jun 2011 01:57:50 -0700
From: Dongxiao Xu <dongxiao.xu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Jun 2011 17:08:31 +0800
Message-Id: <cover.1307523829.git.dongxiao.xu@intel.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1][RFC] libc locale split
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
X-List-Received-Date: Wed, 08 Jun 2011 09:02:15 -0000

Hi Richard and Saul,

This pull request split the libc-locale from libc recipe, which can improve the build performance.
Please help to review and pull.

Some test results: 

CPU: Intel i7 870 CPU.
Memory: 4G.
Image: core-image-sato.
Machine: qemux86.

W/o the patch:
real    111m52.954s
user    367m56.610s
sys     49m20.770s

W/ the patch:
real    105m25.436s
user    372m48.040s
sys     51m23.950s

There are about 6% performance gain.

Thanks,
Dongxiao

The following changes since commit 5af197b55a4b779f1ec93186f0723026949ba2b5:

  cache: Implement multiple extra cache fields request support (2011-06-07 22:40:01 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dxu4/libc-locale
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dxu4/libc-locale

Dongxiao Xu (1):
  libc-locale: split locale handling from libc recipe.

 meta/classes/libc-common.bbclass                   |   23 ++++++++
 meta/classes/libc-package.bbclass                  |   24 --------
 meta/conf/distro/include/tclibc-eglibc.inc         |   12 ++--
 meta/conf/distro/include/tclibc-glibc.inc          |   12 ++--
 meta/recipes-core/eglibc/eglibc-initial_2.13.bb    |    4 ++
 meta/recipes-core/eglibc/eglibc-locale_2.13.bb     |   56 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc-package.inc        |   32 +----------
 meta/recipes-core/eglibc/eglibc.inc                |    5 +-
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++
 meta/recipes-core/glibc/glibc-initial_2.10.1.bb    |    4 ++
 meta/recipes-core/glibc/glibc-locale_2.10.1.bb     |   48 +++++++++++++++++
 meta/recipes-core/glibc/glibc-package.inc          |   31 ++---------
 meta/recipes-core/glibc/glibc.inc                  |    2 +-
 meta/recipes-core/glibc/glibc_2.10.1.bb            |   12 ++++
 .../meta/external-csl-toolchain_2008q3-72.bb       |    3 +-
 meta/recipes-core/meta/external-poky-toolchain.bb  |    2 +-
 meta/recipes-gnome/gtk+/gtk+.inc                   |    2 +-
 17 files changed, 187 insertions(+), 97 deletions(-)
 create mode 100644 meta/classes/libc-common.bbclass
 create mode 100644 meta/recipes-core/eglibc/eglibc-locale_2.13.bb
 create mode 100644 meta/recipes-core/glibc/glibc-locale_2.10.1.bb



