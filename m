Return-Path: <Jun.Zhang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C09FF77070
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 09:42:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9J9g5t6002115
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Oct 2015 02:42:05 -0700 (PDT)
Received: from pek-lpd-ccm1.wrs.com (128.224.179.178) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.248.2; Mon, 19 Oct 2015 02:42:05 -0700
From: Jun Zhang <jun.zhang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Oct 2015 17:41:54 +0800
Message-ID: <1445247715-81087-1-git-send-email-jun.zhang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] cpio: Fix symlink-bad-length test for 64-bit [ LIN8-947 ] architectures.
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
X-List-Received-Date: Mon, 19 Oct 2015 09:42:05 -0000
Content-Type: text/plain

* src/util.c: Return non-zero exit code if EOF is hit prematurely.

Backport commit:
http://git.savannah.gnu.org/cgit/cpio.git/commit/src/util.c?id=f6a8a2cbd2d5ca40ea94900b55b845dd5ca87328

Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
---
 ...-bad-length-test-for-64-bit-architectures.patch | 36 ++++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch

diff --git a/meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch b/meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
new file mode 100644
index 0000000..c2da9e1
--- /dev/null
+++ b/meta/recipes-extended/cpio/cpio-2.11/Fix-symlink-bad-length-test-for-64-bit-architectures.patch
@@ -0,0 +1,36 @@
+From 0e8d8ed494433237cff0ad6c513c40f025005e8c Mon Sep 17 00:00:00 2001
+From: Jun Zhang <jun.zhang@windriver.com>
+Date: Fri, 16 Oct 2015 10:48:21 +0800
+Subject: [PATCH] Fix symlink-bad-length test for 64-bit architectures.
+
+* src/util.c: Return non-zero exit code if EOF is hit prematurely.
+
+Backport commit:
+http://git.savannah.gnu.org/cgit/cpio.git/commit/src/util.c?id=f6a8a2cbd2d5ca40ea94900b55b845dd5ca87328
+
+Upstream-Status: Backport
+
+Signed-off-by: Jun Zhang <jun.zhang@windriver.com>
+---
+ src/util.c | 5 +----
+ 1 file changed, 1 insertion(+), 4 deletions(-)
+
+diff --git a/src/util.c b/src/util.c
+index 00953d5..b536d82 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -206,10 +206,7 @@ tape_fill_input_buffer (int in_des, int num_bytes)
+   if (input_size < 0)
+     error (1, errno, _("read error"));
+   if (input_size == 0)
+-    {
+-      error (0, 0, _("premature end of file"));
+-      exit (1);
+-    }
++    error (PAXEXIT_FAILURE, 0, _("premature end of file"));
+   input_bytes += input_size;
+ }
+ 
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/cpio/cpio_2.11.bb b/meta/recipes-extended/cpio/cpio_2.11.bb
index c5d92bf..84e538f 100644
--- a/meta/recipes-extended/cpio/cpio_2.11.bb
+++ b/meta/recipes-extended/cpio/cpio_2.11.bb
@@ -9,6 +9,7 @@ SRC_URI += "file://remove-gets.patch \
         file://fix-memory-overrun.patch \
         file://cpio-CVE-2015-1197.patch \
         file://0001-Unset-need_charset_alias-when-building-for-musl.patch \
+        file://Fix-symlink-bad-length-test-for-64-bit-architectures.patch \
         "
 
 SRC_URI[md5sum] = "1112bb6c45863468b5496ba128792f6c"
-- 
1.9.1


