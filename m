Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QkH78-0005ES-41
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Jul 2011 16:54:06 +0200
Received: by rex (Postfix, from userid 1000)
	id BDFDE201DD; Fri, 22 Jul 2011 15:49:54 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Jul 2011 15:49:50 +0100
Message-Id: <cover.1311345613.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/3] First round of tune config file updates
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
X-List-Received-Date: Fri, 22 Jul 2011 14:54:06 -0000

These patches set the scene for the multilib work. I'm posting these first 
as they're the more invasive changes to the variables the tune
files currently expose and are likely the more user visible changes.

The first patch allows multilib to be able to change "/lib" as needed 
dynamically to variants like "/lib64". Reasons for doing it the way its
been done are included in the commit message of the patch.

The second two patches change the tune files to operate on TUNE* variables.
This allows some cleanup and simplification of the core and creates a clear
namespace for the tune files to operate under.

It does mean that machine support files need to remove any explicit 
TARGET_ARCH setting and now should always include an appopriate tune file
to ensure the TUNE variables are set correctly.

Sanity checks have been added to ensure users are informed when this has
not been done.

These should be the only compatibility break multilib requires with the
rest of the work involving changes to the tune file internals themselves.

The changes are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/ml-stage
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/ml-stage

Richard Purdie (3):
  bitbake.conf/cross.bbclass: Add ability to dynamically change library
    location
  conf/machine/tune: Overhaul tune include file variables
  conf/machine/include: Set TUNE_CCARGS instead of TARGET_CC_ARCH

 meta/classes/cross.bbclass                       |    7 +++--
 meta/classes/sanity.bbclass                      |   10 ++++++--
 meta/conf/bitbake.conf                           |   26 ++++++++++++++-------
 meta/conf/machine/include/tune-arm1136jf-s.inc   |    9 ++++---
 meta/conf/machine/include/tune-arm920t.inc       |    7 +++--
 meta/conf/machine/include/tune-arm926ejs.inc     |   10 +++++---
 meta/conf/machine/include/tune-arm9tdmi.inc      |    7 +++--
 meta/conf/machine/include/tune-armv7.inc         |    7 +++--
 meta/conf/machine/include/tune-atom.inc          |    6 +++-
 meta/conf/machine/include/tune-c3.inc            |    8 ++++--
 meta/conf/machine/include/tune-cortexa8.inc      |    7 +++--
 meta/conf/machine/include/tune-cortexm1.inc      |    7 +++--
 meta/conf/machine/include/tune-cortexm3.inc      |    7 +++--
 meta/conf/machine/include/tune-cortexr4.inc      |    7 +++--
 meta/conf/machine/include/tune-ep9312.inc        |    7 +++--
 meta/conf/machine/include/tune-i586.inc          |    6 +++++
 meta/conf/machine/include/tune-iwmmxt.inc        |    7 +++--
 meta/conf/machine/include/tune-mips32.inc        |    7 +++--
 meta/conf/machine/include/tune-ppc603e.inc       |    7 +++--
 meta/conf/machine/include/tune-ppce300c2.inc     |    6 +++-
 meta/conf/machine/include/tune-ppce500.inc       |    6 +++-
 meta/conf/machine/include/tune-ppce500mc.inc     |    7 +++--
 meta/conf/machine/include/tune-ppce500v2.inc     |    7 +++--
 meta/conf/machine/include/tune-sh3.inc           |    7 +++--
 meta/conf/machine/include/tune-sh4.inc           |    7 +++--
 meta/conf/machine/include/tune-strongarm1100.inc |    6 ++++-
 meta/conf/machine/include/tune-supersparc.inc    |    7 +++--
 meta/conf/machine/include/tune-thumb.inc         |    2 +-
 meta/conf/machine/include/tune-x86_64.inc        |    5 ++++
 meta/conf/machine/include/tune-xscale.inc        |   10 ++++----
 meta/conf/machine/qemuarm.conf                   |    2 -
 meta/conf/machine/qemumips.conf                  |    2 -
 meta/conf/machine/qemuppc.conf                   |    2 -
 meta/conf/machine/qemux86-64.conf                |    3 +-
 meta/conf/machine/qemux86.conf                   |    4 +--
 35 files changed, 144 insertions(+), 98 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-i586.inc
 create mode 100644 meta/conf/machine/include/tune-x86_64.inc

-- 
1.7.4.1



