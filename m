Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail7.windriver.com (mail7.windriver.com [128.224.252.3])
	by mail.openembedded.org (Postfix) with ESMTP id F2DBB6B25D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 13:13:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail7.windriver.com (8.14.5/8.14.3) with ESMTP id r7MDDRhC025139
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 22 Aug 2013 09:13:27 -0400 (EDT)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 22 Aug 2013 06:13:26 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 09:13:12 -0400
Message-ID: <37674ce0aeae479e3cde7f578871ed47ec9025f8.1377175027.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1377175027.git.liezhi.yang@windriver.com>
References: <cover.1377175027.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Cc: dvhart@linux.intel.com
Subject: [PATCH 4/6] e2fsprogs: properly set up extent header in do_write
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
X-List-Received-Date: Thu, 22 Aug 2013 13:13:28 -0000
Content-Type: text/plain

do_write doesn't fully set up the first extent header on a new
inode, so if we write a 0-length file, and don't write any data
to the new file, we end up creating something that looks corrupt
to kernelspace:

EXT4-fs error (device loop0): ext4_ext_check_inode:464: inode #12: comm
ls: bad header/extent: invalid magic - magic 0, entries 0, max 0(0),
depth 0(0)

Do something similar to ext4_ext_tree_init() here, and
fill out the first extent header upon creation to avoid this.

[YOCTO #3848]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../e2fsprogs-1.42.8/debugfs-extent-header.patch   |   47 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb |    2 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
new file mode 100644
index 0000000..ae44730
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42.8/debugfs-extent-header.patch
@@ -0,0 +1,47 @@
+debugfs: properly set up extent header in do_write
+
+do_write doesn't fully set up the first extent header on a new
+inode, so if we write a 0-length file, and don't write any data
+to the new file, we end up creating something that looks corrupt
+to kernelspace:
+
+EXT4-fs error (device loop0): ext4_ext_check_inode:464: inode #12: comm ls: bad header/extent: invalid magic - magic 0, entries 0, max 0(0), depth 0(0)
+
+Do something similar to ext4_ext_tree_init() here, and
+fill out the first extent header upon creation to avoid this.
+
+Upstream-Status: Backport
+
+Reported-by: Robert Yang <liezhi.yang@windriver.com>
+Signed-off-by: Eric Sandeen <sandeen@redhat.com>
+---
+ debugfs/debugfs.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/debugfs/debugfs.c b/debugfs/debugfs.c
+--- a/debugfs/debugfs.c
++++ b/debugfs/debugfs.c
+@@ -1726,8 +1726,19 @@ void do_write(int argc, char *argv[])
+ 	inode.i_links_count = 1;
+ 	inode.i_size = statbuf.st_size;
+ 	if (current_fs->super->s_feature_incompat &
+-	    EXT3_FEATURE_INCOMPAT_EXTENTS)
++	    EXT3_FEATURE_INCOMPAT_EXTENTS) {
++		int i;
++		struct ext3_extent_header *eh;
++
++		eh = (struct ext3_extent_header *) &inode.i_block[0];
++		eh->eh_depth = 0;
++		eh->eh_entries = 0;
++		eh->eh_magic = EXT3_EXT_MAGIC;
++		i = (sizeof(inode.i_block) - sizeof(*eh)) /
++			sizeof(struct ext3_extent);
++		eh->eh_max = ext2fs_cpu_to_le16(i);
+ 		inode.i_flags |= EXT4_EXTENTS_FL;
++	}
+ 	if (debugfs_write_new_inode(newfile, &inode, argv[0])) {
+ 		close(fd);
+ 		return;
+-- 
+1.8.1.2
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
index b063bc0..2dc9dab 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.8.bb
@@ -6,6 +6,8 @@ SRC_URI += "file://acinclude.m4 \
             file://debugfs-too-short.patch \
             file://debugfs-sparse-copy.patch \
             file://fix-icache.patch \
+            file://debugfs-extent-header.patch \
+            file://populate-extfs.sh \
 "
 
 SRC_URI[md5sum] = "8ef664b6eb698aa6b733df59b17b9ed4"
-- 
1.7.10.4


