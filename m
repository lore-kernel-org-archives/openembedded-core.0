Received: from mail-ve0-f181.google.com ([209.85.128.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <net147@gmail.com>) id 1UZw0E-0000jS-51
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 06:29:28 +0200
Received: by mail-ve0-f181.google.com with SMTP id d10so1357970vea.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 21:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=r1rYFyuDc8pNlAksKi6YFu1yaCqS8tbgJhpdCQED+/4=;
	b=NvZOooMsrY0aTP1Z9hs6UKaGPnDrwyCtCbzYOFv7AKWSp41MwTYtSrtnfsB8hXK5Hn
	Xten+SilHTTjH4C6O5u/typvY6FoSGv1czRe7B+VELCcEbJfc6EekGCb0D6lv2Kr1m8q
	Z44QVXqce8ha+C89/XbelZorD2s38QHjryT3QtPSKeGHgT0Ed9jciY1dMsFvWEowuYBV
	/R4Wa9V1iCntwXJ52ekvSfUrur+KbwMFdV7JsWgoX53OXtym/ot+xF/j2Gq8HAOUyble
	xxtINQovguP7OdL9cBhuidNFW8LBIcgJIxDro06JBTRSarW4cWSJNVUEw89e+tb1/e2W
	ZVVw==
MIME-Version: 1.0
X-Received: by 10.58.50.7 with SMTP id y7mr3356073ven.24.1367986275947; Tue,
	07 May 2013 21:11:15 -0700 (PDT)
Received: by 10.58.66.165 with HTTP; Tue, 7 May 2013 21:11:15 -0700 (PDT)
In-Reply-To: <51895F79.3020105@linux.intel.com>
References: <1367881396-32227-1-git-send-email-net147@gmail.com>
	<1367881396-32227-2-git-send-email-net147@gmail.com>
	<51895F79.3020105@linux.intel.com>
Date: Wed, 8 May 2013 14:11:15 +1000
Message-ID: <CANwerB1Eb445jhJ7M26ET_A2_uha9PiHEE_ohD5NWLd6oDexOg@mail.gmail.com>
From: Jonathan Liu <net147@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v7 1/1] syslinux: Update to 4.06
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 04:29:37 -0000
Content-Type: multipart/alternative; boundary=089e0112c63a091ce604dc2d2087

--089e0112c63a091ce604dc2d2087
Content-Type: text/plain; charset=UTF-8

Hi Saul,

I have verified that it is picking up uuid library from /usr/lib on host. I
have submitted patch v8 to correct this.

Regards,
Jonathan


On 8 May 2013 06:09, Saul Wold <sgw@linux.intel.com> wrote:

