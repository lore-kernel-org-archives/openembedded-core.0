Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 2BA08600B3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 11:51:57 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga104.fm.intel.com with ESMTP; 22 Apr 2016 04:51:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,517,1455004800"; d="scan'208";a="690452007"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 22 Apr 2016 04:51:59 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 000086A4002
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Apr 2016 05:39:34 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 22 Apr 2016 12:31:58 +0300
Message-Id: <cover.1461317156.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH 0/6] new wks option --system-id
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
X-List-Received-Date: Fri, 22 Apr 2016 11:52:00 -0000

Hi,

This patchset contains implementation of --system-id option. The option sets
system id for the partition if specified.

For example with this wks file:

part /boot --ondisk sda --align 1024 --fstype vfat --source bootimg-pcbios --size 64M   --system-id 1
part /     --ondisk sda --align 1024 --fstype ext4 --source rootfs         --size 1000M --system-id 2
part /opt  --ondisk sda --align 1024 --fstype ext4                         --size 1000M --system-id 3

The image layout is the following: (pay attention to the system ids 1,2,3)

   Device Boot Start     End   #cyls    #blocks   Id  System
img/build/system-id-201604221223-sda.direct1         16    1040-   1025-     65552    1  FAT12
img/build/system-id-201604221223-sda.direct2       1056   21855   20800    1331200    2  XENIX root
img/build/system-id-201604221223-sda.direct3      21856   37855   16000    1024000    3  XENIX usr

The following changes since commit 6c1c01392d91f512e2949ad1d57a75a8077478ba:

  build-appliance-image: Update to krogoth head revision (2016-04-19 21:26:33 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/part-system-id-9096
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/part-system-id-9096

Ed Bartosh (6):
  wic: add --system-id wks option
  wic: add sfdisk to the list of utilities
  wic: add system_id attribute to Partition
  wic: add system_id argument to Image.add_partition
  wic: set partition system id
  wic: add help for --system-id option

 scripts/lib/wic/help.py                |  4 ++++
 scripts/lib/wic/imager/direct.py       |  3 ++-
 scripts/lib/wic/ksparser.py            | 19 +++++++++++++++++++
 scripts/lib/wic/partition.py           |  1 +
 scripts/lib/wic/utils/oe/misc.py       |  1 +
 scripts/lib/wic/utils/partitionedfs.py |  9 +++++++--
 6 files changed, 34 insertions(+), 3 deletions(-)

--
Regards,
Ed


