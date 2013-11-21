Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E57766DBE2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EPJA025135
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:27 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:26 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:52 -0600
Message-ID: <1385018038-23380-7-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 06/12] e2fsprogs/mke2fs: create directory
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:28 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

The do_mkdir_internal() is used for making dir on the target fs, most of
the code are from debugfs/debugfs.c, the debugfs/debugfs.c will be
modified to use this function.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0006-misc-util.c-create-directory.patch        | 62 ++++++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0006-misc-util.c-create-directory.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0006-misc-util.c-create-directory.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0006-misc-util.c-create-directory.patch
new file mode 100644
index 0000000..1ef4338
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0006-misc-util.c-create-directory.patch
@@ -0,0 +1,62 @@
+From 41344adccc0bf38893ff1c402301357e8a174713 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Wed, 28 Aug 2013 10:14:38 +0800
+Subject: [rootdir 06/10] misc/util.c: create directory
+
+The do_mkdir_internal() is used for making dir on the target fs, most of
+the code are from debugfs/debugfs.c, the debugfs/debugfs.c will be
+modified to use this function.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |   34 ++++++++++++++++++++++++++++++++++
+ 1 file changed, 34 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index e35fd88..7a45120 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -471,6 +471,40 @@ fail:
+ /* Make a directory in the fs */
+ errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
+ {
++	char			*cp;
++	ext2_ino_t		parent_ino, ino;
++	errcode_t		retval;
++	struct ext2_inode	inode;
++	char			*func_name = "do_mkdir_internal";
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
++	} else {
++		parent_ino = cwd;
++		name = name;
++	}
++
++try_again:
++	retval = ext2fs_mkdir(current_fs, parent_ino, 0, name);
++	if (retval == EXT2_ET_DIR_NO_SPACE) {
++		retval = ext2fs_expand_dir(current_fs, parent_ino);
++		if (retval) {
++			com_err(func_name, retval, "while expanding directory");
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
+ /* Copy the native file to the fs */
+-- 
+1.7.10.4
+
-- 
1.8.1.2.545.g2f19ada


