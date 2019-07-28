Return-Path: <anuj.mittal@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id C06547F1F8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Jul 2019 23:21:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	28 Jul 2019 16:21:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,320,1559545200"; d="scan'208";a="346424881"
Received: from andromeda02.png.intel.com ([10.221.183.11])
	by orsmga005.jf.intel.com with ESMTP; 28 Jul 2019 16:21:13 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2019 07:20:59 +0800
Message-Id: <1564356060-13772-6-git-send-email-anuj.mittal@intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1564356060-13772-1-git-send-email-anuj.mittal@intel.com>
References: <1564356060-13772-1-git-send-email-anuj.mittal@intel.com>
Subject: [thud][PATCH 6/7] libcroco: fix CVE-2017-7961
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
X-List-Received-Date: Sun, 28 Jul 2019 23:21:13 -0000

From: Ross Burton <ross.burton@intel.com>

(From OE-Core rev: 480f15850820746cecdfe0b8450b2be484c1f8f9)

Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../libcroco/libcroco/CVE-2017-7961.patch          | 45 ++++++++++++++++++++++
 meta/recipes-support/libcroco/libcroco_0.6.12.bb   |  4 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
new file mode 100644
index 0000000..35471ec
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
@@ -0,0 +1,45 @@
+CVE: CVE-2017-7961
+Upstream-Status: Backport
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+
+From 9ad72875e9f08e4c519ef63d44cdbd94aa9504f7 Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Sun, 16 Apr 2017 13:56:09 +0200
+Subject: [PATCH] tknzr: support only max long rgb values
+
+This fixes a possible out of bound when reading rgbs which
+are longer than the support MAXLONG
+---
+ src/cr-tknzr.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/cr-tknzr.c b/src/cr-tknzr.c
+index 1a7cfeb..1548c35 100644
+--- a/src/cr-tknzr.c
++++ b/src/cr-tknzr.c
+@@ -1279,6 +1279,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
+         status = cr_tknzr_parse_num (a_this, &num);
+         ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
+ 
++        if (num->val > G_MAXLONG) {
++                status = CR_PARSING_ERROR;
++                goto error;
++        }
++
+         red = num->val;
+         cr_num_destroy (num);
+         num = NULL;
+@@ -1298,6 +1303,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
+                 status = cr_tknzr_parse_num (a_this, &num);
+                 ENSURE_PARSING_COND ((status == CR_OK) && (num != NULL));
+ 
++                if (num->val > G_MAXLONG) {
++                        status = CR_PARSING_ERROR;
++                        goto error;
++                }
++
+                 PEEK_BYTE (a_this, 1, &next_bytes[0]);
+                 if (next_bytes[0] == '%') {
+                         SKIP_CHARS (a_this, 1);
+-- 
+2.18.1
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index 5b962ee..f95a583 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -16,7 +16,9 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit gnomebase gtk-doc binconfig-disabled
 
-SRC_URI += "file://CVE-2017-7960.patch"
+SRC_URI += "file://CVE-2017-7960.patch \
+            file://CVE-2017-7961.patch \
+            "
 
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
 SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
-- 
2.7.4


