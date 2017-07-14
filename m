Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id AB37C781FA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 12:45:40 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga104.jf.intel.com with ESMTP; 14 Jul 2017 05:45:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,359,1496127600"; d="scan'208";a="108120556"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga004.jf.intel.com with ESMTP; 14 Jul 2017 05:45:40 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id CCA075807D9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jul 2017 05:45:39 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 14 Jul 2017 15:32:59 +0300
Message-Id: <cover.1500035131.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH v2 0/8] #11552 - wic: avoid unnecessary dependencies
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
X-List-Received-Date: Fri, 14 Jul 2017 12:45:41 -0000

Hi,

This patchset gets rid of building wic-tools for every image when IMAGE_FSTYPES
contains 'wic'. Instead of using dependencies from wic-tools native sysroot wic
expects image native sysroot to contain them. This should be done by setting
WKS_FILE_DEPENDS variable in configuration files where WKS_FILE is set.

wic-tools can be used by wic when its run manually by pointing to the
native sysroot using --native-sysroot option.

The patchset also contains fixes for the isoimage plugin and wic test suite
breakages that were coused by the new changes.

Changes in v2:
- Fixed 2 more test cases
- Fixed default WKS_FILE_DEPENDS value (thanks to Patrick Ohly)
- Rebased on top of recent poky master

The following changes since commit f519ac010a7f7e018a83d85b6dc7778904b9a703:

  oe-selftest: wic: fix test_quemu (2017-07-12 14:33:02 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (8):
  wic: get rid of using wic-tools
  wic: isoimage: do not remove temp directory
  wic: build wic-tools only if wic is run manually
  wic: isoimage-isohybrid: check result of glob()
  wic-tools: don't create wic-tools.env
  image_types_wic: set default WKS_FILE_DEPENDS
  wic: isoimage-isohybrid: use grub-efi from deploy dir
  selftest: fixed 5 wic test cases

 meta/classes/image_types_wic.bbclass               | 11 ++-
 meta/lib/oeqa/selftest/cases/wic.py                | 23 +++++-
 meta/recipes-core/meta/wic-tools.bb                | 10 +--
 scripts/lib/wic/misc.py                            |  9 +--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  5 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 88 ++++++++--------------
 scripts/wic                                        | 14 ++--
 7 files changed, 73 insertions(+), 87 deletions(-)

--
Regards,
Ed

