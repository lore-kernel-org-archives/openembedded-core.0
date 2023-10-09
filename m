Return-Path: <marex@denx.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22CADCD6103
	for <webhook@archiver.kernel.org>; Mon,  9 Oct 2023 16:26:11 +0000 (UTC)
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.67319.1696868759676262806
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Oct 2023 09:26:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@denx.de header.s=phobos-20191101 header.b=UG10OH1e;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: marex@denx.de)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 9E5C686B71;
	Mon,  9 Oct 2023 18:25:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1696868755;
	bh=pDi/VF1QqTtd8CYFpIkdaO9eIz7cvXggO3zEYMEMpmg=;
	h=From:To:Cc:Subject:Date:From;
	b=UG10OH1eXFmurW52aLb05f0YT7GIfZ5PGxVZ9GnUpHyqzh4Cp4KcJCavjnvLxtZNp
	 ltwG4Mnv21pRVwnAfsT01dTgSrChJrQxTWHmtAI3YgB6Tj7PtKvIUOolc2xWsb52Qh
	 lP+H2h/O90kkYIq1GCo4/SESTe/M8VBiGBYYlX9fuDhko2hAcSGZ+YmfU2JbqBtJOO
	 ttzoObRgzbQSRKLJqifimP07h4O2b+rZX7WX3f0dCIiubodK1SPuir5nyi9uUmpdDW
	 J9o3u1DaExWFQJRfcBw9DFl2rhqT1PiY8VjWwIv0wS57eE22YO5CP5KemVtQ8DLwCZ
	 s8RQYok81Vd6A==
From: Marek Vasut <marex@denx.de>
To: steve@sakoman.com,
	openembedded-core@lists.openembedded.org
Cc: Marek Vasut <marex@denx.de>
Subject: [dunfell][PATCH] cpio: Replace fix wrong CRC with ASCII CRC for large files with upstream backport
Date: Mon,  9 Oct 2023 18:25:43 +0200
Message-Id: <20231009162543.94130-1-marex@denx.de>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Oct 2023 16:26:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188843

Replace the original "Wrong CRC with ASCII CRC for large files"
patch with upstream backport, and add additional fix on top of
the same problem which upstream detected and fixed.

Signed-off-by: Marek Vasut <marex@denx.de>
---
 ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 ---
 ...-calculation-of-CRC-in-copy-out-mode.patch |  58 ++++
 ...appending-to-archives-bigger-than-2G.patch | 312 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   3 +-
 4 files changed, 372 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-w=
