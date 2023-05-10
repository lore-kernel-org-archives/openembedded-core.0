Return-Path: <ross.burton@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5995C77B7D
	for <webhook@archiver.kernel.org>; Wed, 10 May 2023 17:00:40 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.23050.1683738039279579329
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 May 2023 10:00:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 183471063;
	Wed, 10 May 2023 10:01:23 -0700 (PDT)
Received: from oss-tx204.lab.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 21C8D3F5A1;
	Wed, 10 May 2023 10:00:38 -0700 (PDT)
From: ross.burton@arm.com
To: openembedded-core@lists.openembedded.org
Cc: nd@arm.com
Subject: [PATCH][mickledore] cpio: fix appending to archives larger than 2GB
Date: Wed, 10 May 2023 18:00:34 +0100
Message-Id: <20230510170034.2747007-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 May 2023 17:00:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/181121

From: Ross Burton <ross.burton@arm.com>

Backport a patch to fix appending to archives larger than 2GB.

[ YOCTO #11674 ]

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 ...appending-to-archives-bigger-than-2G.patch | 312 ++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.13.bb       |   1 +
 2 files changed, 313 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appendi=
ng-to-archives-bigger-than-2G.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-a=
rchives-bigger-than-2G.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-=
Fix-appending-to-archives-bigger-than-2G.patch
new file mode 100644
index 00000000000..fefd5b2894e
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.13/0001-Fix-appending-to-archives=
-bigger-than-2G.patch
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
+=20
+ extern bool to_stdout_option;
+=20
+-extern int last_header_start;
++extern off_t last_header_start;
+ extern int copy_matching_files;
+ extern int numeric_uid;
+ extern char *pattern_file_name;
+@@ -128,7 +128,7 @@ void field_width_error (const char *filename, const =
char *fieldname,
+=20
+ /* copypass.c */
+ void process_copy_pass (void);
+-int link_to_maj_min_ino (char *file_name, int st_dev_maj,=20
++int link_to_maj_min_ino (char *file_name, int st_dev_maj,
+ 			 int st_dev_min, ino_t st_ino);
+ int link_to_name (char const *link_name, char const *link_target);
+=20
+@@ -176,7 +176,7 @@ void copy_files_tape_to_disk (int in_des, int out_de=
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
+@@ -190,7 +190,7 @@ void set_new_media_message (char *message);
+ #ifdef HPUX_CDF
+ char *add_cdf_double_slashes (char *filename);
+ #endif
+-void write_nuls_to_file (off_t num_bytes, int out_des,=20
++void write_nuls_to_file (off_t num_bytes, int out_des,
+ 			 void (*writer) (char *in_buf,
+ 					 int out_des, off_t num_bytes));
+ #define DISK_IO_BLOCK_SIZE	512
+@@ -234,6 +234,5 @@ void delay_set_stat (char const *file_name, struct s=
tat *st,
+ 		     mode_t invert_permissions);
+ int repair_delayed_set_stat (struct cpio_file_stat *file_hdr);
+ void apply_delayed_set_stat (void);
+-    =20
+-int arf_stores_inode_p (enum archive_format arf);
+=20
++int arf_stores_inode_p (enum archive_format arf);
+diff --git a/src/global.c b/src/global.c
+index d33516f..7c4bca8 100644
+--- a/src/global.c
++++ b/src/global.c
+@@ -113,7 +113,7 @@ int debug_flag =3D false;
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
+index a38333a..7415e10 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -59,8 +59,8 @@ tape_empty_output_buffer (int out_des)
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
+@@ -104,7 +104,7 @@ static ssize_t sparse_write (int fildes, char *buf, =
size_t nbyte, bool flush);
+    descriptor OUT_DES and reset `output_size' and `out_buff'.
+    If `swapping_halfwords' or `swapping_bytes' is set,
+    do the appropriate swapping first.  Our callers have
+-   to make sure to only set these flags if `output_size'=20
++   to make sure to only set these flags if `output_size'
+    is appropriate (a multiple of 4 for `swapping_halfwords',
+    2 for `swapping_bytes').  The fact that DISK_IO_BLOCK_SIZE
+    must always be a multiple of 4 helps us (and our callers)
+@@ -186,8 +186,8 @@ tape_fill_input_buffer (int in_des, int num_bytes)
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
+@@ -330,8 +330,8 @@ tape_buffered_peek (char *peek_buf, int in_des, int =
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
+@@ -402,7 +402,7 @@ tape_toss_input (int in_des, off_t num_bytes)
+=20
+       if (crc_i_flag && only_verify_crc_flag)
+ 	{
+- 	  int k;
++	  int k;
+ 	  for (k =3D 0; k < space_left; ++k)
+ 	    crc +=3D in_buff[k] & 0xff;
+ 	}
+@@ -414,14 +414,14 @@ tape_toss_input (int in_des, off_t num_bytes)
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
+@@ -601,7 +601,7 @@ create_all_directories (char const *name)
+   char *dir;
+=20
+   dir =3D dir_name (name);
+- =20
++
+   if (dir =3D=3D NULL)
+     error (PAXEXIT_FAILURE, 0, _("virtual memory exhausted"));
+=20
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
+=20
+   start_of_header =3D last_header_start;
+@@ -695,8 +695,8 @@ inode_val_compare (const void *val1, const void *val=
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
+@@ -704,10 +704,10 @@ find_inode_val (ino_t node_num, unsigned long majo=
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
+@@ -732,7 +732,7 @@ add_inode (ino_t node_num, char *file_name, unsigned=
 long major_num,
+ {
+   struct inode_val *temp;
+   struct inode_val *e =3D NULL;
+- =20
++
+   /* Create new inode record.  */
+   temp =3D (struct inode_val *) xmalloc (sizeof (struct inode_val));
+   temp->inode =3D node_num;
+@@ -1003,7 +1003,7 @@ buf_all_zeros (char *buf, int bufsize)
+=20
+ /* Write NBYTE bytes from BUF to file descriptor FILDES, trying to
+    create holes instead of writing blockfuls of zeros.
+-  =20
++
+    Return the number of bytes written (including bytes in zero
+    regions) on success, -1 on error.
+=20
+@@ -1023,7 +1023,7 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
+=20
+   enum { begin, in_zeros, not_in_zeros } state =3D
+ 			   delayed_seek_count ? in_zeros : begin;
+- =20
++
+   while (nbytes)
+     {
+       size_t rest =3D nbytes;
+@@ -1038,7 +1038,7 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
+ 	      if (state =3D=3D not_in_zeros)
+ 		{
+ 		  ssize_t bytes =3D buf - start_ptr + rest;
+-		 =20
++
+ 		  n =3D write (fildes, start_ptr, bytes);
+ 		  if (n =3D=3D -1)
+ 		    return -1;
+@@ -1087,8 +1087,8 @@ sparse_write (int fildes, char *buf, size_t nbytes=
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
+@@ -1226,7 +1226,7 @@ set_perms (int fd, struct cpio_file_stat *header)
+   if (!no_chown_flag)
+     {
+       uid_t uid =3D CPIO_UID (header->c_uid);
+-      gid_t gid =3D CPIO_GID (header->c_gid);=20
++      gid_t gid =3D CPIO_GID (header->c_gid);
+       if ((fchown_or_chown (fd, header->c_name, uid, gid) < 0)
+ 	  && errno !=3D EPERM)
+ 	chown_error_details (header->c_name, uid, gid);
+@@ -1243,13 +1243,13 @@ set_file_times (int fd,
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
+@@ -1301,7 +1301,7 @@ cpio_safer_name_suffix (char *name, bool link_targ=
et, bool absolute_names,
+ =0C
+ /* This is a simplified form of delayed set_stat used by GNU tar.
+    With the time, both forms will merge and pass to paxutils
+-  =20
++
+    List of directories whose statuses we need to extract after we've
+    finished extracting their subsidiary files.  If you consider each
+    contiguous subsequence of elements of the form [D]?[^D]*, where [D]
+@@ -1419,7 +1419,7 @@ cpio_mkdir (struct cpio_file_stat *file_hdr, int *=
setstat_delayed)
+ {
+   int rc;
+   mode_t mode =3D file_hdr->c_mode;
+- =20
++
+   if (!(file_hdr->c_mode & S_IWUSR))
+     {
+       rc =3D mkdir (file_hdr->c_name, mode | S_IWUSR);
+@@ -1442,10 +1442,10 @@ cpio_create_dir (struct cpio_file_stat *file_hdr=
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
+@@ -1534,7 +1534,7 @@ arf_stores_inode_p (enum archive_format arf)
+     }
+   return 1;
+ }
+- =20
++
+ void
+ cpio_file_stat_init (struct cpio_file_stat *file_hdr)
+ {
+--=20
+2.34.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-exten=
ded/cpio/cpio_2.13.bb
index df5e09cae82..d48429b8ce7 100644
--- a/meta/recipes-extended/cpio/cpio_2.13.bb
+++ b/meta/recipes-extended/cpio/cpio_2.13.bb
@@ -13,6 +13,7 @@ SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
            file://CVE-2021-38185.patch \
            file://0001-Use-__alignof__-with-clang.patch \
            file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
+           file://0001-Fix-appending-to-archives-bigger-than-2G.patch \
            file://run-ptest \
            "
=20
--=20
2.34.1


