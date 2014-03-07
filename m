Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4FB626F667
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:50 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s276xpnW017124
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:51 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:47 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:27 -0500
Message-ID: <8ed8b039e47b47ba52c1c08120504717eeb76a25.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 06/14] e2fsprogs: mke2fs: create directory
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:50 -0000
Content-Type: text/plain

The do_mkdir_internal() is used for making dir on the target fs, most of
the code are from debugfs/debugfs.c, the debugfs/debugfs.c will be
modified to use this function.

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ...0006-misc-create_inode.c-create-directory.patch |   62 ++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
new file mode 100644
index 0000000..5c7ca9c
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0006-misc-create_inode.c-create-directory.patch
@@ -0,0 +1,62 @@
+From c8d1c43be24489036137f8fdebcfccc208f7cc8b Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Mon, 23 Dec 2013 03:34:14 -0500
+Subject: [PATCH 06/11] misc/create_inode.c: create directory
+
+The do_mkdir_internal() is used for making dir on the target fs, most of
+the code are from debugfs/debugfs.c, the debugfs/debugfs.c will be
+modified to use this function.
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/create_inode.c |   31 +++++++++++++++++++++++++++++++
+ 1 file changed, 31 insertions(+)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 98f4a93..6a8c92a 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -135,6 +135,37 @@ try_again:
+ /* Make a directory in the fs */
+ errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
++	char			*cp;
++	ext2_ino_t		parent_ino, ino;
++	errcode_t		retval;
++	struct ext2_inode	inode;
++
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
++	retval = ext2fs_mkdir(current_fs, parent_ino, 0, name);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, parent_ino);
++		if (retval) {
++			com_err(__func__, retval, "while expanding directory");
++			return retval;
++		}
++		goto try_again;
++	}
++	if (retval) {
++		com_err("ext2fs_mkdir", retval, 0);
++		return retval;
++	}
+ }
+ 
+ static errcode_t copy_file(int fd, ext2_ino_t newfile, int bufsize, int make_holes)
+-- 
+1.7.10.4
+
-- 
1.7.10.4


