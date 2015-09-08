Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 5879C65C8A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Sep 2015 10:39:32 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by orsmga101.jf.intel.com with ESMTP; 08 Sep 2015 03:39:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,489,1437462000"; d="scan'208";a="800537200"
Received: from jdkarpin-mobl4.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.5.153])
	by fmsmga002.fm.intel.com with ESMTP; 08 Sep 2015 03:39:31 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 Sep 2015 11:39:06 +0100
Message-Id: <cover.1441706523.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 0/9] devtool improvements
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
X-List-Received-Date: Tue, 08 Sep 2015 10:39:34 -0000

Adds "upgrade" and "package" subcommands to devtool, provides a way to
disable parallel make, improves the default behaviour of update-recipe
with git recipes, and fixes running devtool from a different directory.

This rolls up and fixes some previously posted patches; changes from
the previously posted versions:

* devtool: add upgrade feature:
  - Handle upgrading git recipes i.e. where version may not change, we
    need to be able to specify the SRCREV, md5sum/sha256sum aren't used
    and most importantly we don't want to munge the existing repository
  - Fix rebasing logic - we want to be rebasing the old patched branch
    onto the new branch, not the other way around
  - Fix branching/tagging
  - Use branch name for the new version branch not the old one
  - Ensure we delete/preserve copied in recipe files when resetting
  - Use common fetch_uri function instead of duplicating
  - Fix handling recipes that use BBCLASSEXTEND
  - Tweak some messages and command line help
  - Squash in test commits (we probably need additional tests - to be
    added later)
* devtool: Allow disabling make parallelism on build command:
  - Add a short option (-s for "single")
  - Use traditional spacing in created postfile
  - Delete postfile after building, there's not much point keeping it
  - Tweak log output
* devtool: add package plugin that lets you create package via devtool:
  - Fix config file reading
  - Make this available only within the extensible SDK (since it's not
    particularly useful outside of it)
* devtool: update-recipe: better 'auto' mode
  - Fix oe-selftest tests for this behaviour change


The following changes since commit 8402958cd2cb87b8283c8ee4e2d08e1a6717d67a:

  pseudo_1.7.3.bb: New version of pseudo (2015-09-06 15:24:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool7
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/devtool7

Brendan Le Foll (1):
  devtool: add package plugin that lets you create package via devtool

Leonardo Sandoval (3):
  devtool: add upgrade feature
  devtool: Create a single file for the build devtool feature
  devtool: Allow disabling make parallelism on build command

Markus Lehtonen (1):
  devtool: update-recipe: better 'auto' mode

Paul Eggleton (4):
  scriptutils: split out simple fetching function from recipetool
  devtool: improve modified file preservation to handle directory
    structures
  devtool: update-recipe: add a warning when recipe is inside the
    workspace
  devtool: fix running from a different directory

 .../recipes-test/devtool/devtool-upgrade_0.1.bb    |  25 ++
 ...-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch |  27 ++
 .../devtool/files/devtool-upgrade-0.1.tar.gz       | Bin 0 -> 411 bytes
 .../devtool/files/devtool-upgrade-0.2.tar.gz       | Bin 0 -> 411 bytes
 meta/lib/oeqa/selftest/devtool.py                  |  68 +++-
 scripts/devtool                                    |   3 +
 scripts/lib/devtool/build.py                       |  77 +++++
 scripts/lib/devtool/package.py                     |  61 ++++
 scripts/lib/devtool/standard.py                    |  94 +++---
 scripts/lib/devtool/upgrade.py                     | 354 +++++++++++++++++++++
 scripts/lib/recipetool/create.py                   |  30 +-
 scripts/lib/scriptutils.py                         |  27 ++
 12 files changed, 692 insertions(+), 74 deletions(-)
 create mode 100644 meta-selftest/recipes-test/devtool/devtool-upgrade_0.1.bb
 create mode 100644 meta-selftest/recipes-test/devtool/files/0001-helloword.c-exit-with-EXIT_SUCCESS-instead-of-a-magi.patch
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.1.tar.gz
 create mode 100644 meta-selftest/recipes-test/devtool/files/devtool-upgrade-0.2.tar.gz
 create mode 100644 scripts/lib/devtool/build.py
 create mode 100644 scripts/lib/devtool/package.py
 create mode 100644 scripts/lib/devtool/upgrade.py

-- 
2.1.0


