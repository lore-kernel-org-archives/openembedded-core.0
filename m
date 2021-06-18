Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
 by mx.groups.io with SMTP id smtpd.web11.13611.1624049005887437696
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Jun 2021 13:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=tv1JOW9Q;
 spf=pass (domain: gmail.com, ip: 209.85.208.171, mailfrom: wallinux@gmail.com)
Received: by mail-lj1-f171.google.com with SMTP id x14so15680718ljp.7
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Jun 2021 13:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dz4dmUvy0hZTyPmbqlVHcnKxGr06C36kji2JE5pKCCE=;
        b=tv1JOW9QTKtxCFsnUHAK/0P4Vi7/XAa3S8RrXOIpyM94QrtIGVrU2VQc2dDPGpjBHF
         AGnDSkv9kPvtZalJ4cnJGWSBR054fYMugs9O4Zm/lRb/Vo73/pCkitMlU7ea4KGx1S2+
         85MxMt2DcPRo1Vb77g/etkDouJD6vIVhB1hqYzZV47ZS4TYk82Zd8y998NsRSJFuT0XI
         NQk03WDYg1Pm0bRPMgNcYB2VFeykvyIqdvNLH8Xj21cqrt/j9KHUovC+w2B9AefEctEA
         RDzJG6iXL4BvkDEs1PrZJw9DyxRbfxx8mBrofwMWMi1w4Fc9qeHFVr4caFP2qPDVyoCp
         bvkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dz4dmUvy0hZTyPmbqlVHcnKxGr06C36kji2JE5pKCCE=;
        b=gT5GvA3gmA9e8ZBiz9qwmCaIDdrtn4hBnRGBSt14chgx10a+1qYZyhRQoNNocx1waq
         /qllp4r74O15w9mLCqlj5S+bXNX1MbFAJ55W18/DgICIDPEyIALRTeW2gazGD8W17fdq
         00jMHZze6oC0eSIF2OQCcTs4hOORlJwIr/uldbd2+zF/t98H6KmajPEGNNPrU2JrgPSq
         5rPTPTToFDNfl4CScvWjhPOVdT2IOLgD9RyZEpiTi2o+ITuFOBpmfVQ85O6oa8Tfw7Xt
         anKMWTrZXlgMDdAuauPUBIcaYn1TsVwZIWZDCQHeWak7EB2taqWRECnBJuqXRPbRySuk
         1Mag==
X-Gm-Message-State: AOAM533wcDOZu0V9nY4nt4Em8Y9/BOFjRkBK0hIinInytCBDyx1nz1zS
	YGZbaCAwDVXjC+2foeMydfq/9TsiqdK30g==
X-Google-Smtp-Source: ABdhPJwtgVuSRTqSORFsnkuIBK4fVP+Guq06W0wdNj/VkuloBkWJoIvX7daTMeIRo1J9Akliln5Vyw==
X-Received: by 2002:a2e:9dcd:: with SMTP id x13mr10981990ljj.49.1624049003672;
        Fri, 18 Jun 2021 13:43:23 -0700 (PDT)
Return-Path: <wallinux@gmail.com>
Received: from arn-awallin-linux-l5.wrs.com (h-212-85-92-184.NA.cust.bahnhof.se. [212.85.92.184])
        by smtp.gmail.com with ESMTPSA id q2sm236866lfn.177.2021.06.18.13.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:43:23 -0700 (PDT)
From: "Anders Wallin" <wallinux@gmail.com>
X-Google-Original-From: Anders Wallin <anders.wallin@windriver.com>
To: openembedded-core@lists.openembedded.org
Cc: Anders Wallin <anders.wallin@windriver.com>
Subject: [OE-core][PATCH] coreutils: remove NOSTAT_LEAF_OPTIMIZATION
Date: Fri, 18 Jun 2021 22:43:01 +0200
Message-Id: <20210618204301.426877-1-anders.wallin@windriver.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

