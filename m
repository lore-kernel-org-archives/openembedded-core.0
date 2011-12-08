Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1RYgCW-0007jj-0e
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:48:32 +0100
Received: by ggnh1 with SMTP id h1so2074367ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Dec 2011 07:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=3wWMWvIXNlrEdhEN0wS3xKEOUx4V6A6H+iGzZ+Eio8E=;
	b=lrENFWfx5C2xzYO9a3lSlAeHJO1Tv0B4YinWTcJ+MWI/cHd1g9YcoVmGEtU+qkyTuD
	Qywj9G0XGVgABn3bRe4+HPynidDX1/NoMW94AFAbaaAJSeSHTsbgMxA3S1WFoIQ2Q8dL
	p3ekUm/kt8f7BSF5oHf5F5h8wpAV58IMID7m8=
Received: by 10.101.3.39 with SMTP id f39mr823963ani.92.1323358865879;
	Thu, 08 Dec 2011 07:41:05 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id 32sm15415340anu.10.2011.12.08.07.41.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 08 Dec 2011 07:41:04 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Dec 2011 15:40:48 +0000
Message-Id: <e27fba3b38877fb7420c58a3e35cdbcef1cb767a.1323358819.git.otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
In-Reply-To: <cover.1323358819.git.otavio@ossystems.com.br>
References: <cover.1323358819.git.otavio@ossystems.com.br>
Subject: [PATCH 2/3] dosfstools: update native to 2.11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 15:48:32 -0000

This unify recipes for target and native builds and also drops the the
already merged patches.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 .../dosfstools/dosfstools-native_2.10.bb           |   19 -----
 .../dosfstools/dosfstools/2.6.20-syscall.patch     |   72 -------------------
 .../dosfstools/dosfstools-2.10-kernel-2.6.patch    |   74 --------------------
 .../dosfstools/dosfstools/mkdosfs-bootcode.patch   |   68 ++++++++----------
 .../dosfstools/dosfstools/mkdosfs-dir.patch        |   62 ++++++++---------
 .../recipes-devtools/dosfstools/dosfstools_2.10.bb |   24 ------
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |   11 ++-
 7 files changed, 69 insertions(+), 261 deletions(-)
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
 delete mode 100644 meta/recipes-devtools/dosfstools/dosfstools_2.10.bb

