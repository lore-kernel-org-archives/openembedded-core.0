Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id CA0F27810D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 14:47:03 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	25 May 2017 07:47:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,391,1491289200"; d="scan'208";a="861245776"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 25 May 2017 07:47:01 -0700
Received: from vmed.fi.intel.com (vmed.fi.intel.com [10.237.72.38])
	by linux.intel.com (Postfix) with ESMTP id 09296580394
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 May 2017 07:47:00 -0700 (PDT)
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 25 May 2017 17:46:17 +0300
Message-Id: <cover.1495722660.git.ed.bartosh@linux.intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 00/11] This is an implementation of new wic subcommand 'wic cp'.
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
X-List-Received-Date: Thu, 25 May 2017 14:47:05 -0000

Hi,

'wic cp' command copies files and directories to the vfat partition of the wic image.

Here are couple of examples:

Copy file to the root directory of the vfat partition:
    $ wic cp test.wks tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
    $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1
        Volume in drive : is boot
         Volume Serial Number is DB4C-FD4C
        Directory for ::/

        efi          <DIR>     2017-05-24  18:15
        loader       <DIR>     2017-05-24  18:15
        startup  nsh        26 2017-05-24  18:15
        vmlinuz        6926384 2017-05-24  18:15
        test     wks       628 2017-05-24  21:22
                5 files           6 927 038 bytes
                                 15 677 440 bytes free

Copy directory to the efi subdirectory of the vfat partition:
   $ wic cp test tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/efi/
   $ wic ls tmp/deploy/images/qemux86-64/core-image-minimal-qemux86-64.wic:1/eti/
       Volume in drive : is boot
        Volume Serial Number is DB4C-FD4C
       Directory for ::/efi

       .            <DIR>     2017-05-24  18:15
       ..           <DIR>     2017-05-24  18:15
       boot         <DIR>     2017-05-24  18:15
       test         <DIR>     2017-05-24  21:27
               4 files                   0 bytes
                                15 675 392 bytes free


The patchset also contains fixes for sparse_copy bugs discuvered in the
process of working on 'wic cp' functionality.

It also contains test case for 'wic cp' command.

The following changes since commit ae4b01e75618030f3fa0a592c6dffddb2fdab3b5:

  selftest: add new test case test_wic_ls (2017-05-25 17:30:03 +0300)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib ed/wic/wip
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=ed/wic/wip

Ed Bartosh (11):
  wic: add wic_init_parser_cp
  wic: add help and usage content for 'wic cp'
  wic: add 'wic cp' command
  wic: add Disk._prop helper
  wic: add mcopy property
  filemap: change signature of sparse_copy function
  filemap: check if dest is written for every block
  filemap: calculate dst size correctly
  wic: add Disk._put_part_image method
  wic: fully implement 'wic cp'
  selftest: add test_wic_cp test case

 meta/lib/oeqa/selftest/wic.py            | 46 +++++++++++++++++++++++-
 scripts/lib/wic/engine.py                | 41 ++++++++++++++++++---
 scripts/lib/wic/filemap.py               | 28 ++++++++++++---
 scripts/lib/wic/help.py                  | 62 ++++++++++++++++++++++++++++++++
 scripts/lib/wic/plugins/imager/direct.py |  2 +-
 scripts/wic                              | 29 +++++++++++++++
 6 files changed, 197 insertions(+), 11 deletions(-)

--
Regards,
Ed

