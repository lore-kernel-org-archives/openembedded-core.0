Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2204D70034
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jun 2016 12:07:32 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 23 Jun 2016 05:07:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,516,1459839600"; d="scan'208";a="1003730779"
Received: from clim19-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.149.148])
	by orsmga002.jf.intel.com with ESMTP; 23 Jun 2016 05:07:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 00:06:56 +1200
Message-Id: <cover.1466683248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH v2 00/10] Show progress during build and eSDK install
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
X-List-Received-Date: Thu, 23 Jun 2016 12:07:35 -0000

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

Changes since v1:
* Recalculate stage weightings for do_rootfs, ensure we call finish() and
  add a comment mentioning how to recalculate the weightings if needed in
  future
* Fix extensible SDK install printing out errors twice on failure
* Print out list of unexpected tasks in an order closer to actual
  execution order than previously
* Add a patch fixing output of lines if SDK testing fails (not directly
  related, but I noticed this issue when fixing the SDK logging)


The following changes since commit 9431698a88430f0fa892d9b270c0849c4d3d2486:

  build-appliance-image: Update to master head revision (2016-06-21 14:02:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/startup-oe
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/startup-oe

Paul Eggleton (10):
  bitbake.conf: whitelist progress varflag
  classes/cmake: enable progress for do_compile
  classes/image: implement progress support for do_rootfs
  classes/sstate: show progress during sstate object availability check
  classes/sstate: add a mode to error if sstate package unavailable
  classes/testsdk: print output correctly on failure
  classes/populate_sdk_ext: eliminate double execution on install
  lib/oe/sstatesig: print locked sigs file message only when explicitly
    called
  classes/populate_sdk_ext: show progress when preparing build system
  toolchain-shar-extract.sh: allow TERM through into SDK installer env

 meta/classes/cmake.bbclass                        |   1 +
 meta/classes/image.bbclass                        |  19 +++-
 meta/classes/populate_sdk_ext.bbclass             |   7 +-
 meta/classes/sstate.bbclass                       |  29 +++++-
 meta/classes/testsdk.bbclass                      |  14 ++-
 meta/conf/bitbake.conf                            |   6 +-
 meta/files/ext-sdk-prepare.py                     | 117 ++++++++--------------
 meta/files/toolchain-shar-extract.sh              |   1 +
 meta/lib/oe/rootfs.py                             | 101 ++++++++++++++++---
 meta/lib/oe/sstatesig.py                          |  10 +-
 meta/recipes-devtools/cmake/cmake-native_3.5.2.bb |   2 +
 scripts/oe-buildenv-internal                      |   2 +-
 12 files changed, 204 insertions(+), 105 deletions(-)

-- 
2.5.5


