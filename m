Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33FFD6F664
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276xrBJ016399
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:53 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:52 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:28 -0500
Message-ID: <22ac089ec1acb4d0653e3e503ec0794c42de8c3a.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 07/14] e2fsprogs: mke2fs: set owner/mode/time for the inode
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:52 -0000
Content-Type: text/plain

Set the uid, gid, mode and time for inode.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ..._inode.c-set-owner-mode-time-for-the-inod.patch |   81 ++++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
new file mode 100644
index 0000000..f296393
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0007-misc-create_inode.c-set-owner-mode-time-for-the-inod.patch
@@ -0,0 +1,81 @@
+From 2b1f6e6b386703a5d7e60b7d8b72746f3d31a8bc Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 23 Dec 2013 03:39:56 -0500
+Subject: [PATCH 07/11] misc/create_inode.c: set owner/mode/time for the inode
+
+Set the uid, gid, mode and time for inode.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/create_inode.c |   45 +++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 45 insertions(+)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 6a8c92a..aad7354 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -18,6 +18,40 @@
+ #define S_BLKSIZE 512
+ #endif
+ 
++/* Fill the uid, gid, mode and time for the inode */
++static void fill_inode(struct ext2_inode *inode, struct stat *st)
++{
++	if (st != NULL) {
++		inode->i_uid = st->st_uid;
++		inode->i_gid = st->st_gid;
++		inode->i_mode |= st->st_mode;
++		inode->i_atime = st->st_atime;
++		inode->i_mtime = st->st_mtime;
++		inode->i_ctime = st->st_ctime;
++	}
++}
++
++/* Set the uid, gid, mode and time for the inode */
++errcode_t set_inode_extra(ext2_ino_t cwd, ext2_ino_t ino, struct stat *st)
++{
++	errcode_t		retval;
++	struct ext2_inode	inode;
++
++	retval = ext2fs_read_inode(current_fs, ino, &inode);
++        if (retval) {
++		com_err(__func__, retval, "while reading inode %u", ino);
++		return retval;
++	}
++
++	fill_inode(&inode, st);
++
++	retval = ext2fs_write_inode(current_fs, ino, &inode);
++	if (retval) {
++		com_err(__func__, retval, "while writing inode %u", ino);
++		return retval;
++	}
++}
++
+ /* Make a special file which is block, character and fifo */
+ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
+@@ -435,6 +469,17 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 				com_err(__func__, 0,
+ 					_("ignoring entry \"%s\""), name);
+ 		}
++
++		if ((retval =  ext2fs_namei(current_fs, root, parent_ino, name, &ino))){
++			com_err(name, retval, 0);
++			return retval;
++		}
++
++		if ((retval = set_inode_extra(parent_ino, ino, &st))) {
++			com_err(__func__, retval,
++				_("while setting inode for \"%s\""), name);
++			return retval;
++		}
+ 	}
+ 	closedir(dh);
+ 	return retval;
+-- 
+1.7.10.4
+
-- 
1.7.10.4


