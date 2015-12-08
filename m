Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f42.google.com (mail-pa0-f42.google.com
	[209.85.220.42])
	by mail.openembedded.org (Postfix) with ESMTP id 29087606BF
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Dec 2015 01:48:04 +0000 (UTC)
Received: by pacwq6 with SMTP id wq6so3242269pac.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Dec 2015 17:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=yb3Og+XnV0ewuqadfZcbiJOd+OxDFl8HQ6VUC4ckphM=;
	b=tc84iehO91qNOcZaMt932Inpd3LEADfAO7H8NTe3lk+ZvjEHqfZX7qK2PFcVFtgSgw
	NxVeZHYctnXLXai2tNu+xjzDi1juEh/HdKcxXZvhlcraFfFgnMWySjyVtuo9N8iSDHvU
	X9usxYBKh/zFQ3Ln8bkEXRcONHHxRK4qOr31a2VZYfNWSuDGVEAqB2yj7bnygWukpbvG
	BqiWZnEcxdTshoum4hxHs8ji8EE1dJE2u76V7BKogX4G2lsV3ilED+aRWhzDt8Ms9B2a
	9LLaZT5jwWy9T1ZzPRvAr8LkbIQ7quQIMKgLJ6eg4IfwFfK7xIwLQEOsdWvCKZKTXdsj
	VPvg==
X-Received: by 10.66.199.5 with SMTP id jg5mr1311415pac.72.1449539285774;
	Mon, 07 Dec 2015 17:48:05 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	cc16sm605285pac.44.2015.12.07.17.48.04
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Dec 2015 17:48:04 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Dec 2015 17:47:57 -0800
Message-Id: <1449539278-20070-3-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
In-Reply-To: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
References: <1449539278-20070-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [jethro][fido][PATCH 3/4] openssl: fix for CVE-2015-3195
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
X-List-Received-Date: Tue, 08 Dec 2015 01:48:05 -0000

From: Armin Kuster <akuster@mvista.com>

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 ...CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch | 64 ++++++++++++++++++++++
 1 file changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch

diff --git a/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
new file mode 100644
index 0000000..08adc0c
--- /dev/null
+++ b/meta/recipes-connectivity/openssl/openssl/CVE-2015-3195-Fix-leak-with-ASN.1-combine.patch
@@ -0,0 +1,64 @@
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
+This patch was imprted from
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
-- 
2.3.5


