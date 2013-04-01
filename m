Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Bruce.Ashfield@windriver.com>) id 1UMiWM-0006lB-J4
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Apr 2013 19:27:51 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r31H9qqU002854
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 1 Apr 2013 10:09:52 -0700 (PDT)
Received: from yow-bashfiel-d3.wrs.com (128.224.147.67) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Apr 2013 10:09:53 -0700
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: <richard.purdie@linuxfoundation.org>
Date: Mon, 1 Apr 2013 10:09:32 -0700
Message-ID: <cover.1364835699.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] linux-yocto: mips, -rt update and yocto-custom fix
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
X-List-Received-Date: Mon, 01 Apr 2013 17:27:51 -0000
Content-Type: text/plain

Richard,

Here are three small fixes that I've gathered up since pushing out the
last update to 3.8.x.

[PATCH 1/3] linux-yocto/3.8: update mips SA_RESTORER fix

    During the 3.8.4 integration there was a build issue on MIPS due to
    SA_RESTORER changes. A solution was put in place for mips, but it
    didn't cover other impacted architectures.

    This is a backport of the proposed fix for the next 3.8-stable,
    since the full -stable might not be available in the right timeframe.

[PATCH 2/3] kernel-yocto: use KBRANCH as default build branch

    commit 61001aa [kernel-yocto: respect SRC_URI modified branch selection]
    changed branch processing such that a branch specified in the SRC_URI
    would set the branch forced as the build branch.

    This change broke compatibility with the yocto-bsp, linux-yocto-custom
    based recipes. These recipes specify the branch to be built via KBRANCH,
    but allow the fetcher to use master for keeping the repository up to
    date. This means that no explicit branch is set in the SRC_URI and the
    routines return the default branch of 'master', which is not what is
    set in KBRANCH.

    To support this case, we simply pass a default branch into the routine
    returning the branch to build, and ensure that the default is KBRANCH
    so if no branch is passed in the SRC_URI, KBRANCH is always built.

    [YOCTO #4145]

[PATCH 3/3] linux-yocto-rt: integrate 3.8.4-rt2

    Updating to 3.8.4-rt2 to fix the minor issues found with -rt1.

    From the upstream commit log:

     changes since v3.8.4-rt1:
       - build fix for i915 (reported by "Luis Claudio R. Goncalves")
       - build fix for fscache (reported by tglx)
       - build fix for !RT (kernel/softirq.c did not compile)
       - per-cpu rwsem fixed for RT (required only by uprobes so far)
       - slub: delay the execution of the ->ctor() hook for newly created
	 objects. This lowers the worst case latencies.

  * This also fixes a build issue reported by Tom Zanussi

Cheers,

Bruce

The following changes since commit 92aeb31341b28b193d616ab5cf38af1b9673e37d:

  qemuimage-testlib: Fix quoting issue (2013-03-30 17:26:56 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/kernel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/kernel

Bruce Ashfield (3):
  linux-yocto/3.8: update mips SA_RESTORER fix
  kernel-yocto: use KBRANCH as default build branch
  linux-yocto-rt: integrate 3.8.4-rt2

 meta/classes/kernel-yocto.bbclass               |   11 ++++++-----
 meta/recipes-kernel/linux/linux-yocto-rt_3.8.bb |    4 ++--
 meta/recipes-kernel/linux/linux-yocto_3.8.bb    |   12 ++++++------
 3 files changed, 14 insertions(+), 13 deletions(-)

-- 
1.7.10.4



