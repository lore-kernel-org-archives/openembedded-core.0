Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id EADA878558
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 09:03:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7S93q86010954
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2018 02:03:53 -0700 (PDT)
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 28 Aug 2018 02:03:52 -0700
From: <changqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 28 Aug 2018 17:03:51 +0800
Message-ID: <1535447031-313038-1-git-send-email-changqing.li@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH] squashfs-tools: patch for CVE-2015-4645(4646)
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
X-List-Received-Date: Tue, 28 Aug 2018 09:03:52 -0000
Content-Type: text/plain

From: Changqing Li <changqing.li@windriver.com>

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 ...-squashfs-tools-patch-for-CVE-2015-4645-6.patch | 47 ++++++++++++++++++++++
 .../squashfs-tools/squashfs-tools_git.bb           |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch
new file mode 100644
index 0000000..2261ea9
--- /dev/null
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools/0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch
@@ -0,0 +1,47 @@
+From 3c0d67184d6edb63f3b7d6d5eb81531daa6388f3 Mon Sep 17 00:00:00 2001
+From: Changqing Li <changqing.li@windriver.com>
+Date: Tue, 28 Aug 2018 16:25:36 +0800
+Subject: [PATCH] squashfs-tools: patch for CVE-2015-4645(6)
+
+Upstream-Status: Backport[https://github.com/devttys0/sasquatch/pull/
+                 5/commits/6777e08cc38bc780d27c69c1d8c272867b74524f]
+
+CVE: CVE-2015-4645 CVE-2015-4646
+
+Signed-off-by: Changqing Li <changqing.li@windriver.com>
+---
+ squashfs-tools/unsquash-4.c | 11 ++++++++---
+ 1 file changed, 8 insertions(+), 3 deletions(-)
+
+diff --git a/squashfs-tools/unsquash-4.c b/squashfs-tools/unsquash-4.c
+index ecdaac7..692ae25 100644
+--- a/squashfs-tools/unsquash-4.c
++++ b/squashfs-tools/unsquash-4.c
+@@ -31,9 +31,9 @@ static unsigned int *id_table;
+ int read_fragment_table_4(long long *directory_table_end)
+ {
+ 	int res, i;
+-	int bytes = SQUASHFS_FRAGMENT_BYTES(sBlk.s.fragments);
+-	int  indexes = SQUASHFS_FRAGMENT_INDEXES(sBlk.s.fragments);
+-	long long fragment_table_index[indexes];
++	size_t bytes = SQUASHFS_FRAGMENT_BYTES(sBlk.s.fragments);
++	size_t indexes = SQUASHFS_FRAGMENT_INDEXES(sBlk.s.fragments);
++	long long *fragment_table_index;
+ 
+ 	TRACE("read_fragment_table: %d fragments, reading %d fragment indexes "
+ 		"from 0x%llx\n", sBlk.s.fragments, indexes,
+@@ -43,6 +43,11 @@ int read_fragment_table_4(long long *directory_table_end)
+ 		*directory_table_end = sBlk.s.fragment_table_start;
+ 		return TRUE;
+ 	}
++        
++	fragment_table_index = malloc(indexes*sizeof(long long));
++	if(fragment_table_index == NULL)
++		EXIT_UNSQUASH("read_fragment_table: failed to allocate "
++			"fragment table index\n");
+ 
+ 	fragment_table = malloc(bytes);
+ 	if(fragment_table == NULL)
+-- 
+2.7.4
+
diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
index 4bee371..2f41263 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_git.bb
@@ -15,6 +15,7 @@ SRC_URI = "git://github.com/plougher/squashfs-tools.git;protocol=https \
            file://0001-mksquashfs.c-get-inline-functions-work-with-C99.patch;striplevel=2 \
            file://squashfs-tools-4.3-sysmacros.patch;striplevel=2 \
            file://fix-compat.patch \
+           file://0001-squashfs-tools-patch-for-CVE-2015-4645-6.patch;striplevel=2 \
 "
 UPSTREAM_CHECK_COMMITS = "1"
 SRC_URI[lzma.md5sum] = "29d5ffd03a5a3e51aef6a74e9eafb759"
-- 
2.7.4


