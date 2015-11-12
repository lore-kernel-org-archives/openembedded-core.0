Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E4783771AF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 03:14:08 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id tAC3E87U013583
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Nov 2015 19:14:08 -0800
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Wed, 11 Nov 2015 19:14:07 -0800
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Nov 2015 11:04:06 +0800
Message-ID: <1447297446-18024-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH][v2] e2fsprogs: fix the ptest
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
X-List-Received-Date: Thu, 12 Nov 2015 03:14:12 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

1. a hard-coded path in ptest is used, fix it.
2. fix the m_bigjournal ptest failure by resetting cache goal properly
3. fix the removal test.log error by adding the correct path before
test.log

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 .../e2fsprogs/e2fsprogs/0001-reset-last_goal.patch | 51 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs/run-ptest |  2 +-
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  2 +
 3 files changed, 54 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-reset-last_goal.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-reset-last_goal.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-reset-last_goal.patch
new file mode 100644
index 0000000..864e01e
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-reset-last_goal.patch
@@ -0,0 +1,51 @@
+reset last_goal when ext2fs_extent_node_split is called.
+
+Upstream-Status: Inappropriate
+
+cache_inode.patch speeds up the making ext* filesystem, but it leads
+to the m_bigjournal ptest failure; In fact, when ext2fs_extent_node_split 
+is called, the cache goal should be reset
+
+the patch fixes the m_bigjournal ptest failure, and does not lost the
+speed.
+
+Signed-off-by: Roy Li <rongqing.li@windriver.com>
+---
+ lib/ext2fs/alloc.c  | 2 +-
+ lib/ext2fs/extent.c | 3 +++
+ 2 files changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/lib/ext2fs/alloc.c b/lib/ext2fs/alloc.c
+index 830fc22..5bab9db 100644
+--- a/lib/ext2fs/alloc.c
++++ b/lib/ext2fs/alloc.c
+@@ -160,7 +160,7 @@ errcode_t ext2fs_new_inode(ext2_filsys fs, ext2_ino_t dir,
+ 	return 0;
+ }
+ 
+-static blk64_t last_goal = 0;
++blk64_t last_goal = 0;
+ 
+ /*
+  * Stupid algorithm --- we now just search forward starting from the
+diff --git a/lib/ext2fs/extent.c b/lib/ext2fs/extent.c
+index 5cdc2e4..044a17a 100644
+--- a/lib/ext2fs/extent.c
++++ b/lib/ext2fs/extent.c
+@@ -819,6 +819,8 @@ errcode_t ext2fs_extent_replace(ext2_extent_handle_t handle,
+  *
+  * handle will be left pointing at original record.
+  */
++extern blk64_t last_goal;
++
+ errcode_t ext2fs_extent_node_split(ext2_extent_handle_t handle)
+ {
+ 	errcode_t			retval = 0;
+@@ -936,6 +938,7 @@ errcode_t ext2fs_extent_node_split(ext2_extent_handle_t handle)
+ 			group = group & ~((1 << (log_flex)) - 1);
+ 		goal_blk = ext2fs_group_first_block2(handle->fs, group);
+ 	}
++	last_goal = goal_blk;
+ 	retval = ext2fs_alloc_block2(handle->fs, goal_blk, block_buf,
+ 				    &new_node_pblk);
+ 	if (retval)
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
index 1ac2513..e02fc7f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/run-ptest
@@ -5,7 +5,7 @@ cd ./test
 if [ $? -eq 0 ]
 then
 	echo "PASS: e2fsprogs"
-	rm test.log
+	rm ../test.log
 else
 	echo "FAIL: e2fsprogs"
 fi
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index ce7d2e8..c021306 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -24,6 +24,7 @@ SRC_URI += "file://acinclude.m4 \
             file://CVE-2015-0247.patch \
             file://0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch \
             file://copy-in-create-hardlinks-with-the-correct-directory-.patch \
+            file://0001-reset-last_goal.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
@@ -114,4 +115,5 @@ do_install_ptest() {
 	cp -a ${B}/tests ${D}${PTEST_PATH}/test
 	cp -a ${S}/tests/* ${D}${PTEST_PATH}/test
 	sed -e 's!../e2fsck/e2fsck!e2fsck!g' -i ${D}${PTEST_PATH}/test/*/expect*
+	sed -e 's!/usr/lib/e2fsprogs/ptest!${PTEST_PATH}!g' -i ${D}${PTEST_PATH}/test/test_*
 }
-- 
1.9.1


