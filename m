Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
 by mx.groups.io with SMTP id smtpd.web10.16075.1584820649083821658
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2020 12:57:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@stusta.de header.s=default header.b=aC5V09D8;
 spf=pass (domain: stusta.mhn.de, ip: 141.84.69.5, mailfrom: srs0=daxo=5g=stusta.de=bunk@stusta.mhn.de)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48lBJ56l0Rz4j
	for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2020 20:57:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584820646;
	bh=PBvlCx6m+0Q1VUpvhP00u8FViz6xxe4ewq+uxNAB/xc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aC5V09D8ODlX2Cmj8R01/1UhiqHeZPAYbRqEpUTGK8nQeBJb75K2ZCRUUQZIu0vpS
	 z1k2azBXGz3fRV9xufPb2D2ekpUmJ0/RlihKBpMz9SC04h8WJtlxRHrtad3d7a0r0T
	 vxft0Qle4KTgCC8A3QwR+4Fv7xCuuSdns02uBviPyR0EQ8YKQRdoaQEy9DtH5DqUu6
	 UQejjiKIvWJ6lINCu9BNuf/TeJn3+rr/T0NFiiIHzQQ9cZCn/qF2rr8MejkIirp2uP
	 ihQ6Ciku2hhqfV1eBy2pt2dp5oTjEBSC2I0UlTCuJ2XTgvmdzpdVYY2i/3ggmK0PyQ
	 H5LIvJgh1WpjexsBBVPlJcz7/Ww4mPM1qH2ZNxTGArdHvb6aduSvotPIQT2IZrsX8o
	 Zd68puHz/3xJIdwdgdPl9P37zyntNnfDAQZaXJA+ggVO7kW2Xw5DsAP2EDdlbjVpa8
	 ReOgy58Ng82AZWWyyJxNnopcSsNTEdh7kU4k9cIBk/gZ/ThNfdqsv+57x+QGYSDQC7
	 EKXDcV8ANTEux3MsNox+V2R+FvqD/cwcZnmDBJs9VVJAUYGRa3i3yRpyUzENS6u6xv
	 ubgV8RFeCQS0t2YKHSOskKPCdrq5VCgoHFg8J19nrC7+HPs0z3uUTuJBlj51nPNxVt
	 M3PUh/bLhMs8rXjpFPQFBAwQ=
From: "Adrian Bunk" <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][warrior][PATCH 2/2] e2fsprogs: backport upstream patch
Date: Sat, 21 Mar 2020 21:57:24 +0200
Message-Id: <20200321195724.22502-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200321195724.22502-1-bunk@stusta.de>
References: <20200321195724.22502-1-bunk@stusta.de>

From: Anuj Mittal <anuj.mittal@intel.com>

Fixes a bug wherein a use after free could potentially be used to run
malicious code if a user can be tricked into running e2fsck on a
maliciously crafted file system.

Also see:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=948517

(From OE-Core rev: 23c1b157362609bd8d85c7d35e6c7f0f60c32c88)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...fix-use-after-free-in-calculate_tree.patch | 76 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.44.5.bb             |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
new file mode 100644
index 0000000000..342a2b855b
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
@@ -0,0 +1,76 @@
+From: Wang Shilong <wshilong@ddn.com>
+Date: Mon, 30 Dec 2019 19:52:39 -0500
+Subject: e2fsck: fix use after free in calculate_tree()
+
+The problem is alloc_blocks() will call get_next_block() which might
+reallocate outdir->buf, and memory address could be changed after
+this.  To fix this, pointers that point into outdir->buf, such as
+int_limit and root need to be recaulated based on the new starting
+address of outdir->buf.
+
+[ Changed to correctly recalculate int_limit, and to optimize how we
+  reallocate outdir->buf.  -TYT ]
+
+Addresses-Debian-Bug: 948517
+Signed-off-by: Wang Shilong <wshilong@ddn.com>
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+(cherry picked from commit 101e73e99ccafa0403fcb27dd7413033b587ca01)
+
+Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?id=101e73e99ccafa0403fcb27dd7413033b587ca01]
+---
+ e2fsck/rehash.c | 17 ++++++++++++++++-
+ 1 file changed, 16 insertions(+), 1 deletion(-)
+
+diff --git a/e2fsck/rehash.c b/e2fsck/rehash.c
+index 0a5888a9..2574e151 100644
+--- a/e2fsck/rehash.c
++++ b/e2fsck/rehash.c
+@@ -295,7 +295,11 @@ static errcode_t get_next_block(ext2_filsys fs, struct out_dir *outdir,
+ 	errcode_t	retval;
+ 
+ 	if (outdir->num >= outdir->max) {
+-		retval = alloc_size_dir(fs, outdir, outdir->max + 50);
++		int increment = outdir->max / 10;
++
++		if (increment < 50)
++			increment = 50;
++		retval = alloc_size_dir(fs, outdir, outdir->max + increment);
+ 		if (retval)
+ 			return retval;
+ 	}
+@@ -637,6 +641,9 @@ static int alloc_blocks(ext2_filsys fs,
+ 	if (retval)
+ 		return retval;
+ 
++	/* outdir->buf might be reallocated */
++	*prev_ent = (struct ext2_dx_entry *) (outdir->buf + *prev_offset);
++
+ 	*next_ent = set_int_node(fs, block_start);
+ 	*limit = (struct ext2_dx_countlimit *)(*next_ent);
+ 	if (next_offset)
+@@ -726,6 +733,9 @@ static errcode_t calculate_tree(ext2_filsys fs,
+ 					return retval;
+ 			}
+ 			if (c3 == 0) {
++				int delta1 = (char *)int_limit - outdir->buf;
++				int delta2 = (char *)root - outdir->buf;
++
+ 				retval = alloc_blocks(fs, &limit, &int_ent,
+ 						      &dx_ent, &int_offset,
+ 						      NULL, outdir, i, &c2,
+@@ -733,6 +743,11 @@ static errcode_t calculate_tree(ext2_filsys fs,
+ 				if (retval)
+ 					return retval;
+ 
++				/* outdir->buf might be reallocated */
++				int_limit = (struct ext2_dx_countlimit *)
++					(outdir->buf + delta1);
++				root = (struct ext2_dx_entry *)
++					(outdir->buf + delta2);
+ 			}
+ 			dx_ent->block = ext2fs_cpu_to_le32(i);
+ 			if (c3 != limit->limit)
+-- 
+2.24.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
index dea481d1b9..da06888b34 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://0001-create_inode-fix-copying-large-files.patch \
             file://CVE-2019-5188.patch \
             file://0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch \
+            file://e2fsck-fix-use-after-free-in-calculate_tree.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.17.1