>
> Jonathan,
>
> This patch still does not address the issue that I mentioned in the last
> email about the failing to build the native version of isohybrid.
>
>
>  | gcc  -isystem /srv/ssd/sgw/machines/fri2/**
>> tmp/sysroots/x86_64-linux/usr/**include -O2 -o isohybrid isohybrid.o
>> isohdpfx.o -luuid
>> | /usr/bin/ld: cannot find -luuid
>>
>
> I mentioned clearly at the end that the -isystem setting to the
> STAGING_INCDIR is wrong since it does not correctly accound for the libuuid
> library not being found.
>
> I read your testing report, you might have uuid/util-linux installed on
> your host which is causing some host contamination issue.
>
> Please verify this.
>
> Thanks
>         Sau!
>
>
>
> On 05/06/2013 04:03 PM, Jonathan Liu wrote:
>
>> Patches are now part of upstream or no longer needed.
>> Added new util-linux dependency for isohybrid.
>> Paths updated to reflect directory structure changes.
>>
>> INCDIR isn't used by the build process during compilation which results
>> in the compiler not finding uuid/uuid.h from util-linux when compiling
>> isohybrid unless it exists on the host system. This was fixed by adding
>> -isystem ${STAGING_INCDIR} to CC when calling make.
>>
>> [YOCTO #4438]
>>
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   meta/classes/boot-directdisk.**bbclass               |   2 +-
>>   .../syslinux/files/cross-**build.patch               |  71 --
>>   .../libinstaller-Avoid-using-**linux-ext2_fs.h.patch | 975
>> ---------------------
>>   .../recipes-devtools/syslinux/**files/no-strip.patch |  31 -
>>   meta/recipes-devtools/**syslinux/syslinux_4.03.bb    |  65 --
>>   meta/recipes-devtools/**syslinux/syslinux_4.06.bb    |  62 ++
>>   6 files changed, 63 insertions(+), 1143 deletions(-)
>>   delete mode 100644 meta/recipes-devtools/**syslinux/files/cross-build.*
>> *patch
>>   delete mode 100644 meta/recipes-devtools/**syslinux/files/libinstaller-
>> **Avoid-using-linux-ext2_fs.h.**patch
>>   delete mode 100644 meta/recipes-devtools/**
>> syslinux/files/no-strip.patch
>>   delete mode 100644 meta/recipes-devtools/**syslinux/syslinux_4.03.bb
>>   create mode 100644 meta/recipes-devtools/**syslinux/syslinux_4.06.bb
>>
>> diff --git a/meta/classes/boot-**directdisk.bbclass b/meta/classes/boot-*
>> *directdisk.bbclass
>> index d265485..1506b42 100644
>> --- a/meta/classes/boot-**directdisk.bbclass
>> +++ b/meta/classes/boot-**directdisk.bbclass
>> @@ -82,7 +82,7 @@ build_boot_dd() {
>>         parted $IMAGE print
>>
>>         OFFSET=`expr $END2 / 512`
>> -       dd if=${STAGING_LIBDIR}/syslinux/**mbr.bin of=$IMAGE conv=notrunc
>> +       dd if=${STAGING_DATADIR}/**syslinux/mbr.bin of=$IMAGE
>> conv=notrunc
>>         dd if=${HDDIMG} of=$IMAGE conv=notrunc seek=1 bs=512
>>         dd if=${ROOTFS} of=$IMAGE conv=notrunc seek=$OFFSET bs=512
>>
>> diff --git a/meta/recipes-devtools/**syslinux/files/cross-build.**patch
>> b/meta/recipes-devtools/**syslinux/files/cross-build.**patch
>> deleted file mode 100644
>> index 7bb6bda..0000000
>> --- a/meta/recipes-devtools/**syslinux/files/cross-build.**patch
>> +++ /dev/null
>> @@ -1,71 +0,0 @@
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -Use ?= for Makefile variables to use poky environment variables.
>> -Original method to sed s/CC =/CC ?=/ is not applicable anymore
>> -because of the Makefile changes.
>> -
>> -against 3.86
>> -
>> -06/28/2010 - qhe
>> -
>> -also AUXDIR stays in $(LIBDIR)/syslinux rather than $(DATADIR)/syslinux
>> -
>> -07/08/2010 - qhe
>> -
>> -updated for 4.03
>> -
>> -11/16/2010 - Qing He <qing.he@intel.com>
>> -
>> ----
>> -diff --git a/MCONFIG b/MCONFIG
>> -index e9c16d3..4d49f33 100644
>> ---- a/MCONFIG
>> -+++ b/MCONFIG
>> -@@ -18,13 +18,13 @@
>> - MAKEFLAGS += -r
>> - MAKE      += -r
>> -
>> --BINDIR   = /usr/bin
>> --SBINDIR  = /sbin
>> --LIBDIR   = /usr/lib
>> --DATADIR  = /usr/share
>> --AUXDIR   = $(DATADIR)/syslinux
>> --MANDIR         = /usr/man
>> --INCDIR   = /usr/include
>> -+BINDIR   ?= /usr/bin
>> -+SBINDIR  ?= /sbin
>> -+LIBDIR   ?= /usr/lib
>> -+DATADIR  ?= /usr/share
>> -+AUXDIR   = $(LIBDIR)/syslinux
>> -+MANDIR         ?= /usr/man
>> -+INCDIR   ?= /usr/include
>> - TFTPBOOT = /tftpboot
>> - COM32DIR = $(AUXDIR)/com32
>> -
>> -@@ -38,18 +38,18 @@ PERL        = perl
>> -
>> - CHMOD  = chmod
>> -
>> --CC     = gcc
>> -+CC     ?= gcc
>> - gcc_ok   = $(shell tmpf=gcc_ok.$$$$.tmp; \
>> -                  if $(CC) $(GCCOPT) $(1) -c $(topdir)/dummy.c \
>> -                       -o $$tmpf 2>/dev/null ; \
>> -                  then echo '$(1)'; else echo '$(2)'; fi; \
>> -                  rm -f $$tmpf)
>> -
>> --LD     = ld
>> --OBJDUMP        = objdump
>> --OBJCOPY  = objcopy
>> --AR       = ar
>> --NM       = nm
>> --RANLIB   = ranlib
>> -+LD     ?= ld
>> -+OBJDUMP        ?= objdump
>> -+OBJCOPY  ?= objcopy
>> -+AR       ?= ar
>> -+NM       ?= nm
>> -+RANLIB   ?= ranlib
>> - GZIPPROG = gzip
>> - PNGTOPNM = pngtopnm
>> - MCOPY    = mcopy
>> diff --git a/meta/recipes-devtools/**syslinux/files/libinstaller-**
>> Avoid-using-linux-ext2_fs.h.**patch b/meta/recipes-devtools/**
>> syslinux/files/libinstaller-**Avoid-using-linux-ext2_fs.h.**patch
>> deleted file mode 100644
>> index 77d7a5d..0000000
>> --- a/meta/recipes-devtools/**syslinux/files/libinstaller-**
>> Avoid-using-linux-ext2_fs.h.**patch
>> +++ /dev/null
>> @@ -1,975 +0,0 @@
>> -From a1006762fa6f98750bb77d76dd992c**b8ea9f9c99 Mon Sep 17 00:00:00 2001
>> -Message-Id: <a1006762fa6f98750bb77d76dd992**cb8ea9f9c99.1333550572.git.*
>> *dvhart@linux.intel.com<a1006762fa6f98750bb77d76dd992cb8ea9f9c99.1333550572.git.dvhart@linux.intel.com>
>> >
>> -From: "H. Peter Anvin" <hpa@zytor.com>
>> -Date: Mon, 26 Mar 2012 22:51:09 -0700
>> -Subject: [PATCH] libinstaller: Avoid using <linux/ext2_fs.h>
>> -
>> -Don't use <linux/ext2_fs.h> if we can avoid it.
>> -
>> -Upstream-Status: Available in syslinux-4.06-pre3
>> -
>> -The ioctl constants have been globalized and moved to <linux/fs.h>.
>> -Use a private copy of ext2_fs.h from e2fsprogs with the ioctl
>> -constants removed for the data structures.
>> -
>> -Do at least attempt backward compatibility for old kernel headers, but
>> -no real hope of proper operation there...
>> -
>> -Signed-off-by: H. Peter Anvin <hpa@zytor.com>
>> -
>> -Massaged into 4.03.
>> -
>> -Integrated-by: Darren Hart <dvhart@linux.inte.com>
>> ----
>> - libinstaller/ext2fs/ext2_fs.h |  856 ++++++++++++++++++++++++++++++**
>> +++++++++++
>> - libinstaller/linuxioctl.h     |   29 ++-
>> - libinstaller/syslxcom.c       |   12 +-
>> - 3 files changed, 886 insertions(+), 11 deletions(-)
>> - create mode 100644 libinstaller/ext2fs/ext2_fs.h
>> -
>> -Index: syslinux-4.03/libinstaller/**ext2fs/ext2_fs.h
>> -=============================**==============================**========
>> ---- /dev/null
>> -+++ syslinux-4.03/libinstaller/**ext2fs/ext2_fs.h
>> -@@ -0,0 +1,856 @@
>> -+/*
>> -+ *  linux/include/linux/ext2_fs.h
>> -+ *
>> -+ * Copyright (C) 1992, 1993, 1994, 1995
>> -+ * Remy Card (card@masi.ibp.fr)
>> -+ * Laboratoire MASI - Institut Blaise Pascal
>> -+ * Universite Pierre et Marie Curie (Paris VI)
>> -+ *
>> -+ *  from
>> -+ *
>> -+ *  linux/include/linux/minix_fs.h
>> -+ *
>> -+ *  Copyright (C) 1991, 1992  Linus Torvalds
>> -+ */
>> -+
>> -+#ifndef _EXT2FS_EXT2_FS_H
>> -+#define _EXT2FS_EXT2_FS_H
>> -+
>> -+#include <linux/types.h>
>> -+
>> -+/*
>> -+ * The second extended filesystem constants/structures
>> -+ */
>> -+
>> -+/*
>> -+ * Define EXT2FS_DEBUG to produce debug messages
>> -+ */
>> -+#undef EXT2FS_DEBUG
>> -+
>> -+/*
>> -+ * Define EXT2_PREALLOCATE to preallocate data blocks for expanding
>> files
>> -+ */
>> -+#define EXT2_PREALLOCATE
>> -+#define EXT2_DEFAULT_PREALLOC_BLOCKS  8
>> -+
>> -+/*
>> -+ * The second extended file system version
>> -+ */
>> -+#define EXT2FS_DATE           "95/08/09"
>> -+#define EXT2FS_VERSION                "0.5b"
>> -+
>> -+/*
>> -+ * Special inode numbers
>> -+ */
>> -+#define EXT2_BAD_INO           1      /* Bad blocks inode */
>> -+#define EXT2_ROOT_INO          2      /* Root inode */
>> -+#define EXT4_USR_QUOTA_INO     3      /* User quota inode */
>> -+#define EXT4_GRP_QUOTA_INO     4      /* Group quota inode */
>> -+#define EXT2_BOOT_LOADER_INO   5      /* Boot loader inode */
>> -+#define EXT2_UNDEL_DIR_INO     6      /* Undelete directory inode */
>> -+#define EXT2_RESIZE_INO                7      /* Reserved group
>> descriptors inode */
>> -+#define EXT2_JOURNAL_INO       8      /* Journal inode */
>> -+#define EXT2_EXCLUDE_INO       9      /* The "exclude" inode, for
>> snapshots */
>> -+#define EXT4_REPLICA_INO      10      /* Used by non-upstream feature */
>> -+
>> -+/* First non-reserved inode for old ext2 filesystems */
>> -+#define EXT2_GOOD_OLD_FIRST_INO       11
>> -+
>> -+/*
>> -+ * The second extended file system magic number
>> -+ */
>> -+#define EXT2_SUPER_MAGIC      0xEF53
>> -+
>> -+#ifdef __KERNEL__
>> -+#define EXT2_SB(sb)   (&((sb)->u.ext2_sb))
>> -+#else
>> -+/* Assume that user mode programs are passing in an ext2fs superblock,
>> not
>> -+ * a kernel struct super_block.  This will allow us to call the
>> feature-test
>> -+ * macros from user land. */
>> -+#define EXT2_SB(sb)   (sb)
>> -+#endif
>> -+
>> -+/*
>> -+ * Maximal count of links to a file
>> -+ */
>> -+#define EXT2_LINK_MAX         65000
>> -+
>> -+/*
>> -+ * Macro-instructions used to manage several block sizes
>> -+ */
>> -+#define EXT2_MIN_BLOCK_LOG_SIZE               10      /* 1024 */
>> -+#define EXT2_MAX_BLOCK_LOG_SIZE               16      /* 65536 */
>> -+#define EXT2_MIN_BLOCK_SIZE   (1 << EXT2_MIN_BLOCK_LOG_SIZE)
>> -+#define EXT2_MAX_BLOCK_SIZE   (1 << EXT2_MAX_BLOCK_LOG_SIZE)
>> -+#ifdef __KERNEL__
>> -+#define EXT2_BLOCK_SIZE(s)    ((s)->s_blocksize)
>> -+#define EXT2_BLOCK_SIZE_BITS(s)       ((s)->s_blocksize_bits)
>> -+#define EXT2_ADDR_PER_BLOCK_BITS(s)   (EXT2_SB(s)->addr_per_block_**
>> bits)
>> -+#define EXT2_INODE_SIZE(s)    (EXT2_SB(s)->s_inode_size)
>> -+#define EXT2_FIRST_INO(s)     (EXT2_SB(s)->s_first_ino)
>> -+#else
>> -+#define EXT2_BLOCK_SIZE(s)    (EXT2_MIN_BLOCK_SIZE <<
>> (s)->s_log_block_size)
>> -+#define EXT2_BLOCK_SIZE_BITS(s)       ((s)->s_log_block_size + 10)
>> -+#define EXT2_INODE_SIZE(s)    (((s)->s_rev_level == EXT2_GOOD_OLD_REV)
>> ? \
>> -+                               EXT2_GOOD_OLD_INODE_SIZE :
>> (s)->s_inode_size)
>> -+#define EXT2_FIRST_INO(s)     (((s)->s_rev_level == EXT2_GOOD_OLD_REV)
>> ? \
>> -+                               EXT2_GOOD_OLD_FIRST_INO :
>> (s)->s_first_ino)
>> -+#endif
>> -+#define EXT2_ADDR_PER_BLOCK(s)        (EXT2_BLOCK_SIZE(s) /
>> sizeof(__u32))
>> -+
>> -+/*
>> -+ * Macro-instructions used to manage allocation clusters
>> -+ */
>> -+#define EXT2_MIN_CLUSTER_LOG_SIZE     EXT2_MIN_BLOCK_LOG_SIZE
>> -+#define EXT2_MAX_CLUSTER_LOG_SIZE     29      /* 512MB  */
>> -+#define EXT2_MIN_CLUSTER_SIZE         EXT2_MIN_BLOCK_SIZE
>> -+#define EXT2_MAX_CLUSTER_SIZE         (1 << EXT2_MAX_CLUSTER_LOG_SIZE)
>> -+#define EXT2_CLUSTER_SIZE(s)          (EXT2_MIN_BLOCK_SIZE << \
>> -+                                              (s)->s_log_cluster_size)
>> -+#define EXT2_CLUSTER_SIZE_BITS(s)     ((s)->s_log_cluster_size + 10)
>> -+
>> -+/*
>> -+ * Macro-instructions used to manage fragments
>> -+ *
>> -+ * Note: for backwards compatibility only, for the dump program.
>> -+ * Ext2/3/4 will never support fragments....
>> -+ */
>> -+#define EXT2_MIN_FRAG_SIZE              EXT2_MIN_BLOCK_SIZE
>> -+#define EXT2_MAX_FRAG_SIZE              EXT2_MAX_BLOCK_SIZE
>> -+#define EXT2_MIN_FRAG_LOG_SIZE          EXT2_MIN_BLOCK_LOG_SIZE
>> -+#define EXT2_FRAG_SIZE(s)             EXT2_BLOCK_SIZE(s)
>> -+#define EXT2_FRAGS_PER_BLOCK(s)               1
>> -+
>> -+/*
>> -+ * ACL structures
>> -+ */
>> -+struct ext2_acl_header        /* Header of Access Control Lists */
>> -+{
>> -+      __u32   aclh_size;
>> -+      __u32   aclh_file_count;
>> -+      __u32   aclh_acle_count;
>> -+      __u32   aclh_first_acle;
>> -+};
>> -+
>> -+struct ext2_acl_entry /* Access Control List Entry */
>> -+{
>> -+      __u32   acle_size;
>> -+      __u16   acle_perms;     /* Access permissions */
>> -+      __u16   acle_type;      /* Type of entry */
>> -+      __u16   acle_tag;       /* User or group identity */
>> -+      __u16   acle_pad1;
>> -+      __u32   acle_next;      /* Pointer on next entry for the */
>> -+                                      /* same inode or on next free
>> entry */
>> -+};
>> -+
>> -+/*
>> -+ * Structure of a blocks group descriptor
>> -+ */
>> -+struct ext2_group_desc
>> -+{
>> -+      __u32   bg_block_bitmap;        /* Blocks bitmap block */
>> -+      __u32   bg_inode_bitmap;        /* Inodes bitmap block */
>> -+      __u32   bg_inode_table;         /* Inodes table block */
>> -+      __u16   bg_free_blocks_count;   /* Free blocks count */
>> -+      __u16   bg_free_inodes_count;   /* Free inodes count */
>> -+      __u16   bg_used_dirs_count;     /* Directories count */
>> -+      __u16   bg_flags;
>> -+      __u32   bg_exclude_bitmap_lo;   /* Exclude bitmap for snapshots */
>> -+      __u16   bg_block_bitmap_csum_lo;/* crc32c(s_uuid+grp_num+bitmap)
>> LSB */
>> -+      __u16   bg_inode_bitmap_csum_lo;/* crc32c(s_uuid+grp_num+bitmap)
>> LSB */
>> -+      __u16   bg_itable_unused;       /* Unused inodes count */
>> -+      __u16   bg_checksum;            /* crc16(s_uuid+grouo_num+group_*
>> *desc)*/
>> -+};
>> -+
>> -+/*
>> -+ * Structure of a blocks group descriptor
>> -+ */
>> -+struct ext4_group_desc
>> -+{
>> -+      __u32   bg_block_bitmap;        /* Blocks bitmap block */
>> -+      __u32   bg_inode_bitmap;        /* Inodes bitmap block */
>> -+      __u32   bg_inode_table;         /* Inodes table block */
>> -+      __u16   bg_free_blocks_count;   /* Free blocks count */
>> -+      __u16   bg_free_inodes_count;   /* Free inodes count */
>> -+      __u16   bg_used_dirs_count;     /* Directories count */
>> -+      __u16   bg_flags;               /* EXT4_BG_flags (INODE_UNINIT,
>> etc) */
>> -+      __u32   bg_exclude_bitmap_lo;   /* Exclude bitmap for snapshots */
>> -+      __u16   bg_block_bitmap_csum_lo;/* crc32c(s_uuid+grp_num+bitmap)
>> LSB */
>> -+      __u16   bg_inode_bitmap_csum_lo;/* crc32c(s_uuid+grp_num+bitmap)
>> LSB */
>> -+      __u16   bg_itable_unused;       /* Unused inodes count */
>> -+      __u16   bg_checksum;            /* crc16(sb_uuid+group+desc) */
>> -+      __u32   bg_block_bitmap_hi;     /* Blocks bitmap block MSB */
>> -+      __u32   bg_inode_bitmap_hi;     /* Inodes bitmap block MSB */
>> -+      __u32   bg_inode_table_hi;      /* Inodes table block MSB */
>> -+      __u16   bg_free_blocks_count_hi;/* Free blocks count MSB */
>> -+      __u16   bg_free_inodes_count_hi;/* Free inodes count MSB */
>> -+      __u16   bg_used_dirs_count_hi;  /* Directories count MSB */
>> -+      __u16   bg_itable_unused_hi;    /* Unused inodes count MSB */
>> -+      __u32   bg_exclude_bitmap_hi;   /* Exclude bitmap block MSB */
>> -+      __u16   bg_block_bitmap_csum_hi;/* crc32c(s_uuid+grp_num+bitmap)
>> MSB */
>> -+      __u16   bg_inode_bitmap_csum_hi;/* crc32c(s_uuid+grp_num+bitmap)
>> MSB */
>> -+      __u32   bg_reserved;
>> -+};
>> -+
>> -+#define EXT2_BG_INODE_UNINIT  0x0001 /* Inode table/bitmap not
>> initialized */
>> -+#define EXT2_BG_BLOCK_UNINIT  0x0002 /* Block bitmap not initialized */
>> -+#define EXT2_BG_INODE_ZEROED  0x0004 /* On-disk itable initialized to
>> zero */
>> -+
>> -+/*
>> -+ * Data structures used by the directory indexing feature
>> -+ *
>> -+ * Note: all of the multibyte integer fields are little endian.
>> -+ */
>> -+
>> -+/*
>> -+ * Note: dx_root_info is laid out so that if it should somehow get
>> -+ * overlaid by a dirent the two low bits of the hash version will be
>> -+ * zero.  Therefore, the hash version mod 4 should never be 0.
>> -+ * Sincerely, the paranoia department.
>> -+ */
>> -+struct ext2_dx_root_info {
>> -+      __u32 reserved_zero;
>> -+      __u8 hash_version; /* 0 now, 1 at release */
>> -+      __u8 info_length; /* 8 */
>> -+      __u8 indirect_levels;
>> -+      __u8 unused_flags;
>> -+};
>> -+
>> -+#define EXT2_HASH_LEGACY              0
>> -+#define EXT2_HASH_HALF_MD4            1
>> -+#define EXT2_HASH_TEA                 2
>> -+#define EXT2_HASH_LEGACY_UNSIGNED     3 /* reserved for userspace lib */
>> -+#define EXT2_HASH_HALF_MD4_UNSIGNED   4 /* reserved for userspace lib */
>> -+#define EXT2_HASH_TEA_UNSIGNED                5 /* reserved for
>> userspace lib */
>> -+
>> -+#define EXT2_HASH_FLAG_INCOMPAT       0x1
>> -+
>> -+struct ext2_dx_entry {
>> -+      __u32 hash;
>> -+      __u32 block;
>> -+};
>> -+
>> -+struct ext2_dx_countlimit {
>> -+      __u16 limit;
>> -+      __u16 count;
>> -+};
>> -+
>> -+
>> -+/*
>> -+ * Macro-instructions used to manage group descriptors
>> -+ */
>> -+#define EXT2_MIN_DESC_SIZE             32
>> -+#define EXT2_MIN_DESC_SIZE_64BIT       64
>> -+#define EXT2_MAX_DESC_SIZE             EXT2_MIN_BLOCK_SIZE
>> -+#define EXT2_DESC_SIZE(s)
>>  \
>> -+       ((EXT2_SB(s)->s_feature_**incompat &
>> EXT4_FEATURE_INCOMPAT_64BIT) ? \
>> -+      (s)->s_desc_size : EXT2_MIN_DESC_SIZE)
>> -+
>> -+#define EXT2_BLOCKS_PER_GROUP(s)      (EXT2_SB(s)->s_blocks_per_**
>> group)
>> -+#define EXT2_INODES_PER_GROUP(s)      (EXT2_SB(s)->s_inodes_per_**
>> group)
>> -+#define EXT2_CLUSTERS_PER_GROUP(s)    (EXT2_SB(s)->s_clusters_per_**
>> group)
>> -+#define EXT2_INODES_PER_BLOCK(s)      (EXT2_BLOCK_SIZE(s)/EXT2_**
>> INODE_SIZE(s))
>> -+/* limits imposed by 16-bit value gd_free_{blocks,inode}_count */
>> -+#define EXT2_MAX_BLOCKS_PER_GROUP(s)  ((((unsigned) 1 << 16) - 8) *   \
>> -+                                       (EXT2_CLUSTER_SIZE(s) / \
>> -+                                        EXT2_BLOCK_SIZE(s)))
>> -+#define EXT2_MAX_CLUSTERS_PER_GROUP(s)        (((unsigned) 1 << 16) - 8)
>> -+#define EXT2_MAX_INODES_PER_GROUP(s)  (((unsigned) 1 << 16) - \
>> -+                                       EXT2_INODES_PER_BLOCK(s))
>> -+#ifdef __KERNEL__
>> -+#define EXT2_DESC_PER_BLOCK(s)
>>  (EXT2_SB(s)->s_desc_per_block)
>> -+#define EXT2_DESC_PER_BLOCK_BITS(s)   (EXT2_SB(s)->s_desc_per_block_**
>> bits)
>> -+#else
>> -+#define EXT2_DESC_PER_BLOCK(s)                (EXT2_BLOCK_SIZE(s) /
>> EXT2_DESC_SIZE(s))
>> -+#endif
>> -+
>> -+/*
>> -+ * Constants relative to the data blocks
>> -+ */
>> -+#define EXT2_NDIR_BLOCKS              12
>> -+#define EXT2_IND_BLOCK                        EXT2_NDIR_BLOCKS
>> -+#define EXT2_DIND_BLOCK                       (EXT2_IND_BLOCK + 1)
>> -+#define EXT2_TIND_BLOCK                       (EXT2_DIND_BLOCK + 1)
>> -+#define EXT2_N_BLOCKS                 (EXT2_TIND_BLOCK + 1)
>> -+
>> -+/*
>> -+ * Inode flags
>> -+ */
>> -+#define EXT2_SECRM_FL                 0x00000001 /* Secure deletion */
>> -+#define EXT2_UNRM_FL                  0x00000002 /* Undelete */
>> -+#define EXT2_COMPR_FL                 0x00000004 /* Compress file */
>> -+#define EXT2_SYNC_FL                  0x00000008 /* Synchronous updates
>> */
>> -+#define EXT2_IMMUTABLE_FL             0x00000010 /* Immutable file */
>> -+#define EXT2_APPEND_FL                        0x00000020 /* writes to
>> file may only append */
>> -+#define EXT2_NODUMP_FL                        0x00000040 /* do not dump
>> file */
>> -+#define EXT2_NOATIME_FL                       0x00000080 /* do not
>> update atime */
>> -+/* Reserved for compression usage... */
>> -+#define EXT2_DIRTY_FL                 0x00000100
>> -+#define EXT2_COMPRBLK_FL              0x00000200 /* One or more
>> compressed clusters */
>> -+#define EXT2_NOCOMPR_FL                       0x00000400 /* Access raw
>> compressed data */
>> -+#define EXT2_ECOMPR_FL                        0x00000800 /* Compression
>> error */
>> -+/* End compression flags --- maybe not all used */
>> -+#define EXT2_BTREE_FL                 0x00001000 /* btree format dir */
>> -+#define EXT2_INDEX_FL                 0x00001000 /* hash-indexed
>> directory */
>> -+#define EXT2_IMAGIC_FL                        0x00002000
>> -+#define EXT3_JOURNAL_DATA_FL          0x00004000 /* file data should be
>> journaled */
>> -+#define EXT2_NOTAIL_FL                        0x00008000 /* file tail
>> should not be merged */
>> -+#define EXT2_DIRSYNC_FL               0x00010000 /* Synchronous
>> directory modifications */
>> -+#define EXT2_TOPDIR_FL                        0x00020000 /* Top of
>> directory hierarchies*/
>> -+#define EXT4_HUGE_FILE_FL               0x00040000 /* Set to each huge
>> file */
>> -+#define EXT4_EXTENTS_FL               0x00080000 /* Inode uses extents
>> */
>> -+#define EXT4_EA_INODE_FL              0x00200000 /* Inode used for
>> large EA */
>> -+/* EXT4_EOFBLOCKS_FL 0x00400000 was here */
>> -+#define EXT4_SNAPFILE_FL              0x01000000  /* Inode is a
>> snapshot */
>> -+#define EXT4_SNAPFILE_DELETED_FL      0x04000000  /* Snapshot is being
>> deleted */
>> -+#define EXT4_SNAPFILE_SHRUNK_FL               0x08000000  /* Snapshot
>> shrink has completed */
>> -+#define EXT2_RESERVED_FL              0x80000000 /* reserved for ext2
>> lib */
>> -+
>> -+#define EXT2_FL_USER_VISIBLE          0x004BDFFF /* User visible flags
>> */
>> -+#define EXT2_FL_USER_MODIFIABLE               0x004B80FF /* User
>> modifiable flags */
>> -+
>> -+/*
>> -+ * ioctl commands
>> -+ */
>> -+
>> -+/* Used for online resize */
>> -+struct ext2_new_group_input {
>> -+      __u32 group;            /* Group number for this data */
>> -+      __u32 block_bitmap;     /* Absolute block number of block bitmap
>> */
>> -+      __u32 inode_bitmap;     /* Absolute block number of inode bitmap
>> */
>> -+      __u32 inode_table;      /* Absolute block number of inode table
>> start */
>> -+      __u32 blocks_count;     /* Total number of blocks in this group */
>> -+      __u16 reserved_blocks;  /* Number of reserved blocks in this
>> group */
>> -+      __u16 unused;           /* Number of reserved GDT blocks in group
>> */
>> -+};
>> -+
>> -+struct ext4_new_group_input {
>> -+      __u32 group;            /* Group number for this data */
>> -+      __u64 block_bitmap;     /* Absolute block number of block bitmap
>> */
>> -+      __u64 inode_bitmap;     /* Absolute block number of inode bitmap
>> */
>> -+      __u64 inode_table;      /* Absolute block number of inode table
>> start */
>> -+      __u32 blocks_count;     /* Total number of blocks in this group */
>> -+      __u16 reserved_blocks;  /* Number of reserved blocks in this
>> group */
>> -+      __u16 unused;
>> -+};
>> -+
>> -+#ifdef __GNU__                        /* Needed for the Hurd */
>> -+#define _IOT_ext2_new_group_input _IOT (_IOTS(__u32), 5, _IOTS(__u16),
>> 2, 0, 0)
>> -+#endif
>> -+
>> -+#define EXT2_IOC_GETFLAGS             _IOR('f', 1, long)
>> -+#define EXT2_IOC_SETFLAGS             _IOW('f', 2, long)
>> -+#define EXT2_IOC_GETVERSION           _IOR('v', 1, long)
>> -+#define EXT2_IOC_SETVERSION           _IOW('v', 2, long)
>> -+#define EXT2_IOC_GETVERSION_NEW               _IOR('f', 3, long)
>> -+#define EXT2_IOC_SETVERSION_NEW               _IOW('f', 4, long)
>> -+#define EXT2_IOC_GROUP_EXTEND         _IOW('f', 7, unsigned long)
>> -+#define EXT2_IOC_GROUP_ADD            _IOW('f', 8,struct
>> ext2_new_group_input)
>> -+#define EXT4_IOC_GROUP_ADD            _IOW('f', 8,struct
>> ext4_new_group_input)
>> -+#define EXT4_IOC_RESIZE_FS            _IOW('f', 16, __u64)
>> -+
>> -+/*
>> -+ * Structure of an inode on the disk
>> -+ */
>> -+struct ext2_inode {
>> -+      __u16   i_mode;         /* File mode */
>> -+      __u16   i_uid;          /* Low 16 bits of Owner Uid */
>> -+      __u32   i_size;         /* Size in bytes */
>> -+      __u32   i_atime;        /* Access time */
>> -+      __u32   i_ctime;        /* Inode change time */
>> -+      __u32   i_mtime;        /* Modification time */
>> -+      __u32   i_dtime;        /* Deletion Time */
>> -+      __u16   i_gid;          /* Low 16 bits of Group Id */
>> -+      __u16   i_links_count;  /* Links count */
>> -+      __u32   i_blocks;       /* Blocks count */
>> -+      __u32   i_flags;        /* File flags */
>> -+      union {
>> -+              struct {
>> -+                      __u32   l_i_version; /* was l_i_reserved1 */
>> -+              } linux1;
>> -+              struct {
>> -+                      __u32  h_i_translator;
>> -+              } hurd1;
>> -+      } osd1;                         /* OS dependent 1 */
>> -+      __u32   i_block[EXT2_N_BLOCKS];/* Pointers to blocks */
>> -+      __u32   i_generation;   /* File version (for NFS) */
>> -+      __u32   i_file_acl;     /* File ACL */
>> -+      __u32   i_size_high;    /* Formerly i_dir_acl, directory ACL */
>> -+      __u32   i_faddr;        /* Fragment address */
>> -+      union {
>> -+              struct {
>> -+                      __u16   l_i_blocks_hi;
>> -+                      __u16   l_i_file_acl_high;
>> -+                      __u16   l_i_uid_high;   /* these 2 fields    */
>> -+                      __u16   l_i_gid_high;   /* were reserved2[0] */
>> -+                      __u16   l_i_checksum_lo; /*
>> crc32c(uuid+inum+inode) */
>> -+                      __u16   l_i_reserved;
>> -+              } linux2;
>> -+              struct {
>> -+                      __u8    h_i_frag;       /* Fragment number */
>> -+                      __u8    h_i_fsize;      /* Fragment size */
>> -+                      __u16   h_i_mode_high;
>> -+                      __u16   h_i_uid_high;
>> -+                      __u16   h_i_gid_high;
>> -+                      __u32   h_i_author;
>> -+              } hurd2;
>> -+      } osd2;                         /* OS dependent 2 */
>> -+};
>> -+
>> -+/*
>> -+ * Permanent part of an large inode on the disk
>> -+ */
>> -+struct ext2_inode_large {
>> -+      __u16   i_mode;         /* File mode */
>> -+      __u16   i_uid;          /* Low 16 bits of Owner Uid */
>> -+      __u32   i_size;         /* Size in bytes */
>> -+      __u32   i_atime;        /* Access time */
>> -+      __u32   i_ctime;        /* Inode Change time */
>> -+      __u32   i_mtime;        /* Modification time */
>> -+      __u32   i_dtime;        /* Deletion Time */
>> -+      __u16   i_gid;          /* Low 16 bits of Group Id */
>> -+      __u16   i_links_count;  /* Links count */
>> -+      __u32   i_blocks;       /* Blocks count */
>> -+      __u32   i_flags;        /* File flags */
>> -+      union {
>> -+              struct {
>> -+                      __u32   l_i_version; /* was l_i_reserved1 */
>> -+              } linux1;
>> -+              struct {
>> -+                      __u32  h_i_translator;
>> -+              } hurd1;
>> -+      } osd1;                         /* OS dependent 1 */
>> -+      __u32   i_block[EXT2_N_BLOCKS];/* Pointers to blocks */
>> -+      __u32   i_generation;   /* File version (for NFS) */
>> -+      __u32   i_file_acl;     /* File ACL */
>> -+      __u32   i_size_high;    /* Formerly i_dir_acl, directory ACL */
>> -+      __u32   i_faddr;        /* Fragment address */
>> -+      union {
>> -+              struct {
>> -+                      __u16   l_i_blocks_hi;
>> -+                      __u16   l_i_file_acl_high;
>> -+                      __u16   l_i_uid_high;   /* these 2 fields    */
>> -+                      __u16   l_i_gid_high;   /* were reserved2[0] */
>> -+                      __u16   l_i_checksum_lo; /*
>> crc32c(uuid+inum+inode) */
>> -+                      __u16   l_i_reserved;
>> -+              } linux2;
>> -+              struct {
>> -+                      __u8    h_i_frag;       /* Fragment number */
>> -+                      __u8    h_i_fsize;      /* Fragment size */
>> -+                      __u16   h_i_mode_high;
>> -+                      __u16   h_i_uid_high;
>> -+                      __u16   h_i_gid_high;
>> -+                      __u32   h_i_author;
>> -+              } hurd2;
>> -+      } osd2;                         /* OS dependent 2 */
>> -+      __u16   i_extra_isize;
>> -+      __u16   i_checksum_hi;  /* crc32c(uuid+inum+inode) */
>> -+      __u32   i_ctime_extra;  /* extra Change time (nsec << 2 | epoch)
>> */
>> -+      __u32   i_mtime_extra;  /* extra Modification time (nsec << 2 |
>> epoch) */
>> -+      __u32   i_atime_extra;  /* extra Access time (nsec << 2 | epoch)
>> */
>> -+      __u32   i_crtime;       /* File creation time */
>> -+      __u32   i_crtime_extra; /* extra File creation time (nsec << 2 |
>> epoch)*/
>> -+      __u32   i_version_hi;   /* high 32 bits for 64-bit version */
>> -+};
>> -+
>> -+#define i_dir_acl     i_size_high
>> -+
>> -+#if defined(__KERNEL__) || defined(__linux__)
>> -+#define i_reserved1   osd1.linux1.l_i_reserved1
>> -+#define i_frag                osd2.linux2.l_i_frag
>> -+#define i_fsize               osd2.linux2.l_i_fsize
>> -+#define i_uid_low     i_uid
>> -+#define i_gid_low     i_gid
>> -+#define i_uid_high    osd2.linux2.l_i_uid_high
>> -+#define i_gid_high    osd2.linux2.l_i_gid_high
>> -+#else
>> -+#if defined(__GNU__)
>> -+
>> -+#define i_translator  osd1.hurd1.h_i_translator
>> -+#define i_frag                osd2.hurd2.h_i_frag;
>> -+#define i_fsize               osd2.hurd2.h_i_fsize;
>> -+#define i_uid_high    osd2.hurd2.h_i_uid_high
>> -+#define i_gid_high    osd2.hurd2.h_i_gid_high
>> -+#define i_author      osd2.hurd2.h_i_author
>> -+
>> -+#endif  /* __GNU__ */
>> -+#endif        /* defined(__KERNEL__) || defined(__linux__) */
>> -+
>> -+#define inode_uid(inode)      ((inode).i_uid |
>> (inode).osd2.linux2.l_i_uid_**high << 16)
>> -+#define inode_gid(inode)      ((inode).i_gid |
>> (inode).osd2.linux2.l_i_gid_**high << 16)
>> -+#define ext2fs_set_i_uid_high(inode,x) ((inode).osd2.linux2.l_i_uid_**high
>> = (x))
>> -+#define ext2fs_set_i_gid_high(inode,x) ((inode).osd2.linux2.l_i_gid_**high
>> = (x))
>> -+
>> -+/*
>> -+ * File system states
>> -+ */
>> -+#define EXT2_VALID_FS                 0x0001  /* Unmounted cleanly */
>> -+#define EXT2_ERROR_FS                 0x0002  /* Errors detected */
>> -+#define EXT3_ORPHAN_FS                        0x0004  /* Orphans being
>> recovered */
>> -+
>> -+/*
>> -+ * Misc. filesystem flags
>> -+ */
>> -+#define EXT2_FLAGS_SIGNED_HASH                0x0001  /* Signed dirhash
>> in use */
>> -+#define EXT2_FLAGS_UNSIGNED_HASH      0x0002  /* Unsigned dirhash in
>> use */
>> -+#define EXT2_FLAGS_TEST_FILESYS               0x0004  /* OK for use on
>> development code */
>> -+#define EXT2_FLAGS_IS_SNAPSHOT                0x0010  /* This is a
>> snapshot image */
>> -+#define EXT2_FLAGS_FIX_SNAPSHOT               0x0020  /* Snapshot
>> inodes corrupted */
>> -+#define EXT2_FLAGS_FIX_EXCLUDE                0x0040  /* Exclude
>> bitmaps corrupted */
>> -+
>> -+/*
>> -+ * Mount flags
>> -+ */
>> -+#define EXT2_MOUNT_CHECK              0x0001  /* Do mount-time checks */
>> -+#define EXT2_MOUNT_GRPID              0x0004  /* Create files with
>> directory's group */
>> -+#define EXT2_MOUNT_DEBUG              0x0008  /* Some debugging
>> messages */
>> -+#define EXT2_MOUNT_ERRORS_CONT                0x0010  /* Continue on
>> errors */
>> -+#define EXT2_MOUNT_ERRORS_RO          0x0020  /* Remount fs ro on
>> errors */
>> -+#define EXT2_MOUNT_ERRORS_PANIC               0x0040  /* Panic on
>> errors */
>> -+#define EXT2_MOUNT_MINIX_DF           0x0080  /* Mimics the Minix
>> statfs */
>> -+#define EXT2_MOUNT_NO_UID32           0x0200  /* Disable 32-bit UIDs */
>> -+
>> -+#define clear_opt(o, opt)             o &= ~EXT2_MOUNT_##opt
>> -+#define set_opt(o, opt)                       o |= EXT2_MOUNT_##opt
>> -+#define test_opt(sb, opt)             (EXT2_SB(sb)->s_mount_opt & \
>> -+                                       EXT2_MOUNT_##opt)
>> -+/*
>> -+ * Maximal mount counts between two filesystem checks
>> -+ */
>> -+#define EXT2_DFL_MAX_MNT_COUNT                20      /* Allow 20
>> mounts */
>> -+#define EXT2_DFL_CHECKINTERVAL                0       /* Don't use
>> interval check */
>> -+
>> -+/*
>> -+ * Behaviour when detecting errors
>> -+ */
>> -+#define EXT2_ERRORS_CONTINUE          1       /* Continue execution */
>> -+#define EXT2_ERRORS_RO                        2       /* Remount fs
>> read-only */
>> -+#define EXT2_ERRORS_PANIC             3       /* Panic */
>> -+#define EXT2_ERRORS_DEFAULT           EXT2_ERRORS_CONTINUE
>> -+
>> -+#if (__GNUC__ >= 4)
>> -+#define ext4_offsetof(TYPE,MEMBER) __builtin_offsetof(TYPE,**MEMBER)
>> -+#else
>> -+#define ext4_offsetof(TYPE, MEMBER) ((size_t) &((TYPE *)0)->MEMBER)
>> -+#endif
>> -+
>> -+/*
>> -+ * Structure of the super block
>> -+ */
>> -+struct ext2_super_block {
>> -+      __u32   s_inodes_count;         /* Inodes count */
>> -+      __u32   s_blocks_count;         /* Blocks count */
>> -+      __u32   s_r_blocks_count;       /* Reserved blocks count */
>> -+      __u32   s_free_blocks_count;    /* Free blocks count */
>> -+      __u32   s_free_inodes_count;    /* Free inodes count */
>> -+      __u32   s_first_data_block;     /* First Data Block */
>> -+      __u32   s_log_block_size;       /* Block size */
>> -+      __u32   s_log_cluster_size;     /* Allocation cluster size */
>> -+      __u32   s_blocks_per_group;     /* # Blocks per group */
>> -+      __u32   s_clusters_per_group;   /* # Fragments per group */
>> -+      __u32   s_inodes_per_group;     /* # Inodes per group */
>> -+      __u32   s_mtime;                /* Mount time */
>> -+      __u32   s_wtime;                /* Write time */
>> -+      __u16   s_mnt_count;            /* Mount count */
>> -+      __s16   s_max_mnt_count;        /* Maximal mount count */
>> -+      __u16   s_magic;                /* Magic signature */
>> -+      __u16   s_state;                /* File system state */
>> -+      __u16   s_errors;               /* Behaviour when detecting
>> errors */
>> -+      __u16   s_minor_rev_level;      /* minor revision level */
>> -+      __u32   s_lastcheck;            /* time of last check */
>> -+      __u32   s_checkinterval;        /* max. time between checks */
>> -+      __u32   s_creator_os;           /* OS */
>> -+      __u32   s_rev_level;            /* Revision level */
>> -+      __u16   s_def_resuid;           /* Default uid for reserved
>> blocks */
>> -+      __u16   s_def_resgid;           /* Default gid for reserved
>> blocks */
>> -+      /*
>> -+       * These fields are for EXT2_DYNAMIC_REV superblocks only.
>> -+       *
>> -+       * Note: the difference between the compatible feature set and
>> -+       * the incompatible feature set is that if there is a bit set
>> -+       * in the incompatible feature set that the kernel doesn't
>> -+       * know about, it should refuse to mount the filesystem.
>> -+       *
>> -+       * e2fsck's requirements are more strict; if it doesn't know
>> -+       * about a feature in either the compatible or incompatible
>> -+       * feature set, it must abort and not try to meddle with
>> -+       * things it doesn't understand...
>> -+       */
>> -+      __u32   s_first_ino;            /* First non-reserved inode */
>> -+      __u16   s_inode_size;           /* size of inode structure */
>> -+      __u16   s_block_group_nr;       /* block group # of this
>> superblock */
>> -+      __u32   s_feature_compat;       /* compatible feature set */
>> -+      __u32   s_feature_incompat;     /* incompatible feature set */
>> -+      __u32   s_feature_ro_compat;    /* readonly-compatible feature
>> set */
>> -+      __u8    s_uuid[16];             /* 128-bit uuid for volume */
>> -+      char    s_volume_name[16];      /* volume name */
>> -+      char    s_last_mounted[64];     /* directory where last mounted */
>> -+      __u32   s_algorithm_usage_bitmap; /* For compression */
>> -+      /*
>> -+       * Performance hints.  Directory preallocation should only
>> -+       * happen if the EXT2_FEATURE_COMPAT_DIR_**PREALLOC flag is on.
>> -+       */
>> -+      __u8    s_prealloc_blocks;      /* Nr of blocks to try to
>> preallocate*/
>> -+      __u8    s_prealloc_dir_blocks;  /* Nr to preallocate for dirs */
>> -+      __u16   s_reserved_gdt_blocks;  /* Per group table for online
>> growth */
>> -+      /*
>> -+       * Journaling support valid if EXT2_FEATURE_COMPAT_HAS_**JOURNAL
>> set.
>> -+       */
>> -+      __u8    s_journal_uuid[16];     /* uuid of journal superblock */
>> -+      __u32   s_journal_inum;         /* inode number of journal file */
>> -+      __u32   s_journal_dev;          /* device number of journal file
>> */
>> -+      __u32   s_last_orphan;          /* start of list of inodes to
>> delete */
>> -+      __u32   s_hash_seed[4];         /* HTREE hash seed */
>> -+      __u8    s_def_hash_version;     /* Default hash version to use */
>> -+      __u8    s_jnl_backup_type;      /* Default type of journal backup
>> */
>> -+      __u16   s_desc_size;            /* Group desc. size:
>> INCOMPAT_64BIT */
>> -+      __u32   s_default_mount_opts;
>> -+      __u32   s_first_meta_bg;        /* First metablock group */
>> -+      __u32   s_mkfs_time;            /* When the filesystem was
>> created */
>> -+      __u32   s_jnl_blocks[17];       /* Backup of the journal inode */
>> -+      __u32   s_blocks_count_hi;      /* Blocks count high 32bits */
>> -+      __u32   s_r_blocks_count_hi;    /* Reserved blocks count high 32
>> bits*/
>> -+      __u32   s_free_blocks_hi;       /* Free blocks count */
>> -+      __u16   s_min_extra_isize;      /* All inodes have at least #
>> bytes */
>> -+      __u16   s_want_extra_isize;     /* New inodes should reserve #
>> bytes */
>> -+      __u32   s_flags;                /* Miscellaneous flags */
>> -+      __u16   s_raid_stride;          /* RAID stride */
>> -+      __u16   s_mmp_update_interval;  /* # seconds to wait in MMP
>> checking */
>> -+      __u64   s_mmp_block;            /* Block for multi-mount
>> protection */
>> -+      __u32   s_raid_stripe_width;    /* blocks on all data disks
>> (N*stride)*/
>> -+      __u8    s_log_groups_per_flex;  /* FLEX_BG group size */
>> -+      __u8    s_reserved_char_pad;
>> -+      __u16   s_reserved_pad;         /* Padding to next 32bits */
>> -+      __u64   s_kbytes_written;       /* nr of lifetime kilobytes
>> written */
>> -+      __u32   s_snapshot_inum;        /* Inode number of active
>> snapshot */
>> -+      __u32   s_snapshot_id;          /* sequential ID of active
>> snapshot */
>> -+      __u64   s_snapshot_r_blocks_count; /* reserved blocks for active
>> -+                                            snapshot's future use */
>> -+      __u32   s_snapshot_list;        /* inode number of the head of
>> the on-disk snapshot list */
>> -+#define EXT4_S_ERR_START ext4_offsetof(struct ext2_super_block,
>> s_error_count)
>> -+      __u32   s_error_count;          /* number of fs errors */
>> -+      __u32   s_first_error_time;     /* first time an error happened */
>> -+      __u32   s_first_error_ino;      /* inode involved in first error
>> */
>> -+      __u64   s_first_error_block;    /* block involved of first error
>> */
>> -+      __u8    s_first_error_func[32]; /* function where the error
>> happened */
>> -+      __u32   s_first_error_line;     /* line number where error
>> happened */
>> -+      __u32   s_last_error_time;      /* most recent time of an error */
>> -+      __u32   s_last_error_ino;       /* inode involved in last error */
>> -+      __u32   s_last_error_line;      /* line number where error
>> happened */
>> -+      __u64   s_last_error_block;     /* block involved of last error */
>> -+      __u8    s_last_error_func[32];  /* function where the error
>> happened */
>> -+#define EXT4_S_ERR_END ext4_offsetof(struct ext2_super_block,
>> s_mount_opts)
>> -+      __u8    s_mount_opts[64];
>> -+      __u32   s_usr_quota_inum;       /* inode number of user quota
>> file */
>> -+      __u32   s_grp_quota_inum;       /* inode number of group quota
>> file */
>> -+      __u32   s_overhead_blocks;      /* overhead blocks/clusters in fs
>> */
>> -+      __u32   s_reserved[108];        /* Padding to the end of the
>> block */
>> -+      __u32   s_checksum;             /* crc32c(superblock) */
>> -+};
>> -+
>> -+#define EXT4_S_ERR_LEN (EXT4_S_ERR_END - EXT4_S_ERR_START)
>> -+
>> -+/*
>> -+ * Codes for operating systems
>> -+ */
>> -+#define EXT2_OS_LINUX         0
>> -+#define EXT2_OS_HURD          1
>> -+#define EXT2_OBSO_OS_MASIX    2
>> -+#define EXT2_OS_FREEBSD               3
>> -+#define EXT2_OS_LITES         4
>> -+
>> -+/*
>> -+ * Revision levels
>> -+ */
>> -+#define EXT2_GOOD_OLD_REV     0       /* The good old (original) format
>> */
>> -+#define EXT2_DYNAMIC_REV      1       /* V2 format w/ dynamic inode
>> sizes */
>> -+
>> -+#define EXT2_CURRENT_REV      EXT2_GOOD_OLD_REV
>> -+#define EXT2_MAX_SUPP_REV     EXT2_DYNAMIC_REV
>> -+
>> -+#define EXT2_GOOD_OLD_INODE_SIZE 128
>> -+
>> -+/*
>> -+ * Journal inode backup types
>> -+ */
>> -+#define EXT3_JNL_BACKUP_BLOCKS        1
>> -+
>> -+/*
>> -+ * Feature set definitions
>> -+ */
>> -+
>> -+#define EXT2_HAS_COMPAT_FEATURE(sb,**mask)                      \
>> -+      ( EXT2_SB(sb)->s_feature_compat & (mask) )
>> -+#define EXT2_HAS_RO_COMPAT_FEATURE(sb,**mask)                   \
>> -+      ( EXT2_SB(sb)->s_feature_ro_**compat & (mask) )
>> -+#define EXT2_HAS_INCOMPAT_FEATURE(sb,**mask)                    \
>> -+      ( EXT2_SB(sb)->s_feature_**incompat & (mask) )
>> -+
>> -+#define EXT2_FEATURE_COMPAT_DIR_**PREALLOC      0x0001
>> -+#define EXT2_FEATURE_COMPAT_IMAGIC_**INODES     0x0002
>> -+#define EXT3_FEATURE_COMPAT_HAS_**JOURNAL               0x0004
>> -+#define EXT2_FEATURE_COMPAT_EXT_ATTR          0x0008
>> -+#define EXT2_FEATURE_COMPAT_RESIZE_**INODE      0x0010
>> -+#define EXT2_FEATURE_COMPAT_DIR_INDEX         0x0020
>> -+#define EXT2_FEATURE_COMPAT_LAZY_BG           0x0040
>> -+/* #define EXT2_FEATURE_COMPAT_EXCLUDE_**INODE  0x0080 not used,
>> legacy */
>> -+#define EXT2_FEATURE_COMPAT_EXCLUDE_**BITMAP    0x0100
>> -+
>> -+
>> -+#define EXT2_FEATURE_RO_COMPAT_SPARSE_**SUPER   0x0001
>> -+#define EXT2_FEATURE_RO_COMPAT_LARGE_**FILE     0x0002
>> -+/* #define EXT2_FEATURE_RO_COMPAT_BTREE_**DIR   0x0004 not used */
>> -+#define EXT4_FEATURE_RO_COMPAT_HUGE_**FILE      0x0008
>> -+#define EXT4_FEATURE_RO_COMPAT_GDT_**CSUM               0x0010
>> -+#define EXT4_FEATURE_RO_COMPAT_DIR_**NLINK      0x0020
>> -+#define EXT4_FEATURE_RO_COMPAT_EXTRA_**ISIZE    0x0040
>> -+#define EXT4_FEATURE_RO_COMPAT_HAS_**SNAPSHOT   0x0080
>> -+#define EXT4_FEATURE_RO_COMPAT_QUOTA          0x0100
>> -+#define EXT4_FEATURE_RO_COMPAT_**BIGALLOC               0x0200
>> -+#define EXT4_FEATURE_RO_COMPAT_**METADATA_CSUM  0x0400
>> -+#define EXT4_FEATURE_RO_COMPAT_REPLICA                0x0800
>> -+
>> -+#define EXT2_FEATURE_INCOMPAT_**COMPRESSION     0x0001
>> -+#define EXT2_FEATURE_INCOMPAT_FILETYPE                0x0002
>> -+#define EXT3_FEATURE_INCOMPAT_RECOVER         0x0004 /* Needs recovery
>> */
>> -+#define EXT3_FEATURE_INCOMPAT_JOURNAL_**DEV     0x0008 /* Journal
>> device */
>> -+#define EXT2_FEATURE_INCOMPAT_META_BG         0x0010
>> -+#define EXT3_FEATURE_INCOMPAT_EXTENTS         0x0040
>> -+#define EXT4_FEATURE_INCOMPAT_64BIT           0x0080
>> -+#define EXT4_FEATURE_INCOMPAT_MMP             0x0100
>> -+#define EXT4_FEATURE_INCOMPAT_FLEX_BG         0x0200
>> -+#define EXT4_FEATURE_INCOMPAT_EA_INODE                0x0400
>> -+#define EXT4_FEATURE_INCOMPAT_DIRDATA         0x1000
>> -+
>> -+#define EXT2_FEATURE_COMPAT_SUPP      0
>> -+#define EXT2_FEATURE_INCOMPAT_SUPP    (EXT2_FEATURE_INCOMPAT_**FILETYPE|
>> \
>> -+                                     EXT4_FEATURE_INCOMPAT_MMP)
>> -+#define EXT2_FEATURE_RO_COMPAT_SUPP   (EXT2_FEATURE_RO_COMPAT_**SPARSE_SUPER|
>> \
>> -+                                       EXT2_FEATURE_RO_COMPAT_LARGE_**FILE|
>> \
>> -+                                       EXT4_FEATURE_RO_COMPAT_DIR_**NLINK|
>> \
>> -+                                       EXT2_FEATURE_RO_COMPAT_BTREE_**
>> DIR)
>> -+
>> -+/*
>> -+ * Default values for user and/or group using reserved blocks
>> -+ */
>> -+#define EXT2_DEF_RESUID               0
>> -+#define EXT2_DEF_RESGID               0
>> -+
>> -+/*
>> -+ * Default mount options
>> -+ */
>> -+#define EXT2_DEFM_DEBUG               0x0001
>> -+#define EXT2_DEFM_BSDGROUPS   0x0002
>> -+#define EXT2_DEFM_XATTR_USER  0x0004
>> -+#define EXT2_DEFM_ACL         0x0008
>> -+#define EXT2_DEFM_UID16               0x0010
>> -+#define EXT3_DEFM_JMODE               0x0060
>> -+#define EXT3_DEFM_JMODE_DATA  0x0020
>> -+#define EXT3_DEFM_JMODE_ORDERED       0x0040
>> -+#define EXT3_DEFM_JMODE_WBACK 0x0060
>> -+#define EXT4_DEFM_NOBARRIER   0x0100
>> -+#define EXT4_DEFM_BLOCK_VALIDITY 0x0200
>> -+#define EXT4_DEFM_DISCARD     0x0400
>> -+#define EXT4_DEFM_NODELALLOC  0x0800
>> -+
>> -+/*
>> -+ * Structure of a directory entry
>> -+ */
>> -+#define EXT2_NAME_LEN 255
>> -+
>> -+struct ext2_dir_entry {
>> -+      __u32   inode;                  /* Inode number */
>> -+      __u16   rec_len;                /* Directory entry length */
>> -+      __u16   name_len;               /* Name length */
>> -+      char    name[EXT2_NAME_LEN];    /* File name */
>> -+};
>> -+
>> -+/*
>> -+ * The new version of the directory entry.  Since EXT2 structures are
>> -+ * stored in intel byte order, and the name_len field could never be
>> -+ * bigger than 255 chars, it's safe to reclaim the extra byte for the
>> -+ * file_type field.
>> -+ */
>> -+struct ext2_dir_entry_2 {
>> -+      __u32   inode;                  /* Inode number */
>> -+      __u16   rec_len;                /* Directory entry length */
>> -+      __u8    name_len;               /* Name length */
>> -+      __u8    file_type;
>> -+      char    name[EXT2_NAME_LEN];    /* File name */
>> -+};
>> -+
>> -+/*
>> -+ * Ext2 directory file types.  Only the low 3 bits are used.  The
>> -+ * other bits are reserved for now.
>> -+ */
>> -+#define EXT2_FT_UNKNOWN               0
>> -+#define EXT2_FT_REG_FILE      1
>> -+#define EXT2_FT_DIR           2
>> -+#define EXT2_FT_CHRDEV                3
>> -+#define EXT2_FT_BLKDEV                4
>> -+#define EXT2_FT_FIFO          5
>> -+#define EXT2_FT_SOCK          6
>> -+#define EXT2_FT_SYMLINK               7
>> -+
>> -+#define EXT2_FT_MAX           8
>> -+
>> -+/*
>> -+ * EXT2_DIR_PAD defines the directory entries boundaries
>> -+ *
>> -+ * NOTE: It must be a multiple of 4
>> -+ */
>> -+#define EXT2_DIR_PAD                  4
>> -+#define EXT2_DIR_ROUND                        (EXT2_DIR_PAD - 1)
>> -+#define EXT2_DIR_REC_LEN(name_len)    (((name_len) + 8 +
>> EXT2_DIR_ROUND) & \
>> -+                                       ~EXT2_DIR_ROUND)
>> -+
>> -+/*
>> -+ * This structure is used for multiple mount protection. It is written
>> -+ * into the block number saved in the s_mmp_block field in the
>> superblock.
>> -+ * Programs that check MMP should assume that if SEQ_FSCK (or any
>> unknown
>> -+ * code above SEQ_MAX) is present then it is NOT safe to use the
>> filesystem,
>> -+ * regardless of how old the timestamp is.
>> -+ *
>> -+ * The timestamp in the MMP structure will be updated by e2fsck at some
>> -+ * arbitary intervals (start of passes, after every few groups of inodes
>> -+ * in pass1 and pass1b).  There is no guarantee that e2fsck is updating
>> -+ * the MMP block in a timely manner, and the updates it does are purely
>> -+ * for the convenience of the sysadmin and not for automatic validation.
>> -+ *
>> -+ * Note: Only the mmp_seq value is used to determine whether the MMP
>> block
>> -+ *    is being updated.  The mmp_time, mmp_nodename, and mmp_bdevname
>> -+ *    fields are only for informational purposes for the administrator,
>> -+ *    due to clock skew between nodes and hostname HA service takeover.
>> -+ */
>> -+#define EXT4_MMP_MAGIC     0x004D4D50U /* ASCII for MMP */
>> -+#define EXT4_MMP_SEQ_CLEAN 0xFF4D4D50U /* mmp_seq value for clean
>> unmount */
>> -+#define EXT4_MMP_SEQ_FSCK  0xE24D4D50U /* mmp_seq value when being
>> fscked */
>> -+#define EXT4_MMP_SEQ_MAX   0xE24D4D4FU /* maximum valid mmp_seq value */
>> -+
>> -+struct mmp_struct {
>> -+      __u32   mmp_magic;              /* Magic number for MMP */
>> -+      __u32   mmp_seq;                /* Sequence no. updated
>> periodically */
>> -+      __u64   mmp_time;               /* Time last updated */
>> -+      char    mmp_nodename[64];       /* Node which last updated MMP
>> block */
>> -+      char    mmp_bdevname[32];       /* Bdev which last updated MMP
>> block */
>> -+      __u16   mmp_check_interval;     /* Changed mmp_check_interval */
>> -+      __u16   mmp_pad1;
>> -+      __u32   mmp_pad2[227];
>> -+};
>> -+
>> -+/*
>> -+ * Default interval for MMP update in seconds.
>> -+ */
>> -+#define EXT4_MMP_UPDATE_INTERVAL      5
>> -+
>> -+/*
>> -+ * Maximum interval for MMP update in seconds.
>> -+ */
>> -+#define EXT4_MMP_MAX_UPDATE_INTERVAL  300
>> -+
>> -+/*
>> -+ * Minimum interval for MMP checking in seconds.
>> -+ */
>> -+#define EXT4_MMP_MIN_CHECK_INTERVAL     5
>> -+
>> -+#endif        /* _EXT2FS_EXT2_FS_H */
>> -Index: syslinux-4.03/libinstaller/**linuxioctl.h
>> -=============================**==============================**========
>> ---- syslinux-4.03.orig/**libinstaller/linuxioctl.h
>> -+++ syslinux-4.03/libinstaller/**linuxioctl.h
>> -@@ -9,17 +9,33 @@
>> -
>> - #include <sys/ioctl.h>
>> -
>> -+#ifdef __linux__
>> -+
>> - #define statfs _kernel_statfs /* HACK to deal with broken 2.4 distros */
>> -
>> - #include <linux/fd.h>         /* Floppy geometry */
>> - #include <linux/hdreg.h>      /* Hard disk geometry */
>> -
>> --#include <linux/fs.h>         /* FIGETBSZ, FIBMAP, FS_IOC_FIEMAP */
>> -+#include <linux/fs.h>         /* FIGETBSZ, FIBMAP, FS_IOC_* */
>> - #include <linux/msdos_fs.h>   /* FAT_IOCTL_SET_ATTRIBUTES */
>> -
>> - #undef SECTOR_SIZE            /* Defined in msdos_fs.h for no good
>> reason */
>> - #undef SECTOR_BITS
>> --#include <linux/ext2_fs.h>    /* EXT2_IOC_* */
>> -+
>> -+#ifndef FS_IOC_GETFLAGS
>> -+/* Old kernel headers, these were once ext2-specific... */
>> -+# include <linux/ext2_fs.h>   /* EXT2_IOC_* */
>> -+
>> -+# define FS_IOC_GETFLAGS EXT2_IOC_GETFLAGS
>> -+# define FS_IOC_SETFLAGS EXT2_IOC_SETFLAGS
>> -+
>> -+# define FS_IMMUTABLE_FL EXT2_IMMUTABLE_FL
>> -+
>> -+#else
>> -+
>> -+# include <ext2fs/ext2_fs.h>
>> -+
>> -+#endif
>> -
>> - #ifndef FAT_IOCTL_GET_ATTRIBUTES
>> - # define FAT_IOCTL_GET_ATTRIBUTES     _IOR('r', 0x10, __u32)
>> -@@ -37,11 +53,13 @@
>> -
>> - #undef statfs
>> -
>> --#if defined(__linux__) && !defined(BLKGETSIZE64)
>> -+#ifndef  BLKGETSIZE64
>> - /* This takes a u64, but the size field says size_t.  Someone screwed
>> big. */
>> - # define BLKGETSIZE64 _IOR(0x12,114,size_t)
>> - #endif
>> -
>> - #include <linux/loop.h>
>> -
>> -+#endif /* __linux__ */
>> -+
>> - #endif /* LIBINSTALLER_LINUXIOCTL_H */
>> -Index: syslinux-4.03/libinstaller/**syslxcom.c
>> -=============================**==============================**========
>> ---- syslinux-4.03.orig/**libinstaller/syslxcom.c
>> -+++ syslinux-4.03/libinstaller/**syslxcom.c
>> -@@ -121,9 +121,9 @@ void clear_attributes(int fd)
>> -       {
>> -           int flags;
>> -
>> --          if (!ioctl(fd, EXT2_IOC_GETFLAGS, &flags)) {
>> --              flags &= ~EXT2_IMMUTABLE_FL;
>> --              ioctl(fd, EXT2_IOC_SETFLAGS, &flags);
>> -+          if (!ioctl(fd, FS_IOC_GETFLAGS, &flags)) {
>> -+              flags &= ~FS_IMMUTABLE_FL;
>> -+              ioctl(fd, FS_IOC_SETFLAGS, &flags);
>> -           }
>> -           break;
>> -       }
>> -@@ -151,9 +151,9 @@ void set_attributes(int fd)
>> -       {
>> -           int flags;
>> -
>> --          if (st.st_uid == 0 && !ioctl(fd, EXT2_IOC_GETFLAGS, &flags)) {
>> --              flags |= EXT2_IMMUTABLE_FL;
>> --              ioctl(fd, EXT2_IOC_SETFLAGS, &flags);
>> -+          if (st.st_uid == 0 && !ioctl(fd, FS_IOC_GETFLAGS, &flags)) {
>> -+              flags |= FS_IMMUTABLE_FL;
>> -+              ioctl(fd, FS_IOC_SETFLAGS, &flags);
>> -           }
>> -           break;
>> -       }
>> diff --git a/meta/recipes-devtools/**syslinux/files/no-strip.patch
>> b/meta/recipes-devtools/**syslinux/files/no-strip.patch
>> deleted file mode 100644
>> index 775851a..0000000
>> --- a/meta/recipes-devtools/**syslinux/files/no-strip.patch
>> +++ /dev/null
>> @@ -1,31 +0,0 @@
>> -Disable stripping of binaries
>> -
>> -We don't want to strip these as this is handled separately at package
>> -time.
>> -
>> -Upstream-Status: Inappropriate [configuration]
>> -
>> -Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com**>
>> -
>> ---- syslinux-4.03.orig/mtools/**Makefile
>> -+++ syslinux-4.03/mtools/Makefile
>> -@@ -4,7 +4,7 @@ include $(topdir)/MCONFIG
>> - OPTFLAGS = -g -Os
>> - INCLUDES = -I. -I.. -I../libfat -I../libinstaller
>> - CFLAGS         = $(GCCWARN) -D_FILE_OFFSET_BITS=64 $(OPTFLAGS)
>> $(INCLUDES)
>> --LDFLAGS        = -s
>> -+LDFLAGS        =
>> -
>> - SRCS     = syslinux.c \
>> -          ../libinstaller/fat.c \
>> ---- syslinux-4.03.orig/utils/**Makefile
>> -+++ syslinux-4.03/utils/Makefile
>> -@@ -18,7 +18,7 @@ topdir = ..
>> - include $(topdir)/MCONFIG
>> -
>> - CFLAGS   = $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=64
>> --LDFLAGS  = -O2 -s
>> -+LDFLAGS  = -O2
>> -
>> - TARGETS        = mkdiskimage isohybrid gethostip memdiskfind
>> - TARGETS += isohybrid.pl  # about to be obsoleted
>> diff --git a/meta/recipes-devtools/**syslinux/syslinux_4.03.bbb/meta/recipes-devtools/
>> **syslinux/syslinux_4.03.bb
>> deleted file mode 100644
>> index 7c3ecda..0000000
>> --- a/meta/recipes-devtools/**syslinux/syslinux_4.03.bb
>> +++ /dev/null
>> @@ -1,65 +0,0 @@
>> -DESCRIPTION = "A multi-purpose linux bootloader"
>> -HOMEPAGE = "http://syslinux.zytor.com/"
>> -LICENSE = "GPLv2+"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=**0636e73ff0215e8d672dc4c32c317b*
>> *b3 \
>> -                    file://README;beginline=28;**endline=34;md5=**
>> a4607efd4a6392017186d08099e7d5**46"
>> -
>> -# If you really want to run syslinux, you need mtools.  We just want the
>> -# ldlinux.* stuff for now, so skip mtools-native
>> -DEPENDS = "nasm-native"
>> -PR = "r9"
>> -
>> -SRC_URI = "${KERNELORG_MIRROR}/linux/**utils/boot/syslinux/4.xx/**syslinux-${PV}.tar.bz2
>> \
>> -           file://cross-build.patch \
>> -           file://no-strip.patch \
>> -           file://libinstaller-Avoid-**using-linux-ext2_fs.h.patch"
>> -
>> -SRC_URI[md5sum] = "**a7ca38a0a5786b6efae8fb01a1ae80**70"
>> -SRC_URI[sha256sum] = "**c65567e324f9d1f7f794ae8f9578a0**
>> 292bbd47d7b8d895a004d2f0152d0b**da38"
>> -
>> -COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|**freebsd.*)'
>> -
>> -EXTRA_OEMAKE = " \
>> -       BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
>> -       DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
>> -"
>> -# syslinux uses $LD for linking, strip `-Wl,' so it can work
>> -export LDFLAGS = "`echo $LDFLAGS | sed 's/-Wl,//g'`"
>> -
>> -do_configure() {
>> -       # drop win32 targets or build fails
>> -       sed -e 's,win32/\S*,,g' -i Makefile
>> -
>> -       # clean installer executables included in source tarball
>> -       oe_runmake clean
>> -}
>> -
>> -do_compile() {
>> -       # Rebuild only the installer; keep precompiled bootloaders
>> -       # as per author's request (doc/distrib.txt)
>> -       oe_runmake CC="${CC}" installer
>> -}
>> -
>> -do_install() {
>> -       oe_runmake install INSTALLROOT="${D}"
>> -
>> -       install -d ${D}${libdir}/syslinux/
>> -       install -m 644 ${S}/core/ldlinux.sys ${D}${libdir}/syslinux/
>> -       install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/syslinux/
>> -}
>> -
>> -PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux
>> ${PN}-isolinux ${PN}-misc"
>> -
>> -RDEPENDS_${PN} += "mtools"
>> -
>> -FILES_${PN} = "${bindir}/syslinux"
>> -FILES_${PN}-extlinux = "${sbindir}/extlinux"
>> -FILES_${PN}-mbr = "${libdir}/${BPN}/mbr.bin"
>> -FILES_${PN}-chain = "${libdir}/${BPN}/chain.c32"
>> -FILES_${PN}-isolinux = "${libdir}/${BPN}/isolinux.**bin"
>> -FILES_${PN}-pxelinux = "${libdir}/${BPN}/pxelinux.0"
>> -FILES_${PN}-dev += "${datadir}/${BPN}/com32/lib*$**{SOLIBS}
>> ${datadir}/${BPN}/com32/**include ${datadir}/${BPN}/com32/com32.**ld"
>> -FILES_${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.**a
>> ${libdir}/${BPN}/com32/lib*.a"
>> -FILES_${PN}-misc = "${libdir}/${BPN}/* ${bindir}/*"
>> -
>> -BBCLASSEXTEND = "native"
>> diff --git a/meta/recipes-devtools/**syslinux/syslinux_4.06.bbb/meta/recipes-devtools/
>> **syslinux/syslinux_4.06.bb
>> new file mode 100644
>> index 0000000..a30a4a3
>> --- /dev/null
>> +++ b/meta/recipes-devtools/**syslinux/syslinux_4.06.bb
>> @@ -0,0 +1,62 @@
>> +DESCRIPTION = "A multi-purpose linux bootloader"
>> +HOMEPAGE = "http://syslinux.zytor.com/"
>> +LICENSE = "GPLv2+"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=**0636e73ff0215e8d672dc4c32c317b*
>> *b3 \
>> +                    file://README;beginline=35;**endline=41;md5=**
>> f7249a750bc692d1048b2626752aa4**15"
>> +
>> +# If you really want to run syslinux, you need mtools.  We just want the
>> +# ldlinux.* stuff for now, so skip mtools-native
>> +DEPENDS = "nasm-native util-linux"
>> +PR = "r0"
>> +
>> +SRC_URI = "${KERNELORG_MIRROR}/linux/**utils/boot/syslinux/4.xx/**
>> syslinux-${PV}.tar.bz2"
>> +
>> +SRC_URI[md5sum] = "**0384ef35b724615074e77b1fc89d5b**47"
>> +SRC_URI[sha256sum] = "**dbb7774e36c4596de68fa5e6788ad5**
>> 7809ab31a1760e5d7626e697766d30**ad26"
>> +
>> +COMPATIBLE_HOST = '(x86_64|i.86).*-(linux|**freebsd.*)'
>> +
>> +EXTRA_OEMAKE = " \
>> +       BINDIR=${bindir} SBINDIR=${sbindir} LIBDIR=${libdir} \
>> +       DATADIR=${datadir} MANDIR=${mandir} INCDIR=${includedir} \
>> +"
>> +# syslinux uses $LD for linking, strip `-Wl,' so it can work
>> +export LDFLAGS = "`echo $LDFLAGS | sed 's/-Wl,//g'`"
>> +
>> +do_configure() {
>> +       # drop win32 targets or build fails
>> +       sed -e 's,win32/\S*,,g' -i Makefile
>> +
>> +       # clean installer executables included in source tarball
>> +       oe_runmake clean
>> +}
>> +
>> +do_compile() {
>> +       # Rebuild only the installer; keep precompiled bootloaders
>> +       # as per author's request (doc/distrib.txt)
>> +       oe_runmake CC="${CC} -isystem ${STAGING_INCDIR}" installer
>> +}
>> +
>> +do_install() {
>> +       oe_runmake install INSTALLROOT="${D}"
>> +
>> +       install -d ${D}${libdir}/syslinux/
>> +       install -m 644 ${S}/core/ldlinux.sys ${D}${libdir}/syslinux/
>> +       install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/syslinux/
>> +}
>> +
>> +PACKAGES += "${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux
>> ${PN}-isolinux ${PN}-misc"
>> +
>> +RDEPENDS_${PN} += "mtools"
>> +
>> +FILES_${PN} = "${bindir}/syslinux"
>> +FILES_${PN}-extlinux = "${sbindir}/extlinux"
>> +FILES_${PN}-mbr = "${datadir}/${BPN}/mbr.bin"
>> +FILES_${PN}-chain = "${datadir}/${BPN}/chain.c32"
>> +FILES_${PN}-isolinux = "${datadir}/${BPN}/isolinux.**bin"
>> +FILES_${PN}-pxelinux = "${datadir}/${BPN}/pxelinux.0"
>> +FILES_${PN}-dev += "${datadir}/${BPN}/com32/lib*$**{SOLIBS}
>> ${datadir}/${BPN}/com32/**include ${datadir}/${BPN}/com32/com32.**ld"
>> +FILES_${PN}-staticdev += "${datadir}/${BPN}/com32/lib*.**a
>> ${libdir}/${BPN}/com32/lib*.a"
>> +FILES_${PN}-misc = "${datadir}/${BPN}/* ${libdir}/${BPN}/* ${bindir}/*"
>> +
>> +BBCLASSEXTEND = "native"
>>
>>

--089e0112c63a091ce604dc2d2087
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Saul,<div><br></div><div style>I have verified that it =
is picking up uuid library from /usr/lib on host. I have submitted patch v8=
 to correct this.</div><div style><br></div><div style>Regards,</div><div s=
tyle>
Jonathan</div></div><div class=3D"gmail_extra"><br><br><div class=3D"gmail_=
quote">On 8 May 2013 06:09, Saul Wold <span dir=3D"ltr">&lt;<a href=3D"mail=
to:sgw@linux.intel.com" target=3D"_blank">sgw@linux.intel.com</a>&gt;</span=
> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><br>
Jonathan,<br>
<br>
This patch still does not address the issue that I mentioned in the last em=
ail about the failing to build the native version of isohybrid.<br>
<br>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
| gcc =C2=A0-isystem /srv/ssd/sgw/machines/fri2/<u></u>tmp/sysroots/x86_64-=
linux/usr/<u></u>include -O2 -o isohybrid isohybrid.o isohdpfx.o -luuid<br>
| /usr/bin/ld: cannot find -luuid<br>
</blockquote>
<br>
I mentioned clearly at the end that the -isystem setting to the STAGING_INC=
DIR is wrong since it does not correctly accound for the libuuid library no=
t being found.<br>
<br>
I read your testing report, you might have uuid/util-linux installed on you=
r host which is causing some host contamination issue.<br>
<br>
Please verify this.<br>
<br>
Thanks<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br=
>
<br>
<br>
On 05/06/2013 04:03 PM, Jonathan Liu wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Patches are now part of upstream or no longer needed.<br>
Added new util-linux dependency for isohybrid.<br>
Paths updated to reflect directory structure changes.<br>
<br>
INCDIR isn&#39;t used by the build process during compilation which results=
<br>
in the compiler not finding uuid/uuid.h from util-linux when compiling<br>
isohybrid unless it exists on the host system. This was fixed by adding<br>
-isystem ${STAGING_INCDIR} to CC when calling make.<br>
<br>
[YOCTO #4438]<br>
<br>
Signed-off-by: Jonathan Liu &lt;<a href=3D"mailto:net147@gmail.com" target=
=3D"_blank">net147@gmail.com</a>&gt;<br>
---<br>
=C2=A0 meta/classes/boot-directdisk.<u></u>bbclass =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 2 +-<br>
=C2=A0 .../syslinux/files/cross-<u></u>build.patch =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A071 --<br>
=C2=A0 .../libinstaller-Avoid-using-<u></u>linux-ext2_fs.h.patch | 975 ----=
-----------------<br>
=C2=A0 .../recipes-devtools/syslinux/<u></u>files/no-strip.patch | =C2=A031=
 -<br>
=C2=A0 meta/recipes-devtools/<u></u>syslinux/<a href=3D"http://syslinux_4.0=
3.bb" target=3D"_blank">syslinux_4.03.bb</a> =C2=A0 =C2=A0| =C2=A065 --<br>
=C2=A0 meta/recipes-devtools/<u></u>syslinux/<a href=3D"http://syslinux_4.0=
6.bb" target=3D"_blank">syslinux_4.06.bb</a> =C2=A0 =C2=A0| =C2=A062 ++<br>
=C2=A0 6 files changed, 63 insertions(+), 1143 deletions(-)<br>
=C2=A0 delete mode 100644 meta/recipes-devtools/<u></u>syslinux/files/cross=
-build.<u></u>patch<br>
=C2=A0 delete mode 100644 meta/recipes-devtools/<u></u>syslinux/files/libin=
staller-<u></u>Avoid-using-linux-ext2_fs.h.<u></u>patch<br>
=C2=A0 delete mode 100644 meta/recipes-devtools/<u></u>syslinux/files/no-st=
rip.patch<br>
=C2=A0 delete mode 100644 meta/recipes-devtools/<u></u>syslinux/<a href=3D"=
http://syslinux_4.03.bb" target=3D"_blank">syslinux_4.03.bb</a><br>
=C2=A0 create mode 100644 meta/recipes-devtools/<u></u>syslinux/<a href=3D"=
http://syslinux_4.06.bb" target=3D"_blank">syslinux_4.06.bb</a><br>
<br>
diff --git a/meta/classes/boot-<u></u>directdisk.bbclass b/meta/classes/boo=
t-<u></u>directdisk.bbclass<br>
index d265485..1506b42 100644<br>
--- a/meta/classes/boot-<u></u>directdisk.bbclass<br>
+++ b/meta/classes/boot-<u></u>directdisk.bbclass<br>
@@ -82,7 +82,7 @@ build_boot_dd() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 parted $IMAGE print<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 OFFSET=3D`expr $END2 / 512`<br>
- =C2=A0 =C2=A0 =C2=A0 dd if=3D${STAGING_LIBDIR}/syslinux/<u></u>mbr.bin of=
=3D$IMAGE conv=3Dnotrunc<br>
+ =C2=A0 =C2=A0 =C2=A0 dd if=3D${STAGING_DATADIR}/<u></u>syslinux/mbr.bin o=
f=3D$IMAGE conv=3Dnotrunc<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dd if=3D${HDDIMG} of=3D$IMAGE conv=3Dnotrunc se=
ek=3D1 bs=3D512<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 dd if=3D${ROOTFS} of=3D$IMAGE conv=3Dnotrunc se=
ek=3D$OFFSET bs=3D512<br>
<br>
diff --git a/meta/recipes-devtools/<u></u>syslinux/files/cross-build.<u></u=
>patch b/meta/recipes-devtools/<u></u>syslinux/files/cross-build.<u></u>pat=
ch<br>
deleted file mode 100644<br>
index 7bb6bda..0000000<br>
--- a/meta/recipes-devtools/<u></u>syslinux/files/cross-build.<u></u>patch<=
br>
+++ /dev/null<br>
@@ -1,71 +0,0 @@<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Use ?=3D for Makefile variables to use poky environment variables.<br>
-Original method to sed s/CC =3D/CC ?=3D/ is not applicable anymore<br>
-because of the Makefile changes.<br>
-<br>
-against 3.86<br>
-<br>
-06/28/2010 - qhe<br>
-<br>
-also AUXDIR stays in $(LIBDIR)/syslinux rather than $(DATADIR)/syslinux<br=
>
-<br>
-07/08/2010 - qhe<br>
-<br>
-updated for 4.03<br>
-<br>
-11/16/2010 - Qing He &lt;<a href=3D"mailto:qing.he@intel.com" target=3D"_b=
lank">qing.he@intel.com</a>&gt;<br>
-<br>
----<br>
-diff --git a/MCONFIG b/MCONFIG<br>
-index e9c16d3..4d49f33 100644<br>
---- a/MCONFIG<br>
-+++ b/MCONFIG<br>
-@@ -18,13 +18,13 @@<br>
- MAKEFLAGS +=3D -r<br>
- MAKE =C2=A0 =C2=A0 =C2=A0+=3D -r<br>
-<br>
--BINDIR =C2=A0 =3D /usr/bin<br>
--SBINDIR =C2=A0=3D /sbin<br>
--LIBDIR =C2=A0 =3D /usr/lib<br>
--DATADIR =C2=A0=3D /usr/share<br>
--AUXDIR =C2=A0 =3D $(DATADIR)/syslinux<br>
--MANDIR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D /usr/man<br>
--INCDIR =C2=A0 =3D /usr/include<br>
-+BINDIR =C2=A0 ?=3D /usr/bin<br>
-+SBINDIR =C2=A0?=3D /sbin<br>
-+LIBDIR =C2=A0 ?=3D /usr/lib<br>
-+DATADIR =C2=A0?=3D /usr/share<br>
-+AUXDIR =C2=A0 =3D $(LIBDIR)/syslinux<br>
-+MANDIR =C2=A0 =C2=A0 =C2=A0 =C2=A0 ?=3D /usr/man<br>
-+INCDIR =C2=A0 ?=3D /usr/include<br>
- TFTPBOOT =3D /tftpboot<br>
- COM32DIR =3D $(AUXDIR)/com32<br>
-<br>
-@@ -38,18 +38,18 @@ PERL =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D perl<br>
-<br>
- CHMOD =C2=A0=3D chmod<br>
-<br>
--CC =C2=A0 =C2=A0 =3D gcc<br>
-+CC =C2=A0 =C2=A0 ?=3D gcc<br>
- gcc_ok =C2=A0 =3D $(shell tmpf=3Dgcc_ok.$$$$.tmp; \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if $(CC) $(=
GCCOPT) $(1) -c $(topdir)/dummy.c \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 -o $$tmpf 2&gt;/dev/null ; \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0then echo &=
#39;$(1)&#39;; else echo &#39;$(2)&#39;; fi; \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rm -f $$tmp=
f)<br>
-<br>
--LD =C2=A0 =C2=A0 =3D ld<br>
--OBJDUMP =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D objdump<br>
--OBJCOPY =C2=A0=3D objcopy<br>
--AR =C2=A0 =C2=A0 =C2=A0 =3D ar<br>
--NM =C2=A0 =C2=A0 =C2=A0 =3D nm<br>
--RANLIB =C2=A0 =3D ranlib<br>
-+LD =C2=A0 =C2=A0 ?=3D ld<br>
-+OBJDUMP =C2=A0 =C2=A0 =C2=A0 =C2=A0?=3D objdump<br>
-+OBJCOPY =C2=A0?=3D objcopy<br>
-+AR =C2=A0 =C2=A0 =C2=A0 ?=3D ar<br>
-+NM =C2=A0 =C2=A0 =C2=A0 ?=3D nm<br>
-+RANLIB =C2=A0 ?=3D ranlib<br>
- GZIPPROG =3D gzip<br>
- PNGTOPNM =3D pngtopnm<br>
- MCOPY =C2=A0 =C2=A0=3D mcopy<br>
diff --git a/meta/recipes-devtools/<u></u>syslinux/files/libinstaller-<u></=
u>Avoid-using-linux-ext2_fs.h.<u></u>patch b/meta/recipes-devtools/<u></u>s=
yslinux/files/libinstaller-<u></u>Avoid-using-linux-ext2_fs.h.<u></u>patch<=
br>

deleted file mode 100644<br>
index 77d7a5d..0000000<br>
--- a/meta/recipes-devtools/<u></u>syslinux/files/libinstaller-<u></u>Avoid=
-using-linux-ext2_fs.h.<u></u>patch<br>
+++ /dev/null<br>
@@ -1,975 +0,0 @@<br>
-From a1006762fa6f98750bb77d76dd992c<u></u>b8ea9f9c99 Mon Sep 17 00:00:00 2=
001<br>
-Message-Id: &lt;<a href=3D"mailto:a1006762fa6f98750bb77d76dd992cb8ea9f9c99=
.1333550572.git.dvhart@linux.intel.com" target=3D"_blank">a1006762fa6f98750=
bb77d76dd992<u></u>cb8ea9f9c99.1333550572.git.<u></u>dvhart@linux.intel.com=
</a>&gt;<br>

-From: &quot;H. Peter Anvin&quot; &lt;<a href=3D"mailto:hpa@zytor.com" targ=
et=3D"_blank">hpa@zytor.com</a>&gt;<br>
-Date: Mon, 26 Mar 2012 22:51:09 -0700<br>
-Subject: [PATCH] libinstaller: Avoid using &lt;linux/ext2_fs.h&gt;<br>
-<br>
-Don&#39;t use &lt;linux/ext2_fs.h&gt; if we can avoid it.<br>
-<br>
-Upstream-Status: Available in syslinux-4.06-pre3<br>
-<br>
-The ioctl constants have been globalized and moved to &lt;linux/fs.h&gt;.<=
br>
-Use a private copy of ext2_fs.h from e2fsprogs with the ioctl<br>
-constants removed for the data structures.<br>
-<br>
-Do at least attempt backward compatibility for old kernel headers, but<br>
-no real hope of proper operation there...<br>
-<br>
-Signed-off-by: H. Peter Anvin &lt;<a href=3D"mailto:hpa@zytor.com" target=
=3D"_blank">hpa@zytor.com</a>&gt;<br>
-<br>
-Massaged into 4.03.<br>
-<br>
-Integrated-by: Darren Hart &lt;<a href=3D"mailto:dvhart@linux.inte.com" ta=
rget=3D"_blank">dvhart@linux.inte.com</a>&gt;<br>
----<br>
- libinstaller/ext2fs/ext2_fs.h | =C2=A0856 ++++++++++++++++++++++++++++++<=
u></u>+++++++++++<br>
- libinstaller/linuxioctl.h =C2=A0 =C2=A0 | =C2=A0 29 ++-<br>
- libinstaller/syslxcom.c =C2=A0 =C2=A0 =C2=A0 | =C2=A0 12 +-<br>
- 3 files changed, 886 insertions(+), 11 deletions(-)<br>
- create mode 100644 libinstaller/ext2fs/ext2_fs.h<br>
-<br>
-Index: syslinux-4.03/libinstaller/<u></u>ext2fs/ext2_fs.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- /dev/null<br>
-+++ syslinux-4.03/libinstaller/<u></u>ext2fs/ext2_fs.h<br>
-@@ -0,0 +1,856 @@<br>
-+/*<br>
-+ * =C2=A0linux/include/linux/ext2_fs.h<br>
-+ *<br>
-+ * Copyright (C) 1992, 1993, 1994, 1995<br>
-+ * Remy Card (<a href=3D"mailto:card@masi.ibp.fr" target=3D"_blank">card@=
masi.ibp.fr</a>)<br>
-+ * Laboratoire MASI - Institut Blaise Pascal<br>
-+ * Universite Pierre et Marie Curie (Paris VI)<br>
-+ *<br>
-+ * =C2=A0from<br>
-+ *<br>
-+ * =C2=A0linux/include/linux/minix_fs.h<br>
-+ *<br>
-+ * =C2=A0Copyright (C) 1991, 1992 =C2=A0Linus Torvalds<br>
-+ */<br>
-+<br>
-+#ifndef _EXT2FS_EXT2_FS_H<br>
-+#define _EXT2FS_EXT2_FS_H<br>
-+<br>
-+#include &lt;linux/types.h&gt;<br>
-+<br>
-+/*<br>
-+ * The second extended filesystem constants/structures<br>
-+ */<br>
-+<br>
-+/*<br>
-+ * Define EXT2FS_DEBUG to produce debug messages<br>
-+ */<br>
-+#undef EXT2FS_DEBUG<br>
-+<br>
-+/*<br>
-+ * Define EXT2_PREALLOCATE to preallocate data blocks for expanding files=
<br>
-+ */<br>
-+#define EXT2_PREALLOCATE<br>
-+#define EXT2_DEFAULT_PREALLOC_BLOCKS =C2=A08<br>
-+<br>
-+/*<br>
-+ * The second extended file system version<br>
-+ */<br>
-+#define EXT2FS_DATE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;95/08/09&quo=
t;<br>
-+#define EXT2FS_VERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&quot;0.5b&quot;<br>
-+<br>
-+/*<br>
-+ * Special inode numbers<br>
-+ */<br>
-+#define EXT2_BAD_INO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1 =C2=A0 =C2=A0 =
=C2=A0/* Bad blocks inode */<br>
-+#define EXT2_ROOT_INO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 =C2=A0 =C2=A0 =
=C2=A0/* Root inode */<br>
-+#define EXT4_USR_QUOTA_INO =C2=A0 =C2=A0 3 =C2=A0 =C2=A0 =C2=A0/* User qu=
ota inode */<br>
-+#define EXT4_GRP_QUOTA_INO =C2=A0 =C2=A0 4 =C2=A0 =C2=A0 =C2=A0/* Group q=
uota inode */<br>
-+#define EXT2_BOOT_LOADER_INO =C2=A0 5 =C2=A0 =C2=A0 =C2=A0/* Boot loader =
inode */<br>
-+#define EXT2_UNDEL_DIR_INO =C2=A0 =C2=A0 6 =C2=A0 =C2=A0 =C2=A0/* Undelet=
e directory inode */<br>
-+#define EXT2_RESIZE_INO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A07 =C2=A0 =C2=A0 =C2=A0/* Reserved group descriptors inode */<br>
-+#define EXT2_JOURNAL_INO =C2=A0 =C2=A0 =C2=A0 8 =C2=A0 =C2=A0 =C2=A0/* Jo=
urnal inode */<br>
-+#define EXT2_EXCLUDE_INO =C2=A0 =C2=A0 =C2=A0 9 =C2=A0 =C2=A0 =C2=A0/* Th=
e &quot;exclude&quot; inode, for snapshots */<br>
-+#define EXT4_REPLICA_INO =C2=A0 =C2=A0 =C2=A010 =C2=A0 =C2=A0 =C2=A0/* Us=
ed by non-upstream feature */<br>
-+<br>
-+/* First non-reserved inode for old ext2 filesystems */<br>
-+#define EXT2_GOOD_OLD_FIRST_INO =C2=A0 =C2=A0 =C2=A0 11<br>
-+<br>
-+/*<br>
-+ * The second extended file system magic number<br>
-+ */<br>
-+#define EXT2_SUPER_MAGIC =C2=A0 =C2=A0 =C2=A00xEF53<br>
-+<br>
-+#ifdef __KERNEL__<br>
-+#define EXT2_SB(sb) =C2=A0 (&amp;((sb)-&gt;u.ext2_sb))<br>
-+#else<br>
-+/* Assume that user mode programs are passing in an ext2fs superblock, no=
t<br>
-+ * a kernel struct super_block. =C2=A0This will allow us to call the feat=
ure-test<br>
-+ * macros from user land. */<br>
-+#define EXT2_SB(sb) =C2=A0 (sb)<br>
-+#endif<br>
-+<br>
-+/*<br>
-+ * Maximal count of links to a file<br>
-+ */<br>
-+#define EXT2_LINK_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 65000<br>
-+<br>
-+/*<br>
-+ * Macro-instructions used to manage several block sizes<br>
-+ */<br>
-+#define EXT2_MIN_BLOCK_LOG_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 10 =C2=A0 =C2=A0 =C2=A0/* 1024 */<br>
-+#define EXT2_MAX_BLOCK_LOG_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 16 =C2=A0 =C2=A0 =C2=A0/* 65536 */<br>
-+#define EXT2_MIN_BLOCK_SIZE =C2=A0 (1 &lt;&lt; EXT2_MIN_BLOCK_LOG_SIZE)<b=
r>
-+#define EXT2_MAX_BLOCK_SIZE =C2=A0 (1 &lt;&lt; EXT2_MAX_BLOCK_LOG_SIZE)<b=
r>
-+#ifdef __KERNEL__<br>
-+#define EXT2_BLOCK_SIZE(s) =C2=A0 =C2=A0((s)-&gt;s_blocksize)<br>
-+#define EXT2_BLOCK_SIZE_BITS(s) =C2=A0 =C2=A0 =C2=A0 ((s)-&gt;s_blocksize=
_bits)<br>
-+#define EXT2_ADDR_PER_BLOCK_BITS(s) =C2=A0 (EXT2_SB(s)-&gt;addr_per_block=
_<u></u>bits)<br>
-+#define EXT2_INODE_SIZE(s) =C2=A0 =C2=A0(EXT2_SB(s)-&gt;s_inode_size)<br>
-+#define EXT2_FIRST_INO(s) =C2=A0 =C2=A0 (EXT2_SB(s)-&gt;s_first_ino)<br>
-+#else<br>
-+#define EXT2_BLOCK_SIZE(s) =C2=A0 =C2=A0(EXT2_MIN_BLOCK_SIZE &lt;&lt; (s)=
-&gt;s_log_block_size)<br>
-+#define EXT2_BLOCK_SIZE_BITS(s) =C2=A0 =C2=A0 =C2=A0 ((s)-&gt;s_log_block=
_size + 10)<br>
-+#define EXT2_INODE_SIZE(s) =C2=A0 =C2=A0(((s)-&gt;s_rev_level =3D=3D EXT2=
_GOOD_OLD_REV) ? \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_GOOD_OLD_INODE_SIZE : (s)-&gt;s_ino=
de_size)<br>
-+#define EXT2_FIRST_INO(s) =C2=A0 =C2=A0 (((s)-&gt;s_rev_level =3D=3D EXT2=
_GOOD_OLD_REV) ? \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_GOOD_OLD_FIRST_INO : (s)-&gt;s_firs=
t_ino)<br>
-+#endif<br>
-+#define EXT2_ADDR_PER_BLOCK(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0(EXT2_BLOCK_SIZ=
E(s) / sizeof(__u32))<br>
-+<br>
-+/*<br>
-+ * Macro-instructions used to manage allocation clusters<br>
-+ */<br>
-+#define EXT2_MIN_CLUSTER_LOG_SIZE =C2=A0 =C2=A0 EXT2_MIN_BLOCK_LOG_SIZE<b=
r>
-+#define EXT2_MAX_CLUSTER_LOG_SIZE =C2=A0 =C2=A0 29 =C2=A0 =C2=A0 =C2=A0/*=
 512MB =C2=A0*/<br>
