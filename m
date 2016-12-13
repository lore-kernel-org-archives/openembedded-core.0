Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 8F8E171B5F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Dec 2016 07:09:54 +0000 (UTC)
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga102.fm.intel.com with ESMTP; 12 Dec 2016 23:09:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,340,1477983600"; d="scan'208";a="41885736"
Received: from mauric9x-mobl.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com.fritz.box) ([10.255.158.7])
	by fmsmga005.fm.intel.com with ESMTP; 12 Dec 2016 23:09:53 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 13 Dec 2016 20:09:32 +1300
Message-Id: <cover.1481612135.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
Subject: [PATCH 00/14] Tinfoil rework - OE-Core changes
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
X-List-Received-Date: Tue, 13 Dec 2016 07:09:54 -0000

Tinfoil is an API that allows you to write simple utilities that call into
BitBake code to read variables, parse recipes, etc. (as used by various
scripts in BitBake & OE, including bitbake-layers, devtool, etc.) This
patchset reworks tinfoil in order to address several limitations of the
current implementation, first and foremost that it doesn't currently work
in bitbake's memory resident mode. This rework is also known as "tinfoil2"
although the classes and modules have not changed name. This patchset
depends upon the corresponding patchset sent to the bitbake-devel list and
both sets should be applied together in order for things to remain working.

Note that whilst these patchsets make some significant improvements to how
the system behaves in memory resident mode, there are still a number of
issues that prevent memory resident mode from being reliable. See this
wiki page for a few more details:

  https://wiki.yoctoproject.org/wiki/index.php?title=Tinfoil2

I will be converting some of these into bugzilla entries after this
patchset and the corresponding one for bitbake get merged.



The following changes since commit d62f18c39bc0ed3b0f5ac8465b393c15f2143ecf:

  targetloader.py: drop test for ClassType (2016-12-12 15:16:39 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/tinfoil2-oecore
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/tinfoil2-oecore

Paul Eggleton (14):
  lib/oe/recipeutils: use cooker function instead of bb.providers
  oe-selftest: make tinfoil quiet when using to start QEMU
  oe-selftest: use tinfoil.parse_recipe()
  devtool / recipetool: use tinfoil parsing API
  classes/base: fix license file checksumming when source not under
    TMPDIR
  classes/patch: move in logic to commit for additional tasks
  classes/patch: move several functions to oe.patch
  recipetool: add OE lib path
  devtool: fix extraction of source to work in memres mode
  lib/oe/recipeutils: drop parse_recipe_simple()
  devtool: extract: disable basehash mismatch errors
  devtool: prevent BBHandledException from showing traceback
  oe-selftest: devtool: improve test_devtool_modify slightly
  oe-selftest: add basic tinfoil tests

 meta/classes/base.bbclass           |   5 +-
 meta/classes/patch.bbclass          | 168 +++++++++++++++---------------------
 meta/lib/oe/patch.py                | 107 +++++++++++++++++++++++
 meta/lib/oe/recipeutils.py          |  49 ++---------
 meta/lib/oeqa/selftest/devtool.py   |  15 +++-
 meta/lib/oeqa/selftest/tinfoil.py   | 146 +++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/commands.py     |   6 +-
 scripts/devtool                     |  11 ++-
 scripts/lib/devtool/__init__.py     |  26 ++----
 scripts/lib/devtool/deploy.py       |   2 +-
 scripts/lib/devtool/standard.py     | 160 ++++++++++++----------------------
 scripts/lib/devtool/upgrade.py      |   4 +-
 scripts/lib/recipetool/append.py    |  21 +----
 scripts/lib/recipetool/newappend.py |  14 +--
 scripts/lib/recipetool/setvar.py    |   2 +-
 scripts/recipetool                  |   1 +
 16 files changed, 429 insertions(+), 308 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/tinfoil.py

-- 
2.5.5


