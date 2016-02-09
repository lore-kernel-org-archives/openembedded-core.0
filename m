Return-Path: <Peter.Seebach@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 676D473178
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 19:57:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u19JvxmP013863
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 9 Feb 2016 11:57:59 -0800 (PST)
Received: from msp-lpggp2.wrs.com (172.25.34.109) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 9 Feb 2016 11:57:59 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Feb 2016 13:57:57 -0600
Message-ID: <cover.1455047631.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 2.3.1
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.7.5
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
X-List-Received-Date: Tue, 09 Feb 2016 19:58:01 -0000
Content-Type: text/plain

tarball submitted, but this won't work without it... but you should
be able to use pseudo_git if you want to see the new shiny.

Long story short, there has always been a race condition if enough
clients were trying to simultaneously start a server, but that doesn't
come up much. But a while back, I added a "feature" where "pseudo <cmd>"
would try to shut the server down cleanly after running the command,
which is great for casual command-line use, but meant that we would
actually hit the race condition.

Respawn logic drastically reworked, various other changes made to
make this less likely to come up, and so on.

Also, pseudo will now abort() if the client can't get a server, which
could conceivably break things, *but*, it should only be breaking things
which have in fact been broken all along, we just didn't know it.

Also a bug fix for cases where mknod is called with only file permission
bits to create an ordinary file, which GNU tar does if and only if trying
to extract xattrs apparently (!?!??), and then a followup workaround for
a problem making ext4 filesystems, where I'm pretty sure the behavior was
right to begin with but this workaround lets things progress in the mean
time.

Whee.

The following changes since commit d53a0d410ae2390528f1090a131cd3e16d7ebcc5:

  glibc-locale: fix QA warning (2016-02-07 22:53:22 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo175
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo175

Peter Seebach (1):
  pseudo: uprev to 1.7.5

 meta/recipes-devtools/pseudo/{pseudo_1.7.4.bb => pseudo_1.7.5.bb} | 4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb                        | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.7.4.bb => pseudo_1.7.5.bb} (77%)

-- 
2.3.1