-+#define EXT2_MIN_CLUSTER_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_MIN_BLOCK_=
SIZE<br>
-+#define EXT2_MAX_CLUSTER_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 (1 &lt;&lt; EXT=
2_MAX_CLUSTER_LOG_SIZE)<br>
-+#define EXT2_CLUSTER_SIZE(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(EXT2_MIN_=
BLOCK_SIZE &lt;&lt; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0(s)-&gt;s_log_cluster_size)<br>
-+#define EXT2_CLUSTER_SIZE_BITS(s) =C2=A0 =C2=A0 ((s)-&gt;s_log_cluster_si=
ze + 10)<br>
-+<br>
-+/*<br>
-+ * Macro-instructions used to manage fragments<br>
-+ *<br>
-+ * Note: for backwards compatibility only, for the dump program.<br>
-+ * Ext2/3/4 will never support fragments....<br>
-+ */<br>
-+#define EXT2_MIN_FRAG_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0EXT2_MIN_BLOCK_SIZE<br>
-+#define EXT2_MAX_FRAG_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0EXT2_MAX_BLOCK_SIZE<br>
-+#define EXT2_MIN_FRAG_LOG_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXT2_MIN=
_BLOCK_LOG_SIZE<br>
-+#define EXT2_FRAG_SIZE(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_=
BLOCK_SIZE(s)<br>
-+#define EXT2_FRAGS_PER_BLOCK(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 1<br>
-+<br>
-+/*<br>
-+ * ACL structures<br>
-+ */<br>
-+struct ext2_acl_header =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Header of Access Con=
trol Lists */<br>
-+{<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 aclh_size;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 aclh_file_count;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 aclh_acle_count;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 aclh_first_acle;<br>
-+};<br>
-+<br>
-+struct ext2_acl_entry /* Access Control List Entry */<br>
-+{<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 acle_size;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 acle_perms; =C2=A0 =C2=A0 /* Access per=
missions */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 acle_type; =C2=A0 =C2=A0 =C2=A0/* Type =
of entry */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 acle_tag; =C2=A0 =C2=A0 =C2=A0 /* User =
or group identity */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 acle_pad1;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 acle_next; =C2=A0 =C2=A0 =C2=A0/* Point=
er on next entry for the */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* same inode=
 or on next free entry */<br>
-+};<br>
-+<br>
-+/*<br>
-+ * Structure of a blocks group descriptor<br>
-+ */<br>
-+struct ext2_group_desc<br>
-+{<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_block_bitmap; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Blocks bitmap block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_inode_bitmap; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Inodes bitmap block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_inode_table; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Inodes table block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_free_blocks_count; =C2=A0 /* Free bl=
ocks count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_free_inodes_count; =C2=A0 /* Free in=
odes count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_used_dirs_count; =C2=A0 =C2=A0 /* Di=
rectories count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_flags;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_exclude_bitmap_lo; =C2=A0 /* Exclude=
 bitmap for snapshots */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_block_bitmap_csum_lo;/* crc32c(s_uui=
d+grp_num+bitmap) LSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_inode_bitmap_csum_lo;/* crc32c(s_uui=
d+grp_num+bitmap) LSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_itable_unused; =C2=A0 =C2=A0 =C2=A0 =
/* Unused inodes count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_checksum; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* crc16(s_uuid+grouo_num+group_<u></u>desc)*/<br>
-+};<br>
-+<br>
-+/*<br>
-+ * Structure of a blocks group descriptor<br>
-+ */<br>
-+struct ext4_group_desc<br>
-+{<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_block_bitmap; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Blocks bitmap block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_inode_bitmap; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Inodes bitmap block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_inode_table; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Inodes table block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_free_blocks_count; =C2=A0 /* Free bl=
ocks count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_free_inodes_count; =C2=A0 /* Free in=
odes count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_used_dirs_count; =C2=A0 =C2=A0 /* Di=
rectories count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_flags; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* EXT4_BG_flags (INODE_UNINIT, etc) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_exclude_bitmap_lo; =C2=A0 /* Exclude=
 bitmap for snapshots */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_block_bitmap_csum_lo;/* crc32c(s_uui=
d+grp_num+bitmap) LSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_inode_bitmap_csum_lo;/* crc32c(s_uui=
d+grp_num+bitmap) LSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_itable_unused; =C2=A0 =C2=A0 =C2=A0 =
/* Unused inodes count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_checksum; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* crc16(sb_uuid+group+desc) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_block_bitmap_hi; =C2=A0 =C2=A0 /* Bl=
ocks bitmap block MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_inode_bitmap_hi; =C2=A0 =C2=A0 /* In=
odes bitmap block MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_inode_table_hi; =C2=A0 =C2=A0 =C2=A0=
/* Inodes table block MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_free_blocks_count_hi;/* Free blocks =
count MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_free_inodes_count_hi;/* Free inodes =
count MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_used_dirs_count_hi; =C2=A0/* Directo=
ries count MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_itable_unused_hi; =C2=A0 =C2=A0/* Un=
used inodes count MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_exclude_bitmap_hi; =C2=A0 /* Exclude=
 bitmap block MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_block_bitmap_csum_hi;/* crc32c(s_uui=
d+grp_num+bitmap) MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 bg_inode_bitmap_csum_hi;/* crc32c(s_uui=
d+grp_num+bitmap) MSB */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 bg_reserved;<br>
-+};<br>
-+<br>
-+#define EXT2_BG_INODE_UNINIT =C2=A00x0001 /* Inode table/bitmap not initi=
alized */<br>
-+#define EXT2_BG_BLOCK_UNINIT =C2=A00x0002 /* Block bitmap not initialized=
 */<br>
