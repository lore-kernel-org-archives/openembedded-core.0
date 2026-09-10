Return-Path: <sdoshi@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DB48C79FBF
	for <webhook@archiver.kernel.org>; Thu, 10 Sep 2026 20:05:59 +0000 (UTC)
Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.24014.1789070750015842476
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Sep 2026 13:05:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=bq/V6l34;
 spf=pass (domain: mvista.com, ip: 74.125.228.12, mailfrom: sdoshi@mvista.com)
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso236179a12.2
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 13:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1789070749; x=1789675549; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=kK0aJWD41sZfcYiU515zYMlHpD6G+UY/n1zrL6w826s=;
        b=bq/V6l347LrZePo/g5znGBz0SdmxTEx/36nRk76esWpR2y2l3kNuqs3Tld5EnmMV1C
         r5vQ6W4bVgqw8nPBW/7Q7WCyYNMClvIjWWEgIKStBKHhRJ2esGDozptMZ4s7Ig8RlsW3
         Q+qkp/3XCqE0wyCpCWYV3XltNdbKYGKkNZtUI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789070749; x=1789675549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kK0aJWD41sZfcYiU515zYMlHpD6G+UY/n1zrL6w826s=;
        b=DmTo9nGfQGO1gIwy4ZISPmhCIwGUozNfxuOSoS/h+ZgePj5c7OvxMVbP9vkJ42B0mc
         qr+lfJcY9SV8mzZiso88fGGWH72sqa15HPK8/qfGF7UOxbXBT7bNMBA13gd+W+wpwrvB
         rtIorM4n0XLUVQFFcOVcixyBo+uoIFM3KjwgJGxo4hgaoS1H5Q+Cc/ifCQPmtn9GfHrz
         1swrVDA9eQbGI0ugv1U+qnS7zySl1QOYemxXtaMRW32A0/jIXbsSAUDAbbEcRgUYTr5C
         ZaAkDq8BoplplDItRguWhfpmqIU94wfJ72GlArtTlJF+QYbK8Ozp9F3f4s+hc2Bofq8X
         t++A==
X-Gm-Message-State: AFuF++lGhgu7oYlPpfe8qf7yBz4gtlq+fzNdGEGDfcmismuoLrmW1S7q
	wZUyPrFuxNiiQ9jwDBRfWFWQ6RIvea3uLpsM2UAFXRmzwa5KGJ5kvcqvGHHHtnvgDEqbbRMc8NJ
	+a0W/
X-Gm-Gg: AYBFou2ZUFZGQNkqGTXUEVIxPA2oyxN7S5FnN7Ua1zn59bSupkcIak+c86+5vwlhS/H
	aMF2Y6IyOPgaKNkHNzvTIHJsxxVMUb+XMRpmW92NdSlG57e7OeWJyeFjhEKpW+9JaOGqLbdnhmu
	enFzxF4PhpoYq36Aj6/0lKYyvH9JYi6tDlmgFBJpyWkHNLqT6aVqvW49hgAJRTRYmhu2KrK61iB
	eZFg4lmBw7W+wps/bFCki3L01Du/OpJ4SgJYQMbCuxwdOw/+cZCRgLwRad06Ve59KEKtju7fkDa
	WURvclpn/oNh6FNtRAvKXGJSiv3YoqN1C3jHgyeg53XV9nn+nnSh8dbhKnC1HmXIklqXIg5Zs3Y
	smy1yUqyRkP4N6l8NqC6b+8ONpOBK44rJw63U6Eiq/nytjCX1EcVF0n9p/l73CSfLOrHGOMpylm
	c5LzVaJmtk/DfjGbMdZf09jNWIokrrjJ3IBlXpr4MVf3vl/jwCWWVV/a75Bw/2k57/t+yj++DCE
	OXv6J+A9A==
X-Received: by 2002:a05:6a20:1604:b0:3bf:5b7a:fc8b with SMTP id adf61e73a8af0-3daecac7fc7mr1077456637.0.1789070749097;
        Thu, 10 Sep 2026 13:05:49 -0700 (PDT)
