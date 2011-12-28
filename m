Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1Rg3C1-0006PG-Tn
	for openembedded-core@lists.openembedded.org;
	Thu, 29 Dec 2011 00:45:58 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 28 Dec 2011 15:38:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="90362008"
Received: from unknown (HELO localhost) ([10.255.13.53])
	by azsmga001.ch.intel.com with ESMTP; 28 Dec 2011 15:38:41 -0800
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org, raj.khem@gmail.com,
	koen@dominion.thruhere.net, kergoth@gmail.com, martin.jansa@gmail.com,
	Bruce Ashfield <bruce.ashfield@windriver.com>,
	Tom Zanussi <tom.zanussi@intel.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Date: Wed, 28 Dec 2011 15:38:08 -0800
Message-Id: <cover.1325115066.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.6.4
Subject: [PATCH 0/4] Fixes for tiny distros and linux-yocto-tiny
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
X-List-Received-Date: Wed, 28 Dec 2011 23:45:58 -0000

In preparation for defining a poky-tiny distribution for meta-yocto, I found
I needed the following patches. They mostly enable finer grained configuration
of dependencies and allow for building without widechar support.


The linux-yocVto-tiny recipe isn't poky-tiny specific and could be of use to
others, so I opted to keep it with the other linux-yocto recipes. It is a
placeholder until the linux-yocto_3.2 recipes are ready for oe-core. At that
time, linux-yocto-tiny will drop all config fragments in favor of the
to-be-in-tree versions and make use of a new yocto/standard/tiny/base branch.
For now, this recipe allows us to build a reasonably small kernel with fewer
dependencies.

Thanks,

Darren


The following changes since commit 8f348ccad083d6c02c200652ff6295e701e88f0d:

  coreutils: ensure --color works so DEPEND on libcap (2011-12-24 10:05:35 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/user-contrib/dvhart/oe-core dvhart/tiny
  http://git.yoctoproject.org/cgit.cgi/user-contrib/dvhart/oe-core/log/?h=dvhart/tiny

Darren Hart (3):
  eglibc: Only add eglibc-utils to PACKAGES if wchar is supported
  linux-yocto-tiny: New kernel recipe for tiny distros
  task-core-boot: Allow DISTRO to disable keymaps via VIRTUAL-RUNTIME_keymaps

Richard Purdie (1):
  native.bbclass: Fix variable remapping coverage

 meta/classes/native.bbclass                        |    2 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    6 +-
 meta/recipes-core/tasks/task-core-boot.bb          |    8 +-
 meta/recipes-devtools/autoconf/autoconf.inc        |    2 +
 meta/recipes-devtools/autoconf/autoconf_2.68.bb    |    8 -
 meta/recipes-devtools/automake/automake_1.11.1.bb  |    4 +-
 .../recipes-devtools/python/python-native_2.7.2.bb |    2 +
 meta/recipes-gnome/gnome/gconf_3.2.3.bb            |    1 +
 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg |    9 +
 .../recipes-kernel/linux/linux-yocto-tiny/core.cfg |   19 +
 .../linux/linux-yocto-tiny/debug.cfg               |    5 +
 .../linux/linux-yocto-tiny/devtmpfs.cfg            |    6 +
 .../linux/linux-yocto-tiny/e1000.cfg               |    7 +
 .../recipes-kernel/linux/linux-yocto-tiny/ext2.cfg |    1 +
 .../recipes-kernel/linux/linux-yocto-tiny/ext3.cfg |    2 +
 .../recipes-kernel/linux/linux-yocto-tiny/lzma.cfg |    3 +
 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg |   26 +
 .../linux/linux-yocto-tiny/qemux86/defconfig       |  613 ++++++++++++++++++++
 .../linux/linux-yocto-tiny/ramfs.cfg               |    6 +
 .../linux/linux-yocto-tiny/rtc-pc.cfg              |   13 +
 .../linux/linux-yocto-tiny/serial.cfg              |    7 +
 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg |    7 +
 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb  |   36 ++
 meta/recipes-support/boost/boost.inc               |    1 +
 24 files changed, 777 insertions(+), 17 deletions(-)
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ata.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/core.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/debug.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/devtmpfs.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/e1000.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext2.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ext3.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/lzma.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/net.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/qemux86/defconfig
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/ramfs.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/rtc-pc.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/serial.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny/smp.cfg
 create mode 100644 meta/recipes-kernel/linux/linux-yocto-tiny_3.0.bb

-- 
1.7.6.4



