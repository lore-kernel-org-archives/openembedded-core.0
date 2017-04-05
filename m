Return-Path: <d.schultz@phytec.de>
Received: from root.phytec.de (mail.x-arc.de [217.6.246.34])
	by mail.openembedded.org (Postfix) with ESMTP id 2A09A77AB3
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 12:48:57 +0000 (UTC)
Received: from idefix.phytec.de (idefix.phytec.de [172.16.0.10])
	by root.phytec.de (Postfix) with ESMTP id 39648A00AD4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Apr 2017 14:49:35 +0200 (CEST)
Received: from augenblix.phytec.de ([172.16.0.56])
	by idefix.phytec.de (IBM Domino Release 9.0.1FP7)
	with ESMTP id 2017040514485757-450210 ;
	Wed, 5 Apr 2017 14:48:57 +0200 
From: Daniel Schultz <d.schultz@phytec.de>
To: openembedded-core@lists.openembedded.org
Date: Wed, 5 Apr 2017 14:48:57 +0200
Message-Id: <1491396537-41431-1-git-send-email-d.schultz@phytec.de>
X-Mailer: git-send-email 1.9.1
X-MIMETrack: Itemize by SMTP Server on Idefix/Phytec(Release 9.0.1FP7|August
	17, 2016) at 05.04.2017 14:48:57,
	Serialize by Router on Idefix/Phytec(Release 9.0.1FP7|August  17,
	2016) at 05.04.2017 14:48:57,
	Serialize complete at 05.04.2017 14:48:57
X-TNEFEvaluated: 1
Subject: [PATCH morty] e2fsprogs: Fix wrong error code after optimization
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
X-List-Received-Date: Wed, 05 Apr 2017 12:48:58 -0000

fsck.ext will return an error code of 1 if a file systems was checked
and successfully repaired. Even when an optimization was performed it
will return this error code.

This patch will change the error code to 0 if only optimizations had
changed the file systems.

The reason for this patch is a question I asked at the ext4 ML:
http://www.spinics.net/lists/linux-ext4/msg55700.html

Backport from git://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git
    Based on commit bf9f3b6d5b10d19218b4ed904c12b22e36ec57dd

Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
---
 ...-with-exit-status-0-if-no-errors-were-fix.patch | 285 +++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb  |   1 +
 2 files changed, 286 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
