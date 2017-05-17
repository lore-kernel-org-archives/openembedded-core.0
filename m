Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id D422C77DC8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 13:40:00 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 May 2017 06:40:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,354,1491289200"; d="scan'208";a="1148910888"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga001.fm.intel.com with ESMTP; 17 May 2017 06:40:00 -0700
Received: from vmed.fi.intel.com (crosswalk-testmaster.fi.intel.com
	[10.237.72.36])
	by linux.intel.com (Postfix) with ESMTP id 138956A4082
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 May 2017 06:39:44 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 17 May 2017 13:39:45 +0000
Message-Id: <cover.1495028274.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH v2 0/8] #11283: wic ls
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
X-List-Received-Date: Wed, 17 May 2017 13:40:01 -0000

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

Changes in v2: used mtools from sysroot in the test as oe-selftest failed
               trying to use host mtools

The following changes since commit b852248822868b543e6bec8c4dbea6d43eb55f1b:

  image_types_wic: schedule prepare_wic_build correctly (2017-05-17 13:35:31 +0000)

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

 meta/lib/oeqa/selftest/wic.py                    | 20 ++++++
 scripts/lib/wic/engine.py                        | 86 +++++++++++++++++++++++-
 scripts/lib/wic/filemap.py                       | 26 +++++--
 scripts/lib/wic/help.py                          | 65 ++++++++++++++++++
 scripts/lib/wic/plugins/source/bootimg-pcbios.py |  2 +-
 scripts/wic                                      | 40 +++++++++++
 6 files changed, 230 insertions(+), 9 deletions(-)

-- 
2.12.0


