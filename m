Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.5178.1631250112989183276
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Sep 2021 22:01:53 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: kai.kang@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 18A51poD014531
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 22:01:51 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 18A51p7X020000
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>; Thu, 9 Sep 2021 22:01:51 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Thu, 9 Sep 2021 22:01:50 -0700
Received: from pek-lpg-core3.wrs.com (128.224.153.232) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Thu, 9 Sep 2021 22:01:50 -0700
From: "kai" <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [hardknott][PATCH] squashfs-tools: fix CVE-2021-40153
Date: Fri, 10 Sep 2021 13:01:44 +0800
Message-ID: <20210910050144.24445-1-kai.kang@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Backport patch to fix CVE-2021-40153, and remove version update in
unsquashfs.c for compatible.

CVE: CVE-2021-40153

Ref:
* https://security-tracker.debian.org/tracker/CVE-2021-40153

Signed-off-by: Kai Kang <kai.kang@windriver.com>
---
 .../squashfs-tools/files/CVE-2021-40153.patch | 253 ++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb      |   1 +
 2 files changed, 254 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch

diff --git a/meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch
new file mode 100644
index 0000000000..95e2534ee4
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/files/CVE-2021-40153.patch
@@ -0,0 +1,253 @@
+Backport patch to fix CVE-2021-40153, and remove version update in unsquashfs.c
+for compatible.
+
+Upstream-Status: Backport [https://github.com/plougher/squashfs-tools/commit/79b5a55]
+CVE: CVE-2021-40153
+
+Signed-off-by: Kai Kang <kai.kang@windriver.com>
+
+From 79b5a555058eef4e1e7ff220c344d39f8cd09646 Mon Sep 17 00:00:00 2001
+From: Phillip Lougher <phillip@squashfs.org.uk>
+Date: Sat, 16 Jan 2021 20:08:55 +0000
+Subject: [PATCH] Unsquashfs: fix write outside destination directory exploit
+
+An issue on Github (https://github.com/plougher/squashfs-tools/issues/72)
+shows how some specially crafted Squashfs filesystems containing
+invalid file names (with '/' and ..) can cause Unsquashfs to write
+files outside of the destination directory.
+
+This commit fixes this exploit by checking all names for
+validity.
+
+In doing so I have also added checks for '.' and for names that
+are shorter than they should be (names in the file system should
+not have '\0' terminators).
+
+Signed-off-by: Phillip Lougher <phillip@squashfs.org.uk>
+---
+ squashfs-tools/Makefile        |  5 ++-
+ squashfs-tools/unsquash-1.c    |  9 +++++-
+ squashfs-tools/unsquash-1234.c | 58 ++++++++++++++++++++++++++++++++++
+ squashfs-tools/unsquash-2.c    |  9 +++++-
+ squashfs-tools/unsquash-3.c    |  9 +++++-
+ squashfs-tools/unsquash-4.c    |  9 +++++-
+ squashfs-tools/unsquashfs.h    |  5 ++-
+ 7 files changed, 98 insertions(+), 6 deletions(-)
+ create mode 100644 squashfs-tools/unsquash-1234.c
+
+diff --git a/squashfs-tools/Makefile b/squashfs-tools/Makefile
+index aee4b960..20feaca2 100644
+--- a/squashfs-tools/Makefile
++++ b/squashfs-tools/Makefile
+@@ -156,7 +156,8 @@ MKSQUASHFS_OBJS = mksquashfs.o read_fs.o action.o swap.o pseudo.o compressor.o \
+ 	caches-queues-lists.o
+ 
+ UNSQUASHFS_OBJS = unsquashfs.o unsquash-1.o unsquash-2.o unsquash-3.o \
+-	unsquash-4.o unsquash-123.o unsquash-34.o swap.o compressor.o unsquashfs_info.o
++	unsquash-4.o unsquash-123.o unsquash-34.o unsquash-1234.o swap.o \
++	compressor.o unsquashfs_info.o
+ 
+ CFLAGS ?= -O2
+ CFLAGS += $(EXTRA_CFLAGS) $(INCLUDEDIR) -D_FILE_OFFSET_BITS=64 \
+@@ -350,6 +351,8 @@ unsquash-123.o: unsquashfs.h unsquash-123.c squashfs_fs.h squashfs_compat.h
+ 
+ unsquash-34.o: unsquashfs.h unsquash-34.c
+ 
++unsquash-1234.o: unsquash-1234.c
++
+ unsquashfs_xattr.o: unsquashfs_xattr.c unsquashfs.h squashfs_fs.h xattr.h
+ 
+ unsquashfs_info.o: unsquashfs.h squashfs_fs.h
+diff --git a/squashfs-tools/unsquash-1.c b/squashfs-tools/unsquash-1.c
+index 34eced36..28326cb1 100644
+--- a/squashfs-tools/unsquash-1.c
++++ b/squashfs-tools/unsquash-1.c
+@@ -2,7 +2,7 @@
+  * Unsquash a squashfs filesystem.  This is a highly compressed read only
+  * filesystem.
+  *
+- * Copyright (c) 2009, 2010, 2011, 2012, 2019
++ * Copyright (c) 2009, 2010, 2011, 2012, 2019, 2021
+  * Phillip Lougher <phillip@squashfs.org.uk>
+  *
+  * This program is free software; you can redistribute it and/or
+@@ -285,6 +285,13 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 			memcpy(dire->name, directory_table + bytes,
+ 				dire->size + 1);
+ 			dire->name[dire->size + 1] = '\0';
++
++			/* check name for invalid characters (i.e /, ., ..) */
++			if(check_name(dire->name, dire->size + 1) == FALSE) {
++				ERROR("File system corrupted: invalid characters in name\n");
++				goto corrupted;
++			}
++
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+diff --git a/squashfs-tools/unsquash-1234.c b/squashfs-tools/unsquash-1234.c
+new file mode 100644
+index 00000000..c2d4f42b
+--- /dev/null
++++ b/squashfs-tools/unsquash-1234.c
+@@ -0,0 +1,58 @@
++/*
++ * Unsquash a squashfs filesystem.  This is a highly compressed read only
++ * filesystem.
++ *
++ * Copyright (c) 2021
++ * Phillip Lougher <phillip@squashfs.org.uk>
++ *
++ * This program is free software; you can redistribute it and/or
++ * modify it under the terms of the GNU General Public License
++ * as published by the Free Software Foundation; either version 2,
++ * or (at your option) any later version.
++ *
++ * This program is distributed in the hope that it will be useful,
++ * but WITHOUT ANY WARRANTY; without even the implied warranty of
++ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
++ * GNU General Public License for more details.
++ *
++ * You should have received a copy of the GNU General Public License
++ * along with this program; if not, write to the Free Software
++ * Foundation, 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
++ *
++ * unsquash-1234.c
++ *
++ * Helper functions used by unsquash-1, unsquash-2, unsquash-3 and
++ * unsquash-4.
++ */
++
++#define TRUE 1
++#define FALSE 0
++/*
++ * Check name for validity, name should not
++ *  - be ".", "./", or
++ *  - be "..", "../" or
++ *  - have a "/" anywhere in the name, or
++ *  - be shorter than the expected size
++ */
++int check_name(char *name, int size)
++{
++	char *start = name;
++
++	if(name[0] == '.') {
++		if(name[1] == '.')
++			name++;
++		if(name[1] == '/' || name[1] == '\0')
++			return FALSE;
++	}
++
++	while(name[0] != '/' && name[0] != '\0')
++		name ++;
++
++	if(name[0] == '/')
++		return FALSE;
++
++	if((name - start) != size)
++		return FALSE;
++
++	return TRUE;
++}
+diff --git a/squashfs-tools/unsquash-2.c b/squashfs-tools/unsquash-2.c
+index 4b3d767e..474064e1 100644
+--- a/squashfs-tools/unsquash-2.c
++++ b/squashfs-tools/unsquash-2.c
+@@ -2,7 +2,7 @@
+  * Unsquash a squashfs filesystem.  This is a highly compressed read only
+  * filesystem.
+  *
+- * Copyright (c) 2009, 2010, 2013, 2019
++ * Copyright (c) 2009, 2010, 2013, 2019, 2021
+  * Phillip Lougher <phillip@squashfs.org.uk>
+  *
+  * This program is free software; you can redistribute it and/or
+@@ -386,6 +386,13 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 			memcpy(dire->name, directory_table + bytes,
+ 				dire->size + 1);
+ 			dire->name[dire->size + 1] = '\0';
++
++			/* check name for invalid characters (i.e /, ., ..) */
++			if(check_name(dire->name, dire->size + 1) == FALSE) {
++				ERROR("File system corrupted: invalid characters in name\n");
++				goto corrupted;
++			}
++
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+diff --git a/squashfs-tools/unsquash-3.c b/squashfs-tools/unsquash-3.c
+index 02c31fc5..65cfe4d9 100644
+--- a/squashfs-tools/unsquash-3.c
++++ b/squashfs-tools/unsquash-3.c
+@@ -2,7 +2,7 @@
+  * Unsquash a squashfs filesystem.  This is a highly compressed read only
+  * filesystem.
+  *
+- * Copyright (c) 2009, 2010, 2011, 2012, 2013, 2019
++ * Copyright (c) 2009, 2010, 2011, 2012, 2013, 2019, 2021
+  * Phillip Lougher <phillip@squashfs.org.uk>
+  *
+  * This program is free software; you can redistribute it and/or
+@@ -413,6 +413,13 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 			memcpy(dire->name, directory_table + bytes,
+ 				dire->size + 1);
+ 			dire->name[dire->size + 1] = '\0';
++
++			/* check name for invalid characters (i.e /, ., ..) */
++			if(check_name(dire->name, dire->size + 1) == FALSE) {
++				ERROR("File system corrupted: invalid characters in name\n");
++				goto corrupted;
++			}
++
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
+index 8475835c..aa23a841 100644
+--- a/squashfs-tools/unsquash-4.c
++++ b/squashfs-tools/unsquash-4.c
+@@ -2,7 +2,7 @@
+  * Unsquash a squashfs filesystem.  This is a highly compressed read only
+  * filesystem.
+  *
+- * Copyright (c) 2009, 2010, 2011, 2012, 2013, 2019
++ * Copyright (c) 2009, 2010, 2011, 2012, 2013, 2019, 2021
+  * Phillip Lougher <phillip@squashfs.org.uk>
+  *
+  * This program is free software; you can redistribute it and/or
+@@ -349,6 +349,13 @@ static struct dir *squashfs_opendir(unsigned int block_start, unsigned int offse
+ 			memcpy(dire->name, directory_table + bytes,
+ 				dire->size + 1);
+ 			dire->name[dire->size + 1] = '\0';
++
++			/* check name for invalid characters (i.e /, ., ..) */
++			if(check_name(dire->name, dire->size + 1) == FALSE) {
++				ERROR("File system corrupted: invalid characters in name\n");
++				goto corrupted;
++			}
++
+ 			TRACE("squashfs_opendir: directory entry %s, inode "
+ 				"%d:%d, type %d\n", dire->name,
+ 				dirh.start_block, dire->offset, dire->type);
+diff --git a/squashfs-tools/unsquashfs.h b/squashfs-tools/unsquashfs.h
+index 934618b2..db1da7a0 100644
+--- a/squashfs-tools/unsquashfs.h
++++ b/squashfs-tools/unsquashfs.h
+@@ -4,7 +4,7 @@
+  * Unsquash a squashfs filesystem.  This is a highly compressed read only
+  * filesystem.
+  *
+- * Copyright (c) 2009, 2010, 2013, 2014, 2019
++ * Copyright (c) 2009, 2010, 2013, 2014, 2019, 2021
+  * Phillip Lougher <phillip@squashfs.org.uk>
+  *
+  * This program is free software; you can redistribute it and/or
+@@ -261,4 +261,7 @@ extern int read_ids(int, long long, long long, unsigned int **);
+ 
+ /* unsquash-34.c */
+ extern long long *alloc_index_table(int);
++
++/* unsquash-1234.c */
++extern int check_name(char *, int);
+ #endif
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 2b1409d78d..083e597b03 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -11,6 +11,7 @@ PV = "4.4"
 SRCREV = "52eb4c279cd283ed9802dd1ceb686560b22ffb67"
 SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://0001-squashfs-tools-fix-build-failure-against-gcc-10.patch;striplevel=2 \
+           file://CVE-2021-40153.patch;striplevel=2 \
 "
 
 S = "${WORKDIR}/git/squashfs-tools"
-- 
2.17.1

