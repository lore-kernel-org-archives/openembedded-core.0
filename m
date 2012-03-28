Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dexuan.cui@intel.com>) id 1SCwDr-0006S1-Dw
	for openembedded-core@lists.openembedded.org;
	Wed, 28 Mar 2012 18:59:47 +0200
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 28 Mar 2012 09:50:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="82665953"
Received: from dcui-desktop.sh.intel.com ([10.239.36.12])
	by AZSMGA002.ch.intel.com with ESMTP; 28 Mar 2012 09:50:43 -0700
From: Dexuan Cui <dexuan.cui@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 Mar 2012 00:51:06 +0800
Message-Id: <cover.1332952962.git.dexuan.cui@intel.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH 0/1] genext2fs: support large files and filesystems without using large amounts of memor
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 28 Mar 2012 16:59:47 -0000

Hi RP, Saul, Paul, Darren, Mark, Josh and joaohf and all, please comment.

Let's figure out if this big patch is accepatable or not...

With this patch, I can successfully create a 8.5GB .ext3 file with genext2fs.
The speed is slow -- I spent about 1.5 hours.

The following changes since commit 265903bdffb10c95ceaf7a892151a50b67939c71:

  procps: don't print error message with kernel 3.0+ (2012-03-28 10:16:30 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib dcui/master
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=dcui/master

Dexuan Cui (1):
  genext2fs: support large files and  filesystems without using large
    amounts of memory

 ...01-Fix-warnings-remove-some-unused-macros.patch |   70 ++
 .../0002-Add-put_blk-and-put_nod-routines.patch    | 1121 ++++++++++++++++++++
 .../0003-Add-get_blkmap-and-put_blkmap.patch       |  220 ++++
 ...lker-for-walking-through-directory-entrie.patch |  355 +++++++
 ...05-Make-filesystem-struct-not-an-overloay.patch |  372 +++++++
 ...0006-Improve-the-efficiency-of-extend_blk.patch |  270 +++++
 ...ove-hdlinks-into-the-filesystem-structure.patch |  173 +++
 ...t-the-creation-of-the-filesystem-structur.patch |   93 ++
 ...e-byte-swapping-into-the-get-put-routines.patch |  419 ++++++++
 ...rt-over-to-keeping-the-filesystem-on-disk.patch |  837 +++++++++++++++
 ...les-into-the-filesystem-a-piece-at-a-time.patch |  101 ++
 ...upport-large-file-support-and-rework-hole.patch |  209 ++++
 .../0013-Add-volume-id-support.patch               |   84 ++
 ...014-Remove-unneeded-setting-of-s_reserved.patch |   26 +
 ...-Rework-creating-the-lost-found-directory.patch |   55 +
 ...ix-the-documentation-for-the-new-L-option.patch |   27 +
 .../0017-Fix-file-same-comparison.patch            |   28 +
 ...andle-files-changing-while-we-are-working.patch |   87 ++
 ...ke-sure-superblock-is-clear-on-allocation.patch |   40 +
 .../genext2fs-1.4.1/fix-nbblocks-cast.patch        |   18 +-
 .../genext2fs/genext2fs-1.4.1/update_to_1.95.patch |  119 +++
 meta/recipes-devtools/genext2fs/genext2fs_1.4.1.bb |   24 +-
 22 files changed, 4738 insertions(+), 10 deletions(-)
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0001-Fix-warnings-remove-some-unused-macros.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0002-Add-put_blk-and-put_nod-routines.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0003-Add-get_blkmap-and-put_blkmap.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0004-Add-a-dirwalker-for-walking-through-directory-entrie.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0005-Make-filesystem-struct-not-an-overloay.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0006-Improve-the-efficiency-of-extend_blk.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0007-Move-hdlinks-into-the-filesystem-structure.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0008-Separate-out-the-creation-of-the-filesystem-structur.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0009-Move-byte-swapping-into-the-get-put-routines.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0010-Convert-over-to-keeping-the-filesystem-on-disk.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0011-Copy-files-into-the-filesystem-a-piece-at-a-time.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0012-Add-rev-1-support-large-file-support-and-rework-hole.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0013-Add-volume-id-support.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0014-Remove-unneeded-setting-of-s_reserved.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0015-Rework-creating-the-lost-found-directory.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0016-Fix-the-documentation-for-the-new-L-option.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0017-Fix-file-same-comparison.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0018-Handle-files-changing-while-we-are-working.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/0019-Make-sure-superblock-is-clear-on-allocation.patch
 create mode 100644 meta/recipes-devtools/genext2fs/genext2fs-1.4.1/update_to_1.95.patch

-- 
1.7.6



