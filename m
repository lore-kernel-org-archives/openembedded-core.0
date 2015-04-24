Return-Path: <zhengjunling@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [58.251.152.64])
	by mail.openembedded.org (Postfix) with ESMTP id B91316E268
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Apr 2015 05:59:26 +0000 (UTC)
Received: from 172.24.2.119 (EHLO szxeml427-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CMR39979; Fri, 24 Apr 2015 13:59:23 +0800 (CST)
Received: from PEK1000005804.huawei.com (10.178.217.40) by
	szxeml427-hub.china.huawei.com (10.82.67.182) with Microsoft SMTP
	Server id 14.3.158.1; Fri, 24 Apr 2015 13:59:21 +0800
From: Junling Zheng <zhengjunling@huawei.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 24 Apr 2015 13:58:59 +0800
Message-ID: <1429855139-11688-1-git-send-email-zhengjunling@huawei.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.178.217.40]
X-CFilter-Loop: Reflected
Subject: [PATCH] less: fix CVE-2014-9488
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
X-List-Received-Date: Fri, 24 Apr 2015 05:59:30 -0000
Content-Type: text/plain

An out of bounds read access in the UTF-8 decoding can be triggered with
a malformed file in the tool less. The access happens in the function
is_utf8_well_formed due to a truncated multibyte character in the sample
file.

The bug does not crash less, it can only be made visible by running less
with valgrind or compiling it with Address Sanitizer.

Version 475 of less contains a fix for this issue. The file version.c
contains some entry mentioning this issue (without any credit):

 - v475 3/2/15 Fix possible buffer overrun with invalid UTF-8

The fix is in the file line.c. We derive this patch from:

https://blog.fuzzing-project.org/3-less-out-of-bounds-read-access-TFPA-0022014.html

Thank Claire Robinson for validating it on Mageia 4 i586. Refer to:

https://bugs.mageia.org/show_bug.cgi?id=15567

Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
---
 ...ossible-buffer-overrun-with-invalid-UTF-8.patch | 49 ++++++++++++++++++++++
 meta/recipes-extended/less/less_471.bb             |  4 +-
 2 files changed, 52 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch

diff --git a/meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch b/meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
new file mode 100644
index 0000000..455eafc
--- /dev/null
+++ b/meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
@@ -0,0 +1,49 @@
+From e0a1add063a657b98611c94debb3631b8ffa36fe Mon Sep 17 00:00:00 2001
+From: Junling Zheng <zhengjunling@huawei.com>
+Date: Fri, 24 Apr 2015 11:24:04 +0800
+Subject: [PATCH] Fix possible buffer overrun with invalid UTF-8
+
+An out of bounds read access in the UTF-8 decoding can be triggered with
+a malformed file in the tool less. The access happens in the function
+is_utf8_well_formed due to a truncated multibyte character in the sample
+file.
+
+The bug does not crash less, it can only be made visible by running less
+with valgrind or compiling it with Address Sanitizer.
+
+Version 475 of less contains a fix for this issue. The file version.c
+contains some entry mentioning this issue (without any credit):
+
+ - v475 3/2/15 Fix possible buffer overrun with invalid UTF-8
+
+The fix is in the file line.c. We derive this patch from:
+
+https://blog.fuzzing-project.org/3-less-out-of-bounds-read-access-TFPA-0022014.html
+
+Thank Claire Robinson for validating it on Mageia 4 i586. Refer to:
+
+https://bugs.mageia.org/show_bug.cgi?id=15567
+
+Upstream Status: Backported
+
+Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
+---
+ line.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/line.c b/line.c
+index 89495a3..474be2c 100644
+--- a/line.c
++++ b/line.c
+@@ -807,7 +807,7 @@ pappend(c, pos)
+ 			mbc_buf[mbc_buf_index++] = c;
+ 			if (mbc_buf_index < mbc_buf_len)
+ 				return (0);
+-			if (is_utf8_well_formed(mbc_buf))
++			if (is_utf8_well_formed(mbc_buf, mbc_buf_index))
+ 				r = do_append(get_wchar(mbc_buf), mbc_buf, mbc_pos);
+ 			else
+ 				/* Complete, but not shortest form, sequence. */
+-- 
+1.9.1
+
diff --git a/meta/recipes-extended/less/less_471.bb b/meta/recipes-extended/less/less_471.bb
index 81d354c..72d2562 100644
--- a/meta/recipes-extended/less/less_471.bb
+++ b/meta/recipes-extended/less/less_471.bb
@@ -24,7 +24,9 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
                     file://LICENSE;md5=866cc220f330b04ae4661fc3cdfedea7"
 DEPENDS = "ncurses"
 
-SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz"
+SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
+	   file://0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch \
+	  "
 
 SRC_URI[md5sum] = "9a40d29a2d84b41f9f36d7dd90b4f950"
 SRC_URI[sha256sum] = "37f613fa9a526378788d790a92217d59b523574cf7159f6538da8564b3fb27f8"
-- 
1.9.1