diff --git a/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb b/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
deleted file mode 100644
index 91ff11f..0000000
--- a/meta/recipes-devtools/dosfstools/dosfstools-native_2.10.bb
+++ /dev/null
@@ -1,19 +0,0 @@
-# dosfstools-native OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-require dosfstools_${PV}.bb
-
-PR="r5"
-
-SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
-	file://mkdosfs-bootcode.patch \
-	file://mkdosfs-dir.patch \
-	file://alignment_hack.patch \
-	file://dosfstools-2.10-kernel-2.6.patch \
-	file://msdos_fat12_undefined.patch \
-	file://dosfstools-msdos_fs-types.patch \
-	file://include-linux-types.patch \
-	file://2.6.20-syscall.patch"
-
-inherit native
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch b/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
deleted file mode 100644
index 4460f06..0000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/2.6.20-syscall.patch
+++ /dev/null
@@ -1,72 +0,0 @@
-Only use the system's llseek().
-
-Upstream-Status: Inappropriate [licensing]
-We're tracking an old release of dosfstools due to licensing issues.
-
-Signed-off-by: Scott Garman <scott.a.garman@intel.com>
-
-Index: dosfstools-2.10/dosfsck/io.c
-===================================================================
---- dosfstools-2.10.orig/dosfsck/io.c	2007-06-07 16:15:52.000000000 +0200
-+++ dosfstools-2.10/dosfsck/io.c	2007-06-07 16:16:06.000000000 +0200
-@@ -42,28 +42,11 @@
- /* Use the _llseek system call directly, because there (once?) was a bug in
-  * the glibc implementation of it. */
- #include <linux/unistd.h>
--#if defined __alpha || defined __ia64__ || defined __s390x__ || defined __x86_64__ || defined __ppc64__
- /* On alpha, the syscall is simply lseek, because it's a 64 bit system. */
- static loff_t llseek( int fd, loff_t offset, int whence )
- {
-     return lseek(fd, offset, whence);
- }
--#else
--# ifndef __NR__llseek
--# error _llseek system call not present
--# endif
--static _syscall5( int, _llseek, uint, fd, ulong, hi, ulong, lo,
--		  loff_t *, res, uint, wh );
--
--static loff_t llseek( int fd, loff_t offset, int whence )
--{
--    loff_t actual;
--
--    if (_llseek(fd, offset>>32, offset&0xffffffff, &actual, whence) != 0)
--	return (loff_t)-1;
--    return actual;
--}
--#endif
- 
- 
- void fs_open(char *path,int rw)
-Index: dosfstools-2.10/mkdosfs/mkdosfs.c
-===================================================================
---- dosfstools-2.10.orig/mkdosfs/mkdosfs.c	2007-06-07 16:15:11.000000000 +0200
-+++ dosfstools-2.10/mkdosfs/mkdosfs.c	2007-06-07 16:15:30.000000000 +0200
-@@ -116,27 +116,11 @@
- /* Use the _llseek system call directly, because there (once?) was a bug in
-  * the glibc implementation of it. */
- #include <linux/unistd.h>
--#if defined __alpha || defined __ia64__ || defined __s390x__ || defined __x86_64__ || defined __ppc64__
- /* On alpha, the syscall is simply lseek, because it's a 64 bit system. */
- static loff_t llseek( int fd, loff_t offset, int whence )
- {
-     return lseek(fd, offset, whence);
- }
--#else
--# ifndef __NR__llseek
--# error _llseek system call not present
--# endif
--static _syscall5( int, _llseek, uint, fd, ulong, hi, ulong, lo,
--		  loff_t *, res, uint, wh );
--static loff_t llseek( int fd, loff_t offset, int whence )
--{
--    loff_t actual;
--
--    if (_llseek(fd, offset>>32, offset&0xffffffff, &actual, whence) != 0)
--	return (loff_t)-1;
--    return actual;
--}
--#endif
- 
- #define ROUND_UP(value, divisor) (value + (divisor - (value % divisor))) / divisor
- 
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch b/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
deleted file mode 100644
index 0c9230f..0000000
--- a/meta/recipes-devtools/dosfstools/dosfstools/dosfstools-2.10-kernel-2.6.patch
+++ /dev/null
@@ -1,74 +0,0 @@
-Submitted By: Jim Gifford (jim at linuxfromscratch dot org)
-Date: 2004-02-09
-Initial Package Version: 2.6
-Origin: Jim Gifford
-Upstream-Status: Accepted
-Description: Fixes Compile Issues with the 2.6 Kernel
- 
---- dosfstools-2.10/dosfsck/common.h.orig	2004-02-09 18:37:59.056737458 +0000
-+++ dosfstools-2.10/dosfsck/common.h	2004-02-09 18:38:18.333392952 +0000
-@@ -2,6 +2,13 @@
- 
- /* Written 1993 by Werner Almesberger */
- 
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
-+       #define __KERNEL__
-+       #include <asm/types.h>
-+       #undef __KERNEL__
-+       #define MSDOS_FAT12 4084 /* maximum number of clusters in a 12 bit FAT */
-+#endif
- 
- #ifndef _COMMON_H
- #define _COMMON_H
---- dosfstools-2.10/dosfsck/file.c.orig	2004-02-09 18:40:52.016728845 +0000
-+++ dosfstools-2.10/dosfsck/file.c	2004-02-09 18:40:03.665117865 +0000
-@@ -15,6 +15,14 @@
- #define _LINUX_STAT_H		/* hack to avoid inclusion of <linux/stat.h> */
- #define _LINUX_STRING_H_	/* hack to avoid inclusion of <linux/string.h>*/
- #define _LINUX_FS_H             /* hack to avoid inclusion of <linux/fs.h> */
-+
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
-+       #define __KERNEL__
-+       #include <asm/types.h>
-+       #undef __KERNEL__
-+#endif
-+
- #include <linux/msdos_fs.h>
- 
- #include "common.h"
---- dosfstools-2.10/dosfsck/dosfsck.h.orig	2004-02-09 18:57:11.022870974 +0000
-+++ dosfstools-2.10/dosfsck/dosfsck.h	2004-02-09 18:56:20.628614393 +0000
-@@ -13,6 +13,15 @@
- #define _LINUX_STAT_H		/* hack to avoid inclusion of <linux/stat.h> */
- #define _LINUX_STRING_H_	/* hack to avoid inclusion of <linux/string.h>*/
- #define _LINUX_FS_H             /* hack to avoid inclusion of <linux/fs.h> */
-+
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
-+       #define __KERNEL__
-+       #include <asm/types.h>
-+       #include <asm/byteorder.h>
-+       #undef __KERNEL__
-+#endif
-+
- #include <linux/msdos_fs.h>
- 
- /* 2.1 kernels use le16_to_cpu() type functions for CF_LE_W & Co., but don't
---- dosfstools-2.10/mkdosfs/mkdosfs.c.orig	2004-02-09 18:31:41.997157413 +0000
-+++ dosfstools-2.10/mkdosfs/mkdosfs.c	2004-02-09 18:34:07.311945252 +0000
-@@ -66,6 +66,13 @@
- #include <time.h>
- #include <errno.h>
- 
-+#include <linux/version.h>
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
-+       #define __KERNEL__
-+       #include <asm/types.h>
-+       #undef __KERNEL__
-+#endif
-+
- #if __BYTE_ORDER == __BIG_ENDIAN
- 
- #include <asm/byteorder.h>
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
index dd5cc7f..ae21bee 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-bootcode.patch
@@ -5,9 +5,10 @@ We're tracking an old release of dosfstools due to licensing issues.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -urN dosfstools-2.10.orig/mkdosfs/ChangeLog dosfstools-2.10/mkdosfs/ChangeLog
---- dosfstools-2.10.orig/mkdosfs/ChangeLog	1997-06-18 03:09:38.000000000 -0700
-+++ dosfstools-2.10/mkdosfs/ChangeLog	2004-08-02 20:57:57.734939816 -0700
+Index: dosfstools-2.11/mkdosfs/ChangeLog
+===================================================================
+--- dosfstools-2.11.orig/mkdosfs/ChangeLog	1997-06-18 10:09:38.000000000 +0000
++++ dosfstools-2.11/mkdosfs/ChangeLog	2011-12-06 12:14:23.634011558 +0000
 @@ -1,3 +1,14 @@
 +19th June 2003			Sam Bingner (sam@bingner.com)
 +
@@ -23,10 +24,11 @@ diff -urN dosfstools-2.10.orig/mkdosfs/ChangeLog dosfstools-2.10/mkdosfs/ChangeL
  28th January 1995		H. Peter Anvin (hpa@yggdrasil.com)
  
  	Better algorithm to select cluster sizes on large filesystems.
-diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.8 dosfstools-2.10/mkdosfs/mkdosfs.8
---- dosfstools-2.10.orig/mkdosfs/mkdosfs.8	2003-05-15 11:28:28.000000000 -0700
-+++ dosfstools-2.10/mkdosfs/mkdosfs.8	2004-08-02 20:57:57.735939664 -0700
-@@ -40,6 +40,10 @@
+Index: dosfstools-2.11/mkdosfs/mkdosfs.8
+===================================================================
+--- dosfstools-2.11.orig/mkdosfs/mkdosfs.8	2004-02-25 19:36:07.000000000 +0000
++++ dosfstools-2.11/mkdosfs/mkdosfs.8	2011-12-06 12:19:54.777888434 +0000
+@@ -44,6 +44,10 @@
  .I message-file
  ]
  [
@@ -37,7 +39,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.8 dosfstools-2.10/mkdosfs/mkdosfs
  .B \-n
  .I volume-name
  ]
-@@ -155,6 +159,18 @@
+@@ -165,6 +169,18 @@
  carriage return-line feed combinations, and tabs have been expanded.
  If the filename is a hyphen (-), the text is taken from standard input. 
  .TP
@@ -56,21 +58,22 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.8 dosfstools-2.10/mkdosfs/mkdosfs
  .BI \-n " volume-name"
  Sets the volume name (label) of the filesystem.  The volume name can
  be up to 11 characters long.  The default is no label.
-@@ -188,8 +204,9 @@
+@@ -198,8 +214,9 @@
  simply will not support it ;)
  .SH AUTHOR
  Dave Hudson - <dave@humbug.demon.co.uk>; modified by Peter Anvin
 -<hpa@yggdrasil.com>. Fixes and additions by Roman Hodek
--<Roman.Hodek@informatik.uni-erlangen.de> for Debian/GNU Linux.
+-<roman@hodek.net> for Debian/GNU Linux.
 +<hpa@yggdrasil.com> and Sam Bingner <sam@bingner.com>. Fixes and
 +additions by Roman Hodek <Roman.Hodek@informatik.uni-erlangen.de>
 +for Debian/GNU Linux.
  .SH ACKNOWLEDGEMENTS
  .B mkdosfs
  is based on code from
-diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs.c
---- dosfstools-2.10.orig/mkdosfs/mkdosfs.c	2003-06-14 13:07:08.000000000 -0700
-+++ dosfstools-2.10/mkdosfs/mkdosfs.c	2004-08-02 20:57:57.736939512 -0700
+Index: dosfstools-2.11/mkdosfs/mkdosfs.c
+===================================================================
+--- dosfstools-2.11.orig/mkdosfs/mkdosfs.c	2005-03-12 16:12:16.000000000 +0000
++++ dosfstools-2.11/mkdosfs/mkdosfs.c	2011-12-06 12:27:55.121886076 +0000
 @@ -24,6 +24,12 @@
     - New options -A, -S, -C
     - Support for filesystems > 2GB
@@ -84,7 +87,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
     
     Copying:     Copyright 1993, 1994 David Hudson (dave@humbug.demon.co.uk)
  
-@@ -167,6 +173,8 @@
+@@ -153,6 +159,8 @@
  #define FAT_BAD      0x0ffffff7
  
  #define MSDOS_EXT_SIGN 0x29	/* extended boot sector signature */
