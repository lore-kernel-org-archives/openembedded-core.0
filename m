Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id CDA226F664
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Mar 2014 06:59:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s276xd2B016387
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 6 Mar 2014 22:59:39 -0800 (PST)
Received: from pek-hostel-vm02.wrs.com (128.224.153.172) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Thu, 6 Mar 2014 22:59:38 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 7 Mar 2014 01:59:22 -0500
Message-ID: <b0d870674638d7abbcabbdfeb96f8c9b9150b280.1394174908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1394174908.git.liezhi.yang@windriver.com>
References: <cover.1394174908.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/14] e2fsprogs: mke2fs: add the ability to copy files from a given directory
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
X-List-Received-Date: Fri, 07 Mar 2014 06:59:39 -0000
Content-Type: text/plain

We will add a -d option which will be used for adding the files from a
given directory to the filesystem, it is similiar to genext2fs, but
genext2fs doesn't fully support ext4.

* We already have the basic operations in debugfs:
  - Copy regular file
  - Create directory
  - Create symlink
  - Create special file

  We will move these operations into create_inode.h and create_inode.c,
  then let both mke2fs and debugfs use them.

* What we need to do are:
  - Copy the given directory recursively, this will be done by the
    populate_fs()
  - Set the owner, mode and other informations
  - Handle the hard links

TODO:
  - The libext2fs can't create the socket file (S_IFSOCK), do we have a
    plan to support it ?

[YOCTO #4083]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Reviewed-by: Darren Hart <dvhart@linux.intel.com>
---
 ...the-ability-to-copy-files-from-a-given-di.patch |   98 ++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
new file mode 100644
index 0000000..9ea413e
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-mke2fs-add-the-ability-to-copy-files-from-a-given-di.patch
@@ -0,0 +1,98 @@
+From c98fec004f077e566b9dfa20b25e3b86cb462a2e Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Tue, 24 Dec 2013 01:41:08 -0500
+Subject: [PATCH 01/11] mke2fs: add the ability to copy files from a given
+ directory
+
+We will add a -d option which will be used for adding the files from a
+given directory to the filesystem, it is similiar to genext2fs, but
+genext2fs doesn't fully support ext4.
+
+* We already have the basic operations in debugfs:
+  - Copy regular file
+  - Create directory
+  - Create symlink
+  - Create special file
+
+  We will move these operations into create_inode.h and create_inode.c,
+  then let both mke2fs and debugfs use them.
+
+* What we need to do are:
+  - Copy the given directory recursively, this will be done by the
+    populate_fs()
+  - Set the owner, mode and other informations
+  - Handle the hard links
+
+TODO:
+  - The libext2fs can't create the socket file (S_IFSOCK), do we have a
+    plan to support it ?
+
+Upstream-Status: Backport
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+Reviewed-by: Darren Hart <dvhart@linux.intel.com>
+---
+ misc/create_inode.c |   26 ++++++++++++++++++++++++++
+ misc/create_inode.h |   17 +++++++++++++++++
+ 2 files changed, 43 insertions(+)
+ create mode 100644 misc/create_inode.c
+ create mode 100644 misc/create_inode.h
+
+diff --git a/misc/create_inode.c b/misc/create_inode.c
+new file mode 100644
+index 0000000..46aaa60
+--- /dev/null
++++ b/misc/create_inode.c
+@@ -0,0 +1,26 @@
++#include "create_inode.h"
++
++/* Make a special file which is block, character and fifo */
++errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st)
++{
++}
++
++/* Make a symlink name -> target */
++errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target)
++{
++}
++
++/* Make a directory in the fs */
++errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st)
++{
++}
++
++/* Copy the native file to the fs */
++errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest)
++{
++}
++
++/* Copy files from source_dir to fs */
++errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir)
++{
++}
+diff --git a/misc/create_inode.h b/misc/create_inode.h
+new file mode 100644
+index 0000000..9fc97fa
+--- /dev/null
++++ b/misc/create_inode.h
+@@ -0,0 +1,17 @@
++#include <sys/types.h>
++#include <sys/stat.h>
++#include <fcntl.h>
++#include "et/com_err.h"
++#include "e2p/e2p.h"
++#include "ext2fs/ext2fs.h"
++#include "nls-enable.h"
++
++ext2_filsys    current_fs;
++ext2_ino_t     root;
++
++/* For populating the filesystem */
++extern errcode_t populate_fs(ext2_ino_t parent_ino, const char *source_dir);
++extern errcode_t do_mknod_internal(ext2_ino_t cwd, const char *name, struct stat *st);
++extern errcode_t do_symlink_internal(ext2_ino_t cwd, const char *name, char *target);
++extern errcode_t do_mkdir_internal(ext2_ino_t cwd, const char *name, struct stat *st);
++extern errcode_t do_write_internal(ext2_ino_t cwd, const char *src, const char *dest);
+-- 
+1.7.10.4
+
-- 
1.7.10.4


