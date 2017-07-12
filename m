Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id BE36471AB5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 19:36:50 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Jul 2017 12:36:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,351,1496127600"; d="scan'208";a="286133670"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.128.139])
	by fmsmga004.fm.intel.com with ESMTP; 12 Jul 2017 12:36:50 -0700
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Jul 2017 14:36:46 -0500
Message-Id: <cover.1499887935.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Cc: joshua.g.lock@intel.com
Subject: [PATCHv2 00/29] oeqa core and oe-selftest threaded enablement
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
X-List-Received-Date: Wed, 12 Jul 2017 19:36:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The v2 address comments did by Patrick about add better explanation
on the commit messages and some typos.

Other interesting information to add is that with this series we will
able to execute oe-selftest in around half [1] of the original time [2],
(9406.782s vs 17303.014s).

[1] https://bugzilla.yoctoproject.org/attachment.cgi?id=3863
[2] https://bugzilla.yoctoproject.org/attachment.cgi?id=3864

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

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/oe_selftest_threaded
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/oe_selftest_threaded

Aníbal Limón (29):
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
  oeqa/selftest/cases: imagefeatures enable threaded runs
  oeqa/selftest/cases: runqemu enable threaded runs
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
 meta/lib/oeqa/selftest/context.py                  |  137 ++-
 scripts/lib/argparse_oe.py                         |    7 +
 41 files changed, 1997 insertions(+), 1552 deletions(-)
 create mode 100644 meta/lib/oeqa/selftest/cases/devtool_deploy.py
 create mode 100644 meta/lib/oeqa/selftest/cases/devtool_end.py
 create mode 100644 meta/lib/oeqa/selftest/cases/imagefeatures_boot.py
 create mode 100644 meta/lib/oeqa/selftest/cases/runtime_test_export.py
 create mode 100644 meta/lib/oeqa/selftest/cases/runtime_test_postinsts.py

-- 
2.11.0