ith-ASCII-CRC-for-large-files.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calcula=
tion-of-CRC-in-copy-out-mode.patch
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appendi=
ng-to-archives-bigger-than-2G.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASC=
II-CRC-for-large-files.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-=
Wrong-CRC-with-ASCII-CRC-for-large-files.patch
deleted file mode 100644
index 4b96e4316c..0000000000
--- a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-=
for-large-files.patch
+++ /dev/null
@@ -1,39 +0,0 @@
-From 77ff5f1be394eb2c786df561ff37dde7f982ec76 Mon Sep 17 00:00:00 2001
-From: Stefano Babic <sbabic@denx.de>
-Date: Fri, 28 Jul 2017 13:20:52 +0200
-Subject: [PATCH] Wrong CRC with ASCII CRC for large files
-
-Due to signedness, the checksum is not computed when filesize is bigger
-a 2GB.
-
-Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-cpio/=
2017-07/msg00004.html]
-Signed-off-by: Stefano Babic <sbabic@denx.de>
----
- src/copyout.c | 8 ++++----
- 1 file changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/src/copyout.c b/src/copyout.c
-index 1f0987a..727aeca 100644
---- a/src/copyout.c
-+++ b/src/copyout.c
-@@ -34,13 +34,13 @@
-    compute and return a checksum for them.  */
-=20
- static uint32_t
--read_for_checksum (int in_file_des, int file_size, char *file_name)
-+read_for_checksum (int in_file_des, unsigned int file_size, char *file_=
name)
- {
-   uint32_t crc;
-   char buf[BUFSIZ];
--  int bytes_left;
--  int bytes_read;
--  int i;
-+  unsigned int bytes_left;
-+  unsigned int bytes_read;
-+  unsigned int i;
-=20
-   crc =3D 0;
-=20
---=20
-2.7.4
-
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of=
-CRC-in-copy-out-mode.patch b/meta/recipes-extended/cpio/cpio-2.13/0003-F=
ix-calculation-of-CRC-in-copy-out-mode.patch
new file mode 100644
index 0000000000..2dfd348d7c
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in=
-copy-out-mode.patch
@@ -0,0 +1,58 @@
+From d257e47a6c6b41ba727b196ac96c05ab91bd9d65 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Fri, 7 Apr 2023 11:23:37 +0300
+Subject: [PATCH 3/4] Fix calculation of CRC in copy-out mode.
+
+* src/copyout.c (read_for_checksum): Fix type of the file_size argument.
+Rewrite the reading loop.
+
+Original patch by Stefano Babic <sbabic@denx.de>
+
+Upstream-Status: Backport [a1b2f7871c3ae5113e0102b870b15ea06a8f0e3d]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/copyout.c | 16 +++++++---------
+ 1 file changed, 7 insertions(+), 9 deletions(-)
+
+diff --git a/src/copyout.c b/src/copyout.c
+index 8b0beb6..f1ff351 100644
+--- a/src/copyout.c
++++ b/src/copyout.c
+@@ -34,27 +34,25 @@
+    compute and return a checksum for them.  */
+=20
+ static uint32_t
+-read_for_checksum (int in_file_des, int file_size, char *file_name)
++read_for_checksum (int in_file_des, off_t file_size, char *file_name)
+ {
+   uint32_t crc;
+-  char buf[BUFSIZ];
+-  int bytes_left;
+-  int bytes_read;
+-  int i;
++  unsigned char buf[BUFSIZ];
++  ssize_t bytes_read;
++  ssize_t i;
+=20
+   crc =3D 0;
+=20
+-  for (bytes_left =3D file_size; bytes_left > 0; bytes_left -=3D bytes_=
read)
++  while (file_size > 0)
+     {
+       bytes_read =3D read (in_file_des, buf, BUFSIZ);
+       if (bytes_read < 0)
+ 	error (PAXEXIT_FAILURE, errno, _("cannot read checksum for %s"), file_=
name);
+       if (bytes_read =3D=3D 0)
+ 	break;
+-      if (bytes_left < bytes_read)
+-        bytes_read =3D bytes_left;
+-      for (i =3D 0; i < bytes_read; ++i)
++      for (i =3D 0; i < bytes_read; i++)
+ 	crc +=3D buf[i] & 0xff;
++      file_size -=3D bytes_read;
+     }
+   if (lseek (in_file_des, 0L, SEEK_SET))
+     error (PAXEXIT_FAILURE, errno, _("cannot read checksum for %s"), fi=
le_name);
+--=20
+2.39.2
+
diff --git a/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-a=
rchives-bigger-than-2G.patch b/meta/recipes-extended/cpio/cpio-2.13/0004-=
Fix-appending-to-archives-bigger-than-2G.patch
new file mode 100644
index 0000000000..c212bddf7d
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives=
-bigger-than-2G.patch
@@ -0,0 +1,312 @@
+From 8513495ab5cfb63eb7c4c933fdf0b78c6196cd27 Mon Sep 17 00:00:00 2001
+From: Sergey Poznyakoff <gray@gnu.org>
+Date: Fri, 28 Apr 2023 15:23:46 +0300
+Subject: [PATCH 4/4] Fix appending to archives bigger than 2G
+
+* src/extern.h (last_header_start): Change type to off_t.
+* src/global.c: Likewise.
+* src/util.c (prepare_append): Use off_t for file offsets.
+
+Upstream-Status: Backport [0987d63384f0419b4b14aecdc6a61729b75ce86a]
+Signed-off-by: Marek Vasut <marex@denx.de>
+---
+ src/extern.h | 11 ++++-----
+ src/global.c |  2 +-
+ src/util.c   | 66 ++++++++++++++++++++++++++--------------------------
+ 3 files changed, 39 insertions(+), 40 deletions(-)
+
+diff --git a/src/extern.h b/src/extern.h
+index 11ac6bf..12f14a9 100644
+--- a/src/extern.h
++++ b/src/extern.h
+@@ -67,7 +67,7 @@ extern int ignore_devno_option;
+=20
+ extern bool to_stdout_option;
+=20
+-extern int last_header_start;
++extern off_t last_header_start;
+ extern int copy_matching_files;
+ extern int numeric_uid;
+ extern char *pattern_file_name;
+@@ -123,7 +123,7 @@ void field_width_error (const char *filename, const =
char *fieldname,
+=20
+ /* copypass.c */
+ void process_copy_pass (void);
+-int link_to_maj_min_ino (char *file_name, int st_dev_maj,=20
++int link_to_maj_min_ino (char *file_name, int st_dev_maj,
+ 			 int st_dev_min, ino_t st_ino);
+ int link_to_name (char const *link_name, char const *link_target);
+=20
+@@ -171,7 +171,7 @@ void copy_files_tape_to_disk (int in_des, int out_de=
s, off_t num_bytes);
+ void copy_files_disk_to_tape (int in_des, int out_des, off_t num_bytes,=
 char *filename);
+ void copy_files_disk_to_disk (int in_des, int out_des, off_t num_bytes,=
 char *filename);
+ void warn_if_file_changed (char *file_name, off_t old_file_size,
+-                           time_t old_file_mtime);
++			   time_t old_file_mtime);
+ void create_all_directories (char const *name);
+ void prepare_append (int out_file_des);
+ char *find_inode_file (ino_t node_num,
+@@ -185,7 +185,7 @@ void set_new_media_message (char *message);
+ #ifdef HPUX_CDF
+ char *add_cdf_double_slashes (char *filename);
+ #endif
+-void write_nuls_to_file (off_t num_bytes, int out_des,=20
++void write_nuls_to_file (off_t num_bytes, int out_des,
+ 			 void (*writer) (char *in_buf,
+ 					 int out_des, off_t num_bytes));
+ #define DISK_IO_BLOCK_SIZE	512
+@@ -229,6 +229,5 @@ void delay_set_stat (char const *file_name, struct s=
tat *st,
+ 		     mode_t invert_permissions);
+ int repair_delayed_set_stat (struct cpio_file_stat *file_hdr);
+ void apply_delayed_set_stat (void);
+-    =20
+-int arf_stores_inode_p (enum archive_format arf);
+=20
++int arf_stores_inode_p (enum archive_format arf);
+diff --git a/src/global.c b/src/global.c
+index fb3abe9..5c9fc05 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -114,7 +114,7 @@ int debug_flag =3D false;
+=20
+ /* File position of last header read.  Only used during -A to determine
+    where the old TRAILER!!! record started.  */
+-int last_header_start =3D 0;
++off_t last_header_start =3D 0;
+=20
+ /* With -i; if true, copy only files that match any of the given patter=
ns;
+    if false, copy only files that do not match any of the patterns. (-f=
) */
+diff --git a/src/util.c b/src/util.c
+index 4421b20..3be89a4 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -60,8 +60,8 @@ tape_empty_output_buffer (int out_des)
+   static long output_bytes_before_lseek =3D 0;
+=20
+   /* Some tape drivers seem to have a signed internal seek pointer and
+-     they lose if it overflows and becomes negative (e.g. when writing=20
+-     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e=20
++     they lose if it overflows and becomes negative (e.g. when writing
++     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
+      seek pointer and prevent it from overflowing.  */
+   if (output_is_special
+      && ( (output_bytes_before_lseek +=3D output_size) >=3D 1073741824L=
) )
+@@ -106,7 +106,7 @@ static ssize_t sparse_write (int fildes, char *buf, =
size_t nbyte, bool flush);
+    descriptor OUT_DES and reset `output_size' and `out_buff'.
+    If `swapping_halfwords' or `swapping_bytes' is set,
+    do the appropriate swapping first.  Our callers have
+-   to make sure to only set these flags if `output_size'=20
++   to make sure to only set these flags if `output_size'
+    is appropriate (a multiple of 4 for `swapping_halfwords',
+    2 for `swapping_bytes').  The fact that DISK_IO_BLOCK_SIZE
+    must always be a multiple of 4 helps us (and our callers)
+@@ -188,8 +188,8 @@ tape_fill_input_buffer (int in_des, int num_bytes)
+ {
+ #ifdef BROKEN_LONG_TAPE_DRIVER
+   /* Some tape drivers seem to have a signed internal seek pointer and
+-     they lose if it overflows and becomes negative (e.g. when writing=20
+-     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e=20
++     they lose if it overflows and becomes negative (e.g. when writing
++     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
+      seek pointer and prevent it from overflowing.  */
+   if (input_is_special
+       && ( (input_bytes_before_lseek +=3D num_bytes) >=3D 1073741824L) =
)
+@@ -332,8 +332,8 @@ tape_buffered_peek (char *peek_buf, int in_des, int =
num_bytes)
+=20
+ #ifdef BROKEN_LONG_TAPE_DRIVER
+   /* Some tape drivers seem to have a signed internal seek pointer and
+-     they lose if it overflows and becomes negative (e.g. when writing=20
+-     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e=20
++     they lose if it overflows and becomes negative (e.g. when writing
++     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
+      seek pointer and prevent it from overflowing.  */
+   if (input_is_special
+       && ( (input_bytes_before_lseek +=3D num_bytes) >=3D 1073741824L) =
)
+@@ -404,7 +404,7 @@ tape_toss_input (int in_des, off_t num_bytes)
+=20
+       if (crc_i_flag && only_verify_crc_flag)
+ 	{
+- 	  int k;
++	  int k;
+ 	  for (k =3D 0; k < space_left; ++k)
+ 	    crc +=3D in_buff[k] & 0xff;
+ 	}
+@@ -416,14 +416,14 @@ tape_toss_input (int in_des, off_t num_bytes)
+ }
+ =0C
+ void
+-write_nuls_to_file (off_t num_bytes, int out_des,=20
+-                    void (*writer) (char *in_buf, int out_des, off_t nu=
m_bytes))
++write_nuls_to_file (off_t num_bytes, int out_des,
++		    void (*writer) (char *in_buf, int out_des, off_t num_bytes))
+ {
+   off_t	blocks;
+   off_t	extra_bytes;
+   off_t	i;
+   static char zeros_512[512];
+- =20
++
+   blocks =3D num_bytes / sizeof zeros_512;
+   extra_bytes =3D num_bytes % sizeof zeros_512;
+   for (i =3D 0; i < blocks; ++i)
+@@ -603,7 +603,7 @@ create_all_directories (char const *name)
+   char *dir;
+=20
+   dir =3D dir_name (name);
+- =20
++
+   if (dir =3D=3D NULL)
+     error (PAXEXIT_FAILURE, 0, _("virtual memory exhausted"));
+=20
+@@ -637,9 +637,9 @@ create_all_directories (char const *name)
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
+=20
+   start_of_header =3D last_header_start;
+@@ -697,8 +697,8 @@ inode_val_compare (const void *val1, const void *val=
2)
+   const struct inode_val *ival1 =3D val1;
+   const struct inode_val *ival2 =3D val2;
+   return ival1->inode =3D=3D ival2->inode
+-         && ival1->major_num =3D=3D ival2->major_num
+-         && ival1->minor_num =3D=3D ival2->minor_num;
++	 && ival1->major_num =3D=3D ival2->major_num
++	 && ival1->minor_num =3D=3D ival2->minor_num;
+ }
+=20
+ static struct inode_val *
+@@ -706,10 +706,10 @@ find_inode_val (ino_t node_num, unsigned long majo=
r_num,
+ 		 unsigned long minor_num)
+ {
+   struct inode_val sample;
+- =20
++
+   if (!hash_table)
+     return NULL;
+- =20
++
+   sample.inode =3D node_num;
+   sample.major_num =3D major_num;
+   sample.minor_num =3D minor_num;
+@@ -734,7 +734,7 @@ add_inode (ino_t node_num, char *file_name, unsigned=
 long major_num,
+ {
+   struct inode_val *temp;
+   struct inode_val *e =3D NULL;
+- =20
++
+   /* Create new inode record.  */
+   temp =3D (struct inode_val *) xmalloc (sizeof (struct inode_val));
+   temp->inode =3D node_num;
+@@ -1007,7 +1007,7 @@ buf_all_zeros (char *buf, int bufsize)
+=20
+ /* Write NBYTE bytes from BUF to file descriptor FILDES, trying to
+    create holes instead of writing blockfuls of zeros.
+-  =20
++
+    Return the number of bytes written (including bytes in zero
+    regions) on success, -1 on error.
+=20
+@@ -1027,7 +1027,7 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
+=20
+   enum { begin, in_zeros, not_in_zeros } state =3D
+ 			   delayed_seek_count ? in_zeros : begin;
+- =20
++
+   while (nbytes)
+     {
+       size_t rest =3D nbytes;
+@@ -1042,7 +1042,7 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
+ 	      if (state =3D=3D not_in_zeros)
+ 		{
+ 		  ssize_t bytes =3D buf - start_ptr + rest;
+-		 =20
++
+ 		  n =3D write (fildes, start_ptr, bytes);
+ 		  if (n =3D=3D -1)
+ 		    return -1;
+@@ -1091,8 +1091,8 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
+       if (n !=3D 1)
+ 	return n;
+       delayed_seek_count =3D 0;
+-    }     =20
+- =20
++    }
++
+   return nwritten + seek_count;
+ }
+=20
+@@ -1222,7 +1222,7 @@ set_perms (int fd, struct cpio_file_stat *header)
+   if (!no_chown_flag)
+     {
+       uid_t uid =3D CPIO_UID (header->c_uid);
+-      gid_t gid =3D CPIO_GID (header->c_gid);=20
++      gid_t gid =3D CPIO_GID (header->c_gid);
+       if ((fchown_or_chown (fd, header->c_name, uid, gid) < 0)
+ 	  && errno !=3D EPERM)
+ 	chown_error_details (header->c_name, uid, gid);
+@@ -1239,13 +1239,13 @@ set_file_times (int fd,
+ 		const char *name, unsigned long atime, unsigned long mtime)
+ {
+   struct timespec ts[2];
+- =20
++
+   memset (&ts, 0, sizeof ts);
+=20
+   ts[0].tv_sec =3D atime;
+   ts[1].tv_sec =3D mtime;
+=20
+-  /* Silently ignore EROFS because reading the file won't have upset it=
s=20
++  /* Silently ignore EROFS because reading the file won't have upset it=
s
+      timestamp if it's on a read-only filesystem. */
+   if (fdutimens (fd, name, ts) < 0 && errno !=3D EROFS)
+     utime_error (name);
+@@ -1297,7 +1297,7 @@ cpio_safer_name_suffix (char *name, bool link_targ=
et, bool absolute_names,
+ =0C
+ /* This is a simplified form of delayed set_stat used by GNU tar.
+    With the time, both forms will merge and pass to paxutils
+-  =20
++
+    List of directories whose statuses we need to extract after we've
+    finished extracting their subsidiary files.  If you consider each
+    contiguous subsequence of elements of the form [D]?[^D]*, where [D]
+@@ -1415,7 +1415,7 @@ cpio_mkdir (struct cpio_file_stat *file_hdr, int *=
setstat_delayed)
+ {
+   int rc;
+   mode_t mode =3D file_hdr->c_mode;
+- =20
++
+   if (!(file_hdr->c_mode & S_IWUSR))
+     {
+       rc =3D mkdir (file_hdr->c_name, mode | S_IWUSR);
+@@ -1438,10 +1438,10 @@ cpio_create_dir (struct cpio_file_stat *file_hdr=
, int existing_dir)
+ {
+   int res;			/* Result of various function calls.  */
+   int setstat_delayed =3D 0;
+- =20
++
+   if (to_stdout_option)
+     return 0;
+- =20
++
+   /* Strip any trailing `/'s off the filename; tar puts
+      them on.  We might as well do it here in case anybody
+      else does too, since they cause strange things to happen.  */
+@@ -1530,7 +1530,7 @@ arf_stores_inode_p (enum archive_format arf)
+     }
+   return 1;
+ }
+- =20
++
+ void
+ cpio_file_stat_init (struct cpio_file_stat *file_hdr)
+ {
+--=20
+2.39.2
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-exten=
ded/cpio/cpio_2.13.bb
index 86527da744..5ab567f360 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -10,7 +10,8 @@ SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://0001-Unset-need_charset_alias-when-building-for-musl.p=
atch \
            file://0002-src-global.c-Remove-superfluous-declaration-of-pr=
ogr.patch \
            file://CVE-2021-38185.patch \
-           file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
+           file://0003-Fix-calculation-of-CRC-in-copy-out-mode.patch \
+           file://0004-Fix-appending-to-archives-bigger-than-2G.patch \
            "
=20
 SRC_URI[md5sum] =3D "389c5452d667c23b5eceb206f5000810"
--=20
2.40.1


