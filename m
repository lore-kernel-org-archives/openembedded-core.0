Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id B6A9A608A6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:13:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7MDDKm3018680
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 06:13:20 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 06:13:17 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 09:13:08 -0400
Message-ID: <cover.1377175027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 0/6] replace genext2fs with populate-extfs.sh
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
X-List-Received-Date: Thu, 22 Aug 2013 13:13:18 -0000
Content-Type: text/plain

* The benefits:
  - Really support ext4
  - Support the sparse file (we lost the sparse file in the image in the
    past, the sparse file became into the common file)
  - Fix the error reported by fsck: (ext2/ext3)
     "Inode 1025, i_size is 16384, should be 17408."
  - Have a uniform code for ext2/3/4 generation

* Impact
  - Build time:
    a) If we build fresh core-image-sato, there is nearly no impact.

    b) If we do the image generation, which means:
       $ bitbake core-image-sato
       $ bitbake core-image-sato -ccleansstate
       $ bitbake core-image-sato
   About 40 extra seconds are needed, here is my test result:
   Before the patches: 4m53s
   After the patches: 5m35s
   This is because the genext2fs is much faster than the 
   populate-extfs.sh, we will replace this script by the mke2fs when it
   supports create the filesystem from a initial directory.

  - Disk space (take core-image-sato as an example)
    a) The image file size is the same as before (519M)

    b) The disk usage is a little different: (du -sh)
              before       now 
       ext2:  356M         379M
       ext3:  372M         395M
       ext4:  372M         380M

   I have done some simple runtime testing on core-image-sato based on
   ext2/3/4, they worked well.

* The "fsck.extX -fn <image>.extX" shows it is OK.

// Robert

The following changes since commit b2ff1add530b1fec2fb7f385227a03db47015c37:

  poky.conf: Don't force the addition of extra DISTRO_FEATURES (2013-08-20 22:58:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/extX
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/extX

Robert Yang (6):
  e2fsprogs: the max length of debugfs argument is too short
  e2fsprogs: let debugfs do sparse copy
  e2fsprogs: only update the icache for ext2_inode
  e2fsprogs: properly set up extent header in do_write
  e2fsprogs: add populate-extfs.sh
  image_types.bbclass: replace genext2fs with populate-extfs.sh

 meta/classes/image_types.bbclass                   |   46 +++---
 .../e2fsprogs-1.42.8/debugfs-extent-header.patch   |   47 +++++++
 .../e2fsprogs-1.42.8/debugfs-sparse-copy.patch     |  147 ++++++++++++++++++++
 .../e2fsprogs-1.42.8/debugfs-too-short.patch       |   41 ++++++
 .../e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch    |   69 +++++++++
 .../e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh   |   96 +++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    6 +
 7 files changed, 424 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-sparse-copy.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-too-short.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/fix-icache.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/populate-extfs.sh

-- 
1.7.10.4


