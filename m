Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TjhRd-0004Bf-Pq
	for openembedded-core@lists.openembedded.org;
	Sat, 15 Dec 2012 03:25:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBF2B38K010533
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 18:11:03 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Fri, 14 Dec 2012 18:11:03 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 20:10:56 -0600
Message-ID: <cover.1355536994.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.4.2: linkat() and bitrot cleanup
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
X-List-Received-Date: Sat, 15 Dec 2012 02:25:42 -0000
Content-Type: text/plain

The major change here is the addition of linkat(), and the change of link()
to be written in terms of it (for consistency with othe *at() calls).

I checked this out on Darwin (which hasn't got *at() functions) and picked
off a couple little bits of bitrot.

The other change is that the WR build system turns out to have reasons to,
in some cases, actually use a lib64 directory for things like the host
sqlite3 library. So I cleaned up the computation of the sqlite library
path; of course, this then broke oe-core on 64-bit hosts, but I'd anticipated
that, and pseudo's configure can take an explicit full path to libsqlite3.a
if it's not in a directory with the same name as $(LIB). Did that to the
various 32-bit and 64-bit forms. Note that on 64-bit hosts, this means
that 32-bit libpseudo (if it's being built) is being configured with the
explicit path to our 64-bit libsqlite3.a; that's okay, because we only
build libpseudo for the 32-bit case. Confirmed that, with NO32LIBS = 0,
I get both 32-bit and 64-bit libpseudo.

I did have build failures in perl-native when I was first testing this,
but updating oe-core made them go away, so it was probably just my tree
being pretty old before I started on the pull request.

The tarball is already on yoctoproject.org (thanks, pidge!) and I have
verified that the build still succeeds.

The following changes since commit ad79360c1d992830d4f0e06a3bbf0622658c0540:
  Mark Hatle (1):
        populate_sdk_base: Add perl modules as needing to be relocated

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo_1_4_2
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo_1_4_2

Peter Seebach (1):
  pseudo_git.bb and friends: Update to 1.4.2.

 meta/recipes-devtools/pseudo/pseudo.inc      |    9 +++++----
 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.2.bb |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    6 +++---
 4 files changed, 16 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.2.bb



