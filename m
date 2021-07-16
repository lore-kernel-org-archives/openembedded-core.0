Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by mx.groups.io with SMTP id smtpd.web11.1434.1626403354833085378
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jul 2021 19:42:47 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 192.55.52.88, mailfrom: anuj.mittal@intel.com)
X-IronPort-AV: E=McAfee;i="6200,9189,10046"; a="232494614"
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="232494614"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:47 -0700
X-IronPort-AV: E=Sophos;i="5.84,244,1620716400"; 
   d="scan'208";a="656075463"
Received: from unknown (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.215.225.206])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2021 19:42:46 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 11/28] busybox: upgrade 1.33.0 -> 1.33.1
Date: Fri, 16 Jul 2021 10:42:09 +0800
Message-Id: <4ed6b8d256c8485aa16e89deccb86a555e288911.1626403078.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <cover.1626403078.git.anuj.mittal@intel.com>
References: <cover.1626403078.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: zhengruoqin <zhengrq.fnst@fujitsu.com>

0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
removed since it is included in 1.33.1

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@cn.fujitsu.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 544236b12a72ee5be5ef0147249ead112082b871)
Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 58 -------------------
 .../{busybox_1.33.0.bb => busybox_1.33.1.bb}  |  3 +-
 2 files changed, 1 insertion(+), 60 deletions(-)
 delete mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
 rename meta/recipes-core/busybox/{busybox_1.33.0.bb => busybox_1.33.1.bb} (92%)

diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
deleted file mode 100644
index 67c9f189cc..0000000000
--- a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
+++ /dev/null
@@ -1,58 +0,0 @@
-From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
-From: Samuel Sapalski <samuel.sapalski@nokia.com>
-Date: Wed, 3 Mar 2021 16:31:22 +0100
-Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
-
-On certain corrupt gzip files, huft_build will set the error bit on
-the result pointer. If afterwards abort_unzip is called huft_free
-might run into a segmentation fault or an invalid pointer to
-free(p).
-
-In order to mitigate this, we check in huft_free if the error bit
-is set and clear it before the linked list is freed.
-
-Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
-Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
-Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
-
-Upstream-Status: Backport
-CVE: CVE-2021-28831
-Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
----
- archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
- 1 file changed, 10 insertions(+), 2 deletions(-)
-
-diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
-index eb3b64930..e93cd5005 100644
---- a/archival/libarchive/decompress_gunzip.c
-+++ b/archival/libarchive/decompress_gunzip.c
-@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
-  * each table.
-  * t: table to free
-  */
-+#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
-+#define ERR_RET     ((huft_t*)(uintptr_t)1)
- static void huft_free(huft_t *p)
- {
- 	huft_t *q;
- 
-+	/*
-+	 * If 'p' has the error bit set we have to clear it, otherwise we might run
-+	 * into a segmentation fault or an invalid pointer to free(p)
-+	 */
-+	if (BAD_HUFT(p)) {
-+		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
-+	}
-+
- 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
- 	while (p) {
- 		q = (--p)->v.t;
-@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
-  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
-  * is given: "fixed inflate" decoder feeds us such data.
-  */
--#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
--#define ERR_RET     ((huft_t*)(uintptr_t)1)
- static huft_t* huft_build(const unsigned *b, const unsigned n,
- 			const unsigned s, const struct cp_ext *cp_ext,
- 			unsigned *m)
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.1.bb
similarity index 92%
rename from meta/recipes-core/busybox/busybox_1.33.0.bb
rename to meta/recipes-core/busybox/busybox_1.33.1.bb
index b2a30ba16f..3a70a8056e 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.1.bb
@@ -46,9 +46,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://rev.cfg \
            file://pgrep.cfg \
-           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
            file://0001-gen_build_files-Use-C-locale-when-calling-sed-on-glo.patch \
            "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
-SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
+SRC_URI[tarball.sha256sum] = "12cec6bd2b16d8a9446dd16130f2b92982f1819f6e1c5f5887b6db03f5660d28"
-- 
2.31.1

