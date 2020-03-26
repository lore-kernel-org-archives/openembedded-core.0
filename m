Received: from mga04.intel.com (mga04.intel.com [])
 by mx.groups.io with SMTP id smtpd.web10.32965.1585212831047026777
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2020 01:53:56 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: h8j9rAUftP4e3QgLRnsIyaKFFzCxssh/fj/4SV45wV6SWyF9AjVEzJwiRxbngrCjtXK9UoxAj9
 Ifo0Sm9m2cNg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2020 01:53:57 -0700
IronPort-SDR: d9xZshsVAWIzajHBGssz+D6Ik087pS2CzSMdL+kldQvj3gYEG+S5dK2Ynq7DTFfoinwE9z+2vp
 Ulf753O2JQkQ==
X-IronPort-AV: E=Sophos;i="5.72,307,1580803200"; 
   d="scan'208";a="420621859"
Received: from andromeda02.png.intel.com ([10.221.183.11])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA; 26 Mar 2020 01:53:55 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [zeus][PATCH 6/9] e2fsprogs: backport upstream patch
Date: Thu, 26 Mar 2020 16:53:33 +0800
Message-Id: <bc3c82e82e6d2dce025e84b8f398379f4fc6f249.1585211896.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1585211896.git.anuj.mittal@intel.com>
References: <cover.1585211896.git.anuj.mittal@intel.com>

Fixes a bug wherein a use after free could potentially be used to run
malicious code if a user can be tricked into running e2fsck on a
maliciously crafted file system.

Also see:
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=948517

(From OE-Core rev: 23c1b157362609bd8d85c7d35e6c7f0f60c32c88)

Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Adrian Bunk <bunk@stusta.de>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...fsck-fix-use-after-free-in-calculate_tree.patch | 76 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.45.3.bb |  1 +
 2 files changed, 77 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/e2fsck-fix-use-after-free-in-calculate_tree.patch
new file mode 100644
index 0000000..342a2b8
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
index 2014e68..f81defb 100644
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
2.7.4