Received: from MVIN00030.mvista.com ([157.32.46.196])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4cf72dbsm527974eec.3.2026.09.10.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 13:05:48 -0700 (PDT)
From: Siddharth <sdoshi@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Siddharth Doshi <sdoshi@mvista.com>
Subject: [OE-core][scarthgap][PATCH 1/6] libxml2: Security Fix for CVE-2026-86137
Date: Fri, 11 Sep 2026 01:33:24 +0530
Message-Id: <20260910200329.842463-1-sdoshi@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Sep 2026 20:05:59 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245593

From: Siddharth Doshi <sdoshi@mvista.com>

Picking patch as per [1], and same patch is mentioned in [2]

References:
[1] https://nvd.nist.gov/vuln/detail/CVE-2026-86137
[2] https://security-tracker.debian.org/tracker/CVE-2026-86137

Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../libxml/libxml2/CVE-2026-86137.patch       | 48 +++++++++++++++++++
 meta/recipes-core/libxml/libxml2_2.12.10.bb   |  1 +
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch

diff --git a/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
new file mode 100644
index 0000000000..e8ccd93142
--- /dev/null
+++ b/meta/recipes-core/libxml/libxml2/CVE-2026-86137.patch
@@ -0,0 +1,48 @@
+From 76fe08d97de88bfaef2f7d5cd27f11954cc5bee2 Mon Sep 17 00:00:00 2001
+From: Hieu Le Minh <leminhhieu.opensource@gmail.com>
+Date: Sat, 18 Apr 2026 21:18:24 +0700
+Subject: [PATCH] xmlregexp: Prevent out-of-bounds read in NXT macro
+
+Fixes: https://gitlab.gnome.org/GNOME/libxml2/-/issues/1099
+
+Upstream-Status: Backport [https://gitlab.gnome.org/GNOME/libxml2/-/commit/76fe08d97de88bfaef2f7d5cd27f11954cc5bee2]
+CVE: CVE-2026-86137
+Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
+---
+ xmlregexp.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/xmlregexp.c b/xmlregexp.c
+index f434a0c..5e15311 100644
+--- a/xmlregexp.c
++++ b/xmlregexp.c
+@@ -56,7 +56,9 @@
+     xmlRegexpErrCompile(ctxt, str);
+ #define NEXT ctxt->cur++
+ #define CUR (*(ctxt->cur))
+-#define NXT(index) (ctxt->cur[index])
++#define NXT(index)									\
++    (((size_t)(ctxt->cur + index - ctxt->string) < ctxt->len)				\
++      ? ctxt->cur[index] : 0)
+ 
+ #define NEXTL(l) ctxt->cur += l;
+ #define XML_REG_STRING_SEPARATOR '|'
+@@ -245,6 +247,7 @@ typedef xmlRegParserCtxt *xmlRegParserCtxtPtr;
+ struct _xmlAutomata {
+     xmlChar *string;
+     xmlChar *cur;
++    size_t len;
+ 
+     int error;
+     int neg;
+@@ -700,6 +703,7 @@ xmlRegNewParserCtxt(const xmlChar *string) {
+     memset(ret, 0, sizeof(xmlRegParserCtxt));
+     if (string != NULL)
+ 	ret->string = xmlStrdup(string);
++	ret->len = strlen((const char *) ret->string);
+     ret->cur = ret->string;
+     ret->neg = 0;
+     ret->negs = 0;
+-- 
+2.34.1
+
diff --git a/meta/recipes-core/libxml/libxml2_2.12.10.bb b/meta/recipes-core/libxml/libxml2_2.12.10.bb
index d476ba14b6..e4db345af4 100644
--- a/meta/recipes-core/libxml/libxml2_2.12.10.bb
+++ b/meta/recipes-core/libxml/libxml2_2.12.10.bb
@@ -32,6 +32,7 @@ SRC_URI += "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=${BP};name=testt
            file://CVE-2026-0992-03.patch \
            file://CVE-2026-1757.patch \
            file://CVE-2026-11979.patch \
+           file://CVE-2026-86137.patch \
            "
 
 SRC_URI[archive.sha256sum] = "c3d8c0c34aa39098f66576fe51969db12a5100b956233dc56506f7a8679be995"
-- 
2.34.1


