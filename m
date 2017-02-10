Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2E0CE7017B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 15:28:18 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 Feb 2017 07:28:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="1105690279"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2017 07:28:18 -0800
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 1B4BD6A4080
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 07:27:16 -0800 (PST)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 17:05:36 +0200
Message-Id: <cover.1486738307.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/13] #10619: refactor wic codebase. Part 3
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
X-List-Received-Date: Fri, 10 Feb 2017 15:28:19 -0000

Hi,

This patchset introduces PartitionedImage class and moves partition
operations to it. This should simplify the API and make it easier
to understand and maintain.

The following changes since commit 5ea229d46a6ef4a197564815c51ee4c5d23a00c9:

  wic: remove unused argument scripts_path (2017-02-09 16:10:56 +0200)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (13):
  wic: move disk operations to PartitionImage class
  wic: move PartitionedImage class to direct.py
  wic: remove utils/oe/__init__.py
  wic: ksparser: set default disk to 'sda'
  wic: direct: remove set_bootimg_dir setter
  wic: direct: don't catch ImagerError
  wic: direct: remove useless code
  wic: direct: add 'realnum' attribute to partition
  wic: direct: move UUID generation to PartitionedImage
  wic: direct: set bootloader.source in the __init__
  wic: direct: add PartitionedImage.prepare method
  wic: direct: move generation of part.realnum to PartitionedImage
  wic: direct: move creation of PartitionedImage to __init__

 scripts/lib/wic/ksparser.py                        |   2 +-
 scripts/lib/wic/plugins/imager/direct.py           | 465 +++++++++++++++------
 scripts/lib/wic/plugins/source/bootimg-efi.py      |   2 +-
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |   4 +-
 .../lib/wic/plugins/source/isoimage-isohybrid.py   |  10 +-
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |   4 +-
 scripts/lib/wic/utils/oe/__init__.py               |  22 -
 scripts/lib/wic/utils/partitionedfs.py             | 345 ---------------
 8 files changed, 349 insertions(+), 505 deletions(-)
 delete mode 100644 scripts/lib/wic/utils/oe/__init__.py
 delete mode 100644 scripts/lib/wic/utils/partitionedfs.py

--
Regards,
Ed


