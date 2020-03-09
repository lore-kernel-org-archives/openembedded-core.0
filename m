Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E306261809
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 00:45:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2020 17:45:08 -0700
X-IronPort-AV: E=Sophos;i="5.70,530,1574150400"; d="scan'208";a="245196892"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.141.167])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2020 17:45:08 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 08:45:01 +0800
Message-Id: <20200309004502.4096343-2-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309004502.4096343-1-anuj.mittal@intel.com>
References: <20200309004502.4096343-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/3] e2fsprogs: fix CVE-2019-5188
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
X-List-Received-Date: Mon, 09 Mar 2020 00:45:08 -0000
Content-Transfer-Encoding: 8bit

Also see:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=948508

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...-t-try-to-rehash-a-deleted-directory.patch | 49 ++++++++++++++++
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch   | 57 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.4.bb             |  2 +
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index 6e69eea21c..fc92b77ab6 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -7,6 +7,8 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
            file://0001-configure.ac-correct-AM_GNU_GETTEXT.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
+           file://CVE-2019-5188.patch \
+           file://0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.24.1


