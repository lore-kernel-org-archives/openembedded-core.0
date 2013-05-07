Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UZeml-0003WG-BH
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 12:06:20 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r479mBkX011034
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 May 2013 02:48:11 -0700 (PDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 7 May 2013 02:48:11 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <dvhart@linux.intel.com>
Date: Tue, 7 May 2013 05:48:04 -0400
Message-ID: <cover.1367919920.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/4] replace genext2fs with populate-extfs.sh
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 May 2013 10:06:50 -0000
Content-Type: text/plain

* The benefits:
  - Really support ext4
  - Support the sparse file (the sparse file became into the common file before)
  - Have a uniform code for ext2/3/4 generation
  - Remove the depends on genext2fs-native

* Impact
  - Build time:
    a) If we build fresh core-image-sato, there is nearly no impact.
    b) If we do the image generation, which means:
       $ bitbake core-image-sato
       $ bitbake core-image-sato -ccleansstate
       $ bitbake core-image-sato
   About 50 extra seconds are needed, here is my test result:
   Before the patches: 4m25s
   After the patches: 5m17s
   This is because the genext2fs is much faster than the 
   populate-extfs.sh, we will replace this script by the mke2fs when it
   supports create the filesystem from a initial directory.

  - Disk space (take core-image-sato as an example)
    a) The image file size is the same as before (529M)
    b) The disk usage is a little different: (du -sh)
              before       now 
       ext2:  364M         388M
       ext3:  381M         404M
       ext4:  380M         387M

   We may need to adjust the IMAGE_OVERHEAD_FACTOR from 1.3 to 1.4.

   I have done some simple runtime testing on core-image-sato and 
   core-image-minimal, they worked well.

// Robert

The following changes since commit 3472c1f7ab409cd91c1d4782d9e00880b84e3ae8:

  grub-efi-native: Cleanup whitespace (2013-05-03 16:37:05 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/ext4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/ext4

Robert Yang (4):
  e2fsprogs: the max length of debugfs argument is too short
  e2fsprogs: let debugfs do sparse copy
  e2fsprogs: add populate-extfs.sh
  image_types.bbclass: replace genext2fs with populate-extfs.sh

 meta/classes/image_types.bbclass                   |   46 ++++----
 .../e2fsprogs-1.42.7/debugfs-too-short.patch       |   28 +++++
 .../e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh   |   93 ++++++++++++++++
 .../e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch   |  114 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.7.bb |    4 +
 5 files changed, 257 insertions(+), 28 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/debugfs-too-short.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/populate-extfs.sh
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.7/sparse_copy.patch

-- 
1.7.10.4



