Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 23A2B71692
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 22:52:00 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s93Mq0Vm020598
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Oct 2014 15:52:01 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 3 Oct 2014 15:52:00 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Oct 2014 17:58:30 -0500
Message-ID: <cover.1412376807.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.6.2
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
X-List-Received-Date: Fri, 03 Oct 2014 22:52:03 -0000
Content-Type: text/plain

This fixes a handful of things that have been creating strange and
hard-to-replicate failures.

1. The inode data path wasn't quite 64-bit clean, so XFS filesystems
could produce strange behavior.
2. When renaming a file, pseudo would sometimes create a link to
rename when the file had actually already been in the database.
3. Some operations could spuriously create an additional link to
a file.
4. So it was possible for you to end up with a file marked as deleted
but still having a 'NAMELESS FILE' entry for the same inode which
could cause strange behaviors galore.

The net outcome of this is that if there's a lot of renames happening
for files which have recently been hit by a may-unlink but the did-unlink
hasn't been processed yet, really strange stuff happens.

I think the XFS stuff may have actually been a red herring from some
of the other parts, which I could reproduce on 32-bit filesystems.

I haven't run builds against the recipe patches yet, but I've sent the
tarball link to pidge. Pretty optimistic, though, once I got past all
the crazy parts this was a pretty straightforward patch as such go.

The database change may cause some existing pseudo databases to become
invalid, but conveniently, it'll also invalidate checksums. They'll
probably work anyway, because pseudo is okay with inode mismatches.

The following changes since commit 2b85b3f33af5157cd4b6f8a6dc737015c85018c3:

  uninative-tarball: Update eglibc -> glibc (2014-10-02 10:58:18 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/pseudo162
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo162

Peter Seebach (1):
  pseudo*.bb: update to pseudo 1.6.2

 .../pseudo/{pseudo_1.6.1.bb => pseudo_1.6.2.bb}    |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.1.bb => pseudo_1.6.2.bb} (52%)


