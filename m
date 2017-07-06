Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 24958774FC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 08:08:50 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	06 Jul 2017 01:08:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,316,1496127600"; d="scan'208";a="121503835"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 06 Jul 2017 01:08:52 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 66A4A580571
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 01:08:51 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 10:56:41 +0300
Message-Id: <cover.1499326977.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] #11552 - wic: avoid unnecessary dependencies
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
X-List-Received-Date: Thu, 06 Jul 2017 08:08:51 -0000

Hi,

This patchset gets rid of building wic-tools for every image when IMAGE_FSTYPES
contains 'wic'. Instead of using dependencies from wic-tools sysroots wic expects
image sysroots to contain them. This should be done by setting of WKS_FILE_DEPENDS
variable in configuration files where WKS_FILE is set.

wic-tools will still be used by wic when its run manually.

The patchset contains fixes for the isoimage plugin and wic test suite breakages
that were coused by the new changes.

The following changes since commit 8aec50157b9680bb8667be6d5680230b89ad059a:

  oe-selftest: wic: fix test_quemu (2017-07-05 11:36:41 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wip

Ed Bartosh (8):
  wic: get rid of using wic-tools
  wic: isoimage: do not remove temp directory
  wic: build wic-tools only if wic is run manually
  wic: isoimage-isohybrid: check result of glob()
  wic-tools: don't create wic-tools.env
  image_types_wic: set default WKS_FILE_DEPENDS
  wic: isoimage-isohybrid: use grub-efi from deploy dir
  selftest: fixed 3 wic test cases

 meta/classes/image_types_wic.bbclass               |  7 +-
 meta/lib/oeqa/selftest/cases/wic.py                | 11 ++-
 meta/recipes-core/meta/wic-tools.bb                | 10 +--
 scripts/lib/wic/misc.py                            |  9 +--
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  5 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   | 88 ++++++++--------------
 scripts/wic                                        | 16 ++--
 7 files changed, 62 insertions(+), 84 deletions(-)

--
Regards,
Ed


