Return-Path: <leonardo.sandoval.gonzalez@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id C6DA171DD2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2017 22:43:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Jan 2017 14:43:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,316,1477983600"; d="scan'208";a="1089450226"
Received: from lsandov1-mobl2.zpn.intel.com ([10.219.128.141])
	by orsmga001.jf.intel.com with ESMTP; 31 Jan 2017 14:43:41 -0800
From: leonardo.sandoval.gonzalez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 Jan 2017 16:50:48 -0600
Message-Id: <cover.1485902097.git.leonardo.sandoval.gonzalez@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/4] Some optimizations on top time selftest checks
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
X-List-Received-Date: Tue, 31 Jan 2017 22:43:42 -0000

From: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>

* On my local host test, the optimization went from 44 to 8 minutes with the following command

oe-selftest -r \
buildoptions.ImageOptionsTests.test_read_only_image \
bbtests.BitbakeTests.test_non_gplv3 \
buildoptions.ImageOptionsTests.test_ccache_tool \
buildoptions.ImageOptionsTests.test_read_only_image

  * Before series applied
  
  2017-01-31 15:41:20 - test_read_only_image (oeqa.selftest.buildoptions.ImageOptionsTests) ... ok
  2017-01-31 16:20:12 - test_non_gplv3 (oeqa.selftest.bbtests.BitbakeTests) ... ok
  2017-01-31 16:22:55 - test_ccache_tool (oeqa.selftest.buildoptions.ImageOptionsTests) ... ok
  2017-01-31 16:23:49 - test_read_only_image (oeqa.selftest.buildoptions.ImageOptionsTests) ... ok

  ----------------------------------------------------------------------
  Ran 4 tests in 2662.852s

  * After series applied
  
  2017-01-31 15:27:08 - test_read_only_image (oeqa.selftest.buildoptions.ImageOptionsTests) ... ok
  2017-01-31 15:27:14 - test_non_gplv3 (oeqa.selftest.bbtests.BitbakeTests) ... ok
  2017-01-31 15:33:42 - test_ccache_tool (oeqa.selftest.buildoptions.ImageOptionsTests) ... ok
  2017-01-31 15:34:30 - test_read_only_image (oeqa.selftest.buildoptions.ImageOptionsTests) ... ok

  ----------------------------------------------------------------------
  Ran 4 tests in 518.647s


[YOCTO #10874]

The following changes since commit d45d4a5a21ab4209b87331dddf515ecdb62367fa:

  staging: Handle stale sysroot rebuild issue (2017-01-28 23:32:16 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib lsandov1/oe-selftest-optimizations
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=lsandov1/oe-selftest-optimizations

Leonardo Sandoval (4):
  selftest/buildoptions: use a thinner image to test 'read-only-rootfs'
    feature
  selftest/buildoptions: force compile task instead of cleaning sstates
  selftest/bbtests: use write_config instead of local.conf file
  selftest/archiver: invalidate stamps instead of removing TMPDIR

 meta/lib/oeqa/selftest/archiver.py     | 4 ++--
 meta/lib/oeqa/selftest/bbtests.py      | 5 +----
 meta/lib/oeqa/selftest/buildoptions.py | 8 ++------
 3 files changed, 5 insertions(+), 12 deletions(-)

-- 
2.1.4


