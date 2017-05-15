Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 5DC6E71DEE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 14:20:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 15 May 2017 07:20:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,345,1491289200"; d="scan'208";a="968564184"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga003.jf.intel.com with ESMTP; 15 May 2017 07:20:03 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id E774B6A4080
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 07:19:47 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 16:57:31 +0300
Message-Id: <cover.1494856157.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/8] #11283: wic ls
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
X-List-Received-Date: Mon, 15 May 2017 14:20:02 -0000

Hi,

This is an implementation of new wic subcommand 'wic ls'.

It lists image partitions:

$ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic
Num     Start        End          Size      Fstype
1        1048576     24438783     23390208  fat16
2       25165824     50315263     25149440  ext4

or directory contents of vfat partitions:

$ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/boot
Volume in drive : is boot
 Volume Serial Number is 66EC-5750
Directory for ::/efi/boot

.            <DIR>     2017-05-15  13:00
..           <DIR>     2017-05-15  13:00
grub     cfg       639 2017-05-15  13:00
bootx64  efi    571392 2017-05-15  13:00
        4 files             572 031 bytes
                         15 818 752 bytes free

The patchset also fixes and extends sparse_copy API to support copying part of
the image (one partition) into another image.

It also contains test case for 'wic ls' functionality.

The following changes since commit ef814cc4db9dedad2ad81d756116af238288c2f9:

  create-pull-request: support format-patch options (2017-05-15 14:00:15 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (8):
  filemap: fix skip logic
  filemap: add parameter 'length' to sparse_copy
  bootimg-pcbios: make boot image file unique
  wic: add wic_init_parser_ls
  wic: add help and usage content for 'wic ls'
  wic: add 'wic ls' command
  engine: implement listing wic images
  selftest: add new test case test_wic_ls

 meta/lib/oeqa/selftest/wic.py                    | 18 +++++
 scripts/lib/wic/engine.py                        | 86 +++++++++++++++++++++++-
 scripts/lib/wic/filemap.py                       | 26 +++++--
 scripts/lib/wic/help.py                          | 65 ++++++++++++++++++
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  2 +-
 scripts/wic                                      | 40 +++++++++++
 6 files changed, 228 insertions(+), 9 deletions(-)

--
Regards,
Ed

