Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:55 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: SHWoadT6+Dy16OW/FPwUc1zxJvP5r56+vTLT/QhzJCMjI/J1DXswq0cc03rK9BMVbfp1dSiZeB
 /uRYDDGb1Pmw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:56 -0700
IronPort-SDR: ibbcEwzD2Ochb1rgx6YGpwj8YjkYVHcUHTRsEGR5sxSY4D/yS00Rhx9mOcQhztOJXbjf3dogGM
 SE95Bd5VA2yA==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621856"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:54 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 5/9] e2fsprogs: fix CVE-2019-5188
Date: Thu, 26 Mar 2020 16:53:32 +0800
Message-Id: <b3fcf13e332d8830e759ef4161161f0e54591700.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>

Also see:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=948508

(From OE-Core rev: 09bdcef183d885025da6aa87a7c2bf7e8268774e)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...k-don-t-try-to-rehash-a-deleted-directory.patch | 49 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs/CVE-2019-5188.patch        | 57 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb |  2 +
 3 files changed, 108 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2019-5188.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch
new file mode 100644
index 0000000..ba4e3a3
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
index 0000000..de4bce0
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
index 14c05a4..2014e68 100644
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
2.7.4

