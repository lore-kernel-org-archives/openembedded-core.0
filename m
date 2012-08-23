Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1T4bSU-0000wM-Di
	for openembedded-core@openembedded.org; Thu, 23 Aug 2012 19:44:42 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id B2D5E1F43D;
	Thu, 23 Aug 2012 10:32:36 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@openembedded.org
Date: Thu, 23 Aug 2012 10:32:29 -0700
Message-Id: <1345743151-2065-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/2] RPATH fixes: libtool & binutils
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 17:44:42 -0000

Current RPATH work:

Patch 1 just updates the libtool work to use the built-in
normalization function instead of sed, as requested.

Patch 2 is to binutils ld, to fix the underlying host pollution issue:
the -rpath argument was not sysroot aware, so setting
"/usr/lib/../lib" as an RPATH would add the host /usr/lib to the link
time search path instead of the sysroot directory.

Note that the previous warning fix to insane.bbclass is still
producing unmasked warnings in a few cases (the rpm utilities are one
that I know), mostly in programs instead of libraries.  These will
need to be audited independently.  It's possible that they are liking
with -rpath directly and not using libtool, or that a needed
normalization in libtool is still missing.  But with the current
patches these warnings are benign now, they can't break the build.

Andy



