Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1S0kZ4-0001zE-Bc
	for openembedded-core@lists.openembedded.org;
	Fri, 24 Feb 2012 03:07:20 +0100
Received: from yow-bashfiel-l1.corp.ad.wrs.com
	(yow-bashfiel-d3.ottawa.windriver.com [128.224.147.67])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q1O1wnI7028989;
	Thu, 23 Feb 2012 17:58:49 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Thu, 23 Feb 2012 20:58:46 -0500
Message-Id: <cover.1330048310.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.4.1
Cc: openembedded-core@lists.openembedded.org, saul.wold@intel.com
Subject: [PATCH 0/1] linux-yocto: improve checkout error handling and reporting
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 24 Feb 2012 02:07:20 -0000

Richard/Saul,

I've got a long description in the patch itself that gives most of the
details of this change. But I'll hit some extra points here.

I've been cooking up this change for quite a while, since people seem to
be working with local repositories and it is a common mistake to point at
a non-bare linux-yocto repo. Due to the way the WORKDIR repo is created, this
can cause some really cryptic build errors. This change addresses that issue
and adds some workflow improvements at the same time.

  - it can optionally work with the 'bareclone' option in a SRC_URI. I sent
    that patch to bitbake-devel today. This isn't required, but if it is 
    used, a full bare clone is made in WORKDIR, and the checkout phase of
    linux-yocto detects that and creates local tracking branches for the 
    remotes. Mixes of local and remote branches work perfectly here.

  - it can also detect if a local, non-bare repository was the src repo.
    In this case, the tree is validated for the minimum branches that 
    make the rest of the build viable, and if they aren't found a clear
    message is dumped about the missing branches. No cryptic errors from
    the build.

  - instead of poking at git internals to create the local branches in 
    WORKDIR. real tracking branches are created. With this, you now have
    the ability to work on your repository and push changes to your 
    upstream, or fetch changes into the remotes and then bring them into
    your local branches. Everthing is setup properly for a more 'normal'
    development workflow.

I wanted to send this out before I send my -stable updates to the repos
themselves.

Cheers,

Bruce

The following changes since commit d8b3718303c3d56394c722059f1a73bd79131d0a:

  texi2html: Fix for multilib (2012-02-22 23:03:16 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (1):
  linux-yocto: improve checkout error handling and reporting

 meta/classes/kernel-yocto.bbclass |   72 +++++++++++++++++++++++++------------
 1 files changed, 49 insertions(+), 23 deletions(-)

-- 
1.7.4.1