It caused ‘find’ and ‘du’ to dump core, and it was useful
only for obsolescent Linux filesystems anyway.  Problem reported in:
https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
Quite possibly there is still a serious underlying fts bug with
tight-loop-check and mutating file systems, but if so this patch
should cause the bug to be triggered less often.
* lib/fts.c (enum leaf_optimization): Remove
NOSTAT_LEAF_OPTIMIZATION, as it’s problematic.
(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
(leaf_optimization): Remove special cases for ReiserFS and XFS.
(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
Remove.  All uses removed.

Signed-off-by: Anders Wallin <anders.wallin@windriver.com>
---
 ...-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch | 162 ++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_8.32.bb |   1 +
 2 files changed, 163 insertions(+)
 create mode 100644 meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch

diff --git a/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch
new file mode 100644
index 0000000000..e3f9e3b502
--- /dev/null
+++ b/meta/recipes-core/coreutils/coreutils/0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch
@@ -0,0 +1,162 @@
+From 0a0d887e095f97185d25e90b59612b1da8197533 Mon Sep 17 00:00:00 2001
+Message-Id: <0a0d887e095f97185d25e90b59612b1da8197533.1624008099.git.wallinux@gmail.com>
+From: Paul Eggert <eggert@cs.ucla.edu>
+Date: Wed, 15 Apr 2020 20:50:32 -0700
+Subject: [PATCH] fts: remove NOSTAT_LEAF_OPTIMIZATION
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+It caused ‘find’ and ‘du’ to dump core, and it was useful
+only for obsolescent Linux filesystems anyway.  Problem reported in:
+https://lists.gnu.org/r/bug-gnulib/2020-04/msg00068.html
+Quite possibly there is still a serious underlying fts bug with
+tight-loop-check and mutating file systems, but if so this patch
+should cause the bug to be triggered less often.
+* lib/fts.c (enum leaf_optimization): Remove
+NOSTAT_LEAF_OPTIMIZATION, as it’s problematic.
+(S_MAGIC_REISERFS, S_MAGIC_XFS): Remove; no longer needed.
+(leaf_optimization): Remove special cases for ReiserFS and XFS.
+(fts_read): Remove NOSTAT_LEAF_OPTIMIZATION code.
+* lib/fts_.h (struct _ftsent.fts_n_dirs_remaining):
+Remove.  All uses removed.
+---
+ lib/fts.c  | 56 ++++++++----------------------------------------------
+ lib/fts_.h |  5 -----
+ 2 files changed, 8 insertions(+), 53 deletions(-)
+
+diff --git a/lib/fts.c b/lib/fts.c
+index d3a0472..ade8c33 100644
+--- a/lib/fts.c
++++ b/lib/fts.c
+@@ -445,7 +445,6 @@ fts_open (char * const *argv,
+                 if ((parent = fts_alloc(sp, "", 0)) == NULL)
+                         goto mem2;
+                 parent->fts_level = FTS_ROOTPARENTLEVEL;
+-                parent->fts_n_dirs_remaining = -1;
+           }
+ 
+         /* The classic fts implementation would call fts_stat with
+@@ -634,9 +633,8 @@ fts_close (FTS *sp)
+ }
+ 
+ /* Minimum link count of a traditional Unix directory.  When leaf
+-   optimization is OK and MIN_DIR_NLINK <= st_nlink, then st_nlink is
+-   an upper bound on the number of subdirectories (counting "." and
+-   "..").  */
++   optimization is OK and a directory's st_nlink == MIN_DIR_NLINK,
++   then the directory has no subdirectories.  */
+ enum { MIN_DIR_NLINK = 2 };
+ 
+ /* Whether leaf optimization is OK for a directory.  */
+@@ -645,12 +643,8 @@ enum leaf_optimization
+     /* st_nlink is not reliable for this directory's subdirectories.  */
+     NO_LEAF_OPTIMIZATION,
+ 
+-    /* Leaf optimization is OK, but is not useful for avoiding stat calls.  */
+-    OK_LEAF_OPTIMIZATION,
+-
+-    /* Leaf optimization is not only OK: it is useful for avoiding
+-       stat calls, because dirent.d_type does not work.  */
+-    NOSTAT_LEAF_OPTIMIZATION
++    /* st_nlink == 2 means the directory lacks subdirectories.  */
++    OK_LEAF_OPTIMIZATION
+   };
+ 
+ #if (defined __linux__ || defined __ANDROID__) \
+@@ -663,9 +657,7 @@ enum leaf_optimization
+ # define S_MAGIC_CIFS 0xFF534D42
+ # define S_MAGIC_NFS 0x6969
+ # define S_MAGIC_PROC 0x9FA0
+-# define S_MAGIC_REISERFS 0x52654973
+ # define S_MAGIC_TMPFS 0x1021994
+-# define S_MAGIC_XFS 0x58465342
+ 
+ # ifdef HAVE___FSWORD_T
+ typedef __fsword_t fsword;
+@@ -782,23 +774,15 @@ dirent_inode_sort_may_be_useful (FTSENT const *p, int dir_fd)
+ }
+ 
+ /* Given an FTS entry P for a directory with descriptor DIR_FD,
+-   return true if it is both useful and valid to apply leaf optimization.
+-   The optimization is useful only for file systems that lack usable
+-   dirent.d_type info.  The optimization is valid if an st_nlink value
+-   of at least MIN_DIR_NLINK is an upper bound on the number of
+-   subdirectories of D, counting "." and ".."  as subdirectories.
++   return whether it is valid to apply leaf optimization.
++   The optimization is valid if a directory's st_nlink value equal
++   to MIN_DIR_NLINK means the directory has no subdirectories.
+    DIR_FD is negative if unavailable.  */
+ static enum leaf_optimization
+ leaf_optimization (FTSENT const *p, int dir_fd)
+ {
+   switch (filesystem_type (p, dir_fd))
+     {
+-      /* List here the file system types that may lack usable dirent.d_type
+-         info, yet for which the optimization does apply.  */
+-    case S_MAGIC_REISERFS:
+-    case S_MAGIC_XFS: /* XFS lacked it until 2013-08-22 commit.  */
+-      return NOSTAT_LEAF_OPTIMIZATION;
+-
+     case 0:
+       /* Leaf optimization is unsafe if the file system type is unknown.  */
+       FALLTHROUGH;
+@@ -1023,26 +1007,7 @@ check_for_dir:
+                 if (p->fts_info == FTS_NSOK)
+                   {
+                     if (p->fts_statp->st_size == FTS_STAT_REQUIRED)
+-                      {
+-                        FTSENT *parent = p->fts_parent;
+-                        if (parent->fts_n_dirs_remaining == 0
+-                            && ISSET(FTS_NOSTAT)
+-                            && ISSET(FTS_PHYSICAL)
+-                            && (leaf_optimization (parent, sp->fts_cwd_fd)
+-                                == NOSTAT_LEAF_OPTIMIZATION))
+-                          {
+-                            /* nothing more needed */
+-                          }
+-                        else
+-                          {
+-                            p->fts_info = fts_stat(sp, p, false);
+-                            if (S_ISDIR(p->fts_statp->st_mode)
+-                                && p->fts_level != FTS_ROOTLEVEL
+-                                && 0 < parent->fts_n_dirs_remaining
+-                                && parent->fts_n_dirs_remaining != (nlink_t) -1)
+-                                  parent->fts_n_dirs_remaining--;
+-                          }
+-                      }
++                      p->fts_info = fts_stat(sp, p, false);
+                     else
+                       fts_assert (p->fts_statp->st_size == FTS_NO_STAT_REQUIRED);
+                   }
+@@ -1826,11 +1791,6 @@ err:            memset(sbp, 0, sizeof(struct stat));
+         }
+ 
+         if (S_ISDIR(sbp->st_mode)) {
+-                p->fts_n_dirs_remaining
+-                  = ((sbp->st_nlink < MIN_DIR_NLINK
+-                      || p->fts_level <= FTS_ROOTLEVEL)
+-                     ? -1
+-                     : sbp->st_nlink - (ISSET (FTS_SEEDOT) ? 0 : MIN_DIR_NLINK));
+                 if (ISDOT(p->fts_name)) {
+                         /* Command-line "." and ".." are real directories. */
+                         return (p->fts_level == FTS_ROOTLEVEL ? FTS_D : FTS_DOT);
+diff --git a/lib/fts_.h b/lib/fts_.h
+index 6c7d0ce..15c248c 100644
+--- a/lib/fts_.h
++++ b/lib/fts_.h
+@@ -219,11 +219,6 @@ typedef struct _ftsent {
+ 
+         size_t fts_namelen;             /* strlen(fts_name) */
+ 
+-        /* If not (nlink_t) -1, an upper bound on the number of
+-           remaining subdirectories of interest.  If this becomes
+-           zero, some work can be avoided.  */
+-        nlink_t fts_n_dirs_remaining;
+-
+ # define FTS_D           1              /* preorder directory */
+ # define FTS_DC          2              /* directory that causes cycles */
+ # define FTS_DEFAULT     3              /* none of the above */
+-- 
+2.29.2
+
diff --git a/meta/recipes-core/coreutils/coreutils_8.32.bb b/meta/recipes-core/coreutils/coreutils_8.32.bb
index f3fe31fd3b..dd271d4968 100644
--- a/meta/recipes-core/coreutils/coreutils_8.32.bb
+++ b/meta/recipes-core/coreutils/coreutils_8.32.bb
@@ -21,6 +21,7 @@ SRC_URI = "${GNU_MIRROR}/coreutils/${BP}.tar.xz \
            file://0001-local.mk-fix-cross-compiling-problem.patch \
            file://run-ptest \
            file://0001-ls-restore-8.31-behavior-on-removed-directories.patch \
+           file://0001-fts-remove-NOSTAT_LEAF_OPTIMIZATION.patch \
            "
 
 SRC_URI[md5sum] = "022042695b7d5bcf1a93559a9735e668"
-- 
2.32.0

