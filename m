Return-Path: <fan.xin@jp.fujitsu.com>
Received: from mgwym01.jp.fujitsu.com (mgwym01.jp.fujitsu.com [211.128.242.40])
	by mail.openembedded.org (Postfix) with ESMTP id 69F3F6AC37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 08:12:32 +0000 (UTC)
Received: from yt-mxoi2.gw.nic.fujitsu.com (unknown [192.168.229.69]) by
	mgwym01.jp.fujitsu.com with smtp
	id 6465_13b7_8cf4d71f_e79e_41cc_8e26_2ff50d308be4;
	Fri, 11 Dec 2015 17:12:26 +0900
Received: from g01jpfmpwyt02.exch.g01.fujitsu.local
	(g01jpfmpwyt02.exch.g01.fujitsu.local [10.128.193.56])
	by yt-mxoi2.gw.nic.fujitsu.com (Postfix) with ESMTP id A1B98AC026B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:12:26 +0900 (JST)
Received: from G01JPEXCHYT16.g01.fujitsu.local
	(G01JPEXCHYT16.g01.fujitsu.local [10.128.194.55])
	by g01jpfmpwyt02.exch.g01.fujitsu.local (Postfix) with ESMTP id
	F0E8958427C for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Dec 2015 17:12:25 +0900 (JST)
Received: from localhost.localdomain (10.24.19.99) by
	G01JPEXCHYT16.g01.fujitsu.local (10.128.194.55) with Microsoft SMTP
	Server id 14.3.266.1; Fri, 11 Dec 2015 17:12:25 +0900
From: Fan Xin <fan.xin@jp.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Dec 2015 17:13:30 +0900
Message-ID: <1449821610-29533-1-git-send-email-fan.xin@jp.fujitsu.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-SecurityPolicyCheck-GC: OK by FENCE-Mail
X-TM-AS-MML: disable
Cc: Fan Xin <fan.xin@jp.fujitsu.com>
Subject: [PATCH][dizzy][daisy][dylan] openssl: fix for CVE-2015-3195
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
X-List-Received-Date: Fri, 11 Dec 2015 08:12:34 -0000
Content-Type: text/plain

This vulnerability  affects OpenSSL versions 1.0.2 and 1.0.1, 1.0.0 and 0.9.8.
So the patch also should be merged into dizzy, daisy and dylan.

Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
---
 .../0001-Fix-leak-with-ASN.1-combine.patch         | 65 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.1e.bb |  1 +
 2 files changed, 66 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch

diff --git a/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch
new file mode 100644
index 0000000..5bda457
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl-1.0.1e/0001-Fix-leak-with-ASN.1-combine.patch
@@ -0,0 +1,65 @@
+Upstream-Status: Backport
+
+This patch was imprted from
+https://git.openssl.org/?p=openssl.git;a=commit;h=cc598f321fbac9c04da5766243ed55d55948637d
+
+Signed-off-by: Fan Xin <fan.xin@jp.fujitsu.com>
+
+From cc598f321fbac9c04da5766243ed55d55948637d Mon Sep 17 00:00:00 2001
+From: Dr. Stephen Henson <steve@openssl.org>
+Date: Tue, 10 Nov 2015 19:03:07 +0000
+Subject: [PATCH] Fix leak with ASN.1 combine.
+
+When parsing a combined structure pass a flag to the decode routine
+so on error a pointer to the parent structure is not zeroed as
+this will leak any additional components in the parent.
+
+This can leak memory in any application parsing PKCS#7 or CMS structures.
+
+CVE-2015-3195.
+
+Thanks to Adam Langley (Google/BoringSSL) for discovering this bug using
+libFuzzer.
+
+PR#4131
+
+Reviewed-by: Richard Levitte <levitte@openssl.org>
+---
+ crypto/asn1/tasn_dec.c |    7 +++++--
+ 1 files changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/crypto/asn1/tasn_dec.c b/crypto/asn1/tasn_dec.c
+index febf605..9256049 100644
+--- a/crypto/asn1/tasn_dec.c
++++ b/crypto/asn1/tasn_dec.c
+@@ -180,6 +180,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
+     int otag;
+     int ret = 0;
+     ASN1_VALUE **pchptr, *ptmpval;
++    int combine = aclass & ASN1_TFLG_COMBINE;
++    aclass &= ~ASN1_TFLG_COMBINE;
+     if (!pval)
+         return 0;
+     if (aux && aux->asn1_cb)
+@@ -500,7 +502,8 @@ int ASN1_item_ex_d2i(ASN1_VALUE **pval, const unsigned char **in, long len,
+  auxerr:
+     ASN1err(ASN1_F_ASN1_ITEM_EX_D2I, ASN1_R_AUX_ERROR);
+  err:
+-    ASN1_item_ex_free(pval, it);
++    if (combine == 0)
++        ASN1_item_ex_free(pval, it);
+     if (errtt)
+         ERR_add_error_data(4, "Field=", errtt->field_name,
+                            ", Type=", it->sname);
+@@ -689,7 +692,7 @@ static int asn1_template_noexp_d2i(ASN1_VALUE **val,
+     } else {
+         /* Nothing special */
+         ret = ASN1_item_ex_d2i(val, &p, len, ASN1_ITEM_ptr(tt->item),
+-                               -1, 0, opt, ctx);
++                               -1, tt->flags & ASN1_TFLG_COMBINE, opt, ctx);
+         if (!ret) {
+             ASN1err(ASN1_F_ASN1_TEMPLATE_NOEXP_D2I, ERR_R_NESTED_ASN1_ERROR);
+             goto err;
+-- 
+1.7.0.4
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
index bc1b944..dbc2da2 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.1e.bb
@@ -37,6 +37,7 @@ SRC_URI += "file://configure-targets.patch \
             file://0001-Use-version-in-SSL_METHOD-not-SSL-structure.patch \
             file://CVE-2014-0160.patch \
             file://openssl-CVE-2014-0198-fix.patch \
+            file://0001-Fix-leak-with-ASN.1-combine.patch \
            "
 
 SRC_URI[md5sum] = "66bf6f10f060d561929de96f9dfe5b8c"
-- 
1.8.4.2


