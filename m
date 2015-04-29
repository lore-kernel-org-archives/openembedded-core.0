Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 553E073D5C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Apr 2015 09:02:44 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 29 Apr 2015 11:02:44 +0200
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id E494328BA1E;
	Wed, 29 Apr 2015 11:02:44 +0200 (CEST)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 29 Apr 2015 11:02:22 +0200
Message-ID: <1430298142-9117-6-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
References: <1430298142-9117-1-git-send-email-maxin.john@enea.com>
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [daisy 5/5] e2fsprogs: CVE-2015-0247
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
X-List-Received-Date: Wed, 29 Apr 2015 09:02:45 -0000
Content-Type: text/plain

From: Sona Sarmadi <sona.sarmadi@enea.com>

Fixes input sanitization errors.

References
http://git.kernel.org/cgit/fs/ext2/e2fsprogs.git/commit/?id=f66e6ce4
http://www.ocert.org/advisories/ocert-2015-002.html

Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 .../e2fsprogs/e2fsprogs/CVE-2015-0247.patch        | 58 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
new file mode 100644
index 0000000..4de67c9
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/CVE-2015-0247.patch
@@ -0,0 +1,58 @@
+From f66e6ce4446738c2c7f43d41988a3eb73347e2f5 Mon Sep 17 00:00:00 2001
+From: Theodore Ts'o <tytso@mit.edu>
+Date: Sat, 9 Aug 2014 12:24:54 -0400
+Subject: libext2fs: avoid buffer overflow if s_first_meta_bg is too big
+
+If s_first_meta_bg is greater than the of number block group
+descriptor blocks, then reading or writing the block group descriptors
+will end up overruning the memory buffer allocated for the
+descriptors.  Fix this by limiting first_meta_bg to no more than
+fs->desc_blocks.  This doesn't correct the bad s_first_meta_bg value,
+but it avoids causing the e2fsprogs userspace programs from
+potentially crashing.
+
+Fixes CVE-2015-0247
+Upstream-Status: Backport
+
+Signed-off-by: Theodore Ts'o <tytso@mit.edu>
+Signed-off-by: Sona Sarmadi <sona.sarmadi@enea.com>
+
+diff --git a/lib/ext2fs/closefs.c b/lib/ext2fs/closefs.c
+index 4599eef..1f99113 100644
+--- a/lib/ext2fs/closefs.c
++++ b/lib/ext2fs/closefs.c
+@@ -344,9 +344,11 @@ errcode_t ext2fs_flush2(ext2_filsys fs, int flags)
+ 	 * superblocks and group descriptors.
+ 	 */
+ 	group_ptr = (char *) group_shadow;
+-	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG)
++	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
+ 		old_desc_blocks = fs->super->s_first_meta_bg;
+-	else
++		if (old_desc_blocks > fs->super->s_first_meta_bg)
++			old_desc_blocks = fs->desc_blocks;
++	} else
+ 		old_desc_blocks = fs->desc_blocks;
+ 
+ 	ext2fs_numeric_progress_init(fs, &progress, NULL,
+diff --git a/lib/ext2fs/openfs.c b/lib/ext2fs/openfs.c
+index a1a3517..ba501e6 100644
+--- a/lib/ext2fs/openfs.c
++++ b/lib/ext2fs/openfs.c
+@@ -378,9 +378,11 @@ errcode_t ext2fs_open2(const char *name, const char *io_options,
+ #ifdef WORDS_BIGENDIAN
+ 	groups_per_block = EXT2_DESC_PER_BLOCK(fs->super);
+ #endif
+-	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG)
++	if (fs->super->s_feature_incompat & EXT2_FEATURE_INCOMPAT_META_BG) {
+ 		first_meta_bg = fs->super->s_first_meta_bg;
+-	else
++		if (first_meta_bg > fs->desc_blocks)
++			first_meta_bg = fs->desc_blocks;
++	} else
+ 		first_meta_bg = fs->desc_blocks;
+ 	if (first_meta_bg) {
+ 		retval = io_channel_read_blk(fs->io, group_block +
+-- 
+cgit v0.10.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 2bdd724..a29ce5b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -18,6 +18,7 @@ SRC_URI += "file://acinclude.m4 \
             file://0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch \
             file://0001-e2fsprogs-fix-cross-compilation-problem.patch \
             file://misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch \
+            file://CVE-2015-0247.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
1.9.1


