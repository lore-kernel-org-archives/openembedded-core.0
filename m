Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id A672A70018
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Jun 2016 10:37:41 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 24 Jun 2016 03:37:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,520,1459839600"; d="scan'208";a="724410302"
Received: from skenned1-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.9.142])
	by FMSMGA003.fm.intel.com with ESMTP; 24 Jun 2016 03:37:41 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 24 Jun 2016 13:37:13 +0300
Message-Id: <1466764661-24544-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 00/28] Implement build performance test script in Python
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
X-List-Received-Date: Fri, 24 Jun 2016 10:37:43 -0000

This patchset re-implements the existing scripts/contrib/build-perf-test.sh
script in Python. The new script is meant as a nearly drop-in replacement for
the old shell script. The aim is to simplify the build performance test script
and make it easier to maintain and extend. Further patchsets will enhance it
and refine the test results output format, for example.

Major difference to the old shell script is that the new script has to be run
in an initialized bitbake build environment. Thus, the caller is now
responsible for setting up the build environment, including config which the
old shell script somewhat affected.  All the unused (in practice) command line
options are dropped. Test result output format remains the same, though.

The last patch of this patchset introduces a wrapper shell script that takes
care of setting up the build environment, running the script and archiving the
results. It replicates the default build configuration used by the old shell
script as well as the setup used to generate the Yocto build performance test
results
(https://wiki.yoctoproject.org/charts/perf_milestone/performance_test.html).

[YOCTO #9623]

The following changes since commit afb40bf179a58b7f3a8e365d87510ba2c54437d0:

  puzzles: fix Samba conflict, clean up recipe (2016-06-23 14:23:42 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib marquiz/build-perf/python-rewrite
  http://git.openembedded.org/openembedded-core-contrib/log/?h=marquiz/build-perf/python-rewrite


Markus Lehtonen (28):
  oeqa.utils.commands: Introduce get_bb_vars()
  oeqa.utils.commands: use get_bb_vars() in get_bb_var()
  oeqa.utils.commands: runCmd: gracefully handle empty output
  oeqa.utils.commands: runCmd: return stderr output, too
  scripts: introduce oe-build-perf-test
  oe-build-perf-test: add pre-run sanity check
  oe-build-perf-test: introduce oeqa.buildperf module
  oeqa.buildperf: functionality to drop kernel caches
  oeqa.buildperf: add BuildPerfTest class
  oeqa.buildperf: method for measuring system resource usage
  oeqa.buildperf: add method to log shell commands
  oeqa.buildperf: add method for measuring file disk usage
  oeqa.buildperf: add method for saving buildstats
  oeqa.buildperf: implement BuildPerfTestRunner class
  oeqa.buildperf: add test Test1P1
  oeqa.buildperf: add test Test1P2
  oeqa.buildperf: add test Test1P3
  oeqa.buildperf: add test Test2
  oeqa.buildperf: add test Test3
  oeqa.buildperf: add test Test4
  oeqa.buildperf: archive build/conf into test results
  oe-build-perf-test: enable logging into file
  oeqa.utils: add git module
  oeqa.buildperf: add git revision and branch to result data
  oe-build-perf-test: implement --globalres-file option
  oe-build-perf-test: enable locking
  oe-build-perf-test: add --out-dir command line argument
  scripts/contrib: introduce build-perf-test-wrapper.sh

 meta/lib/oeqa/buildperf/__init__.py        |  15 ++
 meta/lib/oeqa/buildperf/base.py            | 330 +++++++++++++++++++++++++++++
 meta/lib/oeqa/buildperf/basic_tests.py     | 133 ++++++++++++
 meta/lib/oeqa/utils/commands.py            |  53 +++--
 meta/lib/oeqa/utils/git.py                 |  38 ++++
 scripts/contrib/build-perf-test-wrapper.sh | 102 +++++++++
 scripts/oe-build-perf-test                 | 133 ++++++++++++
 7 files changed, 790 insertions(+), 14 deletions(-)
 create mode 100644 meta/lib/oeqa/buildperf/__init__.py
 create mode 100644 meta/lib/oeqa/buildperf/base.py
 create mode 100644 meta/lib/oeqa/buildperf/basic_tests.py
 create mode 100644 meta/lib/oeqa/utils/git.py
 create mode 100755 scripts/contrib/build-perf-test-wrapper.sh
 create mode 100755 scripts/oe-build-perf-test

-- 
2.6.6


