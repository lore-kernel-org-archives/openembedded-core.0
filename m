Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Subject: [PATCH 18/25] coreutils: update 8.32 -> 9.0
Date: Mon, 11 Oct 2021 11:40:52 +0200
Message-Id: <20211011094059.4184654-18-alex@linutronix.de>
In-Reply-To: <20211011094059.4184654-1-alex@linutronix.de>
References: <20211011094059.4184654-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>, Anders Wallin <wallinux@gmail.com>, Alexander Kanavin <alex.kanavin@gmail.com>, Adam Borowski <kilobyte@angband.pl>, Paul Gortmaker <paul.gortmaker@windriver.com>

License-Update: copyright years

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch | 167 ------------------
 ...8.31-behavior-on-removed-directories.patch |  99 -----------
 .../coreutils/disable-ls-output-quoting.patch |  49 -----
 ...6ebd536e82b15542a00c888109471936bfda.patch |  93 ++++++++++
 .../coreutils/fix-selinux-flask.patch         |   7 +-
 .../{coreutils_8.32.bb => coreutils_9.0.bb}   |  10 +-
 6 files changed, 100 insertions(+), 325 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
 delete mode 100644 meta/recipes-core/coreutils/coreutils/disable-ls-output-quoting.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch
 rename meta/recipes-core/coreutils/{coreutils_8.32.bb => coreutils_9.0.bb} (94%)

