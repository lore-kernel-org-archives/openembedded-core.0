Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C7FAA6DBD4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Nov 2013 07:14:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAL7EEHP025098
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Nov 2013 23:14:14 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Wed, 20 Nov 2013 23:14:13 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <liezhi.yang@windriver.com>, <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Nov 2013 01:13:48 -0600
Message-ID: <1385018038-23380-3-git-send-email-mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
In-Reply-To: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
References: <1385018038-23380-1-git-send-email-mark.hatle@windriver.com>
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [RFC PATCH 02/12] e2fsprogs/mke2fs: misc/util.c: implement populate_fs()
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
X-List-Received-Date: Thu, 21 Nov 2013 07:14:14 -0000
Content-Type: text/plain

From: Robert Yang <liezhi.yang@windriver.com>

Use opendir() and readdir() to read the native directory, then use
lstat() to identify the file type and call the corresponding function to
add the file to the filesystem, call the populate_fs() recursively if it
is a directory.

NOTE: the libext2fs doesn't support create the socket file at them
moment.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../0002-misc-util.c-implement-populate_fs.patch   | 120 +++++++++++++++++++++
 1 file changed, 120 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0002-misc-util.c-implement-populate_fs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0002-misc-util.c-implement-populate_fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0002-misc-util.c-implement-populate_fs.patch
new file mode 100644
index 0000000..2db5e46
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/0002-misc-util.c-implement-populate_fs.patch
@@ -0,0 +1,120 @@
+From c025353bd7567b35162b6193fb0b152b1c733bcd Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 27 Aug 2013 16:12:38 +0800
+Subject: [rootdir 02/10] misc/util.c: implement populate_fs()
+
+Use opendir() and readdir() to read the native directory, then use
+lstat() to identify the file type and call the corresponding function to
+add the file to the filesystem, call the populate_fs() recursively if it
+is a directory.
+
+NOTE: the libext2fs doesn't support create the socket file at them
+moment.
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/util.c |   90 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ 1 file changed, 90 insertions(+)
+
+diff --git a/misc/util.c b/misc/util.c
+index cbc7cc0..6d87393 100644
+--- a/misc/util.c
++++ b/misc/util.c
+@@ -337,4 +337,94 @@ errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
+ /* Copy files from source_dir to fs */
+ errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
+ {
++	const char	*name;
++	DIR		*dh;
++	struct dirent	*dent;
++	struct stat	st;
++	char		ln_target[PATH_MAX];
++	char		*func_name = "populate_fs";
++	ext2_ino_t	ino;
++	errcode_t	retval;
++	int		read_cnt;
++
++	root = EXT2_ROOT_INO;
++
++	if (chdir(source_dir) < 0) {
++		com_err(func_name, errno,
++			_("while changing working directory to \"%s\""), source_dir);
++		return errno;
++	}
++
++	if (!(dh = opendir("."))) {
++		com_err(func_name, errno,
++			_("while openning directory \"%s\""), source_dir);
++		return errno;
++	}
++
++	while((dent = readdir(dh))) {
++		if((!strcmp(dent->d_name, ".")) || (!strcmp(dent->d_name, "..")))
++			continue;
++		lstat(dent->d_name, &st);
++		name = dent->d_name;
++
++		switch(st.st_mode & S_IFMT) {
++			case S_IFCHR:
++			case S_IFBLK:
++			case S_IFIFO:
++				if ((retval = do_mknod_internal(parent_ino, name, &st))) {
++					com_err(func_name, retval,
++						_("while creating special file \"%s\""), name);
++					return retval;
++				}
++				break;
++			case S_IFSOCK:
++				/* FIXME: there is no make sockect function atm. */
++				com_err(func_name, 0,
++					_("ignoring sockect file\"%s\""), name);
++				break;
++			case S_IFLNK:
++				if((read_cnt = readlink(name, ln_target, sizeof(ln_target))) == -1) {
++					com_err(func_name, errno,
++						_("while trying to readlink \"%s\""), name);
++					return errno;
++				}
++				ln_target[read_cnt] = '\0';
++				if ((retval = do_symlink_internal(parent_ino, name, ln_target))) {
++					com_err(func_name, retval,
++						_("while writing symlink\"%s\""), name);
++					return retval;
++				}
++				break;
++			case S_IFREG:
++				if ((retval = do_write_internal(parent_ino, name, name))) {
++					com_err(func_name, retval,
++						_("while writing file \"%s\""), name);
++					return retval;
++				}
++				break;
++			case S_IFDIR:
++				if ((retval = do_mkdir_internal(parent_ino, name, &st))) {
++					com_err(func_name, retval,
++						_("while making dir \"%s\""), name);
++					return retval;
++				}
++				if ((retval = ext2fs_namei(current_fs, root, parent_ino, name, &ino))) {
++					com_err(name, retval, 0);
++						return retval;
++				}
++				/* Populate the dir recursively*/
++				retval = populate_fs(ino, name);
++				if (retval) {
++					com_err(func_name, retval, _("while adding dir \"%s\""), name);
++					return retval;
++				}
++				chdir("..");
++				break;
++			default:
++				com_err(func_name, 0,
++					_("ignoring entry \"%s\""), name);
++		}
++	}
++	closedir(dh);
++	return retval;
+ }
+-- 
+1.7.10.4
+
-- 
1.8.1.2.545.g2f19ada


