Return-Path: <anibal.limon@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 676A1771F1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Feb 2016 15:12:29 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 02 Feb 2016 07:12:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,385,1449561600"; d="scan'208";a="645913188"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.31])
	by FMSMGA003.fm.intel.com with ESMTP; 02 Feb 2016 07:12:29 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  2 Feb 2016 09:14:03 -0600
Message-Id: <cover.1454424743.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com, benjamin.esquivel@intel.com
Subject: [PATCH 00/20] Add Extensible SDK test suite
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
X-List-Received-Date: Tue, 02 Feb 2016 15:12:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The eSDK test suite was added now running SDK existing tests and also devtool
add/reset/build with a simple hello world C application. New task was added for
run eSDK test suite (testsdkext).

Summary of changes,

	- Add new class called testsdk that now have the tests for SDK and eSDK.
	- TestContext -> {Image, SDK, SDKExt}: Remove all duplicate code inside
	  testimage and testsdk class move into oeqa/oetest and create class per
	  type of Test.
	- Extensible SDK fixes usage with proxies, when eSDK is configuring it
	  executes setscene tasks that needs network acces if was build with sstate
	  mirrors.

Testing was made building/running SDK and eSDK for core-image-minimal and core-image-sato,
also testimage was run in core-image-minimal and core-image-sato with QemuRemote and SimpleRemote
 to ensure that nothing was break.

This patchset DEPENDS on bitbake change to export proxies and NEEDS to be MERGED before, see:
bb/fetch2: Move export_proxies function from wget to utils.

The following changes since commit ba2fdcddafcd7c0c42eecd740698a722c2d75144:

  native.bbclass: Set CXXFLAGS from BUILD_CXXFLAGS not BUILD_CFLAGS (2016-01-31 13:29:49 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib alimon/esdk_testsuite
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=alimon/esdk_testsuite

Aníbal Limón (20):
  testimage: Modularize helper functions for get test lists.
  classes/testsdk: Add new class testsdk.
  classes/testimage: Add defeault inherit for testsdk.
  populate_sdk_ext: Set TOOLCHAINEXT_OUTPUTNAME.
  get_test_suites: Add sdkext type for load test suites.
  classes/testsdk: Add testsdkext task only install.
  bb/fetch2: Move export_proxies function from wget to utils.
  classes/testsdk: Add call to export_proxies on testsdkext.
  toolchain-shar-extract.sh: Add proxy variable to new env.
  testimage/testsdk: Modularize TestContext.
  testimage/testsdk: Move get test suites routine inside TestContext.
  oetest.py/TestContext: Move loadTests and runTests inside it.
  oeqa/oetest.py: Fix missing oeqa.runtime import.
  classes/testsdk: Add function run_test_context
  classes/populate_sdk_ext: Add OE_SDK_EXT_SILENT env variable
  classes/testsdk: Add compatibility SDK testsuite to eSDK
  testsdkext: Add skeleton for support Extensible SDK tests.
  classes/populate_sdk_ext: Add SDK_EXT_TARGET_MANIFEST and
    SDK_EXT_HOST_MANIFEST
  oeqa/sdkext: Add devtool basic tests for eSDK.
  classes/testsdk: Add help information on how to run tests.

 bitbake/lib/bb/fetch2/wget.py             |  17 +-
 bitbake/lib/bb/utils.py                   |  19 ++
 meta/classes/populate_sdk_ext.bbclass     |   8 +-
 meta/classes/testimage.bbclass            | 217 +----------------
 meta/classes/testsdk.bbclass              | 146 ++++++++++++
 meta/files/toolchain-shar-extract.sh      |   4 +-
 meta/lib/oeqa/oetest.py                   | 379 ++++++++++++++++++++++--------
 meta/lib/oeqa/sdkext/__init__.py          |   3 +
 meta/lib/oeqa/sdkext/devtool.py           |  25 ++
 meta/lib/oeqa/sdkext/files/myapp/Makefile |  10 +
 meta/lib/oeqa/sdkext/files/myapp/myapp.c  |   9 +
 11 files changed, 505 insertions(+), 332 deletions(-)
 create mode 100644 meta/classes/testsdk.bbclass
 create mode 100644 meta/lib/oeqa/sdkext/__init__.py
 create mode 100644 meta/lib/oeqa/sdkext/devtool.py
 create mode 100644 meta/lib/oeqa/sdkext/files/myapp/Makefile
 create mode 100644 meta/lib/oeqa/sdkext/files/myapp/myapp.c

-- 
2.1.4


