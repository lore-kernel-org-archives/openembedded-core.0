Return-Path: <okaya@kernel.org>
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by mail.openembedded.org (Postfix) with ESMTP id 3F51F601D4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 17:18:32 +0000 (UTC)
Received: from
	sinanubuntu1604.mkjiurmyylmellclgttazegk5f.bx.internal.cloudapp.net
	(unknown [40.76.73.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 6DED920880;
	Tue, 25 Sep 2018 17:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1537895913;
	bh=ZZuab9ngdgwSfg/Vw9bJG0lijmUTXFdWFmSjaK43Q9I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yRdH+rmgtxRUy9WxQQh6sHVLGCyp57SXWSozzms/sAsa+wC6MIwMETO4WXP4Tflm0
	KzRhflD74FbV+ZpVgcc5aBNF29pf41A8M2c9i61uPuw8vTJGT4K+IsEH4bNSrPFlT3
	NsdkEZVypOUiEQ+EY0JGtblhxn45g/s1suaxh+6o=
From: Sinan Kaya <okaya@kernel.org>
To: openembedded-core@lists.openembedded.org
Date: Tue, 25 Sep 2018 17:18:28 +0000
Message-Id: <20180925171828.8655-2-okaya@kernel.org>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20180925171828.8655-1-okaya@kernel.org>
References: <20180925171828.8655-1-okaya@kernel.org>
MIME-Version: 1.0
Subject: [sumo] [PATCH v1 2/2] libcroco: CVE-2017-7961
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
X-List-Received-Date: Tue, 25 Sep 2018 17:18:32 -0000
Content-Transfer-Encoding: 8bit

* CVE-2017-7961
The cr_tknzr_parse_rgb function in cr-tknzr.c in libcroco has an
"outside the range of representable values of type long" undefined
behavior issue, which might allow remote attackers to cause a denial
of service (application crash) or possibly have unspecified other
impact via a crafted CSS file.

CVE: CVE-2017-7961
Ref: https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-7961
Signed-off-by: Sinan Kaya <okaya@kernel.org>
---
 .../libcroco/libcroco/CVE-2017-7961.patch     | 45 +++++++++++++++++++
 .../libcroco/libcroco_0.6.12.bb               |  2 +
 2 files changed, 47 insertions(+)
 create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch

diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
new file mode 100644
index 0000000000..d407eca6d8
--- /dev/null
+++ b/meta/recipes-support/libcroco/libcroco/CVE-2017-7961.patch
@@ -0,0 +1,45 @@
+From 5fa3165613b77b516e2b0dc128f73b673bd3ec8b Mon Sep 17 00:00:00 2001
+From: Ignacio Casal Quinteiro <qignacio@amazon.com>
+Date: Sun, 16 Apr 2017 13:56:09 +0200
+Subject: [PATCH] tknzr: support only max long rgb values
+
+This fixes a possible out of bound when reading rgbs which
+are longer than the support MAXLONG
+
+Upstream-Status: Backport [https://git.gnome.org/browse/libcroco/patch/?id=9ad72875e9f08e4c519ef63d44cdbd94aa9504f7]
+Signed-off-by: Sinan Kaya <okaya@kernel.org>
+---
+ src/cr-tknzr.c | 10 ++++++++++
+ 1 file changed, 10 insertions(+)
+
+diff --git a/src/cr-tknzr.c b/src/cr-tknzr.c
+index e3af0ee..76886ec 100644
+--- a/src/cr-tknzr.c
++++ b/src/cr-tknzr.c
+@@ -1280,6 +1280,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
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
+@@ -1299,6 +1304,11 @@ cr_tknzr_parse_rgb (CRTknzr * a_this, CRRgb ** a_rgb)
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
+2.19.0
+
diff --git a/meta/recipes-support/libcroco/libcroco_0.6.12.bb b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
index d86ddd6464..dd7dad424c 100644
--- a/meta/recipes-support/libcroco/libcroco_0.6.12.bb
+++ b/meta/recipes-support/libcroco/libcroco_0.6.12.bb
@@ -16,5 +16,7 @@ BINCONFIG = "${bindir}/croco-0.6-config"
 
 inherit gnomebase gtk-doc binconfig-disabled
 
+SRC_URI += "file://CVE-2017-7961.patch"
+
 SRC_URI[archive.md5sum] = "bc0984fce078ba2ce29f9500c6b9ddce"
 SRC_URI[archive.sha256sum] = "ddc4b5546c9fb4280a5017e2707fbd4839034ed1aba5b7d4372212f34f84f860"
-- 
2.19.0


