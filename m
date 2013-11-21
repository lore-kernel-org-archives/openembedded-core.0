Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 903236DB81
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EBF9025086
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:11 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:10 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:47 -0600
Message-ID: <1385018038-23380-2-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 01/12] e2fsprogs/mke2fs: add an option: -d root-directory
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:11 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

This option is used for adding the files from the root-directory to the
filesystem, it is similiar to genext2fs, but genext2fs doesn't fully
support ext4.

This commit describes the skeleton of the implementation:
* The "struct hdlink_s" will be used for saving hard links, I
  referred this from the genext2fs.

* The do_xxx_internal will be used by both mke2fs and debugfs, most of
  their operations are similar.

* Fix the location of ext2fs_close() to make the "make check" succeed.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...1-mke2fs.c-add-an-option-d-root-directory.patch | 206 +++++++++++++++++++++
 1 file changed, 206 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0001-mke2fs.c-add-an-option-d-root-directory.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0001-mke2fs.c-add-an-option-d-root-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0001-mke2fs.c-add-an-option-d-root-directory.patch
new file mode 100644
index 0000000..ed58a53
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0001-mke2fs.c-add-an-option-d-root-directory.patch
@@ -0,0 +1,206 @@
+From d1297281c1955a6159129bb111b0a70c93f88c7c Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Sat, 9 Nov 2013 21:51:09 +0800
+Subject: [PATCH] mke2fs.c: add an option: -d root-directory
+
+This option is used for adding the files from the root-directory to the
+filesystem, it is similiar to genext2fs, but genext2fs doesn't fully
+support ext4.
+
+This commit describes the skeleton of the implementation:
+* The "struct hdlink_s" will be used for saving hard links, I
+  referred this from the genext2fs.
+
+* The do_xxx_internal will be used by both mke2fs and debugfs, most of
+  their operations are similar.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/mke2fs.c | 35 +++++++++++++++++++++++++++++++----
+ misc/util.c   | 35 +++++++++++++++++++++++++++++++++++
+ misc/util.h   | 32 ++++++++++++++++++++++++++++++++
+ 3 files changed, 98 insertions(+), 4 deletions(-)
+
+diff --git a/misc/mke2fs.c b/misc/mke2fs.c
+index 22c2815..75abf83 100644
+--- a/misc/mke2fs.c
++++ b/misc/mke2fs.c
+@@ -44,8 +44,6 @@ extern int optind;
+ #include <errno.h>
+ #endif
+ #include <sys/ioctl.h>
+-#include <sys/types.h>
+-#include <sys/stat.h>
+ #include <libgen.h>
+ #include <limits.h>
+ #include <blkid/blkid.h>
+@@ -105,6 +103,7 @@ char *mount_dir;
+ char *journal_device;
+ int sync_kludge;	/* Set using the MKE2FS_SYNC env. option */
+ char **fs_types;
++const char *root_dir;  /* Copy files from the specified directory */
+ 
+ profile_t	profile;
+ 
+@@ -116,7 +115,8 @@ static void usage(void)
+ 	fprintf(stderr, _("Usage: %s [-c|-l filename] [-b block-size] "
+ 	"[-C cluster-size]\n\t[-i bytes-per-inode] [-I inode-size] "
+ 	"[-J journal-options]\n"
+-	"\t[-G flex-group-size] [-N number-of-inodes]\n"
++	"\t[-G flex-group-size] [-N number-of-inodes] "
++	"[-d root-directory]\n"
+ 	"\t[-m reserved-blocks-percentage] [-o creator-os]\n"
+ 	"\t[-g blocks-per-group] [-L volume-label] "
+ 	"[-M last-mounted-directory]\n\t[-O feature[,...]] "
+@@ -1346,7 +1346,7 @@ profile_error:
+ 	}
+ 
+ 	while ((c = getopt (argc, argv,
+-		    "b:cg:i:jl:m:no:qr:s:t:vC:DE:FG:I:J:KL:M:N:O:R:ST:U:V")) != EOF) {
++		    "b:cg:i:jl:m:no:qr:s:t:d:vC:DE:FG:I:J:KL:M:N:O:R:ST:U:V")) != EOF) {
+ 		switch (c) {
+ 		case 'b':
+ 			blocksize = parse_num_blocks2(optarg, -1);
+@@ -1532,6 +1532,9 @@ profile_error:
+ 		case 'U':
+ 			fs_uuid = optarg;
+ 			break;
++		case 'd':
++			root_dir = optarg;
++			break;
+ 		case 'v':
+ 			verbose = 1;
+ 			break;
+@@ -2665,6 +2668,30 @@ no_journal:
+ 				       EXT4_FEATURE_RO_COMPAT_QUOTA))
+ 		create_quota_inodes(fs);
+ 
++	/* Copy files from the specified directory */
++	if (root_dir) {
++		if (!quiet)
++			printf(_("Copying files into the device...\n"));
++
++		/*
++		 * Allocate memory for the hardlinks, we don't need free()
++		 * since the lifespan will be over after the fs populated.
++		 */
++		if ((hdlinks.hdl = (struct hdlink_s *)
++				malloc(hdlink_cnt * sizeof(struct hdlink_s))) == NULL) {
++			fprintf(stderr, _("\nNot enough memory"));
++			retval = ext2fs_close(fs);
++			return retval;
++		}
++
++		current_fs = fs;
++		root = EXT2_ROOT_INO;
++		retval = populate_fs(root, root_dir);
++		if (retval)
++			fprintf(stderr,
++				_("\nError while populating %s"), root_dir);
++	}
++
+ 	if (!quiet)
+ 		printf(_("Writing superblocks and "
+ 		       "filesystem accounting information: "));
+diff --git a/misc/util.c b/misc/util.c
+index 6c93e1c..cbc7cc0 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -32,8 +32,18 @@
+ #include "ext2fs/ext2fs.h"
+ #include "nls-enable.h"
+ #include "blkid/blkid.h"
++
++#include <fcntl.h>
++
+ #include "util.h"
+ 
++int	journal_size;
++int	journal_flags;
++char	*journal_device;
++
++/* For saving the hard links */
++int hdlink_cnt = HDLINK_CNT;
++
+ #ifndef HAVE_STRCASECMP
+ int strcasecmp (char *s1, char *s2)
+ {
+@@ -303,3 +313,28 @@ void dump_mmp_msg(struct mmp_struct *mmp, const char *msg)
+ 		       ctime(&t), mmp->mmp_nodename, mmp->mmp_bdevname);
+ 	}
+ }
++
++/* Make a special file which is block, character and fifo */
++errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
++{
++}
++
++/* Make a symlink name -> target */
++errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target)
++{
++}
++
++/* Make a directory in the fs */
++errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
++{
++}
++
++/* Copy the native file to the fs */
++errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
++{
++}
++
++/* Copy files from source_dir to fs */
++errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
++{
++}
+diff --git a/misc/util.h b/misc/util.h
+index f872c38..e71caf0 100644
+--- a/misc/util.h
++++ b/misc/util.h
+@@ -14,6 +14,31 @@ extern int	 journal_size;
+ extern int	 journal_flags;
+ extern char	*journal_device;
+ 
++/* For struct stat */
++#include <sys/types.h>
++#include <sys/stat.h>
++
++struct hdlink_s
++{
++	ext2_ino_t src_ino;
++	ext2_ino_t dst_ino;
++};
++
++struct hdlinks_s
++{
++	int count;
++	struct hdlink_s *hdl;
++};
++
++struct hdlinks_s hdlinks;
++
++ext2_filsys	current_fs;
++ext2_ino_t	root;
++
++/* For saving the hard links */
++#define HDLINK_CNT	4
++extern int hdlink_cnt;
++
+ #ifndef HAVE_STRCASECMP
+ extern int strcasecmp (char *s1, char *s2);
+ #endif
+@@ -25,3 +50,10 @@ extern void check_mount(const char *device, int force, const char *type);
+ extern unsigned int figure_journal_size(int size, ext2_filsys fs);
+ extern void print_check_message(int, unsigned int);
+ extern void dump_mmp_msg(struct mmp_struct *mmp, const char *msg);
++
++/* For populating the filesystem */
++extern errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir);
++extern errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st);
++extern errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target);
++extern errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st);
++extern errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest);
+-- 
+1.8.3.1
+
-- 
1.8.1.2.545.g2f19ada


