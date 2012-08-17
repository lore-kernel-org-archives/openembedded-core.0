Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T2P2z-0001Kg-F3
	for openembedded-core@openembedded.org; Fri, 17 Aug 2012 18:05:17 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 8719B1EC71;
	Fri, 17 Aug 2012 08:53:19 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org
Date: Fri, 17 Aug 2012 08:53:09 -0700
Message-Id: <1345218791-28891-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.2
Subject: [PATCH 0/2] RPATH host pollution fixes
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
X-List-Received-Date: Fri, 17 Aug 2012 16:05:17 -0000

Results from chasing the RPATH pollution I was seeing:

I don't have a fix for the underlying linker issue, but that is
captured here:

  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2965

Patch 1 is the warning fix from earlier, which is still a fix to the
existing logic and should be applied.  I've removed the
"host-polluted" text though, as AFAICT the actual RPATH is not a
problem, only the use of -rpath with the linker that produced it.

Patch 2 is a fix to libtool on top of the existing fix-rpath.patch to
normalize the strings.  With this applied, all the link failures we
have reproduced (including the one reported vs. owl_video last week)
work correctly.  No libraries in the resulting sysroot have a RPATH
set to a default link directory.

A few runnable binaries still trigger the warning though (but
otherwise build successfully), I'm looking at that now -- I suspect
these simply aren't using libtool, or else we've missed a spot where
normalization and/or default directory pruning needs to happen.

Andy



