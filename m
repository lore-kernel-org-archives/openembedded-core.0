Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45AADC47DA9
	for <webhook@archiver.kernel.org>; Wed, 17 Jan 2024 16:00:10 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.6577.1705507207770833143
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Jan 2024 08:00:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XnbBnoQ3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1d5dfda4319so15958445ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 08:00:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1705507207; x=1706112007; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eDsyFVjqmPZpdUMLsu7LlxQvBGqflVn1V3cVXFCUQp0=;
        b=XnbBnoQ3YHm74mhEKqtXaCUb+BHWyF3ON+f1iFAiDqIQxr8uplYny+UP6mpiU8zmCZ
         BJeLN95VRXsDv8XoobhJOmebhbQQIRVmpaGP82rrvqQVfIx19HEMlIOWc8xhZH4ioSVA
         vjT8rrfL3d/e7uglx6wsA2BpfLwBqgn6mVleKHmQPvxmkPQ+1AaE0vlriMwSI1bZYdTc
         TAgCVjfvDsXRhbn3r+ehmiZrkOXw3+2Vw4ajPOiNH5OwEXZ+yRTyryphNZM9SjaP5paZ
         TF85VpyPfAk6AXuWFjcPpXfTv1ap6fp2SwOqJ3FCfhlQawaQWB0ty5q2UT2yNMEnYvpx
         2nJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705507207; x=1706112007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eDsyFVjqmPZpdUMLsu7LlxQvBGqflVn1V3cVXFCUQp0=;
        b=KrUnWQqA6CXnjAhEdNQfSN5GxVtXE6/o6r/i6xpvMgo2HqowMOevyoIhF/0+XknjB3
         ROLvaM+pqH4Ovlwimu/AjD3U0CJp7384ZVkXrcnU9kp1e9739Lm97H2JSH/5kzp6vZwH
         siE48lqCeLFi19eYi6ObhV789fC3eze374pHchDqRTu68rMHrimQt08aQhgN4+XCHFqq
         YGKOJhKh2u0An48RHBH+y+/PwyI4TgNN+ukkQxZ9nazjEysxAO6uiLNUDwYj5pjF0lTs
         JsfGoGwxca7RljovQdIoJwlJzRbxQ2TmdILBQDkgAe4TilI6YH1Uv50RfLc3dTc214x/
         vsuw==
X-Gm-Message-State: AOJu0YxiVMpNBLzcwP+Mp3FtqlxU1BOs+t3tK8VAksKJWf+Jw1imNv4C
	DJp7gGO0bre8jbyltRx5QzzzQsJ5HQkq9k0kDP3Ir4IL4epu9w==
X-Google-Smtp-Source: AGHT+IGcNr8VT8PADf7v5ol3fj8Qf7fE2r3+bbKgNuQmAGMdiN3ThWdZ/pBni0ayC7DFaegBkW1ywA==
X-Received: by 2002:a17:902:c103:b0:1d6:f5fe:75be with SMTP id 3-20020a170902c10300b001d6f5fe75bemr523057pli.33.1705507205793;
        Wed, 17 Jan 2024 08:00:05 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id s4-20020a170902ea0400b001d425d495c9sm11117999plg.190.2024.01.17.08.00.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jan 2024 08:00:05 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 6/7] cpio: upgrade to 2.14
Date: Wed, 17 Jan 2024 05:58:59 -1000
Message-Id: <203804370997eeb015ef9da90b567ea2c2f9f3a6.1705505890.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1705505890.git.steve@sakoman.com>
References: <cover.1705505890.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jan 2024 16:00:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/193930

From: Soumya Sambu <soumya.sambu@windriver.com>

This includes fix for CVE-2023-7207.

Drop all submitted patches.

Apply a patch from git to fix the build with clang.

