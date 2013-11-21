Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 343806DAAC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7ETQt025159
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:30 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:28 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:53 -0600
Message-ID: <1385018038-23380-8-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 07/12] e2fsprogs/mke2fs: set more information for inode
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:30 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Set the uid, gid, mode and time for inode.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...isc-util.c-set-more-information-for-inode.patch | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0007-misc-util.c-set-more-information-for-inode.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0007-misc-util.c-set-more-information-for-inode.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0007-misc-util.c-set-more-information-for-inode.patch
new file mode 100644
index 0000000..e66a9dc
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0007-misc-util.c-set-more-information-for-inode.patch
@@ -0,0 +1,79 @@
+From 760eb73420f13d99244d1d23d69c890fd29d8fdc Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Aug 2013 10:18:01 +0800
+Subject: [rootdir 07/10] misc/util.c: set more information for inode
+
+Set the uid, gid, mode and time for inode.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |   46 ++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 46 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index 7a45120..1a0a58c 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -314,6 +314,41 @@ void dump_mmp_msg(struct mmp_struct *mmp, const char *msg)
+ 	}
+ }
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
++	char			*func_name = "set_inode_extra";
++
++	retval = ext2fs_read_inode(current_fs, ino, &inode);
++        if (retval) {
++		com_err(func_name, retval, "while reading inode %u", ino);
++		return retval;
++	}
++
++	fill_inode(&inode, st);
++
++	retval = ext2fs_write_inode(current_fs, ino, &inode);
++	if (retval) {
++		com_err(func_name, retval, "while writing inode %u", ino);
++		return retval;
++	}
++}
++
+ /* Make a special file which is block, character and fifo */
+ errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
+@@ -687,6 +722,17 @@ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ 				com_err(func_name, 0,
+ 					_("ignoring entry \"%s\""), name);
+ 		}
++
++		if ((retval =  ext2fs_namei(current_fs, root, parent_ino, name, &ino))){
++			com_err(name, retval, 0);
++			return retval;
++		}
++
++		if ((retval = set_inode_extra(parent_ino, ino, &st))) {
++			com_err(func_name, retval,
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
1.8.1.2.545.g2f19ada


