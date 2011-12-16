Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1RbLZi-0007Pg-Pk
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Dec 2011 01:22:59 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 15 Dec 2011 16:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="87098634"
Received: from unknown (HELO envy.home) ([10.7.199.60])
	by orsmga001.jf.intel.com with ESMTP; 15 Dec 2011 16:15:59 -0800
Message-ID: <4EEA8DAD.2000400@linux.intel.com>
Date: Thu, 15 Dec 2011 16:15:41 -0800
From: Darren Hart <dvhart@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: "Kamble, Nitin A" <nitin.a.kamble@intel.com>
References: <cover.1323913192.git.nitin.a.kamble@intel.com>
	<dd874149b3cb354a2678899b754258f6bf98bdd8.1323913192.git.nitin.a.kamble@intel.com>
	<4EEA5BCA.3080907@linux.intel.com>
	<9DA5872FEF993D41B7173F58FCF6BE94E7749B0F@orsmsx504.amr.corp.intel.com>
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94E7749B0F@orsmsx504.amr.corp.intel.com>
X-Enigmail-Version: 1.3.3
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] dosfstools: fix populated image creation with dirs
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
X-List-Received-Date: Fri, 16 Dec 2011 00:22:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit



On 12/15/2011 02:03 PM, Kamble, Nitin A wrote:
> 
> 
>> -----Original Message-----
>> From: Darren Hart [mailto:dvhart@linux.intel.com]
>> Sent: Thursday, December 15, 2011 12:43 PM
>> To: Patches and discussions about the oe-core layer
>> Cc: Kamble, Nitin A
>> Subject: Re: [OE-core] [PATCH 1/1] dosfstools: fix populated image
>> creation with dirs
>>
>>
>>
>> On 12/14/2011 05:47 PM, nitin.a.kamble@intel.com wrote:
>>> From: Nitin A Kamble <nitin.a.kamble@intel.com>
>>>
>>> This fixes bug: [YOCTO #1783]
>>>
>>> Fix populated image creation. Earlier subdirectories support
>>> was broken, and files can only be placed in the root directory.
>>> Now directory hirarchy is supported in the image. Also support
>>> for long names is extended to directory names.
>>>
>>> There are some outstanding issues as documented in the patch
>>> header, these issues can be worked around by running
>>> dosfsck tool after populated image creation. The dosfsck tool
>>> is also part of this package.
>>>
>>
>> When using this patch to place the EFI related files into /EFI/BOOT I
>> added a "dosfsck -a -l ..." command after the "mkdosfs -d ..." command
>> to clean up issues. Unfortunatley, it does not appear capable of fixing
>> the . and .. failures:
> 
> Darren, Looks like you are on the old commit. I don't see these issues.

You are correct, I was cleaning dosfstools instead of dosfstools-native.
Doh. The current dosfsck output is:

dosfsck 2.11, 12 Mar 2005, FAT32, LFN
Checking file /ldlinux.sys (LDLINUX.SYS)
Checking file /initrd (INITRD)
Checking file /syslinux.cfg (SYSLINUX.CFG)
Checking file /EFI (EFI)
Checking file /vmlinuz (VMLINUZ)
Checking file /rootfs.img (ROOTFS.IMG)
/vmlinuz
  File size is 4144896 bytes, cluster chain length is > 4145152 bytes.
  Truncating file to 4144896 bytes.
Checking file /EFI/.. (..)
Checking file /EFI/BOOT (BOOT)
Checking file /EFI/. (.)
/EFI/..
  Start (16022) does not point to .. (0)
/EFI/.
  Start (0) does not point to parent (16022)
Checking file /EFI/BOOT/.. (..)
Checking file /EFI/BOOT/. (.)
Checking file /EFI/BOOT/initrd (INITRD)
Checking file /EFI/BOOT/grub.cfg (GRUB.CFG)
Checking file /EFI/BOOT/bootia32.efi (BOOTIA32.EFI)
Checking file /EFI/BOOT/vmlinuz (VMLINUZ)
Checking file /EFI/BOOT/rootfs.img (ROOTFS.IMG)
/EFI/BOOT/..
  Start (16021) does not point to .. (16022)
/EFI/BOOT/.
  Start (0) does not point to parent (16021)
/EFI/BOOT/vmlinuz
  File size is 4144896 bytes, cluster chain length is > 4145152 bytes.
  Truncating file to 4144896 bytes.
Performing changes.
/build/poky/fri2/tmp/deploy/images/core-image-minimal-fri2-noemgd-20111216000605.hddimg:
12 files, 26635/26828 clusters

It does work in my live image tests however.

--
Darren


> Nitin
> 
>>
>> | dosfsck 2.11, 12 Mar 2005, FAT32, LFN
>> | Checking file /ldlinux.sys (LDLINUX.SYS)
>> | Checking file /initrd (INITRD)
>> | Checking file /syslinux.cfg (SYSLINUX.CFG)
>> | Checking file /EFI (EFI)
>> | Checking file /grub.cfg (GRUB.CFG)
>> | Checking file /bootia32.efi (BOOTIA32.EFI)
>> | Checking file /vmlinuz (VMLINUZ)
>> | Checking file /rootfs.img (ROOTFS.IMG)
>> | /EFI
>> |   Directory has non-zero size. Fixing it.
>> | /vmlinuz
>> |   File size is 4144896 bytes, cluster chain length is > 4145152
>> bytes.
>> |   Truncating file to 4144896 bytes.
>> | Checking file /EFI/BOOT (BOOT)
>> | /EFI
>> |   "." is missing. Can't fix this yet.
>> | /EFI
>> |   ".." is missing. Can't fix this yet.
>> | /EFI/BOOT
>> |   Directory has non-zero size. Fixing it.
>> | Checking file /EFI/BOOT/initrd (INITRD)
>> | Checking file /EFI/BOOT/grub.cfg (GRUB.CFG)
>> | Checking file /EFI/BOOT/bootia32.efi (BOOTIA32.EFI)
>> | Checking file /EFI/BOOT/vmlinuz (VMLINUZ)
>> | Checking file /EFI/BOOT/rootfs.img (ROOTFS.IMG)
>> | /EFI/BOOT
>> |   "." is missing. Can't fix this yet.
>> | /EFI/BOOT
>> |   ".." is missing. Can't fix this yet.
>> | /EFI/BOOT/vmlinuz
>> |   File size is 4144896 bytes, cluster chain length is > 4145152
>> bytes.
>> |   Truncating file to 4144896 bytes.
>> | Performing changes.
>> |
>> /build/poky/fri2/tmp/deploy/images/core-image-minimal-fri2-noemgd-
>> 20111215191648.hddimg:
>> 14 files, 26837/27029 clusters
>>
>> --
>> Darren
>>
>>> Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> ---
>>>  .../dosfstools/fix_populated_dosfs_creation.patch  |  489
>> ++++++++++++++++++++
>>>  .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    5 +-
>>>  2 files changed, 492 insertions(+), 2 deletions(-)
>>>  create mode 100644 meta/recipes-
>> devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
>>>
>>> diff --git a/meta/recipes-
>> devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
>> b/meta/recipes-
>> devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
>>> new file mode 100644
>>> index 0000000..510f12e
>>> --- /dev/null
>>> +++ b/meta/recipes-
>> devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
>>> @@ -0,0 +1,489 @@
>>> +UpstreamStatus: Inappropriate
>>> +
>>> +This patch fixes populated dosfs image creation with directory
>>> +structures. Earlier it was causing segfault; and only image
>>> +population with no subdirectories was working.
>>> +
>>> +Issues fixed:
>>> +1. (dir->count == dir->entries) check was only needed for root
>>> +   directory entries. And this check is wrong for non-root
>>> +   directories.
>>> +2. For each dir entry 2 dir->table entries were needed, one for
>>> +   the file/dir and 2nd for long file name support. Earlier long
>>> +   name support was added for filenames but the 2nd entry
>>> +   allocation, initialization & counting was missed.
>>> +3. The memory clearing was missed at the code path after dir->table
>>> +   memroy allocation.
>>> +4. Add entries for . & .. directories in all non-root directories.
>>> +5. The . directory points to the correct entry in fat now.
>>> +6. All directoriy entries' size was not zero as required for
>> dosfsck,
>>> +   Now all directory entries' size is zero.
>>> +
>>> +Enhancements:
>>> +1. Added support for long names for directory names. This is same
>>> +   as the existing long name support for filenames.
>>> +2. Added error messages for previously silent memory allocation and
>>> +   other errors.
>>> +3. -d options does not work correctly with fat32, so now throwing
>>> +   an error for that.
>>> +4. Use predefined structures from kernel's msdos_fs.h file, rather
>>> +   than defining again here. And accordingly change the names & use
>>> +   of structure variables.
>>> +
>>> +Outstanding Issues:
>>> +1. The .. directory entry do not point to the parent of current
>>> +   directory. This issue can be fixed by running dosfsck -a after
>>> +   image creation.
>>> +2. For files the filesize is correct, but the clusters size is more
>>> +   than it needs to be, this also can be fixed by running dosfsck -a
>>> +   after image creation.
>>> +
>>> +Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> +2011/12/13
>>> +
>>> +
>>> +Index: dosfstools-2.11/mkdosfs/mkdosfs.c
>>> +===================================================================
>>> +--- dosfstools-2.11.orig/mkdosfs/mkdosfs.c
>>> ++++ dosfstools-2.11/mkdosfs/mkdosfs.c
>>> +@@ -21,7 +21,17 @@
>>> +    June 2004 - Jordan Crouse (info.linux@amd.com)
>>> +    Added -d <directory> support to populate the image
>>> +    Copyright (C) 2004, Advanced Micro Devices, All Rights Reserved
>>> +-
>>> ++
>>> ++   2011-12-13: Nitin A Kamble <nitin.a.kamble@intel.com>
>>> ++   Enhanced the -d <directory> support for population of image
>> while
>>> ++   creation. Earlier subdirectores support was broken, only files
>> in
>>> ++   the rootdir were supported. Now directory hirarchy is supported.
>>> ++   Also added long filename support to directory names.
>>> ++     The -d <directory> option (image population while creation)
>>> ++   is broken with fat32.
>>> ++   Copyright (C) 2011, Intel Corporation, All Rights Reserved
>>> ++
>>> ++
>>> +    Fixes/additions May 1998 by Roman Hodek
>>> +    <Roman.Hodek@informatik.uni-erlangen.de>:
>>> +    - Atari format support
>>> +@@ -86,23 +96,23 @@
>>> + # undef __KERNEL__
>>> + #endif
>>> +
>>> +-#if __BYTE_ORDER == __BIG_ENDIAN
>>> +-
>>> ++#ifndef __ASM_STUB_BYTEORDER_H__
>>> + #include <asm/byteorder.h>
>>> +-#ifdef __le16_to_cpu
>>> +-/* ++roman: 2.1 kernel headers define these function, they're
>> probably more
>>> +- * efficient then coding the swaps machine-independently. */
>>> +-#define CF_LE_W   __le16_to_cpu
>>> +-#define CF_LE_L   __le32_to_cpu
>>> +-#define CT_LE_W   __cpu_to_le16
>>> +-#define CT_LE_L   __cpu_to_le32
>>> +-#else
>>> +-#define CF_LE_W(v) ((((v) & 0xff) << 8) | (((v) >> 8) & 0xff))
>>> +-#define CF_LE_L(v) (((unsigned)(v)>>24) |
>> (((unsigned)(v)>>8)&0xff00) | \
>>> +-               (((unsigned)(v)<<8)&0xff0000) | ((unsigned)(v)<<24))
>>> ++#endif
>>> ++
>>> ++#include <linux/msdos_fs.h>
>>> ++
>>> ++#undef CF_LE_W
>>> ++#undef CF_LE_L
>>> ++#undef CT_LE_W
>>> ++#undef CT_LE_L
>>> ++
>>> ++#if __BYTE_ORDER == __BIG_ENDIAN
>>> ++#include <byteswap.h>
>>> ++#define CF_LE_W(v) bswap_16(v)
>>> ++#define CF_LE_L(v) bswap_32(v)
>>> + #define CT_LE_W(v) CF_LE_W(v)
>>> + #define CT_LE_L(v) CF_LE_L(v)
>>> +-#endif /* defined(__le16_to_cpu) */
>>> +
>>> + #else
>>> +
>>> +@@ -253,33 +263,6 @@ struct fat32_fsinfo {
>>> +   __u32           reserved2[4];
>>> + };
>>> +
>>> +-/* This stores up to 13 chars of the name */
>>> +-
>>> +-struct msdos_dir_slot {
>>> +-        __u8    id;             /* sequence number for slot */
>>> +-        __u8    name0_4[10];    /* first 5 characters in name */
>>> +-        __u8    attr;           /* attribute byte */
>>> +-        __u8    reserved;       /* always 0 */
>>> +-        __u8    alias_checksum; /* checksum for 8.3 alias */
>>> +-        __u8    name5_10[12];   /* 6 more characters in name */
>>> +-        __u16   start;          /* starting cluster number, 0 in
>> long slots */
>>> +-        __u8    name11_12[4];   /* last 2 characters in name */
>>> +-};
>>> +-
>>> +-struct msdos_dir_entry
>>> +-  {
>>> +-    char  name[8], ext[3];        /* name and extension */
>>> +-    __u8        attr;                     /* attribute bits */
>>> +-    __u8  lcase;                  /* Case for base and
>> extension */
>>> +-    __u8  ctime_ms;               /* Creation time, milliseconds */
>>> +-    __u16 ctime;                  /* Creation time */
>>> +-    __u16 cdate;                  /* Creation date */
>>> +-    __u16 adate;                  /* Last access date */
>>> +-    __u16 starthi;                /* high 16 bits of first cl.
>> (FAT32) */
>>> +-    __u16 time, date, start;      /* time, date and first
>> cluster */
>>> +-    __u32 size;                   /* file size (in bytes) */
>>> +-  } __attribute__ ((packed));
>>> +-
>>> + /* The "boot code" we put into the filesystem... it writes a
>> message and
>>> +    tells the user to try again */
>>> +
>>> +@@ -356,7 +339,6 @@ static struct msdos_dir_entry *root_dir;
>>> + static int size_root_dir; /* Size of the root directory in bytes */
>>> + static int sectors_per_cluster = 0;       /* Number of sectors per disk
>> cluster */
>>> + static int root_dir_entries = 0;  /* Number of root directory
>> entries */
>>> +-static int root_dir_num_entries = 0;
>>> + static int last_cluster_written = 0;
>>> +
>>> + static char *blank_sector;                /* Blank sector - all zeros
>> */
>>> +@@ -1315,7 +1297,7 @@ setup_tables (void)
>>> +       de->date = CT_LE_W((unsigned short)(ctime->tm_mday +
>>> +                                     ((ctime->tm_mon+1) << 5) +
>>> +                                     ((ctime->tm_year-80) << 9)));
>>> +-      de->ctime_ms = 0;
>>> ++      de->ctime_cs = 0;
>>> +       de->ctime = de->time;
>>> +       de->cdate = de->date;
>>> +       de->adate = de->date;
>>> +@@ -1451,16 +1433,23 @@ write_tables (void)
>>> +
>>> + /* Add a file to the specified directory entry, and also write it
>> into the image */
>>> +
>>> +-static void copy_filename(char *filename, char *base, char *ext) {
>>> ++static void copy_filename(char *filename, char *dos_name) {
>>> +
>>> +   char *ch = filename;
>>> +   int i, len;
>>> +
>>> +-  memset(base, 0x20, 8);
>>> +-  memset(ext, 0x20, 3);
>>> ++  if (!strcmp(filename, ".")) {
>>> ++    strncpy(dos_name, MSDOS_DOT, MSDOS_NAME);
>>> ++    return;
>>> ++  }
>>> ++  if (!strcmp(filename, "..")) {
>>> ++    strncpy(dos_name, MSDOS_DOTDOT, MSDOS_NAME);
>>> ++    return;
>>> ++  }
>>> ++  memset(dos_name, 0x20, MSDOS_NAME);
>>> +
>>> +   for(len = 0 ; *ch && *ch != '.'; ch++) {
>>> +-    base[len++] = toupper(*ch);
>>> ++    dos_name[len++] = toupper(*ch);
>>> +     if (len == 8) break;
>>> +   }
>>> +
>>> +@@ -1468,7 +1457,7 @@ static void copy_filename(char *filename
>>> +   if (*ch) ch++;
>>> +
>>> +   for(len = 0 ; *ch; ch++) {
>>> +-    ext[len++] = toupper(*ch);
>>> ++    dos_name[8 + len++] = toupper(*ch);
>>> +     if (len == 3) break;
>>> +   }
>>> + }
>>> +@@ -1551,7 +1540,7 @@ static int add_file(char *filename, stru
>>> +   int start;
>>> +   int usedsec, totalsec;
>>> +
>>> +-  char name83[8], ext83[3];
>>> ++  char dos_name[MSDOS_NAME+1];
>>> +
>>> +   struct msdos_dir_slot *slot;
>>> +   int i;
>>> +@@ -1562,23 +1551,22 @@ static int add_file(char *filename, stru
>>> +   if (dir->root) {
>>> +     if (dir->count == dir->entries) {
>>> +       printf("Error - too many directory entries\n");
>>> ++      return;
>>> +     }
>>> +   }
>>> +   else {
>>> +-    if (dir->count == dir->entries) {
>>> +-      if (!dir->table)
>>> +-  dir->table =
>>> +-    (struct msdos_dir_entry *) malloc(sizeof(struct
>> msdos_dir_entry));
>>> +-      else {
>>> +-  dir->table =
>>> +-    (struct msdos_dir_entry *) realloc(dir->table, (dir->entries +
>> 1) *
>>> +-                                       sizeof(struct msdos_dir_entry));
>>> +-
>>> +-  memset(&dir->table[dir->entries], 0, sizeof(struct
>> msdos_dir_entry));
>>> +-      }
>>> +-
>>> +-      dir->entries++;
>>> +-    }
>>> ++    /* 2 entries, one extra for long filename */
>>> ++    if (!dir->table)
>>> ++      dir->table =
>>> ++        (struct msdos_dir_entry *) malloc(2 * sizeof(struct
>> msdos_dir_entry));
>>> ++    else
>>> ++      dir->table =
>>> ++        (struct msdos_dir_entry *) realloc(dir->table, 2 * (dir-
>>> entries + 1) *
>>> ++                                       sizeof(struct msdos_dir_entry));
>>> ++    if (!dir->table)
>>> ++      printf("Error - realloc failed\n");
>>> ++    memset(&dir->table[dir->entries], 0, 2 * sizeof(struct
>> msdos_dir_entry));
>>> ++    dir->entries += 2;
>>> +   }
>>> +
>>> +   infile = open(filename, O_RDONLY, 0);
>>> +@@ -1611,13 +1599,13 @@ static int add_file(char *filename, stru
>>> +     return -1;
>>> +   }
>>> +
>>> +-  printf("ADD %s\n", filename);
>>> ++  printf("ADD FILE %s\n", filename);
>>> +
>>> +   /* Grab the basename of the file */
>>> +   base = basename(filename);
>>> +
>>> +-  /* Extract out the 8.3 name */
>>> +-  copy_filename(base, name83, ext83);
>>> ++  /* convert for dos fat structure  */
>>> ++  copy_filename(base, dos_name);
>>> +
>>> +   /* Make an extended name slot */
>>> +
>>> +@@ -1629,12 +1617,9 @@ static int add_file(char *filename, stru
>>> +
>>> +   slot->alias_checksum = 0;
>>> +
>>> +-  for(i = 0; i < 8; i++)
>>> +-    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot-
>>> alias_checksum&0xfe)>>1)) + name83[i];
>>> ++  for(i = 0; i < MSDOS_NAME; i++)
>>> ++    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot-
>>> alias_checksum&0xfe)>>1)) + dos_name[i];
>>> +
>>> +-  for(i = 0; i < 3; i++)
>>> +-    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot-
>>> alias_checksum&0xfe)>>1)) + ext83[i];
>>> +-
>>> +   p = base;
>>> +
>>> +   copy_name(slot->name0_4, 10, &p);
>>> +@@ -1645,8 +1630,7 @@ static int add_file(char *filename, stru
>>> +   /* Get the entry from the root filesytem */
>>> +   entry = &dir->table[dir->count++];
>>> +
>>> +-  strncpy(entry->name, name83, 8);
>>> +-  strncpy(entry->ext, ext83, 3);
>>> ++  strncpy(entry->name, dos_name, MSDOS_NAME);
>>> +
>>> +
>>> +   /* If the user has it read only, then add read only to the
>> incoming
>>> +@@ -1665,7 +1649,7 @@ static int add_file(char *filename, stru
>>> +                                 ((ctime->tm_mon+1) << 5) +
>>> +                                 ((ctime->tm_year-80) << 9)));
>>> +
>>> +-  entry->ctime_ms = 0;
>>> ++  entry->ctime_cs = 0;
>>> +   entry->ctime = entry->time;
>>> +   entry->cdate = entry->date;
>>> +   entry->adate = entry->date;
>>> +@@ -1711,6 +1695,7 @@ static int add_file(char *filename, stru
>>> +
>>> +  exit_add:
>>> +   if (infile) close(infile);
>>> ++  return 0;
>>> + }
>>> +
>>> + /* Add a new directory to the specified directory entry, and in
>> turn populate
>>> +@@ -1727,10 +1712,18 @@ static void add_directory(char *filename
>>> +   struct dirent *dentry = 0;
>>> +   int remain;
>>> +   char *data;
>>> ++  char *base;
>>> ++  char dos_name[MSDOS_NAME+1];
>>> ++  struct msdos_dir_slot *slot;
>>> ++  int i;
>>> ++  char *p;
>>> +
>>> +   /* If the directory doesn't exist */
>>> +-  if (!rddir) return;
>>> +-
>>> ++  if (!rddir) {
>>> ++    printf("Error - dir does not exist: %s\n", filename);
>>> ++    return;
>>> ++  }
>>> ++
>>> +   if (dir->root) {
>>> +     if (dir->count == dir->entries) {
>>> +       printf("Error - too many directory entries\n");
>>> +@@ -1738,28 +1731,58 @@ static void add_directory(char *filename
>>> +     }
>>> +   }
>>> +   else {
>>> +-    if (dir->count == dir->entries) {
>>> +-      if (!dir->table)
>>> +-  dir->table = (struct msdos_dir_entry *) malloc(sizeof(struct
>> msdos_dir_entry));
>>> +-      else {
>>> +-  dir->table = (struct msdos_dir_entry *) realloc(dir->table, (dir-
>>> entries + 1) *
>>> +-                                                  sizeof(struct
>> msdos_dir_entry));
>>> +-
>>> +-  /* Zero it out to avoid issues */
>>> +-  memset(&dir->table[dir->entries], 0, sizeof(struct
>> msdos_dir_entry));
>>> +-      }
>>> +-  dir->entries++;
>>> ++    /* 2 entries, one extra for long name of the directory */
>>> ++    if (!dir->table)
>>> ++      dir->table = (struct msdos_dir_entry *) malloc(2 *
>> sizeof(struct msdos_dir_entry));
>>> ++    else
>>> ++      dir->table = (struct msdos_dir_entry *) realloc(dir->table, 2
>> * (dir->entries + 1) *
>>> ++
>> sizeof(struct msdos_dir_entry));
>>> ++    if (!dir->table) {
>>> ++      printf("Error - memory allocation failed\n");
>>> ++      goto exit_add_dir;
>>> +     }
>>> ++    /* Zero it out to avoid issues */
>>> ++    memset(&dir->table[dir->entries], 0, 2 * sizeof(struct
>> msdos_dir_entry));
>>> ++    dir->entries += 2;
>>> +   }
>>> +
>>> ++  printf("ADD DIR %s\n", filename);
>>> +   /* Now, create a new directory entry for the new directory */
>>> +   newdir = (struct dir_entry *) calloc(1, sizeof(struct
>> dir_entry));
>>> +-  if (!newdir) goto exit_add_dir;
>>> ++  if (!newdir) {
>>> ++    printf("Error - calloc failed\n");
>>> ++    goto exit_add_dir;
>>> ++  }
>>> ++
>>> ++  /* Grab the basename of the file */
>>> ++  base = basename(filename);
>>> ++
>>> ++  /* convert for dos structure  */
>>> ++  copy_filename(base, dos_name);
>>> ++
>>> ++  /* Make an extended name slot */
>>> ++  slot = (struct msdos_dir_slot *) &dir->table[dir->count++];
>>> ++  slot->id = 'A';
>>> ++  slot->attr = 0x0F;
>>> ++  slot->reserved = 0;
>>> ++  slot->start = 0;
>>> ++
>>> ++  slot->alias_checksum = 0;
>>> +
>>> ++  for (i = 0; i < MSDOS_NAME; i++)
>>> ++    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot-
>>> alias_checksum&0xfe)>>1)) + dos_name[i];
>>> ++
>>> ++  p = base;
>>> ++
>>> ++  copy_name(slot->name0_4, 10, &p);
>>> ++  copy_name(slot->name5_10, 12, &p);
>>> ++  copy_name(slot->name11_12, 4, &p);
>>> ++
>>> ++  /* Get the entry from the root filesytem */
>>> +   entry = &dir->table[dir->count++];
>>> +
>>> +-  strncpy(entry->name, basename(filename), sizeof(entry->name));
>>> +-
>>> ++  strncpy(entry->name, dos_name, MSDOS_NAME);
>>> ++
>>> +   entry->attr = ATTR_DIR;
>>> +   ctime = localtime(&create_time);
>>> +
>>> +@@ -1770,25 +1793,32 @@ static void add_directory(char *filename
>>> +                                 ((ctime->tm_mon+1) << 5) +
>>> +                                 ((ctime->tm_year-80) << 9)));
>>> +
>>> +-  entry->ctime_ms = 0;
>>> ++  entry->ctime_cs = 0;
>>> +   entry->ctime = entry->time;
>>> +   entry->cdate = entry->date;
>>> +   entry->adate = entry->date;
>>> +
>>> +   /* Now, read the directory */
>>> +
>>> +-  while((dentry = readdir(rddir))) {
>>> ++
>>> ++  while((base[0] != '.') && (dentry = readdir(rddir))) {
>>> +     struct stat st;
>>> +     char *buffer;
>>> +-
>>> +-    if (!strcmp(dentry->d_name, ".") || !strcmp(dentry->d_name,
>> ".."))
>>> +-      continue;
>>> +
>>> +-    /* DOS wouldn't like a typical unix . (dot) file, so we skip
>> those too */
>>> +-    if (dentry->d_name[0] == '.') continue;
>>> ++    if (dentry->d_name[0] == '.') {
>>> ++        /* dos also has . & .. directory entries */
>>> ++      if (! ((!strcmp(dentry->d_name, ".")) || (!strcmp(dentry-
>>> d_name, "..")))) {
>>> ++        /* ignore other .* files */
>>> ++        printf("Error - File/Dir name is not dos compatible,
>> ignored: %s\n", dentry->d_name);
>>> ++        continue;
>>> ++      }
>>> ++    }
>>> +
>>> +     buffer = malloc(strlen(filename) + strlen(dentry->d_name) + 3);
>>> +-    if (!buffer) continue;
>>> ++    if (!buffer) {
>>> ++        printf("Error - malloc failed\n");
>>> ++        goto exit_add_dir;
>>> ++    }
>>> +
>>> +     sprintf(buffer, "%s/%s", filename, dentry->d_name);
>>> +     if (!stat(buffer, &st)) {
>>> +@@ -1806,11 +1836,23 @@ static void add_directory(char *filename
>>> +   /* Now that the entire directory has been written, go ahead and
>> write the directory
>>> +      entry as well */
>>> +
>>> ++  entry->size = 0; /* a directory has zero size */
>>> ++
>>> ++  if (base[0] == '.')  { /* . & .. point to parent's cluster */
>>> ++    goto exit_add_dir;
>>> ++  }
>>> ++
>>> +   entry->start = CT_LE_W(last_cluster_written);
>>> +   entry->starthi = CT_LE_W((last_cluster_written & 0xFFFF0000) >>
>> 16);
>>> +-  entry->size = newdir->count * sizeof(struct msdos_dir_entry);
>>> ++
>>> ++/* . dir start points to parent */
>>> ++  newdir->table[1].start = entry->start;
>>> ++/* .. dir points to parent of parent*/
>>> ++/* .. dir start is not set yet, would need more changes to the
>> code,
>>> ++ * but dosfsck can fix these .. entry start pointers correctly */
>>> ++
>>> ++  remain = newdir->count * sizeof(struct msdos_dir_entry);
>>> +
>>> +-  remain = entry->size;
>>> +   data = (char *) newdir->table;
>>> +
>>> +   while(remain) {
>>> +@@ -1858,6 +1900,7 @@ static void add_root_directory(char *dir
>>> +
>>> +   if (!newdir) {
>>> +     closedir(dir);
>>> ++    printf("Error - calloc failed!\n");
>>> +     return;
>>> +   }
>>> +
>>> +@@ -1877,7 +1920,10 @@ static void add_root_directory(char *dir
>>> +     if (entry->d_name[0] == '.') continue;
>>> +
>>> +     buffer = malloc(strlen(dirname) + strlen(entry->d_name) + 3);
>>> +-    if (!buffer) continue;
>>> ++    if (!buffer) {
>>> ++        printf("Error - malloc failed!\n");
>>> ++        continue;
>>> ++    }
>>> +
>>> +     sprintf(buffer, "%s/%s", dirname, entry->d_name);
>>> +     if (!stat(buffer, &st)) {
>>> +@@ -2245,6 +2291,9 @@ main (int argc, char **argv)
>>> +   if (check && listfile)  /* Auto and specified bad block handling
>> are mutually */
>>> +     die ("-c and -l are incompatible");           /* exclusive of
>> each other! */
>>> +
>>> ++  if (dirname && (size_fat == 32))
>>> ++    die ("-d is incompatible with FAT32");
>>> ++
>>> +   if (!create) {
>>> +     check_mount (device_name);    /* Is the device already mounted?
>> */
>>> +     dev = open (device_name, O_RDWR);     /* Is it a suitable device to
>> build the FS on? */
>>> diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>> b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>> index 66eeb7c..ec75ac9 100644
>>> --- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>> +++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
>>> @@ -7,7 +7,7 @@ DESCRIPTION = "DOS FAT Filesystem Utilities"
>>>  SECTION = "base"
>>>  LICENSE = "GPLv2"
>>>  LIC_FILES_CHKSUM =
>> "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
>>> -PR = "r3"
>>> +PR = "r4"
>>>
>>>  SRC_URI = "ftp://ftp.uni-
>> erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
>>>             file://mkdosfs-bootcode.patch \
>>> @@ -16,7 +16,8 @@ SRC_URI = "ftp://ftp.uni-
>> erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}
>>>             file://msdos_fat12_undefined.patch \
>>>             file://dosfstools-msdos_fs-types.patch \
>>>             file://include-linux-types.patch \
>>> -           file://nofat32_autoselect.patch "
>>> +           file://nofat32_autoselect.patch \
>>> +           file://fix_populated_dosfs_creation.patch "
>>>
>>>  SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
>>>  SRC_URI[sha256sum] =
>> "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
>>
>> --
>> Darren Hart
>> Intel Open Source Technology Center
>> Yocto Project - Linux Kernel

-- 
Darren Hart
Intel Open Source Technology Center
Yocto Project - Linux Kernel


