Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (unknown [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 78ED76FA9F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 19:30:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s4RJV0wg001591
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 12:31:00 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 27 May 2014 12:31:00 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 14:35:25 -0500
Message-ID: <cover.1401219091.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo: honor umask again
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
X-List-Received-Date: Tue, 27 May 2014 19:31:02 -0000
Content-Type: text/plain

The fchmodat patch subtly broke umask support. The key here is that
since I was thinking about chmod, chmod is what I tested, and chmod
ignores umask. But the patch had the side effect of masking in 022
bits if they were set in the requested mode for an open/mkdir/mknod,
even if umask would have removed them from the filesystem.

This patch corrects that, and also in passing removes a completely
spurious double-mask-out of extra bits. It turns out that
	((x) & ~y)
is just as good as
	(((x) & ~y) & ~y)

The patch looks larger than it really is, just because diffs-of-diffs;
the substance is that each of the mknod/mkdir/open functions which
actually works with the mode flag now masks out pseudo_umask, which
is set during the initial pseudo client setup, and updated whenever
umask is called.

Many thanks to kroon in #yocto for bringing this to my attention.

The following changes since commit 9948e4239b88026804c33d84830dbfe6b0ed3e59:

  eglinfo: updated to compile with mesa10+ (2014-05-27 16:10:25 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/umask
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/umask

Peter Seebach (1):
  pseudo: Honor umask again

 .../pseudo/files/pseudo-fchmodat-permissions.patch |  163 +++++++++++++++++++-
 1 files changed, 157 insertions(+), 6 deletions(-)


