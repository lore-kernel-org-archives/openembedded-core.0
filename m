Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CBDFC6D4ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:32 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EVOG025168
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:32 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:31 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:54 -0600
Message-ID: <1385018038-23380-9-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 08/12] e2fsprogs/mke2fs: handle hardlinks
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:33 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Create the file and save the source inode number when we meet the hard
link at the first time, use ext2fs_link() to link the name to the target
inode number when we meet the same source inode number again.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0008-misc-util.c-handle-hardlinks.patch        | 145 +++++++++++++++++++++
 1 file changed, 145 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0008-misc-util.c-handle-hardlinks.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0008-misc-util.c-handle-hardlinks.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0008-misc-util.c-handle-hardlinks.patch
new file mode 100644
index 0000000..4309cb1
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0008-misc-util.c-handle-hardlinks.patch
@@ -0,0 +1,145 @@
+From 9d9c23a0614c33891ec459afdfeb201425c3c4bb Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Aug 2013 10:27:05 +0800
+Subject: [rootdir 08/10] misc/util.c: handle hardlinks
+
+Create the file and save the source inode number when we meet the hard
+link at the first time, use ext2fs_link() to link the name to the target
+inode number when we meet the same source inode number again.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |   85 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 85 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index 1a0a58c..11134db 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -314,6 +314,42 @@ void dump_mmp_msg(struct mmp_struct *mmp, const char *msg)
+ 	}
+ }
+ 
++/* Link an inode number to a directory */
++static errcode_t add_link(ext2_ino_t parent_ino, ext2_ino_t ino, const char *name)
++{
++	struct ext2_inode	inode;
++	errcode_t		retval;
++	char			*func_name = "add_to_dir";
++
++	retval = ext2fs_read_inode(current_fs, ino, &inode);
++        if (retval) {
++		com_err(func_name, retval, "while reading inode %u", ino);
++		return retval;
++	}
++
++	retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, parent_ino);
++		if (retval) {
++			com_err(func_name, retval, "while expanding directory");
++			return retval;
++		}
++		retval = ext2fs_link(current_fs, parent_ino, name, ino, inode.i_flags);
++	}
++	if (retval) {
++		com_err(func_name, retval, "while linking %s", name);
++		return retval;
++	}
++
++	inode.i_links_count++;
++
++	retval = ext2fs_write_inode(current_fs, ino, &inode);
++	if (retval)
++		com_err(func_name, retval, "while writing inode %u", ino);
++
++	return retval;
++}
++
+ /* Fill the uid, gid, mode and time for the inode */
+ static void fill_inode(struct ext2_inode *inode, struct stat *st)
+ {
+@@ -542,6 +578,17 @@ try_again:
+ 	}
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
+@@ -640,10 +687,12 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 	struct dirent	*dent;
+ 	struct stat	st;
+ 	char		ln_target[PATH_MAX];
++	unsigned int	save_inode = 0;
+ 	char		*func_name = "populate_fs";
+ 	ext2_ino_t	ino;
+ 	errcode_t	retval;
+ 	int		read_cnt;
++	int		hdlink;
+ 
+ 	root = EXT2_ROOT_INO;
+ 
+@@ -665,6 +714,21 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 		lstat(dent->d_name, &st);
+ 		name = dent->d_name;
+ 
++		/* Check for hardlinks */
++		if (!S_ISDIR(st.st_mode) && !S_ISLNK(st.st_mode) && st.st_nlink > 1) {
++			hdlink = is_hardlink(st.st_ino);
++			if (hdlink >= 0) {
++				retval = add_link(parent_ino,
++						hdlinks.hdl[hdlink].dst_ino, name);
++				if (retval) {
++					com_err(func_name, retval, "while linking %s", name);
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
+@@ -733,6 +797,27 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
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
+-- 
+1.7.10.4
+
-- 
1.8.1.2.545.g2f19ada


