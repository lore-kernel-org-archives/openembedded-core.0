Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E811E782EA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 08:00:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7L80jCO019072
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Aug 2017 01:00:45 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Mon, 21 Aug 2017 01:00:44 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Aug 2017 01:00:40 -0700
Message-ID: <8a09941e4f9777e79815d31f4e88355bbb1e9023.1503302375.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <cover.1503302375.git.liezhi.yang@windriver.com>
References: <cover.1503302375.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] e2fsprogs: 1.43.4 -> 1.43.5
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
X-List-Received-Date: Mon, 21 Aug 2017 08:00:44 -0000
Content-Type: text/plain

Removed the following 2 patches which are already in the source:
- 0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
- e2fsprogs-1.43-sysmacros.patch

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...-with-exit-status-0-if-no-errors-were-fix.patch | 255 ---------------------
 .../e2fsprogs/e2fsprogs-1.43-sysmacros.patch       | 130 -----------
 .../{e2fsprogs_1.43.4.bb => e2fsprogs_1.43.5.bb}   |   4 +-
 3 files changed, 1 insertion(+), 388 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.4.bb => e2fsprogs_1.43.5.bb} (95%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
deleted file mode 100644
index 1d17520..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch
+++ /dev/null
@@ -1,255 +0,0 @@
-From bf9f3b6d5b10d19218b4ed904c12b22e36ec57dd Mon Sep 17 00:00:00 2001
-From: Theodore Ts'o <tytso@mit.edu>
-Date: Thu, 16 Feb 2017 22:02:35 -0500
-Subject: [PATCH] e2fsck: exit with exit status 0 if no errors were fixed
-
-Previously, e2fsck would exit with a status code of 1 even though the
-only changes that it made to the file system were various
-optimziations and not fixing file system corruption.  Since the man
-page states that an exit status of 1 means "file system errors
-corrupted", fix e2fsck to return an exit status of 0.
-
-Upstream-Status: Backport
-
-Signed-off-by: Theodore Ts'o <tytso@mit.edu>
-Signed-off-by: Daniel Schultz <d.schultz@phytec.de>
----
- e2fsck/e2fsck.conf.5.in                     |  7 +++++++
- e2fsck/journal.c                            |  1 +
- e2fsck/problem.c                            |  8 +++++---
- e2fsck/problemP.h                           |  1 +
- e2fsck/unix.c                               | 20 ++++++++++++++++----
- tests/f_collapse_extent_tree/expect.1       |  2 +-
- tests/f_compress_extent_tree_level/expect.1 |  2 +-
- tests/f_convert_bmap/expect.1               |  2 +-
- tests/f_convert_bmap_and_extent/expect.1    |  2 +-
- tests/f_extent_htree/expect.1               |  2 +-
- tests/f_jnl_errno/expect.1                  |  2 +-
- tests/f_journal/expect.1                    |  2 +-
- tests/f_orphan/expect.1                     |  2 +-
- tests/f_orphan_extents_inode/expect.1       |  2 +-
- tests/f_rehash_dir/expect.1                 |  2 +-
- tests/f_unsorted_EAs/expect.1               |  2 +-
- 16 files changed, 41 insertions(+), 18 deletions(-)
-
-diff --git a/e2fsck/e2fsck.conf.5.in b/e2fsck/e2fsck.conf.5.in
-index 1848bdb..0bfc76a 100644
---- a/e2fsck/e2fsck.conf.5.in
-+++ b/e2fsck/e2fsck.conf.5.in
-@@ -303,6 +303,13 @@ of 'should this problem be fixed?'.  The
- option even overrides the
- .B -y
- option given on the command-line (just for the specific problem, of course).
-+.TP
-+.I not_a_fix
-+This boolean option, it set to true, marks the problem as
-+one where if the user gives permission to make the requested change,
-+it does not mean that the file system had a problem which has since
-+been fixed.  This is used for requests to optimize the file system's
-+data structure, such as pruning an extent tree.
- @TDB_MAN_COMMENT@.SH THE [scratch_files] STANZA
- @TDB_MAN_COMMENT@The following relations are defined in the
- @TDB_MAN_COMMENT@.I [scratch_files]
-diff --git a/e2fsck/journal.c b/e2fsck/journal.c
-index 46fe7b4..c4f58f1 100644
---- a/e2fsck/journal.c
-+++ b/e2fsck/journal.c
-@@ -572,6 +572,7 @@ static void clear_v2_journal_fields(journal_t *journal)
- 	if (!fix_problem(ctx, PR_0_CLEAR_V2_JOURNAL, &pctx))
- 		return;
- 
-+	ctx->flags |= E2F_FLAG_PROBLEMS_FIXED;
- 	memset(((char *) journal->j_superblock) + V1_SB_SIZE, 0,
- 	       ctx->fs->blocksize-V1_SB_SIZE);
- 	mark_buffer_dirty(journal->j_sb_buffer);
-diff --git a/e2fsck/problem.c b/e2fsck/problem.c
-index 34a671e..4b25069 100644
---- a/e2fsck/problem.c
-+++ b/e2fsck/problem.c
-@@ -1276,12 +1276,12 @@ static struct e2fsck_problem problem_table[] = {
- 	/* Inode extent tree could be shorter */
- 	{ PR_1E_CAN_COLLAPSE_EXTENT_TREE,
- 	  N_("@i %i @x tree (at level %b) could be shorter.  "),
--	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK },
-+	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK | PR_NOT_A_FIX },
- 
- 	/* Inode extent tree could be narrower */
- 	{ PR_1E_CAN_NARROW_EXTENT_TREE,
- 	  N_("@i %i @x tree (at level %b) could be narrower.  "),
--	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK },
-+	  PROMPT_FIX, PR_NO_OK | PR_PREEN_NO | PR_PREEN_OK | PR_NOT_A_FIX },
- 
- 	/* Pass 2 errors */
- 
-@@ -2166,6 +2166,7 @@ int fix_problem(e2fsck_t ctx, problem_t code, struct problem_context *pctx)
- 		reconfigure_bool(ctx, ptr, key, PR_NO_NOMSG, "no_nomsg");
- 		reconfigure_bool(ctx, ptr, key, PR_PREEN_NOHDR, "preen_noheader");
- 		reconfigure_bool(ctx, ptr, key, PR_FORCE_NO, "force_no");
-+		reconfigure_bool(ctx, ptr, key, PR_NOT_A_FIX, "not_a_fix");
- 		profile_get_integer(ctx->profile, "options",
- 				    "max_count_problems", 0, 0,
- 				    &ptr->max_count);
-@@ -2283,7 +2284,8 @@ int fix_problem(e2fsck_t ctx, problem_t code, struct problem_context *pctx)
- 	if (ptr->flags & PR_AFTER_CODE)
- 		answer = fix_problem(ctx, ptr->second_code, pctx);
- 
--	if (answer && (ptr->prompt != PROMPT_NONE))
-+	if (answer && (ptr->prompt != PROMPT_NONE) &&
-+	    !(ptr->flags & PR_NOT_A_FIX))
- 		ctx->flags |= E2F_FLAG_PROBLEMS_FIXED;
- 
- 	return answer;
-diff --git a/e2fsck/problemP.h b/e2fsck/problemP.h
-index 7944cd6..63bb8df 100644
---- a/e2fsck/problemP.h
-+++ b/e2fsck/problemP.h
-@@ -44,3 +44,4 @@ struct latch_descr {
- #define PR_CONFIG	0x080000 /* This problem has been customized
- 				    from the config file */
- #define PR_FORCE_NO	0x100000 /* Force the answer to be no */
-+#define PR_NOT_A_FIX	0x200000 /* Yes doesn't mean a problem was fixed */
-diff --git a/e2fsck/unix.c b/e2fsck/unix.c
-index eb9f311..9e4d31a 100644
---- a/e2fsck/unix.c
-+++ b/e2fsck/unix.c
-@@ -1901,11 +1901,23 @@ no_journal:
- 		fix_problem(ctx, PR_6_IO_FLUSH, &pctx);
- 
- 	if (was_changed) {
--		exit_value |= FSCK_NONDESTRUCT;
--		if (!(ctx->options & E2F_OPT_PREEN))
--			log_out(ctx, _("\n%s: ***** FILE SYSTEM WAS "
--				       "MODIFIED *****\n"),
-+		int fs_fixed = (ctx->flags & E2F_FLAG_PROBLEMS_FIXED);
-+
-+		if (fs_fixed)
-+			exit_value |= FSCK_NONDESTRUCT;
-+		if (!(ctx->options & E2F_OPT_PREEN)) {
-+#if 0	/* Do this later; it breaks too many tests' golden outputs */
-+			log_out(ctx, fs_fixed ?
-+				_("\n%s: ***** FILE SYSTEM ERRORS "
-+				  "CORRECTED *****\n") :
-+				_("%s: File system was modified.\n"),
- 				ctx->device_name);
-+#else
-+			log_out(ctx,
-+				_("\n%s: ***** FILE SYSTEM WAS MODIFIED *****\n"),
-+				ctx->device_name);
-+#endif
-+		}
- 		if (ctx->mount_flags & EXT2_MF_ISROOT) {
- 			log_out(ctx, _("%s: ***** REBOOT SYSTEM *****\n"),
- 				ctx->device_name);
-diff --git a/tests/f_collapse_extent_tree/expect.1 b/tests/f_collapse_extent_tree/expect.1
-index e2eb65e..8165a58 100644
---- a/tests/f_collapse_extent_tree/expect.1
-+++ b/tests/f_collapse_extent_tree/expect.1
-@@ -13,4 +13,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 12/128 files (0.0% non-contiguous), 19/512 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_compress_extent_tree_level/expect.1 b/tests/f_compress_extent_tree_level/expect.1
-index a359c99..dd33f63 100644
---- a/tests/f_compress_extent_tree_level/expect.1
-+++ b/tests/f_compress_extent_tree_level/expect.1
-@@ -20,4 +20,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 12/128 files (8.3% non-contiguous), 26/512 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_convert_bmap/expect.1 b/tests/f_convert_bmap/expect.1
-index 7d2ca86..c387962 100644
---- a/tests/f_convert_bmap/expect.1
-+++ b/tests/f_convert_bmap/expect.1
-@@ -23,4 +23,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 12/128 files (8.3% non-contiguous), 570/2048 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_convert_bmap_and_extent/expect.1 b/tests/f_convert_bmap_and_extent/expect.1
-index 7af91aa..c86c571 100644
---- a/tests/f_convert_bmap_and_extent/expect.1
-+++ b/tests/f_convert_bmap_and_extent/expect.1
-@@ -30,4 +30,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 13/128 files (15.4% non-contiguous), 574/2048 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_extent_htree/expect.1 b/tests/f_extent_htree/expect.1
-index 223ca69..ea48405 100644
---- a/tests/f_extent_htree/expect.1
-+++ b/tests/f_extent_htree/expect.1
-@@ -26,4 +26,4 @@ test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
-            0 sockets
- ------------
-          343 files
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_jnl_errno/expect.1 b/tests/f_jnl_errno/expect.1
-index c572951..4134234 100644
---- a/tests/f_jnl_errno/expect.1
-+++ b/tests/f_jnl_errno/expect.1
-@@ -6,4 +6,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 11/2048 files (9.1% non-contiguous), 1330/8192 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_journal/expect.1 b/tests/f_journal/expect.1
-index a202c80..0a18654 100644
---- a/tests/f_journal/expect.1
-+++ b/tests/f_journal/expect.1
-@@ -59,4 +59,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 53/2048 files (1.9% non-contiguous), 1409/8192 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_orphan/expect.1 b/tests/f_orphan/expect.1
-index eddc1f8..087ebee 100644
---- a/tests/f_orphan/expect.1
-+++ b/tests/f_orphan/expect.1
-@@ -11,4 +11,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 12/2048 files (0.0% non-contiguous), 1303/8192 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_orphan_extents_inode/expect.1 b/tests/f_orphan_extents_inode/expect.1
-index 2eaab78..5d713b3 100644
---- a/tests/f_orphan_extents_inode/expect.1
-+++ b/tests/f_orphan_extents_inode/expect.1
-@@ -7,4 +7,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 12/16 files (0.0% non-contiguous), 21/100 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_rehash_dir/expect.1 b/tests/f_rehash_dir/expect.1
-index 6076765..c1449ba 100644
---- a/tests/f_rehash_dir/expect.1
-+++ b/tests/f_rehash_dir/expect.1
-@@ -7,4 +7,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 105/2048 files (2.9% non-contiguous), 336/512 blocks
--Exit status is 1
-+Exit status is 0
-diff --git a/tests/f_unsorted_EAs/expect.1 b/tests/f_unsorted_EAs/expect.1
-index 7d588d7..64b9045 100644
---- a/tests/f_unsorted_EAs/expect.1
-+++ b/tests/f_unsorted_EAs/expect.1
-@@ -8,4 +8,4 @@ Pass 5: Checking group summary information
- 
- test_filesys: ***** FILE SYSTEM WAS MODIFIED *****
- test_filesys: 12/2048 files (0.0% non-contiguous), 1294/2048 blocks
--Exit status is 1
-+Exit status is 0
--- 
-1.9.1
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch
deleted file mode 100644
index abbf2ba..0000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsprogs-1.43-sysmacros.patch
+++ /dev/null
@@ -1,130 +0,0 @@
-From 30ef41f68703b6a16027cc8787118b87f1462dff Mon Sep 17 00:00:00 2001
-From: Mike Frysinger <vapier@gentoo.org>
-Date: Mon, 28 Mar 2016 20:31:33 -0400
-Subject: [PATCH e2fsprogs] include sys/sysmacros.h as needed
-
-The minor/major/makedev macros are not entirely standard.  glibc has had
-the definitions in sys/sysmacros.h since the start, and wants to move away
-from always defining them implicitly via sys/types.h (as this pollutes the
-namespace in violation of POSIX).  Other C libraries have already dropped
-them.  Since the configure script already checks for this header, use that
-to pull in the header in files that use these macros.
-
-Signed-off-by: Mike Frysinger <vapier@gentoo.org>
-
-Taken from gentoo portage.
-
-Upstream-Status: Pending
-
----
- debugfs/debugfs.c      | 3 +++
- lib/blkid/devname.c    | 3 +++
- lib/blkid/devno.c      | 3 +++
- lib/ext2fs/finddev.c   | 3 +++
- lib/ext2fs/ismounted.c | 3 +++
- misc/create_inode.c    | 4 ++++
- misc/mk_hugefiles.c    | 3 +++
- 7 files changed, 22 insertions(+)
-
-diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
-index ba8be40..7d481bc 100644
---- a/debugfs/debugfs.c
-+++ b/debugfs/debugfs.c
-@@ -26,6 +26,9 @@ extern char *optarg;
- #include <errno.h>
- #endif
- #include <fcntl.h>
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
- 
- #include "debugfs.h"
- #include "uuid/uuid.h"
-diff --git a/lib/blkid/devname.c b/lib/blkid/devname.c
-index 3e2efa9..671e781 100644
---- a/lib/blkid/devname.c
-+++ b/lib/blkid/devname.c
-@@ -36,6 +36,9 @@
- #if HAVE_SYS_MKDEV_H
- #include <sys/mkdev.h>
- #endif
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
- #include <time.h>
- 
- #include "blkidP.h"
-diff --git a/lib/blkid/devno.c b/lib/blkid/devno.c
-index 479d977..61e6fc7 100644
---- a/lib/blkid/devno.c
-+++ b/lib/blkid/devno.c
-@@ -31,6 +31,9 @@
- #if HAVE_SYS_MKDEV_H
- #include <sys/mkdev.h>
- #endif
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
- 
- #include "blkidP.h"
- 
-diff --git a/lib/ext2fs/finddev.c b/lib/ext2fs/finddev.c
-index 311608d..62fa0db 100644
---- a/lib/ext2fs/finddev.c
-+++ b/lib/ext2fs/finddev.c
-@@ -31,6 +31,9 @@
- #if HAVE_SYS_MKDEV_H
- #include <sys/mkdev.h>
- #endif
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
- 
- #include "ext2_fs.h"
- #include "ext2fs.h"
-diff --git a/lib/ext2fs/ismounted.c b/lib/ext2fs/ismounted.c
-index e0f69dd..7404996 100644
---- a/lib/ext2fs/ismounted.c
-+++ b/lib/ext2fs/ismounted.c
-@@ -49,6 +49,9 @@
- #if HAVE_SYS_TYPES_H
- #include <sys/types.h>
- #endif
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
- 
- #include "ext2_fs.h"
- #include "ext2fs.h"
-diff --git a/misc/create_inode.c b/misc/create_inode.c
-index 4dbd8e5..98aeb41 100644
---- a/misc/create_inode.c
-+++ b/misc/create_inode.c
-@@ -22,6 +22,10 @@
- #include <attr/xattr.h>
- #endif
- #include <sys/ioctl.h>
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
-+
- #include <ext2fs/ext2fs.h>
- #include <ext2fs/ext2_types.h>
- #include <ext2fs/fiemap.h>
-diff --git a/misc/mk_hugefiles.c b/misc/mk_hugefiles.c
-index 71a15c5..00e95cd 100644
---- a/misc/mk_hugefiles.c
-+++ b/misc/mk_hugefiles.c
-@@ -35,6 +35,9 @@ extern int optind;
- #include <sys/ioctl.h>
- #include <sys/types.h>
- #include <sys/stat.h>
-+#ifdef HAVE_SYS_SYSMACROS_H
-+#include <sys/sysmacros.h>
-+#endif
- #include <libgen.h>
- #include <limits.h>
- #include <blkid/blkid.h>
--- 
-2.8.2
-
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
similarity index 95%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
index 56929c9..fb02d79 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
@@ -7,15 +7,13 @@ SRC_URI += "file://acinclude.m4 \
             file://ptest.patch \
             file://mkdir.patch \
             file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
-            file://e2fsprogs-1.43-sysmacros.patch \
             file://mkdir_p.patch \
-            file://0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch \
             file://reproducible-doc.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
 
-SRCREV = "3d66c4b20f09f923078c1e6eb9b549865b549674"
+SRCREV = "2a13c84b513aa094d1cda727e92d35a89dd777da"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
-- 
2.10.2