-+#define EXT2_BG_INODE_ZEROED =C2=A00x0004 /* On-disk itable initialized t=
o zero */<br>
-+<br>
-+/*<br>
-+ * Data structures used by the directory indexing feature<br>
-+ *<br>
-+ * Note: all of the multibyte integer fields are little endian.<br>
-+ */<br>
-+<br>
-+/*<br>
-+ * Note: dx_root_info is laid out so that if it should somehow get<br>
-+ * overlaid by a dirent the two low bits of the hash version will be<br>
-+ * zero. =C2=A0Therefore, the hash version mod 4 should never be 0.<br>
-+ * Sincerely, the paranoia department.<br>
-+ */<br>
-+struct ext2_dx_root_info {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 reserved_zero;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 hash_version; /* 0 now, 1 at release */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 info_length; /* 8 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 indirect_levels;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 unused_flags;<br>
-+};<br>
-+<br>
-+#define EXT2_HASH_LEGACY =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0<br>
-+#define EXT2_HASH_HALF_MD4 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
-+#define EXT2_HASH_TEA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 2<br>
-+#define EXT2_HASH_LEGACY_UNSIGNED =C2=A0 =C2=A0 3 /* reserved for userspa=
ce lib */<br>
-+#define EXT2_HASH_HALF_MD4_UNSIGNED =C2=A0 4 /* reserved for userspace li=
b */<br>
-+#define EXT2_HASH_TEA_UNSIGNED =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A05 /* reserved for userspace lib */<br>
-+<br>
-+#define EXT2_HASH_FLAG_INCOMPAT =C2=A0 =C2=A0 =C2=A0 0x1<br>
-+<br>
-+struct ext2_dx_entry {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 hash;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 block;<br>
-+};<br>
-+<br>
-+struct ext2_dx_countlimit {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 limit;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 count;<br>
-+};<br>
-+<br>
-+<br>
-+/*<br>
-+ * Macro-instructions used to manage group descriptors<br>
-+ */<br>
-+#define EXT2_MIN_DESC_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 32<b=
r>
-+#define EXT2_MIN_DESC_SIZE_64BIT =C2=A0 =C2=A0 =C2=A0 64<br>
-+#define EXT2_MAX_DESC_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2=
_MIN_BLOCK_SIZE<br>
-+#define EXT2_DESC_SIZE(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+ =C2=A0 =C2=A0 =C2=A0 ((EXT2_SB(s)-&gt;s_feature_<u></u>incompat &amp; EX=
T4_FEATURE_INCOMPAT_64BIT) ? \<br>
-+ =C2=A0 =C2=A0 =C2=A0(s)-&gt;s_desc_size : EXT2_MIN_DESC_SIZE)<br>
-+<br>
-+#define EXT2_BLOCKS_PER_GROUP(s) =C2=A0 =C2=A0 =C2=A0(EXT2_SB(s)-&gt;s_bl=
ocks_per_<u></u>group)<br>
-+#define EXT2_INODES_PER_GROUP(s) =C2=A0 =C2=A0 =C2=A0(EXT2_SB(s)-&gt;s_in=
odes_per_<u></u>group)<br>
-+#define EXT2_CLUSTERS_PER_GROUP(s) =C2=A0 =C2=A0(EXT2_SB(s)-&gt;s_cluster=
s_per_<u></u>group)<br>
-+#define EXT2_INODES_PER_BLOCK(s) =C2=A0 =C2=A0 =C2=A0(EXT2_BLOCK_SIZE(s)/=
EXT2_<u></u>INODE_SIZE(s))<br>
-+/* limits imposed by 16-bit value gd_free_{blocks,inode}_count */<br>
-+#define EXT2_MAX_BLOCKS_PER_GROUP(s) =C2=A0((((unsigned) 1 &lt;&lt; 16) -=
 8) * =C2=A0 \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (EXT2_CLUSTE=
R_SIZE(s) / \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXT2_B=
LOCK_SIZE(s)))<br>
-+#define EXT2_MAX_CLUSTERS_PER_GROUP(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0(((unsi=
gned) 1 &lt;&lt; 16) - 8)<br>
-+#define EXT2_MAX_INODES_PER_GROUP(s) =C2=A0(((unsigned) 1 &lt;&lt; 16) - =
\<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_INODES_=
PER_BLOCK(s))<br>
-+#ifdef __KERNEL__<br>
-+#define EXT2_DESC_PER_BLOCK(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(EXT2_SB(s)-&gt;s_desc_per_block)<br>
-+#define EXT2_DESC_PER_BLOCK_BITS(s) =C2=A0 (EXT2_SB(s)-&gt;s_desc_per_blo=
ck_<u></u>bits)<br>
-+#else<br>
-+#define EXT2_DESC_PER_BLOCK(s) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0(EXT2_BLOCK_SIZE(s) / EXT2_DESC_SIZE(s))<br>
-+#endif<br>
-+<br>
-+/*<br>
-+ * Constants relative to the data blocks<br>
-+ */<br>
-+#define EXT2_NDIR_BLOCKS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
12<br>
-+#define EXT2_IND_BLOCK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0EXT2_NDIR_BLOCKS<br>
-+#define EXT2_DIND_BLOCK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (EXT2_IND_BLOCK + 1)<br>
-+#define EXT2_TIND_BLOCK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 (EXT2_DIND_BLOCK + 1)<br>
-+#define EXT2_N_BLOCKS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 (EXT2_TIND_BLOCK + 1)<br>
-+<br>
-+/*<br>
-+ * Inode flags<br>
-+ */<br>
-+#define EXT2_SECRM_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00000001 /* Secure deletion */<br>
-+#define EXT2_UNRM_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x00000002 /* Undelete */<br>
-+#define EXT2_COMPR_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00000004 /* Compress file */<br>
-+#define EXT2_SYNC_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A00x00000008 /* Synchronous updates */<br>
-+#define EXT2_IMMUTABLE_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x000=
00010 /* Immutable file */<br>
-+#define EXT2_APPEND_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000020 /* writes to file may only app=
end */<br>
-+#define EXT2_NODUMP_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000040 /* do not dump file */<br>
-+#define EXT2_NOATIME_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000080 /* do not update atime */<br>
-+/* Reserved for compression usage... */<br>
-+#define EXT2_DIRTY_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00000100<br>
-+#define EXT2_COMPRBLK_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x00000200 /* One or more compressed clusters */<br>
-+#define EXT2_NOCOMPR_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x00000400 /* Access raw compressed data */<br>
-+#define EXT2_ECOMPR_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00000800 /* Compression error */<br>
-+/* End compression flags --- maybe not all used */<br>
-+#define EXT2_BTREE_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00001000 /* btree format dir */<br>
-+#define EXT2_INDEX_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x00001000 /* hash-indexed directory */<br>
-+#define EXT2_IMAGIC_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00002000<br>
-+#define EXT3_JOURNAL_DATA_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00004000=
 /* file data should be journaled */<br>
