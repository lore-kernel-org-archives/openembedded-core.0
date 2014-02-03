Return-Path: <stefanx.stanacar@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 425796E91D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 19:23:30 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 03 Feb 2014 11:23:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,774,1384329600"; d="scan'208";a="475316208"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga002.fm.intel.com with ESMTP; 03 Feb 2014 11:21:27 -0800
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.156])
	by linux.intel.com (Postfix) with ESMTP id A4CBD6A4092
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Feb 2014 11:21:20 -0800 (PST)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Feb 2014 21:22:28 +0200
Message-Id: <cover.1391454072.git.stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/3] testimage/oeqa: Add ability to export tests to decouple them from the build system
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
X-List-Received-Date: Mon, 03 Feb 2014 19:23:30 -0000

Hello,

These patches add the ability to export and run tests outside of the build.
As tests used to query values from the data storage this exports parts of d
and makes them avaiable in a json file, so tests don't need to change to
make them exportable. Tests exported are the ones defined in TEST_SUITES regardless
of layer.
Starting the target (in the default case qemu) is still handled by the build system, as before,
so keep that in mind.

Simplest way to test this is with a qemu image that you manually start.
For an already build image use this in local.conf:
TEST_EXPORT_ONLY = "1"
TEST_TARGET = "simpleremote"
TEST_TARGET_IP = "192.168.7.2"
TEST_SERVER_IP = "192.168.7.1"
Export the tests: bitbake core-image-sato -c testimage 
Then: runqemu core-image-sato
And: cd tmp/testimage/core-image-sato && ./runexported.py testdata.json

In the default case (TEST_EXPORT_ONLY = "0") nothing really changes
so no tests should start failing because of this.

Cheers,
Stefan


The following changes since commit 76f52a81f600fe7dfee0987db361e973b9ab71f8:

  insane: Fix python function whitespace changes (2014-02-03 16:16:30 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib stefans/export
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=stefans/export

Stefan Stanacar (3):
  testimage: add ability to export tests
  lib/oeqa: add module for running tests outside of the build system
  oeqa/utils: targetbuild: don't use bb.fetch anymore

 meta/classes/testimage.bbclass     | 107 ++++++++++++++++++++++++----
 meta/lib/oeqa/oetest.py            |  17 ++---
 meta/lib/oeqa/runexported.py       | 140 +++++++++++++++++++++++++++++++++++++
 meta/lib/oeqa/utils/targetbuild.py |  27 +++----
 4 files changed, 246 insertions(+), 45 deletions(-)
 create mode 100755 meta/lib/oeqa/runexported.py

-- 
1.8.5.3


