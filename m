Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BB5FA6EABD
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:43 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s276xiXZ017121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:44 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:43 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:25 -0500
Message-ID: <b96e6d0ea00772c6835fe47b956cb1798b455389.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 04/14] e2fsprogs: mke2fs: create symlink
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:43 -0000
Content-Type: text/plain

The do_symlink_internal() is used for creating symlinks, most of the
code are from debugfs/debugfs.c, the debugfs/debugfs.c will be modified
to use this function.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 .../0004-misc-create_inode.c-create-symlink.patch  |   63 ++++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
new file mode 100644
index 0000000..83d198c
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0004-misc-create_inode.c-create-symlink.patch
@@ -0,0 +1,63 @@
+From 09d3049776882167f7249ee26265b4163d7222c1 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 23 Dec 2013 03:19:55 -0500
+Subject: [PATCH 04/11] misc/create_inode.c: create symlink
+
+The do_symlink_internal() is used for creating symlinks, most of the
+code are from debugfs/debugfs.c, the debugfs/debugfs.c will be modified
+to use this function.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/create_inode.c |   32 ++++++++++++++++++++++++++++++++
+ 1 file changed, 32 insertions(+)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 4da8aff..f845103 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -88,6 +88,38 @@ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ /* Make a symlink name -> target */
+ errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target)
+ {
++	char			*cp;
++	ext2_ino_t		parent_ino;
++	errcode_t		retval;
++	struct ext2_inode	inode;
++	struct stat		st;
++
++	cp = strrchr(name, '/');
++	if (cp) {
++		*cp = 0;
++		if ((retval =  ext2fs_namei(current_fs, root, cwd, name, &parent_ino))){
++			com_err(name, retval, 0);
++			return retval;
++		}
++		name = cp+1;
++	} else
++		parent_ino = cwd;
++
++try_again:
++	retval = ext2fs_symlink(current_fs, parent_ino, 0, name, target);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, parent_ino);
++		if (retval) {
++			com_err("do_symlink_internal", retval, "while expanding directory");
++			return retval;
++		}
++		goto try_again;
++	}
++	if (retval) {
++		com_err("ext2fs_symlink", retval, 0);
++		return retval;
++	}
++
+ }
+ 
+ /* Make a directory in the fs */
+-- 
+1.7.10.4
+
-- 
1.7.10.4