@@ -93,7 +96,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  #define MSDOS_FAT12_SIGN "FAT12   "	/* FAT12 filesystem signature */
  #define MSDOS_FAT16_SIGN "FAT16   "	/* FAT16 filesystem signature */
  #define MSDOS_FAT32_SIGN "FAT32   "	/* FAT32 filesystem signature */
-@@ -188,6 +196,8 @@
+@@ -175,6 +183,8 @@
  #define BOOTCODE_SIZE		448
  #define BOOTCODE_FAT32_SIZE	420
  
@@ -102,7 +105,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  /* __attribute__ ((packed)) is used on all structures to make gcc ignore any
   * alignments */
  
-@@ -215,7 +225,7 @@
+@@ -202,7 +212,7 @@
    __u16         fat_length;	/* sectors/FAT */
    __u16         secs_track;	/* sectors per track */
    __u16         heads;		/* number of heads */
@@ -111,7 +114,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
    __u32         total_sect;	/* number of sectors (if sectors == 0) */
    union {
      struct {
-@@ -298,6 +308,8 @@
+@@ -285,6 +295,8 @@
  
  /* Global variables - the root of all evil :-) - see these and weep! */
  
@@ -120,7 +123,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  static char *program_name = "mkdosfs";	/* Name of the program */
  static char *device_name = NULL;	/* Name of the device on which to create the filesystem */
  static int atari_format = 0;	/* Use Atari variation of MS-DOS FS format */
-@@ -842,6 +854,12 @@
+@@ -837,6 +849,12 @@
      vi->volume_id[2] = (unsigned char) ((volume_id & 0x00ff0000) >> 16);
      vi->volume_id[3] = (unsigned char) (volume_id >> 24);
    }
@@ -133,16 +136,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  
    if (!atari_format) {
      memcpy(vi->volume_label, volume_name, 11);
-@@ -886,7 +904,7 @@
-     printf( "Using %d reserved sectors\n", reserved_sectors );
-   bs.fats = (char) nr_fats;
-   if (!atari_format || size_fat == 32)
--    bs.hidden = CT_LE_L(0);
-+    bs.hidden = bs.secs_track;
-   else
-     /* In Atari format, hidden is a 16 bit field */
-     memset( &bs.hidden, 0, 2 );
-@@ -1358,6 +1376,32 @@
+@@ -1362,6 +1380,32 @@
     * dir area on FAT12/16, and the first cluster on FAT32. */
    writebuf( (char *) root_dir, size_root_dir, "root directory" );
  
@@ -156,9 +150,9 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
 +      seekto( 512*2, "third sector" );
 +      if (backup_boot != 0) {
 +        writebuf( template_boot_code+512*2, backup_boot*sector_size - 512*2, "data to backup boot" );
-+	seekto( backup_boot*sector_size, "backup boot sector" );
++        seekto( backup_boot*sector_size, "backup boot sector" );
 +        writebuf( template_boot_code, 3, "backup jmpBoot" );
-+	seekto( backup_boot*sector_size+0x5a, "backup boot sector boot area" );
++        seekto( backup_boot*sector_size+0x5a, "backup boot sector boot area" );
 +        writebuf( template_boot_code+0x5a, 420, "backup boot sector boot area" );
 +        seekto( (backup_boot+2)*sector_size, "sector following backup code" );
 +        writebuf( template_boot_code+(backup_boot+2)*sector_size, (reserved_sectors-backup_boot-2)*512, "remaining data" );
@@ -172,28 +166,28 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
 +    }
 +  }
 +
+   if (blank_sector) free( blank_sector );
    if (info_sector) free( info_sector );
    free (root_dir);   /* Free up the root directory space from setup_tables */
-   free (fat);  /* Free up the fat table space reserved during setup_tables */
-@@ -1371,7 +1415,7 @@
+@@ -1376,7 +1420,7 @@
  {
    fatal_error("\
  Usage: mkdosfs [-A] [-c] [-C] [-v] [-I] [-l bad-block-file] [-b backup-boot-sector]\n\
 -       [-m boot-msg-file] [-n volume-name] [-i volume-id]\n\
 +       [-m boot-msg-file] [-n volume-name] [-i volume-id] [-B bootcode]\n\
         [-s sectors-per-cluster] [-S logical-sector-size] [-f number-of-FATs]\n\
-        [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
+        [-h hidden-sectors] [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
         /dev/name [blocks]\n");
-@@ -1433,7 +1477,7 @@
+@@ -1439,7 +1483,7 @@
    printf ("%s " VERSION " (" VERSION_DATE ")\n",
  	   program_name);
  
--  while ((c = getopt (argc, argv, "AcCf:F:Ii:l:m:n:r:R:s:S:v")) != EOF)
-+  while ((c = getopt (argc, argv, "AcCf:F:Ii:l:m:n:r:R:s:S:v:B:b")) != EOF)
+-  while ((c = getopt (argc, argv, "AbcCf:F:Ii:l:m:n:r:R:s:S:h:v")) != EOF)
++  while ((c = getopt (argc, argv, "AbcCf:F:Ii:l:m:n:r:R:s:S:v:B:")) != EOF)
      /* Scan the command line for options */
      switch (c)
        {
-@@ -1494,6 +1538,51 @@
+@@ -1509,6 +1553,51 @@
  	listfile = optarg;
  	break;
  
diff --git a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
index 7feee0f..3ba4711 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
+++ b/meta/recipes-devtools/dosfstools/dosfstools/mkdosfs-dir.patch
@@ -1,13 +1,14 @@
-Add -s <directory> support to populate the image.
+Add -d <directory> support to populate the image.
 
 Upstream-Status: Inappropriate [licensing]
 We're tracking an old release of dosfstools due to licensing issues.
 
 Signed-off-by: Scott Garman <scott.a.garman@intel.com>
 
-diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs.c
---- dosfstools-2.10.orig/mkdosfs/mkdosfs.c	2004-08-02 20:48:45.000000000 -0700
-+++ dosfstools-2.10/mkdosfs/mkdosfs.c	2004-08-02 20:49:44.296953792 -0700
+Index: dosfstools-2.11/mkdosfs/mkdosfs.c
+===================================================================
+--- dosfstools-2.11.orig/mkdosfs/mkdosfs.c	2011-12-06 12:27:55.000000000 +0000
++++ dosfstools-2.11/mkdosfs/mkdosfs.c	2011-12-06 12:37:13.445950703 +0000
 @@ -18,6 +18,10 @@
     as a rule), and not the block.  For example the boot block does not
     occupy a full cluster.
@@ -26,18 +27,18 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
 +#include <libgen.h>
 +#include <dirent.h>
  
- #if __BYTE_ORDER == __BIG_ENDIAN
- 
-@@ -124,6 +130,8 @@
- }
- #endif
+ #include <linux/version.h>
+ #if LINUX_VERSION_CODE >= KERNEL_VERSION(2, 6, 0)
+@@ -110,6 +116,8 @@
+  * sufficient (or even better :) for 64 bit offsets in the meantime */
+ #define llseek lseek
  
 +#define ROUND_UP(value, divisor) (value + (divisor - (value % divisor))) / divisor
 +
  /* Constant definitions */
  
  #define TRUE 1			/* Boolean constants */
-@@ -163,7 +171,6 @@
+@@ -149,7 +157,6 @@
  #define ATTR_VOLUME  8		/* volume label */
  #define ATTR_DIR     16		/* directory */
  #define ATTR_ARCH    32		/* archived */
@@ -45,7 +46,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  #define ATTR_NONE    0		/* no attribute bits */
  #define ATTR_UNUSED  (ATTR_VOLUME | ATTR_ARCH | ATTR_SYS | ATTR_HIDDEN)
  	/* attribute bits that are copied "as is" */
-@@ -258,6 +265,19 @@
+@@ -245,6 +252,19 @@
    __u32		reserved2[4];
  };
  
@@ -65,7 +66,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  struct msdos_dir_entry
    {
      char	name[8], ext[3];	/* name and extension */
-@@ -306,6 +326,15 @@
+@@ -293,6 +313,15 @@
  
  #define MESSAGE_OFFSET 29	/* Offset of message in above code */
  
@@ -81,7 +82,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  /* Global variables - the root of all evil :-) - see these and weep! */
  
  static char *template_boot_code;	/* Variable to store a full template boot sector in */
-@@ -339,6 +368,9 @@
+@@ -326,6 +355,9 @@
  static int size_root_dir;	/* Size of the root directory in bytes */
  static int sectors_per_cluster = 0;	/* Number of sectors per disk cluster */
  static int root_dir_entries = 0;	/* Number of root directory entries */
@@ -89,9 +90,9 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
 +static int last_cluster_written = 0;
 +
  static char *blank_sector;		/* Blank sector - all zeros */
+ static int hidden_sectors = 0;		/* Number of hidden sectors */
  
- 
-@@ -411,7 +443,6 @@
+@@ -399,7 +431,6 @@
    }
  }
  
@@ -99,7 +100,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  /* Mark a specified sector as having a particular value in it's FAT entry */
  
  static void
-@@ -1262,6 +1293,9 @@
+@@ -1266,6 +1297,9 @@
        die ("unable to allocate space for root directory in memory");
      }
  
