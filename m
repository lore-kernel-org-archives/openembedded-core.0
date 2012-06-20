Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@windriver.com>) id 1ShLxR-0008Fu-Mc
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Jun 2012 16:32:34 +0200
Received: from localhost.localdomain (yow-bashfiel-d2.wrs.com
	[128.224.146.167])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q5KELdPN021106;
	Wed, 20 Jun 2012 07:21:39 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@windriver.com>
To: richard.purdie@linuxfoundation.org
Date: Wed, 20 Jun 2012 10:31:38 -0400
Message-Id: <cover.1340201997.git.bruce.ashfield@windriver.com>
X-Mailer: git-send-email 1.7.0.4
Cc: openembedded-core@lists.openembedded.org, liang.li@windriver.com,
	saul.wold@intel.com
Subject: [v2 PATCH 0/3] perf: make perf a standlone recipe
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
X-List-Received-Date: Wed, 20 Jun 2012 14:32:34 -0000

Richard/Saul,

Here is the re-work of the standalone perf build patch 
series. We isolated the errors that Saul was seeing on the 
autobuilder, and it stemmed from the misuse of the sources
symlink back into the working kernel directory. As Richard
pointed out, this would also break in a rm_work enabled
build.

I've also removed parts of the standalone recipe that were 
inherited from its former life as a sub-part of the kernel
recipes (the non-standard depends usage, etc) as part of this
v2. 

To build completely out of the sysroot patch 1/3 tells the 
story. We just need to save $kerndir/tools and $kerndir/lib
from being removed during the pruning. As far as I'm concerned
this is small and reasonable, since there are a few tools in
the kernel source tree that are of interest and may want to
be built and packaged separately.

The find now has a couple more prunes in it, which of course
makes it a bit harder to read. If we really want, a new magic
variable could be created where recipes/kernel could specify
what should be saved in the sysroot .. but I didn't want to
go there yet.

I've built and runtime tested things here, and everything
looks sane.

original v1 text is below

-->-->-->-->-->-->-->-->-->-->-->-->
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
-->-->-->-->-->-->-->-->-->-->-->-->

This addresses [YOCTO #1552]

cc: Tom Zanussi <tom.zanussi@intel.com>
cc: Liang Li <liang.li@windriver.com>

Cheers,

Bruce

The following changes since commit e0a70547069fe7e8a2d6bdaffc985fb172d46c31:
  Jason Wessel (1):
        perl: Allow perl to cross build and native build in a directory named "t"

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib zedd/perf
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=zedd/perf

Bruce Ashfield (2):
  kernel: save $kerndir/tools and $kerndir/lib from pruning
  recipes-kernel: remove linux-tools.inc

Liang Li (1):
  recipes-kernel: make perf a standalone package

 meta/classes/kernel.bbclass                     |    9 +---
 meta/recipes-kernel/linux/linux-tools.inc       |   41 ------------------
 meta/recipes-kernel/linux/linux-yocto-rt_3.0.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.2.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto-rt_3.4.bb |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.0.bb    |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.2.bb    |    2 -
 meta/recipes-kernel/linux/linux-yocto_3.4.bb    |    2 -
 meta/recipes-kernel/perf/perf_3.4.bb            |   50 +++++++++++++++++++++++
 9 files changed, 52 insertions(+), 60 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux/linux-tools.inc
 create mode 100644 meta/recipes-kernel/perf/perf_3.4.bb



