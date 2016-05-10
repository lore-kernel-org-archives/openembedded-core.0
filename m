Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 5534473175
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2016 23:24:52 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP; 10 May 2016 16:24:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,606,1455004800"; d="scan'208";a="700145605"
Received: from keanhoon-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.145.253])
	by FMSMGA003.fm.intel.com with ESMTP; 10 May 2016 16:24:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 May 2016 11:24:14 +1200
Message-Id: <cover.1462921503.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [RFC PATCH 0/6] Task progress reporting
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
X-List-Received-Date: Tue, 10 May 2016 23:24:57 -0000

I've often thought it would be nice if we could print progress information
for individual tasks so that you could get some idea of whether the task
is doing anything and how much longer it might take, and so I've been working
on a set of patches to implement just that in the background for a while now
and this is the result.  Unfortunately this isn't necessarily practical to do
for all tasks, but things like do_fetch are running processes that do output
progress information so it's not too hard to tap into that and present it in
the form of a progress bar next to the task, which is what this patchset
does. I was also able to enable progress for do_compile in recipes that use
cmake (since that outputs % complete as it runs) as well as do_rootfs where
it has a number of internal steps that can be counted and weighted.

Note that this patchset is on top of Poky because there are changes required
in both BitBake and OE-Core. However, for those that prefer BitBake + OE-core
separately I have pushed a paule/progress-bb branch to poky-contrib (on top
of bitbake master) and paule/progress-oecore to openembedded-core-contrib on
top of openembedded-core master containing the same changes - ensure you have
both if you go down this route.

I have contemplated and even prototyped going a step further and using the
count of lines in the output to track progress for *all* long-running tasks,
which does work reasonably well - the caveat is you actually need the
expected line count ahead of time for each task, so you have to be able to
get that from somewhere. I  haven't worked out a practical means of
delivering that, suggestions would be very much welcome - my prototype stuff
is on poky-contrib paule/progress-wip and relies on someone profiling a
build containing all the tasks beforehand and that information somehow being
made available to everyone else.

Anyway, please let me know what you think.


Please review the following changes for suitability for inclusion. If you have
any objections or suggestions for improvement, please respond to the patches. If
you agree with the changes, please provide your Acked-by.

The following changes since commit 7ca60ec8bff7656b4e52f5a4d238913e851da089:

  test-empty-image: Fix LIC_FILES_CHKSUM typo (2016-05-06 10:48:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib paule/progress
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=paule/progress

Paul Eggleton (6):
  knotty: import latest python-progressbar
  lib: implement basic task progress support
  fetch2: implement progress support
  bitbake.conf: whitelist progress varflag
  classes/cmake: enable progress for do_compile
  classes/image: implement progress support for do_rootfs

 bitbake/lib/bb/build.py                           | 143 ++++++++
 bitbake/lib/bb/fetch2/__init__.py                 |   4 +-
 bitbake/lib/bb/fetch2/git.py                      |  47 ++-
 bitbake/lib/bb/fetch2/wget.py                     |  26 +-
 bitbake/lib/bb/ui/knotty.py                       |  76 ++++-
 bitbake/lib/bb/ui/uihelper.py                     |   7 +-
 bitbake/lib/progressbar.py                        | 384 ---------------------
 bitbake/lib/progressbar/LICENSE.txt               |  52 +++
 bitbake/lib/progressbar/__init__.py               |  49 +++
 bitbake/lib/progressbar/compat.py                 |  44 +++
 bitbake/lib/progressbar/progressbar.py            | 315 +++++++++++++++++
 bitbake/lib/progressbar/widgets.py                | 391 ++++++++++++++++++++++
 meta/classes/cmake.bbclass                        |   1 +
 meta/classes/image.bbclass                        |   9 +-
 meta/conf/bitbake.conf                            |   3 +-
 meta/lib/oe/rootfs.py                             | 101 +++++-
 meta/recipes-devtools/cmake/cmake-native_3.4.3.bb |   2 +
 17 files changed, 1238 insertions(+), 416 deletions(-)
 delete mode 100644 bitbake/lib/progressbar.py
 create mode 100644 bitbake/lib/progressbar/LICENSE.txt
 create mode 100644 bitbake/lib/progressbar/__init__.py
 create mode 100644 bitbake/lib/progressbar/compat.py
 create mode 100644 bitbake/lib/progressbar/progressbar.py
 create mode 100644 bitbake/lib/progressbar/widgets.py

-- 
2.5.5


