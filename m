Return-Path: <anibal.limon@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 525006069D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Dec 2016 16:18:50 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga102.jf.intel.com with ESMTP; 08 Dec 2016 08:18:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,320,1477983600"; d="scan'208";a="40496427"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 08 Dec 2016 08:18:52 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2016 10:20:28 -0600
Message-Id: <cover.1481213961.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Subject: [PATCHv3 00/30] OEQA Framework Refactor & Improvements
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
X-List-Received-Date: Thu, 08 Dec 2016 16:18:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patchset is related to OEQA Framework for details read the RFC send to the
Openembedded architecture ML.

http://lists.openembedded.org/pipermail/openembedded-architecture/2016-December/000351.html

Changes in v2: Fixes sdk extensible test case sdk_update.
Changes in v3: Squashed two commits related to d -> td and remove_safe function.

The following changes since commit 931ce04b0884ebe73158251d0d9a461214dfe1aa:

  bitbake: toaster: Reference pip3 not pip (2016-12-08 15:52:08 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oeqa_sdk_migration
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oeqa_sdk_migration

Aníbal Limón (26):
  oeqa/core: Add base OEQA framework
  oeqa/core: Add loader, context and decorator modules
  oeqa/core/decorator: Add support for OETestDepends
  oeqa/core/decorator: Add support for OETestDataDepends and
    skipIfDataVar
  scripts/oe-test: Add new oe-test script
  oeqa/core/context: Add support of OETestContextExecutor
  oeqa/core/cases: Add example test cases
  oeqa/core: Add README
  oe/data: Add export2json function
  classes/rootfs-postcommands: Add write_image_test_data
  classes/populate_sdk_base: Add write_sdk_test_data to postprocess
  oeqa: Move common files to oeqa/files instead of runtime only
  oeqa/sdk: Move test cases inside cases directory
  oeqa/{runtime,sdk}/files: Move testsdkmakefile from runtime to sdk
    module
  oeqa/sdk: Add case and context modules for the SDK component
  classes/testsdk: Migrates testsdk.bbclass to use new OESDKTestContext
  oeqa/utils: Move targetbuild to buildproject module
  oeqa/utils: {Target,SDK,}BuildProject remove dependency of bb
  oeqa/sdk/cases: Migrate tests to the new OEQA framework
  classes/testsdk: Remove the need of TEST_LOG_DIR variable
  oeqa/sdkext: Move test cases inside cases directory
  oeqa/sdkext: Adds case and context modules.
  classes/testsdk: Migrate to use the new OESDKExtTestContext
  oeqa/sdkext/cases: Migrate test case to new OEQA framework
  oeqa/runtime: Fix TargetBuildProject instances
  oeqa: Fix files handling on runtime tests.

Mariano Lopez (4):
  oeqa/core: Add utils module for OEQA framework
  oeqa/core/decorator: Add support for OETestID and OETestTag
  oeqa/core/decorator: Add support for OETimeout decorator
  oeqa/core: Add tests for the OEQA framework

 meta/classes/populate_sdk_base.bbclass             |   9 +-
 meta/classes/rootfs-postcommands.bbclass           |  18 ++
 meta/classes/testexport.bbclass                    |   5 +
 meta/classes/testimage.bbclass                     |   4 +
 meta/classes/testsdk.bbclass                       | 162 ++++++++------
 meta/lib/oe/data.py                                |  28 +++
 meta/lib/oeqa/core/README                          |  38 ++++
 meta/lib/oeqa/core/__init__.py                     |   0
 meta/lib/oeqa/core/case.py                         |  46 ++++
 meta/lib/oeqa/core/cases/__init__.py               |   0
 meta/lib/oeqa/core/cases/example/data.json         |   1 +
 meta/lib/oeqa/core/cases/example/test_basic.py     |  20 ++
 meta/lib/oeqa/core/context.py                      | 225 ++++++++++++++++++++
 meta/lib/oeqa/core/decorator/__init__.py           |  71 +++++++
 meta/lib/oeqa/core/decorator/data.py               |  36 ++++
 meta/lib/oeqa/core/decorator/depends.py            |  94 +++++++++
 meta/lib/oeqa/core/decorator/oeid.py               |  23 ++
 meta/lib/oeqa/core/decorator/oetag.py              |  24 +++
 meta/lib/oeqa/core/decorator/oetimeout.py          |  25 +++
 meta/lib/oeqa/core/exception.py                    |  14 ++
 meta/lib/oeqa/core/loader.py                       | 235 +++++++++++++++++++++
 meta/lib/oeqa/core/runner.py                       |  76 +++++++
 meta/lib/oeqa/core/tests/__init__.py               |   0
 meta/lib/oeqa/core/tests/cases/data.py             |  20 ++
 meta/lib/oeqa/core/tests/cases/depends.py          |  38 ++++
 .../oeqa/core/tests/cases/loader/invalid/oeid.py   |  15 ++
 .../oeqa/core/tests/cases/loader/valid/another.py  |   9 +
 meta/lib/oeqa/core/tests/cases/oeid.py             |  18 ++
 meta/lib/oeqa/core/tests/cases/oetag.py            |  18 ++
 meta/lib/oeqa/core/tests/cases/timeout.py          |  18 ++
 meta/lib/oeqa/core/tests/common.py                 |  35 +++
 meta/lib/oeqa/core/tests/test_data.py              |  51 +++++
 meta/lib/oeqa/core/tests/test_decorators.py        | 135 ++++++++++++
 meta/lib/oeqa/core/tests/test_loader.py            |  86 ++++++++
 meta/lib/oeqa/core/tests/test_runner.py            |  38 ++++
 meta/lib/oeqa/core/utils/__init__.py               |   0
 meta/lib/oeqa/core/utils/misc.py                   |  37 ++++
 meta/lib/oeqa/core/utils/path.py                   |  19 ++
 meta/lib/oeqa/core/utils/test.py                   |  71 +++++++
 meta/lib/oeqa/{runtime => }/files/test.c           |   0
 meta/lib/oeqa/{runtime => }/files/test.cpp         |   0
 meta/lib/oeqa/{runtime => }/files/test.pl          |   0
 meta/lib/oeqa/{runtime => }/files/test.py          |   0
 meta/lib/oeqa/oetest.py                            |  92 +-------
 meta/lib/oeqa/runtime/buildcvs.py                  |   9 +-
 meta/lib/oeqa/runtime/buildgalculator.py           |   8 +-
 meta/lib/oeqa/runtime/buildiptables.py             |   8 +-
 meta/lib/oeqa/runtime/gcc.py                       |   4 +-
 meta/lib/oeqa/runtime/perl.py                      |   2 +-
 meta/lib/oeqa/runtime/python.py                    |   2 +-
 meta/lib/oeqa/runtime/utils/__init__.py            |   0
 meta/lib/oeqa/runtime/utils/targetbuildproject.py  |  33 +++
 meta/lib/oeqa/sdk/__init__.py                      |   3 -
 meta/lib/oeqa/sdk/case.py                          |  12 ++
 meta/lib/oeqa/sdk/{ => cases}/buildcvs.py          |  15 +-
 meta/lib/oeqa/sdk/{ => cases}/buildgalculator.py   |  28 ++-
 meta/lib/oeqa/sdk/{ => cases}/buildiptables.py     |  16 +-
 meta/lib/oeqa/sdk/cases/gcc.py                     |  43 ++++
 meta/lib/oeqa/sdk/cases/perl.py                    |  27 +++
 meta/lib/oeqa/sdk/{ => cases}/python.py            |  25 ++-
 meta/lib/oeqa/sdk/context.py                       | 133 ++++++++++++
 .../oeqa/{runtime => sdk}/files/testsdkmakefile    |   0
 meta/lib/oeqa/sdk/gcc.py                           |  36 ----
 meta/lib/oeqa/sdk/perl.py                          |  28 ---
 meta/lib/oeqa/sdk/utils/__init__.py                |   0
 meta/lib/oeqa/sdk/utils/sdkbuildproject.py         |  45 ++++
 meta/lib/oeqa/sdkext/__init__.py                   |   3 -
 meta/lib/oeqa/sdkext/case.py                       |  21 ++
 meta/lib/oeqa/sdkext/{ => cases}/devtool.py        |  49 +++--
 meta/lib/oeqa/sdkext/{ => cases}/sdk_update.py     |  17 +-
 meta/lib/oeqa/sdkext/context.py                    |  21 ++
 meta/lib/oeqa/utils/buildproject.py                |  52 +++++
 meta/lib/oeqa/utils/targetbuild.py                 | 135 ------------
 scripts/oe-test                                    |  98 +++++++++
 74 files changed, 2284 insertions(+), 443 deletions(-)
 create mode 100644 meta/lib/oeqa/core/README
 create mode 100644 meta/lib/oeqa/core/__init__.py
 create mode 100644 meta/lib/oeqa/core/case.py
 create mode 100644 meta/lib/oeqa/core/cases/__init__.py
 create mode 100644 meta/lib/oeqa/core/cases/example/data.json
 create mode 100644 meta/lib/oeqa/core/cases/example/test_basic.py
 create mode 100644 meta/lib/oeqa/core/context.py
 create mode 100644 meta/lib/oeqa/core/decorator/__init__.py
 create mode 100644 meta/lib/oeqa/core/decorator/data.py
 create mode 100644 meta/lib/oeqa/core/decorator/depends.py
 create mode 100644 meta/lib/oeqa/core/decorator/oeid.py
 create mode 100644 meta/lib/oeqa/core/decorator/oetag.py
 create mode 100644 meta/lib/oeqa/core/decorator/oetimeout.py
 create mode 100644 meta/lib/oeqa/core/exception.py
 create mode 100644 meta/lib/oeqa/core/loader.py
 create mode 100644 meta/lib/oeqa/core/runner.py
 create mode 100644 meta/lib/oeqa/core/tests/__init__.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/data.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/depends.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/invalid/oeid.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/valid/another.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/oeid.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/oetag.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/timeout.py
 create mode 100644 meta/lib/oeqa/core/tests/common.py
 create mode 100755 meta/lib/oeqa/core/tests/test_data.py
 create mode 100755 meta/lib/oeqa/core/tests/test_decorators.py
 create mode 100755 meta/lib/oeqa/core/tests/test_loader.py
 create mode 100755 meta/lib/oeqa/core/tests/test_runner.py
 create mode 100644 meta/lib/oeqa/core/utils/__init__.py
 create mode 100644 meta/lib/oeqa/core/utils/misc.py
 create mode 100644 meta/lib/oeqa/core/utils/path.py
 create mode 100644 meta/lib/oeqa/core/utils/test.py
 rename meta/lib/oeqa/{runtime => }/files/test.c (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.cpp (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.pl (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.py (100%)
 create mode 100644 meta/lib/oeqa/runtime/utils/__init__.py
 create mode 100644 meta/lib/oeqa/runtime/utils/targetbuildproject.py
 create mode 100644 meta/lib/oeqa/sdk/case.py
 rename meta/lib/oeqa/sdk/{ => cases}/buildcvs.py (59%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildgalculator.py (45%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildiptables.py (58%)
 create mode 100644 meta/lib/oeqa/sdk/cases/gcc.py
 create mode 100644 meta/lib/oeqa/sdk/cases/perl.py
 rename meta/lib/oeqa/sdk/{ => cases}/python.py (46%)
 create mode 100644 meta/lib/oeqa/sdk/context.py
 rename meta/lib/oeqa/{runtime => sdk}/files/testsdkmakefile (100%)
 delete mode 100644 meta/lib/oeqa/sdk/gcc.py
 delete mode 100644 meta/lib/oeqa/sdk/perl.py
 create mode 100644 meta/lib/oeqa/sdk/utils/__init__.py
 create mode 100644 meta/lib/oeqa/sdk/utils/sdkbuildproject.py
 create mode 100644 meta/lib/oeqa/sdkext/case.py
 rename meta/lib/oeqa/sdkext/{ => cases}/devtool.py (73%)
 rename meta/lib/oeqa/sdkext/{ => cases}/sdk_update.py (63%)
 create mode 100644 meta/lib/oeqa/sdkext/context.py
 create mode 100644 meta/lib/oeqa/utils/buildproject.py
 delete mode 100644 meta/lib/oeqa/utils/targetbuild.py
 create mode 100755 scripts/oe-test

-- 
2.1.4


