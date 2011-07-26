Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qlpd6-0007sI-QR
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 23:57:33 +0200
Received: by rex (Postfix, from userid 1000)
	id 1F1C520284; Tue, 26 Jul 2011 22:53:11 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 22:53:09 +0100
Message-Id: <cover.1311716946.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/8] Multilib core enablement patches
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
X-List-Received-Date: Tue, 26 Jul 2011 21:57:33 -0000

This patch series forms the core multilib enablement for OE-Core. The first patch
adds the main class which can be enabled as per the local.conf.sample code. 

The following patches are various misc multilib related tweaks the system needed.

Following this series, the tune changes I posted earlier and Mark's header changes, 
the only remaining piece is the package manager integration. I'll post those as a
separate follow on series but those are likely still in need of some tweaks before
merging.

The patches are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/ml4
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/ml4

Dongxiao Xu (1):
  distcc: fix makefile parameter order

Mark Hatle (1):
  RPM: multilib file class/color

Richard Purdie (2):
  multilib: Add support for compiling recipes against multiple ABIs
  lib/oe/util.py: Add MLPREFIX support to prune_suffix()

Yu Ke (4):
  do_split_packages: revise for multilib case
  eglibc: fix for multilib RPROVIDES issue
  cmake.bbclass: add ${libdir}} for multilib case
  linux-yocto: revise the dependency for multilib

 meta/classes/autotools.bbclass                     |    2 +-
 meta/classes/cmake.bbclass                         |    2 +-
 meta/classes/insane.bbclass                        |    3 +-
 meta/classes/multilib.bbclass                      |   87 ++++++++++++++++++++
 meta/classes/package.bbclass                       |   15 ++++
 meta/conf/bitbake.conf                             |    1 +
 meta/conf/local.conf.sample                        |    5 +
 meta/conf/multilib.conf                            |   24 ++++++
 meta/lib/oe/utils.py                               |    7 ++-
 meta/recipes-core/dbus/dbus.inc                    |    8 +-
 meta/recipes-core/eglibc/eglibc-package.inc        |    2 +-
 meta/recipes-devtools/distcc/distcc_2.18.3.bb      |    3 +-
 .../distcc/files/makefile-param-order.patch        |   20 +++++
 meta/recipes-devtools/gcc/libgcc_4.6.bb            |    6 +-
 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch  |   34 ++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    1 +
 meta/recipes-kernel/linux/linux-tools.inc          |    2 +-
 17 files changed, 207 insertions(+), 15 deletions(-)
 create mode 100644 meta/classes/multilib.bbclass
 create mode 100644 meta/conf/multilib.conf
 create mode 100644 meta/recipes-devtools/distcc/files/makefile-param-order.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-fileclass.patch

-- 
1.7.4.1



