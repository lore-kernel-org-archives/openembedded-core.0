Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5j4h-00070b-5A
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 21:37:06 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1DKL25C024067
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Feb 2013 12:21:02 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Wed, 13 Feb 2013 12:20:59 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: openembedded-core <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Feb 2013 14:20:58 -0600
Message-ID: <cover.1360786008.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo (1.4.5) -- this time for sure
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
X-List-Received-Date: Wed, 13 Feb 2013 20:37:11 -0000
Content-Type: text/plain

The question of how many copies of the chroot path should be prepended
to paths when calling link() is a challenging one, but after flirtations
with 2 (pseudo 1.4.3) and 0 (pseudo 1.4.4) I think I've settled on a
reasonable compromise at 1.

The underlying logic bug was an under-considered attempt to avoid
doing path expansions before calling a *at() function, which might help
with relative paths, but doesn't work with a chroot directory. In
fact, since we're fully expanding paths (including any fd-relative
paths), there's not even areason to use the linkat() syscall to implement
this.

Retested, and verified against the following trivial test case:

        #include <unistd.h>
        #include <stdio.h>
        #include <fcntl.h>
        #include <string.h>
        #include <errno.h>

        int
        main(void) {
                int rc;
                chdir("/home/seebs/pseudo/r");
                chroot("/home/seebs/pseudo/r");
                rc = link("/a", "/b");
                printf("%d: %d [%s]\n", rc, errno, strerror(errno));
                return 0;
        }

I am informed that pseudo 1.4.5.tar.bz2 is in the Yocto project download
area already.

Sorry for the trouble!

The following changes since commit bbcd8b344598850ea2c8d3ad375c519713581fde:
  Chen Qi (1):
        busybox: add config fragments

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo145
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo145

Peter Seebach (1):
  pseudo_1.4.5.bb: Finish fixing linkat()

 .../pseudo/{pseudo_1.4.4.bb => pseudo_1.4.5.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.4.4.bb => pseudo_1.4.5.bb} (43%)



