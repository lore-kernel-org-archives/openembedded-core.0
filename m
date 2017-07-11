Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 5872377E9D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 20:23:19 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga105.fm.intel.com with ESMTP; 11 Jul 2017 13:23:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,347,1496127600"; d="scan'208";a="1171279634"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga001.fm.intel.com with ESMTP; 11 Jul 2017 13:23:20 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Jul 2017 15:23:15 -0500
Message-Id: <cover.1499803885.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCH 00/30] oeqa core and oe-selftest threaded enablement
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
X-List-Received-Date: Tue, 11 Jul 2017 20:23:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series is to enable oe-selftest threaded runs along some fixes,

* Implementation of main/end thread usage in oeqa threaded
* Adaptation of oe-selftest cases to be able to run in threaded env,
  ** Usage of own build directory by Test class.
  ** Mark the test modules that are enabled to run into a thread.
  ** Split some test modules because aren't support run into a thread
     due to bitbake/tinfoil constraints.

The oe-selftest script now has an cmdline option (-t) to enable threaded
runs, by default is set to 1, this needs to be set manually because 
depending on HW resources available can cause ran out of cpu/memory.

By default the oe-selftest cases runs on the main thread and uses
the main build directory for compatibility purposes.
 
The following changes since commit 854c8c2e4c24ea3ddfec6e5b5f6477f0620510e4:

  oeqa/tinfoil: Improve test_wait_event for race issues (2017-07-08 13:34:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oe_selftest_threaded
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oe_selftest_threaded

Aníbal Limón (30):
  oeqa/core/loader: Switch method definition for _make_failed_test
  oeqa/selftest/{context,case}: Handle KeyboardInterrupt/SIGINT and
    SIGTERM
  selftest/cases/package: Call parent setUpClass method
  bb/tinfoil: run_command handle busy status in bitbake server
  oe/copy_buildsystem: check_sstate_task_list also pop BBPATH from env
  oeqa/core/threaded: Enable support to use the main thread
  oeqa/core/threaded: Add support to run into a thread at end of
    execution
  oeqa/core/threaded: logSummary add skipped tests info
  oeqa/core/tests: Update test_loader threaded to cover main thread
    usage
  oeqa/selftest/{case,context}: Add builddir by test class and context
  oeqa/selftest/case: Add wrappers to utils.commands modules
  oeqa/selftest/case: Creates meta-selftest layer per class
  oeqa/selftest/case: tearDown extra commands print what actually fails
  oeqa/selftest/case: Support bitbake memres mode in per build directory
  oeqa/selftest/cases: Use testlayer_path instead of call
    get_test_layer()
  oeqa/selftest/cases: Use builddir from class instead of get from
    environment
  oeqa/selftest/cases: Use wrapper methods from OESelfTestCase class
  oeqa/selftest/cases: tinfoil to run in the main thread
  oeqa/selftest/cases: imagefeatures enable threaded runs
  oeqa/selftest/cases: runqemu enable thraded runs
  oeqa/selftest/cases: runtime enable threaded runs
  oeqa/selftest/cases: eSDK enable threaded runs
  oeqa/selftest/cases: devtool enable threaded runs
  oeqa/selftest/cases: recipetool enable for threaded runs
  oeqa/selftest/cases: Move devtool deploy test case to own module
  selftest/cases/devtool{,end}: Move update/finish_modify tests to its
    own module
  seltest/cases/devtool: Build dbus on test_devtool_add_git_local
  argparse_oe: Add int_positive type
  oeqa/selftest/context: Enable support for threaded runs
  oeqa/selftest/cases: systemd_boot enable threaded runs

 bitbake/lib/bb/tinfoil.py                          |   23 +-
 .../lib/oeqa/selftest/cases/systemd_boot.py        |   26 +-
 meta/lib/oe/copy_buildsystem.py                    |    1 +
 meta/lib/oeqa/core/loader.py                       |    4 +-
 meta/lib/oeqa/core/tests/test_loader.py            |   17 +-
 meta/lib/oeqa/core/threaded.py                     |  169 +++-
 meta/lib/oeqa/selftest/case.py                     |  251 ++++-
 .../lib/oeqa/selftest/cases/_sstatetests_noauto.py |   23 +-
 meta/lib/oeqa/selftest/cases/archiver.py           |   21 +-
 meta/lib/oeqa/selftest/cases/bblayers.py           |   45 +-
 meta/lib/oeqa/selftest/cases/bbtests.py            |  103 +-
 meta/lib/oeqa/selftest/cases/buildhistory.py       |    9 +-
 meta/lib/oeqa/selftest/cases/buildoptions.py       |   51 +-
 meta/lib/oeqa/selftest/cases/containerimage.py     |    9 +-
 meta/lib/oeqa/selftest/cases/devtool.py            | 1014 +++++---------------
 meta/lib/oeqa/selftest/cases/devtool_deploy.py     |   93 ++
 meta/lib/oeqa/selftest/cases/devtool_end.py        |  506 ++++++++++
 meta/lib/oeqa/selftest/cases/distrodata.py         |    7 +-
 meta/lib/oeqa/selftest/cases/eSDK.py               |   61 +-
 meta/lib/oeqa/selftest/cases/image_typedep.py      |    8 +-
 meta/lib/oeqa/selftest/cases/imagefeatures.py      |   78 +-
 meta/lib/oeqa/selftest/cases/imagefeatures_boot.py |   63 ++
 meta/lib/oeqa/selftest/cases/layerappend.py        |   22 +-
 meta/lib/oeqa/selftest/cases/liboe.py              |   13 +-
 meta/lib/oeqa/selftest/cases/lic_checksum.py       |    8 +-
 meta/lib/oeqa/selftest/cases/manifest.py           |   13 +-
 meta/lib/oeqa/selftest/cases/oelib/buildhistory.py |    7 +-
 meta/lib/oeqa/selftest/cases/oescripts.py          |    5 +-
 meta/lib/oeqa/selftest/cases/package.py            |   12 +-
 meta/lib/oeqa/selftest/cases/pkgdata.py            |   73 +-
 meta/lib/oeqa/selftest/cases/prservice.py          |   19 +-
 meta/lib/oeqa/selftest/cases/recipetool.py         |  105 +-
 meta/lib/oeqa/selftest/cases/runqemu.py            |    7 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py       |  225 +----
 .../lib/oeqa/selftest/cases/runtime_test_export.py |  104 ++
 .../oeqa/selftest/cases/runtime_test_postinsts.py  |  114 +++
 meta/lib/oeqa/selftest/cases/signing.py            |   40 +-
 meta/lib/oeqa/selftest/cases/sstate.py             |    5 +-
 meta/lib/oeqa/selftest/cases/sstatetests.py        |   51 +-
 meta/lib/oeqa/selftest/cases/tinfoil.py            |    1 -
 meta/lib/oeqa/selftest/context.py                  |  137 ++-
 scripts/lib/argparse_oe.py                         |    7 +
 42 files changed, 1997 insertions(+), 1553 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/devtool_deploy.py
 create mode 100644 meta/lib/oeqa/selftest/cases/devtool_end.py
 create mode 100644 meta/lib/oeqa/selftest/cases/imagefeatures_boot.py
 create mode 100644 meta/lib/oeqa/selftest/cases/runtime_test_export.py
 create mode 100644 meta/lib/oeqa/selftest/cases/runtime_test_postinsts.py

-- 
2.11.0


