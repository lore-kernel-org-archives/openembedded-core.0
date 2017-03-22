Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2A6C177B46
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 13:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1490190170; x=1521726170; h=from:to:subject:date:message-id;
	bh=/16Vj8JizpfXA6ZRQ7CKTMf5jdMponLGCVwuOlG/U9A=;
	b=Yn/JWb2yu/C+Hc6bqdmTYySBiritg5r7wib5SvL6AzSpwcLDl7KlwcE/
	01+jwaIwVDK4hdBWwN3DzsikJR2dmw==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2017 06:42:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,205,1486454400"; d="scan'208";a="63641191"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga002.jf.intel.com with ESMTP; 22 Mar 2017 06:42:49 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 422E82C8001
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Mar 2017 06:42:43 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Mar 2017 15:42:24 +0200
Message-Id: <cover.1490188583.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/10] #10618: Increase oe-selftest coverage of wic codebase (first part)
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
X-List-Received-Date: Wed, 22 Mar 2017 13:42:48 -0000

Hi,

The main goal of these changes was to increase test coverage by testing rawcopy plugin,
which was not covered by the wic test suite. While working on it I found and fixed
quite nasty bug in sparse_copy API and made set of other important changes to make
the test case working.

I've also removed rootfs_pcbios_ext plugin, which was broken for a long time and
cleaned up wic test suite to keep it in a good shape.

The goal set in bugzilla issue #10618 is to increase test coverage to at least 80%.
Now it's only 74%, so more changes will have to be made. This patchset is just a
first part of the work in this area.

Note for project maintainers:
This patchset is based on Maciej's "enhancements for non-x86 MACHINE support & fixed-size tests"
patchset: http://lists.openembedded.org/pipermail/openembedded-core/2017-March/134410.html so,
please merge it in the right order.

The following changes since commit e07ca8bd2bd4a8fa1fb9a0f3a8d9ff9a8f9c46c8:

  wic: selftest: add tests for --fixed-size partition flags (2017-03-21 15:17:24 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (10):
  wic: remove rootfs_pcbios_ext plugin
  wic: don't set creator.bootimg_dir in plugins
  wic: use kernel_dir instead of bootimg_dir
  wic: fix bug in sparse_copy
  wic: use STAGING_DATADIR as a default for bootimg_dir
  wic: remove empty plugin methods
  wic: improve getting syslinux path
  oe-selftest: test wic rawcopy plugin
  selftest: pylinted wic test suite.
  oe-selftest: add test_rawcopy_plugin test case

 meta-selftest/wic/test_rawcopy_plugin.wks.in       |   6 +
 meta/lib/oeqa/selftest/wic.py                      |  84 +++++---
 scripts/lib/wic/filemap.py                         |   1 +
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  16 +-
 .../lib/wic/plugins/source/bootimg-partition.py    |  32 +---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  53 ++---
 scripts/lib/wic/plugins/source/fsimage.py          |  19 --
 scripts/lib/wic/plugins/source/rawcopy.py          |  29 +--
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    | 213 ---------------------
 scripts/wic                                        |   3 +-
 10 files changed, 113 insertions(+), 343 deletions(-)
 create mode 100644 meta-selftest/wic/test_rawcopy_plugin.wks.in
 delete mode 100644 scripts/lib/wic/plugins/source/rootfs_pcbios_ext.py

-- 
2.1.4


