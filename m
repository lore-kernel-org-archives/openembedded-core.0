Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1QmoXD-0003wK-GL
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 16:59:31 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 29 Jul 2011 07:55:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,287,1309762800"; d="scan'208";a="33552359"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.146])
	by orsmga001.jf.intel.com with ESMTP; 29 Jul 2011 07:55:13 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 22:57:23 +0800
Message-Id: <cover.1311950827.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [RFC BUG #1236 0/2] Modify ldd script for multilib.
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
X-List-Received-Date: Fri, 29 Jul 2011 14:59:31 -0000

This is part of the BUG #1236 fixing. Current there seems no way to get the
dynamic loader(ld.so) names for all the ABIs configured in the multilib 
configuration during runtime. So we put the ld.so names in the dictionary 
"ld_info_all" in the file eglibc-ld.inc. This dictionary is indexed by the 
TUNENAME. To support a new ABI, new entry should be added into this dictionary 
along with the new ABI's TUNENAME.

The information in ld_info_all can be used for both ldd script, and the 
KNOWN_INTERPRETER_NAMES in the file ldconfig.h (which has not been done yet).

The following changes since commit f94b781695cd8fa387daff16ecbf3987a0883018:
  Bruce Ashfield (1):
        poky.conf: explicitly referenced preferred linux-yocto version

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib llub/bug1236
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=llu/1236

Lianhao Lu (2):
  utils.bbclass/multilib.conf: Added misc supporting functions.
  eglibc: Modify ldd script according to multilib config.

 meta/classes/utils.bbclass              |   35 ++++++++++++++++++++
 meta/conf/bitbake.conf                  |    1 +
 meta/conf/multilib.conf                 |    6 +++-
 meta/recipes-core/eglibc/eglibc-ld.inc  |   53 +++++++++++++++++++++++++++++++
 meta/recipes-core/eglibc/eglibc.inc     |    1 +
 meta/recipes-core/eglibc/eglibc_2.13.bb |    6 +++-
 6 files changed, 100 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/eglibc/eglibc-ld.inc



