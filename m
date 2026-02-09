Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6291E78D7A
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43984.1770629362996578037
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=WzOmxW7I;
 spf=pass (domain: smile.fr, ip: 209.85.221.47, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43622089851so3407841f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629361; x=1771234161; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qDp+PHBR8HrfGx9tkz1RiIFeEr5goqJ2f6Hma5HqA0g=;
        b=WzOmxW7IYza8e5Rez+jQeZ3OBX7Sbvpjv4PQB7ijHJyPV9V0SuHNj/EQ3EbfVIl8q0
         Pw3yBsoaoapj8QYjAHHGUEiEYNrSlh7EILbIqSuYCga+UwjJ7uA+tKW/KrzwH+P316yp
         CnMlgLhK+MdF2VbANtIm9f+0F9AcboRAZ0ZTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629361; x=1771234161;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qDp+PHBR8HrfGx9tkz1RiIFeEr5goqJ2f6Hma5HqA0g=;
        b=m2GuMPRPOJAF8zgYIELdJD/qToDHe5JZOB6W2h7V/pHvH/kEY5iCECWUr1TiQykSM/
         pm4KYFowb2kZV8edy1/psBmO1aa13A0+xrF2BgwKzxorFCf2HDnHGdf9+qvOLbRtEKsa
         ZgCICcWs3kWG5/hZETvCf04pOgXgXvwF8HjPT87c270IneGwcLSQU44pmqzMVB32nd/b
         0T0TDQYiGOJClnY08GayTuZGTNKwzzXlBPrtcoznGmSOS3GBZ7OhB0q0JHG8JszXeZxI
         bkH7oNXx7EYmPW7zswWsdjxa98ENa8bIEK0JqjjGb+C3WONjIFT0xghhfB2hOVSX7cHB
         jPAQ==
X-Gm-Message-State: AOJu0Yz+tQHe7iqWItt8QSqmtHhed8rwYuONOUyxbrZVsWrC1rYjeku5
	iMJUX/9UmR8apf91ZvOmU/HiMj0HP5Mc5ozQQaWcsoP1WgTbTlwuIJPMqjDbbGOFC9o/LyCGinG
	H3lIUFc0=
X-Gm-Gg: AZuq6aLi0Ra6i0YHmBlGiXKrKOmFi/ZaoUTssjosyZftPvKRv9UjIggRxanbTsglvhD
	0YVxco8SsUuEZ6LokGqAlrtbLJFZqBAoP97abMRsCE0SaUHjHf0AWP4esuQ8EG8tTxIvEgjdQWu
	toCZGccFtL5/th1TYwRzm7j16uIkEj1HN0KGgKAMf08qxrvM6Y7N6BLj2atDhstDpLcnEDoPD4w
	LKHzGuQ084xpx90bL+Wm/b46qUpQL9UwSROAbTPO0pIfpW1dvZp7uNx1PF4DXQ/62D5cxfd2xnB
	WKL9APShB+TeNuGGuqbe9XjOCDrjgmMSTWdmcl7LjYx+/VokctO1wrJLpxPsgjCuwzadzA5cW3F
	XL7plkU5x5o+lK2JQ7ki2YRUp3u8wSQ4v+6X61KC2om+QLG/oiRON5PqI06v2ufOlD18r1J7IP2
	x7/XX9+PDFB0NHJJquqtXDV6hvkMzSsyZBytzeFJb2mU8+Gy2tOq4ADBuvYazlb3tI+JFv6gPZz
	LegUxPldf9eOXlWgyGwlLoHng==
X-Received: by 2002:a05:6000:26cd:b0:431:1d4:3a71 with SMTP id ffacd0b85a97d-43629345e67mr17290135f8f.27.1770629360996;
        Mon, 09 Feb 2026 01:29:20 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:20 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 04/25] expat: patch CVE-2026-25210
Date: Mon,  9 Feb 2026 10:28:47 +0100
Message-ID: <bf3c4c089974922391c8286d72fd38acdde8a759.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230755

From: Peter Marko <peter.marko@siemens.com>

Pick patches from [1].

