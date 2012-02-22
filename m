Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1S05xu-0007au-Hw
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 07:46:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 21 Feb 2012 22:37:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="110668147"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 21 Feb 2012 22:37:53 -0800
From: nitin.a.kamble@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2012 22:37:51 -0800
Message-Id: <cover.1329892604.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 00/10] Enable multilib for target gcc
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
X-List-Received-Date: Wed, 22 Feb 2012 06:46:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

These commits enable the target gcc for multilib compilation.

The tune file definitions are rearranged for easy parsing by multilib code.

Multilib setup code is added for target gcc recipe. This code looks at the
multilib configuration defined in local.conf and generates multilib setup files
for target gcc accordingly.

Also target libgcc recipe is extended to have correct paths for non-default
gcc multilib options.

All this code added for multilib setup is inactive if multilib is not enabled
in the local.conf

This has tested to work with x86 & x86-64 enabled multilib configuration
for x86-64 machine.

Thanks,
Nitin

The following changes since commit 87e32edb88c30ac116fa396148ac26357051f93a:

  iputils: Add base_libdir to VPATH in order to find the crypto library (2012-02-21 17:59:40 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib nitin/gcc-multilib-for-push
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=nitin/gcc-multilib-for-push

Nitin A Kamble (10):
  arch-ia32: rearrange tune configuration
  arch-ia32.inc: restructure TUNE_ARCH definition
  arch-mips.inc: rearrange for gcc-multilib
  arch-mips.inc: define TUNE_FEATURE_ARCH vars for multilib tunes
  arch-powerpc*.inc: rearrange for gcc-multilib
  arch-powerpc*.inc: rearrange TUNE_ARCH definition
  gcc: remove the 64bithack patch
  target gcc: gcc-multilib-setup
  libgcc_4.6.bb: Complete quote in definition of FILES_libgcov-dev
  libgcc: get the gcc header files working

 meta/conf/machine/include/ia32/arch-ia32.inc       |   50 ++++---
 meta/conf/machine/include/mips/arch-mips.inc       |   68 +++++----
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   25 ++--
 .../machine/include/powerpc/arch-powerpc64.inc     |   12 +-
 meta/recipes-devtools/gcc/gcc-4.6.inc              |    3 +-
 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch  |   68 ---------
 meta/recipes-devtools/gcc/gcc-configure-common.inc |    2 +-
 meta/recipes-devtools/gcc/gcc-configure-target.inc |    1 +
 meta/recipes-devtools/gcc/gcc-multilib-config.inc  |  149 ++++++++++++++++++++
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |   55 +++++++-
 10 files changed, 291 insertions(+), 142 deletions(-)
 delete mode 100644 meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-multilib-config.inc

-- 
1.7.6.4



