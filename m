Return-Path: <akuster808@gmail.com>
Received: from mail-ig0-f177.google.com (mail-ig0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id DB7DF7326D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 23:04:10 +0000 (UTC)
Received: by mail-ig0-f177.google.com with SMTP id mw1so63842281igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 15:04:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=YNOY6i7bKsyI8lTtRay6g1fqo3q/mC30QfVdJG2h9nY=;
	b=Onnk8qk1ZitKkNPO5Xi7kEB/INMtXX4Z3iF4YqKCg8ChosmwyCMWPsrqejSn8TPRbf
	yIe84PYBpeOfbnSJKegMu0Rfz72jGYO2X0xxrTGPV46aMlDsN5OfolFfNIzVh07FdQ8I
	/tMZf2Q2NTdmr5lkhrZGVZatka4GYh/1taykFnVQNIy4lhT+6+V6fbVFaRPRegt5LiWh
	Q7r0hjiTNrDRhnCXKM9e9QS1lji+t82LC07Rf5fkpBIQrPg1NS5bjQ0tHAFXMpArQ3+q
	rLb+c4hcxxhBmOlACEapiP2kM9RDpGunY/OkGmkOcC5LZVBmlfGxLc/cUxkUM10V8Z2T
	qvHg==
X-Received: by 10.50.136.195 with SMTP id qc3mr17983855igb.57.1452207851157;
	Thu, 07 Jan 2016 15:04:11 -0800 (PST)
Received: from Pahoa2.mvista.com ([64.2.3.194])
	by smtp.gmail.com with ESMTPSA id
	w194sm134740iof.39.2016.01.07.15.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 15:04:09 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 15:04:03 -0800
Message-Id: <1452207843-29858-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1452207843-29858-1-git-send-email-akuster808@gmail.com>
References: <1452207843-29858-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [PATCH][V2][Jethro, fido 3/3] openssl: fix for CVE-2015-3195
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
X-List-Received-Date: Thu, 07 Jan 2016 23:04:11 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch | 66 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2d.bb |  1 +
 2 files changed, 67 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
new file mode 100644
index 0000000..6fc4d0e
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
@@ -0,0 +1,66 @@
+From cc598f321fbac9c04da5766243ed55d55948637d Mon Sep 17 00:00:00 2001
+From: "Dr. Stephen Henson" <steve@openssl.org>
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
+
+Upstream-Status: Backport
+
+This patch was imported from
+https://git.openssl.org/?p=openssl.git;a=commit;h=cc598f321fbac9c04da5766243ed55d55948637d
+
+Signed-off-by: Armin Kuster <akuster@mvista.com>
+
+---
+ crypto/asn1/tasn_dec.c | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
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
+2.3.5
+
diff --git a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
index 0364b64..3864e88 100644
--- a/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
+++ b/meta/recipes-connectivity/openssl/openssl_1.0.2d.bb
@@ -40,6 +40,7 @@ SRC_URI += "file://configure-targets.patch \
             file://CVE-2015-3193-bn-asm-x86_64-mont5.pl-fix-carry-propagating-bug-CVE.patch \
             file://CVE-2015-3194-1-Add-PSS-parameter-check.patch \
             file://0001-Add-test-for-CVE-2015-3194.patch \
+            file://CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch \
            "
 
 SRC_URI[md5sum] = "38dd619b2e77cbac69b99f52a053d25a"
-- 
2.3.5


