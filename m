Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 42A7E605B2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 21:47:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4JLlNb7008019
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 May 2014 14:47:23 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Mon, 19 May 2014 14:47:23 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 May 2014 16:51:40 -0500
Message-ID: <cover.1400277127.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo permissions: better fchmodat, mask out write bits
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
X-List-Received-Date: Mon, 19 May 2014 21:47:23 -0000
Content-Type: text/plain

(Sorry if this ends up getting duplicated, had mail server issues,
and there may be deferred copies floating around somewhere.)

Two changes:
1. Report failures from calling fchmodat with AT_SYMLINK_NOFOLLOW,
because otherwise GNU tar won't set modes as well as we would like
it to. (No effect on generated filesystems, I think, just on the
underlying local filesystem.)
2. Mask out write bits for non-user in the real filesystem, so other
users can't add stuff to the mode 777 directories in your rootfs.

The following changes since commit e273301efa0037a13c3a60b4414140364d9c9873:

  gstreamer/lame: Better gcc 4.9 fix (2014-05-15 23:27:41 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib sees/pseudo-fchmodat
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo-fchmodat

Peter Seebach (1):
  pseudo: handle fchmodat better, mask out unwanted write bits

 .../pseudo/files/pseudo-fchmodat-permissions.patch |   98 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_1.5.1.bb       |    3 +-
 2 files changed, 100 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/files/pseudo-fchmodat-permissions.patch


