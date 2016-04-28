Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id BFBAD76710
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 13:18:25 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 28 Apr 2016 06:18:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,546,1455004800"; d="scan'208";a="93611714"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 28 Apr 2016 06:18:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.51])
	by linux.intel.com (Postfix) with ESMTP id 048306A4007
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Apr 2016 07:05:38 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Apr 2016 13:58:03 +0300
Message-Id: <cover.1461834510.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [wic][PATCH v2 0/8] make wic images sparse (#9099)
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
X-List-Received-Date: Thu, 28 Apr 2016 13:18:25 -0000

Hi,

This patchset is a preparation for bmaptool support for wic. Using bmaptool
makes sense only if images are sparsed and this is what's implemented here.

Nice side effect of this work is that making images sparse not only makes
flashing faster. It also makes the process of assembling an image much faster.

Here is how it works:
- wic from master branch spends 36 sec to create an image:
$ time wic create test.wks -e core-image-minimal -o img/
...
real    0m36.878s
user    2m0.496s
sys     0m18.444s

- sparse-aware wic spends 8 seconds to create the same image:
$ time wic create test.wks -e core-image-minimal -o img/
...
real    0m8.672s
user    0m7.292s
sys     0m1.212s

The final image is very sparse, which explains why sparse-aware wic is so fast:
$ ls -lhs img/build/test-201604281219-sda.direct
28M -rw-r--r-- 1 ed users 2.4G Apr 28 12:19 img/build/test-201604281219-sda.direct

bmaptool reports 1.1% of mapped blocks:
$ PATH=tmp/sysroots/x86_64-linux/usr/bin/ bmaptool create img/build/test-201604281219-sda.direct -o img/build/test-201604281219-sda.direct.bmap
$ grep 'mapped blocks' img/build/test-201604281219-sda.direct.bmap
    <!-- Count of mapped blocks: 27.2 MiB or 1.1%    -->

Flashing is also a lot faster with bmaptool comparing to using dd:

time PATH=./tmp/sysroots/x86_64-linux/usr/bin/ bmaptool copy img/build/test-201604281606-sda.direct /dev/sdb
bmaptool: info: discovered bmap file 'img/build/test-201604281606-sda.direct.bmap'
bmaptool: info: block map format version 2.0
bmaptool: info: 605696 blocks of size 4096 (2.3 GiB), mapped 6986 blocks (27.3 MiB or 1.2%)
bmaptool: info: copying image 'test-201604281606-sda.direct' to block device '/dev/sdb' using bmap file 'test-201604281606-sda.direct.bmap'
bmaptool: info: 100% copied
bmaptool: info: synchronizing '/dev/sdb'
bmaptool: info: copying time: 1.5s, copying speed 17.9 MiB/sec

real    0m1.621s
user    0m0.225s
sys     0m0.089s

time dd if=img/build/test-201604281606-sda.direct of=/dev/sdb bs=4M
591+1 records in
591+1 records out
2480930816 bytes (2.5 GB) copied, 107.483 s, 23.1 MB/s

real    1m47.485s
user    0m0.001s
sys     0m4.324s

The following changes since commit 111f44cacf25799dc296b8e300b571d798067fdc:

  selftest: add bmap test (2016-04-27 12:26:59 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/sparse-9099
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/sparse-9099

Ed Bartosh (8):
  wic: use truncate utility to create sparse files
  wic: get rid of inheritance Disk->DiskImage
  wic: get rid of fs_related.makedirs
  wic: moved DiskImage to direct.py
  wic: add FIEMAP and SEEK_HOLE / SEEK_DATA APIs
  wic: add sparse_copy API
  wic: use sparse_copy to copy partitions
  wic: use sparse_copy to preserve sparseness

 scripts/lib/wic/filemap.py                | 561 ++++++++++++++++++++++++++++++
 scripts/lib/wic/imager/direct.py          |  23 +-
 scripts/lib/wic/partition.py              |  20 +-
 scripts/lib/wic/plugins/source/rawcopy.py |   7 +-
 scripts/lib/wic/utils/fs_related.py       |  84 -----
 scripts/lib/wic/utils/partitionedfs.py    |   6 +-
 6 files changed, 592 insertions(+), 109 deletions(-)
 create mode 100644 scripts/lib/wic/filemap.py
 delete mode 100644 scripts/lib/wic/utils/fs_related.py

--
Regards,
Ed


