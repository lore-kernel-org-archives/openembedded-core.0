Received: from mga03.intel.com (mga03.intel.com [])
 by mx.groups.io with SMTP id smtpd.web12.8497.1618985195073168650
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Apr 2021 23:06:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: iuM0vSwl9i/VOaM2FoO1RZ2SahxL9Z2S+6b7jCZ5thDMe4FMUg8pHoDCS+uaCGFJaby+e+3wFV
 xBSzYJCIK9fQ==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="195671545"
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="195671545"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:43 -0700
IronPort-SDR: RSbW4NsS26DlRjN4Ch1jYvhrfAepVmBibqNSTfvUi1e1te9WFFhqw0XSBLu3bUhgzvJrcCV1zn
 nkn1Xx3ffaOw==
X-IronPort-AV: E=Sophos;i="5.82,238,1613462400"; 
   d="scan'208";a="385684455"
Received: from slow4-mobl1.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.249.70.252])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Apr 2021 23:06:41 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 8/8] busybox: fix CVE-2021-28831
Date: Wed, 21 Apr 2021 14:06:20 +0800
Message-Id: <147a08dced5e565f19f4987a3c199780dc00f878.1618984878.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1618984878.git.anuj.mittal@intel.com>
References: <cover.1618984878.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen Qi <Qi.Chen@windriver.com>

Backport patch to fix CVE-2021-28831.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit e579dbd9a6b2472ca90f411c0b594da9e38c9aca)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 ...ss_gunzip-Fix-DoS-if-gzip-is-corrupt.patch | 58 +++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.32.0.bb   |  3 +-
 2 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch

diff --git a/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
new file mode 100644
index 0000000000..67c9f189cc
--- /dev/null
+++ b/meta/recipes-core/busybox/busybox/0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch
@@ -0,0 +1,58 @@
+From fe791386ebc270219ca00406c9fdadc5130b64ee Mon Sep 17 00:00:00 2001
+From: Samuel Sapalski <samuel.sapalski@nokia.com>
+Date: Wed, 3 Mar 2021 16:31:22 +0100
+Subject: [PATCH] decompress_gunzip: Fix DoS if gzip is corrupt
+
+On certain corrupt gzip files, huft_build will set the error bit on
+the result pointer. If afterwards abort_unzip is called huft_free
+might run into a segmentation fault or an invalid pointer to
+free(p).
+
+In order to mitigate this, we check in huft_free if the error bit
+is set and clear it before the linked list is freed.
+
+Signed-off-by: Samuel Sapalski <samuel.sapalski@nokia.com>
+Signed-off-by: Peter Kaestle <peter.kaestle@nokia.com>
+Signed-off-by: Denys Vlasenko <vda.linux@googlemail.com>
+
+Upstream-Status: Backport
+CVE: CVE-2021-28831
+Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
+---
+ archival/libarchive/decompress_gunzip.c | 12 ++++++++++--
+ 1 file changed, 10 insertions(+), 2 deletions(-)
+
+diff --git a/archival/libarchive/decompress_gunzip.c b/archival/libarchive/decompress_gunzip.c
+index eb3b64930..e93cd5005 100644
+--- a/archival/libarchive/decompress_gunzip.c
++++ b/archival/libarchive/decompress_gunzip.c
+@@ -220,10 +220,20 @@ static const uint8_t border[] ALIGN1 = {
+  * each table.
+  * t: table to free
+  */
++#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
++#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static void huft_free(huft_t *p)
+ {
+ 	huft_t *q;
+ 
++	/*
++	 * If 'p' has the error bit set we have to clear it, otherwise we might run
++	 * into a segmentation fault or an invalid pointer to free(p)
++	 */
++	if (BAD_HUFT(p)) {
++		p = (huft_t*)((uintptr_t)(p) ^ (uintptr_t)(ERR_RET));
++	}
++
+ 	/* Go through linked list, freeing from the malloced (t[-1]) address. */
+ 	while (p) {
+ 		q = (--p)->v.t;
+@@ -289,8 +299,6 @@ static unsigned fill_bitbuffer(STATE_PARAM unsigned bitbuffer, unsigned *current
+  * or a valid pointer to a Huffman table, ORed with 0x1 if incompete table
+  * is given: "fixed inflate" decoder feeds us such data.
+  */
+-#define BAD_HUFT(p) ((uintptr_t)(p) & 1)
+-#define ERR_RET     ((huft_t*)(uintptr_t)1)
+ static huft_t* huft_build(const unsigned *b, const unsigned n,
+ 			const unsigned s, const struct cp_ext *cp_ext,
+ 			unsigned *m)
diff --git a/meta/recipes-core/busybox/busybox_1.32.0.bb b/meta/recipes-core/busybox/busybox_1.32.0.bb
index 8e23b0d4a2..b91f7cf711 100644
--- a/meta/recipes-core/busybox/busybox_1.32.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.32.0.bb
@@ -46,7 +46,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-hwclock-make-glibc-2.31-compatible.patch \
            file://rev.cfg \
            file://pgrep.cfg \
-"
+           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
 SRC_URI[tarball.md5sum] = "9576986f1a960da471d03b72a62f13c7"
-- 
2.30.2

