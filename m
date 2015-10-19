Return-Path: <Jun.Zhang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0541A770F2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:42:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9J9g7QL005697
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 02:42:07 -0700 (PDT)
Received: from pek-lpd-ccm1.wrs.com (128.224.179.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 19 Oct 2015 02:42:06 -0700
From: Jun Zhang <jun.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Oct 2015 17:41:55 +0800
Message-ID: <1445247715-81087-2-git-send-email-jun.zhang@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445247715-81087-1-git-send-email-jun.zhang@windriver.com>
References: <1445247715-81087-1-git-send-email-jun.zhang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] cpio: fix testcase symlink-bad-lengths [ LIN8-947 ]
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
X-List-Received-Date: Mon, 19 Oct 2015 09:42:07 -0000
Content-Type: text/plain

* fix the output of stderr & stdout to meet latest cpio

Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
---
 .../fix-testcase-symlink-bad-lengths.patch         | 33 ++++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch b/meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
new file mode 100644
index 0000000..a325f4b
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/fix-testcase-symlink-bad-lengths.patch
@@ -0,0 +1,33 @@
+From c213ffa2e0ba6677e0dfade9c67b91446c70c8bd Mon Sep 17 00:00:00 2001
+From: Jun Zhang <jun.zhang@windriver.com>
+Date: Fri, 16 Oct 2015 21:25:17 +0800
+Subject: [PATCH] cpio: fix testcase symlink-bad-lengths
+
+* fix the output of stderr & stdout to meet latest cpio
+
+Upstream-Status: Pending
+
+Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
+---
+ tests/symlink-bad-length.at | 5 ++---
+ 1 file changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/tests/symlink-bad-length.at b/tests/symlink-bad-length.at
+index 6f804b1..74208ce 100644
+--- a/tests/symlink-bad-length.at
++++ b/tests/symlink-bad-length.at
+@@ -41,9 +41,8 @@ cpio -ntv < ARCHIVE
+ test $? -eq 2
+ ],
+ [0],
+-[-rw-rw-r--   1 10029    10031          13 Nov 25 13:52 FILE
+-],[cpio: LINK: stored filename length too big
+-cpio: premature end of file
++[-rw-rw-r--   1 10029    10031          13 Nov 25  2014 FILE
++],[cpio: premature end of file
+ ])
+ 
+ AT_CLEANUP
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index 84e538f..3df1cd5 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://remove-gets.patch \
         file://cpio-CVE-2015-1197.patch \
         file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
         file://Fix-symlink-bad-length-test-for-64-bit-architectures.patch \
+        file://fix-testcase-symlink-bad-lengths.patch \
         "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
-- 
1.9.1


