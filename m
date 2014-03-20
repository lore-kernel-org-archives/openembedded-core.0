Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BBCB56F8F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 06:03:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2K63LRv025603
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Mar 2014 23:03:21 -0700 (PDT)
Received: from pek-blade16.wrs.com (128.224.153.44) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.169.1;
	Wed, 19 Mar 2014 23:03:21 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Mar 2014 14:08:43 +0800
Message-ID: <12128e4c5a9ab623fb4ddc8ed6df596d76df3f9d.1395295629.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1395295629.git.liezhi.yang@windriver.com>
References: <cover.1395295629.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] e2fsprogs: return error when failed to populate fs
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
X-List-Received-Date: Thu, 20 Mar 2014 06:03:22 -0000
Content-Type: text/plain

We need return retval when "mke2fs -d" failed, otherwise the "$?" would
be 0 which is misleading.

[YOCTO #6011]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...c-return-error-when-failed-to-populate-fs.patch | 37 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
new file mode 100644
index 0000000..9b467c3
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch
@@ -0,0 +1,37 @@
+From e4ffd6fe975888d306b5f700ba54af18b59f6759 Mon Sep 17 00:00:00 2001
+From: Robert Yang <liezhi.yang@windriver.com>
+Date: Thu, 20 Mar 2014 11:10:21 +0800
+Subject: [PATCH] misc/mke2fs.c: return error when failed to populate filesystem
+
+We need return retval when "mke2fs -d" failed, otherwise the "$?" would
+be 0 which is misleading.
+
+Upstream-Status Submitted
+
+Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
+---
+ misc/mke2fs.c | 7 ++++---
+ 1 file changed, 4 insertions(+), 3 deletions(-)
+
+diff --git a/misc/mke2fs.c b/misc/mke2fs.c
+index a63f0b7..846190e 100644
+--- a/misc/mke2fs.c
++++ b/misc/mke2fs.c
+@@ -2745,10 +2745,11 @@ no_journal:
+ 		current_fs = fs;
+ 		root = EXT2_ROOT_INO;
+ 		retval = populate_fs(root, root_dir);
+-		if (retval)
++		if (retval) {
+ 			fprintf(stderr, "%s",
+-				_("\nError while populating file system"));
+-		else if (!quiet)
++				_("\nError while populating file system\n"));
++			return retval;
++		} else if (!quiet)
+ 			printf("%s", _("done\n"));
+ 	}
+ 
+-- 
+1.8.3.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index 4114fd2..75a58b5 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -17,6 +17,7 @@ SRC_URI += "file://acinclude.m4 \
             file://0010-debugfs-use-the-functions-in-misc-create_inode.c.patch \
             file://0011-mke2fs.8.in-update-the-manual-for-the-d-option.patch \
             file://0001-e2fsprogs-fix-cross-compilation-problem.patch \
+            file://misc-mke2fs.c-return-error-when-failed-to-populate-fs.patch \
 "
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
-- 
1.8.3.1


