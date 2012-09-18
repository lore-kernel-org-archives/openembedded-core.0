Received: from li44-10.members.linode.com ([72.14.181.10] helo=plausible.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andy.ross@windriver.com>) id 1TE5hj-0007Mw-JS
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Sep 2012 23:51:39 +0200
Received: from cougar.plausible.org (unknown [67.171.188.207])
	(Authenticated sender: andy-wrs)
	by plausible.org (Postfix) with ESMTPSA id 24BD228E50;
	Tue, 18 Sep 2012 14:39:00 -0700 (PDT)
From: Andy Ross <andy.ross@windriver.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 18 Sep 2012 14:38:43 -0700
Message-Id: <1348004325-30668-1-git-send-email-andy.ross@windriver.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/2] udev-extraconf: Don't mount root filesystem under /media
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
X-List-Received-Date: Tue, 18 Sep 2012 21:51:39 -0000

When you boot an image with a kernel-mounted root filesystem
(e.g. "root=/dev/sda1" or the like), the root filesystem also appears
as a read-write filesystem under /media.  The fix has two parts:

2. Modify the mount.sh hook to test the root filesystem device number
instead of the name (which won't match "/dev/root").

1. ...but that breaks on images which use busybox and lack coreutils,
because there is no stat binary.  Add this to the busybox defconfig,
and patch it to live in /usr/bin instead of /bin to match the
coreutils path.

Andy



