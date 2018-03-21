Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id BAAE2788FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 17:07:51 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E2AD420C99;
	Wed, 21 Mar 2018 13:07:52 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Wed, 21 Mar 2018 13:07:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=wZ1MTPX/dwRB67VG0
	LtmkN9cHur1Cm+yfyFPv/mk3K0=; b=e7ycjtr7iS8zezjQUhk9P3oYdMvy1WkNy
	DkbAQ3wRrj64bsXy90/BdMU6A+bVd3AY9EOGLYeEBNyB6ONhEqumHOJsbt2m6xTD
	/zLF9ugXeuTzVLZQfUHJpV2tjXbjSbMA7O3hlLW6/hMVAHJsAtxPLu8Nzb9OvkSL
	8jwNbqqzBzetKOcgj3+HaddXMs/IF8q0+1bR8tdrfO5a5R4scSFkUfe1Uc5WgxNN
	hoH2t5R6e25LwaAS4ApQzl0ojZAFc4obDQPpsTxkWsyHYKwTz+dHIsa/f36VgE8k
	Nz32kY7/3x18C4oWhvi0NfhudNQdj2D1UKljmj/xeaQ/D2G5vPr0w==
X-ME-Sender: <xms:aJGyWuBjACzad4bbjmF6O5s_txhnPZrlr1lEhtBVoDVvIdtuycsWxw>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 331E07E1D6;
	Wed, 21 Mar 2018 13:07:52 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 19:07:41 +0200
Message-Id: <20180321170741.22025-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
Subject: [rocko][PATCH] e2fsprogs: fix compatibility with glibc 2.27
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
X-List-Received-Date: Wed, 21 Mar 2018 17:07:52 -0000

glibc 2.27 added function copy_file_range(), and e2fsprogs happens to
have a different function with the same name. The conflict made
e2fsprogs-native build fail.

Here's a backport of a fix from upstream, the fix was released in
e2fsprogs 1.43.8.

The master branch doesn't need this fix, since it has new enough
e2fsprogs version. At least rocko, pyro and morty need this, I haven't
checked older stable branches. Apparently the problematic function was
introduced in e2fsprogs version 1.43.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...rename-copy_file_range-to-copy_file_chunk.patch | 62 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch
new file mode 100644
index 0000000000..308fe0e292
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch
@@ -0,0 +1,62 @@
+From 647353f7c3fd29e1ffd468d7ff56d9643047ab35 Mon Sep 17 00:00:00 2001
+From: Palmer Dabbelt <palmer@dabbelt.com>
+Date: Fri, 29 Dec 2017 10:19:51 -0800
+Subject: [PATCH] misc: rename copy_file_range to copy_file_chunk
+
+As of 2.27, glibc will have a copy_file_range library call to wrap the
+new copy_file_range system call.  This conflicts with the function in
+misc/create_inode.c, which this patch renames _copy_file_range.
+
+Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+
+Upstream-Status: Backport
+
+Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
+---
+ misc/create_inode.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+index 8ce3fafa..cd89146f 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -396,7 +396,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
+ }
+ #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
+ 
+-static errcode_t copy_file_range(ext2_filsys fs, int fd, ext2_file_t e2_file,
++static errcode_t copy_file_chunk(ext2_filsys fs, int fd, ext2_file_t e2_file,
+ 				 off_t start, off_t end, char *buf,
+ 				 char *zerobuf)
+ {
+@@ -470,7 +470,7 @@ static errcode_t try_lseek_copy(ext2_filsys fs, int fd, struct stat *statbuf,
+ 
+ 		data_blk = data & ~(fs->blocksize - 1);
+ 		hole_blk = (hole + (fs->blocksize - 1)) & ~(fs->blocksize - 1);
+-		err = copy_file_range(fs, fd, e2_file, data_blk, hole_blk, buf,
++		err = copy_file_chunk(fs, fd, e2_file, data_blk, hole_blk, buf,
+ 				      zerobuf);
+ 		if (err)
+ 			return err;
+@@ -521,7 +521,7 @@ static errcode_t try_fiemap_copy(ext2_filsys fs, int fd, ext2_file_t e2_file,
+ 			goto out;
+ 		for (i = 0, ext = ext_buf; i < fiemap_buf->fm_mapped_extents;
+ 		     i++, ext++) {
+-			err = copy_file_range(fs, fd, e2_file, ext->fe_logical,
++			err = copy_file_chunk(fs, fd, e2_file, ext->fe_logical,
+ 					      ext->fe_logical + ext->fe_length,
+ 					      buf, zerobuf);
+ 			if (err)
+@@ -574,7 +574,7 @@ static errcode_t copy_file(ext2_filsys fs, int fd, struct stat *statbuf,
+ 		goto out;
+ #endif
+ 
+-	err = copy_file_range(fs, fd, e2_file, 0, statbuf->st_size, buf,
++	err = copy_file_chunk(fs, fd, e2_file, 0, statbuf->st_size, buf,
+ 			      zerobuf);
+ out:
+ 	ext2fs_free_mem(&zerobuf);
+-- 
+2.16.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
index 00093cc20c..f1d7c08209 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://acinclude.m4 \
             file://mkdir_p.patch \
             file://reproducible-doc.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
+            file://0001-misc-rename-copy_file_range-to-copy_file_chunk.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
2.16.2


