Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id DD6B5615AC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Oct 2013 23:23:44 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id 79400A024ED; Fri, 18 Oct 2013 18:24:34 -0500 (CDT)
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Oct 2013 18:24:32 -0500
Message-Id: <cover.1382138424.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <525EC341.9080407@linux.intel.com>
References: <525EC341.9080407@linux.intel.com>
Subject: [PATCH 0/2] v2: Use alternatives for binutils
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Oct 2013 23:23:45 -0000

This is a rework of a previous patch to use alternatives consistently
for all of binutils instead of relying on symlinks for most things,
and alternatives for ar and strings.

Changes:
1. Dropped embedspu compltely from the alternatives list. If anyone's
actually using Cell processors with oe-core, or something else that
needs the ability to embed SPU binaries as ELF objects in binaries for
other CPUs, I'm willing to revisit that.
2. Make the selection of ld.bfd or ld.gold contingent on the presence
of ld-is-gold in DISTRO_FEATURES.
3. Set the alternatives only for class-target, because otherwise we
don't want or need them.

This should address failures with cross-canadian builds ("error: Can't install 
binutils-cross-canadian-arm-2.23.2-r4@i686_nativesdk: no package 
provides update-alternatives-cworth"), and warnings for the absent embedspu
and ld.gold binaries, but should work for people using ld.gold.

As before, the purpose of this is mostly a cleanup, because people
don't find an "as" binary, so they end up looking around and finding
binutils-symlinks, then they notice that binutils-symlinks doesn't
have "ar" and "strings". Confusion ensues.

The following changes since commit 24a6b1324965080fef6c363edcb37768090eebea:

  wic: add pseudo to the populate-extfs step (2013-10-18 16:03:36 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/binutils-alternatives
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/binutils-alternatives

Peter Seebach (2):
  Use alternatives for the binutils-symlinks package.
  Drop binutils-symlinks

 meta/recipes-devtools/binutils/binutils.inc |   67 +++++++++++++++------------
 1 files changed, 38 insertions(+), 29 deletions(-)


