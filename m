Return-Path: <SRS0=qdqA=5F=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9B4A160FF1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 17:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48kVxS4Fxjz40
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 18:23:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584725036;
	bh=eNCY0QngPo/5FovzZHSiZQ2S3UAzdqem0gIxMV7Mazo=;
	h=From:To:Subject:Date:From;
	b=I2khbtS/JAVBG1lo8kaoh7GsEckJTg2AtakOuhOC9pu2e2jv/47rXNjysL8JOB8OW
	+XZ4V+eUSY0CcQfVIypZ+EirK3B2unbkr5VfXWENgw3bdAyVYJqCLUWs2Ojaenn+1z
	YnUPffBJRAsXPXm9O0cXEF3LwUot16HN7vjCOtlxg35y7rmqpH1orp0D/baBghF4jn
	jD1eJ/JYrpNOzgmHTqsCUw+sF2lpJfeRdNaIQv4UtbhCn6WgVwEp+OZu+muiO+ZsxM
	rA6OjjaWMXxGlJFoFsovK6qN6DCoV38JbgMx1ymDJBegoQN+Xi2t63EjhWk+hmsidF
	qo141BtLFGE9Re6G9QmPlywPL6Zb+u9oG/elbk2I05x5yhEAs5vAWAxpcRKTzY96hX
	VC1d77+nAXpwQh+Ph/5r8FgdfQkETUtKs7BBfUM7J9nSxhAJkzBOOq+SNFyxQewi1C
	s9qagy47dlw5gPw43BqtO114CQ22RqIadnag6sIXQWphUDT/pBxVuVVcn77zUr9GTO
	SG58qTg9Rfl+zWgHKyRYfatZnC3balhkYTCkay4NOpwsBCvCs3nz4A+vtmo9mZgQCy
	lD+ZtLlbtGxmhQZj6rv627LOvd1EfZXbd8HnjqPhRcXmM87awTBVsOaMyCxAMp53Se
	YIgUBoSu8bSAzsW/Mam3yIJI=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 19:23:53 +0200
Message-Id: <20200320172354.9777-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [zeus][PATCH 1/2] e2fsprogs: fix CVE-2019-5188
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
X-List-Received-Date: Fri, 20 Mar 2020 17:23:59 -0000

From: Anuj Mittal <anuj.mittal@intel.com>

Also see:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=948508

(From OE-Core rev: 09bdcef183d885025da6aa87a7c2bf7e8268774e)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...-t-try-to-rehash-a-deleted-directory.patch | 49 ++++++++++++++++
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch   | 57 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.3.bb             |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
new file mode 100644
index 0000000000..ba4e3a3c97
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
@@ -0,0 +1,49 @@
+From 71ba13755337e19c9a826dfc874562a36e1b24d3 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 19 Dec 2019 19:45:06 -0500
+Subject: [PATCH] e2fsck: don't try to rehash a deleted directory
+
+If directory has been deleted in pass1[bcd] processing, then we
+shouldn't try to rehash the directory in pass 3a when we try to
+rehash/reoptimize directories.
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=71ba13755337e19c9a826dfc874562a36e1b24d3]
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+---
+ e2fsck/pass1b.c | 4 ++++
+ e2fsck/rehash.c | 2 ++
+ 2 files changed, 6 insertions(+)
+
+diff --git a/e2fsck/pass1b.c b/e2fsck/pass1b.c
+index 5693b9cf..bca701ca 100644
+--- a/e2fsck/pass1b.c
++++ b/e2fsck/pass1b.c
+@@ -705,6 +705,10 @@ static void delete_file(e2fsck_t ctx, ext2_ino_t ino,
+ 		fix_problem(ctx, PR_1B_BLOCK_ITERATE, &pctx);
+ 	if (ctx->inode_bad_map)
+ 		ext2fs_unmark_inode_bitmap2(ctx->inode_bad_map, ino);
++	if (ctx->inode_reg_map)
++		ext2fs_unmark_inode_bitmap2(ctx->inode_reg_map, ino);
++	ext2fs_unmark_inode_bitmap2(ctx->inode_dir_map, ino);
++	ext2fs_unmark_inode_bitmap2(ctx->inode_used_map, ino);
+ 	ext2fs_inode_alloc_stats2(fs, ino, -1, LINUX_S_ISDIR(dp->inode.i_mode));
+ 	quota_data_sub(ctx->qctx, &dp->inode, ino,
+ 		       pb.dup_blocks * fs->blocksize);
+diff --git a/e2fsck/rehash.c b/e2fsck/rehash.c
+index 3dd1e941..2c908be0 100644
+--- a/e2fsck/rehash.c
++++ b/e2fsck/rehash.c
+@@ -1028,6 +1028,8 @@ void e2fsck_rehash_directories(e2fsck_t ctx)
+ 			if (!ext2fs_u32_list_iterate(iter, &ino))
+ 				break;
+ 		}
++		if (!ext2fs_test_inode_bitmap2(ctx->inode_dir_map, ino))
++			continue;
+ 
+ 		pctx.dir = ino;
+ 		if (first) {
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
new file mode 100644
index 0000000000..de4bce0037
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch
@@ -0,0 +1,57 @@
+From 8dd73c149f418238f19791f9d666089ef9734dff Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 19 Dec 2019 19:37:34 -0500
+Subject: [PATCH] e2fsck: abort if there is a corrupted directory block when
+ rehashing
+
+In e2fsck pass 3a, when we are rehashing directories, at least in
+theory, all of the directories should have had corruptions with
+respect to directory entry structure fixed.  However, it's possible
+(for example, if the user declined a fix) that we can reach this stage
+of processing with a corrupted directory entries.
+
+So check for that case and don't try to process a corrupted directory
+block so we don't run into trouble in mutate_name() if there is a
+zero-length file name.
+
+Addresses: TALOS-2019-0973
+Addresses: CVE-2019-5188
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+CVE: CVE-2019-5188
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=8dd73c149f418238f19791f9d666089ef9734dff]
+---
+ e2fsck/rehash.c | 9 +++++++++
+ 1 file changed, 9 insertions(+)
+
+diff --git a/e2fsck/rehash.c b/e2fsck/rehash.c
+index a5fc1be1..3dd1e941 100644
+--- a/e2fsck/rehash.c
++++ b/e2fsck/rehash.c
+@@ -160,6 +160,10 @@ static int fill_dir_block(ext2_filsys fs,
+ 		dir_offset += rec_len;
+ 		if (dirent->inode == 0)
+ 			continue;
++		if ((name_len) == 0) {
++			fd->err = EXT2_ET_DIR_CORRUPTED;
++			return BLOCK_ABORT;
++		}
+ 		if (!fd->compress && (name_len == 1) &&
+ 		    (dirent->name[0] == '.'))
+ 			continue;
+@@ -401,6 +405,11 @@ static int duplicate_search_and_fix(e2fsck_t ctx, ext2_filsys fs,
+ 			continue;
+ 		}
+ 		new_len = ext2fs_dirent_name_len(ent->dir);
++		if (new_len == 0) {
++			 /* should never happen */
++			ext2fs_unmark_valid(fs);
++			continue;
++		}
+ 		memcpy(new_name, ent->dir->name, new_len);
+ 		mutate_name(new_name, &new_len);
+ 		for (j=0; j < fd->num_array; j++) {
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
index 14c05a446c..2014e68579 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
             file://CVE-2019-5094.patch \
+            file://CVE-2019-5188.patch \
+            file://0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.17.1


