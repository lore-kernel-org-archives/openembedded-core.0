Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QnqIB-0004yr-4l
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Aug 2011 13:04:15 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 01 Aug 2011 03:59:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,299,1309762800"; d="scan'208";a="32775792"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga002.jf.intel.com with ESMTP; 01 Aug 2011 03:59:53 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Aug 2011 19:01:56 +0800
Message-Id: <cover.1312195779.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH BUG #1236 0/3] Unify ldd/ldconfig for all multilib eglibcs
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
X-List-Received-Date: Mon, 01 Aug 2011 11:04:15 -0000

This series of patch allow all the eglibc(s) in the current multilib 
configuration have the same ldd/ldconfig settings. 

We put the dynamic loaders'(ld.so) names in the dictionary of "ld_info_all" 
defined in the file eglibc-ld.inc. This dictionary is indexed by the 
TUNENAME. To support a new ABI, new entry should be added into this 
dictionary along with the new ABI's TUNENAME.

The information in ld_info_all can be used for both ldd script and ldconfig 
binary.

The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
  Bruce Ashfield (1):
        poky.conf: explicitly referenced preferred linux-yocto version

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llu/bug1236
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/bug1236

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



