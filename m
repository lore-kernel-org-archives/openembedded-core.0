Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D731BEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 14:08:37 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web11.14256.1687874915413499886
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 07:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=qWhZkFNm;
 spf=softfail (domain: sakoman.com, ip: 209.85.208.51, mailfrom: steve@sakoman.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-510d6b939bfso5983787a12.0
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 07:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1687874914; x=1690466914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ft8sGp7u93IQFScWNbFKzswt/fCS64lK4Zu33zHvuoY=;
        b=qWhZkFNm2ChGB7GEW5kuLqgUEdcSPhL3Iuyp4jYVzgLvGReOej7Qzl0/mfTd6CG4Dq
         uIAe1kJHt84HL43OLVyqOjoxHctLV9GjPg4L/FOCV1sSsAV9wXP6bWudD5gHIACfmXzu
         CsKR88uh3O148MNA1qCA3yLD97ctbq8XS1Bybi71mzMqRrErX8aEtBe3cIYnMrMpUi/r
         fn5lgfhjl/cyO/ayz4uaz0Kq9HQaMmalTl33Todxy6rZAmxppyeUGSsAlou4YEYhao7r
         USJmA209j9GUiCz6UnYAJdAckfDuGD9yoO3cP21A9vOePEmNoJCVHy8a8CNATtzMYYfe
         tovA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687874914; x=1690466914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ft8sGp7u93IQFScWNbFKzswt/fCS64lK4Zu33zHvuoY=;
        b=fW9xHjtboeLhgb1xdHjwMrM8kIOu2DgtWjPyJ6KL24sGCeT9wqIKBeLj1gqAbVW4RI
         UTxHnFWbD4SletyaPBZL8bqiQ5BgCy0IWlKrnRkylaSd+HJYuBh9MH1crx1GVjNz4IlN
         esUfLkEmKy40cUUTzDNUijGN2HmbragD7VG1ctJyK93wFqlBQLN09fAD1rZ7DIzoPJrJ
         CvcvyfWoeewuQXSsgOlbV9uOY+22O5mUWzGz69KvCFi0BelZL9w6hqSVlQJnk+NYb1Vk
         e8zkWbGP4St9nKPxIXZXi2vN6Xl+vul6MBMcw8P5g+jqjZ7gk+KdEiFcPptI++IY9Aly
         MxoA==
X-Gm-Message-State: AC+VfDz6RP7Mc3VD6+HyHkLPqtJ/iYOAUlBskZYrEpWZavT63w4j5EHk
	GhRXcF0c1vhCIuBdYHO6a7Na1KmOAs7GhyCWzwgbWw==
X-Google-Smtp-Source: ACHHUZ4hbh7DeVjUdWtXgBHOY+yXObifnlqgn5fwTr4eTY1YFIebt8HDpSkkfOa02x7SPSLfwn+mBWtJfQpLIWjb2GA=
X-Received: by 2002:aa7:d7d1:0:b0:51d:8955:9c8f with SMTP id
 e17-20020aa7d7d1000000b0051d89559c8fmr6791532eds.29.1687874913564; Tue, 27
 Jun 2023 07:08:33 -0700 (PDT)
MIME-Version: 1.0
References: <20230625135020.104159-1-marex@denx.de>
In-Reply-To: <20230625135020.104159-1-marex@denx.de>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 27 Jun 2023 04:08:21 -1000
Message-ID: <CAOSpxdYin7XBvq-r+CW1s6wan28cNnuJbsj-rHLXEx7_+NMCuw@mail.gmail.com>
Subject: Re: [kirkstone][PATCH] cpio: Replace fix wrong CRC with ASCII CRC for
 large files with upstream backport
To: Marek Vasut <marex@denx.de>
Cc: openembedded-core@lists.openembedded.org, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Khem Raj <raj.khem@gmail.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, Ross Burton <ross.burton@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 14:08:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183486

On Sun, Jun 25, 2023 at 3:50=E2=80=AFAM Marek Vasut <marex@denx.de> wrote:
>
> Replace the original "Wrong CRC with ASCII CRC for large files"
> patch with upstream backport, and add additional fix on top of
> the same problem which upstream detected and fixed.

Your replacement patches are missing Upstream-Status and Signed-off-by tags=
:

ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
/home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/cpio-2=
.13/0003-Fix-calculation-of-CRC-in-copy-out-mode.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
.
ERROR: cpio-2.13-r0 do_patch: Missing Upstream-Status in patch
/home/steve/builds/poky-contrib-kirkstone/meta/recipes-extended/cpio/cpio-2=
.13/0004-Fix-appending-to-archives-bigger-than-2G.patch
Please add according to
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Hea=
der_Recommendations:_Upstream-Status
.

Please submit a V2!

Thanks,

Steve

> Signed-off-by: Marek Vasut <marex@denx.de>
> ---
> NOTE: There is no oe-core/master counterpart, since oe-core/master
>       updated to cpio 2.14 in the meantime.
> ---
> Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>
> Cc: Khem Raj <raj.khem@gmail.com>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
> Cc: Ross Burton <ross.burton@arm.com>
> Cc: Steve Sakoman <steve@sakoman.com>
> ---
>  ...g-CRC-with-ASCII-CRC-for-large-files.patch |  39 ---
>  ...-calculation-of-CRC-in-copy-out-mode.patch |  55 ++++
>  ...appending-to-archives-bigger-than-2G.patch | 309 ++++++++++++++++++
>  meta/recipes-extended/cpio/cpio_2.13.bb       |   3 +-
>  4 files changed, 366 insertions(+), 40 deletions(-)
>  delete mode 100644 meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-w=
ith-ASCII-CRC-for-large-files.patch
>  create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calcula=
tion-of-CRC-in-copy-out-mode.patch
>  create mode 100644 meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appendi=
ng-to-archives-bigger-than-2G.patch
>
> diff --git a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASC=
II-CRC-for-large-files.patch b/meta/recipes-extended/cpio/cpio-2.13/0001-Wr=
ong-CRC-with-ASCII-CRC-for-large-files.patch
> deleted file mode 100644
> index 4b96e4316c..0000000000
> --- a/meta/recipes-extended/cpio/cpio-2.13/0001-Wrong-CRC-with-ASCII-CRC-=
for-large-files.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From 77ff5f1be394eb2c786df561ff37dde7f982ec76 Mon Sep 17 00:00:00 2001
> -From: Stefano Babic <sbabic@denx.de>
> -Date: Fri, 28 Jul 2017 13:20:52 +0200
> -Subject: [PATCH] Wrong CRC with ASCII CRC for large files
> -
> -Due to signedness, the checksum is not computed when filesize is bigger
> -a 2GB.
> -
> -Upstream-Status: Submitted [https://lists.gnu.org/archive/html/bug-cpio/=
2017-07/msg00004.html]
> -Signed-off-by: Stefano Babic <sbabic@denx.de>
> ----
> - src/copyout.c | 8 ++++----
> - 1 file changed, 4 insertions(+), 4 deletions(-)
> -
> -diff --git a/src/copyout.c b/src/copyout.c
> -index 1f0987a..727aeca 100644
> ---- a/src/copyout.c
> -+++ b/src/copyout.c
> -@@ -34,13 +34,13 @@
> -    compute and return a checksum for them.  */
> -
> - static uint32_t
> --read_for_checksum (int in_file_des, int file_size, char *file_name)
> -+read_for_checksum (int in_file_des, unsigned int file_size, char *file_=
name)
> - {
> -   uint32_t crc;
> -   char buf[BUFSIZ];
> --  int bytes_left;
> --  int bytes_read;
> --  int i;
> -+  unsigned int bytes_left;
> -+  unsigned int bytes_read;
> -+  unsigned int i;
> -
> -   crc =3D 0;
> -
> ---
> -2.7.4
> -
> diff --git a/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of=
-CRC-in-copy-out-mode.patch b/meta/recipes-extended/cpio/cpio-2.13/0003-Fix=
-calculation-of-CRC-in-copy-out-mode.patch
> new file mode 100644
> index 0000000000..aa478b5126
> --- /dev/null
> +++ b/meta/recipes-extended/cpio/cpio-2.13/0003-Fix-calculation-of-CRC-in=
-copy-out-mode.patch
> @@ -0,0 +1,55 @@
> +From d257e47a6c6b41ba727b196ac96c05ab91bd9d65 Mon Sep 17 00:00:00 2001
> +From: Sergey Poznyakoff <gray@gnu.org>
> +Date: Fri, 7 Apr 2023 11:23:37 +0300
> +Subject: [PATCH 3/4] Fix calculation of CRC in copy-out mode.
> +
> +* src/copyout.c (read_for_checksum): Fix type of the file_size argument.
> +Rewrite the reading loop.
> +
> +Original patch by Stefano Babic <sbabic@denx.de>
> +---
> + src/copyout.c | 16 +++++++---------
> + 1 file changed, 7 insertions(+), 9 deletions(-)
> +
> +diff --git a/src/copyout.c b/src/copyout.c
> +index 8b0beb6..f1ff351 100644
> +--- a/src/copyout.c
> ++++ b/src/copyout.c
> +@@ -34,27 +34,25 @@
> +    compute and return a checksum for them.  */
> +
> + static uint32_t
> +-read_for_checksum (int in_file_des, int file_size, char *file_name)
> ++read_for_checksum (int in_file_des, off_t file_size, char *file_name)
> + {
> +   uint32_t crc;
> +-  char buf[BUFSIZ];
> +-  int bytes_left;
> +-  int bytes_read;
> +-  int i;
> ++  unsigned char buf[BUFSIZ];
> ++  ssize_t bytes_read;
> ++  ssize_t i;
> +
> +   crc =3D 0;
> +
> +-  for (bytes_left =3D file_size; bytes_left > 0; bytes_left -=3D bytes_=
read)
> ++  while (file_size > 0)
> +     {
> +       bytes_read =3D read (in_file_des, buf, BUFSIZ);
> +       if (bytes_read < 0)
> +       error (PAXEXIT_FAILURE, errno, _("cannot read checksum for %s"), =
file_name);
> +       if (bytes_read =3D=3D 0)
> +       break;
> +-      if (bytes_left < bytes_read)
> +-        bytes_read =3D bytes_left;
> +-      for (i =3D 0; i < bytes_read; ++i)
> ++      for (i =3D 0; i < bytes_read; i++)
> +       crc +=3D buf[i] & 0xff;
> ++      file_size -=3D bytes_read;
> +     }
> +   if (lseek (in_file_des, 0L, SEEK_SET))
> +     error (PAXEXIT_FAILURE, errno, _("cannot read checksum for %s"), fi=
le_name);
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-a=
rchives-bigger-than-2G.patch b/meta/recipes-extended/cpio/cpio-2.13/0004-Fi=
x-appending-to-archives-bigger-than-2G.patch
> new file mode 100644
> index 0000000000..677702c0bc
> --- /dev/null
> +++ b/meta/recipes-extended/cpio/cpio-2.13/0004-Fix-appending-to-archives=
-bigger-than-2G.patch
> @@ -0,0 +1,309 @@
> +From 8513495ab5cfb63eb7c4c933fdf0b78c6196cd27 Mon Sep 17 00:00:00 2001
> +From: Sergey Poznyakoff <gray@gnu.org>
> +Date: Fri, 28 Apr 2023 15:23:46 +0300
> +Subject: [PATCH 4/4] Fix appending to archives bigger than 2G
> +
> +* src/extern.h (last_header_start): Change type to off_t.
> +* src/global.c: Likewise.
> +* src/util.c (prepare_append): Use off_t for file offsets.
> +---
> + src/extern.h | 11 ++++-----
> + src/global.c |  2 +-
> + src/util.c   | 66 ++++++++++++++++++++++++++--------------------------
> + 3 files changed, 39 insertions(+), 40 deletions(-)
> +
> +diff --git a/src/extern.h b/src/extern.h
> +index 11ac6bf..12f14a9 100644
> +--- a/src/extern.h
> ++++ b/src/extern.h
> +@@ -67,7 +67,7 @@ extern int ignore_devno_option;
> +
> + extern bool to_stdout_option;
> +
> +-extern int last_header_start;
> ++extern off_t last_header_start;
> + extern int copy_matching_files;
> + extern int numeric_uid;
> + extern char *pattern_file_name;
> +@@ -123,7 +123,7 @@ void field_width_error (const char *filename, const =
char *fieldname,
> +
> + /* copypass.c */
> + void process_copy_pass (void);
> +-int link_to_maj_min_ino (char *file_name, int st_dev_maj,
> ++int link_to_maj_min_ino (char *file_name, int st_dev_maj,
> +                        int st_dev_min, ino_t st_ino);
> + int link_to_name (char const *link_name, char const *link_target);
> +
> +@@ -171,7 +171,7 @@ void copy_files_tape_to_disk (int in_des, int out_de=
s, off_t num_bytes);
> + void copy_files_disk_to_tape (int in_des, int out_des, off_t num_bytes,=
 char *filename);
> + void copy_files_disk_to_disk (int in_des, int out_des, off_t num_bytes,=
 char *filename);
> + void warn_if_file_changed (char *file_name, off_t old_file_size,
> +-                           time_t old_file_mtime);
> ++                         time_t old_file_mtime);
> + void create_all_directories (char const *name);
> + void prepare_append (int out_file_des);
> + char *find_inode_file (ino_t node_num,
> +@@ -185,7 +185,7 @@ void set_new_media_message (char *message);
> + #ifdef HPUX_CDF
> + char *add_cdf_double_slashes (char *filename);
> + #endif
> +-void write_nuls_to_file (off_t num_bytes, int out_des,
> ++void write_nuls_to_file (off_t num_bytes, int out_des,
> +                        void (*writer) (char *in_buf,
> +                                        int out_des, off_t num_bytes));
> + #define DISK_IO_BLOCK_SIZE    512
> +@@ -229,6 +229,5 @@ void delay_set_stat (char const *file_name, struct s=
tat *st,
> +                    mode_t invert_permissions);
> + int repair_delayed_set_stat (struct cpio_file_stat *file_hdr);
> + void apply_delayed_set_stat (void);
> +-
> +-int arf_stores_inode_p (enum archive_format arf);
> +
> ++int arf_stores_inode_p (enum archive_format arf);
> +diff --git a/src/global.c b/src/global.c
> +index fb3abe9..5c9fc05 100644
> +--- a/src/global.c
> ++++ b/src/global.c
> +@@ -114,7 +114,7 @@ int debug_flag =3D false;
> +
> + /* File position of last header read.  Only used during -A to determine
> +    where the old TRAILER!!! record started.  */
> +-int last_header_start =3D 0;
> ++off_t last_header_start =3D 0;
> +
> + /* With -i; if true, copy only files that match any of the given patter=
ns;
> +    if false, copy only files that do not match any of the patterns. (-f=
) */
> +diff --git a/src/util.c b/src/util.c
> +index 4421b20..3be89a4 100644
> +--- a/src/util.c
> ++++ b/src/util.c
> +@@ -60,8 +60,8 @@ tape_empty_output_buffer (int out_des)
> +   static long output_bytes_before_lseek =3D 0;
> +
> +   /* Some tape drivers seem to have a signed internal seek pointer and
> +-     they lose if it overflows and becomes negative (e.g. when writing
> +-     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
> ++     they lose if it overflows and becomes negative (e.g. when writing
> ++     tapes > 2Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
> +      seek pointer and prevent it from overflowing.  */
> +   if (output_is_special
> +      && ( (output_bytes_before_lseek +=3D output_size) >=3D 1073741824L=
) )
> +@@ -106,7 +106,7 @@ static ssize_t sparse_write (int fildes, char *buf, =
size_t nbyte, bool flush);
> +    descriptor OUT_DES and reset `output_size' and `out_buff'.
> +    If `swapping_halfwords' or `swapping_bytes' is set,
> +    do the appropriate swapping first.  Our callers have
> +-   to make sure to only set these flags if `output_size'
> ++   to make sure to only set these flags if `output_size'
> +    is appropriate (a multiple of 4 for `swapping_halfwords',
> +    2 for `swapping_bytes').  The fact that DISK_IO_BLOCK_SIZE
> +    must always be a multiple of 4 helps us (and our callers)
> +@@ -188,8 +188,8 @@ tape_fill_input_buffer (int in_des, int num_bytes)
> + {
> + #ifdef BROKEN_LONG_TAPE_DRIVER
> +   /* Some tape drivers seem to have a signed internal seek pointer and
> +-     they lose if it overflows and becomes negative (e.g. when writing
> +-     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
> ++     they lose if it overflows and becomes negative (e.g. when writing
> ++     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
> +      seek pointer and prevent it from overflowing.  */
> +   if (input_is_special
> +       && ( (input_bytes_before_lseek +=3D num_bytes) >=3D 1073741824L) =
)
> +@@ -332,8 +332,8 @@ tape_buffered_peek (char *peek_buf, int in_des, int =
num_bytes)
> +
> + #ifdef BROKEN_LONG_TAPE_DRIVER
> +   /* Some tape drivers seem to have a signed internal seek pointer and
> +-     they lose if it overflows and becomes negative (e.g. when writing
> +-     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
> ++     they lose if it overflows and becomes negative (e.g. when writing
> ++     tapes > 4Gb).  Doing an lseek (des, 0, SEEK_SET) seems to reset th=
e
> +      seek pointer and prevent it from overflowing.  */
> +   if (input_is_special
> +       && ( (input_bytes_before_lseek +=3D num_bytes) >=3D 1073741824L) =
)
> +@@ -404,7 +404,7 @@ tape_toss_input (int in_des, off_t num_bytes)
> +
> +       if (crc_i_flag && only_verify_crc_flag)
> +       {
> +-        int k;
> ++        int k;
> +         for (k =3D 0; k < space_left; ++k)
> +           crc +=3D in_buff[k] & 0xff;
> +       }
> +@@ -416,14 +416,14 @@ tape_toss_input (int in_des, off_t num_bytes)
> + }
> +
> + void
> +-write_nuls_to_file (off_t num_bytes, int out_des,
> +-                    void (*writer) (char *in_buf, int out_des, off_t nu=
m_bytes))
> ++write_nuls_to_file (off_t num_bytes, int out_des,
> ++                  void (*writer) (char *in_buf, int out_des, off_t num_=
bytes))
> + {
> +   off_t       blocks;
> +   off_t       extra_bytes;
> +   off_t       i;
> +   static char zeros_512[512];
> +-
> ++
> +   blocks =3D num_bytes / sizeof zeros_512;
> +   extra_bytes =3D num_bytes % sizeof zeros_512;
> +   for (i =3D 0; i < blocks; ++i)
> +@@ -603,7 +603,7 @@ create_all_directories (char const *name)
> +   char *dir;
> +
> +   dir =3D dir_name (name);
> +-
> ++
> +   if (dir =3D=3D NULL)
> +     error (PAXEXIT_FAILURE, 0, _("virtual memory exhausted"));
> +
> +@@ -637,9 +637,9 @@ create_all_directories (char const *name)
> + void
> + prepare_append (int out_file_des)
> + {
> +-  int start_of_header;
> +-  int start_of_block;
> +-  int useful_bytes_in_block;
> ++  off_t start_of_header;
> ++  off_t start_of_block;
> ++  size_t useful_bytes_in_block;
> +   char *tmp_buf;
> +
> +   start_of_header =3D last_header_start;
> +@@ -697,8 +697,8 @@ inode_val_compare (const void *val1, const void *val=
2)
> +   const struct inode_val *ival1 =3D val1;
> +   const struct inode_val *ival2 =3D val2;
> +   return ival1->inode =3D=3D ival2->inode
> +-         && ival1->major_num =3D=3D ival2->major_num
> +-         && ival1->minor_num =3D=3D ival2->minor_num;
> ++       && ival1->major_num =3D=3D ival2->major_num
> ++       && ival1->minor_num =3D=3D ival2->minor_num;
> + }
> +
> + static struct inode_val *
> +@@ -706,10 +706,10 @@ find_inode_val (ino_t node_num, unsigned long majo=
r_num,
> +                unsigned long minor_num)
> + {
> +   struct inode_val sample;
> +-
> ++
> +   if (!hash_table)
> +     return NULL;
> +-
> ++
> +   sample.inode =3D node_num;
> +   sample.major_num =3D major_num;
> +   sample.minor_num =3D minor_num;
> +@@ -734,7 +734,7 @@ add_inode (ino_t node_num, char *file_name, unsigned=
 long major_num,
> + {
> +   struct inode_val *temp;
> +   struct inode_val *e =3D NULL;
> +-
> ++
> +   /* Create new inode record.  */
> +   temp =3D (struct inode_val *) xmalloc (sizeof (struct inode_val));
> +   temp->inode =3D node_num;
> +@@ -1007,7 +1007,7 @@ buf_all_zeros (char *buf, int bufsize)
> +
> + /* Write NBYTE bytes from BUF to file descriptor FILDES, trying to
> +    create holes instead of writing blockfuls of zeros.
> +-
> ++
> +    Return the number of bytes written (including bytes in zero
> +    regions) on success, -1 on error.
> +
> +@@ -1027,7 +1027,7 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
> +
> +   enum { begin, in_zeros, not_in_zeros } state =3D
> +                          delayed_seek_count ? in_zeros : begin;
> +-
> ++
> +   while (nbytes)
> +     {
> +       size_t rest =3D nbytes;
> +@@ -1042,7 +1042,7 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
> +             if (state =3D=3D not_in_zeros)
> +               {
> +                 ssize_t bytes =3D buf - start_ptr + rest;
> +-
> ++
> +                 n =3D write (fildes, start_ptr, bytes);
> +                 if (n =3D=3D -1)
> +                   return -1;
> +@@ -1091,8 +1091,8 @@ sparse_write (int fildes, char *buf, size_t nbytes=
, bool flush)
> +       if (n !=3D 1)
> +       return n;
> +       delayed_seek_count =3D 0;
> +-    }
> +-
> ++    }
> ++
> +   return nwritten + seek_count;
> + }
> +
> +@@ -1222,7 +1222,7 @@ set_perms (int fd, struct cpio_file_stat *header)
> +   if (!no_chown_flag)
> +     {
> +       uid_t uid =3D CPIO_UID (header->c_uid);
> +-      gid_t gid =3D CPIO_GID (header->c_gid);
> ++      gid_t gid =3D CPIO_GID (header->c_gid);
> +       if ((fchown_or_chown (fd, header->c_name, uid, gid) < 0)
> +         && errno !=3D EPERM)
> +       chown_error_details (header->c_name, uid, gid);
> +@@ -1239,13 +1239,13 @@ set_file_times (int fd,
> +               const char *name, unsigned long atime, unsigned long mtim=
e)
> + {
> +   struct timespec ts[2];
> +-
> ++
> +   memset (&ts, 0, sizeof ts);
> +
> +   ts[0].tv_sec =3D atime;
> +   ts[1].tv_sec =3D mtime;
> +
> +-  /* Silently ignore EROFS because reading the file won't have upset it=
s
> ++  /* Silently ignore EROFS because reading the file won't have upset it=
s
> +      timestamp if it's on a read-only filesystem. */
> +   if (fdutimens (fd, name, ts) < 0 && errno !=3D EROFS)
> +     utime_error (name);
> +@@ -1297,7 +1297,7 @@ cpio_safer_name_suffix (char *name, bool link_targ=
et, bool absolute_names,
> +
> + /* This is a simplified form of delayed set_stat used by GNU tar.
> +    With the time, both forms will merge and pass to paxutils
> +-
> ++
> +    List of directories whose statuses we need to extract after we've
> +    finished extracting their subsidiary files.  If you consider each
> +    contiguous subsequence of elements of the form [D]?[^D]*, where [D]
> +@@ -1415,7 +1415,7 @@ cpio_mkdir (struct cpio_file_stat *file_hdr, int *=
setstat_delayed)
> + {
> +   int rc;
> +   mode_t mode =3D file_hdr->c_mode;
> +-
> ++
> +   if (!(file_hdr->c_mode & S_IWUSR))
> +     {
> +       rc =3D mkdir (file_hdr->c_name, mode | S_IWUSR);
> +@@ -1438,10 +1438,10 @@ cpio_create_dir (struct cpio_file_stat *file_hdr=
, int existing_dir)
> + {
> +   int res;                    /* Result of various function calls.  */
> +   int setstat_delayed =3D 0;
> +-
> ++
> +   if (to_stdout_option)
> +     return 0;
> +-
> ++
> +   /* Strip any trailing `/'s off the filename; tar puts
> +      them on.  We might as well do it here in case anybody
> +      else does too, since they cause strange things to happen.  */
> +@@ -1530,7 +1530,7 @@ arf_stores_inode_p (enum archive_format arf)
> +     }
> +   return 1;
> + }
> +-
> ++
> + void
> + cpio_file_stat_init (struct cpio_file_stat *file_hdr)
> + {
> +--
> +2.39.2
> +
> diff --git a/meta/recipes-extended/cpio/cpio_2.13.bb b/meta/recipes-exten=
ded/cpio/cpio_2.13.bb
> index dd3541096f..6ac5653eab 100644
> --- a/meta/recipes-extended/cpio/cpio_2.13.bb
> +++ b/meta/recipes-extended/cpio/cpio_2.13.bb
> @@ -10,7 +10,8 @@ SRC_URI =3D "${GNU_MIRROR}/cpio/cpio-${PV}.tar.gz \
>             file://0001-Unset-need_charset_alias-when-building-for-musl.p=
atch \
>             file://0002-src-global.c-Remove-superfluous-declaration-of-pr=
ogr.patch \
>             file://CVE-2021-38185.patch \
> -           file://0001-Wrong-CRC-with-ASCII-CRC-for-large-files.patch \
> +           file://0003-Fix-calculation-of-CRC-in-copy-out-mode.patch \
> +           file://0004-Fix-appending-to-archives-bigger-than-2G.patch \
>             "
>
>  SRC_URI[md5sum] =3D "389c5452d667c23b5eceb206f5000810"
> --
> 2.40.1
>

