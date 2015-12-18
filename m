Return-Path: <Jian.Liu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4582560721
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 09:41:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id tBI9f3CS019748
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Dec 2015 01:41:03 -0800 (PST)
Received: from pek-jliu7-d1.corp.ad.wrs.com (128.224.162.169) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Fri, 18 Dec 2015 01:41:03 -0800
From: Jian Liu <jian.liu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 18 Dec 2015 17:40:56 +0800
Message-ID: <1450431656-12921-1-git-send-email-jian.liu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/1] Fix missing check for permission denied.
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
X-List-Received-Date: Fri, 18 Dec 2015 09:41:05 -0000
Content-Type: text/plain

If the path to "ROOT_SYSCONFDIR /mke2fs.conf" has a permission denied problem,
then the get_dirlist() call will return EACCES. But the code in profile_init
will treat that as a fatal error and all executions will fail with:
      Couldn't init profile successfully (error: 13).

But the problem should not really be visible for the target package as the path
then will be "/etc/mke2fs.conf", and it is not likely that a user have no
permission to read /etc.

Signed-off-by: Jian Liu <jian.liu@windriver.com>
---
 .../fix-missing-check-for-permission-denied.patch  | 23 ++++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |  1 +
 2 files changed, 24 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-missing-check-for-permission-denied.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-missing-check-for-permission-denied.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-missing-check-for-permission-denied.patch
new file mode 100644
index 0000000..3287eb3
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/fix-missing-check-for-permission-denied.patch
@@ -0,0 +1,23 @@
+Fix missing check for permission denied.
+
+If the path to "ROOT_SYSCONFDIR/mke2fs.conf" has a permission denied problem, 
+then the get_dirlist() call will return EACCES. But the code in profile_init 
+will treat that as a fatal error and all executions will fail with: 
+      Couldn't init profile successfully (error: 13).
+
+Upstream-Status: Pending
+
+Written-by: Henrik Wallin <henrik.b.wallin@ericsson.com>
+
+diff -Nur e2fsprogs-1.42.9.orig/e2fsck/profile.c e2fsprogs-1.42.9/e2fsck/profile.c
+--- e2fsprogs-1.42.9.orig/e2fsck/profile.c	2015-12-18 17:29:52.904625948 +0800
++++ e2fsprogs-1.42.9/e2fsck/profile.c	2015-12-18 17:31:02.484626433 +0800
+@@ -333,7 +333,7 @@
+ 				*last = new_file;
+ 				last = &new_file->next;
+ 			}
+-		} else if ((retval != ENOTDIR) &&
++		} else if ((retval != ENOTDIR) && (retval != EACCES) &&
+ 			   strcmp(*fs, default_filename))
+ 			goto errout;
+ 
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
index ce7d2e8..961af40 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb
@@ -25,6 +25,7 @@ SRC_URI += "file://acinclude.m4 \
             file://0001-libext2fs-fix-potential-buffer-overflow-in-closefs.patch \
             file://copy-in-create-hardlinks-with-the-correct-directory-.patch \
 "
+SRC_URI_append_class-native = " file://fix-missing-check-for-permission-denied.patch"
 
 SRC_URI[md5sum] = "3f8e41e63b432ba114b33f58674563f7"
 SRC_URI[sha256sum] = "2f92ac06e92fa00f2ada3ee67dad012d74d685537527ad1241d82f2d041f2802"
-- 
1.9.1


