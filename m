Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <nitin.a.kamble@intel.com>) id 1RatnN-0008JZ-Vh
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Dec 2011 19:43:14 +0100
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 14 Dec 2011 10:36:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,352,1309762800"; d="scan'208";a="86569472"
Received: from nbuild0.sc.intel.com ([172.25.110.36])
	by orsmga001.jf.intel.com with ESMTP; 14 Dec 2011 10:36:15 -0800
From: nitin.a.kamble@intel.com
To: dvhart@linux.intel.com,
	openembedded-core@lists.openembedded.org
Date: Wed, 14 Dec 2011 10:36:12 -0800
Message-Id: <a7a877a6c2bdfd11d0ded12207845d88375c1d99.1323887657.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.7.6.4
In-Reply-To: <cover.1323887657.git.nitin.a.kamble@intel.com>
References: <cover.1323887657.git.nitin.a.kamble@intel.com>
Subject: [PATCH 1/1] dosfstools: fix populated image creation with dirs
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
X-List-Received-Date: Wed, 14 Dec 2011 18:43:14 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

This fixes bug: [YOCTO #1783]

Fix populated image creation. Earlier subdirectories support
was broken, and files can only be placed in the root directory.
Now directory hirarchy is supported in the image. Also support
for long names is extended to directory names.

Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
---
 .../dosfstools/fix_populated_dosfs_creation.patch  |  233 ++++++++++++++++++++
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    5 +-
 2 files changed, 236 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch

diff --git a/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch b/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
new file mode 100644
index 0000000..ab2e9bc
--- /dev/null
+++ b/meta/recipes-devtools/dosfstools/dosfstools/fix_populated_dosfs_creation.patch
@@ -0,0 +1,233 @@
+UpstreamStatus: Inappropriate
+
+This patch fixes populated dosfs image creation with directory 
+structures. Earlier it was causing segfault; and only image 
+population with no subdirectories was working.
+
+Issues fixed:
+1. (dir->count == dir->entries) check was only needed for root 
+   directory entries. And this check is wrong for non-root 
+   directories.
+2. For each dir entry 2 dir->table entries were needed, one for 
+   the file/dir and 2nd for long file name support. Earlier long
+   name support was added for filenames but the 2nd entry 
+   allocation, initialization & counting was missed.
+3. The memory clearing was missed at the code path after dir->table 
+   memroy allocation.
+
+Enhancements:
+1. Added support for long names for directory names. This is same
+   as the existing long name support for filenames.
+2. Added error messages for previously silent memory allocation and 
+   other errors.
+3. -d options does not work correctly with fat32, so now throwing 
+   an error for that.
+
+Signed-Of-By: Nitin A Kamble <nitin.a.kamble@intel.com> 
+2011/12/13
+
+
+Index: dosfstools-2.11/mkdosfs/mkdosfs.c
+===================================================================
+--- dosfstools-2.11.orig/mkdosfs/mkdosfs.c
++++ dosfstools-2.11/mkdosfs/mkdosfs.c
+@@ -21,7 +21,17 @@
+    June 2004 - Jordan Crouse (info.linux@amd.com)
+    Added -d <directory> support to populate the image
+    Copyright (C) 2004, Advanced Micro Devices, All Rights Reserved
+-   
++
++   2011-12-13: Nitin A Kamble <nitin.a.kamble@intel.com>
++   Enhanced the -d <directory> support for population of image while
++   creation. Earlier subdirectores support was broken, only files in
++   the rootdir were supported. Now directory hirarchy is supported.
++   Also added long filename support to directory names.
++     The -d <directory> option (image population while creation)
++   is broken with fat32.
++   Copyright (C) 2011, Intel Corporation, All Rights Reserved
++
++
+    Fixes/additions May 1998 by Roman Hodek
+    <Roman.Hodek@informatik.uni-erlangen.de>:
+    - Atari format support
+@@ -1562,23 +1572,22 @@ static int add_file(char *filename, stru
+   if (dir->root) {
+     if (dir->count == dir->entries) {
+       printf("Error - too many directory entries\n");
++      return;
+     }
+   }
+   else {
+-    if (dir->count == dir->entries) {
+-      if (!dir->table) 
+-	dir->table = 
+-	  (struct msdos_dir_entry *) malloc(sizeof(struct msdos_dir_entry));
+-      else {
+-	dir->table = 
+-	  (struct msdos_dir_entry *) realloc(dir->table, (dir->entries + 1) * 
+-					     sizeof(struct msdos_dir_entry));
+-
+-	memset(&dir->table[dir->entries], 0, sizeof(struct msdos_dir_entry));
+-      }
+-
+-      dir->entries++;
+-    }
++    /* 2 entries, one extra for long filename */
++    if (!dir->table)
++      dir->table =
++        (struct msdos_dir_entry *) malloc(2 * sizeof(struct msdos_dir_entry));
++    else
++      dir->table =
++        (struct msdos_dir_entry *) realloc(dir->table, 2 * (dir->entries + 1) *
++      				     sizeof(struct msdos_dir_entry));
++    if (!dir->table)
++      printf("Error - realloc failed\n");
++    memset(&dir->table[dir->entries], 0, 2 * sizeof(struct msdos_dir_entry));
++    dir->entries += 2;
+   }
+ 
+   infile = open(filename, O_RDONLY, 0);
+@@ -1727,10 +1736,18 @@ static void add_directory(char *filename
+   struct dirent *dentry = 0;
+   int remain;
+   char *data;
++  char *base;
++  char name83[8], ext83[3];
++  struct msdos_dir_slot *slot;
++  int i;
++  char *p;
+ 
+   /* If the directory doesn't exist */
+-  if (!rddir) return;
+-  
++  if (!rddir) {
++    printf("Error - dir does not exist: %s\n", filename);
++    return;
++  }
++
+   if (dir->root) {
+     if (dir->count == dir->entries) {
+       printf("Error - too many directory entries\n");
+@@ -1738,28 +1755,66 @@ static void add_directory(char *filename
+     }
+   }
+   else {
+-    if (dir->count == dir->entries) {
+-      if (!dir->table) 
+-	dir->table = (struct msdos_dir_entry *) malloc(sizeof(struct msdos_dir_entry));
+-      else {
+-	dir->table = (struct msdos_dir_entry *) realloc(dir->table, (dir->entries + 1) * 
+-							sizeof(struct msdos_dir_entry));
+-
+-	/* Zero it out to avoid issues */
+-	memset(&dir->table[dir->entries], 0, sizeof(struct msdos_dir_entry));
+-      }
+-	dir->entries++;
++    /* 2 entries, one extra for long name of the directory */
++    if (!dir->table)
++      dir->table = (struct msdos_dir_entry *) malloc(2 * sizeof(struct msdos_dir_entry));
++    else
++      dir->table = (struct msdos_dir_entry *) realloc(dir->table, 2 * (dir->entries + 1) *
++                                                             sizeof(struct msdos_dir_entry));
++    if (!dir->table) {
++      printf("Error - memory allocation failed\n");
++      goto exit_add_dir;
+     }
++    /* Zero it out to avoid issues */
++    memset(&dir->table[dir->entries], 0, 2 * sizeof(struct msdos_dir_entry));
++    dir->entries += 2;
+   }
+ 
+   /* Now, create a new directory entry for the new directory */
+   newdir = (struct dir_entry *) calloc(1, sizeof(struct dir_entry));
+-  if (!newdir) goto exit_add_dir;
++  if (!newdir) {
++    printf("Error - calloc failed\n");
++    goto exit_add_dir;
++  }
++  newdir->table = NULL;
++  newdir->entries = 0;
++  newdir->root = 0;
++  newdir->count = 0;
+ 
++
++  /* Grab the basename of the file */
++  base = basename(filename);
++
++  /* Extract out the 8.3 name */
++  copy_filename(base, name83, ext83);
++
++  /* Make an extended name slot */
++  slot = (struct msdos_dir_slot *) &dir->table[dir->count++];
++  slot->id = 'A';
++  slot->attr = 0x0F;
++  slot->reserved = 0;
++  slot->start = 0;
++
++  slot->alias_checksum = 0;
++
++  for (i = 0; i < 8; i++)
++    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + name83[i];
++
++  for (i = 0; i < 3; i++)
++    slot->alias_checksum = (((slot->alias_checksum&1)<<7)|((slot->alias_checksum&0xfe)>>1)) + ext83[i];
++
++  p = base;
++
++  copy_name(slot->name0_4, 10, &p);
++  copy_name(slot->name5_10, 12, &p);
++  copy_name(slot->name11_12, 4, &p);
++
++  /* Get the entry from the root filesytem */
+   entry = &dir->table[dir->count++];
+ 
+-  strncpy(entry->name, basename(filename), sizeof(entry->name));
+-  
++  strncpy(entry->name, name83, 8);
++  strncpy(entry->ext, ext83, 3);
++
+   entry->attr = ATTR_DIR;
+   ctime = localtime(&create_time);
+ 
+@@ -1788,7 +1843,10 @@ static void add_directory(char *filename
+     if (dentry->d_name[0] == '.') continue;
+ 
+     buffer = malloc(strlen(filename) + strlen(dentry->d_name) + 3);
+-    if (!buffer) continue;
++    if (!buffer) {
++        printf("Error - malloc failed\n");
++        goto exit_add_dir;
++    }
+     
+     sprintf(buffer, "%s/%s", filename, dentry->d_name);
+     if (!stat(buffer, &st)) {
+@@ -1858,6 +1916,7 @@ static void add_root_directory(char *dir
+ 
+   if (!newdir) {
+     closedir(dir);
++    printf("Error - calloc failed!\n");
+     return;
+   }
+ 
+@@ -1877,7 +1936,10 @@ static void add_root_directory(char *dir
+     if (entry->d_name[0] == '.') continue;
+  
+     buffer = malloc(strlen(dirname) + strlen(entry->d_name) + 3);
+-    if (!buffer) continue;
++    if (!buffer) {
++        printf("Error - malloc failed!\n");
++        continue;
++    }
+ 
+     sprintf(buffer, "%s/%s", dirname, entry->d_name);
+     if (!stat(buffer, &st)) {
+@@ -2245,6 +2307,9 @@ main (int argc, char **argv)
+   if (check && listfile)	/* Auto and specified bad block handling are mutually */
+     die ("-c and -l are incompatible");		/* exclusive of each other! */
+ 
++  if (dirname && (size_fat == 32))
++    die ("-d is incompatible with FAT32");
++
+   if (!create) {
+     check_mount (device_name);	/* Is the device already mounted? */
+     dev = open (device_name, O_RDWR);	/* Is it a suitable device to build the FS on? */
diff --git a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
index 66eeb7c..ec75ac9 100644
--- a/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
+++ b/meta/recipes-devtools/dosfstools/dosfstools_2.11.bb
@@ -7,7 +7,7 @@ DESCRIPTION = "DOS FAT Filesystem Utilities"
 SECTION = "base"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://mkdosfs/COPYING;md5=cbe67f08d6883bff587f615f0cc81aa8"
-PR = "r3"
+PR = "r4"
 
 SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}.src.tar.gz \
            file://mkdosfs-bootcode.patch \
@@ -16,7 +16,8 @@ SRC_URI = "ftp://ftp.uni-erlangen.de/pub/Linux/LOCAL/dosfstools/dosfstools-${PV}
            file://msdos_fat12_undefined.patch \
            file://dosfstools-msdos_fs-types.patch \
            file://include-linux-types.patch \
-           file://nofat32_autoselect.patch "
+           file://nofat32_autoselect.patch \
+           file://fix_populated_dosfs_creation.patch "
 
 SRC_URI[md5sum] = "407d405ade410f7597d364ab5dc8c9f6"
 SRC_URI[sha256sum] = "0eac6d12388b3d9ed78684529c1b0d9346fa2abbe406c4d4a3eb5a023c98a484"
-- 
1.7.6.4



