Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web08.927.1619398452808593695
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:13 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: Dxmp7KY82MMoKNEpCoh5BJieaZCynHw/QDTekwOK9IHu7tXbGpqDGeLnkXNnliAj1b6o/+7cbj
 CxioBJNFdLIA==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818056"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818056"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:12 -0700
IronPort-SDR: Bgd2sh57fLTI3+kHUhOHfSUBxRiAFEIZNllPz8z+u6cvAieC0JaBpbyk1LA8o9UHWX7F+CtukW
 uw0uMiY27q0g==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067241"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:03 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 06/64] busybox: fix CVE-2021-28831
Date: Mon, 26 Apr 2021 08:52:37 +0800
Message-Id: <4d32f16caa3d1ca280af06b892803373e2ab4b7e.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
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
 meta/recipes-core/busybox/busybox_1.33.0.bb   |  3 +-
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
diff --git a/meta/recipes-core/busybox/busybox_1.33.0.bb b/meta/recipes-core/busybox/busybox_1.33.0.bb
index 1a3f218bca..58e9cf7fce 100644
--- a/meta/recipes-core/busybox/busybox_1.33.0.bb
+++ b/meta/recipes-core/busybox/busybox_1.33.0.bb
@@ -46,7 +46,8 @@ SRC_URI = "https://busybox.net/downloads/busybox-${PV}.tar.bz2;name=tarball \
            file://0001-sysctl-ignore-EIO-of-stable_secret-below-proc-sys-ne.patch \
            file://rev.cfg \
            file://pgrep.cfg \
-"
+           file://0001-decompress_gunzip-Fix-DoS-if-gzip-is-corrupt.patch \
+           "
 SRC_URI_append_libc-musl = " file://musl.cfg "
 
 SRC_URI[tarball.sha256sum] = "d568681c91a85edc6710770cebc1e80e042ad74d305b5c2e6d57a5f3de3b8fbd"
-- 
2.30.2

