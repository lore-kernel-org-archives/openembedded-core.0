Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1Sfd3x-0004Fm-LP
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 22:24:10 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5FKDQAA020236;
	Fri, 15 Jun 2012 13:13:26 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Fri, 15 Jun 2012 16:23:00 -0400
Message-Id: <cover.1339791495.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, liang.li@windriver.com,
	saul.wold@intel.com
Subject: [PATCH 0/2] perf: make perf a standlone recipe
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
X-List-Received-Date: Fri, 15 Jun 2012 20:24:10 -0000

Richard/Saul,

We've wanted to do this for some time, and now have finally split
out perf from being a sub-part of the kernel packages into a
standalone package that is built out of the kernel sources.

I've built and tested this by adding task-core-tools-profile to
my IMAGE_INSTALL, and perf behaves just as it did before.  I've
also tested this on my oe-core checkout/repo, and it works fine
there as well (but I'm using my easier to access contrib
branch for now).

There's additional work that can be done more easily once this
is split, so please consider this for inclusion, but I'd like
to keep this initial version as an exact functional match as
what was previously in place.

I've removed the old linux-tools.inc and updated any kernel 
recipes that I know about that have references to it. If there
are other dependent recipes, they'll need to be updated.

From the patch itself:

  perf has been coupled to the kernel packages via kernel.bbclass.
  While maintaining the build of perf out of the kernel source tree
  is desired the package coupling has proved to be awkward in
  several situations such as:

     - when a kernel recipe doesn't want to build/provide perf
     - when licensing of dependencies would prohibit perf and hence
       the kernel from being built.

  To solve some of these problems, this recipe is the extraction of
  the linux-tools.inc provided perf compilation into a standalone
  perf recipe that builds out of the kernel source, but is otherwise
  independent.

  No new functionality is provided above what the linux-tools.inc
  variant provided, but the separate recipe provides baseline for
  adding new functionality.

This addresses [YOCTO #1552]

cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Liang Li <liang.li@windriver.com>

Cheers,

Bruce

The following changes since commit 4bb7ef94fca392bcd389ed7069280c238f8fe094:

  directfb: added missing Upstream-status (2012-06-15 15:44:39 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib zedd/perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/perf

Bruce Ashfield (1):
  recipes-kernel: remove linux-tools.inc

Liang Li (1):
  recipes-kernel: make perf a standalone package

 meta/classes/kernel.bbclass                     |    7 +---
 meta/recipes-kernel/linux/linux-tools.inc       |   41 ------------------
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 -
 meta/recipes-kernel/perf/perf_3.4.bb            |   52 +++++++++++++++++++++++
 9 files changed, 53 insertions(+), 59 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-tools.inc
 create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb

-- 
1.7.7



