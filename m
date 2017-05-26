Return-Path: <anibal.limon@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 044CD782A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 20:38:09 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	26 May 2017 13:38:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,399,1491289200"; d="scan'208";a="266887527"
Received: from tsriniv-mobl.amr.corp.intel.com (HELO
	alimonb-mobl1.amr.corp.intel.com) ([10.254.103.51])
	by fmsmga004.fm.intel.com with ESMTP; 26 May 2017 13:38:03 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 May 2017 15:37:26 -0500
Message-Id: <cover.1495830706.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 00/36] OEQA threading support and selftest migration
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
X-List-Received-Date: Fri, 26 May 2017 20:38:10 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series is the integration of tree main changes into the OEQA module,

* Implement threading support into OEQA core module
* Enables OEQA threaded mode into {,e}SDK test component
* Migrate current oe-selftest to use the same framework

The following changes since commit 5eed6c644f715783edb0d05926373e719442dd6a:

  libpcap: add native package (2017-05-25 23:59:32 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oeqa_integration
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oeqa_integration

Aníbal Limón (25):
  testsdk.bbclass: Remove unused import of OEStreamLogger
  oeqa/sdk/context.py: Import argparse_oe at OESDKTestContext.run method
  oeqa/sdk/context.py: Add return to OESDKTestContext.run() method
  oeqa/core: Don't expose OEStreamLogger in OETestContext
  oeqa/core/runner: OETestResult remove unneeded override of startTest
  oeqa/core: Move OETestContext.log{Summary, Details} into OETestResult
  oeqa/core/threaded: Add new module with OETestLoaderThreaded
  oeqa/core/threaded: Add OEStreamLoggerThreaded class
  oeqa/core/runner: OETestResult add internal _tc_map_results
  oeqa/core/threaded: Add OETestResultThreaded{,Internal} classes
  oeqa/core/threaded: Add support of OETestRunnerThreaded
  oeqa/core/threaded: Add OETestContextThreaded class
  oeqa/core/decorator/depends: Add support for threading mode
  oeqa/core/decorator/oetimeout: Add support for OEQA threaded mode
  oeqa/core/tests: Add tests of OEQA Threaded mode
  oeqa/sdkext/cases: Move sdk_update test into devtool module
  oeqa/sdk: Enable usage of OEQA thread mode
  oeqa/core: Add list tests support in context and runner
  oeqa/core: Add support for run tests by module, class and name
  classes/test{export,images}: Change modules to list
  oeqa/runtime/case: Don't use OEQA framework internal methods
  scripts/oe-test: Move load_test_components to oeqa.utils
  oeqa/selftest: Move base class to case module
  oeqa/selftest/case: Don't figure out the testlayer inside
  selftest: Migrate systemd_boot test case to the new framework

Leonardo Sandoval (11):
  oeqa/core/README: Improve documentation
  oeqa/core/case: fix typo on comment about exception name
  oeqa/core/context: Raise exception when a manifest is specified but
    missing
  oeqa/core/context: Use a default iterable modules object
  oeqa/core/context: Omit docstring output on XMLResult
  oeqa/core/context: Include a _pre_run method
  oeqa/selftest/case: Migrate case class to the new OEQA framework
  scripts/oe-selftest: Move {add,remove}_include files to case
  oeqa/selftest/case.py: Remove machine selection logic
  scripts/oe-selftest: Migrate to new framework into
    oeqa.selftest.context
  oeqa/selftest/cases: Migrate test cases into the new oe-qa framework

 meta-yocto-bsp/lib/oeqa/selftest/__init__.py       |   0
 .../lib/oeqa/selftest/{ => cases}/systemd_boot.py  |  14 +-
 meta/classes/testexport.bbclass                    |   2 +-
 meta/classes/testimage.bbclass                     |   6 +-
 meta/classes/testsdk.bbclass                       |  13 +-
 meta/lib/oeqa/core/README                          |  81 ++-
 meta/lib/oeqa/core/case.py                         |   2 +-
 meta/lib/oeqa/core/context.py                      | 127 +---
 meta/lib/oeqa/core/decorator/depends.py            |   8 +-
 meta/lib/oeqa/core/decorator/oetimeout.py          |  40 +-
 meta/lib/oeqa/core/exception.py                    |   6 +
 meta/lib/oeqa/core/loader.py                       |  66 +-
 meta/lib/oeqa/core/runner.py                       | 192 ++++-
 .../core/tests/cases/loader/threaded/threaded.py   |  12 +
 .../tests/cases/loader/threaded/threaded_alone.py  |   8 +
 .../cases/loader/threaded/threaded_depends.py      |  10 +
 .../tests/cases/loader/threaded/threaded_module.py |  12 +
 meta/lib/oeqa/core/tests/common.py                 |  10 +
 meta/lib/oeqa/core/tests/test_decorators.py        |  12 +
 meta/lib/oeqa/core/tests/test_loader.py            |  30 +-
 meta/lib/oeqa/core/threaded.py                     | 274 +++++++
 meta/lib/oeqa/runtime/case.py                      |   8 +-
 meta/lib/oeqa/sdk/context.py                       |  11 +-
 meta/lib/oeqa/sdkext/cases/devtool.py              |  32 +
 meta/lib/oeqa/sdkext/cases/sdk_update.py           |  39 -
 meta/lib/oeqa/selftest/__init__.py                 |   2 -
 meta/lib/oeqa/selftest/{base.py => case.py}        | 220 +++---
 .../selftest/{ => cases}/_sstatetests_noauto.py    |   7 +-
 meta/lib/oeqa/selftest/{ => cases}/archiver.py     |  14 +-
 meta/lib/oeqa/selftest/{ => cases}/bblayers.py     |  24 +-
 meta/lib/oeqa/selftest/{ => cases}/bbtests.py      |  57 +-
 meta/lib/oeqa/selftest/{ => cases}/buildhistory.py |   5 +-
 meta/lib/oeqa/selftest/{ => cases}/buildoptions.py |  34 +-
 .../oeqa/selftest/{ => cases}/containerimage.py    |   4 +-
 meta/lib/oeqa/selftest/{ => cases}/devtool.py      |  68 +-
 meta/lib/oeqa/selftest/{ => cases}/eSDK.py         |  18 +-
 .../lib/oeqa/selftest/{ => cases}/image_typedep.py |   4 +-
 .../lib/oeqa/selftest/{ => cases}/imagefeatures.py |  16 +-
 meta/lib/oeqa/selftest/{ => cases}/layerappend.py  |  15 +-
 meta/lib/oeqa/selftest/{ => cases}/liboe.py        |   7 +-
 .../{lic-checksum.py => cases/lic_checksum.py}     |   8 +-
 meta/lib/oeqa/selftest/{ => cases}/manifest.py     |  52 +-
 .../oeqa/selftest/{ => cases}/oelib/__init__.py    |   0
 .../selftest/{ => cases}/oelib/buildhistory.py     |   4 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/elf.py    |   4 +-
 .../lib/oeqa/selftest/{ => cases}/oelib/license.py |   6 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/path.py   |   4 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/types.py  |   6 +-
 meta/lib/oeqa/selftest/{ => cases}/oelib/utils.py  |   6 +-
 meta/lib/oeqa/selftest/{ => cases}/oescripts.py    |  15 +-
 meta/lib/oeqa/selftest/{ => cases}/package.py      |   4 +-
 meta/lib/oeqa/selftest/{ => cases}/pkgdata.py      |  29 +-
 meta/lib/oeqa/selftest/{ => cases}/prservice.py    |  27 +-
 meta/lib/oeqa/selftest/{ => cases}/recipetool.py   |  81 ++-
 meta/lib/oeqa/selftest/{ => cases}/runqemu.py      |  31 +-
 .../{runtime-test.py => cases/runtime_test.py}     |  15 +-
 meta/lib/oeqa/selftest/{ => cases}/signing.py      |  15 +-
 meta/lib/oeqa/selftest/{ => cases}/sstate.py       |   5 +-
 meta/lib/oeqa/selftest/{ => cases}/sstatetests.py  |  46 +-
 meta/lib/oeqa/selftest/{ => cases}/tinfoil.py      |  25 +-
 meta/lib/oeqa/selftest/{ => cases}/wic.py          |  84 +--
 meta/lib/oeqa/selftest/context.py                  | 224 ++++++
 meta/lib/oeqa/utils/__init__.py                    |  37 +-
 scripts/oe-selftest                                | 791 +--------------------
 scripts/oe-test                                    |  34 +-
 65 files changed, 1578 insertions(+), 1485 deletions(-)
 delete mode 100644 meta-yocto-bsp/lib/oeqa/selftest/__init__.py
 rename meta-yocto-bsp/lib/oeqa/selftest/{ => cases}/systemd_boot.py (91%)
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
 create mode 100644 meta/lib/oeqa/core/threaded.py
 delete mode 100644 meta/lib/oeqa/sdkext/cases/sdk_update.py
 delete mode 100644 meta/lib/oeqa/selftest/__init__.py
 rename meta/lib/oeqa/selftest/{base.py => case.py} (46%)
 rename meta/lib/oeqa/selftest/{ => cases}/_sstatetests_noauto.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/archiver.py (91%)
 rename meta/lib/oeqa/selftest/{ => cases}/bblayers.py (94%)
 rename meta/lib/oeqa/selftest/{ => cases}/bbtests.py (95%)
 rename meta/lib/oeqa/selftest/{ => cases}/buildhistory.py (94%)
 rename meta/lib/oeqa/selftest/{ => cases}/buildoptions.py (94%)
 rename meta/lib/oeqa/selftest/{ => cases}/containerimage.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/devtool.py (99%)
 rename meta/lib/oeqa/selftest/{ => cases}/eSDK.py (92%)
 rename meta/lib/oeqa/selftest/{ => cases}/image_typedep.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/imagefeatures.py (95%)
 rename meta/lib/oeqa/selftest/{ => cases}/layerappend.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/liboe.py (96%)
 rename meta/lib/oeqa/selftest/{lic-checksum.py => cases/lic_checksum.py} (87%)
 rename meta/lib/oeqa/selftest/{ => cases}/manifest.py (80%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/__init__.py (100%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/buildhistory.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/elf.py (92%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/license.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/path.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/types.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/oelib/utils.py (91%)
 rename meta/lib/oeqa/selftest/{ => cases}/oescripts.py (72%)
 rename meta/lib/oeqa/selftest/{ => cases}/package.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/pkgdata.py (96%)
 rename meta/lib/oeqa/selftest/{ => cases}/prservice.py (93%)
 rename meta/lib/oeqa/selftest/{ => cases}/recipetool.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/runqemu.py (92%)
 rename meta/lib/oeqa/selftest/{runtime-test.py => cases/runtime_test.py} (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/signing.py (96%)
 rename meta/lib/oeqa/selftest/{ => cases}/sstate.py (95%)
 rename meta/lib/oeqa/selftest/{ => cases}/sstatetests.py (97%)
 rename meta/lib/oeqa/selftest/{ => cases}/tinfoil.py (96%)
 rename meta/lib/oeqa/selftest/{ => cases}/wic.py (97%)
 create mode 100644 meta/lib/oeqa/selftest/context.py

-- 
2.1.4