-+#define EXT2_NOTAIL_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00008000 /* file tail should not be mer=
ged */<br>
-+#define EXT2_DIRSYNC_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x00010000 /* Synchronous directory modifications */<br>
-+#define EXT2_TOPDIR_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x00020000 /* Top of directory hierarchie=
s*/<br>
-+#define EXT4_HUGE_FILE_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x00040000 /* Set to each huge file */<br>
-+#define EXT4_EXTENTS_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x00080000 /* Inode uses extents */<br>
-+#define EXT4_EA_INODE_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x00200000 /* Inode used for large EA */<br>
-+/* EXT4_EOFBLOCKS_FL 0x00400000 was here */<br>
-+#define EXT4_SNAPFILE_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x01000000 =C2=A0/* Inode is a snapshot */<br>
-+#define EXT4_SNAPFILE_DELETED_FL =C2=A0 =C2=A0 =C2=A00x04000000 =C2=A0/* =
Snapshot is being deleted */<br>
-+#define EXT4_SNAPFILE_SHRUNK_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x08000000 =C2=A0/* Snapshot shrink has completed */<br>
-+#define EXT2_RESERVED_FL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x80000000 /* reserved for ext2 lib */<br>
-+<br>
-+#define EXT2_FL_USER_VISIBLE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x004BDFFF=
 /* User visible flags */<br>
