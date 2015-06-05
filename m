Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 5387175872
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jun 2015 09:10:55 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga102.fm.intel.com with ESMTP; 05 Jun 2015 02:10:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.13,557,1427785200"; d="scan'208";a="741473277"
Received: from linux.intel.com ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 05 Jun 2015 02:10:57 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.65])
	by linux.intel.com (Postfix) with ESMTP id BD2896A4083;
	Fri,  5 Jun 2015 02:10:22 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  5 Jun 2015 10:17:07 +0300
Message-Id: <1433488636-4540-1-git-send-email-ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH v2 0/9] UUID support
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
X-List-Received-Date: Fri, 05 Jun 2015 09:10:56 -0000

Hi,

Please, review implementation of partition UUID support in wic.

It contains two options: --part-type and --use-uuid
--part-type allows to set partition type UUID. It was incorrectly
implemted in wic and now it's hopefully fixed.

--use-uuid makes wic to generate random globally unique identifier
(GUID) for the partition and configure bootloader to boot from it
using root=PARTUUID=<GUID> in kernel command line.

This technique makes boot process more deterministic and reliable
for at least two reasons:
- It allows to boot the same image from different devices
- It fixes possible boot issues caused by using device names in
  kernel commandline as GUID doesn't change unlike device names.


Ed Bartosh (9):
  wic: Add --use-uuid partition option
  wic: Generate random uuid for partition
  wic: Fix format string
  wic: Refactored getting root device name
  wic: Add parameter 'uuid' to Image.add_partition method
  wic: Set type GUID and UUID for partition
  wic: Use partition UUID in directdisk-gpt
  wic: oe-selftest: Configure testing of gpt/UUID image
  wic: Add help for --part-type and --use-uuid options

 meta/lib/oeqa/selftest/wic.py                      |  4 +--
 scripts/lib/image/canned-wks/directdisk-gpt.wks    |  2 +-
 scripts/lib/image/help.py                          |  9 +++++++
 scripts/lib/wic/imager/direct.py                   | 31 ++++++++++------------
 .../lib/wic/kickstart/custom_commands/partition.py | 21 ++++++++++++++-
 scripts/lib/wic/plugins/source/bootimg-efi.py      |  6 ++---
 scripts/lib/wic/plugins/source/bootimg-pcbios.py   |  3 +--
 .../lib/wic/plugins/source/rootfs_pcbios_ext.py    |  3 +--
 scripts/lib/wic/utils/partitionedfs.py             | 20 ++++++++++++--
 9 files changed, 68 insertions(+), 31 deletions(-)

--
Ed


