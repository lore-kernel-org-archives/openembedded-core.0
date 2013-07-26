Return-Path: <seebs@msp-lpggp2.wrs.com>
Received: from msp-lpggp2.wrs.com (unknown [206.144.70.9])
	by mail.openembedded.org (Postfix) with ESMTP id A466A6041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 20:50:58 +0000 (UTC)
Received: by msp-lpggp2.wrs.com (Postfix, from userid 508)
	id BADA2A03700; Fri, 26 Jul 2013 07:49:36 -0500 (CDT)
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 07:49:35 -0500
Message-Id: <cover.1374842539.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 0/1] Make NO32LIBS=0 more an order than a suggestion
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
X-List-Received-Date: Fri, 26 Jul 2013 20:50:58 -0000

The NO32LIBS hackery replaced an attempt to discern whether we could
likely build a 32-bit libpseudo.so, and for some use cases such as
external toolchains, we sometimes wish to *require* a 32-bit libpseudo.so.
Unfortunately, NO32LIBS=0 doesn't do that; it just means that we'll
try to build it if we happen to find stubs-32.h and think it'll work.

Change this so that NO32LIBS=0 makes the build mandatory, and also add
a couple of diagnostics to increase the chances that people being bitten
by this will find out why. In particular, this should reduce the incidence
of people who are using external toolchains and failing to get a 32-bit
libpseudo, resulting in pseudo database corruption with no obvious
explanation, and a flood of "failed to load libpseudo.so" messages.

NOTE: This has been tested some, but the pool of possible ways these
tests could fail is large, so it's probably worth giving this some soak
time, or trying it on various machines, before assuming it'll work
consistently. It will likely expose at least one failure which was actually
a misconfigured host that simply happened to be avoiding getting caught.

The following changes since commit ac5d20f4adac69ea1702694fb50849c9e465b443:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-23 07:49:54 -0700)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/no32libs
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/no32libs

Peter Seebach (1):
  Always try to build 32-bit libpseudo when NO32LIBS is set to 0

 meta/recipes-devtools/pseudo/pseudo.inc | 50 +++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 9 deletions(-)

-- 
1.8.3


