Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2AE3A65CBC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2016 03:22:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u5M3MjhN002582
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 21 Jun 2016 20:22:45 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 21 Jun 2016 20:22:44 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Jun 2016 23:22:42 -0400
Message-ID: <1466565762-246667-1-git-send-email-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH] e2fsprogs: tweak mke2fs ext4 features
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
X-List-Received-Date: Wed, 22 Jun 2016 03:22:48 -0000
Content-Type: text/plain

While e2fsprogs upgraded to 1.43, it dropped the patch
Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch,
we get it back and rebase for 1.43 to fix invoking grub-probe
failed.

Without the fix:
...
root@localhost:~# mkfs.ext4 /dev/sda3
[skip]
root@localhost:~# grub-probe --target=fs -d /dev/sda3
grub-probe: error: unknown filesystem.
...

After apply the fix:
...
root@localhost:~# mkfs.ext4 /dev/sda3
[skip]
root@localhost:~# grub-probe --target=fs -d /dev/sda3
ext2
...

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 ...fs-enable-the-metadata_csum-and-64bit-fea.patch | 39 ++++++++++++++++++++++
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb  |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
new file mode 100644
index 0000000..e66cd4d
--- /dev/null
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
@@ -0,0 +1,39 @@
+From 0a392baf1874964651115d9f77b0daa6851d1daa Mon Sep 17 00:00:00 2001
+From: Jonathan Liu <net147@gmail.com>
+Date: Tue, 1 Mar 2016 14:28:01 +1100
+Subject: [PATCH] Revert "mke2fs: enable the metadata_csum and 64bit features
+ by default"
+
+This reverts commit cd27af3ecb83e8fd1e3eaa14994284a1818c7c15 as we
+don't want to enable features by default that are not supported by
+the latest stable e2fsprogs release.
+
+Upstream-Status: Inappropriate [configuration]
+Signed-off-by: Jonathan Liu <net147@gmail.com>
+
+Rebase to 1.43:
+The upstream has disabled metadata_csum by default
+this rebase just revert 64bit feature.
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ misc/mke2fs.conf.in | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
+index 78fe50a..6f1940e 100644
+--- a/misc/mke2fs.conf.in
++++ b/misc/mke2fs.conf.in
+@@ -11,8 +11,9 @@
+ 		features = has_journal
+ 	}
+ 	ext4 = {
+-		features = has_journal,extent,huge_file,flex_bg,64bit,dir_nlink,extra_isize
++		features = has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize
+ 		inode_size = 256
++		auto_64-bit_support = 1
+ 	}
+ 	ext4dev = {
+ 		features = has_journal,extent,huge_file,flex_bg,inline_data,64bit,dir_nlink,extra_isize
+-- 
+2.8.1
+
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
index aa1cbce..e82124b 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.bb
@@ -8,6 +8,7 @@ SRC_URI += "file://acinclude.m4 \
             file://run-ptest \
             file://ptest.patch \
             file://mkdir.patch \
+            file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
 "
 
 SRCREV = "d6adf070b0e85f209c0d7f310188b134b5cb7180"
-- 
2.8.1


