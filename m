Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id B73196F88B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 16:49:44 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Mar 2014 09:48:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,631,1389772800"; d="scan'208";a="497805177"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.212])
	by orsmga002.jf.intel.com with ESMTP; 11 Mar 2014 09:48:42 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 09:48:41 -0700
Message-Id: <1394556521-16893-2-git-send-email-sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1394556521-16893-1-git-send-email-sgw@linux.intel.com>
References: <1394556521-16893-1-git-send-email-sgw@linux.intel.com>
Subject: [PATCH 2/2] btrfs: patch to allow for relative paths
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
X-List-Received-Date: Tue, 11 Mar 2014 16:49:45 -0000

This seems to address the btrfs image failure

[YOCTO #5146]

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 .../btrfs-tools/allow-relative-path.patch          | 58 ++++++++++++++++++++++
 .../btrfs-tools/btrfs-tools_git.bb                 |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch
new file mode 100644
index 0000000..9cd64a5
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch
@@ -0,0 +1,58 @@
+From: Gui Hecheng <guihc.fnst@cn.fujitsu.com>
+
+The bug accurs when exec:
+	# mkfs.btrfs -r <a relative path> <device>
+	(note: the path should be 'valid' correspond to your `pwd`)
+error msg:
+	$ scandir for <a relative path> failed: No such file...
+
+Replace strdup() with realpath() to get the correct scan path.
+
+Upstream-Status: Backport (pending)
+
+Reported-by: Saul Wold <sgw@linux.intel.com>
+Signed-off-by: Gui Hecheng <guihc.fnst@cn.fujitsu.com>
+---
+ mkfs.c | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/mkfs.c b/mkfs.c
+index 2dc90c2..1bd3069 100644
+--- a/mkfs.c
++++ b/mkfs.c
+@@ -756,6 +756,7 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
+ 	ino_t parent_inum, cur_inum;
+ 	ino_t highest_inum = 0;
+ 	char *parent_dir_name;
++	char real_path[PATH_MAX];
+ 	struct btrfs_path path;
+ 	struct extent_buffer *leaf;
+ 	struct btrfs_key root_dir_key;
+@@ -764,7 +765,7 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
+ 	/* Add list for source directory */
+ 	dir_entry = malloc(sizeof(struct directory_name_entry));
+ 	dir_entry->dir_name = dir_name;
+-	dir_entry->path = strdup(dir_name);
++	dir_entry->path = realpath(dir_name, real_path);
+ 
+ 	parent_inum = highest_inum + BTRFS_FIRST_FREE_OBJECTID;
+ 	dir_entry->inum = parent_inum;
+@@ -876,7 +877,6 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
+ 		}
+ 
+ 		free_namelist(files, count);
+-		free(parent_dir_entry->path);
+ 		free(parent_dir_entry);
+ 
+ 		index_cnt = 2;
+@@ -887,7 +887,6 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
+ fail:
+ 	free_namelist(files, count);
+ fail_no_files:
+-	free(parent_dir_entry->path);
+ 	free(parent_dir_entry);
+ 	return -1;
+ }
+-- 
+1.8.1.4
+
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 7ecce60..8129cd5 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -14,7 +14,9 @@ DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
 SRCREV = "8cae1840afb3ea44dcc298f32983e577480dfee4"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git \
-           file://weak-defaults.patch"
+           file://weak-defaults.patch \
+           file://allow-relative-path.patch \
+          "
 
 S = "${WORKDIR}/git"
 
-- 
1.8.3.1


