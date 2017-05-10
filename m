Return-Path: <anibal.limon@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 8CBE271AC5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 19:47:31 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga104.jf.intel.com with ESMTP; 10 May 2017 12:47:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,320,1491289200"; d="scan'208";a="1128735034"
Received: from rnpawar-mobl3.amr.corp.intel.com (HELO
	alimonb-mobl1.zpn.intel.com) ([10.254.59.138])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 12:47:21 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 14:47:00 -0500
Message-Id: <cover.1494445222.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, juan.m.cruz.alcaraz@intel.com
Subject: [PATCH 00/17] OEQA framework add support of threaded mode and enable in SDK
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
X-List-Received-Date: Wed, 10 May 2017 19:47:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series enables support of OEQA framework threaded runs, it implements a new module
oeqa.core.threaded with OETest{Context, Loader, Runner, StreamLogger, Result} versions
supporting parallelized runs.

The {e,}SDK test component was enable to use threaded mode by default.

The following changes since commit 381897c64069ea43d595380a3ae913bcc79cf7e1:

  build-appliance-image: Update to master head revision (2017-05-01 08:56:47 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oeqa_threaded
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oeqa_threaded

Aníbal Limón (17):
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

 meta/classes/testimage.bbclass                     |   4 +-
 meta/classes/testsdk.bbclass                       |  13 +-
 meta/lib/oeqa/core/context.py                      |  97 +-------
 meta/lib/oeqa/core/decorator/depends.py            |   8 +-
 meta/lib/oeqa/core/decorator/oetimeout.py          |  40 ++-
 meta/lib/oeqa/core/runner.py                       |  94 ++++++-
 .../core/tests/cases/loader/threaded/threaded.py   |  12 +
 .../tests/cases/loader/threaded/threaded_alone.py  |   8 +
 .../cases/loader/threaded/threaded_depends.py      |  10 +
 .../tests/cases/loader/threaded/threaded_module.py |  12 +
 meta/lib/oeqa/core/tests/common.py                 |  10 +
 meta/lib/oeqa/core/tests/test_decorators.py        |  12 +
 meta/lib/oeqa/core/tests/test_loader.py            |  30 ++-
 meta/lib/oeqa/core/threaded.py                     | 274 +++++++++++++++++++++
 meta/lib/oeqa/sdk/context.py                       |  11 +-
 meta/lib/oeqa/sdkext/cases/devtool.py              |  32 +++
 meta/lib/oeqa/sdkext/cases/sdk_update.py           |  39 ---
 17 files changed, 548 insertions(+), 158 deletions(-)
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_alone.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_depends.py
 create mode 100644 meta/lib/oeqa/core/tests/cases/loader/threaded/threaded_module.py
 create mode 100644 meta/lib/oeqa/core/threaded.py
 delete mode 100644 meta/lib/oeqa/sdkext/cases/sdk_update.py

-- 
2.1.4