diff --git a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch
deleted file mode 100644
index 06b6307dab0..00000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch
+++ /dev/null
@@ -1,167 +0,0 @@
-From 3a48610860a9a75692d2cbedde69ac15269d540a Mon Sep 17 00:00:00 2001
-Message-Id: <3a48610860a9a75692d2cbedde69ac15269d540a.1624302273.git.wallinux@gmail.com>
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Wed, 15 Apr 2020 20:50:32 -0700
-Subject: [PATCH] fts: remove NOSTAT_LEAF_OPTIMIZATION
-MIME-Version: 1.0
-Content-Type: text/plain; charset=UTF-8
-Content-Transfer-Encoding: 8bit
-
-It caused ‘find’ and ‘du’ to dump core, and it was useful
-only for obsolescent Linux filesystems anyway.  Problem reported in:
-https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
-Quite possibly there is still a serious underlying fts bug with
-tight-loop-check and mutating file systems, but if so this patch
-should cause the bug to be triggered less often.
-* lib/fts.c (enum leaf_optimization): Remove
-NOSTAT_LEAF_OPTIMIZATION, as it’s problematic.
-(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
-(leaf_optimization): Remove special cases for ReiserFS and XFS.
-(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
-* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
-Remove.  All uses removed.
-
-Upstream-Status: Backport [upstream gnulib commit:
-47bf2cf3184027c1eb9c1dfeea5c5b8b2d69710d]
-
-Signed-off-by: Anders Wallin <wallinux@gmail.com>
----
- lib/fts.c  | 56 ++++++++----------------------------------------------
- lib/fts_.h |  5 -----
- 2 files changed, 8 insertions(+), 53 deletions(-)
-
-diff --git a/lib/fts.c b/lib/fts.c
-index d3a0472..ade8c33 100644
---- a/lib/fts.c
-+++ b/lib/fts.c
-@@ -445,7 +445,6 @@ fts_open (char * const *argv,
-                 if ((parent = fts_alloc(sp, "", 0)) == NULL)
-                         goto mem2;
-                 parent->fts_level = FTS_ROOTPARENTLEVEL;
--                parent->fts_n_dirs_remaining = -1;
-           }
- 
-         /* The classic fts implementation would call fts_stat with
-@@ -634,9 +633,8 @@ fts_close (FTS *sp)
- }
- 
- /* Minimum link count of a traditional Unix directory.  When leaf
--   optimization is OK and MIN_DIR_NLINK <= st_nlink, then st_nlink is
--   an upper bound on the number of subdirectories (counting "." and
--   "..").  */
-+   optimization is OK and a directory's st_nlink == MIN_DIR_NLINK,
-+   then the directory has no subdirectories.  */
- enum { MIN_DIR_NLINK = 2 };
- 
- /* Whether leaf optimization is OK for a directory.  */
-@@ -645,12 +643,8 @@ enum leaf_optimization
-     /* st_nlink is not reliable for this directory's subdirectories.  */
-     NO_LEAF_OPTIMIZATION,
- 
--    /* Leaf optimization is OK, but is not useful for avoiding stat calls.  */
--    OK_LEAF_OPTIMIZATION,
--
--    /* Leaf optimization is not only OK: it is useful for avoiding
--       stat calls, because dirent.d_type does not work.  */
--    NOSTAT_LEAF_OPTIMIZATION
-+    /* st_nlink == 2 means the directory lacks subdirectories.  */
-+    OK_LEAF_OPTIMIZATION
-   };
- 
- #if (defined __linux__ || defined __ANDROID__) \
-@@ -663,9 +657,7 @@ enum leaf_optimization
- # define S_MAGIC_CIFS 0xFF534D42
- # define S_MAGIC_NFS 0x6969
- # define S_MAGIC_PROC 0x9FA0
--# define S_MAGIC_REISERFS 0x52654973
- # define S_MAGIC_TMPFS 0x1021994
--# define S_MAGIC_XFS 0x58465342
- 
- # ifdef HAVE___FSWORD_T
- typedef __fsword_t fsword;
-@@ -782,23 +774,15 @@ dirent_inode_sort_may_be_useful (FTSENT const *p, int dir_fd)
- }
- 
- /* Given an FTS entry P for a directory with descriptor DIR_FD,
--   return true if it is both useful and valid to apply leaf optimization.
--   The optimization is useful only for file systems that lack usable
--   dirent.d_type info.  The optimization is valid if an st_nlink value
--   of at least MIN_DIR_NLINK is an upper bound on the number of
--   subdirectories of D, counting "." and ".."  as subdirectories.
-+   return whether it is valid to apply leaf optimization.
-+   The optimization is valid if a directory's st_nlink value equal
-+   to MIN_DIR_NLINK means the directory has no subdirectories.
-    DIR_FD is negative if unavailable.  */
- static enum leaf_optimization
- leaf_optimization (FTSENT const *p, int dir_fd)
- {
-   switch (filesystem_type (p, dir_fd))
-     {
--      /* List here the file system types that may lack usable dirent.d_type
--         info, yet for which the optimization does apply.  */
--    case S_MAGIC_REISERFS:
--    case S_MAGIC_XFS: /* XFS lacked it until 2013-08-22 commit.  */
--      return NOSTAT_LEAF_OPTIMIZATION;
--
-     case 0:
-       /* Leaf optimization is unsafe if the file system type is unknown.  */
-       FALLTHROUGH;
-@@ -1023,26 +1007,7 @@ check_for_dir:
-                 if (p->fts_info == FTS_NSOK)
-                   {
-                     if (p->fts_statp->st_size == FTS_STAT_REQUIRED)
--                      {
--                        FTSENT *parent = p->fts_parent;
--                        if (parent->fts_n_dirs_remaining == 0
--                            && ISSET(FTS_NOSTAT)
--                            && ISSET(FTS_PHYSICAL)
--                            && (leaf_optimization (parent, sp->fts_cwd_fd)
--                                == NOSTAT_LEAF_OPTIMIZATION))
--                          {
--                            /* nothing more needed */
--                          }
--                        else
--                          {
--                            p->fts_info = fts_stat(sp, p, false);
--                            if (S_ISDIR(p->fts_statp->st_mode)
--                                && p->fts_level != FTS_ROOTLEVEL
--                                && 0 < parent->fts_n_dirs_remaining
--                                && parent->fts_n_dirs_remaining != (nlink_t) -1)
--                                  parent->fts_n_dirs_remaining--;
--                          }
--                      }
-+                      p->fts_info = fts_stat(sp, p, false);
-                     else
-                       fts_assert (p->fts_statp->st_size == FTS_NO_STAT_REQUIRED);
-                   }
-@@ -1826,11 +1791,6 @@ err:            memset(sbp, 0, sizeof(struct stat));
-         }
- 
-         if (S_ISDIR(sbp->st_mode)) {
--                p->fts_n_dirs_remaining
--                  = ((sbp->st_nlink < MIN_DIR_NLINK
--                      || p->fts_level <= FTS_ROOTLEVEL)
--                     ? -1
--                     : sbp->st_nlink - (ISSET (FTS_SEEDOT) ? 0 : MIN_DIR_NLINK));
-                 if (ISDOT(p->fts_name)) {
-                         /* Command-line "." and ".." are real directories. */
-                         return (p->fts_level == FTS_ROOTLEVEL ? FTS_D : FTS_DOT);
-diff --git a/lib/fts_.h b/lib/fts_.h
-index 6c7d0ce..15c248c 100644
---- a/lib/fts_.h
-+++ b/lib/fts_.h
-@@ -219,11 +219,6 @@ typedef struct _ftsent {
- 
-         size_t fts_namelen;             /* strlen(fts_name) */
- 
--        /* If not (nlink_t) -1, an upper bound on the number of
--           remaining subdirectories of interest.  If this becomes
--           zero, some work can be avoided.  */
--        nlink_t fts_n_dirs_remaining;
--
- # define FTS_D           1              /* preorder directory */
- # define FTS_DC          2              /* directory that causes cycles */
- # define FTS_DEFAULT     3              /* none of the above */
--- 
-2.32.0
-
diff --git a/meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch b/meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
deleted file mode 100644
index fa900e3a761..00000000000
--- a/meta/recipes-core/coreutils/coreutils/0001-ls-restore-8.31-behavior-on-removed-directories.patch
+++ /dev/null
@@ -1,99 +0,0 @@
-From 7c273e5c6041f8c70f73f5b280fbb8f27d9b5a36 Mon Sep 17 00:00:00 2001
-From: Paul Eggert <eggert@cs.ucla.edu>
-Date: Thu, 5 Mar 2020 17:25:29 -0800
-Subject: [PATCH] ls: restore 8.31 behavior on removed directories
-
-* NEWS: Mention this.
-* src/ls.c: Do not include <sys/sycall.h>
-(print_dir): Don't worry about whether the directory is removed.
-* tests/ls/removed-directory.sh: Adjust to match new (i.e., old)
-behavior.
-
-Upstream-Status: Backport [https://github.com/coreutils/coreutils/commit/10fcb97bd728f09d4a027eddf8ad2900f0819b0a]
-Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
----
- src/ls.c                      | 22 ----------------------
- tests/ls/removed-directory.sh | 10 ++--------
- 2 files changed, 2 insertions(+), 30 deletions(-)
-
-diff --git a/src/ls.c b/src/ls.c
-index 637fe7a..0111f49 100644
---- a/src/ls.c
-+++ b/src/ls.c
-@@ -49,10 +49,6 @@
- # include <sys/ptem.h>
- #endif
- 
--#ifdef __linux__
--# include <sys/syscall.h>
--#endif
--
- #include <stdio.h>
- #include <assert.h>
- #include <setjmp.h>
-@@ -2895,7 +2891,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
-   struct dirent *next;
-   uintmax_t total_blocks = 0;
-   static bool first = true;
--  bool found_any_entries = false;
- 
-   errno = 0;
-   dirp = opendir (name);
-@@ -2971,7 +2966,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
-       next = readdir (dirp);
-       if (next)
-         {
--          found_any_entries = true;
-           if (! file_ignored (next->d_name))
-             {
-               enum filetype type = unknown;
-@@ -3017,22 +3011,6 @@ print_dir (char const *name, char const *realname, bool command_line_arg)
-           if (errno != EOVERFLOW)
-             break;
-         }
--#ifdef __linux__
--      else if (! found_any_entries)
--        {
--          /* If readdir finds no directory entries at all, not even "." or
--             "..", then double check that the directory exists.  */
--          if (syscall (SYS_getdents, dirfd (dirp), NULL, 0) == -1
--              && errno != EINVAL)
--            {
--              /* We exclude EINVAL as that pertains to buffer handling,
--                 and we've passed NULL as the buffer for simplicity.
--                 ENOENT is returned if appropriate before buffer handling.  */
--              file_failure (command_line_arg, _("reading directory %s"), name);
--            }
--          break;
--        }
--#endif
-       else
-         break;
- 
-diff --git a/tests/ls/removed-directory.sh b/tests/ls/removed-directory.sh
-index e8c835d..fe8f929 100755
---- a/tests/ls/removed-directory.sh
-+++ b/tests/ls/removed-directory.sh
-@@ -26,20 +26,14 @@ case $host_triplet in
-   *) skip_ 'non linux kernel' ;;
- esac
- 
--LS_FAILURE=2
--
--cat <<\EOF >exp-err || framework_failure_
--ls: reading directory '.': No such file or directory
--EOF
--
- cwd=$(pwd)
- mkdir d || framework_failure_
- cd d || framework_failure_
- rmdir ../d || framework_failure_
- 
--returns_ $LS_FAILURE ls >../out 2>../err || fail=1
-+ls >../out 2>../err || fail=1
- cd "$cwd" || framework_failure_
- compare /dev/null out || fail=1
--compare exp-err err || fail=1
-+compare /dev/null err || fail=1
- 
- Exit $fail
diff --git a/meta/recipes-core/coreutils/coreutils/disable-ls-output-quoting.patch b/meta/recipes-core/coreutils/coreutils/disable-ls-output-quoting.patch
deleted file mode 100644
index e68c2135506..00000000000
--- a/meta/recipes-core/coreutils/coreutils/disable-ls-output-quoting.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-Subject: revert inconsistent ls quoting
-
-This is a revert of upstream commit 109b9220cead6e979d22d16327c4d9f8350431cc.
-
-Bug-Debian: https://bugs.debian.org/813164
-
-Upstream-Status: Submitted
-
-Originally-by: Adam Borowski <kilobyte@angband.pl>
-[PG: patch from https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=813164#78 ]
-Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
-
----
-
---- coreutils-8.25.orig/NEWS
-+++ coreutils-8.25/NEWS
-@@ -71,9 +71,6 @@ GNU coreutils NEWS
-   df now prefers sources towards the root of a device when
-   eliding duplicate bind mounted entries.
- 
--  ls now quotes file names unambiguously and appropriate for use in a shell,
--  when outputting to a terminal.
--
-   join, sort, uniq with --zero-terminated, now treat '\n' as a field delimiter.
- 
- ** Improvements
---- coreutils-8.25.orig/doc/coreutils.texi
-+++ coreutils-8.25/doc/coreutils.texi
-@@ -7750,8 +7750,8 @@ this"} in the default C locale.  This lo
- 
- You can specify the default value of the @option{--quoting-style} option
- with the environment variable @env{QUOTING_STYLE}@.  If that environment
--variable is not set, the default value is @samp{shell-escape} when the
--output is a terminal, and @samp{literal} otherwise.
-+variable is not set, the default value is @samp{literal}, but this
-+default may change to @samp{shell} in a future version of this package.
- 
- @item --show-control-chars
- @opindex --show-control-chars
---- coreutils-8.25.orig/src/ls.c
-+++ coreutils-8.25/src/ls.c
-@@ -1581,7 +1581,6 @@ decode_switches (int argc, char **argv)
-       if (isatty (STDOUT_FILENO))
-         {
-           format = many_per_line;
--          set_quoting_style (NULL, shell_escape_quoting_style);
-           /* See description of qmark_funny_chars, above.  */
-           qmark_funny_chars = true;
-         }
diff --git a/meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch b/meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch
new file mode 100644
index 00000000000..d69ee95e4a8
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/e8b56ebd536e82b15542a00c888109471936bfda.patch
@@ -0,0 +1,93 @@
+From e8b56ebd536e82b15542a00c888109471936bfda Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?P=C3=A1draig=20Brady?= <P@draigBrady.com>
+Date: Fri, 24 Sep 2021 20:57:41 +0100
+Subject: [PATCH] chmod: fix exit status when ignoring symlinks
+
+* src/chmod.c: Reorder enum so CH_NOT_APPLIED
+can be treated as a non error.
+* tests/chmod/ignore-symlink.sh: A new test.
+* tests/local.mk: Reference the new test.
+* NEWS: Mention the bug fix.
+Fixes https://bugs.gnu.org/50784
+
+Upstream-Status: Backport
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+---
+ src/chmod.c                   |  4 ++--
+ tests/chmod/ignore-symlink.sh | 31 +++++++++++++++++++++++++++++++
+ tests/local.mk                |  1 +
+ 4 files changed, 40 insertions(+), 2 deletions(-)
+ create mode 100755 tests/chmod/ignore-symlink.sh
+
+diff --git a/src/chmod.c b/src/chmod.c
+index 37b04f500..57ac47f33 100644
+--- a/src/chmod.c
++++ b/src/chmod.c
+@@ -44,8 +44,8 @@ struct change_status
+   enum
+     {
+       CH_NO_STAT,
+-      CH_NOT_APPLIED,
+       CH_FAILED,
++      CH_NOT_APPLIED,
+       CH_NO_CHANGE_REQUESTED,
+       CH_SUCCEEDED
+     }
+@@ -322,7 +322,7 @@ process_file (FTS *fts, FTSENT *ent)
+   if ( ! recurse)
+     fts_set (fts, ent, FTS_SKIP);
+ 
+-  return CH_NO_CHANGE_REQUESTED <= ch.status;
++  return CH_NOT_APPLIED <= ch.status;
+ }
+ 
+ /* Recursively change the modes of the specified FILES (the last entry
+diff --git a/tests/chmod/ignore-symlink.sh b/tests/chmod/ignore-symlink.sh
+new file mode 100755
+index 000000000..5ce3de816
+--- /dev/null
++++ b/tests/chmod/ignore-symlink.sh
+@@ -0,0 +1,31 @@
++#!/bin/sh
++# Test for proper exit code of chmod on a processed symlink.
++
++# Copyright (C) 2021 Free Software Foundation, Inc.
++
++# This program is free software: you can redistribute it and/or modify
++# it under the terms of the GNU General Public License as published by
++# the Free Software Foundation, either version 3 of the License, or
++# (at your option) any later version.
++
++# This program is distributed in the hope that it will be useful,
++# but WITHOUT ANY WARRANTY; without even the implied warranty of
++# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++# GNU General Public License for more details.
++
++# You should have received a copy of the GNU General Public License
++# along with this program.  If not, see <https://www.gnu.org/licenses/>.
++
++. "${srcdir=.}/tests/init.sh"; path_prepend_ ./src
++print_ver_ chmod
++
++mkdir dir || framework_failure_
++touch dir/f || framework_failure_
++ln -s f dir/l || framework_failure_
++
++# This operation ignores symlinks but should succeed.
++chmod u+w -R dir 2> out || fail=1
++
++compare /dev/null out || fail=1
++
++Exit $fail
+diff --git a/tests/local.mk b/tests/local.mk
+index 228d0e368..b5b893fb7 100644
+--- a/tests/local.mk
++++ b/tests/local.mk
+@@ -456,6 +456,7 @@ all_tests =					\
+   tests/chmod/c-option.sh			\
+   tests/chmod/equal-x.sh			\
+   tests/chmod/equals.sh				\
++  tests/chmod/ignore-symlink.sh			\
+   tests/chmod/inaccessible.sh			\
+   tests/chmod/octal.sh				\
+   tests/chmod/setgid.sh				\
diff --git a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch b/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
index 173a57925ba..4f126ad67c6 100644
--- a/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
+++ b/meta/recipes-core/coreutils/coreutils/fix-selinux-flask.patch
@@ -1,4 +1,4 @@
-From 7e20a7242ba2657f73311bbf5278093da67f0721 Mon Sep 17 00:00:00 2001
+From b04363018b4b9b45fdf23384f30d02caa5564602 Mon Sep 17 00:00:00 2001
 From: Robert Yang <liezhi.yang@windriver.com>
 Date: Tue, 16 Sep 2014 01:59:08 -0700
 Subject: [PATCH] gnulib-comp.m4: selinux/flask.h should respect to
@@ -19,16 +19,17 @@ Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/m4/gnulib-comp.m4 b/m4/gnulib-comp.m4
-index dead90e..0abf0bd 100644
+index 3857233..c01fb30 100644
 --- a/m4/gnulib-comp.m4
 +++ b/m4/gnulib-comp.m4
-@@ -1860,10 +1860,10 @@ AC_DEFUN([gl_INIT],
+@@ -1953,11 +1953,11 @@ AC_DEFUN([gl_INIT],
      AC_LIBOBJ([select])
    fi
    gl_SYS_SELECT_MODULE_INDICATOR([select])
 -  AC_CHECK_HEADERS([selinux/flask.h])
    gl_HEADERS_SELINUX_SELINUX_H
    gl_HEADERS_SELINUX_CONTEXT_H
+   gl_HEADERS_SELINUX_LABEL_H
    if test "$with_selinux" != no && test "$ac_cv_header_selinux_selinux_h" = yes; then
 +    AC_CHECK_HEADERS([selinux/flask.h])
      AC_LIBOBJ([getfilecon])
diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_9.0.bb
similarity index 94%
rename from meta/recipes-core/coreutils/coreutils_8.32.bb
rename to meta/recipes-core/coreutils/coreutils_9.0.bb
index 01acf9a8747..0800bc3b6d4 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_9.0.bb
@@ -6,7 +6,7 @@ HOMEPAGE = "http://www.gnu.org/software/coreutils/"
 BUGTRACKER = "http://debbugs.gnu.org/coreutils"
 LICENSE = "GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1ebbd3e34237af26da5dc08a4e440464 \
-                    file://src/ls.c;beginline=1;endline=15;md5=b7d80abf5b279320fb0e4b1007ed108b \
+                    file://src/ls.c;beginline=1;endline=15;md5=3b8fbaee597c8a9bb88d30840d53048c \
                     "
 DEPENDS = "gmp libcap"
 DEPENDS:class-native = ""
@@ -17,21 +17,17 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://remove-usr-local-lib-from-m4.patch \
            file://fix-selinux-flask.patch \
            file://0001-uname-report-processor-and-hardware-correctly.patch \
-           file://disable-ls-output-quoting.patch \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
+           file://e8b56ebd536e82b15542a00c888109471936bfda.patch \
            file://run-ptest \
-           file://0001-ls-restore-8.31-behavior-on-removed-directories.patch \
-           file://0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch \
            "
 
-SRC_URI[md5sum] = "022042695b7d5bcf1a93559a9735e668"
-SRC_URI[sha256sum] = "4458d8de7849df44ccab15e16b1548b285224dbba5f08fac070c1c0e0bcc4cfa"
+SRC_URI[sha256sum] = "ce30acdf4a41bc5bb30dd955e9eaa75fa216b4e3deb08889ed32433c7b3b97ce"
 
 # http://git.savannah.gnu.org/cgit/coreutils.git/commit/?id=v8.27-101-gf5d7c0842
 # runcon is not really a sandbox command, use `runcon ... setsid ...` to avoid this particular issue.
 CVE_CHECK_WHITELIST += "CVE-2016-2781"
 
-EXTRA_OECONF:class-native = "--without-gmp"
 EXTRA_OECONF:class-target = "--enable-install-program=arch,hostname --libexecdir=${libdir}"
 EXTRA_OECONF:class-nativesdk = "--enable-install-program=arch,hostname"
 
-- 
2.20.1

