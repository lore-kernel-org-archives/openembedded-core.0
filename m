Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id ED6CE73D1C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Jul 2015 13:05:10 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 27 Jul 2015 06:05:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,554,1432623600"; d="scan'208";a="530926280"
Received: from rmoore5-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.8.162])
	by FMSMGA003.fm.intel.com with ESMTP; 27 Jul 2015 06:05:06 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 27 Jul 2015 14:03:55 +0100
Message-Id: <cover.1438001581.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.1.0
Subject: [PATCH 00/11] Properly fix oe-selftest QEMU usage + related fixes
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
X-List-Received-Date: Mon, 27 Jul 2015 13:05:13 -0000

The tests in oeqa/selftest/imagefeatures have had a long list of issues
that we've worked around; this patchset implements the ability to run
QEMU from oe-selftest tests properly and attempts to fix the remaining
known issues with the tests. At the same time we can make the devtool
test that uses QEMU use the new runqemu() logic, so do that as well.

When we did do the proper runqemu() implementation however, I uncovered
a number of other problems to do with error handling, process
termination and logging. This patchset should address those as well.

Thanks to Richard for the initial set of fixes which I built upon here.


The following changes since commit 03d01393d14b7b20dcb40ff89b1628883fd3b545:

  toaster.bbclass: Fix ValueError (2015-07-27 12:26:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/oe-selftest-qemu-fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/oe-selftest-qemu-fixes

Paul Eggleton (9):
  oe-selftest: add scripts/lib and bitbake/lib to path
  oeqa/targetcontrol: create test directory before copying rootfs image
  oeqa/utils/qemurunner: fix logging
  oeqa/utils/qemurunner: avoid blocking on stty when running under
    oe-selftest
  oeqa/utils/qemurunner: fix error handling if runqemu exits with an
    error
  oeqa/targetcontrol: write QemuRunner log output to a file
  oeqa/selftest/imagefeatures: fix RPM4 test
  oeqa/selftest/imagefeatures: remove gummiboot tests
  oeqa/selftest/devtool: use new runqemu function

Richard Purdie (2):
  oeqa/selftest/imagefeatures: Use QemuTarget code
  oeqa/selftest/imagefeatures: fix SSH without password tests

 meta/lib/oeqa/selftest/devtool.py       |  72 +++++-----
 meta/lib/oeqa/selftest/imagefeatures.py | 247 +++++++++-----------------------
 meta/lib/oeqa/targetcontrol.py          |  12 ++
 meta/lib/oeqa/utils/commands.py         |  49 +++++++
 meta/lib/oeqa/utils/qemurunner.py       |  70 +++++----
 scripts/oe-selftest                     |   5 +-
 6 files changed, 207 insertions(+), 248 deletions(-)

-- 
2.1.0


