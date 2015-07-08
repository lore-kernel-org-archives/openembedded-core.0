Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E779F75D3E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jul 2015 07:23:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.1/8.15.1) with ESMTPS id t687Nm5U027607
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 8 Jul 2015 00:23:48 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 8 Jul 2015 00:23:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 8 Jul 2015 00:23:46 -0700
Message-ID: <1fe39d06e86bd61ff19250aea1e282325e2fa49c.1436340132.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1436340132.git.liezhi.yang@windriver.com>
References: <cover.1436340132.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/3] less: 471 -> 478
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
X-List-Received-Date: Wed, 08 Jul 2015 07:23:49 -0000
Content-Type: text/plain

* Remove backport patch 0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch.
* The LICENSE's checksum changed because of year changed, the contents
  are the same.

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 ...ossible-buffer-overrun-with-invalid-UTF-8.patch |   49 --------------------
 .../less/{less_471.bb => less_478.bb}              |    7 ++-
 2 files changed, 3 insertions(+), 53 deletions(-)
 delete mode 100644 meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
 rename meta/recipes-extended/less/{less_471.bb => less_478.bb} (78%)

diff --git a/meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch b/meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
deleted file mode 100644
index 455eafc..0000000
--- a/meta/recipes-extended/less/less/0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From e0a1add063a657b98611c94debb3631b8ffa36fe Mon Sep 17 00:00:00 2001
-From: Junling Zheng <zhengjunling@huawei.com>
-Date: Fri, 24 Apr 2015 11:24:04 +0800
-Subject: [PATCH] Fix possible buffer overrun with invalid UTF-8
-
-An out of bounds read access in the UTF-8 decoding can be triggered with
-a malformed file in the tool less. The access happens in the function
-is_utf8_well_formed due to a truncated multibyte character in the sample
-file.
-
-The bug does not crash less, it can only be made visible by running less
-with valgrind or compiling it with Address Sanitizer.
-
-Version 475 of less contains a fix for this issue. The file version.c
-contains some entry mentioning this issue (without any credit):
-
- - v475 3/2/15 Fix possible buffer overrun with invalid UTF-8
-
-The fix is in the file line.c. We derive this patch from:
-
-https://blog.fuzzing-project.org/3-less-out-of-bounds-read-access-TFPA-0022014.html
-
-Thank Claire Robinson for validating it on Mageia 4 i586. Refer to:
-
-https://bugs.mageia.org/show_bug.cgi?id=15567
-
-Upstream Status: Backported
-
-Signed-off-by: Junling Zheng <zhengjunling@huawei.com>
----
- line.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/line.c b/line.c
-index 89495a3..474be2c 100644
---- a/line.c
-+++ b/line.c
-@@ -807,7 +807,7 @@ pappend(c, pos)
- 			mbc_buf[mbc_buf_index++] = c;
- 			if (mbc_buf_index < mbc_buf_len)
- 				return (0);
--			if (is_utf8_well_formed(mbc_buf))
-+			if (is_utf8_well_formed(mbc_buf, mbc_buf_index))
- 				r = do_append(get_wchar(mbc_buf), mbc_buf, mbc_pos);
- 			else
- 				/* Complete, but not shortest form, sequence. */
--- 
-1.9.1
-
diff --git a/meta/recipes-extended/less/less_471.bb b/meta/recipes-extended/less/less_478.bb
similarity index 78%
rename from meta/recipes-extended/less/less_471.bb
rename to meta/recipes-extended/less/less_478.bb
index 72d2562..fc63774 100644
--- a/meta/recipes-extended/less/less_471.bb
+++ b/meta/recipes-extended/less/less_478.bb
@@ -21,15 +21,14 @@ SECTION = "console/utils"
 
 LICENSE = "GPLv3+ | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://LICENSE;md5=866cc220f330b04ae4661fc3cdfedea7"
+                    file://LICENSE;md5=48c26a307f91af700e1f00585f215aaf"
 DEPENDS = "ncurses"
 
 SRC_URI = "http://www.greenwoodsoftware.com/${BPN}/${BPN}-${PV}.tar.gz \
-	   file://0001-Fix-possible-buffer-overrun-with-invalid-UTF-8.patch \
 	  "
 
-SRC_URI[md5sum] = "9a40d29a2d84b41f9f36d7dd90b4f950"
-SRC_URI[sha256sum] = "37f613fa9a526378788d790a92217d59b523574cf7159f6538da8564b3fb27f8"
+SRC_URI[md5sum] = "934fcc9f137b9ef66a943c224f413d39"
+SRC_URI[sha256sum] = "495c7df52199a0c7e6bfbbe7697b2b54f4bf197c8b10b43957762d74483574ce"
 
 inherit autotools update-alternatives
 
-- 
1.7.9.5


