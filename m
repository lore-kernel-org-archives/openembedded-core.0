Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B41866FB73
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 00:10:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4S0AKoe010875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 May 2014 17:10:20 -0700 (PDT)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 27 May 2014 17:10:20 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Date: Tue, 27 May 2014 19:14:45 -0500
Message-ID: <cover.1401235888.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo fchmodat, this time for sure
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
X-List-Received-Date: Wed, 28 May 2014 00:10:20 -0000
Content-Type: text/plain

This improves on the previous patch by moving the umask clearing
in mkdirat() outside of a rarely-used #ifdef block.

It improves on the original submission by masking out umasks at all,
which turns out to be necessary for mkdir, open, etcetera in order to
get the right database mode.

Originally, pseudo assumed that the "correct" mode for
a file would be the mode returned by creating the file with the
requested mode. Over time, that's been fixed up to include
masking in 0600 bits, and 0100 for directories, and masking out
022 bits, then restoring these bits from the specified mode...
Which doesn't produce the right results if umask has any of 0722
in it. Which it often does.

The patch sent out earlier today got this right for plain files and
special nodes, but not for directories, unless you were building on
RHEL4 or another system which doesn't actually have the *at() functions.

The following changes since commit 9948e4239b88026804c33d84830dbfe6b0ed3e59:

  eglinfo: updated to compile with mesa10+ (2014-05-27 16:10:25 +0100)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/umask
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/umask

Peter Seebach (1):
  pseudo: Honor umask again

 .../pseudo/files/pseudo-fchmodat-permissions.patch |  169 +++++++++++++++++++-
 1 files changed, 163 insertions(+), 6 deletions(-)