-+#define EXT2_FL_USER_MODIFIABLE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x004B80FF /* User modifiable flags */<br>
-+<br>
-+/*<br>
-+ * ioctl commands<br>
-+ */<br>
-+<br>
-+/* Used for online resize */<br>
-+struct ext2_new_group_input {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 group; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Group number for this data */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 block_bitmap; =C2=A0 =C2=A0 /* Absolute block =
number of block bitmap */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 inode_bitmap; =C2=A0 =C2=A0 /* Absolute block =
number of inode bitmap */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 inode_table; =C2=A0 =C2=A0 =C2=A0/* Absolute b=
lock number of inode table start */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 blocks_count; =C2=A0 =C2=A0 /* Total number of=
 blocks in this group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 reserved_blocks; =C2=A0/* Number of reserved b=
locks in this group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 unused; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Number of reserved GDT blocks in group */<br>
-+};<br>
-+<br>
-+struct ext4_new_group_input {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 group; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Group number for this data */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 block_bitmap; =C2=A0 =C2=A0 /* Absolute block =
number of block bitmap */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 inode_bitmap; =C2=A0 =C2=A0 /* Absolute block =
number of inode bitmap */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 inode_table; =C2=A0 =C2=A0 =C2=A0/* Absolute b=
lock number of inode table start */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 blocks_count; =C2=A0 =C2=A0 /* Total number of=
 blocks in this group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 reserved_blocks; =C2=A0/* Number of reserved b=
locks in this group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 unused;<br>
-+};<br>
-+<br>
-+#ifdef __GNU__ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Needed for the Hurd */<br>
-+#define _IOT_ext2_new_group_input _IOT (_IOTS(__u32), 5, _IOTS(__u16), 2,=
 0, 0)<br>
-+#endif<br>
-+<br>
-+#define EXT2_IOC_GETFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOR(=
&#39;f&#39;, 1, long)<br>
-+#define EXT2_IOC_SETFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOW(=
&#39;f&#39;, 2, long)<br>
-+#define EXT2_IOC_GETVERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOR(&#39;=
v&#39;, 1, long)<br>
-+#define EXT2_IOC_SETVERSION =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOW(&#39;=
v&#39;, 2, long)<br>
-+#define EXT2_IOC_GETVERSION_NEW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 _IOR(&#39;f&#39;, 3, long)<br>
-+#define EXT2_IOC_SETVERSION_NEW =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 _IOW(&#39;f&#39;, 4, long)<br>
-+#define EXT2_IOC_GROUP_EXTEND =C2=A0 =C2=A0 =C2=A0 =C2=A0 _IOW(&#39;f&#39=
;, 7, unsigned long)<br>
-+#define EXT2_IOC_GROUP_ADD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(=
&#39;f&#39;, 8,struct ext2_new_group_input)<br>
-+#define EXT4_IOC_GROUP_ADD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(=
&#39;f&#39;, 8,struct ext4_new_group_input)<br>
-+#define EXT4_IOC_RESIZE_FS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0_IOW(=
&#39;f&#39;, 16, __u64)<br>
-+<br>
-+/*<br>
-+ * Structure of an inode on the disk<br>
-+ */<br>
-+struct ext2_inode {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_mode; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
File mode */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_uid; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Low 16 bits of Owner Uid */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_size; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Size in bytes */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_atime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Access time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_ctime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Inode change time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_mtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Modification time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_dtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Deletion Time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_gid; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Low 16 bits of Group Id */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_links_count; =C2=A0/* Links count */<=
br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_blocks; =C2=A0 =C2=A0 =C2=A0 /* Block=
s count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_flags; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
File flags */<br>
-+ =C2=A0 =C2=A0 =C2=A0union {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u32 =C2=A0 l_i_version; /* was l_i_reserved1 */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} linux1;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u32 =C2=A0h_i_translator;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} hurd1;<br>
-+ =C2=A0 =C2=A0 =C2=A0} osd1; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* OS dependent 1 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_block[EXT2_N_BLOCKS];/* Pointers to b=
locks */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_generation; =C2=A0 /* File version (f=
or NFS) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_file_acl; =C2=A0 =C2=A0 /* File ACL *=
/<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_size_high; =C2=A0 =C2=A0/* Formerly i=
_dir_acl, directory ACL */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_faddr; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Fragment address */<br>
-+ =C2=A0 =C2=A0 =C2=A0union {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_blocks_hi;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_file_acl_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_uid_high; =C2=A0 /* these 2 fields =C2=A0 =C2=A0*/<b=
r>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_gid_high; =C2=A0 /* were reserved2[0] */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_checksum_lo; /* crc32c(uuid+inum+inode) */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_reserved;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} linux2;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u8 =C2=A0 =C2=A0h_i_frag; =C2=A0 =C2=A0 =C2=A0 /* Fragment number *=
/<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u8 =C2=A0 =C2=A0h_i_fsize; =C2=A0 =C2=A0 =C2=A0/* Fragment size */<=
br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 h_i_mode_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 h_i_uid_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 h_i_gid_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u32 =C2=A0 h_i_author;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} hurd2;<br>
-+ =C2=A0 =C2=A0 =C2=A0} osd2; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* OS dependent 2 */<br>
-+};<br>
-+<br>
-+/*<br>
-+ * Permanent part of an large inode on the disk<br>
-+ */<br>
-+struct ext2_inode_large {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_mode; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
File mode */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_uid; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Low 16 bits of Owner Uid */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_size; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* =
Size in bytes */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_atime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Access time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_ctime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Inode Change time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_mtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Modification time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_dtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Deletion Time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_gid; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0/* Low 16 bits of Group Id */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_links_count; =C2=A0/* Links count */<=
br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_blocks; =C2=A0 =C2=A0 =C2=A0 /* Block=
s count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_flags; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
File flags */<br>
-+ =C2=A0 =C2=A0 =C2=A0union {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u32 =C2=A0 l_i_version; /* was l_i_reserved1 */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} linux1;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u32 =C2=A0h_i_translator;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} hurd1;<br>
-+ =C2=A0 =C2=A0 =C2=A0} osd1; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* OS dependent 1 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_block[EXT2_N_BLOCKS];/* Pointers to b=
locks */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_generation; =C2=A0 /* File version (f=
or NFS) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_file_acl; =C2=A0 =C2=A0 /* File ACL *=
/<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_size_high; =C2=A0 =C2=A0/* Formerly i=
_dir_acl, directory ACL */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_faddr; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* =
Fragment address */<br>
-+ =C2=A0 =C2=A0 =C2=A0union {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_blocks_hi;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_file_acl_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_uid_high; =C2=A0 /* these 2 fields =C2=A0 =C2=A0*/<b=
r>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_gid_high; =C2=A0 /* were reserved2[0] */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_checksum_lo; /* crc32c(uuid+inum+inode) */<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 l_i_reserved;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} linux2;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u8 =C2=A0 =C2=A0h_i_frag; =C2=A0 =C2=A0 =C2=A0 /* Fragment number *=
/<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u8 =C2=A0 =C2=A0h_i_fsize; =C2=A0 =C2=A0 =C2=A0/* Fragment size */<=
br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 h_i_mode_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 h_i_uid_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u16 =C2=A0 h_i_gid_high;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0__u32 =C2=A0 h_i_author;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0} hurd2;<br>
-+ =C2=A0 =C2=A0 =C2=A0} osd2; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* OS dependent 2 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_extra_isize;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 i_checksum_hi; =C2=A0/* crc32c(uuid+inu=
m+inode) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_ctime_extra; =C2=A0/* extra Change ti=
me (nsec &lt;&lt; 2 | epoch) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_mtime_extra; =C2=A0/* extra Modificat=
ion time (nsec &lt;&lt; 2 | epoch) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_atime_extra; =C2=A0/* extra Access ti=
me (nsec &lt;&lt; 2 | epoch) */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_crtime; =C2=A0 =C2=A0 =C2=A0 /* File =
creation time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_crtime_extra; /* extra File creation =
time (nsec &lt;&lt; 2 | epoch)*/<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 i_version_hi; =C2=A0 /* high 32 bits fo=
r 64-bit version */<br>
-+};<br>
-+<br>
-+#define i_dir_acl =C2=A0 =C2=A0 i_size_high<br>
-+<br>
-+#if defined(__KERNEL__) || defined(__linux__)<br>
-+#define i_reserved1 =C2=A0 osd1.linux1.l_i_reserved1<br>
-+#define i_frag =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0osd=
2.linux2.l_i_frag<br>
-+#define i_fsize =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 osd2.lin=
ux2.l_i_fsize<br>
-+#define i_uid_low =C2=A0 =C2=A0 i_uid<br>
-+#define i_gid_low =C2=A0 =C2=A0 i_gid<br>
-+#define i_uid_high =C2=A0 =C2=A0osd2.linux2.l_i_uid_high<br>
-+#define i_gid_high =C2=A0 =C2=A0osd2.linux2.l_i_gid_high<br>
-+#else<br>
-+#if defined(__GNU__)<br>
-+<br>
-+#define i_translator =C2=A0osd1.hurd1.h_i_translator<br>
-+#define i_frag =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0osd=
2.hurd2.h_i_frag;<br>
-+#define i_fsize =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 osd2.hur=
d2.h_i_fsize;<br>
-+#define i_uid_high =C2=A0 =C2=A0osd2.hurd2.h_i_uid_high<br>
-+#define i_gid_high =C2=A0 =C2=A0osd2.hurd2.h_i_gid_high<br>
-+#define i_author =C2=A0 =C2=A0 =C2=A0osd2.hurd2.h_i_author<br>
-+<br>
-+#endif =C2=A0/* __GNU__ */<br>
-+#endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* defined(__KERNEL__) || defined(__lin=
ux__) */<br>
-+<br>
-+#define inode_uid(inode) =C2=A0 =C2=A0 =C2=A0((inode).i_uid | (inode).osd=
2.linux2.l_i_uid_<u></u>high &lt;&lt; 16)<br>
-+#define inode_gid(inode) =C2=A0 =C2=A0 =C2=A0((inode).i_gid | (inode).osd=
2.linux2.l_i_gid_<u></u>high &lt;&lt; 16)<br>
-+#define ext2fs_set_i_uid_high(inode,x) ((inode).osd2.linux2.l_i_uid_<u></=
u>high =3D (x))<br>
-+#define ext2fs_set_i_gid_high(inode,x) ((inode).osd2.linux2.l_i_gid_<u></=
u>high =3D (x))<br>
-+<br>
-+/*<br>
-+ * File system states<br>
-+ */<br>
-+#define EXT2_VALID_FS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x0001 =C2=A0/* Unmounted cleanly */<br>
-+#define EXT2_ERROR_FS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 0x0002 =C2=A0/* Errors detected */<br>
-+#define EXT3_ORPHAN_FS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0004 =C2=A0/* Orphans being recovered *=
/<br>
-+<br>
-+/*<br>
-+ * Misc. filesystem flags<br>
-+ */<br>
-+#define EXT2_FLAGS_SIGNED_HASH =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0001 =C2=A0/* Signed dirhash in use */<br>
-+#define EXT2_FLAGS_UNSIGNED_HASH =C2=A0 =C2=A0 =C2=A00x0002 =C2=A0/* Unsi=
gned dirhash in use */<br>
-+#define EXT2_FLAGS_TEST_FILESYS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x0004 =C2=A0/* OK for use on development code */<br>
-+#define EXT2_FLAGS_IS_SNAPSHOT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0010 =C2=A0/* This is a snapshot image */<br>
-+#define EXT2_FLAGS_FIX_SNAPSHOT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x0020 =C2=A0/* Snapshot inodes corrupted */<br>
-+#define EXT2_FLAGS_FIX_EXCLUDE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0040 =C2=A0/* Exclude bitmaps corrupted */<br>
-+<br>
-+/*<br>
-+ * Mount flags<br>
-+ */<br>
-+#define EXT2_MOUNT_CHECK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x0001 =C2=A0/* Do mount-time checks */<br>
-+#define EXT2_MOUNT_GRPID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x0004 =C2=A0/* Create files with directory&#39;s group */<br>
-+#define EXT2_MOUNT_DEBUG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
0x0008 =C2=A0/* Some debugging messages */<br>
-+#define EXT2_MOUNT_ERRORS_CONT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00x0010 =C2=A0/* Continue on errors */<br>
-+#define EXT2_MOUNT_ERRORS_RO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x0020 =C2=
=A0/* Remount fs ro on errors */<br>
-+#define EXT2_MOUNT_ERRORS_PANIC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 0x0040 =C2=A0/* Panic on errors */<br>
-+#define EXT2_MOUNT_MINIX_DF =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0080 =C2=
=A0/* Mimics the Minix statfs */<br>
-+#define EXT2_MOUNT_NO_UID32 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0200 =C2=
=A0/* Disable 32-bit UIDs */<br>
-+<br>
-+#define clear_opt(o, opt) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 o &am=
p;=3D ~EXT2_MOUNT_##opt<br>
-+#define set_opt(o, opt) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 o |=3D EXT2_MOUNT_##opt<br>
-+#define test_opt(sb, opt) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (EXT2=
_SB(sb)-&gt;s_mount_opt &amp; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_MOUNT_#=
#opt)<br>
-+/*<br>
-+ * Maximal mount counts between two filesystem checks<br>
-+ */<br>
-+#define EXT2_DFL_MAX_MNT_COUNT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A020 =C2=A0 =C2=A0 =C2=A0/* Allow 20 mounts */<br>
-+#define EXT2_DFL_CHECKINTERVAL =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A00 =C2=A0 =C2=A0 =C2=A0 /* Don&#39;t use interval check */<br>
-+<br>
-+/*<br>
-+ * Behaviour when detecting errors<br>
-+ */<br>
-+#define EXT2_ERRORS_CONTINUE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01 =C2=A0 =
=C2=A0 =C2=A0 /* Continue execution */<br>
-+#define EXT2_ERRORS_RO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02 =C2=A0 =C2=A0 =C2=A0 /* Remount fs read=
-only */<br>
-+#define EXT2_ERRORS_PANIC =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 3 =C2=
=A0 =C2=A0 =C2=A0 /* Panic */<br>
-+#define EXT2_ERRORS_DEFAULT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_ERROR=
S_CONTINUE<br>
-+<br>
-+#if (__GNUC__ &gt;=3D 4)<br>
-+#define ext4_offsetof(TYPE,MEMBER) __builtin_offsetof(TYPE,<u></u>MEMBER)=
<br>
-+#else<br>
-+#define ext4_offsetof(TYPE, MEMBER) ((size_t) &amp;((TYPE *)0)-&gt;MEMBER=
)<br>
-+#endif<br>
-+<br>
-+/*<br>
-+ * Structure of the super block<br>
-+ */<br>
-+struct ext2_super_block {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_inodes_count; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Inodes count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_blocks_count; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Blocks count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_r_blocks_count; =C2=A0 =C2=A0 =C2=A0 =
/* Reserved blocks count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_free_blocks_count; =C2=A0 =C2=A0/* Fr=
ee blocks count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_free_inodes_count; =C2=A0 =C2=A0/* Fr=
ee inodes count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_first_data_block; =C2=A0 =C2=A0 /* Fi=
rst Data Block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_log_block_size; =C2=A0 =C2=A0 =C2=A0 =
/* Block size */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_log_cluster_size; =C2=A0 =C2=A0 /* Al=
location cluster size */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_blocks_per_group; =C2=A0 =C2=A0 /* # =
Blocks per group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_clusters_per_group; =C2=A0 /* # Fragm=
ents per group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_inodes_per_group; =C2=A0 =C2=A0 /* # =
Inodes per group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_mtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Mount time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_wtime; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Write time */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_mnt_count; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Mount count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__s16 =C2=A0 s_max_mnt_count; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Maximal mount count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_magic; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Magic signature */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_state; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* File system state */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_errors; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* Behaviour when detecting errors */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_minor_rev_level; =C2=A0 =C2=A0 =C2=A0=
/* minor revision level */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_lastcheck; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* time of last check */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_checkinterval; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* max. time between checks */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_creator_os; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* OS */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_rev_level; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Revision level */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_def_resuid; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Default uid for reserved blocks */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_def_resgid; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* Default gid for reserved blocks */<br>
-+ =C2=A0 =C2=A0 =C2=A0/*<br>
-+ =C2=A0 =C2=A0 =C2=A0 * These fields are for EXT2_DYNAMIC_REV superblocks=
 only.<br>
-+ =C2=A0 =C2=A0 =C2=A0 *<br>
-+ =C2=A0 =C2=A0 =C2=A0 * Note: the difference between the compatible featu=
re set and<br>
-+ =C2=A0 =C2=A0 =C2=A0 * the incompatible feature set is that if there is =
a bit set<br>
-+ =C2=A0 =C2=A0 =C2=A0 * in the incompatible feature set that the kernel d=
oesn&#39;t<br>
-+ =C2=A0 =C2=A0 =C2=A0 * know about, it should refuse to mount the filesys=
tem.<br>
-+ =C2=A0 =C2=A0 =C2=A0 *<br>
-+ =C2=A0 =C2=A0 =C2=A0 * e2fsck&#39;s requirements are more strict; if it =
doesn&#39;t know<br>
-+ =C2=A0 =C2=A0 =C2=A0 * about a feature in either the compatible or incom=
patible<br>
-+ =C2=A0 =C2=A0 =C2=A0 * feature set, it must abort and not try to meddle =
with<br>
-+ =C2=A0 =C2=A0 =C2=A0 * things it doesn&#39;t understand...<br>
-+ =C2=A0 =C2=A0 =C2=A0 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_first_ino; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* First non-reserved inode */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_inode_size; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 /* size of inode structure */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_block_group_nr; =C2=A0 =C2=A0 =C2=A0 =
/* block group # of this superblock */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_feature_compat; =C2=A0 =C2=A0 =C2=A0 =
/* compatible feature set */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_feature_incompat; =C2=A0 =C2=A0 /* in=
compatible feature set */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_feature_ro_compat; =C2=A0 =C2=A0/* re=
adonly-compatible feature set */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_uuid[16]; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* 128-bit uuid for volume */<br>
-+ =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0s_volume_name[16]; =C2=A0 =C2=A0 =
=C2=A0/* volume name */<br>
-+ =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0s_last_mounted[64]; =C2=A0 =C2=A0 =
/* directory where last mounted */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_algorithm_usage_bitmap; /* For compre=
ssion */<br>
-+ =C2=A0 =C2=A0 =C2=A0/*<br>
-+ =C2=A0 =C2=A0 =C2=A0 * Performance hints. =C2=A0Directory preallocation =
should only<br>
-+ =C2=A0 =C2=A0 =C2=A0 * happen if the EXT2_FEATURE_COMPAT_DIR_<u></u>PREA=
LLOC flag is on.<br>
-+ =C2=A0 =C2=A0 =C2=A0 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_prealloc_blocks; =C2=A0 =C2=A0 =
=C2=A0/* Nr of blocks to try to preallocate*/<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_prealloc_dir_blocks; =C2=A0/* Nr=
 to preallocate for dirs */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_reserved_gdt_blocks; =C2=A0/* Per gro=
up table for online growth */<br>
-+ =C2=A0 =C2=A0 =C2=A0/*<br>
-+ =C2=A0 =C2=A0 =C2=A0 * Journaling support valid if EXT2_FEATURE_COMPAT_H=
AS_<u></u>JOURNAL set.<br>
-+ =C2=A0 =C2=A0 =C2=A0 */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_journal_uuid[16]; =C2=A0 =C2=A0 =
/* uuid of journal superblock */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_journal_inum; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* inode number of journal file */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_journal_dev; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* device number of journal file */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_last_orphan; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* start of list of inodes to delete */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_hash_seed[4]; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* HTREE hash seed */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_def_hash_version; =C2=A0 =C2=A0 =
/* Default hash version to use */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_jnl_backup_type; =C2=A0 =C2=A0 =
=C2=A0/* Default type of journal backup */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_desc_size; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Group desc. size: INCOMPAT_64BIT */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_default_mount_opts;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_first_meta_bg; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* First metablock group */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_mkfs_time; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* When the filesystem was created */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_jnl_blocks[17]; =C2=A0 =C2=A0 =C2=A0 =
/* Backup of the journal inode */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_blocks_count_hi; =C2=A0 =C2=A0 =C2=A0=
/* Blocks count high 32bits */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_r_blocks_count_hi; =C2=A0 =C2=A0/* Re=
served blocks count high 32 bits*/<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_free_blocks_hi; =C2=A0 =C2=A0 =C2=A0 =
/* Free blocks count */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_min_extra_isize; =C2=A0 =C2=A0 =C2=A0=
/* All inodes have at least # bytes */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_want_extra_isize; =C2=A0 =C2=A0 /* Ne=
w inodes should reserve # bytes */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_flags; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Miscellaneous flags */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_raid_stride; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* RAID stride */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_mmp_update_interval; =C2=A0/* # secon=
ds to wait in MMP checking */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 =C2=A0 s_mmp_block; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0/* Block for multi-mount protection */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_raid_stripe_width; =C2=A0 =C2=A0/* bl=
ocks on all data disks (N*stride)*/<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_log_groups_per_flex; =C2=A0/* FL=
EX_BG group size */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_reserved_char_pad;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 s_reserved_pad; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 /* Padding to next 32bits */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 =C2=A0 s_kbytes_written; =C2=A0 =C2=A0 =C2=A0 =
/* nr of lifetime kilobytes written */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_snapshot_inum; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Inode number of active snapshot */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_snapshot_id; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* sequential ID of active snapshot */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 =C2=A0 s_snapshot_r_blocks_count; /* reserved =
blocks for active<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0snapshot&#39;s future use */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_snapshot_list; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* inode number of the head of the on-disk snapshot list */<br>
-+#define EXT4_S_ERR_START ext4_offsetof(struct ext2_super_block, s_error_c=
ount)<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_error_count; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0/* number of fs errors */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_first_error_time; =C2=A0 =C2=A0 /* fi=
rst time an error happened */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_first_error_ino; =C2=A0 =C2=A0 =C2=A0=
/* inode involved in first error */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 =C2=A0 s_first_error_block; =C2=A0 =C2=A0/* bl=
ock involved of first error */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_first_error_func[32]; /* functio=
n where the error happened */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_first_error_line; =C2=A0 =C2=A0 /* li=
ne number where error happened */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_last_error_time; =C2=A0 =C2=A0 =C2=A0=
/* most recent time of an error */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_last_error_ino; =C2=A0 =C2=A0 =C2=A0 =
/* inode involved in last error */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_last_error_line; =C2=A0 =C2=A0 =C2=A0=
/* line number where error happened */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 =C2=A0 s_last_error_block; =C2=A0 =C2=A0 /* bl=
ock involved of last error */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_last_error_func[32]; =C2=A0/* fu=
nction where the error happened */<br>
-+#define EXT4_S_ERR_END ext4_offsetof(struct ext2_super_block, s_mount_opt=
s)<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0s_mount_opts[64];<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_usr_quota_inum; =C2=A0 =C2=A0 =C2=A0 =
/* inode number of user quota file */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_grp_quota_inum; =C2=A0 =C2=A0 =C2=A0 =
/* inode number of group quota file */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_overhead_blocks; =C2=A0 =C2=A0 =C2=A0=
/* overhead blocks/clusters in fs */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_reserved[108]; =C2=A0 =C2=A0 =C2=A0 =
=C2=A0/* Padding to the end of the block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 s_checksum; =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 /* crc32c(superblock) */<br>
-+};<br>
-+<br>
-+#define EXT4_S_ERR_LEN (EXT4_S_ERR_END - EXT4_S_ERR_START)<br>
-+<br>
-+/*<br>
-+ * Codes for operating systems<br>
-+ */<br>
-+#define EXT2_OS_LINUX =C2=A0 =C2=A0 =C2=A0 =C2=A0 0<br>
-+#define EXT2_OS_HURD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
-+#define EXT2_OBSO_OS_MASIX =C2=A0 =C2=A02<br>
-+#define EXT2_OS_FREEBSD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
3<br>
-+#define EXT2_OS_LITES =C2=A0 =C2=A0 =C2=A0 =C2=A0 4<br>
-+<br>
-+/*<br>
-+ * Revision levels<br>
-+ */<br>
-+#define EXT2_GOOD_OLD_REV =C2=A0 =C2=A0 0 =C2=A0 =C2=A0 =C2=A0 /* The goo=
d old (original) format */<br>
-+#define EXT2_DYNAMIC_REV =C2=A0 =C2=A0 =C2=A01 =C2=A0 =C2=A0 =C2=A0 /* V2=
 format w/ dynamic inode sizes */<br>
