Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 5544878493
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:56:04 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga104.jf.intel.com with ESMTP; 08 Nov 2017 17:56:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,367,1505804400"; d="scan'208";a="171400937"
Received: from skanwarx-mobl1.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.73.22])
	by orsmga005.jf.intel.com with ESMTP; 08 Nov 2017 17:56:02 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Nov 2017 14:55:01 +1300
Message-Id: <cover.1510192329.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 00/24] devtool / recipetool improvements
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
X-List-Received-Date: Thu, 09 Nov 2017 01:56:04 -0000

Fix a number of bugs in devtool/recipetool and make the following
improvements:
 * Conditional patch handling (e.g. musl-specific patches)
 * Add dry-run option for devtool finish
 * Automatically adjust S on upgrade if needed
 * Make devtool upgrade output more useful
 * Make devtool finish check for a clean source repository
 * Make devtool edit-recipe/find-recipe always work


The following changes since commit 3717c76eb24217c14a22f72fdd8732923729dee8:

  gcc: fix miscompilation on mips64 (2017-11-08 22:23:45 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool31-oe
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool31-oe

Paul Eggleton (24):
  recipetool: pass absolute source tree path to plugins
  recipetool: ignore incidental kernel module source
  lib/oe/recipeutils: fix find_layerdir() to return absolute paths
  lib/oe/recipeutils: fix line splitting in patch_recipe_*
  devtool: upgrade: fix accidentally swapped parameters
  devtool: upgrade: fix not committing deleted files with older git versions
  devtool: upgrade: improve performance and show progress when adding files
  devtool: fix handling of oe-local-files when source is in a subdirectory
  devtool: show some warnings for upgrade versions
  devtool: make find-recipe and edit-recipe always work with any recipe
  devtool: reset: print source tree base path
  devtool: finish: ensure repository is clean before proceeding
  devtool: finish: fix "layer not in bblayers.conf" warning when path specified
  devtool: upgrade: handle recipes that use named SRC_URI checksums
  recipetool: create: drop debug print
  devtool: stop always moving workspace to end of BBLAYERS
  recipetool: create: show a warning for github archive URLs
  devtool: upgrade: show messages before source extraction steps
  devtool: upgrade: automatically handle changes to source subdirectory
  devtool: upgrade: reformat --no-patch warning message
  devtool: show a better error message if meta-files aren't found
  devtool: finish: improve reporting for removed files
  devtool: finish: add dry-run option
  devtool: implement conditional patch handling

 meta/classes/devtool-source.bbclass   |  56 ++++
 meta/lib/oe/recipeutils.py            |  68 ++++-
 scripts/devtool                       |  21 +-
 scripts/lib/devtool/__init__.py       |  30 ++
 scripts/lib/devtool/standard.py       | 503 ++++++++++++++++++++++++++--------
 scripts/lib/devtool/upgrade.py        | 112 ++++++--
 scripts/lib/devtool/utilcmds.py       |  26 +-
 scripts/lib/recipetool/create.py      |  13 +-
 scripts/lib/recipetool/create_kmod.py |   2 +-
 scripts/lib/recipetool/create_npm.py  |   1 -
 10 files changed, 658 insertions(+), 174 deletions(-)

-- 
2.9.5


