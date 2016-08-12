Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E4CCD77240
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Aug 2016 09:11:30 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga103.jf.intel.com with ESMTP; 12 Aug 2016 02:11:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,509,1464678000"; d="scan'208";a="1024239476"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga001.fm.intel.com with ESMTP; 12 Aug 2016 02:11:31 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 12 Aug 2016 12:11:17 +0300
Message-Id: <1470993086-23718-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/9] oe-build-perf-test: use Python unittest framework
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
X-List-Received-Date: Fri, 12 Aug 2016 09:11:31 -0000

This patchset converts the lately added oe-build-perf-test (and oeqa.buildperf)
to utilize the Python's unittest framework. Unittest (framework) provides a lot
of functionality and it should make future development of build perf tests
easier. As of now, the most visible change is different console output from the
oe-build-perf-test script.

The first patch renames the .py file containing the actual tests. It is
cosmetic but would make oeqa.buildperf module more consistent by requiring all
(possible) future test files to start with a 'test' prefix, too.

The next five patches actually convert the buildperf tests to use Python
unittest framework. This conversion is one bigger change that is split into
multiple smaller patches in order to make it more comprehensible. The patches
are dependent on each other and all of them should be applied as a unit.

The seventh patch aligns test status better with how they are expected to be
used (test failure vs. test error).

The last two patches improve the console output of the script.


The following changes since commit 5ed0d5a7d9b051a551a6de644bf6a42b87c12471:

  dbus: backport stdint.h build fix (2016-08-10 10:45:33 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/buildperf/unittest
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/buildperf/unittest


Markus Lehtonen (9):
  oeqa.buildperf: rename module containing basic tests
  oeqa.buildperf: derive BuildPerfTestCase class from unitest.TestCase
  oeqa.buildperf: add BuildPerfTestLoader class
  oeqa.buildperf: add BuildPerfTestResult class
  oeqa.buildperf: convert test cases to unittest
  oe-build-perf-test: use new unittest based framework
  oeqa.buildperf: introduce runCmd2()
  oe-build-perf-test: write logger output into file only
  oeqa.buildperf: be more verbose about failed commands

 meta/lib/oeqa/buildperf/__init__.py    |  10 +-
 meta/lib/oeqa/buildperf/base.py        | 245 +++++++++++++++++----------------
 meta/lib/oeqa/buildperf/basic_tests.py | 133 ------------------
 meta/lib/oeqa/buildperf/test_basic.py  | 121 ++++++++++++++++
 scripts/oe-build-perf-test             |  54 +++++---
 5 files changed, 294 insertions(+), 269 deletions(-)
 delete mode 100644 meta/lib/oeqa/buildperf/basic_tests.py
 create mode 100644 meta/lib/oeqa/buildperf/test_basic.py

-- 
2.6.6


