Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6638C77B7F
	for <webhook@archiver.kernel.org>; Sun, 14 May 2023 16:32:16 +0000 (UTC)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
 by mx.groups.io with SMTP id smtpd.web10.70172.1684081926740793272
 for <openembedded-core@lists.openembedded.org>;
 Sun, 14 May 2023 09:32:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=jQZglV7O;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.173, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-6434e263962so8680515b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 09:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1684081926; x=1686673926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lO2ioT0qzsIqDytd8aLIk/sL53G+SLodX23NwpdlxEM=;
        b=jQZglV7OKMjpZ5VB8Ejo/inhxl2Ebn5faU6O/ViQmCISJsiyVvQSCABbvRNZ7GlwAO
         +ut3u55IBkxun2xsZ2QpwNWl9eh624ugExekhXaFML1dAQjkIbFBe+YTZvqlKHPtYD84
         bog71VXO1yIwglRJFVK/cZISLER5584S2mF5IZGfCbgMuKNYnPjSnUxLzi1cWhR2ymoQ
         +fyKlHekdJVjVzY3ocNtgZlMy3ojevsKgvsw1TjVfLjlTr2SvvV5xqbtdyEBzGMrZnnX
         nWU9gWybmLJY7OtWnhhUxOEYU3echdAFxTDg/B1NXpfM3azBlE8TOAxXnneDl36wCZHH
         mKOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684081926; x=1686673926;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lO2ioT0qzsIqDytd8aLIk/sL53G+SLodX23NwpdlxEM=;
        b=h2Ms6rS710bVJVvjfSrA65QbNOHH4GupAG6wRw6eJ27COW8GatGZAS56sOb1tNG+OO
         sjFOLcJZiiFT290X6d8Rf8hywc6P6OuKwwsCIOr1x3iWQXv75VdrMEjg3heB6GmgoEUw
         M5grWmwYA0FiAqPl21KKrbIMbf+CqGFxRhwC1mek3PgQVrP3E2LjypqllsfF4wPPnJHd
         l7yVVs9Rp06BgS4lg1FnSmpSMGivhngpsjwGEfg4aTny2C3qpAB7JCb4nBRE1M6RLdqg
         1aOyyt2mRDtIVRmXj7mHm977ZWjgkNhQctDhFgbeGP/4v6crKrL+EELMwfQcrmSDj0SI
         RuJA==
X-Gm-Message-State: AC+VfDx9/rEWA22KNqctLcBdjiuMHhsUb6mAyd9mCpQFXS9sQzAoC6ge
	lsbfq+jRmmAKoMiUDvFjBkt1n6jj/MJN85KtS+4=
X-Google-Smtp-Source: ACHHUZ5kc8TFR0To3mVAL9Yt8mAf91mNyim//3Nh6GSJnh8wqje3M8xS7s+EvIF4WPy2rtrQlUv0YA==
X-Received: by 2002:a05:6a00:2189:b0:644:ad0e:ec3e with SMTP id h9-20020a056a00218900b00644ad0eec3emr33512235pfi.33.1684081925505;
        Sun, 14 May 2023 09:32:05 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id x14-20020aa784ce000000b006475f831838sm981877pfn.30.2023.05.14.09.32.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 09:32:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 11/15] cpio: fix appending to archives larger than 2GB
Date: Sun, 14 May 2023 06:31:36 -1000
Message-Id: <a161d6694b295c93244d67d69d8be8b09210bc32.1684081748.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1684081748.git.steve@sakoman.com>
References: <cover.1684081748.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 14 May 2023 16:32:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181212

From: Ross Burton <ross.burton@arm.com>

Backport a patch to fix appending to archives larger than 2GB.