[ YOCTO #11674 ]

$git log --oneline release_2_13..v2.14
4a41909 (HEAD, tag: v2.14) Version 2.14
6f9e5d3 Update NEWS
807b3ea Use GNU ls algorithm for deciding timestamp format
19219d1 Fix integer overflows in timestamp output
ed28f14 Whitespace cleanup
4ab2813 Update version of gnulib
0987d63 Fix appending to archives bigger than 2G
1df0062 Fix combination of --create, --append, --directory
6a94d5e New option --ignore-dirnlink
376d663 Fix 45b0ee2b407913c533f7ded8d6f8cbeec16ff6ca.
beba8c0 Require automake 1.16.5
70fffa7 Update for newer autotools
a1b2f78 Fix calculation of CRC in copy-out mode.
18ea636 Upgrade gnulib
1a61f62 Update copyright years
a1c97c8 Fix wording in the manpage
97fab48 Update copyright years
86dacfe Remove redundant condition check
4d16930 Use inttostr to represent integer values as strings
236684f Fix dynamic string reallocations
dfc801c Fix previous commit
dd96882 Rewrite dynamic string support.
269d204 Improve online version of the documentation.
7dd8ba9 Update gnulib
905907c Update copyright years
4a78d77 Formatting changes in the documentation.
9fe8494 Update copyright years
641d3f4 Minor fix * src/global.c: Remove superfluous declaration of program_name
0c4ffde Fix handling of device numbers (part 2)
df55fb1 Fix handling of device numbers on copy out.
b1c8583 Improve 684b7ac5
684b7ac Fix cpio header verification.

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...charset_alias-when-building-for-musl.patch |  30 -
 ...ove-superfluous-declaration-of-progr.patch |  28 -
 ...-calculation-of-CRC-in-copy-out-mode.patch |  58 --
 ...appending-to-archives-bigger-than-2G.patch | 312 ----------
 .../cpio/cpio-2.13/CVE-2021-38185.patch       | 581 ------------------
 .../cpio/{cpio_2.13.bb => cpio_2.14.bb}       |   9 +-
 ...e-needed-header-for-major-minor-macr.patch |  47 ++
 7 files changed, 49 insertions(+), 1016 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
 rename meta/recipes-extended/cpio/{cpio_2.13.bb => cpio_2.14.bb} (74%)
 create mode 100644 meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch
deleted file mode 100644
index 6ae213942c..0000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-Unset-need_charset_alias-when-building-for-musl.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From b9565dc2fe0c4f7daaec91b7e83bc7313dee2f4a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Mon, 13 Apr 2015 17:02:13 -0700
-Subject: [PATCH] Unset need_charset_alias when building for musl
-
-localcharset uses ac_cv_gnu_library_2_1 from glibc21.m4
-which actually shoudl be fixed in gnulib and then all downstream
-projects will get it eventually. For now we apply the fix to
-coreutils
-
-Upstream-Status: Pending
-
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/gnulib.mk | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-Index: cpio-2.11/gnu/Makefile.am
-===================================================================
---- cpio-2.11.orig/gnu/Makefile.am
-+++ cpio-2.11/gnu/Makefile.am
-@@ -734,7 +734,7 @@ install-exec-localcharset: all-local
- 	  case '$(host_os)' in \
- 	    darwin[56]*) \
- 	      need_charset_alias=true ;; \
--	    darwin* | cygwin* | mingw* | pw32* | cegcc*) \
-+	    darwin* | cygwin* | mingw* | pw32* | cegcc* | linux-musl*) \
- 	      need_charset_alias=false ;; \
- 	    *) \
- 	      need_charset_alias=true ;; \
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch b/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
deleted file mode 100644
index 478324c1c4..0000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0002-src-global.c-Remove-superfluous-declaration-of-progr.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 33e6cb5a28fab3d99bd6818f8c01e6f33805390f Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Mon, 20 Jan 2020 07:45:39 +0200
-Subject: [PATCH] src/global.c: Remove superfluous declaration of program_name
-
-Upstream-Status: Backport (commit 641d3f4)
-Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
----
- src/global.c | 3 ---
- 1 file changed, 3 deletions(-)
-
-diff --git a/src/global.c b/src/global.c
-index fb3abe9..acf92bc 100644
---- a/src/global.c
-+++ b/src/global.c
-@@ -184,9 +184,6 @@ unsigned int warn_option = 0;
- /* Extract to standard output? */
- bool to_stdout_option = false;
- 
--/* The name this program was run with.  */
--char *program_name;
--
- /* A pointer to either lstat or stat, depending on whether
-    dereferencing of symlinks is done for input files.  */
- int (*xstat) ();
--- 
-2.26.2
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch b/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
deleted file mode 100644
index 2dfd348d7c..0000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From d257e47a6c6b41ba727b196ac96c05ab91bd9d65 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Fri, 7 Apr 2023 11:23:37 +0300
-Subject: [PATCH 3/4] Fix calculation of CRC in copy-out mode.
-
-* src/copyout.c (read_for_checksum): Fix type of the file_size argument.
-Rewrite the reading loop.
-
-Original patch by Stefano Babic <sbabic@denx.de>
-
-Upstream-Status: Backport [a1b2f7871c3ae5113e0102b870b15ea06a8f0e3d]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- src/copyout.c | 16 +++++++---------
- 1 file changed, 7 insertions(+), 9 deletions(-)
-
-diff --git a/src/copyout.c b/src/copyout.c
-index 8b0beb6..f1ff351 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -34,27 +34,25 @@
-    compute and return a checksum for them.  */
- 
- static uint32_t
--read_for_checksum (int in_file_des, int file_size, char *file_name)
-+read_for_checksum (int in_file_des, off_t file_size, char *file_name)
- {
-   uint32_t crc;
--  char buf[BUFSIZ];
--  int bytes_left;
--  int bytes_read;
--  int i;
-+  unsigned char buf[BUFSIZ];
-+  ssize_t bytes_read;
-+  ssize_t i;
- 
-   crc = 0;
- 
--  for (bytes_left = file_size; bytes_left > 0; bytes_left -= bytes_read)
-+  while (file_size > 0)
-     {
-       bytes_read = read (in_file_des, buf, BUFSIZ);
-       if (bytes_read < 0)
- 	error (PAXEXIT_FAILURE, errno, _("cannot read checksum for %s"), file_name);
-       if (bytes_read == 0)
- 	break;
--      if (bytes_left < bytes_read)
--        bytes_read = bytes_left;
--      for (i = 0; i < bytes_read; ++i)
-+      for (i = 0; i < bytes_read; i++)
- 	crc += buf[i] & 0xff;
-+      file_size -= bytes_read;
-     }
-   if (lseek (in_file_des, 0L, SEEK_SET))
-     error (PAXEXIT_FAILURE, errno, _("cannot read checksum for %s"), file_name);
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch b/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
deleted file mode 100644
index c212bddf7d..0000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
+++ /dev/null
@@ -1,312 +0,0 @@
-From 8513495ab5cfb63eb7c4c933fdf0b78c6196cd27 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Fri, 28 Apr 2023 15:23:46 +0300
-Subject: [PATCH 4/4] Fix appending to archives bigger than 2G
-
-* src/extern.h (last_header_start): Change type to off_t.
-* src/global.c: Likewise.
-* src/util.c (prepare_append): Use off_t for file offsets.
-
-Upstream-Status: Backport [0987d63384f0419b4b14aecdc6a61729b75ce86a]
-Signed-off-by: Marek Vasut <marex@denx.de>
----
- src/extern.h | 11 ++++-----
- src/global.c |  2 +-
- src/util.c   | 66 ++++++++++++++++++++++++++--------------------------
- 3 files changed, 39 insertions(+), 40 deletions(-)
-
-diff --git a/src/extern.h b/src/extern.h
-index 11ac6bf..12f14a9 100644
---- a/src/extern.h
-+++ b/src/extern.h
-@@ -67,7 +67,7 @@ extern int ignore_devno_option;
- 
- extern bool to_stdout_option;
- 
--extern int last_header_start;
-+extern off_t last_header_start;
- extern int copy_matching_files;
- extern int numeric_uid;
- extern char *pattern_file_name;
-@@ -123,7 +123,7 @@ void field_width_error (const char *filename, const char *fieldname,
- 
- /* copypass.c */
- void process_copy_pass (void);
--int link_to_maj_min_ino (char *file_name, int st_dev_maj, 
-+int link_to_maj_min_ino (char *file_name, int st_dev_maj,
- 			 int st_dev_min, ino_t st_ino);
- int link_to_name (char const *link_name, char const *link_target);
- 
-@@ -171,7 +171,7 @@ void copy_files_tape_to_disk (int in_des, int out_des, off_t num_bytes);
- void copy_files_disk_to_tape (int in_des, int out_des, off_t num_bytes, char *filename);
- void copy_files_disk_to_disk (int in_des, int out_des, off_t num_bytes, char *filename);
- void warn_if_file_changed (char *file_name, off_t old_file_size,
--                           time_t old_file_mtime);
-+			   time_t old_file_mtime);
- void create_all_directories (char const *name);
- void prepare_append (int out_file_des);
- char *find_inode_file (ino_t node_num,
-@@ -185,7 +185,7 @@ void set_new_media_message (char *message);
- #ifdef HPUX_CDF
- char *add_cdf_double_slashes (char *filename);
- #endif
--void write_nuls_to_file (off_t num_bytes, int out_des, 
-+void write_nuls_to_file (off_t num_bytes, int out_des,
- 			 void (*writer) (char *in_buf,
- 					 int out_des, off_t num_bytes));
- #define DISK_IO_BLOCK_SIZE	512
-@@ -229,6 +229,5 @@ void delay_set_stat (char const *file_name, struct stat *st,
- 		     mode_t invert_permissions);
- int repair_delayed_set_stat (struct cpio_file_stat *file_hdr);
- void apply_delayed_set_stat (void);
--     
--int arf_stores_inode_p (enum archive_format arf);
- 
-+int arf_stores_inode_p (enum archive_format arf);
-diff --git a/src/global.c b/src/global.c
-index fb3abe9..5c9fc05 100644
---- a/src/global.c
-+++ b/src/global.c
-@@ -114,7 +114,7 @@ int debug_flag = false;
- 
- /* File position of last header read.  Only used during -A to determine
-    where the old TRAILER!!! record started.  */
--int last_header_start = 0;
-+off_t last_header_start = 0;
- 
- /* With -i; if true, copy only files that match any of the given patterns;
-    if false, copy only files that do not match any of the patterns. (-f) */
-diff --git a/src/util.c b/src/util.c
-index 4421b20..3be89a4 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -60,8 +60,8 @@ tape_empty_output_buffer (int out_des)
-   static long output_bytes_before_lseek = 0;
- 
-   /* Some tape drivers seem to have a signed internal seek pointer and
--     they lose if it overflows and becomes negative (e.g. when writing 
--     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the 
-+     they lose if it overflows and becomes negative (e.g. when writing
-+     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the
-      seek pointer and prevent it from overflowing.  */
-   if (output_is_special
-      && ( (output_bytes_before_lseek += output_size) >= 1073741824L) )
-@@ -106,7 +106,7 @@ static ssize_t sparse_write (int fildes, char *buf, size_t nbyte, bool flush);
-    descriptor OUT_DES and reset `output_size' and `out_buff'.
-    If `swapping_halfwords' or `swapping_bytes' is set,
-    do the appropriate swapping first.  Our callers have
--   to make sure to only set these flags if `output_size' 
-+   to make sure to only set these flags if `output_size'
-    is appropriate (a multiple of 4 for `swapping_halfwords',
-    2 for `swapping_bytes').  The fact that DISK_IO_BLOCK_SIZE
-    must always be a multiple of 4 helps us (and our callers)
-@@ -188,8 +188,8 @@ tape_fill_input_buffer (int in_des, int num_bytes)
- {
- #ifdef BROKEN_LONG_TAPE_DRIVER
-   /* Some tape drivers seem to have a signed internal seek pointer and
--     they lose if it overflows and becomes negative (e.g. when writing 
--     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the 
-+     they lose if it overflows and becomes negative (e.g. when writing
-+     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the
-      seek pointer and prevent it from overflowing.  */
-   if (input_is_special
-       && ( (input_bytes_before_lseek += num_bytes) >= 1073741824L) )
-@@ -332,8 +332,8 @@ tape_buffered_peek (char *peek_buf, int in_des, int num_bytes)
- 
- #ifdef BROKEN_LONG_TAPE_DRIVER
-   /* Some tape drivers seem to have a signed internal seek pointer and
--     they lose if it overflows and becomes negative (e.g. when writing 
--     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the 
-+     they lose if it overflows and becomes negative (e.g. when writing
-+     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the
-      seek pointer and prevent it from overflowing.  */
-   if (input_is_special
-       && ( (input_bytes_before_lseek += num_bytes) >= 1073741824L) )
-@@ -404,7 +404,7 @@ tape_toss_input (int in_des, off_t num_bytes)
- 
-       if (crc_i_flag && only_verify_crc_flag)
- 	{
-- 	  int k;
-+	  int k;
- 	  for (k = 0; k < space_left; ++k)
- 	    crc += in_buff[k] & 0xff;
- 	}
-@@ -416,14 +416,14 @@ tape_toss_input (int in_des, off_t num_bytes)
- }
- 
- void
--write_nuls_to_file (off_t num_bytes, int out_des, 
--                    void (*writer) (char *in_buf, int out_des, off_t num_bytes))
-+write_nuls_to_file (off_t num_bytes, int out_des,
-+		    void (*writer) (char *in_buf, int out_des, off_t num_bytes))
- {
-   off_t	blocks;
-   off_t	extra_bytes;
-   off_t	i;
-   static char zeros_512[512];
--  
-+
-   blocks = num_bytes / sizeof zeros_512;
-   extra_bytes = num_bytes % sizeof zeros_512;
-   for (i = 0; i < blocks; ++i)
-@@ -603,7 +603,7 @@ create_all_directories (char const *name)
-   char *dir;
- 
-   dir = dir_name (name);
--  
-+
-   if (dir == NULL)
-     error (PAXEXIT_FAILURE, 0, _("virtual memory exhausted"));
- 
-@@ -637,9 +637,9 @@ create_all_directories (char const *name)
- void
- prepare_append (int out_file_des)
- {
--  int start_of_header;
--  int start_of_block;
--  int useful_bytes_in_block;
-+  off_t start_of_header;
-+  off_t start_of_block;
-+  size_t useful_bytes_in_block;
-   char *tmp_buf;
- 
-   start_of_header = last_header_start;
-@@ -697,8 +697,8 @@ inode_val_compare (const void *val1, const void *val2)
-   const struct inode_val *ival1 = val1;
-   const struct inode_val *ival2 = val2;
-   return ival1->inode == ival2->inode
--         && ival1->major_num == ival2->major_num
--         && ival1->minor_num == ival2->minor_num;
-+	 && ival1->major_num == ival2->major_num
-+	 && ival1->minor_num == ival2->minor_num;
- }
- 
- static struct inode_val *
-@@ -706,10 +706,10 @@ find_inode_val (ino_t node_num, unsigned long major_num,
- 		 unsigned long minor_num)
- {
-   struct inode_val sample;
--  
-+
-   if (!hash_table)
-     return NULL;
--  
-+
-   sample.inode = node_num;
-   sample.major_num = major_num;
-   sample.minor_num = minor_num;
-@@ -734,7 +734,7 @@ add_inode (ino_t node_num, char *file_name, unsigned long major_num,
- {
-   struct inode_val *temp;
-   struct inode_val *e = NULL;
--  
-+
-   /* Create new inode record.  */
-   temp = (struct inode_val *) xmalloc (sizeof (struct inode_val));
-   temp->inode = node_num;
-@@ -1007,7 +1007,7 @@ buf_all_zeros (char *buf, int bufsize)
- 
- /* Write NBYTE bytes from BUF to file descriptor FILDES, trying to
-    create holes instead of writing blockfuls of zeros.
--   
-+
-    Return the number of bytes written (including bytes in zero
-    regions) on success, -1 on error.
- 
-@@ -1027,7 +1027,7 @@ sparse_write (int fildes, char *buf, size_t nbytes, bool flush)
- 
-   enum { begin, in_zeros, not_in_zeros } state =
- 			   delayed_seek_count ? in_zeros : begin;
--  
-+
-   while (nbytes)
-     {
-       size_t rest = nbytes;
-@@ -1042,7 +1042,7 @@ sparse_write (int fildes, char *buf, size_t nbytes, bool flush)
- 	      if (state == not_in_zeros)
- 		{
- 		  ssize_t bytes = buf - start_ptr + rest;
--		  
-+
- 		  n = write (fildes, start_ptr, bytes);
- 		  if (n == -1)
- 		    return -1;
-@@ -1091,8 +1091,8 @@ sparse_write (int fildes, char *buf, size_t nbytes, bool flush)
-       if (n != 1)
- 	return n;
-       delayed_seek_count = 0;
--    }      
--  
-+    }
-+
-   return nwritten + seek_count;
- }
- 
-@@ -1222,7 +1222,7 @@ set_perms (int fd, struct cpio_file_stat *header)
-   if (!no_chown_flag)
-     {
-       uid_t uid = CPIO_UID (header->c_uid);
--      gid_t gid = CPIO_GID (header->c_gid); 
-+      gid_t gid = CPIO_GID (header->c_gid);
-       if ((fchown_or_chown (fd, header->c_name, uid, gid) < 0)
- 	  && errno != EPERM)
- 	chown_error_details (header->c_name, uid, gid);
-@@ -1239,13 +1239,13 @@ set_file_times (int fd,
- 		const char *name, unsigned long atime, unsigned long mtime)
- {
-   struct timespec ts[2];
--  
-+
-   memset (&ts, 0, sizeof ts);
- 
-   ts[0].tv_sec = atime;
-   ts[1].tv_sec = mtime;
- 
--  /* Silently ignore EROFS because reading the file won't have upset its 
-+  /* Silently ignore EROFS because reading the file won't have upset its
-      timestamp if it's on a read-only filesystem. */
-   if (fdutimens (fd, name, ts) < 0 && errno != EROFS)
-     utime_error (name);
-@@ -1297,7 +1297,7 @@ cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
- 
- /* This is a simplified form of delayed set_stat used by GNU tar.
-    With the time, both forms will merge and pass to paxutils
--   
-+
-    List of directories whose statuses we need to extract after we've
-    finished extracting their subsidiary files.  If you consider each
-    contiguous subsequence of elements of the form [D]?[^D]*, where [D]
-@@ -1415,7 +1415,7 @@ cpio_mkdir (struct cpio_file_stat *file_hdr, int *setstat_delayed)
- {
-   int rc;
-   mode_t mode = file_hdr->c_mode;
--  
-+
-   if (!(file_hdr->c_mode & S_IWUSR))
-     {
-       rc = mkdir (file_hdr->c_name, mode | S_IWUSR);
-@@ -1438,10 +1438,10 @@ cpio_create_dir (struct cpio_file_stat *file_hdr, int existing_dir)
- {
-   int res;			/* Result of various function calls.  */
-   int setstat_delayed = 0;
--  
-+
-   if (to_stdout_option)
-     return 0;
--  
-+
-   /* Strip any trailing `/'s off the filename; tar puts
-      them on.  We might as well do it here in case anybody
-      else does too, since they cause strange things to happen.  */
-@@ -1530,7 +1530,7 @@ arf_stores_inode_p (enum archive_format arf)
-     }
-   return 1;
- }
--  
-+
- void
- cpio_file_stat_init (struct cpio_file_stat *file_hdr)
- {
--- 
-2.39.2
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch b/meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
deleted file mode 100644
index 6ceafeee49..0000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/CVE-2021-38185.patch
+++ /dev/null
@@ -1,581 +0,0 @@
-GNU cpio through 2.13 allows attackers to execute arbitrary code via a crafted
-pattern file, because of a dstring.c ds_fgetstr integer overflow that triggers
-an out-of-bounds heap write.
-
-CVE: CVE-2021-38185
-Upstream-Status: Backport
-Signed-off-by: Ross Burton <ross.burton@arm.com>
-
-From e494c68a3a0951b1eaba77e2db93f71a890e15d8 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Sat, 7 Aug 2021 12:52:21 +0300
-Subject: [PATCH 1/3] Rewrite dynamic string support.
-
-* src/dstring.c (ds_init): Take a single argument.
-(ds_free): New function.
-(ds_resize): Take a single argument.  Use x2nrealloc to expand
-the storage.
-(ds_reset,ds_append,ds_concat,ds_endswith): New function.
-(ds_fgetstr): Rewrite.  In particular, this fixes integer overflow.
-* src/dstring.h (dynamic_string): Keep both the allocated length
-(ds_size) and index of the next free byte in the string (ds_idx).
-(ds_init,ds_resize): Change signature.
-(ds_len): New macro.
-(ds_free,ds_reset,ds_append,ds_concat,ds_endswith): New protos.
-* src/copyin.c: Use new ds_ functions.
-* src/copyout.c: Likewise.
-* src/copypass.c: Likewise.
-* src/util.c: Likewise.
----
- src/copyin.c   | 40 +++++++++++------------
- src/copyout.c  | 16 ++++-----
- src/copypass.c | 34 +++++++++----------
- src/dstring.c  | 88 ++++++++++++++++++++++++++++++++++++--------------
- src/dstring.h  | 31 +++++++++---------
- src/util.c     |  6 ++--
- 6 files changed, 123 insertions(+), 92 deletions(-)
-
-diff --git a/src/copyin.c b/src/copyin.c
-index b29f348..37e503a 100644
---- a/src/copyin.c
-+++ b/src/copyin.c
-@@ -55,11 +55,12 @@ query_rename(struct cpio_file_stat* file_hdr, FILE *tty_in, FILE *tty_out,
-   char *str_res;		/* Result for string function.  */
-   static dynamic_string new_name;	/* New file name for rename option.  */
-   static int initialized_new_name = false;
-+
-   if (!initialized_new_name)
--  {
--    ds_init (&new_name, 128);
--    initialized_new_name = true;
--  }
-+    {
-+      ds_init (&new_name);
-+      initialized_new_name = true;
-+    }
- 
-   if (rename_flag)
-     {
-@@ -779,37 +780,36 @@ long_format (struct cpio_file_stat *file_hdr, char const *link_name)
-    already in `save_patterns' (from the command line) are preserved.  */
- 
- static void
--read_pattern_file ()
-+read_pattern_file (void)
- {
--  int max_new_patterns;
--  char **new_save_patterns;
--  int new_num_patterns;
-+  char **new_save_patterns = NULL;
-+  size_t max_new_patterns;
-+  size_t new_num_patterns;
-   int i;
--  dynamic_string pattern_name;
-+  dynamic_string pattern_name = DYNAMIC_STRING_INITIALIZER;
-   FILE *pattern_fp;
- 
-   if (num_patterns < 0)
-     num_patterns = 0;
--  max_new_patterns = 1 + num_patterns;
--  new_save_patterns = (char **) xmalloc (max_new_patterns * sizeof (char *));
-   new_num_patterns = num_patterns;
--  ds_init (&pattern_name, 128);
-+  max_new_patterns = num_patterns;
-+  new_save_patterns = xcalloc (max_new_patterns, sizeof (new_save_patterns[0]));
- 
-   pattern_fp = fopen (pattern_file_name, "r");
-   if (pattern_fp == NULL)
-     open_fatal (pattern_file_name);
-   while (ds_fgetstr (pattern_fp, &pattern_name, '\n') != NULL)
-     {
--      if (new_num_patterns >= max_new_patterns)
--	{
--	  max_new_patterns += 1;
--	  new_save_patterns = (char **)
--	    xrealloc ((char *) new_save_patterns,
--		      max_new_patterns * sizeof (char *));
--	}
-+      if (new_num_patterns == max_new_patterns)
-+	new_save_patterns = x2nrealloc (new_save_patterns,
-+					&max_new_patterns,
-+					sizeof (new_save_patterns[0]));
-       new_save_patterns[new_num_patterns] = xstrdup (pattern_name.ds_string);
-       ++new_num_patterns;
-     }
-+
-+  ds_free (&pattern_name);
-+  
-   if (ferror (pattern_fp) || fclose (pattern_fp) == EOF)
-     close_error (pattern_file_name);
- 
-@@ -1196,7 +1196,7 @@ swab_array (char *ptr, int count)
-    in the file system.  */
- 
- void
--process_copy_in ()
-+process_copy_in (void)
- {
-   char done = false;		/* True if trailer reached.  */
-   FILE *tty_in = NULL;		/* Interactive file for rename option.  */
-diff --git a/src/copyout.c b/src/copyout.c
-index 8b0beb6..26e3dda 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -594,9 +594,10 @@ assign_string (char **pvar, char *value)
-    The format of the header depends on the compatibility (-c) flag.  */
- 
- void
--process_copy_out ()
-+process_copy_out (void)
- {
--  dynamic_string input_name;	/* Name of file read from stdin.  */
-+  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of file read from stdin.  */
-   struct stat file_stat;	/* Stat record for file.  */
-   struct cpio_file_stat file_hdr = CPIO_FILE_STAT_INITIALIZER;
-                                 /* Output header information.  */
-@@ -605,7 +606,6 @@ process_copy_out ()
-   char *orig_file_name = NULL;
- 
-   /* Initialize the copy out.  */
--  ds_init (&input_name, 128);
-   file_hdr.c_magic = 070707;
- 
-   /* Check whether the output file might be a tape.  */
-@@ -657,14 +657,9 @@ process_copy_out ()
- 	    {
- 	      if (file_hdr.c_mode & CP_IFDIR)
- 		{
--		  int len = strlen (input_name.ds_string);
- 		  /* Make sure the name ends with a slash */
--		  if (input_name.ds_string[len-1] != '/')
--		    {
--		      ds_resize (&input_name, len + 2);
--		      input_name.ds_string[len] = '/';
--		      input_name.ds_string[len+1] = 0;
--		    }
-+		  if (!ds_endswith (&input_name, '/'))
-+		    ds_append (&input_name, '/');
- 		}
- 	    }
- 	  
-@@ -875,6 +870,7 @@ process_copy_out ()
- 			 (unsigned long) blocks), (unsigned long) blocks);
-     }
-   cpio_file_stat_free (&file_hdr);
-+  ds_free (&input_name);
- }
- 
- 
-diff --git a/src/copypass.c b/src/copypass.c
-index dc13b5b..62f31c6 100644
---- a/src/copypass.c
-+++ b/src/copypass.c
-@@ -48,10 +48,12 @@ set_copypass_perms (int fd, const char *name, struct stat *st)
-    If `link_flag', link instead of copying.  */
- 
- void
--process_copy_pass ()
-+process_copy_pass (void)
- {
--  dynamic_string input_name;	/* Name of file from stdin.  */
--  dynamic_string output_name;	/* Name of new file.  */
-+  dynamic_string input_name = DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of file from stdin.  */
-+  dynamic_string output_name = DYNAMIC_STRING_INITIALIZER;
-+                                /* Name of new file.  */
-   size_t dirname_len;		/* Length of `directory_name'.  */
-   int res;			/* Result of functions.  */
-   char *slash;			/* For moving past slashes in input name.  */
-@@ -65,25 +67,18 @@ process_copy_pass ()
- 				   created files  */
- 
-   /* Initialize the copy pass.  */
--  ds_init (&input_name, 128);
-   
-   dirname_len = strlen (directory_name);
-   if (change_directory_option && !ISSLASH (directory_name[0]))
-     {
-       char *pwd = xgetcwd ();
--
--      dirname_len += strlen (pwd) + 1;
--      ds_init (&output_name, dirname_len + 2);
--      strcpy (output_name.ds_string, pwd);
--      strcat (output_name.ds_string, "/");
--      strcat (output_name.ds_string, directory_name);
-+      
-+      ds_concat (&output_name, pwd);
-+      ds_append (&output_name, '/');
-     }
--  else
--    {
--      ds_init (&output_name, dirname_len + 2);
--      strcpy (output_name.ds_string, directory_name);
--    }
--  output_name.ds_string[dirname_len] = '/';
-+  ds_concat (&output_name, directory_name);
-+  ds_append (&output_name, '/');
-+  dirname_len = ds_len (&output_name);
-   output_is_seekable = true;
- 
-   change_dir ();
-@@ -116,8 +111,8 @@ process_copy_pass ()
-       /* Make the name of the new file.  */
-       for (slash = input_name.ds_string; *slash == '/'; ++slash)
- 	;
--      ds_resize (&output_name, dirname_len + strlen (slash) + 2);
--      strcpy (output_name.ds_string + dirname_len + 1, slash);
-+      ds_reset (&output_name, dirname_len);
-+      ds_concat (&output_name, slash);
- 
-       existing_dir = false;
-       if (lstat (output_name.ds_string, &out_file_stat) == 0)
-@@ -333,6 +328,9 @@ process_copy_pass ()
- 			 (unsigned long) blocks),
- 	       (unsigned long) blocks);
-     }
-+
-+  ds_free (&input_name);
-+  ds_free (&output_name);
- }
- 
- /* Try and create a hard link from FILE_NAME to another file 
-diff --git a/src/dstring.c b/src/dstring.c
-index e9c063f..358f356 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -20,8 +20,8 @@
- #if defined(HAVE_CONFIG_H)
- # include <config.h>
- #endif
--
- #include <stdio.h>
-+#include <stdlib.h>
- #if defined(HAVE_STRING_H) || defined(STDC_HEADERS)
- #include <string.h>
- #else
-@@ -33,24 +33,41 @@
- /* Initialiaze dynamic string STRING with space for SIZE characters.  */
- 
- void
--ds_init (dynamic_string *string, int size)
-+ds_init (dynamic_string *string)
-+{
-+  memset (string, 0, sizeof *string);
-+}
-+
-+/* Free the dynamic string storage. */
-+
-+void
-+ds_free (dynamic_string *string)
- {
--  string->ds_length = size;
--  string->ds_string = (char *) xmalloc (size);
-+  free (string->ds_string);
- }
- 
--/* Expand dynamic string STRING, if necessary, to hold SIZE characters.  */
-+/* Expand dynamic string STRING, if necessary.  */
- 
- void
--ds_resize (dynamic_string *string, int size)
-+ds_resize (dynamic_string *string)
- {
--  if (size > string->ds_length)
-+  if (string->ds_idx == string->ds_size)
-     {
--      string->ds_length = size;
--      string->ds_string = (char *) xrealloc ((char *) string->ds_string, size);
-+      string->ds_string = x2nrealloc (string->ds_string, &string->ds_size,
-+				      1);
-     }
- }
- 
-+/* Reset the index of the dynamic string S to LEN. */
-+
-+void
-+ds_reset (dynamic_string *s, size_t len)
-+{
-+  while (len > s->ds_size)
-+    ds_resize (s);
-+  s->ds_idx = len;
-+}
-+
- /* Dynamic string S gets a string terminated by the EOS character
-    (which is removed) from file F.  S will increase
-    in size during the function if the string from F is longer than
-@@ -61,34 +78,50 @@ ds_resize (dynamic_string *string, int size)
- char *
- ds_fgetstr (FILE *f, dynamic_string *s, char eos)
- {
--  int insize;			/* Amount needed for line.  */
--  int strsize;			/* Amount allocated for S.  */
-   int next_ch;
- 
-   /* Initialize.  */
--  insize = 0;
--  strsize = s->ds_length;
-+  s->ds_idx = 0;
- 
-   /* Read the input string.  */
--  next_ch = getc (f);
--  while (next_ch != eos && next_ch != EOF)
-+  while ((next_ch = getc (f)) != eos && next_ch != EOF)
-     {
--      if (insize >= strsize - 1)
--	{
--	  ds_resize (s, strsize * 2 + 2);
--	  strsize = s->ds_length;
--	}
--      s->ds_string[insize++] = next_ch;
--      next_ch = getc (f);
-+      ds_resize (s);
-+      s->ds_string[s->ds_idx++] = next_ch;
-     }
--  s->ds_string[insize++] = '\0';
-+  ds_resize (s);
-+  s->ds_string[s->ds_idx] = '\0';
- 
--  if (insize == 1 && next_ch == EOF)
-+  if (s->ds_idx == 0 && next_ch == EOF)
-     return NULL;
-   else
-     return s->ds_string;
- }
- 
-+void
-+ds_append (dynamic_string *s, int c)
-+{
-+  ds_resize (s);
-+  s->ds_string[s->ds_idx] = c;
-+  if (c)
-+    {
-+      s->ds_idx++;
-+      ds_resize (s);
-+      s->ds_string[s->ds_idx] = 0;
-+    }      
-+}
-+
-+void
-+ds_concat (dynamic_string *s, char const *str)
-+{
-+  size_t len = strlen (str);
-+  while (len + 1 > s->ds_size)
-+    ds_resize (s);
-+  memcpy (s->ds_string + s->ds_idx, str, len);
-+  s->ds_idx += len;
-+  s->ds_string[s->ds_idx] = 0;
-+}
-+
- char *
- ds_fgets (FILE *f, dynamic_string *s)
- {
-@@ -100,3 +133,10 @@ ds_fgetname (FILE *f, dynamic_string *s)
- {
-   return ds_fgetstr (f, s, '\0');
- }
-+
-+/* Return true if the dynamic string S ends with character C. */
-+int
-+ds_endswith (dynamic_string *s, int c)
-+{
-+  return (s->ds_idx > 0 && s->ds_string[s->ds_idx - 1] == c);
-+}
-diff --git a/src/dstring.h b/src/dstring.h
-index b5135fe..f5b04ef 100644
---- a/src/dstring.h
-+++ b/src/dstring.h
-@@ -17,10 +17,6 @@
-    Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
-    Boston, MA 02110-1301 USA.  */
- 
--#ifndef NULL
--#define NULL 0
--#endif
--
- /* A dynamic string consists of record that records the size of an
-    allocated string and the pointer to that string.  The actual string
-    is a normal zero byte terminated string that can be used with the
-@@ -30,22 +26,25 @@
- 
- typedef struct
- {
--  int ds_length;		/* Actual amount of storage allocated.  */
--  char *ds_string;		/* String.  */
-+  size_t ds_size;   /* Actual amount of storage allocated.  */
-+  size_t ds_idx;    /* Index of the next free byte in the string. */
-+  char *ds_string;  /* String storage. */
- } dynamic_string;
- 
-+#define DYNAMIC_STRING_INITIALIZER { 0, 0, NULL }
- 
--/* Macros that look similar to the original string functions.
--   WARNING:  These macros work only on pointers to dynamic string records.
--   If used with a real record, an "&" must be used to get the pointer.  */
--#define ds_strlen(s)		strlen ((s)->ds_string)
--#define ds_strcmp(s1, s2)	strcmp ((s1)->ds_string, (s2)->ds_string)
--#define ds_strncmp(s1, s2, n)	strncmp ((s1)->ds_string, (s2)->ds_string, n)
--#define ds_index(s, c)		index ((s)->ds_string, c)
--#define ds_rindex(s, c)		rindex ((s)->ds_string, c)
-+void ds_init (dynamic_string *string);
-+void ds_free (dynamic_string *string);
-+void ds_reset (dynamic_string *s, size_t len);
- 
--void ds_init (dynamic_string *string, int size);
--void ds_resize (dynamic_string *string, int size);
-+/* All functions below guarantee that s->ds_string[s->ds_idx] == '\0' */
- char *ds_fgetname (FILE *f, dynamic_string *s);
- char *ds_fgets (FILE *f, dynamic_string *s);
- char *ds_fgetstr (FILE *f, dynamic_string *s, char eos);
-+void ds_append (dynamic_string *s, int c);
-+void ds_concat (dynamic_string *s, char const *str);
-+
-+#define ds_len(s) ((s)->ds_idx)
-+
-+int ds_endswith (dynamic_string *s, int c);
-+
-diff --git a/src/util.c b/src/util.c
-index 4421b20..6d6bbaa 100644
---- a/src/util.c
-+++ b/src/util.c
-@@ -846,11 +846,9 @@ get_next_reel (int tape_des)
-   FILE *tty_out;		/* File for interacting with user.  */
-   int old_tape_des;
-   char *next_archive_name;
--  dynamic_string new_name;
-+  dynamic_string new_name = DYNAMIC_STRING_INITIALIZER;
-   char *str_res;
- 
--  ds_init (&new_name, 128);
--
-   /* Open files for interactive communication.  */
-   tty_in = fopen (TTY_NAME, "r");
-   if (tty_in == NULL)
-@@ -925,7 +923,7 @@ get_next_reel (int tape_des)
-     error (PAXEXIT_FAILURE, 0, _("internal error: tape descriptor changed from %d to %d"),
- 	   old_tape_des, tape_des);
- 
--  free (new_name.ds_string);
-+  ds_free (&new_name);
-   fclose (tty_in);
-   fclose (tty_out);
- }
--- 
-2.25.1
-
-
-From fb7a51bf85b8e6f045cacb4fb783db4a414741bf Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 11 Aug 2021 18:10:38 +0300
-Subject: [PATCH 2/3] Fix previous commit
-
-* src/dstring.c (ds_reset,ds_concat): Don't call ds_resize in a
-loop.
----
- src/dstring.c | 4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/src/dstring.c b/src/dstring.c
-index 358f356..90c691c 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -64,7 +64,7 @@ void
- ds_reset (dynamic_string *s, size_t len)
- {
-   while (len > s->ds_size)
--    ds_resize (s);
-+    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
-   s->ds_idx = len;
- }
- 
-@@ -116,7 +116,7 @@ ds_concat (dynamic_string *s, char const *str)
- {
-   size_t len = strlen (str);
-   while (len + 1 > s->ds_size)
--    ds_resize (s);
-+    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
-   memcpy (s->ds_string + s->ds_idx, str, len);
-   s->ds_idx += len;
-   s->ds_string[s->ds_idx] = 0;
--- 
-2.25.1
-
-
-From 86b37d74b15f9bb5fe62fd1642cc126d3ace0189 Mon Sep 17 00:00:00 2001
-From: Sergey Poznyakoff <gray@gnu.org>
-Date: Wed, 18 Aug 2021 09:41:39 +0300
-Subject: [PATCH 3/3] Fix dynamic string reallocations
-
-* src/dstring.c (ds_resize): Take additional argument: number of
-bytes to leave available after ds_idx.  All uses changed.
----
- src/dstring.c | 18 ++++++++----------
- 1 file changed, 8 insertions(+), 10 deletions(-)
-
-diff --git a/src/dstring.c b/src/dstring.c
-index 90c691c..0f597cc 100644
---- a/src/dstring.c
-+++ b/src/dstring.c
-@@ -49,9 +49,9 @@ ds_free (dynamic_string *string)
- /* Expand dynamic string STRING, if necessary.  */
- 
- void
--ds_resize (dynamic_string *string)
-+ds_resize (dynamic_string *string, size_t len)
- {
--  if (string->ds_idx == string->ds_size)
-+  while (len + string->ds_idx >= string->ds_size)
-     {
-       string->ds_string = x2nrealloc (string->ds_string, &string->ds_size,
- 				      1);
-@@ -63,8 +63,7 @@ ds_resize (dynamic_string *string)
- void
- ds_reset (dynamic_string *s, size_t len)
- {
--  while (len > s->ds_size)
--    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
-+  ds_resize (s, len);
-   s->ds_idx = len;
- }
- 
-@@ -86,10 +85,10 @@ ds_fgetstr (FILE *f, dynamic_string *s, char eos)
-   /* Read the input string.  */
-   while ((next_ch = getc (f)) != eos && next_ch != EOF)
-     {
--      ds_resize (s);
-+      ds_resize (s, 0);
-       s->ds_string[s->ds_idx++] = next_ch;
-     }
--  ds_resize (s);
-+  ds_resize (s, 0);
-   s->ds_string[s->ds_idx] = '\0';
- 
-   if (s->ds_idx == 0 && next_ch == EOF)
-@@ -101,12 +100,12 @@ ds_fgetstr (FILE *f, dynamic_string *s, char eos)
- void
- ds_append (dynamic_string *s, int c)
- {
--  ds_resize (s);
-+  ds_resize (s, 0);
-   s->ds_string[s->ds_idx] = c;
-   if (c)
-     {
-       s->ds_idx++;
--      ds_resize (s);
-+      ds_resize (s, 0);
-       s->ds_string[s->ds_idx] = 0;
-     }      
- }
-@@ -115,8 +114,7 @@ void
- ds_concat (dynamic_string *s, char const *str)
- {
-   size_t len = strlen (str);
--  while (len + 1 > s->ds_size)
--    s->ds_string = x2nrealloc (s->ds_string, &s->ds_size, 1);
-+  ds_resize (s, len);
-   memcpy (s->ds_string + s->ds_idx, str, len);
-   s->ds_idx += len;
-   s->ds_string[s->ds_idx] = 0;
--- 
-2.25.1
-
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.14.bb
similarity index 74%
rename from meta/recipes-extended/cpio/cpio_2.13.bb
rename to meta/recipes-extended/cpio/cpio_2.14.bb
index 6ac5653eab..c0b97ee166 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.14.bb
@@ -7,15 +7,10 @@ LICENSE = "GPL-3.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=f27defe1e96c2e1ecd4e0c9be8967949"
 
 SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
-           file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
-           file://0002-src-global.c-Remove-superfluous-declaration-of-progr.patch \
-           file://CVE-2021-38185.patch \
-           file://0003-Fix-calculation-of-CRC-in-copy-out-mode.patch \
-           file://0004-Fix-appending-to-archives-bigger-than-2G.patch \
+           file://0001-configure-Include-needed-header-for-major-minor-macr.patch \
            "
 
-SRC_URI[md5sum] = "389c5452d667c23b5eceb206f5000810"
-SRC_URI[sha256sum] = "e87470d9c984317f658567c03bfefb6b0c829ff17dbf6b0de48d71a4c8f3db88"
+SRC_URI[sha256sum] = "145a340fd9d55f0b84779a44a12d5f79d77c99663967f8cfa168d7905ca52454"
 
 inherit autotools gettext texinfo
 
diff --git a/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch b/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
new file mode 100644
index 0000000000..360dd1ebd8
--- /dev/null
+++ b/meta/recipes-extended/cpio/files/0001-configure-Include-needed-header-for-major-minor-macr.patch
@@ -0,0 +1,47 @@
+From 8179be21e664cedb2e9d238cc2f6d04965e97275 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Thu, 11 May 2023 10:18:44 +0300
+Subject: [PATCH] configure: Include needed header for major/minor macros
+
+This helps in avoiding the warning about implicit function declaration
+which is elevated as error with newer compilers e.g. clang 16
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream-Status: Backport [https://git.savannah.gnu.org/cgit/cpio.git/commit/?id=8179be21e664cedb2e9d238cc2f6d04965e97275]
+Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
+---
+ configure.ac | 18 ++++++++++++++++--
+ 1 file changed, 16 insertions(+), 2 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index de479e7..c601029 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -43,8 +43,22 @@ AC_TYPE_UID_T
+ AC_CHECK_TYPE(gid_t, int)
+
+ AC_HEADER_DIRENT
+-AX_COMPILE_CHECK_RETTYPE([major], [0])
+-AX_COMPILE_CHECK_RETTYPE([minor], [0])
++AX_COMPILE_CHECK_RETTYPE([major], [0], [
++#include <sys/types.h>
++#ifdef MAJOR_IN_MKDEV
++# include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++# include <sys/sysmacros.h>
++#endif])
++AX_COMPILE_CHECK_RETTYPE([minor], [0], [
++#include <sys/types.h>
++#ifdef MAJOR_IN_MKDEV
++# include <sys/mkdev.h>
++#endif
++#ifdef MAJOR_IN_SYSMACROS
++# include <sys/sysmacros.h>
++#endif])
+
+ AC_CHECK_FUNCS([fchmod fchown])
+ # This is needed for mingw build
+--
+2.34.1
-- 
2.34.1


