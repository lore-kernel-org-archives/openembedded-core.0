Return-Path: <SRS0=qdqA=5F=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 9C3F961B5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 17:23:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48kVxT0VwKz5Q
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 18:23:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584725037;
	bh=YA8JN8mr2YykqVkPnHwKPGH2hoEWsU47KLcJUzaaX80=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JzyCWFygFIA7ldATgHtWZSthIJT/7Tggb+WMVPXIJa5SfAd+txc1+qIl9DLZ33x8A
	e9vwv8O4gXi7ufdp1tc2aMAt+mhJ50v9pEanzcAi+JdajIUMyh3amJzDn0RzOPintQ
	xyqHbDr2R/cZJsn3SFoDszv4H77te7rghLk/tSdGVVcOS6MVekhhE0wp1QjTzmEH8Z
	fFWUT5/oiXFuqI1ODYptPkL66/qF3XDjAao1j/xSySWyfl4lGa03DFBv3Iz1oYqg5I
	n9qzXF54v0SPEdtEFfj9bUW0h0572AoPlLXOTwzY+cWDlKl2QEpz5obowuXMW5VrN7
	yE+f+p7jzztgNuDuHWpnLml4IcRpUfwGmHRoOP2VGXI+h0/+mMBnY9K+4g22URzWNT
	qJcIDmUpLaLRjxs6JrNXxMfRqWXAAz6CFkEnkKk1iaVhiR3rnayEUB2ztBmbwdjpJI
	TBgBDuoiARc2EWzqWYFqOYqV339QVq8P0XmfNw8fDocTMrrLNTl/6y2PWHFznrLktt
	6VhsievWVkYvNm64Q3QACK1C/9YIekdbJb65ZdmOKgyAvu4AJg4r6Wn2Mbpny33e5Z
	Za8FqKoONSSlj33l1Ihs0Js0w+Vp00fQHbCXywvR+GXc6KHzyN5tXAww9q43vV8V7B
	e69XgJbC/rb/i0XybdveyXXc=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Mar 2020 19:23:54 +0200
Message-Id: <20200320172354.9777-2-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200320172354.9777-1-bunk@stusta.de>
References: <20200320172354.9777-1-bunk@stusta.de>
Subject: [zeus][PATCH 2/2] e2fsprogs: backport upstream patch
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
X-List-Received-Date: Fri, 20 Mar 2020 17:23:59 -0000

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
 .../e2fsprogs/e2fsprogs_1.45.3.bb             |  1 +
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
index 2014e68579..f81defb837 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
             file://CVE-2019-5094.patch \
             file://CVE-2019-5188.patch \
             file://0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch \
+            file://e2fsck-fix-use-after-free-in-calculate_tree.patch \
             "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.17.1


