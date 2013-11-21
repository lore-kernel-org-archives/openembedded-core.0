Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4C8806D4ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7E7XY013396
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:07 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:06 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:46 -0600
Message-ID: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 00/12] ext2/3/4 image generation optimization
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:08 -0000
Content-Type: text/plain

At Wind River we've been using and testing this change for the last couple
of months.  I'm not sure it's ready for inclusion ues in oe-core, but the
patches have been sent to the ext4 maintainer.  (Robert can further clarify
if there are any questions.)

Robert Yang (12):
  e2fsprogs/mke2fs: add an option: -d root-directory
  e2fsprogs/mke2fs: misc/util.c: implement populate_fs()
  e2fsprogs/mke2fs: create special file
  e2fsprogs/mke2fs: create symlink
  e2fsprogs/mke2fs: copy regular file
  e2fsprogs/mke2fs: create directory
  e2fsprogs/mke2fs: set more information for inode
  e2fsprogs/mke2fs: handle hardlinks
  e2fsprogs/mke2fs: update the manual for the -d option
  e2fsprogs/mke2fs: debugfs: use the functions in misc/util.c (re-add
    after revert)
  e2fsprogs: enable the "-d" related patches
  image_types.bbclass: use mke2fs -d to create the ext2/3/4 image

 meta/classes/image_types.bbclass                   |   3 +-
 ...1-mke2fs.c-add-an-option-d-root-directory.patch | 206 ++++++++++
 .../0002-misc-util.c-implement-populate_fs.patch   | 120 ++++++
 .../0003-misc-util.c-create-special-file.patch     |  98 +++++
 .../0004-misc-util.c-create-symlink.patch          |  62 +++
 .../0005-misc-util.c-copy-regular-file.patch       | 221 ++++++++++
 .../0006-misc-util.c-create-directory.patch        |  62 +++
 ...isc-util.c-set-more-information-for-inode.patch |  79 ++++
 .../0008-misc-util.c-handle-hardlinks.patch        | 145 +++++++
 ...s.8.in-update-the-manual-for-the-d-option.patch |  40 ++
 ...-debugfs-use-the-functions-in-misc-util.c.patch | 449 +++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |  10 +
 12 files changed, 1493 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0001-mke2fs.c-add-an-option-d-root-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0002-misc-util.c-implement-populate_fs.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0003-misc-util.c-create-special-file.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0004-misc-util.c-create-symlink.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0005-misc-util.c-copy-regular-file.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0006-misc-util.c-create-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0007-misc-util.c-set-more-information-for-inode.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0008-misc-util.c-handle-hardlinks.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0009-mke2fs.8.in-update-the-manual-for-the-d-option.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0010-debugfs-use-the-functions-in-misc-util.c.patch

-- 
1.8.1.2.545.g2f19ada


