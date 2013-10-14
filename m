Return-Path: <ml@communistcode.co.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 968E66CC8A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Oct 2013 09:56:07 +0000 (UTC)
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Oct 2013 10:55:59 +0100
Message-Id: <1381744559-13690-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.8.4
Cc: Jack Mitchell <jmitchell@cbnl.com>
Subject: [PATCH] grub: add patch to support 256 byte inodes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Oct 2013 09:56:09 -0000

From: Jack Mitchell <jmitchell@cbnl.com>

This patch is originally from oe-classic, it seemed to
have been dropped in the transition for some reason.
However I needed this patch to boot a system with 256 byte
inodes.

Signed-off-by: Jack Mitchell <jmitchell@cbnl.com>
---
 .../grub-0.97/grub-support-256byte-inode.patch     | 101 +++++++++++++++++++++
 meta/recipes-bsp/grub/grub_0.97.bb                 |  11 ++-
 2 files changed, 107 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch

diff --git a/meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch b/meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch
new file mode 100644
index 0000000..d225d13
--- /dev/null
+++ b/meta/recipes-bsp/grub/grub-0.97/grub-support-256byte-inode.patch
@@ -0,0 +1,101 @@
+Upstream-Status: Inappropriate [No Longer Maintained]
+
+diff -Naur grub-0.97-800/stage2/fsys_ext2fs.c grub-0.97-810/stage2/fsys_ext2fs.c
+--- grub-0.97-800/stage2/fsys_ext2fs.c	2008-07-21 00:40:21.668879475 -0600
++++ grub-0.97-810/stage2/fsys_ext2fs.c	2008-07-21 01:01:11.063953773 -0600
+@@ -79,7 +79,52 @@
+     __u32 s_rev_level;		/* Revision level */
+     __u16 s_def_resuid;		/* Default uid for reserved blocks */
+     __u16 s_def_resgid;		/* Default gid for reserved blocks */
+-    __u32 s_reserved[235];	/* Padding to the end of the block */
++    /*
++     * These fields are for EXT2_DYNAMIC_REV superblocks only.
++     *
++     * Note: the difference between the compatible feature set and
++     * the incompatible feature set is that if there is a bit set
++     * in the incompatible feature set that the kernel doesn't
++     * know about, it should refuse to mount the filesystem.
++     *
++     * e2fsck's requirements are more strict; if it doesn't know
++     * about a feature in either the compatible or incompatible
++     * feature set, it must abort and not try to meddle with
++     * things it doesn't understand...
++     */
++    __u32 s_first_ino;		/* First non-reserved inode */
++    __u16 s_inode_size;		/* size of inode structure */
++    __u16 s_block_group_nr;	/* block group # of this superblock */
++    __u32 s_feature_compat;	/* compatible feature set */
++    __u32 s_feature_incompat;	/* incompatible feature set */
++    __u32 s_feature_ro_compat;	/* readonly-compatible feature set */
++    __u8  s_uuid[16];		/* 128-bit uuid for volume */
++    char  s_volume_name[16];	/* volume name */
++    char  s_last_mounted[64];	/* directory where last mounted */
++    __u32 s_algorithm_usage_bitmap; /* For compression */
++    /*
++     * Performance hints.  Directory preallocation should only
++     * happen if the EXT2_FEATURE_COMPAT_DIR_PREALLOC flag is on.
++     */
++    __u8  s_prealloc_blocks;	/* Nr of blocks to try to preallocate*/
++    __u8  s_prealloc_dir_blocks;	/* Nr to preallocate for dirs */
++    __u16 s_reserved_gdt_blocks;/* Per group table for online growth */
++    /*
++     * Journaling support valid if EXT2_FEATURE_COMPAT_HAS_JOURNAL set.
++     */
++    __u8 s_journal_uuid[16];	/* uuid of journal superblock */
++    __u32 s_journal_inum;	/* inode number of journal file */
++    __u32 s_journal_dev;	/* device number of journal file */
++    __u32 s_last_orphan;	/* start of list of inodes to delete */
++    __u32 s_hash_seed[4];	/* HTREE hash seed */
++    __u8  s_def_hash_version;	/* Default hash version to use */
++    __u8  s_jnl_backup_type; 	/* Default type of journal backup */
++    __u16 s_reserved_word_pad;
++    __u32 s_default_mount_opts;
++    __u32 s_first_meta_bg;	/* First metablock group */
++    __u32 s_mkfs_time;		/* When the filesystem was created */
++    __u32 s_jnl_blocks[17]; 	/* Backup of the journal inode */
++    __u32 s_reserved[172];	/* Padding to the end of the block */
+   };
+ 
+ struct ext2_group_desc
+@@ -218,6 +263,14 @@
+ #define EXT2_ADDR_PER_BLOCK(s)          (EXT2_BLOCK_SIZE(s) / sizeof (__u32))
+ #define EXT2_ADDR_PER_BLOCK_BITS(s)		(log2(EXT2_ADDR_PER_BLOCK(s)))
+ 
++#define EXT2_GOOD_OLD_REV   0   /* The good old (original) format */
++#define EXT2_DYNAMIC_REV    1   /* V2 format w/ dynamic inode sizes */
++#define EXT2_GOOD_OLD_INODE_SIZE 128
++#define EXT2_INODE_SIZE(s)  (((s)->s_rev_level == EXT2_GOOD_OLD_REV) ? \
++                 EXT2_GOOD_OLD_INODE_SIZE : \
++                 (s)->s_inode_size)
++#define EXT2_INODES_PER_BLOCK(s)	(EXT2_BLOCK_SIZE(s)/EXT2_INODE_SIZE(s))
++
+ /* linux/ext2_fs.h */
+ #define EXT2_BLOCK_SIZE_BITS(s)        ((s)->s_log_block_size + 10)
+ /* kind of from ext2/super.c */
+@@ -553,7 +606,7 @@
+       gdp = GROUP_DESC;
+       ino_blk = gdp[desc].bg_inode_table +
+ 	(((current_ino - 1) % (SUPERBLOCK->s_inodes_per_group))
+-	 >> log2 (EXT2_BLOCK_SIZE (SUPERBLOCK) / sizeof (struct ext2_inode)));
++	 >> log2 (EXT2_INODES_PER_BLOCK (SUPERBLOCK)));
+ #ifdef E2DEBUG
+       printf ("inode table fsblock=%d\n", ino_blk);
+ #endif /* E2DEBUG */
+@@ -565,13 +618,12 @@
+       /* reset indirect blocks! */
+       mapblock2 = mapblock1 = -1;
+ 
+-      raw_inode = INODE +
+-	((current_ino - 1)
+-	 & (EXT2_BLOCK_SIZE (SUPERBLOCK) / sizeof (struct ext2_inode) - 1));
++      raw_inode = (struct ext2_inode *)((char *)INODE +
++	((current_ino - 1) & (EXT2_INODES_PER_BLOCK (SUPERBLOCK) - 1)) *
++	EXT2_INODE_SIZE (SUPERBLOCK));
+ #ifdef E2DEBUG
+       printf ("ipb=%d, sizeof(inode)=%d\n",
+-	      (EXT2_BLOCK_SIZE (SUPERBLOCK) / sizeof (struct ext2_inode)),
+-	      sizeof (struct ext2_inode));
++	      EXT2_INODES_PER_BLOCK (SUPERBLOCK), EXT2_INODE_SIZE (SUPERBLOCK));
+       printf ("inode=%x, raw_inode=%x\n", INODE, raw_inode);
+       printf ("offset into inode table block=%d\n", (int) raw_inode - (int) INODE);
+       for (i = (unsigned char *) INODE; i <= (unsigned char *) raw_inode;
diff --git a/meta/recipes-bsp/grub/grub_0.97.bb b/meta/recipes-bsp/grub/grub_0.97.bb
index 38f3912..376244e 100644
--- a/meta/recipes-bsp/grub/grub_0.97.bb
+++ b/meta/recipes-bsp/grub/grub_0.97.bb
@@ -13,11 +13,12 @@ RDEPENDS_${PN} = "diffutils"
 PR = "r6"
 
 SRC_URI = "ftp://alpha.gnu.org/gnu/grub/grub-${PV}.tar.gz; \
-            file://no-reorder-functions.patch \
-            file://autohell.patch \
-            file://grub_fix_for_automake-1.12.patch \
-            file://objcopy-absolute.patch \
-            "
+           file://no-reorder-functions.patch \
+           file://autohell.patch \
+           file://grub_fix_for_automake-1.12.patch \
+           file://objcopy-absolute.patch \
+           file://grub-support-256byte-inode.patch \
+"
 
 SRC_URI[md5sum] = "cd3f3eb54446be6003156158d51f4884"
 SRC_URI[sha256sum] = "4e1d15d12dbd3e9208111d6b806ad5a9857ca8850c47877d36575b904559260b"
-- 
1.8.4