[1] https://github.com/libexpat/libexpat/pull/1075

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../expat/expat/CVE-2026-25210-01.patch       | 27 +++++++++++++
 .../expat/expat/CVE-2026-25210-02.patch       | 38 +++++++++++++++++++
 .../expat/expat/CVE-2026-25210-03.patch       | 28 ++++++++++++++
 meta/recipes-core/expat/expat_2.6.4.bb        |  3 ++
 4 files changed, 96 insertions(+)
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
 create mode 100644 meta/recipes-core/expat/expat/CVE-2026-25210-03.patch

diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
new file mode 100644
index 00000000000..d56e8811915
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-01.patch
@@ -0,0 +1,27 @@
+From 7ddea353ad3795f7222441274d4d9a155b523cba Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Make a doubling more readable
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/7ddea353ad3795f7222441274d4d9a155b523cba]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 8cf29257..2f9adffc 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3499,7 +3499,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) << 1;
++          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
new file mode 100644
index 00000000000..21bd6e4fd0e
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-02.patch
@@ -0,0 +1,38 @@
+From 8855346359a475c022ec8c28484a76c852f144d9 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Realign a size with the `REALLOC` type signature it is
+ passed into
+
+Note that this implicitly assumes `tag->bufEnd >= tag->buf`, which should
+already be guaranteed true.
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/8855346359a475c022ec8c28484a76c852f144d9]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+---
+ lib/xmlparse.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index 2f9adffc..ee18a87f 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3488,7 +3488,6 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+         const char *fromPtr = tag->rawName;
+         toPtr = (XML_Char *)tag->buf;
+         for (;;) {
+-          int bufSize;
+           int convLen;
+           const enum XML_Convert_Result convert_res
+               = XmlConvert(enc, &fromPtr, rawNameEnd, (ICHAR **)&toPtr,
+@@ -3499,7 +3498,7 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
+-          bufSize = (int)(tag->bufEnd - tag->buf) * 2;
++          const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = REALLOC(parser, tag->buf, bufSize);
+             if (temp == NULL)
diff --git a/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
new file mode 100644
index 00000000000..46a1618e040
--- /dev/null
+++ b/meta/recipes-core/expat/expat/CVE-2026-25210-03.patch
@@ -0,0 +1,28 @@
+From 9c2d990389e6abe2e44527eeaa8b39f16fe859c7 Mon Sep 17 00:00:00 2001
+From: Matthew Fernandez <matthew.fernandez@gmail.com>
+Date: Thu, 2 Oct 2025 17:15:15 -0700
+Subject: [PATCH] lib: Introduce an integer overflow check for tag buffer
+ reallocation
+
+Suggested-by: Sebastian Pipping <sebastian@pipping.org>
+
+CVE: CVE-2026-25210
+Upstream-Status: Backport [https://github.com/libexpat/libexpat/commit/9c2d990389e6abe2e44527eeaa8b39f16fe859c7]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/xmlparse.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/lib/xmlparse.c b/lib/xmlparse.c
+index ee18a87f..d8c54c38 100644
+--- a/lib/xmlparse.c
++++ b/lib/xmlparse.c
+@@ -3498,6 +3498,8 @@ doContent(XML_Parser parser, int startTagLevel, const ENCODING *enc,
+             tag->name.strLen = convLen;
+             break;
+           }
++          if (SIZE_MAX / 2 < (size_t)(tag->bufEnd - tag->buf))
++            return XML_ERROR_NO_MEMORY;
+           const size_t bufSize = (size_t)(tag->bufEnd - tag->buf) * 2;
+           {
+             char *temp = REALLOC(parser, tag->buf, bufSize);
diff --git a/meta/recipes-core/expat/expat_2.6.4.bb b/meta/recipes-core/expat/expat_2.6.4.bb
index a61357e6c14..048093f010d 100644
--- a/meta/recipes-core/expat/expat_2.6.4.bb
+++ b/meta/recipes-core/expat/expat_2.6.4.bb
@@ -43,6 +43,9 @@ SRC_URI = "${GITHUB_BASE_URI}/download/R_${VERSION_TAG}/expat-${PV}.tar.bz2  \
            file://CVE-2025-59375-24.patch \
            file://CVE-2026-24515-01.patch \
            file://CVE-2026-24515-02.patch \
+           file://CVE-2026-25210-01.patch \
+           file://CVE-2026-25210-02.patch \
+           file://CVE-2026-25210-03.patch \
            "
 
 GITHUB_BASE_URI = "https://github.com/libexpat/libexpat/releases/"