@@ -109,7 +110,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
    memset(root_dir, 0, size_root_dir);
    if ( memcmp(volume_name, "           ", 11) )
      {
-@@ -1310,11 +1344,11 @@
+@@ -1314,11 +1348,11 @@
    }
    
    if (!(blank_sector = malloc( sector_size )))
@@ -124,7 +125,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  /* Write the new filesystem's data tables to wherever they're going to end up! */
  
  #define error(str)				\
-@@ -1336,7 +1370,7 @@
+@@ -1340,7 +1374,7 @@
    do {							\
      int __size = (size);				\
      if (write (dev, buf, __size) != __size)		\
@@ -133,7 +134,7 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
    } while(0)
  
  
-@@ -1407,6 +1441,452 @@
+@@ -1412,6 +1446,452 @@
    free (fat);  /* Free up the fat table space reserved during setup_tables */
  }
  
@@ -586,19 +587,16 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
  
  /* Report the command usage and return a failure error code */
  
-@@ -1418,9 +1898,9 @@
+@@ -1423,7 +1903,7 @@
         [-m boot-msg-file] [-n volume-name] [-i volume-id] [-B bootcode]\n\
         [-s sectors-per-cluster] [-S logical-sector-size] [-f number-of-FATs]\n\
-        [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
+        [-h hidden-sectors] [-F fat-size] [-r root-dir-entries] [-R reserved-sectors]\n\
 -       /dev/name [blocks]\n");
 +       [-d directory] /dev/name [blocks]\n");
  }
