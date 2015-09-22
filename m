Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id CB26673243
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Sep 2015 16:22:10 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga103.fm.intel.com with ESMTP; 22 Sep 2015 09:21:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,573,1437462000"; d="scan'208";a="810520199"
Received: from therrane-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.19.23])
	by fmsmga002.fm.intel.com with ESMTP; 22 Sep 2015 09:21:49 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Sep 2015 17:21:14 +0100
Message-Id: <cover.1442934838.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/27] Fixes for devtool and the extensible SDK
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
X-List-Received-Date: Tue, 22 Sep 2015 16:22:12 -0000

Here is a set of fixes and improvements for devtool, the extensible SDK,
and related code. Included are fixes for devtool add / recipetool create,
fixes for devtool build-image, a couple of new subcommands for searching
and running QEMU within the extensible SDK, a stress testing script for
running devtool extract / devtool modify over every recipe, plus some
fixes for the code that that script exposed.


The following changes since commit 72682d72b52355c3fed947167ca3c6064340ead1:

  autotools.bbclass: mkdir ${B} -> mkdir -p ${B} (2015-09-16 22:17:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-extsdk-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool-extsdk-fixes

Paul Eggleton (27):
  lib/oe/recipeutils: properly split unexpanded variable values
  classes/populate_sdk_ext: fix missing environment settings if running installer with sh
  classes/populate_sdk_ext: allow custom configuration for extensible SDK
  classes/populate_sdk_ext: drop work-config.inc
  toolchain-shar-extract.sh: show progress when extracting SDK
  classes/externalsrc: scale back warning to a plain note
  classes/externalsrc: fix setting of deps varflag as a string
  lib/oe/patch: fix for git am not cleaning up after itself
  scripts/contrib: add devtool stress tester
  devtool: check that source tree still exists
  devtool: add: ensure --color=never turns off recipetool colour output
  devtool / lib/oe/recipeutils: ensure we can parse without bbappends
  devtool: add: properly handle separate build directory
  recipetool: create: fix creating empty shell functions
  recipetool: create: fix handling of URIs containing #
  devtool: show proper error when extracting source for recipes with disabled unpack task
  devtool: fix extracting source for work-shared recipes
  devtool: better handling for recipes that don't unpack source
  devtool: add: set up fetched source as a git repository by default
  devtool: add: move important "recipe created" message to the end
  devtool: build-image: fix recipe/package terminology
  devtool: build-image: tell user where to find output files
  devtool: build-image: improve image recipe handling
  devtool: build-image: delete bbappend at end of build
  devtool / recipetool: add handling for binary-only packages
  devtool: add basic means of running runqemu within the extensible SDK
  devtool: add search command

 meta/classes/externalsrc.bbclass      |   5 +-
 meta/classes/populate_sdk_ext.bbclass |  19 +--
 meta/files/toolchain-shar-extract.sh  |   2 +-
 meta/lib/oe/patch.py                  |   7 +
 meta/lib/oe/recipeutils.py            |  63 ++++++++-
 meta/lib/oeqa/selftest/devtool.py     |  22 +++-
 scripts/contrib/devtool-stress.py     | 241 ++++++++++++++++++++++++++++++++++
 scripts/lib/devtool/__init__.py       |  51 +++++++
 scripts/lib/devtool/build-image.py    |  94 +++++++------
 scripts/lib/devtool/build.py          |   6 +-
 scripts/lib/devtool/deploy.py         |   7 +-
 scripts/lib/devtool/package.py        |   6 +-
 scripts/lib/devtool/runqemu.py        |  64 +++++++++
 scripts/lib/devtool/sdk.py            |   2 +-
 scripts/lib/devtool/search.py         |  80 +++++++++++
 scripts/lib/devtool/standard.py       |  78 ++++++-----
 scripts/lib/devtool/upgrade.py        |  20 +--
 scripts/lib/recipetool/create.py      |  42 +++++-
 18 files changed, 684 insertions(+), 125 deletions(-)
 create mode 100755 scripts/contrib/devtool-stress.py
 create mode 100644 scripts/lib/devtool/runqemu.py
 create mode 100644 scripts/lib/devtool/search.py

-- 
2.1.0


