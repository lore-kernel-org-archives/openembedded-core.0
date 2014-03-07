Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C705C6EABD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s276xaqv017115
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:38 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:36 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:21 -0500
Message-ID: <cover.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 00/14] use "mke2fs -d" to create the ext2/3/4 image
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:39 -0000
Content-Type: text/plain

Benefits:
* The "mke2fs -d" is more faster than populate-extfs.sh, it will save about 25
  seconds for a core-image-sato rootfs from my testing.

* Will fix these bugs:
  5901: Error at rootfs time if 'ptest-pkgs' is in IMAGE_FEATURES
  5797: populate-extfs.sh: problem with large images
  5712: /var/lib/opkg/alternatives/[[: File not found by ext2_lookup

NOTE:
* These patches have been merged into e2fsprogs's next branch, we can
  drop them when the new e2fsprogs releases and we upgrade it. It is a
  little different from the upstream since I've fixed it a little
  according to the feedback.

* Thanks for Darren's great help.

// Robert

The following changes since commit c6825ec6e92e20bb64a051d1576f363c16e98d68:

  recipes: bump PRs (2014-03-05 17:26:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/e2fs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/e2fs

Robert Yang (14):
  e2fsprogs: mke2fs: add the ability to copy files from a given
    directory
  e2fsprogs: mke2fs: copy files recursively
  e2fsprogs: mke2fs: create special file
  e2fsprogs: mke2fs: create symlink
  e2fsprogs: mke2fs: copy regular file
  e2fsprogs: mke2fs: create directory
  e2fsprogs: mke2fs: set owner/mode/time for the inode
  e2fsprogs: mke2fs: add an option: -d root-directory
  e2fsprogs: mke2fs: handle hardlinks
  e2fsprogs: debugfs: use the functions in misc/create_inode.c
  e2fsprogs: mke2fs: update the manual for the -d option
  e2fsprogs: enable the "-d" related patches
  image_types.bbclass: use mke2fs -d to create the ext2/3/4 image
  e2fsprogs: populate-extfs.sh: remove it

 meta/classes/image_types.bbclass                   |    3 +-
 ...the-ability-to-copy-files-from-a-given-di.patch |   98 ++++
 ...isc-create_inode.c-copy-files-recursively.patch |  135 ++++++
 ...3-misc-create_inode.c-create-special-file.patch |  103 ++++
 .../0004-misc-create_inode.c-create-symlink.patch  |   63 +++
 ...005-misc-create_inode.c-copy-regular-file.patch |  224 +++++++++
 ...0006-misc-create_inode.c-create-directory.patch |   62 +++
 ..._inode.c-set-owner-mode-time-for-the-inod.patch |   81 ++++
 ...8-mke2fs.c-add-an-option-d-root-directory.patch |  168 +++++++
 ...0009-misc-create_inode.c-handle-hardlinks.patch |  210 +++++++++
 ...-use-the-functions-in-misc-create_inode.c.patch |  496 ++++++++++++++++++++
 ...s.8.in-update-the-manual-for-the-d-option.patch |   43 ++
 .../e2fsprogs/e2fsprogs/populate-extfs.sh          |   96 ----
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |   13 +-
 14 files changed, 1695 insertions(+), 100 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0002-misc-create_inode.c-copy-files-recursively.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0003-misc-create_inode.c-create-special-file.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0005-misc-create_inode.c-copy-regular-file.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0008-mke2fs.c-add-an-option-d-root-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0010-debugfs-use-the-functions-in-misc-create_inode.c.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/populate-extfs.sh

-- 
1.7.10.4


