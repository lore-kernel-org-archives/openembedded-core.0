Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id CAB4D6B6B7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Feb 2015 16:40:17 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 19 Feb 2015 08:40:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,609,1418112000"; d="scan'208";a="680425512"
Received: from abarnicl-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.2.27])
	by fmsmga002.fm.intel.com with ESMTP; 19 Feb 2015 08:40:17 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Feb 2015 16:39:49 +0000
Message-Id: <cover.1424363815.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.9.3
Subject: [PATCH 00/15] devtool and externalsrc improvements
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
X-List-Received-Date: Thu, 19 Feb 2015 16:40:17 -0000

I've been attempting to enable usage of devtool with the kernel (which
effectively means using the externalsrc class with the kernel). This
doesn't really work yet due to lack of handling the kernel configuration,
so you still can't use externalsrc properly with the kernel, but this
at least gets us further - you can now extract the source successfully
and run a build. I also discovered and fixed a number of related issues
along the way, and made a few behavioural improvements in both devtool
and externalsrc.


The following changes since commit ad016fa7492ba23c751cf33dd1befde7782facfa:

  lzo: Upgrade to 2.09 and add ptest (2015-02-19 07:50:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-fixes

Paul Eggleton (15):
  recipetool: fix regression caused by previous commit
  lib/oe/patch: fix PATCHTOOL = "git" with source in a subdirectory
  classes/externalsrc: fix source being wiped out on clean with kernel
  classes/externalsrc: add workaround for recipes that use SRCPV in PV
  classes/externalsrc: show a warning on compiling
  classes/kernel-yocto: extend SRCTREECOVEREDTASKS
  devtool: add/modify: add option to build in same directory
  devtool: reset: run bitbake -c clean on recipe
  devtool: build: run do_populate_sysroot instead of do_install
  lib/oe/recipeutils: minor improvements to patch_recipe()
  devtool: update-recipe: add handling for git recipes
  devtool: prevent extract/modify use with image recipes
  devtool: modify: handle recipes that use a shared workdir
  devtool: support source extraction for recipes that use a shared
    workdir
  devtool: fix broken clones of git recipes

 meta/classes/externalsrc.bbclass  |  24 ++++
 meta/classes/kernel-yocto.bbclass |   2 +-
 meta/lib/oe/patch.py              |   7 +-
 meta/lib/oe/recipeutils.py        |   4 +-
 meta/lib/oeqa/selftest/devtool.py | 147 ++++++++++++++++++-
 scripts/lib/devtool/standard.py   | 292 +++++++++++++++++++++++++-------------
 scripts/lib/recipetool/create.py  |   8 +-
 7 files changed, 377 insertions(+), 107 deletions(-)

-- 
1.9.3


