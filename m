Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1T3tQk-00040S-SF
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:43:59 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7LIVrQi001693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:31:53 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 21 Aug 2012 11:31:53 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 13:31:51 -0500
Message-ID: <cover.1345573717.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] Move PSEUDO_LOCALSTATEDIR outside rootfs
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
X-List-Received-Date: Tue, 21 Aug 2012 18:43:59 -0000
Content-Type: text/plain

There's a race condition in one of our (non-poky) builds which involves
a rootfs getting deleted while a pseudo process has a db in it open.
This caused me to realize that there existed a pseudo database in a
target filesystem, which made me panic. And we have a few really strange
reports I've never been able to reproduce where target filesystems
under qemu went pear-shaped in ways that look like pseudo suddenly
got really, really, confused.

Like say what would happen if a target could wipe out its own filesystem
permissions, because they were in its rootfs. :P

I haven't tested this super thoroughly, but I can still complete builds
and SDK builds with it, and it makes sense.

The following changes since commit 4ef8960c8d2876914bb78cbdce5fae3c5297e942:
  Khem Raj (1):
        gcc-cross-intermediate, gcc-crosssdk-intermediate: Remove

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/varpseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/varpseudo

Peter Seebach (1):
  runqemu-export-rootfs and friends: don't put pseudo db in target fs

 .../installer/adt-installer/scripts/extract_rootfs |    7 +++----
 scripts/runqemu-export-rootfs                      |    2 +-
 scripts/runqemu-extract-sdk                        |   13 +++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)



