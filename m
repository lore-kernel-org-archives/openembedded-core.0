Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1Qlh3h-0003Kc-G0
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Jul 2011 14:48:25 +0200
Received: by rex (Postfix, from userid 1000)
	id CB7A420235; Tue, 26 Jul 2011 13:44:04 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 26 Jul 2011 13:44:00 +0100
Message-Id: <1311684240-15823-1-git-send-email-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: rom 992efbf4ec3d7c55346953dbe82f9745590e64bf Mon Sep 17 00:00:00 2001
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
X-List-Received-Date: Tue, 26 Jul 2011 12:48:25 -0000

The following patches complete the tune file overhaul for ARM/MIPS/PPC,
enabling a much richer set of controls over which tuning controls are
used for a given build. This also sets the scene for allowing multilib
builds as well as supprting 64 bit compiling on MIPS/PPC.

Compatibility should be retained with existing default options where
at all possible although testing every combination of these options is
hard. I'm also no expert on some of the architectures so we may need
to fine tune details in some cases such as PPC spe support.

The changes are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/ml2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/ml2

Richard Purdie (3):
  Add ARM tune file overhaul based largely on work from Mark Hatle
  Add basic Mips core tune config
  Add basic PowerPC core tune config

 meta/conf/machine/include/arm/arch-arm.inc         |   16 +++++-
 meta/conf/machine/include/arm/arch-armv4.inc       |   24 +++++++
 meta/conf/machine/include/arm/arch-armv5-dsp.inc   |   40 ++++++++++++
 meta/conf/machine/include/arm/arch-armv5.inc       |   51 ++++++++++++++++
 meta/conf/machine/include/arm/arch-armv6.inc       |   32 ++++++++++
 meta/conf/machine/include/arm/arch-armv7.inc       |   55 +++++++++++++++++
 meta/conf/machine/include/arm/arch-armv7a.inc      |   54 ++++++++++++++++
 meta/conf/machine/include/arm/feature-arm-neon.inc |    3 +
 .../conf/machine/include/arm/feature-arm-thumb.inc |   25 ++++++++
 meta/conf/machine/include/arm/feature-arm-vfp.inc  |    6 ++
 meta/conf/machine/include/mips/arch-mips.inc       |   64 +++++++++++++++++++-
 meta/conf/machine/include/powerpc/arch-powerpc.inc |   45 +++++++++++++-
 meta/conf/machine/include/tune-arm1136jf-s.inc     |   14 ++--
 meta/conf/machine/include/tune-arm920t.inc         |   14 +++-
 meta/conf/machine/include/tune-arm926ejs.inc       |   18 +++---
 meta/conf/machine/include/tune-arm9tdmi.inc        |   14 +++-
 meta/conf/machine/include/tune-armv7.inc           |    8 +--
 meta/conf/machine/include/tune-cortexa8.inc        |   21 ++++---
 meta/conf/machine/include/tune-cortexm1.inc        |   13 +++-
 meta/conf/machine/include/tune-cortexm3.inc        |   18 ++++-
 meta/conf/machine/include/tune-cortexr4.inc        |   18 ++++-
 meta/conf/machine/include/tune-ep9312.inc          |   16 +++--
 meta/conf/machine/include/tune-iwmmxt.inc          |   18 ++++--
 meta/conf/machine/include/tune-mips32.inc          |   10 +++-
 meta/conf/machine/include/tune-ppc603e.inc         |   12 +++-
 meta/conf/machine/include/tune-ppce300c2.inc       |   12 +++-
 meta/conf/machine/include/tune-ppce500.inc         |   13 +++-
 meta/conf/machine/include/tune-ppce500mc.inc       |   12 +++-
 meta/conf/machine/include/tune-ppce500v2.inc       |   12 +++-
 meta/conf/machine/include/tune-strongarm1100.inc   |   13 +++--
 meta/conf/machine/include/tune-xscale.inc          |   18 ++++--
 31 files changed, 594 insertions(+), 95 deletions(-)
 create mode 100644 meta/conf/machine/include/arm/arch-armv4.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv5-dsp.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv5.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv6.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv7.inc
 create mode 100644 meta/conf/machine/include/arm/arch-armv7a.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-neon.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-thumb.inc
 create mode 100644 meta/conf/machine/include/arm/feature-arm-vfp.inc

-- 
1.7.4.1



