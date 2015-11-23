Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 413CB605FE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Nov 2015 02:10:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 22 Nov 2015 18:10:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,334,1444719600"; d="scan'208";a="692213262"
Received: from echoo1-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.170.181])
	by orsmga003.jf.intel.com with ESMTP; 22 Nov 2015 18:10:22 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 23 Nov 2015 15:09:19 +1300
Message-Id: <cover.1448244474.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/18] devtool / recipetool fixes
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
X-List-Received-Date: Mon, 23 Nov 2015 02:10:24 -0000

Fix some issues I found when trying to use devtool upgrade on a git
recipe; improve extraction of patch header from original commit in
devtool; recipetool setvar; and other fixes and cleanups I have been
working on for a while.

All devtool/recipetool tests pass with these patches (plus the two
bitbake bb.utils patches I sent the other day, though this patchset
should not depend on those.)


The following changes since commit 6f98c39418c60b7c0b25b30983d2e5257158a6a4:

  gcc: Drop 4.8 (2015-11-16 14:59:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool10
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool10

Paul Eggleton (18):
  devtool: upgrade: fix removing other recipes from workspace on reset
  devtool: upgrade: fix updating PV and SRCREV
  devtool: upgrade: remove erroneous error when not renaming recipe
  devtool: upgrade: fetch remote repository before checking out new revision
  devtool: upgrade: provide a means to update the source branch
  lib/oe/patch: improve extraction of patch header
  devtool: disable creating workspace for extract and search subcommands
  devtool: package: use DEPLOY_DIR_<pkgtype> to get deploy directory
  devtool: drop unused plugin_init() functions
  devtool: search: print SUMMARY value
  devtool: ensure we change back to the original dir on error
  lib/oe/recipeutils: check in validate_pn() for names instead of filenames
  devtool: build: use bbappend to set PARALLEL_MAKE
  devtool: build: enable showing default task in help
  devtool: clarify help text
  lib/oe/recipeutils: refactor patch_recipe_file() to use edit_metadata()
  recipetool: add setvar subcommand
  recipetool: make plugin registration function name consistent with devtool

 meta/lib/oe/patch.py                |  58 +++++++++----
 meta/lib/oe/recipeutils.py          | 162 +++++++++++++++++++++---------------
 meta/lib/oeqa/selftest/devtool.py   |   8 +-
 scripts/devtool                     |   7 +-
 scripts/lib/devtool/__init__.py     |  26 +++---
 scripts/lib/devtool/build.py        |  54 ++++++------
 scripts/lib/devtool/package.py      |  24 +++---
 scripts/lib/devtool/sdk.py          |   4 -
 scripts/lib/devtool/search.py       |  79 ++++++++++--------
 scripts/lib/devtool/standard.py     |  32 ++++---
 scripts/lib/devtool/upgrade.py      |  98 ++++++++++++----------
 scripts/lib/recipetool/append.py    |   2 +-
 scripts/lib/recipetool/create.py    |   2 +-
 scripts/lib/recipetool/newappend.py |   7 +-
 scripts/lib/recipetool/setvar.py    |  75 +++++++++++++++++
 scripts/recipetool                  |  10 ++-
 16 files changed, 397 insertions(+), 251 deletions(-)
 create mode 100644 scripts/lib/recipetool/setvar.py

-- 
2.1.0