[ YOCTO #11674 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 ...appending-to-archives-bigger-than-2G.patch | 312 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 2 files changed, 313 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-archives-bigger-than-2G.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-archives-bigger-than-2G.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-archives-bigger-than-2G.patch
new file mode 100644
index 0000000000..fefd5b2894
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-archives-bigger-than-2G.patch
@@ -0,0 +1,312 @@
+From 0987d63384f0419b4b14aecdc6a61729b75ce86a Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Fri, 28 Apr 2023 15:23:46 +0300
+Subject: [PATCH] Fix appending to archives bigger than 2G
+
+* src/extern.h (last_header_start): Change type to off_t.
+* src/global.c: Likewise.
+* src/util.c (prepare_append): Use off_t for file offsets.
+
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@arm.com>
+---
+ src/extern.h | 11 ++++-----
+ src/global.c |  2 +-
+ src/util.c   | 66 ++++++++++++++++++++++++++--------------------------
+ 3 files changed, 39 insertions(+), 40 deletions(-)
+
+diff --git a/src/extern.h b/src/extern.h
+index df7d0ce..6afbdd2 100644
+--- a/src/extern.h
++++ b/src/extern.h
+@@ -68,7 +68,7 @@ extern int ignore_dirnlink_option;
+ 
+ extern bool to_stdout_option;
+ 
+-extern int last_header_start;
++extern off_t last_header_start;
+ extern int copy_matching_files;
+ extern int numeric_uid;
+ extern char *pattern_file_name;
+@@ -128,7 +128,7 @@ void field_width_error (const char *filename, const char *fieldname,
+ 
+ /* copypass.c */
+ void process_copy_pass (void);
+-int link_to_maj_min_ino (char *file_name, int st_dev_maj, 
++int link_to_maj_min_ino (char *file_name, int st_dev_maj,
+ 			 int st_dev_min, ino_t st_ino);
+ int link_to_name (char const *link_name, char const *link_target);
+ 
+@@ -176,7 +176,7 @@ void copy_files_tape_to_disk (int in_des, int out_des, off_t num_bytes);
+ void copy_files_disk_to_tape (int in_des, int out_des, off_t num_bytes, char *filename);
+ void copy_files_disk_to_disk (int in_des, int out_des, off_t num_bytes, char *filename);
+ void warn_if_file_changed (char *file_name, off_t old_file_size,
+-                           time_t old_file_mtime);
++			   time_t old_file_mtime);
+ void create_all_directories (char const *name);
+ void prepare_append (int out_file_des);
+ char *find_inode_file (ino_t node_num,
+@@ -190,7 +190,7 @@ void set_new_media_message (char *message);
+ #ifdef HPUX_CDF
+ char *add_cdf_double_slashes (char *filename);
+ #endif
+-void write_nuls_to_file (off_t num_bytes, int out_des, 
++void write_nuls_to_file (off_t num_bytes, int out_des,
+ 			 void (*writer) (char *in_buf,
+ 					 int out_des, off_t num_bytes));
+ #define DISK_IO_BLOCK_SIZE	512
+@@ -234,6 +234,5 @@ void delay_set_stat (char const *file_name, struct stat *st,
+ 		     mode_t invert_permissions);
+ int repair_delayed_set_stat (struct cpio_file_stat *file_hdr);
+ void apply_delayed_set_stat (void);
+-     
+-int arf_stores_inode_p (enum archive_format arf);
+ 
++int arf_stores_inode_p (enum archive_format arf);
+diff --git a/src/global.c b/src/global.c
+index d33516f..7c4bca8 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -113,7 +113,7 @@ int debug_flag = false;
+ 
+ /* File position of last header read.  Only used during -A to determine
+    where the old TRAILER!!! record started.  */
+-int last_header_start = 0;
++off_t last_header_start = 0;
+ 
+ /* With -i; if true, copy only files that match any of the given patterns;
+    if false, copy only files that do not match any of the patterns. (-f) */
+diff --git a/src/util.c b/src/util.c
+index a38333a..7415e10 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -59,8 +59,8 @@ tape_empty_output_buffer (int out_des)
+   static long output_bytes_before_lseek = 0;
+ 
+   /* Some tape drivers seem to have a signed internal seek pointer and
+-     they lose if it overflows and becomes negative (e.g. when writing 
+-     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the 
++     they lose if it overflows and becomes negative (e.g. when writing
++     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the
+      seek pointer and prevent it from overflowing.  */
+   if (output_is_special
+      && ( (output_bytes_before_lseek += output_size) >= 1073741824L) )
+@@ -104,7 +104,7 @@ static ssize_t sparse_write (int fildes, char *buf, size_t nbyte, bool flush);
+    descriptor OUT_DES and reset `output_size' and `out_buff'.
+    If `swapping_halfwords' or `swapping_bytes' is set,
+    do the appropriate swapping first.  Our callers have
+-   to make sure to only set these flags if `output_size' 
++   to make sure to only set these flags if `output_size'
+    is appropriate (a multiple of 4 for `swapping_halfwords',
+    2 for `swapping_bytes').  The fact that DISK_IO_BLOCK_SIZE
+    must always be a multiple of 4 helps us (and our callers)
+@@ -186,8 +186,8 @@ tape_fill_input_buffer (int in_des, int num_bytes)
+ {
+ #ifdef BROKEN_LONG_TAPE_DRIVER
+   /* Some tape drivers seem to have a signed internal seek pointer and
+-     they lose if it overflows and becomes negative (e.g. when writing 
+-     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the 
++     they lose if it overflows and becomes negative (e.g. when writing
++     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the
+      seek pointer and prevent it from overflowing.  */
+   if (input_is_special
+       && ( (input_bytes_before_lseek += num_bytes) >= 1073741824L) )
+@@ -330,8 +330,8 @@ tape_buffered_peek (char *peek_buf, int in_des, int num_bytes)
+ 
+ #ifdef BROKEN_LONG_TAPE_DRIVER
+   /* Some tape drivers seem to have a signed internal seek pointer and
+-     they lose if it overflows and becomes negative (e.g. when writing 
+-     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the 
++     they lose if it overflows and becomes negative (e.g. when writing
++     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset the
+      seek pointer and prevent it from overflowing.  */
+   if (input_is_special
+       && ( (input_bytes_before_lseek += num_bytes) >= 1073741824L) )
+@@ -402,7 +402,7 @@ tape_toss_input (int in_des, off_t num_bytes)
+ 
+       if (crc_i_flag && only_verify_crc_flag)
+ 	{
+- 	  int k;
++	  int k;
+ 	  for (k = 0; k < space_left; ++k)
+ 	    crc += in_buff[k] & 0xff;
+ 	}
+@@ -414,14 +414,14 @@ tape_toss_input (int in_des, off_t num_bytes)
+ }
+ 
+ void
+-write_nuls_to_file (off_t num_bytes, int out_des, 
+-                    void (*writer) (char *in_buf, int out_des, off_t num_bytes))
++write_nuls_to_file (off_t num_bytes, int out_des,
++		    void (*writer) (char *in_buf, int out_des, off_t num_bytes))
+ {
+   off_t	blocks;
+   off_t	extra_bytes;
+   off_t	i;
+   static char zeros_512[512];
+-  
++
+   blocks = num_bytes / sizeof zeros_512;
+   extra_bytes = num_bytes % sizeof zeros_512;
+   for (i = 0; i < blocks; ++i)
+@@ -601,7 +601,7 @@ create_all_directories (char const *name)
+   char *dir;
+ 
+   dir = dir_name (name);
+-  
++
+   if (dir == NULL)
+     error (PAXEXIT_FAILURE, 0, _("virtual memory exhausted"));
+ 
+@@ -635,9 +635,9 @@ create_all_directories (char const *name)
+ void
+ prepare_append (int out_file_des)
+ {
+-  int start_of_header;
+-  int start_of_block;
+-  int useful_bytes_in_block;
++  off_t start_of_header;
++  off_t start_of_block;
++  size_t useful_bytes_in_block;
+   char *tmp_buf;
+ 
+   start_of_header = last_header_start;
+@@ -695,8 +695,8 @@ inode_val_compare (const void *val1, const void *val2)
+   const struct inode_val *ival1 = val1;
+   const struct inode_val *ival2 = val2;
+   return ival1->inode == ival2->inode
+-         && ival1->major_num == ival2->major_num
+-         && ival1->minor_num == ival2->minor_num;
++	 && ival1->major_num == ival2->major_num
++	 && ival1->minor_num == ival2->minor_num;
+ }
+ 
+ static struct inode_val *
+@@ -704,10 +704,10 @@ find_inode_val (ino_t node_num, unsigned long major_num,
+ 		 unsigned long minor_num)
+ {
+   struct inode_val sample;
+-  
++
+   if (!hash_table)
+     return NULL;
+-  
++
+   sample.inode = node_num;
+   sample.major_num = major_num;
+   sample.minor_num = minor_num;
+@@ -732,7 +732,7 @@ add_inode (ino_t node_num, char *file_name, unsigned long major_num,
+ {
+   struct inode_val *temp;
+   struct inode_val *e = NULL;
+-  
++
+   /* Create new inode record.  */
+   temp = (struct inode_val *) xmalloc (sizeof (struct inode_val));
+   temp->inode = node_num;
+@@ -1003,7 +1003,7 @@ buf_all_zeros (char *buf, int bufsize)
+ 
+ /* Write NBYTE bytes from BUF to file descriptor FILDES, trying to
+    create holes instead of writing blockfuls of zeros.
+-   
++
+    Return the number of bytes written (including bytes in zero
+    regions) on success, -1 on error.
+ 
+@@ -1023,7 +1023,7 @@ sparse_write (int fildes, char *buf, size_t nbytes, bool flush)
+ 
+   enum { begin, in_zeros, not_in_zeros } state =
+ 			   delayed_seek_count ? in_zeros : begin;
+-  
++
+   while (nbytes)
+     {
+       size_t rest = nbytes;
+@@ -1038,7 +1038,7 @@ sparse_write (int fildes, char *buf, size_t nbytes, bool flush)
+ 	      if (state == not_in_zeros)
+ 		{
+ 		  ssize_t bytes = buf - start_ptr + rest;
+-		  
++
+ 		  n = write (fildes, start_ptr, bytes);
+ 		  if (n == -1)
+ 		    return -1;
+@@ -1087,8 +1087,8 @@ sparse_write (int fildes, char *buf, size_t nbytes, bool flush)
+       if (n != 1)
+ 	return n;
+       delayed_seek_count = 0;
+-    }      
+-  
++    }
++
+   return nwritten + seek_count;
+ }
+ 
+@@ -1226,7 +1226,7 @@ set_perms (int fd, struct cpio_file_stat *header)
+   if (!no_chown_flag)
+     {
+       uid_t uid = CPIO_UID (header->c_uid);
+-      gid_t gid = CPIO_GID (header->c_gid); 
++      gid_t gid = CPIO_GID (header->c_gid);
+       if ((fchown_or_chown (fd, header->c_name, uid, gid) < 0)
+ 	  && errno != EPERM)
+ 	chown_error_details (header->c_name, uid, gid);
+@@ -1243,13 +1243,13 @@ set_file_times (int fd,
+ 		const char *name, unsigned long atime, unsigned long mtime)
+ {
+   struct timespec ts[2];
+-  
++
+   memset (&ts, 0, sizeof ts);
+ 
+   ts[0].tv_sec = atime;
+   ts[1].tv_sec = mtime;
+ 
+-  /* Silently ignore EROFS because reading the file won't have upset its 
++  /* Silently ignore EROFS because reading the file won't have upset its
+      timestamp if it's on a read-only filesystem. */
+   if (fdutimens (fd, name, ts) < 0 && errno != EROFS)
+     utime_error (name);
+@@ -1301,7 +1301,7 @@ cpio_safer_name_suffix (char *name, bool link_target, bool absolute_names,
+ 
+ /* This is a simplified form of delayed set_stat used by GNU tar.
+    With the time, both forms will merge and pass to paxutils
+-   
++
+    List of directories whose statuses we need to extract after we've
+    finished extracting their subsidiary files.  If you consider each
+    contiguous subsequence of elements of the form [D]?[^D]*, where [D]
+@@ -1419,7 +1419,7 @@ cpio_mkdir (struct cpio_file_stat *file_hdr, int *setstat_delayed)
+ {
+   int rc;
+   mode_t mode = file_hdr->c_mode;
+-  
++
+   if (!(file_hdr->c_mode & S_IWUSR))
+     {
+       rc = mkdir (file_hdr->c_name, mode | S_IWUSR);
+@@ -1442,10 +1442,10 @@ cpio_create_dir (struct cpio_file_stat *file_hdr, int existing_dir)
+ {
+   int res;			/* Result of various function calls.  */
+   int setstat_delayed = 0;
+-  
++
+   if (to_stdout_option)
+     return 0;
+-  
++
+   /* Strip any trailing `/'s off the filename; tar puts
+      them on.  We might as well do it here in case anybody
+      else does too, since they cause strange things to happen.  */
+@@ -1534,7 +1534,7 @@ arf_stores_inode_p (enum archive_format arf)
+     }
+   return 1;
+ }
+-  
++
+ void
+ cpio_file_stat_init (struct cpio_file_stat *file_hdr)
+ {
+-- 
+2.34.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-extended/cpio/cpio_2.13.bb
index df5e09cae8..d48429b8ce 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -13,6 +13,7 @@ SRC_URI = "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://CVE-2021-38185.patch \
            file://0001-Use-__alignof__-with-clang.patch \
            file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
+           file://0001-Fix-appending-to-archives-bigger-than-2G.patch \
            file://run-ptest \
            "
 
-- 
2.34.1


