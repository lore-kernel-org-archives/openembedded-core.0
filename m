Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id C563A7EF15
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 09:48:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 45mhgk3tF4zC6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2019 11:48:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1563097730;
	bh=YEHWXiXpa+jhpvEYeOqWs4afVjNs3CRZGpJBoVM0hu0=;
	h=From:To:Subject:Date:From;
	b=k/0WkxbZzWAQXQrx0OhgUNIBcMNb1G64UzCdVyP3zUycr9p8L1RWeyrPDtUjaJ39P
	4IwGw473Wc5Lig0kgAxDQjdOr2fnuSDCfVc+SmOVQmm4yq/4bWe0n02HSk/Tz1KbEM
	gIMwf5TA15Y5f6QixjMLuJ/UIQoCetVxUzzt4NzezRdbbUZ4WZ59N9k3CD2JdBvnM9
	w2MMn87HT0npVWaD7FjqF/LtNw1F99qDr6AlZ+cwm66paIAX253WSFSE/S6j6dA98/
	1K98Wh9NWXUAMHdtJpNw5aiqiCVMrKRPrNwR75mZt4uvp6iOBorK9ukZQa7GAaZRfd
	urndcYhX3BedgUiFPejH66UEk0jBc5xIQFHRdVCOnPNQOe/E4thVCLoc/lJSha499d
	jYEbSdZKN22oqC8/LUPkr9D+APqNFOQLqEnySMS4cBKL3oSqJvKw0jTm2AdpYcjsRF
	tzpFPMm6FfF29Mx/4zfhoT6YAC9anDXjFk02O1AwqCFhce0dplegW4gIGcJqeU5oRI
	NvU/bf9L1MNzi0A/A5/k3GNuChW+6tNmCJJs9wFZi0CnF/Jy34wysSwdMJMjT9WBA2
	CL2jH5m9QtUbUZTG9zt8XC0UPeGYDAq3kUvSgVSj4NU3qdmvRpPn27BlN4Z4y8XgX8
	64zpptBcE0ViXgwCJF/z2BPQ=
From: Adrian Bunk <bunk@stusta.de>
To: openembedded-core@lists.openembedded.org
Date: Sun, 14 Jul 2019 12:48:49 +0300
Message-Id: <20190714094849.9263-1-bunk@stusta.de>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] e2fsprogs: Remove patch that disabled 64bit for ext4 by default
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
X-List-Received-Date: Sun, 14 Jul 2019 09:48:51 -0000

OE no longer ships a git snapshot of e2fsprogs,
so use the new upstream default now.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 ...able-the-metadata_csum-and-64bit-fea.patch | 36 -------------------
 .../e2fsprogs/e2fsprogs_1.44.5.bb             |  1 -
 2 files changed, 37 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch

diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch b/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
deleted file mode 100644
index d7e09b6be9..0000000000
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs/Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 0a392baf1874964651115d9f77b0daa6851d1daa Mon Sep 17 00:00:00 2001
-From: Jonathan Liu <net147@gmail.com>
-Date: Tue, 1 Mar 2016 14:28:01 +1100
-Subject: [PATCH] Revert "mke2fs: enable the metadata_csum and 64bit features
- by default"
-
-This reverts commit cd27af3ecb83e8fd1e3eaa14994284a1818c7c15 as we
-don't want to enable features by default that are not supported by
-the latest stable e2fsprogs release.
-
-Upstream-Status: Inappropriate [configuration]
-Signed-off-by: Jonathan Liu <net147@gmail.com>
-
-Rebase to 1.43:
-The upstream has disabled metadata_csum by default
-this rebase just revert 64bit feature.
-Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
----
- misc/mke2fs.conf.in | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/misc/mke2fs.conf.in b/misc/mke2fs.conf.in
-index 01e35cf..25105b3 100644
---- a/misc/mke2fs.conf.in
-+++ b/misc/mke2fs.conf.in
-@@ -11,8 +11,9 @@
- 		features = has_journal
- 	}
- 	ext4 = {
--		features = has_journal,extent,huge_file,flex_bg,metadata_csum,64bit,dir_nlink,extra_isize
-+		features = has_journal,extent,huge_file,flex_bg,metadata_csum,dir_nlink,extra_isize
- 		inode_size = 256
-+		auto_64-bit_support = 1
- 	}
- 	small = {
- 		blocksize = 1024
diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
index ed946159bd..5cda89f59f 100644
--- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
+++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.44.5.bb
@@ -3,7 +3,6 @@ require e2fsprogs.inc
 SRC_URI += "file://remove.ldconfig.call.patch \
             file://run-ptest \
             file://ptest.patch \
-            file://Revert-mke2fs-enable-the-metadata_csum-and-64bit-fea.patch \
             file://mkdir_p.patch \
             file://0001-misc-create_inode.c-set-dir-s-mode-correctly.patch \
             file://0001-create_inode-fix-copying-large-files.patch \
-- 
2.17.1


