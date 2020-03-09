Return-Path: <anuj.mittal@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 4D05D60C1E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Mar 2020 00:45:09 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2020 17:45:09 -0700
X-IronPort-AV: E=Sophos;i="5.70,530,1574150400"; d="scan'208";a="245196899"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.141.167])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	08 Mar 2020 17:45:09 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  9 Mar 2020 08:45:02 +0800
Message-Id: <20200309004502.4096343-3-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200309004502.4096343-1-anuj.mittal@intel.com>
References: <20200309004502.4096343-1-anuj.mittal@intel.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] e2fsprogs: backport upstream patch
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
X-List-Received-Date: Mon, 09 Mar 2020 00:45:09 -0000
Content-Transfer-Encoding: 8bit

Fixes a bug wherein a use after free could potentially be used to run
malicious code if a user can be tricked into running e2fsck on a
maliciously crafted file system.

Also see:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=948517

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...fix-use-after-free-in-calculate_tree.patch | 76 +++++++++++++++++++
 .../e2fsprogs/e2fsprogs_1.45.4.bb             |  1 +
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
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
index fc92b77ab6..4f7cafeac9 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.45.4.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
            file://0001-intl-do-not-try-to-use-gettext-defines-that-no-longe.patch \
            file://CVE-2019-5188.patch \
            file://0001-e2fsck-don-t-try-to-rehash-a-deleted-directory.patch \
+           file://e2fsck-fix-use-after-free-in-calculate_tree.patch \
            "
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch \
-- 
2.24.1