--
-+	
+ 
  /*
-  * ++roman: On m68k, check if this is an Atari; if yes, turn on Atari variant
-  * of MS-DOS filesystem by default.
-@@ -1458,6 +1938,8 @@
+@@ -1463,6 +1943,8 @@
    int c;
    char *tmp;
    char *listfile = NULL;
@@ -607,27 +605,27 @@ diff -urN dosfstools-2.10.orig/mkdosfs/mkdosfs.c dosfstools-2.10/mkdosfs/mkdosfs
    FILE *msgfile;
    struct stat statbuf;
    int i = 0, pos, ch;
-@@ -1477,7 +1959,7 @@
+@@ -1483,7 +1965,7 @@
    printf ("%s " VERSION " (" VERSION_DATE ")\n",
  	   program_name);
  
--  while ((c = getopt (argc, argv, "AcCf:F:Ii:l:m:n:r:R:s:S:v:B:b")) != EOF)
-+  while ((c = getopt (argc, argv, "AcCd:f:F:Ii:l:m:n:r:R:s:S:v:B:b")) != EOF)
+-  while ((c = getopt (argc, argv, "AbcCf:F:Ii:l:m:n:r:R:s:S:v:B:")) != EOF)
++  while ((c = getopt (argc, argv, "AbcCd:f:F:Ii:l:m:n:r:R:s:S:v:B:")) != EOF)
      /* Scan the command line for options */
      switch (c)
        {
-@@ -1502,6 +1984,10 @@
+@@ -1508,6 +1990,10 @@
  	create = TRUE;
  	break;
  
-+      case 'd':
++  case 'd':
 +	dirname = optarg;
 +	break;
 +
        case 'f':		/* f : Choose number of FATs */
  	nr_fats = (int) strtol (optarg, &tmp, 0);
  	if (*tmp || nr_fats < 1 || nr_fats > 4)
-@@ -1796,8 +2282,10 @@
+@@ -1811,8 +2297,10 @@
    else if (listfile)
      get_list_blocks (listfile);
  
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
deleted file mode 100644
index c23c02d..0000000
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.10.bb
+++ /dev/null
@@ -1,24 +0,0 @@
-# dosfstools OE build file
-# Copyright (C) 2004-2006, Advanced Micro Devices, Inc.  All Rights Reserved
-# Released under the MIT license (see packages/COPYING)
-
-DESCRIPTION = "DOS FAT Filesystem Utilities"
-
-SECTION = "base"
-LICENSE = "GPLv2"
-LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
-PR = "r3"
-
-SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
-	   file://alignment_hack.patch \
-	   file://dosfstools-2.10-kernel-2.6.patch \
-           file://msdos_fat12_undefined.patch \
-	   file://include-linux-types.patch"
-
-SRC_URI[md5sum] = "59a02f311a891af8787c4c9e28c6b89b"
-SRC_URI[sha256sum] = "55a7b2f5ea4506bde935ee3145573e1773427fc72283a36796c7c2cf861dd064"
-
-do_install () {
-	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
-		   "MANDIR=${D}${mandir}/man8" install
-}
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index 944d873..7d0080c 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -7,12 +7,15 @@ DESCRIPTION = "DOS FAT Filesystem Utilities"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
-PR = "r0"
+PR = "r1"
 
 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
-	   file://alignment_hack.patch \
+           file://mkdosfs-bootcode.patch \
+           file://mkdosfs-dir.patch \
+           file://alignment_hack.patch \
            file://msdos_fat12_undefined.patch \
-	   file://include-linux-types.patch"
+           file://dosfstools-msdos_fs-types.patch \
+           file://include-linux-types.patch"
 
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
 SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
@@ -21,3 +24,5 @@ do_install () {
 	oe_runmake "PREFIX=${D}" "SBINDIR=${D}${sbindir}" \
 		   "MANDIR=${D}${mandir}/man8" install
 }
+
+BBCLASSEXTEND = "native"
-- 
1.7.2.5