-+<br>
-+#define EXT2_CURRENT_REV =C2=A0 =C2=A0 =C2=A0EXT2_GOOD_OLD_REV<br>
-+#define EXT2_MAX_SUPP_REV =C2=A0 =C2=A0 EXT2_DYNAMIC_REV<br>
-+<br>
-+#define EXT2_GOOD_OLD_INODE_SIZE 128<br>
-+<br>
-+/*<br>
-+ * Journal inode backup types<br>
-+ */<br>
-+#define EXT3_JNL_BACKUP_BLOCKS =C2=A0 =C2=A0 =C2=A0 =C2=A01<br>
-+<br>
-+/*<br>
-+ * Feature set definitions<br>
-+ */<br>
-+<br>
-+#define EXT2_HAS_COMPAT_FEATURE(sb,<u></u>mask) =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+ =C2=A0 =C2=A0 =C2=A0( EXT2_SB(sb)-&gt;s_feature_compat &amp; (mask) )<br=
>
-+#define EXT2_HAS_RO_COMPAT_FEATURE(sb,<u></u>mask) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \<br>
-+ =C2=A0 =C2=A0 =C2=A0( EXT2_SB(sb)-&gt;s_feature_ro_<u></u>compat &amp; (=
mask) )<br>
-+#define EXT2_HAS_INCOMPAT_FEATURE(sb,<u></u>mask) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0\<br>
-+ =C2=A0 =C2=A0 =C2=A0( EXT2_SB(sb)-&gt;s_feature_<u></u>incompat &amp; (m=
ask) )<br>
-+<br>
-+#define EXT2_FEATURE_COMPAT_DIR_<u></u>PREALLOC =C2=A0 =C2=A0 =C2=A00x000=
1<br>
-+#define EXT2_FEATURE_COMPAT_IMAGIC_<u></u>INODES =C2=A0 =C2=A0 0x0002<br>
-+#define EXT3_FEATURE_COMPAT_HAS_<u></u>JOURNAL =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0004<br>
-+#define EXT2_FEATURE_COMPAT_EXT_ATTR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
0008<br>
-+#define EXT2_FEATURE_COMPAT_RESIZE_<u></u>INODE =C2=A0 =C2=A0 =C2=A00x001=
0<br>
-+#define EXT2_FEATURE_COMPAT_DIR_INDEX =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0020<=
br>
-+#define EXT2_FEATURE_COMPAT_LAZY_BG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
0040<br>
-+/* #define EXT2_FEATURE_COMPAT_EXCLUDE_<u></u>INODE =C2=A00x0080 not used=
, legacy */<br>
-+#define EXT2_FEATURE_COMPAT_EXCLUDE_<u></u>BITMAP =C2=A0 =C2=A00x0100<br>
-+<br>
-+<br>
-+#define EXT2_FEATURE_RO_COMPAT_SPARSE_<u></u>SUPER =C2=A0 0x0001<br>
-+#define EXT2_FEATURE_RO_COMPAT_LARGE_<u></u>FILE =C2=A0 =C2=A0 0x0002<br>
-+/* #define EXT2_FEATURE_RO_COMPAT_BTREE_<u></u>DIR =C2=A0 0x0004 not used=
 */<br>
-+#define EXT4_FEATURE_RO_COMPAT_HUGE_<u></u>FILE =C2=A0 =C2=A0 =C2=A00x000=
8<br>
-+#define EXT4_FEATURE_RO_COMPAT_GDT_<u></u>CSUM =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0010<br>
-+#define EXT4_FEATURE_RO_COMPAT_DIR_<u></u>NLINK =C2=A0 =C2=A0 =C2=A00x002=
0<br>
-+#define EXT4_FEATURE_RO_COMPAT_EXTRA_<u></u>ISIZE =C2=A0 =C2=A00x0040<br>
-+#define EXT4_FEATURE_RO_COMPAT_HAS_<u></u>SNAPSHOT =C2=A0 0x0080<br>
-+#define EXT4_FEATURE_RO_COMPAT_QUOTA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x=
0100<br>
-+#define EXT4_FEATURE_RO_COMPAT_<u></u>BIGALLOC =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 0x0200<br>
-+#define EXT4_FEATURE_RO_COMPAT_<u></u>METADATA_CSUM =C2=A00x0400<br>
-+#define EXT4_FEATURE_RO_COMPAT_REPLICA =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x0800<br>
-+<br>
-+#define EXT2_FEATURE_INCOMPAT_<u></u>COMPRESSION =C2=A0 =C2=A0 0x0001<br>
-+#define EXT2_FEATURE_INCOMPAT_FILETYPE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x0002<br>
-+#define EXT3_FEATURE_INCOMPAT_RECOVER =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0004 =
/* Needs recovery */<br>
-+#define EXT3_FEATURE_INCOMPAT_JOURNAL_<u></u>DEV =C2=A0 =C2=A0 0x0008 /* =
Journal device */<br>
-+#define EXT2_FEATURE_INCOMPAT_META_BG =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0010<=
br>
-+#define EXT3_FEATURE_INCOMPAT_EXTENTS =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0040<=
br>
-+#define EXT4_FEATURE_INCOMPAT_64BIT =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x=
0080<br>
-+#define EXT4_FEATURE_INCOMPAT_MMP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 0x0100<br>
-+#define EXT4_FEATURE_INCOMPAT_FLEX_BG =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0200<=
br>
-+#define EXT4_FEATURE_INCOMPAT_EA_INODE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A00x0400<br>
-+#define EXT4_FEATURE_INCOMPAT_DIRDATA =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x1000<=
br>
-+<br>
-+#define EXT2_FEATURE_COMPAT_SUPP =C2=A0 =C2=A0 =C2=A00<br>
-+#define EXT2_FEATURE_INCOMPAT_SUPP =C2=A0 =C2=A0(EXT2_FEATURE_INCOMPAT_<u=
></u>FILETYPE| \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT4_FEATURE_INCOMP=
AT_MMP)<br>
-+#define EXT2_FEATURE_RO_COMPAT_SUPP =C2=A0 (EXT2_FEATURE_RO_COMPAT_<u></u=
>SPARSE_SUPER| \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_FEATURE=
_RO_COMPAT_LARGE_<u></u>FILE| \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT4_FEATURE=
_RO_COMPAT_DIR_<u></u>NLINK| \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 EXT2_FEATURE=
_RO_COMPAT_BTREE_<u></u>DIR)<br>
-+<br>
-+/*<br>
-+ * Default values for user and/or group using reserved blocks<br>
-+ */<br>
-+#define EXT2_DEF_RESUID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0<br>
-+#define EXT2_DEF_RESGID =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0<br>
-+<br>
-+/*<br>
-+ * Default mount options<br>
-+ */<br>
-+#define EXT2_DEFM_DEBUG =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x0001<br>
-+#define EXT2_DEFM_BSDGROUPS =C2=A0 0x0002<br>
-+#define EXT2_DEFM_XATTR_USER =C2=A00x0004<br>
-+#define EXT2_DEFM_ACL =C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0008<br>
-+#define EXT2_DEFM_UID16 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x0010<br>
-+#define EXT3_DEFM_JMODE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0x0060<br>
-+#define EXT3_DEFM_JMODE_DATA =C2=A00x0020<br>
-+#define EXT3_DEFM_JMODE_ORDERED =C2=A0 =C2=A0 =C2=A0 0x0040<br>
-+#define EXT3_DEFM_JMODE_WBACK 0x0060<br>
-+#define EXT4_DEFM_NOBARRIER =C2=A0 0x0100<br>
-+#define EXT4_DEFM_BLOCK_VALIDITY 0x0200<br>
-+#define EXT4_DEFM_DISCARD =C2=A0 =C2=A0 0x0400<br>
-+#define EXT4_DEFM_NODELALLOC =C2=A00x0800<br>
-+<br>
-+/*<br>
-+ * Structure of a directory entry<br>
-+ */<br>
-+#define EXT2_NAME_LEN 255<br>
-+<br>
-+struct ext2_dir_entry {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 inode; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Inode number */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 rec_len; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Directory entry length */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 name_len; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* Name length */<br>
-+ =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0name[EXT2_NAME_LEN]; =C2=A0 =C2=A0=
/* File name */<br>
-+};<br>
-+<br>
-+/*<br>
-+ * The new version of the directory entry. =C2=A0Since EXT2 structures ar=
e<br>
-+ * stored in intel byte order, and the name_len field could never be<br>
-+ * bigger than 255 chars, it&#39;s safe to reclaim the extra byte for the=
<br>
-+ * file_type field.<br>
-+ */<br>
-+struct ext2_dir_entry_2 {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 inode; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Inode number */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 rec_len; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Directory entry length */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0name_len; =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 /* Name length */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u8 =C2=A0 =C2=A0file_type;<br>
-+ =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0name[EXT2_NAME_LEN]; =C2=A0 =C2=A0=
/* File name */<br>
-+};<br>
-+<br>
-+/*<br>
-+ * Ext2 directory file types. =C2=A0Only the low 3 bits are used. =C2=A0T=
he<br>
-+ * other bits are reserved for now.<br>
-+ */<br>
-+#define EXT2_FT_UNKNOWN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
0<br>
-+#define EXT2_FT_REG_FILE =C2=A0 =C2=A0 =C2=A01<br>
-+#define EXT2_FT_DIR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
-+#define EXT2_FT_CHRDEV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A03<br>
-+#define EXT2_FT_BLKDEV =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A04<br>
-+#define EXT2_FT_FIFO =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05<br>
-+#define EXT2_FT_SOCK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A06<br>
-+#define EXT2_FT_SYMLINK =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
7<br>
-+<br>
-+#define EXT2_FT_MAX =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 8<br>
-+<br>
-+/*<br>
-+ * EXT2_DIR_PAD defines the directory entries boundaries<br>
-+ *<br>
-+ * NOTE: It must be a multiple of 4<br>
-+ */<br>
-+#define EXT2_DIR_PAD =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A04<br>
-+#define EXT2_DIR_ROUND =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(EXT2_DIR_PAD - 1)<br>
-+#define EXT2_DIR_REC_LEN(name_len) =C2=A0 =C2=A0(((name_len) + 8 + EXT2_D=
IR_ROUND) &amp; \<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ~EXT2_DIR_RO=
UND)<br>
-+<br>
-+/*<br>
-+ * This structure is used for multiple mount protection. It is written<br=
>
-+ * into the block number saved in the s_mmp_block field in the superblock=
.<br>
-+ * Programs that check MMP should assume that if SEQ_FSCK (or any unknown=
<br>
-+ * code above SEQ_MAX) is present then it is NOT safe to use the filesyst=
em,<br>
-+ * regardless of how old the timestamp is.<br>
-+ *<br>
-+ * The timestamp in the MMP structure will be updated by e2fsck at some<b=
r>
-+ * arbitary intervals (start of passes, after every few groups of inodes<=
br>
-+ * in pass1 and pass1b). =C2=A0There is no guarantee that e2fsck is updat=
ing<br>
-+ * the MMP block in a timely manner, and the updates it does are purely<b=
r>
-+ * for the convenience of the sysadmin and not for automatic validation.<=
br>
-+ *<br>
-+ * Note: Only the mmp_seq value is used to determine whether the MMP bloc=
k<br>
-+ * =C2=A0 =C2=A0is being updated. =C2=A0The mmp_time, mmp_nodename, and m=
mp_bdevname<br>
-+ * =C2=A0 =C2=A0fields are only for informational purposes for the admini=
strator,<br>
-+ * =C2=A0 =C2=A0due to clock skew between nodes and hostname HA service t=
akeover.<br>
-+ */<br>
-+#define EXT4_MMP_MAGIC =C2=A0 =C2=A0 0x004D4D50U /* ASCII for MMP */<br>
-+#define EXT4_MMP_SEQ_CLEAN 0xFF4D4D50U /* mmp_seq value for clean unmount=
 */<br>
