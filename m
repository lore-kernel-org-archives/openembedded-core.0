Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1377E736B6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Nov 2015 05:06:48 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tAA56mgK027408
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 9 Nov 2015 21:06:48 -0800 (PST)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 9 Nov 2015 21:06:47 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 10 Nov 2015 12:56:57 +0800
Message-ID: <1447131417-29782-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: fix the ptest
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
X-List-Received-Date: Tue, 10 Nov 2015 05:06:49 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. a hard-coded path in ptest is used, fix it.
2. fix the cache_inode.patch, the m_bigjournal test case show it has
a off-by-one issue

  /usr/lib64/e2fsprogs/ptest/test# ./test_one m_big
  m_bigjournal: journal over 4GB in size: failed
  /usr/lib64/e2fsprogs/ptest/test#
  /usr/lib64/e2fsprogs/ptest/test# cat m_bigjournal
  m_bigjournal.1.log   m_bigjournal.failed
  .failed _Gaming_Socketed_GT3-1:/usr/lib64/e2fsprogs/ptest/test# cat m_bigjournal.
  --- m_bigjournal/expect.1	2015-11-09 08:33:14.000000000 +0000
  +++ m_bigjournal.1.log	2015-11-10 02:42:08.337571000 +0000
  @@ -52,8 +52,8 @@
     Reserved GDT blocks at 2-672
     Block bitmap at 673 (+673), Inode bitmap at 1185 (+1185)
     Inode table at 1697-1697 (+1697)
  -  31836 free blocks, 5 free inodes, 2 directories, 5 unused inodes
  -  Free blocks: 764-1184, 1269-1696, 1781-32767
  +  31837 free blocks, 5 free inodes, 2 directories, 5 unused inodes
  +  Free blocks: 763-1184, 1269-1696, 1781-32767
     Free inodes: 12-16
   Group 1: (Blocks 32768-65535) [INODE_UNINIT]
     Backup superblock at 32768, Group descriptors at 32769-32769
  @@ -542,8 +542,8 @@
   Group 79: (Blocks 2588672-2621439) [INODE_UNINIT]
     Block bitmap at 752 (bg #0 + 752), Inode bitmap at 1264 (bg #0 + 1264)
     Inode table at 1776-1776 (bg #0 + 1776)
  -  30047 free blocks, 16 free inodes, 0 directories, 16 unused inodes
  -  Free blocks: 2591393-2621439
  +  30046 free blocks, 16 free inodes, 0 directories, 16 unused inodes
  +  Free blocks: 2591394-2621439
     Free inodes: 1265-1280
   Group 80: (Blocks 2621440-2654207) [INODE_UNINIT, BLOCK_UNINIT]
     Block bitmap at 753 (bg #0 + 753), Inode bitmap at 1265 (bg #0 + 1265)
  /usr/lib64/e2fsprogs/ptest/test#

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch | 2 +-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb         | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
index f9ef8e5..4de78e5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/cache_inode.patch
@@ -37,7 +37,7 @@ Index: e2fsprogs-1.42.9/lib/ext2fs/alloc.c
  	int	c_ratio;
  
 +        if (!goal)
-+            goal = last_goal;
++            goal = last_goal - 1 >= 0; last_goal - 1, 0;
 +
  	EXT2_CHECK_MAGIC(fs, EXT2_ET_MAGIC_EXT2FS_FILSYS);
  
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index ce7d2e8..a7b9816 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -114,4 +114,5 @@ do_install_ptest() {
 	cp -a ${B}/tests ${D}${PTEST_PATH}/test
 	cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
+	sed -e 's!/usr/lib/e2fsprogs/ptest!${PTEST_PATH}!g' -i ${D}${PTEST_PATH}/test/test_*
 }
-- 
1.9.1


