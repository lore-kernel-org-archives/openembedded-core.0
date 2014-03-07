Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D64D36F67F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276xubn016408
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:56 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:56 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:30 -0500
Message-ID: <882f5870d08e3036ad38b16216feed332a7f89eb.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 09/14] e2fsprogs: mke2fs: handle hardlinks
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:56 -0000
Content-Type: text/plain

Create the inode and save the native inode number when we meet the hard
link (st_nlink > 1) at the first time, use ext2fs_link() to link the
name to the target inode number when we meet the same native inode
number again.

This algorithm is referred from the genext2fs.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ...0009-misc-create_inode.c-handle-hardlinks.patch |  210 ++++++++++++++++++++
 1 file changed, 210 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
new file mode 100644
index 0000000..a330ee4
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0009-misc-create_inode.c-handle-hardlinks.patch
@@ -0,0 +1,210 @@
+From d83dc950b3ec1fbde33b23d42c5154091a74f4d9 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 23 Dec 2013 03:44:03 -0500
+Subject: [PATCH 09/11] misc/create_inode.c: handle hardlinks
+
+Create the inode and save the native inode number when we meet the hard
+link (st_nlink > 1) at the first time, use ext2fs_link() to link the
+name to the target inode number when we meet the same native inode
+number again.
+
+This algorithm is referred from the genext2fs.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/create_inode.c |   88 +++++++++++++++++++++++++++++++++++++++++++++++++++
+ misc/create_inode.h |   18 +++++++++++
+ misc/mke2fs.c       |   12 +++++++
+ 3 files changed, 118 insertions(+)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index aad7354..763504d 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -18,6 +18,44 @@
+ #define S_BLKSIZE 512
+ #endif
+ 
++/* For saving the hard links */
++int hdlink_cnt = HDLINK_CNT;
++
++/* Link an inode number to a directory */
++static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *name)
++{
++	struct ext2_inode	inode;
++	errcode_t		retval;
++
++	retval = ext2fs_read_inode(current_fs, ino, &inode);
++        if (retval) {
++		com_err(__func__, retval, "while reading inode %u", ino);
++		return retval;
++	}
++
++	retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, parent_ino);
++		if (retval) {
++			com_err(__func__, retval, "while expanding directory");
++			return retval;
++		}
++		retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
++	}
++	if (retval) {
++		com_err(__func__, retval, "while linking %s", name);
++		return retval;
++	}
++
++	inode.i_links_count++;
++
++	retval = ext2fs_write_inode(current_fs, ino, &inode);
++	if (retval)
++		com_err(__func__, retval, "while writing inode %u", ino);
++
++	return retval;
++}
++
+ /* Fill the uid, gid, mode and time for the inode */
+ static void fill_inode(struct ext2_inode *inode, struct stat *st)
+ {
+@@ -278,6 +316,17 @@ fail:
+ 	return retval;
+ }
+ 
++int is_hardlink(ext2_ino_t ino)
++{
++	int i;
++
++	for(i = 0; i < hdlinks.count; i++) {
++		if(hdlinks.hdl[i].src_ino == ino)
++			return i;
++	}
++	return -1;
++}
++
+ /* Copy the native file to the fs */
+ errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
+ {
+@@ -388,9 +437,11 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 	struct dirent	*dent;
+ 	struct stat	st;
+ 	char		ln_target[PATH_MAX];
++	unsigned int	save_inode;
+ 	ext2_ino_t	ino;
+ 	errcode_t	retval;
+ 	int		read_cnt;
++	int		hdlink;
+ 
+ 	root = EXT2_ROOT_INO;
+ 
+@@ -412,6 +463,22 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 		lstat(dent->d_name, &st);
+ 		name = dent->d_name;
+ 
++		/* Check for hardlinks */
++		save_inode = 0;
++		if (!S_ISDIR(st.st_mode) && !S_ISLNK(st.st_mode) && st.st_nlink > 1) {
++			hdlink = is_hardlink(st.st_ino);
++			if (hdlink >= 0) {
++				retval = add_link(parent_ino,
++						hdlinks.hdl[hdlink].dst_ino, name);
++				if (retval) {
++					com_err(__func__, retval, "while linking %s", name);
++					return retval;
++				}
++				continue;
++			} else
++				save_inode = 1;
++		}
++
+ 		switch(st.st_mode & S_IFMT) {
+ 			case S_IFCHR:
+ 			case S_IFBLK:
+@@ -480,6 +547,27 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 				_("while setting inode for \"%s\""), name);
+ 			return retval;
+ 		}
++
++		/* Save the hardlink ino */
++		if (save_inode) {
++			/*
++			 * Check whether need more memory, and we don't need
++			 * free() since the lifespan will be over after the fs
++			 * populated.
++			 */
++			if (hdlinks.count == hdlink_cnt) {
++				if ((hdlinks.hdl = realloc (hdlinks.hdl,
++						(hdlink_cnt + HDLINK_CNT) *
++						sizeof (struct hdlink_s))) == NULL) {
++					com_err(name, errno, "Not enough memory");
++					return errno;
++				}
++				hdlink_cnt += HDLINK_CNT;
++			}
++			hdlinks.hdl[hdlinks.count].src_ino = st.st_ino;
++			hdlinks.hdl[hdlinks.count].dst_ino = ino;
++			hdlinks.count++;
++		}
+ 	}
+ 	closedir(dh);
+ 	return retval;
+diff --git a/misc/create_inode.h b/misc/create_inode.h
+index 9fc97fa..2b6d429 100644
+--- a/misc/create_inode.h
++++ b/misc/create_inode.h
+@@ -6,9 +6,27 @@
+ #include "ext2fs/ext2fs.h"
+ #include "nls-enable.h"
+ 
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
+ ext2_filsys    current_fs;
+ ext2_ino_t     root;
+ 
++/* For saving the hard links */
++#define HDLINK_CNT     4
++extern int hdlink_cnt;
++
+ /* For populating the filesystem */
+ extern errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir);
+ extern errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st);
+diff --git a/misc/mke2fs.c b/misc/mke2fs.c
+index 578b62d..a63f0b7 100644
+--- a/misc/mke2fs.c
++++ b/misc/mke2fs.c
+@@ -2730,6 +2730,18 @@ no_journal:
+ 		if (!quiet)
+ 			printf("%s", _("Copying files into the device: "));
+ 
++		/*
++		 * Allocate memory for the hardlinks, we don't need free()
++		 * since the lifespan will be over after the fs populated.
++		 */
++		if ((hdlinks.hdl = (struct hdlink_s *)
++				malloc(hdlink_cnt * sizeof(struct hdlink_s))) == NULL) {
++			fprintf(stderr, "%s", _("\nNot enough memory\n"));
++			retval = ext2fs_close(fs);
++			return retval;
++		}
++
++		hdlinks.count = 0;
+ 		current_fs = fs;
+ 		root = EXT2_ROOT_INO;
+ 		retval = populate_fs(root, root_dir);
+-- 
+1.7.10.4
+
-- 
1.7.10.4


