Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61E86C4453F
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5460.1784741043660125545
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=GlqIDTtT;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49557167508so44134195e9.1
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741042; x=1785345842; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=tb/+ErvddBwcbpwomc8S6/N7bFmxUyu3E5hND3nQplE=;
        b=GlqIDTtTwVSvMtxJceekW0xjOqg/cVYLpFki14JuLJBxdt9UTMeOhRbZmEi/XP/JrN
         n4s605z0zplC8qBkw6JL6DV7SoBPe3eOHJhrv0fyQFca0U/wuMKGpQl90h56ZgEB0rvb
         beoicKOSTZMTpb2Y/28R/K04Nw6sY162HX2+k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741042; x=1785345842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=tb/+ErvddBwcbpwomc8S6/N7bFmxUyu3E5hND3nQplE=;
        b=bNfnEiF5WQ49t1cqYuheSruancBzS9n+sndM8gkzd1DFi9yOLGp9MA+w5vweRBEZNr
         fc4r+6nd/KGIOKNRSqme67EneKUpjfie3dXto12LSWvC36KOtD6eVKmkAfKs6TWDhKT8
         Ybn5CMC0MaF0wNjFynkfZq2apAZvTclXzQUi2m9/B3Yv612nxomGvvwZ83x7bVBPC/pm
         fWjWKnECroBSPIio1AIurOgVU/Ms4geazBXsSEsdlq2PMkfFIKHEIBCDO+XCslCJJQWO
         AwmR80ZNwyIGQ3dGhMoRGaI6ABtcbb4GLTH0zxYoZET05emgW+jlzCbq5C0reT4lHkco
         UtEQ==
X-Gm-Message-State: AOJu0Yyj+gk1au/GQR7QqcXT1wAadmGS6vWqVDNHzjNEYtHKjAc8zfKv
	Ftwf5LmqUDANZfJPD9bn1MMo5j+kSg8qmJTupRwXckPfJuQB1BvK66W7bXpHB8x109ckbR63hJn
	FvPF1Eq0=
X-Gm-Gg: AR+sD13mezAq7NjXjD7g46r8Y0yPFQIQofa4E01mUk6WJepOmPU9V1gqQpTRD1S3Eec
	jl7m3bT5u/sOsFHQhoaZskPFL2r7tz54yBk6RmHy/M847jLri3i1Ovc6XvKGTOWs8apJEaCc/ER
	Le+O3vIF4rw97Jw5M+1AXOk9T+XU9qk/6UVdR9bo/qajqrLiQI359zlvAFgZ/a53bCileWiwtO2
	jOxKH+7o7DqcSWjVQZPNWGp1h785qeJB2SYKrSxJINyclaF0GB5FWrYuVJJNGRsQknIvN1UfLvL
	MvqN/UzSRc+KURRcgnJuQi/x/0biaOW1d6U+a6Wb4CgBZ6aGdnmZ8lLN8lgxQCwbwRNV/69sP26
	aDQQIvYUwWUO1TS7cfSqQAp1w8psW6uT81Dreelycc/JDtDN6VThYxlk96gh47Gup9lCTq2F6qa
	w2Wp2+9B0di0Jic1XZaTS/oLHeAcrX13dO6FtRIYWxMNfXBxt+J7WzhnBLIYFVdy7jXRiYgT9vQ
	cMzM2HJ/owq5msGxohbrVM=
X-Received: by 2002:a05:600c:4f44:b0:495:5b02:23a8 with SMTP id 5b1f17b1804b1-4955b022588mr171765865e9.34.1784741041897;
        Wed, 22 Jul 2026 10:24:01 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.01
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:01 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 08/27] expat: fix CVE-2026-56411
Date: Wed, 22 Jul 2026 19:23:21 +0200
Message-ID: <2fb21d414bf0def272ca40a69246c01fb983b72a.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241718

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream fix shown in [1] as referenced by [2].

[1] https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5
[2] https://nvd.nist.gov/vuln/detail/CVE-2026-56411

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-56411.patch          | 47 +++++++++++++++++++
 meta/recipes-core/expat/expat_2.7.5.bb        |  1 +
 2 files changed, 48 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-56411.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-56411.patch b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
new file mode 100644
index 00000000000..884837b61e1
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-56411.patch
@@ -0,0 +1,47 @@
+From e447d5d72884a1246894f111a5b72de4e479152e Mon Sep 17 00:00:00 2001
+From: netliomax25-code <netliomax25@gmail.com>
+Date: Tue, 2 Jun 2026 13:13:34 +0530
+Subject: [PATCH] xmlwf: protect notation list allocation from integer overflow
+
+CVE: CVE-2026-56411
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/528a4e5017e1bd3b48b689fd0c131df940ae3ea5]
+
+(cherry picked from commit 528a4e5017e1bd3b48b689fd0c131df940ae3ea5)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ expat/xmlwf/xmlwf.c | 11 +++++++++--
+ 1 file changed, 9 insertions(+), 2 deletions(-)
+
+diff --git a/expat/xmlwf/xmlwf.c b/expat/xmlwf/xmlwf.c
+index 6a0a707a..a9640190 100644
+--- a/expat/xmlwf/xmlwf.c
++++ b/expat/xmlwf/xmlwf.c
+@@ -383,9 +383,9 @@ static void XMLCALL
+ endDoctypeDecl(void *userData) {
+   XmlwfUserData *data = (XmlwfUserData *)userData;
+   NotationList **notations;
+-  int notationCount = 0;
++  size_t notationCount = 0;
+   NotationList *p;
+-  int i;
++  size_t i;
+ 
+   /* How many notations do we have? */
+   for (p = data->notationListHead; p != NULL; p = p->next)
+@@ -395,6 +395,13 @@ endDoctypeDecl(void *userData) {
+     goto cleanUp;
+   }
+ 
++  /* Detect and prevent integer overflow in the multiplication, mirroring
++     the guards in xcsdup() and resolveSystemId() */
++  if (notationCount > SIZE_MAX / sizeof(NotationList *)) {
++    fprintf(stderr, "Unable to sort notations");
++    goto cleanUp;
++  }
++
+   notations = malloc(notationCount * sizeof(NotationList *));
+   if (notations == NULL) {
+     fprintf(stderr, "Unable to sort notations");
+-- 
+2.43.7
+
diff --git a/meta/recipes-core/expat/expat_2.7.5.bb b/meta/recipes-core/expat/expat_2.7.5.bb
index cb8f9dd1acd..bd6656c6e06 100644
--- a/meta/recipes-core/expat/expat_2.7.5.bb
+++ b/meta/recipes-core/expat/expat_2.7.5.bb
@@ -29,6 +29,7 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2026-56406-dependent.patch;striplevel=2 \
            file://CVE-2026-56406.patch;striplevel=2 \
            file://CVE-2026-56409.patch;striplevel=2 \
+           file://CVE-2026-56411.patch;striplevel=2 \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

