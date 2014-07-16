Return-Path: <richard@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id C46C0705FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Jul 2014 16:37:20 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s6GGQTjU011065; Wed, 16 Jul 2014 17:26:34 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id cGZmeP2-sj7c; Wed, 16 Jul 2014 17:26:34 +0100 (BST)
Received: from ted (bebox.config [87.81.244.161] (may be forged))
	(authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s6GGQR6x011049
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Wed, 16 Jul 2014 17:26:29 +0100
Received: from richard by ted with local (Exim 4.80)
	(envelope-from <richard@dan.rpsys.net>)
	id 1X7S2A-0004Nv-NJ; Wed, 16 Jul 2014 17:26:22 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Jul 2014 17:26:12 +0100
Message-Id: <b9627cb9dbd89386accfc31ea687906c210e08b5.1405527926.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.9.2
In-Reply-To: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
References: <381d8ad7d600a74e21c8f8590dde2db0cdbd9584.1405527926.git.richard.purdie@linuxfoundation.org>
In-Reply-To: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
References: <cover.1405527926.git.richard.purdie@linuxfoundation.org>
Subject: [PATCH 13/19] btrfs-tools: Upgrade 3.12 -> 3.14.2
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
X-List-Received-Date: Wed, 16 Jul 2014 16:37:21 -0000

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../btrfs-tools/allow-relative-path.patch          | 58 ----------------------
 .../btrfs-tools/btrfs-tools/nodocs.patch           | 22 ++++++++
 .../btrfs-tools/btrfs-tools/weak-defaults.patch    | 31 ------------
 .../btrfs-tools/btrfs-tools_git.bb                 |  9 ++--
 4 files changed, 25 insertions(+), 95 deletions(-)
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
 delete mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch

diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch
deleted file mode 100644
index 695973e..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/allow-relative-path.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From: Gui Hecheng <guihc.fnst@cn.fujitsu.com>
-
-The bug accurs when exec:
-	# mkfs.btrfs -r <a relative path> <device>
-	(note: the path should be 'valid' correspond to your `pwd`)
-error msg:
-	$ scandir for <a relative path> failed: No such file...
-
-Replace strdup() with realpath() to get the correct scan path.
-
-Upstream-Status: Backport (pending)
-
-Reported-by: Saul Wold <sgw@linux.intel.com>
-Signed-off-by: Gui Hecheng <guihc.fnst@cn.fujitsu.com>
----
- mkfs.c | 5 ++---
- 1 file changed, 2 insertions(+), 3 deletions(-)
-
-diff --git a/mkfs.c b/mkfs.c
-index 2dc90c2..1bd3069 100644
---- a/mkfs.c
-+++ b/mkfs.c
-@@ -756,6 +756,7 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
- 	ino_t parent_inum, cur_inum;
- 	ino_t highest_inum = 0;
- 	char *parent_dir_name;
-+	char real_path[PATH_MAX];
- 	struct btrfs_path path;
- 	struct extent_buffer *leaf;
- 	struct btrfs_key root_dir_key;
-@@ -764,7 +765,7 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
- 	/* Add list for source directory */
- 	dir_entry = malloc(sizeof(struct directory_name_entry));
- 	dir_entry->dir_name = dir_name;
--	dir_entry->path = strdup(dir_name);
-+	dir_entry->path = realpath(dir_name, real_path);
- 
- 	parent_inum = highest_inum + BTRFS_FIRST_FREE_OBJECTID;
- 	dir_entry->inum = parent_inum;
-@@ -876,7 +877,6 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
- 		}
- 
- 		free_namelist(files, count);
--		free(parent_dir_entry->path);
- 		free(parent_dir_entry);
- 
- 		index_cnt = 2;
-@@ -887,7 +887,6 @@ static int traverse_directory(struct btrfs_trans_handle *trans,
- fail:
- 	free_namelist(files, count);
- fail_no_files:
--	free(parent_dir_entry->path);
- 	free(parent_dir_entry);
- 	return -1;
- }
--- 
-1.8.1.4
-
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
new file mode 100644
index 0000000..6df4e10
--- /dev/null
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools/nodocs.patch
@@ -0,0 +1,22 @@
+Doc generation requires xmlto and ascidoc which we don't have right now.
+Disable doc generation until such times as we have the right dependencies.
+
+RP 2014/7/16
+
+Upstream-Status: Inappropriate
+
+Index: git/Makefile
+===================================================================
+--- git.orig/Makefile	2014-07-16 13:21:43.289386655 +0000
++++ git/Makefile	2014-07-16 13:42:46.453421079 +0000
+@@ -57,8 +57,8 @@
+ btrfs_fragment_libs = -lgd -lpng -ljpeg -lfreetype
+ 
+ SUBDIRS =
+-BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS)) build-Documentation
+-INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS)) install-Documentation
++BUILDDIRS = $(patsubst %,build-%,$(SUBDIRS))
++INSTALLDIRS = $(patsubst %,install-%,$(SUBDIRS))
+ CLEANDIRS = $(patsubst %,clean-%,$(SUBDIRS))
+ 
+ .PHONY: $(SUBDIRS)
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch b/meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch
deleted file mode 100644
index 9ca9fca..0000000
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools/weak-defaults.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-Upstream-Status: Pending
-
-Allow mandir to be set from the environment, fixing the following packaging warnings:
-
-WARNING: For recipe btrfs-tools, the following files were installed but not shipped in any package:
-WARNING:   /usr/man/man8/btrfs-show.8.gz
-WARNING:   /usr/man/man8/btrfs-image.8.gz
-WARNING:   /usr/man/man8/btrfsctl.8.gz
-WARNING:   /usr/man/man8/btrfs.8.gz
-WARNING:   /usr/man/man8/btrfsck.8.gz
-WARNING:   /usr/man/man8/mkfs.btrfs.8.gz
-
-RP - 5/7/2011
-
-Index: git/man/Makefile
-===================================================================
---- git.orig/man/Makefile	2011-07-05 22:03:58.949919067 +0100
-+++ git/man/Makefile	2011-07-05 22:04:07.789919856 +0100
-@@ -2,9 +2,9 @@
- INSTALL= install
- 
- prefix ?= /usr/local
--bindir = $(prefix)/bin
--mandir = $(prefix)/man
--man8dir = $(mandir)/man8
-+bindir ?= $(prefix)/bin
-+mandir ?= $(prefix)/man
-+man8dir ?= $(mandir)/man8
- 
- MANPAGES = mkfs.btrfs.8.gz btrfsctl.8.gz btrfsck.8.gz btrfs-image.8.gz \
- 	   btrfs-show.8.gz btrfs.8.gz
diff --git a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
index 8129cd5..0eed13b 100644
--- a/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
+++ b/meta/recipes-devtools/btrfs-tools/btrfs-tools_git.bb
@@ -12,15 +12,12 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
 SECTION = "base"
 DEPENDS = "util-linux attr e2fsprogs lzo acl"
 
-SRCREV = "8cae1840afb3ea44dcc298f32983e577480dfee4"
+SRCREV = "24cf4d8c3ee924b474f68514e0167cc2e602a48d"
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/mason/btrfs-progs.git \
-           file://weak-defaults.patch \
-           file://allow-relative-path.patch \
-          "
-
+           file://nodocs.patch"
 S = "${WORKDIR}/git"
 
-PV = "3.12+git${SRCPV}"
+PV = "3.14.2+git${SRCPV}"
 
 
 do_install () {
-- 
1.9.2


