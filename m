Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8CA6065C8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Jun 2016 03:14:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 12 Jun 2016 20:14:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,464,1459839600"; d="scan'208";a="718037589"
Received: from ctan5-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.176.32])
	by FMSMGA003.fm.intel.com with ESMTP; 12 Jun 2016 20:14:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 13 Jun 2016 15:13:51 +1200
Message-Id: <cover.1465787274.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 0/9] Show progress during build and eSDK install
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
X-List-Received-Date: Mon, 13 Jun 2016 03:14:30 -0000

Show progress during build and extensible SDK installation.

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

I have contemplated and even prototyped going a step further and using the
count of lines in the output to track progress for *all* long-running tasks,
which does work reasonably well - the caveat is you actually need the
expected line count ahead of time for each task, so you have to be able to
get that from somewhere. I  haven't worked out a practical means of
delivering that, suggestions would be very much welcome - my prototype stuff
is on poky-contrib paule/progress-wip and relies on someone profiling a
build containing all the tasks beforehand and that information somehow being
made available to everyone else.

Also included in this patchset is support for showing progress in a couple
of other stages during the build - when checking for the availability of
sstate artifacts, when initialising the tasks (formerly "Preparing RunQueue")
and overall progress of running setscene and normal tasks.

There are also a few semi-related changes to improve progress reporting and
speed of extensible SDK installation.

NOTE: this patchset requires the corresponding set of changes just sent
to the bitbake-devel list in order to work.


The following changes since commit 2fdd2c1434e7c741b8048145bd460c68bea7ee53:

  systemtap: add build dependency on ncurses (2016-06-12 23:47:00 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/startup-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/startup-oe

Paul Eggleton (9):
  bitbake.conf: whitelist progress varflag
  classes/cmake: enable progress for do_compile
  classes/image: implement progress support for do_rootfs
  classes/sstate: show progress during sstate object availability check
  classes/sstate: add a mode to error if sstate package unavailable
  classes/populate_sdk_ext: eliminate double execution on install
  lib/oe/sstatesig: print locked sigs file message only when explicitly called
  classes/populate_sdk_ext: show progress when preparing build system
  toolchain-shar-extract.sh: allow TERM through into SDK installer env

 meta/classes/cmake.bbclass                        |   1 +
 meta/classes/image.bbclass                        |  10 +-
 meta/classes/populate_sdk_ext.bbclass             |   7 +-
 meta/classes/sstate.bbclass                       |  29 +++++-
 meta/conf/bitbake.conf                            |   6 +-
 meta/files/ext-sdk-prepare.py                     | 117 ++++++++--------------
 meta/files/toolchain-shar-extract.sh              |   1 +
 meta/lib/oe/rootfs.py                             | 101 ++++++++++++++++---
 meta/lib/oe/sstatesig.py                          |  10 +-
 meta/recipes-devtools/cmake/cmake-native_3.5.2.bb |   2 +
 scripts/oe-buildenv-internal                      |   2 +-
 11 files changed, 184 insertions(+), 102 deletions(-)

-- 
2.5.5


