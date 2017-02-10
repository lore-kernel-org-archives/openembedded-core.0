Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7B80D6010B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 03:23:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v1A3NHGa007855
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 19:23:18 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 19:23:17 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 19:23:06 -0800
Message-ID: <603cddba527b5c9a801acc22c88e0ba2d622fb9c.1486696950.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.11.0.rc2.dirty
In-Reply-To: <cover.1486696950.git.liezhi.yang@windriver.com>
References: <cover.1486696950.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 01/10] e2fsprogs: 1.43.3 -> 1.43.4
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
X-List-Received-Date: Fri, 10 Feb 2017 03:23:20 -0000
Content-Type: text/plain

* Rebased Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch.
* The mkfs.ext4dev is gone.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 .../Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch   | 9 +++------
 .../e2fsprogs/{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb}       | 6 ++----
 2 files changed, 5 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.3.bb => e2fsprogs_1.43.4.bb} (96%)

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
index e66cd4d1a7e..38fb07e6e6e 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
@@ -20,20 +20,17 @@ Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
  1 file changed, 2 insertions(+), 1 deletion(-)
 
 diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
-index 78fe50a..6f1940e 100644
+index 812f7c7..0280398 100644
 --- a/misc/mke2fs.conf.in
 +++ b/misc/mke2fs.conf.in
 @@ -11,8 +11,9 @@
  		features = has_journal
  	}
  	ext4 = {
--		features = has_journal,extent,huge_file,flex_bg,64bit,dir_nlink,extra_isize
+-		features = has_journal,extent,huge_file,flex_bg,uninit_bg,64bit,dir_nlink,extra_isize
 +		features = has_journal,extent,huge_file,flex_bg,uninit_bg,dir_nlink,extra_isize
  		inode_size = 256
 +		auto_64-bit_support = 1
  	}
  	ext4dev = {
- 		features = has_journal,extent,huge_file,flex_bg,inline_data,64bit,dir_nlink,extra_isize
--- 
-2.8.1
-
+ 		features = has_journal,extent,huge_file,flex_bg,uninit_bg,inline_data,64bit,dir_nlink,extra_isize
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.3.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
similarity index 96%
rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.3.bb
rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
index ac4589c7c4d..4b06b189b03 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.3.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.4.bb
@@ -1,7 +1,5 @@
 require e2fsprogs.inc
 
-PR = "r1"
-
 SRC_URI += "file://acinclude.m4 \
             file://remove.ldconfig.call.patch \
             file://quiet-debugfs.patch \
@@ -13,7 +11,7 @@ SRC_URI += "file://acinclude.m4 \
 
 SRC_URI_append_class-native = " file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
 
-SRCREV = "4e52870eeb08ed7532bf4fd3d5cb1538f714bdc8"
+SRCREV = "3d66c4b20f09f923078c1e6eb9b549865b549674"
 UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
 
 EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
@@ -60,7 +58,7 @@ do_install () {
 
 # Need to find the right mke2fs.conf file
 e2fsprogs_conf_fixup () {
-	for i in mke2fs mkfs.ext2 mkfs.ext3 mkfs.ext4 mkfs.ext4dev; do
+	for i in mke2fs mkfs.ext2 mkfs.ext3 mkfs.ext4; do
 		create_wrapper ${D}${base_sbindir}/$i MKE2FS_CONFIG=${sysconfdir}/mke2fs.conf
 	done
 }
-- 
2.11.0.rc2.dirty


