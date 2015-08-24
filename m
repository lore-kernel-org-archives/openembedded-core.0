Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB1876B69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:18:40 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7OMIfis004700
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:18:41 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.235.1;
	Mon, 24 Aug 2015 15:18:40 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 24 Aug 2015 17:18:38 -0500
Message-ID: <cover.1440454005.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.7.0
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
X-List-Received-Date: Mon, 24 Aug 2015 22:18:43 -0000
Content-Type: text/plain

This patch updates to pseudo 1.7.0. At this point, it does *not* enable
the new database behavior by default, because while I can't make it fail
anymore, there were some weird behaviors occasionally which I would like
reproduce and track down before switching.

It does, however, add the profiling support, and the two easier/simpler
changes I made based on profiling results. My experience was that for
core-image-base, this cut about 8% off total build time. For tasks like
tar extractions, it can be quite a bit better.

Seconds to extract a tarball of a large /usr/include on an SSD-backed laptop:
		Clean		Over Existing Files
No pseudo	0.463		0.527
Pseudo 1.6.7	1.294		2.102
Pseudo 1.7.0	1.217		1.901
1.7.0+xattrdb	0.790		1.478

The xattrdb code will only work if the user_xattr feature is active on the
filesystem the files are on, and will only work with plain files and
directories. (Note that nodes which are emulated with plain files will
work.)

It is probably worth considering the xattrdb option for heavily-used build
servers and the like, but be on the lookout for bugs. (I am super interested
in bug reports, especially with reproducers, for that code.)

There are some cases where the underlying-filesystem permissions for files
will change in 1.7.0 (usually towards 0600), but there should be no changes
in database modes reported.

The tarball has been sent to Michael Halstad, but I don't think it's up
on the servers yet. The git build should work, though.

The following changes since commit c38acd720b3f6ffbeb544063692eb471dada8593:

  binconfig-disabled: write an message to stderr to help confused developers (2015-08-19 17:57:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo170
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo170

Peter Seebach (1):
  pseudo_1.7.0.bb: New version of pseudo

 meta/recipes-devtools/pseudo/pseudo_1.7.0.bb | 20 ++++++++++++++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |  4 ++--
 2 files changed, 22 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.7.0.bb

-- 
2.3.1