-+#define EXT4_MMP_SEQ_FSCK =C2=A00xE24D4D50U /* mmp_seq value when being f=
scked */<br>
-+#define EXT4_MMP_SEQ_MAX =C2=A0 0xE24D4D4FU /* maximum valid mmp_seq valu=
e */<br>
-+<br>
-+struct mmp_struct {<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 mmp_magic; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0/* Magic number for MMP */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 mmp_seq; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0/* Sequence no. updated periodically */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u64 =C2=A0 mmp_time; =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 /* Time last updated */<br>
-+ =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0mmp_nodename[64]; =C2=A0 =C2=A0 =
=C2=A0 /* Node which last updated MMP block */<br>
-+ =C2=A0 =C2=A0 =C2=A0char =C2=A0 =C2=A0mmp_bdevname[32]; =C2=A0 =C2=A0 =
=C2=A0 /* Bdev which last updated MMP block */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 mmp_check_interval; =C2=A0 =C2=A0 /* Ch=
anged mmp_check_interval */<br>
-+ =C2=A0 =C2=A0 =C2=A0__u16 =C2=A0 mmp_pad1;<br>
-+ =C2=A0 =C2=A0 =C2=A0__u32 =C2=A0 mmp_pad2[227];<br>
-+};<br>
-+<br>
-+/*<br>
-+ * Default interval for MMP update in seconds.<br>
-+ */<br>
-+#define EXT4_MMP_UPDATE_INTERVAL =C2=A0 =C2=A0 =C2=A05<br>
-+<br>
-+/*<br>
-+ * Maximum interval for MMP update in seconds.<br>
-+ */<br>
-+#define EXT4_MMP_MAX_UPDATE_INTERVAL =C2=A0300<br>
-+<br>
-+/*<br>
-+ * Minimum interval for MMP checking in seconds.<br>
-+ */<br>
-+#define EXT4_MMP_MIN_CHECK_INTERVAL =C2=A0 =C2=A0 5<br>
-+<br>
-+#endif =C2=A0 =C2=A0 =C2=A0 =C2=A0/* _EXT2FS_EXT2_FS_H */<br>
-Index: syslinux-4.03/libinstaller/<u></u>linuxioctl.h<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- syslinux-4.03.orig/<u></u>libinstaller/linuxioctl.h<br>
-+++ syslinux-4.03/libinstaller/<u></u>linuxioctl.h<br>
-@@ -9,17 +9,33 @@<br>
-<br>
- #include &lt;sys/ioctl.h&gt;<br>
-<br>
-+#ifdef __linux__<br>
-+<br>
- #define statfs _kernel_statfs /* HACK to deal with broken 2.4 distros */<=
br>
-<br>
- #include &lt;linux/fd.h&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Floppy geometr=
y */<br>
- #include &lt;linux/hdreg.h&gt; =C2=A0 =C2=A0 =C2=A0/* Hard disk geometry =
*/<br>
-<br>
--#include &lt;linux/fs.h&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIGETBSZ, FIBM=
AP, FS_IOC_FIEMAP */<br>
-+#include &lt;linux/fs.h&gt; =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* FIGETBSZ, FIBM=
AP, FS_IOC_* */<br>
- #include &lt;linux/msdos_fs.h&gt; =C2=A0 /* FAT_IOCTL_SET_ATTRIBUTES */<b=
r>
-<br>
- #undef SECTOR_SIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Defined in=
 msdos_fs.h for no good reason */<br>
- #undef SECTOR_BITS<br>
--#include &lt;linux/ext2_fs.h&gt; =C2=A0 =C2=A0/* EXT2_IOC_* */<br>
-+<br>
-+#ifndef FS_IOC_GETFLAGS<br>
-+/* Old kernel headers, these were once ext2-specific... */<br>
-+# include &lt;linux/ext2_fs.h&gt; =C2=A0 /* EXT2_IOC_* */<br>
-+<br>
-+# define FS_IOC_GETFLAGS EXT2_IOC_GETFLAGS<br>
-+# define FS_IOC_SETFLAGS EXT2_IOC_SETFLAGS<br>
-+<br>
-+# define FS_IMMUTABLE_FL EXT2_IMMUTABLE_FL<br>
-+<br>
-+#else<br>
-+<br>
-+# include &lt;ext2fs/ext2_fs.h&gt;<br>
-+<br>
-+#endif<br>
-<br>
- #ifndef FAT_IOCTL_GET_ATTRIBUTES<br>
- # define FAT_IOCTL_GET_ATTRIBUTES =C2=A0 =C2=A0 _IOR(&#39;r&#39;, 0x10, _=
_u32)<br>
-@@ -37,11 +53,13 @@<br>
-<br>
- #undef statfs<br>
-<br>
--#if defined(__linux__) &amp;&amp; !defined(BLKGETSIZE64)<br>
-+#ifndef =C2=A0BLKGETSIZE64<br>
- /* This takes a u64, but the size field says size_t. =C2=A0Someone screwe=
d big. */<br>
- # define BLKGETSIZE64 _IOR(0x12,114,size_t)<br>
- #endif<br>
-<br>
- #include &lt;linux/loop.h&gt;<br>
-<br>
-+#endif /* __linux__ */<br>
-+<br>
- #endif /* LIBINSTALLER_LINUXIOCTL_H */<br>
-Index: syslinux-4.03/libinstaller/<u></u>syslxcom.c<br>
-=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<u></u>=3D=3D=3D=3D=3D=3D=3D=3D<br>
---- syslinux-4.03.orig/<u></u>libinstaller/syslxcom.c<br>
-+++ syslinux-4.03/libinstaller/<u></u>syslxcom.c<br>
-@@ -121,9 +121,9 @@ void clear_attributes(int fd)<br>
- =C2=A0 =C2=A0 =C2=A0 {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int flags;<br>
-<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ioctl(fd, EXT2_IOC_GETFLAGS, &amp=
;flags)) {<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp;=3D ~EXT2_IMM=
UTABLE_FL;<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(fd, EXT2_IOC_SETFL=
AGS, &amp;flags);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ioctl(fd, FS_IOC_GETFLAGS, &amp;f=
lags)) {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags &amp;=3D ~FS_IMMUT=
ABLE_FL;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(fd, FS_IOC_SETFLAG=
S, &amp;flags);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
- =C2=A0 =C2=A0 =C2=A0 }<br>
-@@ -151,9 +151,9 @@ void set_attributes(int fd)<br>
- =C2=A0 =C2=A0 =C2=A0 {<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int flags;<br>
-<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st.st_uid =3D=3D 0 &amp;&amp; !ioc=
tl(fd, EXT2_IOC_GETFLAGS, &amp;flags)) {<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D EXT2_IMMUTABL=
E_FL;<br>
-- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(fd, EXT2_IOC_SETFL=
AGS, &amp;flags);<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (st.st_uid =3D=3D 0 &amp;&amp; !ioc=
tl(fd, FS_IOC_GETFLAGS, &amp;flags)) {<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0flags |=3D FS_IMMUTABLE_=
FL;<br>
-+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ioctl(fd, FS_IOC_SETFLAG=
S, &amp;flags);<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
- =C2=A0 =C2=A0 =C2=A0 }<br>
diff --git a/meta/recipes-devtools/<u></u>syslinux/files/no-strip.patch b/m=
eta/recipes-devtools/<u></u>syslinux/files/no-strip.patch<br>
deleted file mode 100644<br>
index 775851a..0000000<br>
--- a/meta/recipes-devtools/<u></u>syslinux/files/no-strip.patch<br>
+++ /dev/null<br>
@@ -1,31 +0,0 @@<br>
-Disable stripping of binaries<br>
-<br>
-We don&#39;t want to strip these as this is handled separately at package<=
br>
-time.<br>
-<br>
-Upstream-Status: Inappropriate [configuration]<br>
-<br>
-Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.int=
el.com" target=3D"_blank">paul.eggleton@linux.intel.com</a><u></u>&gt;<br>
-<br>
---- syslinux-4.03.orig/mtools/<u></u>Makefile<br>
-+++ syslinux-4.03/mtools/Makefile<br>
-@@ -4,7 +4,7 @@ include $(topdir)/MCONFIG<br>
- OPTFLAGS =3D -g -Os<br>
- INCLUDES =3D -I. -I.. -I../libfat -I../libinstaller<br>
- CFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D $(GCCWARN) -D_FILE_OFFSET_BITS=3D6=
4 $(OPTFLAGS) $(INCLUDES)<br>
--LDFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D -s<br>
-+LDFLAGS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D<br>
-<br>
- SRCS =C2=A0 =C2=A0 =3D syslinux.c \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0../libinstaller/fat.c \<br>
---- syslinux-4.03.orig/utils/<u></u>Makefile<br>
-+++ syslinux-4.03/utils/Makefile<br>
-@@ -18,7 +18,7 @@ topdir =3D ..<br>
- include $(topdir)/MCONFIG<br>
-<br>
- CFLAGS =C2=A0 =3D $(GCCWARN) -Os -fomit-frame-pointer -D_FILE_OFFSET_BITS=
=3D64<br>
--LDFLAGS =C2=A0=3D -O2 -s<br>
-+LDFLAGS =C2=A0=3D -O2<br>
-<br>
- TARGETS =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D mkdiskimage isohybrid gethostip me=
mdiskfind<br>
- TARGETS +=3D <a href=3D"http://isohybrid.pl" target=3D"_blank">isohybrid.=
pl</a> =C2=A0# about to be obsoleted<br>
diff --git a/meta/recipes-devtools/<u></u>syslinux/<a href=3D"http://syslin=
ux_4.03.bb" target=3D"_blank">syslinux_4.03.bb</a> b/meta/recipes-devtools/=
<u></u>syslinux/<a href=3D"http://syslinux_4.03.bb" target=3D"_blank">sysli=
nux_4.03.bb</a><br>

deleted file mode 100644<br>
index 7c3ecda..0000000<br>
--- a/meta/recipes-devtools/<u></u>syslinux/<a href=3D"http://syslinux_4.03=
.bb" target=3D"_blank">syslinux_4.03.bb</a><br>
+++ /dev/null<br>
@@ -1,65 +0,0 @@<br>
-DESCRIPTION =3D &quot;A multi-purpose linux bootloader&quot;<br>
-HOMEPAGE =3D &quot;<a href=3D"http://syslinux.zytor.com/" target=3D"_blank=
">http://syslinux.zytor.com/</a>&quot;<br>
-LICENSE =3D &quot;GPLv2+&quot;<br>
-LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>0636e73ff0215e8d672=
dc4c32c317b<u></u>b3 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://README;beginline=3D28;<u></u>endline=3D34;md5=3D<u></u>a4607efd4a6392017=
186d08099e7d5<u></u>46&quot;<br>
-<br>
-# If you really want to run syslinux, you need mtools. =C2=A0We just want =
the<br>
-# ldlinux.* stuff for now, so skip mtools-native<br>
-DEPENDS =3D &quot;nasm-native&quot;<br>
-PR =3D &quot;r9&quot;<br>
-<br>
-SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/<u></u>utils/boot/syslinux/4.x=
x/<u></u>syslinux-${PV}.tar.bz2 \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://cross-build.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://no-strip.patch \<br>
- =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://libinstaller-Avoid-<u></u>using=
-linux-ext2_fs.h.patch&quot;<br>
-<br>
-SRC_URI[md5sum] =3D &quot;<u></u>a7ca38a0a5786b6efae8fb01a1ae80<u></u>70&q=
uot;<br>
-SRC_URI[sha256sum] =3D &quot;<u></u>c65567e324f9d1f7f794ae8f9578a0<u></u>2=
92bbd47d7b8d895a004d2f0152d0b<u></u>da38&quot;<br>
-<br>
-COMPATIBLE_HOST =3D &#39;(x86_64|i.86).*-(linux|<u></u>freebsd.*)&#39;<br>
-<br>
-EXTRA_OEMAKE =3D &quot; \<br>
- =C2=A0 =C2=A0 =C2=A0 BINDIR=3D${bindir} SBINDIR=3D${sbindir} LIBDIR=3D${l=
ibdir} \<br>
- =C2=A0 =C2=A0 =C2=A0 DATADIR=3D${datadir} MANDIR=3D${mandir} INCDIR=3D${i=
ncludedir} \<br>
-&quot;<br>
-# syslinux uses $LD for linking, strip `-Wl,&#39; so it can work<br>
-export LDFLAGS =3D &quot;`echo $LDFLAGS | sed &#39;s/-Wl,//g&#39;`&quot;<b=
r>
-<br>
-do_configure() {<br>
- =C2=A0 =C2=A0 =C2=A0 # drop win32 targets or build fails<br>
- =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s,win32/\S*,,g&#39; -i Makefile<br>
-<br>
- =C2=A0 =C2=A0 =C2=A0 # clean installer executables included in source tar=
ball<br>
- =C2=A0 =C2=A0 =C2=A0 oe_runmake clean<br>
-}<br>
-<br>
-do_compile() {<br>
- =C2=A0 =C2=A0 =C2=A0 # Rebuild only the installer; keep precompiled bootl=
oaders<br>
- =C2=A0 =C2=A0 =C2=A0 # as per author&#39;s request (doc/distrib.txt)<br>
- =C2=A0 =C2=A0 =C2=A0 oe_runmake CC=3D&quot;${CC}&quot; installer<br>
-}<br>
-<br>
-do_install() {<br>
- =C2=A0 =C2=A0 =C2=A0 oe_runmake install INSTALLROOT=3D&quot;${D}&quot;<br=
>
-<br>
- =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir}/syslinux/<br>
- =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/core/ldlinux.sys ${D}${libdir}/s=
yslinux/<br>
- =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/s=
yslinux/<br>
-}<br>
-<br>
-PACKAGES +=3D &quot;${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${=
PN}-isolinux ${PN}-misc&quot;<br>
-<br>
-RDEPENDS_${PN} +=3D &quot;mtools&quot;<br>
-<br>
-FILES_${PN} =3D &quot;${bindir}/syslinux&quot;<br>
-FILES_${PN}-extlinux =3D &quot;${sbindir}/extlinux&quot;<br>
-FILES_${PN}-mbr =3D &quot;${libdir}/${BPN}/mbr.bin&quot;<br>
-FILES_${PN}-chain =3D &quot;${libdir}/${BPN}/chain.c32&quot;<br>
-FILES_${PN}-isolinux =3D &quot;${libdir}/${BPN}/isolinux.<u></u>bin&quot;<=
br>
-FILES_${PN}-pxelinux =3D &quot;${libdir}/${BPN}/pxelinux.0&quot;<br>
-FILES_${PN}-dev +=3D &quot;${datadir}/${BPN}/com32/lib*$<u></u>{SOLIBS} ${=
datadir}/${BPN}/com32/<u></u>include ${datadir}/${BPN}/com32/com32.<u></u>l=
d&quot;<br>
-FILES_${PN}-staticdev +=3D &quot;${datadir}/${BPN}/com32/lib*.<u></u>a ${l=
ibdir}/${BPN}/com32/lib*.a&quot;<br>
-FILES_${PN}-misc =3D &quot;${libdir}/${BPN}/* ${bindir}/*&quot;<br>
-<br>
-BBCLASSEXTEND =3D &quot;native&quot;<br>
diff --git a/meta/recipes-devtools/<u></u>syslinux/<a href=3D"http://syslin=
ux_4.06.bb" target=3D"_blank">syslinux_4.06.bb</a> b/meta/recipes-devtools/=
<u></u>syslinux/<a href=3D"http://syslinux_4.06.bb" target=3D"_blank">sysli=
nux_4.06.bb</a><br>

new file mode 100644<br>
index 0000000..a30a4a3<br>
--- /dev/null<br>
+++ b/meta/recipes-devtools/<u></u>syslinux/<a href=3D"http://syslinux_4.06=
.bb" target=3D"_blank">syslinux_4.06.bb</a><br>
@@ -0,0 +1,62 @@<br>
+DESCRIPTION =3D &quot;A multi-purpose linux bootloader&quot;<br>
+HOMEPAGE =3D &quot;<a href=3D"http://syslinux.zytor.com/" target=3D"_blank=
">http://syslinux.zytor.com/</a>&quot;<br>
+LICENSE =3D &quot;GPLv2+&quot;<br>
+LIC_FILES_CHKSUM =3D &quot;file://COPYING;md5=3D<u></u>0636e73ff0215e8d672=
dc4c32c317b<u></u>b3 \<br>
+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=
://README;beginline=3D35;<u></u>endline=3D41;md5=3D<u></u>f7249a750bc692d10=
48b2626752aa4<u></u>15&quot;<br>
+<br>
+# If you really want to run syslinux, you need mtools. =C2=A0We just want =
the<br>
+# ldlinux.* stuff for now, so skip mtools-native<br>
+DEPENDS =3D &quot;nasm-native util-linux&quot;<br>
+PR =3D &quot;r0&quot;<br>
+<br>
+SRC_URI =3D &quot;${KERNELORG_MIRROR}/linux/<u></u>utils/boot/syslinux/4.x=
x/<u></u>syslinux-${PV}.tar.bz2&quot;<br>
+<br>
+SRC_URI[md5sum] =3D &quot;<u></u>0384ef35b724615074e77b1fc89d5b<u></u>47&q=
uot;<br>
+SRC_URI[sha256sum] =3D &quot;<u></u>dbb7774e36c4596de68fa5e6788ad5<u></u>7=
809ab31a1760e5d7626e697766d30<u></u>ad26&quot;<br>
+<br>
+COMPATIBLE_HOST =3D &#39;(x86_64|i.86).*-(linux|<u></u>freebsd.*)&#39;<br>
+<br>
+EXTRA_OEMAKE =3D &quot; \<br>
+ =C2=A0 =C2=A0 =C2=A0 BINDIR=3D${bindir} SBINDIR=3D${sbindir} LIBDIR=3D${l=
ibdir} \<br>
+ =C2=A0 =C2=A0 =C2=A0 DATADIR=3D${datadir} MANDIR=3D${mandir} INCDIR=3D${i=
ncludedir} \<br>
+&quot;<br>
+# syslinux uses $LD for linking, strip `-Wl,&#39; so it can work<br>
+export LDFLAGS =3D &quot;`echo $LDFLAGS | sed &#39;s/-Wl,//g&#39;`&quot;<b=
r>
+<br>
+do_configure() {<br>
+ =C2=A0 =C2=A0 =C2=A0 # drop win32 targets or build fails<br>
+ =C2=A0 =C2=A0 =C2=A0 sed -e &#39;s,win32/\S*,,g&#39; -i Makefile<br>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 # clean installer executables included in source tar=
ball<br>
+ =C2=A0 =C2=A0 =C2=A0 oe_runmake clean<br>
+}<br>
+<br>
+do_compile() {<br>
+ =C2=A0 =C2=A0 =C2=A0 # Rebuild only the installer; keep precompiled bootl=
oaders<br>
+ =C2=A0 =C2=A0 =C2=A0 # as per author&#39;s request (doc/distrib.txt)<br>
+ =C2=A0 =C2=A0 =C2=A0 oe_runmake CC=3D&quot;${CC} -isystem ${STAGING_INCDI=
R}&quot; installer<br>
+}<br>
+<br>
+do_install() {<br>
+ =C2=A0 =C2=A0 =C2=A0 oe_runmake install INSTALLROOT=3D&quot;${D}&quot;<br=
>
+<br>
+ =C2=A0 =C2=A0 =C2=A0 install -d ${D}${libdir}/syslinux/<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/core/ldlinux.sys ${D}${libdir}/s=
yslinux/<br>
+ =C2=A0 =C2=A0 =C2=A0 install -m 644 ${S}/core/ldlinux.bss ${D}${libdir}/s=
yslinux/<br>
+}<br>
+<br>
+PACKAGES +=3D &quot;${PN}-extlinux ${PN}-mbr ${PN}-chain ${PN}-pxelinux ${=
PN}-isolinux ${PN}-misc&quot;<br>
+<br>
+RDEPENDS_${PN} +=3D &quot;mtools&quot;<br>
+<br>
+FILES_${PN} =3D &quot;${bindir}/syslinux&quot;<br>
+FILES_${PN}-extlinux =3D &quot;${sbindir}/extlinux&quot;<br>
+FILES_${PN}-mbr =3D &quot;${datadir}/${BPN}/mbr.bin&quot;<br>
+FILES_${PN}-chain =3D &quot;${datadir}/${BPN}/chain.c32&quot;<br>
+FILES_${PN}-isolinux =3D &quot;${datadir}/${BPN}/isolinux.<u></u>bin&quot;=
<br>
+FILES_${PN}-pxelinux =3D &quot;${datadir}/${BPN}/pxelinux.0&quot;<br>
+FILES_${PN}-dev +=3D &quot;${datadir}/${BPN}/com32/lib*$<u></u>{SOLIBS} ${=
datadir}/${BPN}/com32/<u></u>include ${datadir}/${BPN}/com32/com32.<u></u>l=
d&quot;<br>
+FILES_${PN}-staticdev +=3D &quot;${datadir}/${BPN}/com32/lib*.<u></u>a ${l=
ibdir}/${BPN}/com32/lib*.a&quot;<br>
+FILES_${PN}-misc =3D &quot;${datadir}/${BPN}/* ${libdir}/${BPN}/* ${bindir=
}/*&quot;<br>
+<br>
+BBCLASSEXTEND =3D &quot;native&quot;<br>
<br>
</blockquote>
</div></div></blockquote></div><br></div>

--089e0112c63a091ce604dc2d2087--
