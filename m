Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TLiOQ-00011r-Ls
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Oct 2012 00:35:14 +0200
Received: from cougar.plausible.org (c-67-171-188-207.hsd1.or.comcast.net
	[67.171.188.207]) (Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 532A8212ED;
	Tue,  9 Oct 2012 15:22:05 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 Oct 2012 15:21:53 -0700
Message-Id: <1349821315-18006-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH RFC 0/2] eliminate (almost all of) busybox for GNUish images
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
X-List-Received-Date: Tue, 09 Oct 2012 22:35:14 -0000

We've been attempting to build an image that is busybox-free.
Unfortunately there are a handful of busybox applets which are used in
existing functionality (mostly various initscripts) and for which
oe-core has no packaged replacements:

+ /usr/bin/run-parts - part of upstream debianutils, unpackaged.

+ /sbin/start-stop-daemon - part of upstream dpkg, built by oe-core
  recipe but unpackaged.

+ /sbin/if{up,down} - upstream ifupdown, but busybox version is AFAICT
  quite divergent.

These are all tiny, and probably not worth having in distinct binaries.
The attached patch breaks out a separate "busybox-oe-min" package that
can be installed in images that don't need or want the full busybox
binary.  It comes to 41kb on my x86 build.

Note that busybox is still pulled in by packagegroup-core-boot, so none of
the existing images will use this package without modification.

Andy



