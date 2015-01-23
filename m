Return-Path: <Peter.Seebach@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 62AAD6AC95
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Jan 2015 02:23:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id t0N2NxTt007559
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 18:23:59 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 22 Jan 2015 18:23:58 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 20:23:55 -0600
Message-ID: <cover.1421976243.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Subject: (v3) [PATCH 0/1] pseudo 1.6.*4*
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
X-List-Received-Date: Fri, 23 Jan 2015 02:24:00 -0000
Content-Type: text/plain

So, pseudo 1.6.3 had a silly configure bug which could prevent it
from configuring under what turn out to be very common circumstances
if you're not me doing internal development, and very rare circumstances
in my normal pseudo development cycle, and I am not quite sure why
it worked at all in my build tests. Basically, "configure ... --prefix="
needed to specify an *existing* directory, or the configure would fail.
This is now fixed.

The other changes appear to have survived, and the one chown problem that
Mark Hatle ran into turns out to have been a task running outside of pseudo,
not a bug in pseudo itself.

Sorry for the mixup with the configure thing. The issue was a naive test:
	if [ "$(cd "$opt_prefix"; pwd)" = "$(pwd)" ]; ...
and this fails if the cd doesn't work because pwd is then just the current
directory.

The reason this test came into existence is that my usual local-dev
habit involves
	configure --prefix=~/pseudo/f
("f" being a historical name), and one time I typoed it and it appeared
to configure and build, but "make install" failed strangely.

And my normal dev cycle does include nuking that directory, but I tend
to first configure, *then* nuke that directory, and that works fine.

This Root Cause Analysis was brought to you by the letters D'OH!

The following changes since commit 0bcc01121e928d0be7a0550e500425852c63cf98:

  arch-mips.inc: Add the MIPS ABIEXTENSION to toolchain name (2015-01-21 14:28:43 +0000)

are available in the git repository at:
  git://git.yoctoproject.org/poky-contrib seebs/pseudo_164
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo_164

Peter Seebach (1):
  pseudo_1.6.x.bb/pseudo_git.bb: Pseudo 1.6.4

 ...do_client.c-protect-pwd_lck-against-magic.patch |   56 ----------
 ..._util-modify-interface-to-pseudo_etc_file.patch |   70 ------------
 ...nt.c-support-multiple-directories-in-PSEU.patch |  116 --------------------
 .../pseudo/{pseudo_1.6.2.bb => pseudo_1.6.4.bb}    |    7 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 +-
 5 files changed, 4 insertions(+), 249 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0001-pseudo_client.c-protect-pwd_lck-against-magic.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0002-pseudo_util-modify-interface-to-pseudo_etc_file.patch
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo-1.6.2/0003-pseudo_client.c-support-multiple-directories-in-PSEU.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.6.2.bb => pseudo_1.6.4.bb} (57%)


