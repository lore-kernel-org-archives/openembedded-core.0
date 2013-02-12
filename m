Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5OxM-000829-T3
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Feb 2013 00:08:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1CMq82U015395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 14:52:08 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 14:52:07 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2013 16:52:06 -0600
Message-ID: <cover.1360709138.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.4.4
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
X-List-Received-Date: Tue, 12 Feb 2013 23:08:09 -0000
Content-Type: text/plain

So, about two days AFTER pseudo 1.4.3 goes in, I finally hit the fairly
obvious bug in the link/linkat() changes. Summary: In general, if parameter
names end in 'path' pseudo tries to do automatic path fixups for them.
This doesn't work well for the *at() functions, because they can need
magic done with their corresponding file descriptors. So linkat() doesn't
take already-converted names.

link(), however, was using fully-expanded names. And when I converted it
to just call linkat(), it preserved this behavior. The obvious failure
is that in a chroot() environment, link() would prepend the chroot path
twice; once in link(), and once in linkat() which it called.

Fixed in pseudo 1.4.4, retested against the test case. Due to the
slightly-too-magical way pseudo works, the only actual changes are to
the names of the parameters of link().


The following changes since commit c58e6cf352774e147038e6543ac95ab0060f2327:
  Anders Roxell (1):
        distro_check: Remove creation of empty Meego filelist.

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo144
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo144

Peter Seebach (1):
  pseudo_git.bb: Bump to pseudo 1.4.4.

 .../pseudo/{pseudo_1.4.3.bb => pseudo_1.4.4.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.4.3.bb => pseudo_1.4.4.bb} (43%)