new file mode 100644
index 0000000..44f3888
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
@@ -0,0 +1,285 @@
+From b9bb77a0dd712f06b262a12766972b99cd801269 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Thu, 16 Feb 2017 22:02:35 -0500
+Subject: [PATCH] e2fsck: exit with exit status 0 if no errors were fixed
+
+Previously, e2fsck would exit with a status code of 1 even though the
+only changes that it made to the file system were various
+optimziations and not fixing file system corruption.  Since the man
+page states that an exit status of 1 means "file system errors
+corrupted", fix e2fsck to return an exit status of 0.
+
+Upstream-Status: Backport
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
+
+Conflicts:
+	e2fsck/e2fsck.conf.5.in
+---
+ e2fsck/e2fsck.conf.5.in                     | 34 +++++++++++++++++++++++++++++
+ e2fsck/journal.c                            |  1 +
+ e2fsck/problem.c                            |  8 ++++---
+ e2fsck/problemP.h                           |  1 +
+ e2fsck/unix.c                               | 20 +++++++++++++----
+ tests/f_collapse_extent_tree/expect.1       |  2 +-
+ tests/f_compress_extent_tree_level/expect.1 |  2 +-
+ tests/f_convert_bmap/expect.1               |  2 +-
+ tests/f_convert_bmap_and_extent/expect.1    |  2 +-
+ tests/f_extent_htree/expect.1               |  2 +-
+ tests/f_jnl_errno/expect.1                  |  2 +-
+ tests/f_journal/expect.1                    |  2 +-
+ tests/f_orphan/expect.1                     |  2 +-
+ tests/f_orphan_extents_inode/expect.1       |  2 +-
+ tests/f_rehash_dir/expect.1                 |  2 +-
+ tests/f_unsorted_EAs/expect.1               |  2 +-
+ 16 files changed, 68 insertions(+), 18 deletions(-)
+
+diff --git a/e2fsck/e2fsck.conf.5.in b/e2fsck/e2fsck.conf.5.in
+index 1f80a04..6a205ce 100644
+--- a/e2fsck/e2fsck.conf.5.in
++++ b/e2fsck/e2fsck.conf.5.in
+@@ -326,6 +326,40 @@ defaults to true.
+ This relation controls whether or not the scratch file directory is used
+ instead of an in-memory data structure when tracking inode counts.  It
+ defaults to true.
++.TP
++.I not_a_fix
++This boolean option, it set to true, marks the problem as
++one where if the user gives permission to make the requested change,
++it does not mean that the file system had a problem which has since
++been fixed.  This is used for requests to optimize the file system's
++data structure, such as pruning an extent tree.
++@TDB_MAN_COMMENT@.SH THE [scratch_files] STANZA
++@TDB_MAN_COMMENT@The following relations are defined in the
++@TDB_MAN_COMMENT@.I [scratch_files]
++@TDB_MAN_COMMENT@stanza.
++@TDB_MAN_COMMENT@.TP
++@TDB_MAN_COMMENT@.I directory
++@TDB_MAN_COMMENT@If the directory named by this relation exists and is
++@TDB_MAN_COMMENT@writeable, then e2fsck will attempt to use this
++@TDB_MAN_COMMENT@directory to store scratch files instead of using
++@TDB_MAN_COMMENT@in-memory data structures.
++@TDB_MAN_COMMENT@.TP
++@TDB_MAN_COMMENT@.I numdirs_threshold
++@TDB_MAN_COMMENT@If this relation is set, then in-memory data structures
++@TDB_MAN_COMMENT@be used if the number of directories in the filesystem
++@TDB_MAN_COMMENT@are fewer than amount specified.
++@TDB_MAN_COMMENT@.TP
++@TDB_MAN_COMMENT@.I dirinfo
++@TDB_MAN_COMMENT@This relation controls whether or not the scratch file
++@TDB_MAN_COMMENT@directory is used instead of an in-memory data
++@TDB_MAN_COMMENT@structure for directory information.  It defaults to
++@TDB_MAN_COMMENT@true.
++@TDB_MAN_COMMENT@.TP
++@TDB_MAN_COMMENT@.I icount
++@TDB_MAN_COMMENT@This relation controls whether or not the scratch file
++@TDB_MAN_COMMENT@directory is used instead of an in-memory data
++@TDB_MAN_COMMENT@structure when tracking inode counts.  It defaults to
++@TDB_MAN_COMMENT@true.
+ .SH LOGGING
+ E2fsck has the facility to save the information from an e2fsck run in a
+ directory so that a system administrator can review its output at their
+diff --git a/e2fsck/journal.c b/e2fsck/journal.c
+index c8ac57d..b4cf329 100644
+--- a/e2fsck/journal.c
++++ b/e2fsck/journal.c
+@@ -572,6 +572,7 @@ static void clear_v2_journal_fields(journal_t *journal)
+ 	if (!fix_problem(ctx, PR_0_CLEAR_V2_JOURNAL, &pctx))
+ 		return;
+ 
++	ctx->flags |= E2F_FLAG_PROBLEMS_FIXED;
+ 	memset(((char *) journal->j_superblock) + V1_SB_SIZE, 0,
+ 	       ctx->fs->blocksize-V1_SB_SIZE);
+ 	mark_buffer_dirty(journal->j_sb_buffer);
+diff --git a/e2fsck/problem.c b/e2fsck/problem.c
+index 1e645e4..2b01ffc 100644
+--- a/e2fsck/problem.c
++++ b/e2fsck/problem.c
+@@ -1261,12 +1261,12 @@ static struct e2fsck_problem problem_table[] = {
+ 	/* Inode extent tree could be shorter */
+ 	{ PR_1E_CAN_COLLAPSE_EXTENT_TREE,
+ 	  N_("@i %i @x tree (at level %b) could be shorter.  "),
+-	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK },
++	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK | PR_NOT_A_FIX },
+ 
+ 	/* Inode extent tree could be narrower */
+ 	{ PR_1E_CAN_NARROW_EXTENT_TREE,
+ 	  N_("@i %i @x tree (at level %b) could be narrower.  "),
+-	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK },
++	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK | PR_NOT_A_FIX },
+ 
+ 	/* Pass 2 errors */
+ 
+@@ -2146,6 +2146,7 @@ int fix_problem(e2fsck_t ctx, problem_t code, struct problem_context *pctx)
+ 		reconfigure_bool(ctx, ptr, key, PR_NO_NOMSG, "no_nomsg");
+ 		reconfigure_bool(ctx, ptr, key, PR_PREEN_NOHDR, "preen_noheader");
+ 		reconfigure_bool(ctx, ptr, key, PR_FORCE_NO, "force_no");
++		reconfigure_bool(ctx, ptr, key, PR_NOT_A_FIX, "not_a_fix");
+ 		profile_get_integer(ctx->profile, "options",
+ 				    "max_count_problems", 0, 0,
+ 				    &ptr->max_count);
+@@ -2263,7 +2264,8 @@ int fix_problem(e2fsck_t ctx, problem_t code, struct problem_context *pctx)
+ 	if (ptr->flags & PR_AFTER_CODE)
+ 		answer = fix_problem(ctx, ptr->second_code, pctx);
+ 
+-	if (answer && (ptr->prompt != PROMPT_NONE))
++	if (answer && (ptr->prompt != PROMPT_NONE) &&
++	    !(ptr->flags & PR_NOT_A_FIX))
+ 		ctx->flags |= E2F_FLAG_PROBLEMS_FIXED;
+ 
+ 	return answer;
+diff --git a/e2fsck/problemP.h b/e2fsck/problemP.h
+index 7944cd6..63bb8df 100644
+--- a/e2fsck/problemP.h
++++ b/e2fsck/problemP.h
+@@ -44,3 +44,4 @@ struct latch_descr {
+ #define PR_CONFIG	0x080000 /* This problem has been customized
+ 				    from the config file */
+ #define PR_FORCE_NO	0x100000 /* Force the answer to be no */
++#define PR_NOT_A_FIX	0x200000 /* Yes doesn't mean a problem was fixed */
+diff --git a/e2fsck/unix.c b/e2fsck/unix.c
+index 004a6e5..d33d7fd 100644
+--- a/e2fsck/unix.c
++++ b/e2fsck/unix.c
+@@ -1896,11 +1896,23 @@ no_journal:
+ 		fix_problem(ctx, PR_6_IO_FLUSH, &pctx);
+ 
+ 	if (was_changed) {
+-		exit_value |= FSCK_NONDESTRUCT;
+-		if (!(ctx->options & E2F_OPT_PREEN))
+-			log_out(ctx, _("\n%s: ***** FILE SYSTEM WAS "
+-				       "MODIFIED *****\n"),
++		int fs_fixed = (ctx->flags & E2F_FLAG_PROBLEMS_FIXED);
++
++		if (fs_fixed)
++			exit_value |= FSCK_NONDESTRUCT;
++		if (!(ctx->options & E2F_OPT_PREEN)) {
++#if 0	/* Do this later; it breaks too many tests' golden outputs */
++			log_out(ctx, fs_fixed ?
++				_("\n%s: ***** FILE SYSTEM ERRORS "
++				  "CORRECTED *****\n") :
++				_("%s: File system was modified.\n"),
+ 				ctx->device_name);
++#else
++			log_out(ctx,
++				_("\n%s: ***** FILE SYSTEM WAS MODIFIED *****\n"),
++				ctx->device_name);
++#endif
++		}
+ 		if (ctx->mount_flags & EXT2_MF_ISROOT) {
+ 			log_out(ctx, _("%s: ***** REBOOT SYSTEM *****\n"),
+ 				ctx->device_name);
+diff --git a/tests/f_collapse_extent_tree/expect.1 b/tests/f_collapse_extent_tree/expect.1
+index e2eb65e..8165a58 100644
+--- a/tests/f_collapse_extent_tree/expect.1
++++ b/tests/f_collapse_extent_tree/expect.1
+@@ -13,4 +13,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 12/128 files (0.0% non-contiguous), 19/512 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_compress_extent_tree_level/expect.1 b/tests/f_compress_extent_tree_level/expect.1
+index a359c99..dd33f63 100644
+--- a/tests/f_compress_extent_tree_level/expect.1
++++ b/tests/f_compress_extent_tree_level/expect.1
+@@ -20,4 +20,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 12/128 files (8.3% non-contiguous), 26/512 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_convert_bmap/expect.1 b/tests/f_convert_bmap/expect.1
+index 7d2ca86..c387962 100644
+--- a/tests/f_convert_bmap/expect.1
++++ b/tests/f_convert_bmap/expect.1
+@@ -23,4 +23,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 12/128 files (8.3% non-contiguous), 570/2048 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_convert_bmap_and_extent/expect.1 b/tests/f_convert_bmap_and_extent/expect.1
+index 7af91aa..c86c571 100644
+--- a/tests/f_convert_bmap_and_extent/expect.1
++++ b/tests/f_convert_bmap_and_extent/expect.1
+@@ -30,4 +30,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 13/128 files (15.4% non-contiguous), 574/2048 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_extent_htree/expect.1 b/tests/f_extent_htree/expect.1
+index 223ca69..ea48405 100644
+--- a/tests/f_extent_htree/expect.1
++++ b/tests/f_extent_htree/expect.1
+@@ -26,4 +26,4 @@ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+            0 sockets
+ ------------
+          343 files
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_jnl_errno/expect.1 b/tests/f_jnl_errno/expect.1
+index c572951..4134234 100644
+--- a/tests/f_jnl_errno/expect.1
++++ b/tests/f_jnl_errno/expect.1
+@@ -6,4 +6,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 11/2048 files (9.1% non-contiguous), 1330/8192 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_journal/expect.1 b/tests/f_journal/expect.1
+index a202c80..0a18654 100644
+--- a/tests/f_journal/expect.1
++++ b/tests/f_journal/expect.1
+@@ -59,4 +59,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 53/2048 files (1.9% non-contiguous), 1409/8192 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_orphan/expect.1 b/tests/f_orphan/expect.1
+index eddc1f8..087ebee 100644
+--- a/tests/f_orphan/expect.1
++++ b/tests/f_orphan/expect.1
+@@ -11,4 +11,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 12/2048 files (0.0% non-contiguous), 1303/8192 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_orphan_extents_inode/expect.1 b/tests/f_orphan_extents_inode/expect.1
+index 2eaab78..5d713b3 100644
+--- a/tests/f_orphan_extents_inode/expect.1
++++ b/tests/f_orphan_extents_inode/expect.1
+@@ -7,4 +7,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 12/16 files (0.0% non-contiguous), 21/100 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_rehash_dir/expect.1 b/tests/f_rehash_dir/expect.1
+index 6076765..c1449ba 100644
+--- a/tests/f_rehash_dir/expect.1
++++ b/tests/f_rehash_dir/expect.1
+@@ -7,4 +7,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 105/2048 files (2.9% non-contiguous), 336/512 blocks
+-Exit status is 1
++Exit status is 0
+diff --git a/tests/f_unsorted_EAs/expect.1 b/tests/f_unsorted_EAs/expect.1
+index 7d588d7..64b9045 100644
+--- a/tests/f_unsorted_EAs/expect.1
++++ b/tests/f_unsorted_EAs/expect.1
+@@ -8,4 +8,4 @@ Pass 5: Checking group summary information
+ 
+ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
+ test_filesys: 12/2048 files (0.0% non-contiguous), 1294/2048 blocks
+-Exit status is 1
++Exit status is 0
+-- 
+1.9.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index 5e30ec9..dcfb564 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://acinclude.m4 \
             file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
+            file://0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
1.9.1


