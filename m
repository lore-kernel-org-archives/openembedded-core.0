Return-Path: <tanuk@iki.fi>
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
	[66.111.4.29])
	by mail.openembedded.org (Postfix) with ESMTP id 695E4788FF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2018 17:08:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id E8F4220CCD;
	Wed, 21 Mar 2018 13:08:44 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Wed, 21 Mar 2018 13:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=CET+ESNoNtL6dhwZz
	pbdgkZ3QSfcaexOBP+qUJYcCVw=; b=Y28I51POok1BzqspDTNBB7yWyaOTXNP1N
	aMPk5JifEIk3KQaUGxB8pcciyIfbQoRqkEC5pKvAVBt3mZdSy5vdGyOjSMqjldTC
	17zM+kVx4krQ/a5P1K+iSbUWAx8sFkqmbb3ysIDX+eFWW1MTljXetuPtMT4qw417
	hTrhARogobrG81cvSv4P4t5d8n38MnAFnYbGU7y6fZivKq8gPZu64Q/PrKzIiFnG
	cBhMhP17qggH0/ZL+6TYSRNwXDC0T18RJNyvRylUTDX6SVdRXEtJybECgKN3YE1Q
	Ci3CrEXl+MfD60LuWb+1JqEbr9hazCWPsx6Giy0Dd1kh42GCQqi3A==
X-ME-Sender: <xms:nJGyWtW2OYJ9vgJH3CBBvweXG_ElJxd6Nq2iDSGXG_Acw5jRrzOlmg>
Received: from localhost.localdomain (unknown [192.40.95.29])
	by mail.messagingengine.com (Postfix) with ESMTPA id 2A2C9240B3;
	Wed, 21 Mar 2018 13:08:44 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Wed, 21 Mar 2018 19:08:38 +0200
Message-Id: <20180321170838.22245-1-tanuk@iki.fi>
X-Mailer: git-send-email 2.16.2
Subject: [pyro][PATCH] e2fsprogs: fix compatibility with glibc 2.27
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
X-List-Received-Date: Wed, 21 Mar 2018 17:08:43 -0000

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
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb |  1 +
 2 files changed, 63 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch
new file mode 100644
index 0000000000..3b1d7fe02d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-misc-rename-copy_file_range-to-copy_file_chunk.patch
@@ -0,0 +1,62 @@
+From ad8078ca2ef35c91bedad61c9e2a6c01bf13a605 Mon Sep 17 00:00:00 2001
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
+index ae22ff6f..ea6fa7e7 100644
+--- a/misc/create_inode.c
++++ b/misc/create_inode.c
+@@ -392,7 +392,7 @@ static ssize_t my_pread(int fd, void *buf, size_t count, off_t offset)
+ }
+ #endif /* !defined HAVE_PREAD64 && !defined HAVE_PREAD */
+ 
+-static errcode_t copy_file_range(ext2_filsys fs, int fd, ext2_file_t e2_file,
++static errcode_t copy_file_chunk(ext2_filsys fs, int fd, ext2_file_t e2_file,
+ 				 off_t start, off_t end, char *buf,
+ 				 char *zerobuf)
+ {
+@@ -466,7 +466,7 @@ static errcode_t try_lseek_copy(ext2_filsys fs, int fd, struct stat *statbuf,
+ 
+ 		data_blk = data & ~(fs->blocksize - 1);
+ 		hole_blk = (hole + (fs->blocksize - 1)) & ~(fs->blocksize - 1);
+-		err = copy_file_range(fs, fd, e2_file, data_blk, hole_blk, buf,
++		err = copy_file_chunk(fs, fd, e2_file, data_blk, hole_blk, buf,
+ 				      zerobuf);
+ 		if (err)
+ 			return err;
+@@ -517,7 +517,7 @@ static errcode_t try_fiemap_copy(ext2_filsys fs, int fd, ext2_file_t e2_file,
+ 			goto out;
+ 		for (i = 0, ext = ext_buf; i < fiemap_buf->fm_mapped_extents;
+ 		     i++, ext++) {
+-			err = copy_file_range(fs, fd, e2_file, ext->fe_logical,
++			err = copy_file_chunk(fs, fd, e2_file, ext->fe_logical,
+ 					      ext->fe_logical + ext->fe_length,
+ 					      buf, zerobuf);
+ 			if (err)
+@@ -570,7 +570,7 @@ static errcode_t copy_file(ext2_filsys fs, int fd, struct stat *statbuf,
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
index 5216c7027c..7aa73a15ed 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://acinclude.m4 \
             file://e2fsprogs-1.43-sysmacros.patch \
             file://mkdir_p.patch \
             file://0001-e2fsck-exit-with-exit-status-0-if-no-errors-were-fix.patch \
+            file://0001-misc-rename-copy_file_range-to-copy_file_chunk.patch \
 "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
-- 
2.16.2


