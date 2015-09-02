Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id A093076FDE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 10:58:23 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga103.fm.intel.com with ESMTP; 02 Sep 2015 03:58:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.17,453,1437462000"; d="scan'208";a="637004796"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga003.jf.intel.com with ESMTP; 02 Sep 2015 03:58:23 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id 1EF976A4083
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Sep 2015 03:57:31 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Sep 2015 13:58:00 +0300
Message-Id: <cover.1441191270.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/17] wic improvements
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
X-List-Received-Date: Wed, 02 Sep 2015 10:58:27 -0000

Hi,

This patchset included various wic improvements:
- Fixed boot failure caused by switched off ext3 in the kernel
- Moved all wic modules to scripts/lib/wic
- Removed mic leftovers
- Removed 3rd party command line parser cmdln
- Covered building of all canned images with tests
- Code cleanup

The following changes since commit 71b0568fa43285f0946fae93fb43cea5f3bbecec:

  rt-tests: drop unnecessary added-missing-dependencies.patch (2015-09-01 11:44:04 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/misc

Ed Bartosh (17):
  wic: use ext4 in canned .wks files
  wic: get rid of scripts/lib/image
  oe-selftest: wic: configure a build
  wic: add test cases for 3 images
  wic: fix typo
  wic: remove micpartition.py
  wic: remove micboot.py
  wic: fix errors in partition.py module
  wic: get rid of wildcard imports
  wic: fix pylint warning multiple-statements
  wic: use optparse instead of cmdln
  wic: fix pylint warning no-member
  wic: fix pylint warning unused-variable
  wic: fix pylint warning redefined-builtin
  wic: get rid of listing properties
  wic: fix short variable names
  image.py: rename _write_env -> _write_wic_env

 meta/lib/oe/image.py                               |    4 +-
 meta/lib/oeqa/selftest/wic.py                      |   34 +-
 scripts/lib/image/__init__.py                      |   22 -
 .../{image => wic}/canned-wks/directdisk-gpt.wks   |    4 +-
 .../canned-wks/directdisk-multi-rootfs.wks         |    6 +-
 .../lib/{image => wic}/canned-wks/directdisk.wks   |    4 +-
 .../lib/{image => wic}/canned-wks/mkefidisk.wks    |    4 +-
 .../lib/{image => wic}/canned-wks/mkgummidisk.wks  |    4 +-
 .../lib/{image => wic}/canned-wks/mkhybridiso.wks  |    2 +-
 .../canned-wks/qemux86-directdisk.wks              |    0
 .../{image => wic}/canned-wks/sdimage-bootpart.wks |    0
 scripts/lib/wic/conf.py                            |    5 +-
 scripts/lib/{image => wic}/config/wic.conf         |    0
 scripts/lib/wic/creator.py                         |  115 +-
 scripts/lib/{image => wic}/engine.py               |  141 +-
 scripts/lib/{image => wic}/help.py                 |   97 +-
 scripts/lib/wic/imager/baseimager.py               |    8 +-
 scripts/lib/wic/imager/direct.py                   |   74 +-
 scripts/lib/wic/kickstart/__init__.py              |   66 +-
 .../lib/wic/kickstart/custom_commands/__init__.py  |    4 -
 .../lib/wic/kickstart/custom_commands/micboot.py   |   50 -
 .../wic/kickstart/custom_commands/micpartition.py  |   57 -
 .../lib/wic/kickstart/custom_commands/partition.py |  108 +-
 .../lib/wic/kickstart/custom_commands/wicboot.py   |   31 +-
 scripts/lib/wic/msger.py                           |   13 +-
 scripts/lib/wic/plugin.py                          |   14 +-
 scripts/lib/wic/pluginbase.py                      |   14 +-
 scripts/lib/wic/plugins/imager/direct_plugin.py    |    6 +-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   32 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   34 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |   32 +-
 scripts/lib/wic/utils/cmdln.py                     | 1585 --------------------
 scripts/lib/wic/utils/oe/misc.py                   |    2 +-
 scripts/lib/wic/utils/partitionedfs.py             |  154 +-
 scripts/lib/wic/utils/runner.py                    |   19 +-
 scripts/wic                                        |   23 +-
 36 files changed, 463 insertions(+), 2305 deletions(-)
 delete mode 100644 scripts/lib/image/__init__.py
 rename scripts/lib/{image => wic}/canned-wks/directdisk-gpt.wks (75%)
 rename scripts/lib/{image => wic}/canned-wks/directdisk-multi-rootfs.wks (87%)
 rename scripts/lib/{image => wic}/canned-wks/directdisk.wks (70%)
 rename scripts/lib/{image => wic}/canned-wks/mkefidisk.wks (76%)
 rename scripts/lib/{image => wic}/canned-wks/mkgummidisk.wks (76%)
 rename scripts/lib/{image => wic}/canned-wks/mkhybridiso.wks (96%)
 rename scripts/lib/{image => wic}/canned-wks/qemux86-directdisk.wks (100%)
 rename scripts/lib/{image => wic}/canned-wks/sdimage-bootpart.wks (100%)
 rename scripts/lib/{image => wic}/config/wic.conf (100%)
 rename scripts/lib/{image => wic}/engine.py (59%)
 rename scripts/lib/{image => wic}/help.py (88%)
 delete mode 100644 scripts/lib/wic/kickstart/custom_commands/micboot.py
 delete mode 100644 scripts/lib/wic/kickstart/custom_commands/micpartition.py
 delete mode 100644 scripts/lib/wic/utils/cmdln.py

--
Ed


