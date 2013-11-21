Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8FC9C6D4ED
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EKeM013407
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:20 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:19 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:50 -0600
Message-ID: <1385018038-23380-5-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 04/12] e2fsprogs/mke2fs: create symlink
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:20 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The do_symlink_internal() is used for creating symlinks, most of the
code are from debugfs/debugfs.c, the debugfs/debugfs.c will be modified
to use this function.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0004-misc-util.c-create-symlink.patch          | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0004-misc-util.c-create-symlink.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0004-misc-util.c-create-symlink.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0004-misc-util.c-create-symlink.patch
new file mode 100644
index 0000000..6634ff0
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0004-misc-util.c-create-symlink.patch
@@ -0,0 +1,62 @@
+From f34058c69d2966b3e22dfe30b8f70533c3edbea6 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Aug 2013 09:58:13 +0800
+Subject: [rootdir 04/10] misc/util.c: create symlink
+
+The do_symlink_internal() is used for creating symlinks, most of the
+code are from debugfs/debugfs.c, the debugfs/debugfs.c will be modified
+to use this function.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |   34 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index c793b42..f6ae7ca 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -392,6 +392,40 @@ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
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
++	} else {
++		parent_ino = cwd;
++		name = name;
++	}
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
1.8.1.2.545.g2f19ada


