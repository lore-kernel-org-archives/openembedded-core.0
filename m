Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1Qo5Z4-0001nl-K5
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Aug 2011 05:22:42 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 01 Aug 2011 20:18:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,304,1309762800"; d="scan'208";a="34077865"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by azsmga001.ch.intel.com with ESMTP; 01 Aug 2011 20:18:10 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Aug 2011 11:20:02 +0800
Message-Id: <cover.1312254789.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/3] Unify ldd/ldconfig for all multilib eglibcs for bug #1236
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
X-List-Received-Date: Tue, 02 Aug 2011 03:22:42 -0000

This is a rebase of the original patches to oe-core branch instead of poky.

This series of patch allow all the eglibc(s) in the current multilib 
configuration have the same ldd/ldconfig settings. 

We put the dynamic loaders'(ld.so) names in the dictionary of "ld_info_all" 
defined in the file eglibc-ld.inc. This dictionary is indexed by the 
TUNENAME. To support a new ABI, new entry should be added into this 
dictionary along with the new ABI's TUNENAME.

The information in ld_info_all can be used for both ldd script and ldconfig 
binary.

The following changes since commit 2a41a311ddda11713296391050f3c2c1b2c1d3d3:
  Koen Kooi (1):
        arch-armv7a.inc: fix armv7a-vfp-neon -> armv7a compat case

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib llu/bug1236-oecore
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=llu/bug1236-oecore

Lianhao Lu (3):
  utils.bbclass/multilib.conf: Added misc supporting functions.
  eglibc: Modify ldd script according to multilib config.
  eglibc: Setting KNOWN_INTERPRETER_NAMES for ldconfig.

 meta/classes/utils.bbclass                         |   31 ++++++++++++
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/multilib.conf                            |    6 ++-
 .../eglibc/eglibc-2.13/multilib_readlib.patch      |   20 ++++++++
 meta/recipes-core/eglibc/eglibc-ld.inc             |   49 ++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc                |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb            |   12 ++++-
 7 files changed, 118 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-2.13/multilib_readlib.patch
 create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc



