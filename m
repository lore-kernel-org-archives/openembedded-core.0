Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ABEBFF5129
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.85473.1775578587755406708
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=TtTR3IVW;
 spf=pass (domain: smile.fr, ip: 209.85.128.48, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4887ca8e529so481665e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578586; x=1776183386; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=TtTR3IVWF27AJTd/qZ0KUbfPI6HIDL4cAmtUdtZBZyFBElyAWlgKm596Fpt8Ml2iuA
         zSxAPvqXA1eku1C1312LP4NoJ+6QAcuBF+5Lt0c/ZeQkVe8/N7G4iQVS7A/JTfl8YADZ
         bovewBLtGafs/E08UNBD1UWQjkhPcZYOE+2NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578586; x=1776183386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=sOyKe7MJZkvaFyZDLNRz43HdwRD9Z+lRvRv5f44oM76LksMweDwdSbW/VxmGcUT7qo
         1aXNZVUh0Ora8U9czqNyZlPoqjHqb2mfR5nTkwPG5sGgSD//+UzC0m7ayjAJG9vg6wOe
         9Gv/OuDCZinBpmFTItGYYptEfijyn4yuJYuYpLEAuoqrx/DjPmfZp4QU1f/66vhCoyXe
         UD+vcA7lO3CnkAYr7FhJKwvRMFv9/W3MbBqK2+DcGtDJkzQchb+uIDxGFFIGvES5an5U
         Krt84lPyOdfoxYXgTWC8ge9tiRqE0G8rWDnI00Fmt+debxQQiRPOFoNmdE/GdDrem7Ch
         DJvw==
X-Gm-Message-State: AOJu0YzF18Dqj/kR/Q/Ps9IxrBBSL1dX+kGCiYK9JU9WqmeVeXY78Sd9
	HKK4qwn7l9zG12UBi4IRjXXrnTg8vGoVqxt+AmPGx1nZyxguI9Pb1Me7Sj2Gr3CTTIqRlbkFles
	gkahr1tI=
X-Gm-Gg: AeBDietYH5LwH4Tv5T57OWqRo8yY5L0AsXDwAv0IVyDOO0yVC1mHmDlxCGpbapRlY7x
	7LJyrdQorGsA3WzHosJI/hyRi5LawoXV9jojAqKN597GY1wrqOk6/7+82OcBDuQthO4odSApcnf
	1EE0KwQoPCEvfxISfis7T/K2ynrZ1K3Rss835azQJukEmsRVxFxyLal3ZCKdh2fJU5/emWptrNx
	A2jVzCc9L7rWBmwTI0kRNd7ACexABFY9oqMcN4q3W6CgXE4EbPEZmzF5Yp9E92RAWDKpI04L0gA
	mmr+jxYcgk7SO/dyfKSFzubno2rhgdl8adlah6uL4SdO56JbUsAwb4JNvKEpGnfxrQQNv8WJpND
	XgD4xZGYGORZLUK/Hku1IW+mfDd2EqNO3NXxaGeMfQzkCocL6Szb9vcJw9eb3K7fAFRgtCjRC67
	LNl9Cv4lMM/5Ctn50fJUw5FiKOQ7SgPOVG7qw8IvhctDXEBnxfbsjMP24fijh4FfRexzmOpRgZ/
	gn2sQbFc2+oPVFIUjnHcctUnfeh
X-Received: by 2002:a05:600c:c0cf:b0:485:3c2e:60d5 with SMTP id 5b1f17b1804b1-4889945f8e8mr155108815e9.2.1775578585767;
        Tue, 07 Apr 2026 09:16:25 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 14/19] curl: patch CVE-2025-14524
Date: Tue,  7 Apr 2026 18:15:51 +0200
Message-ID: <69b98b1f2bd0717b0ab7adcb5d8aa9b84ae2f48b.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234767

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commit per [1].

[1] https://curl.se/docs/CVE-2025-14524.html
[2] https://security-tracker.debian.org/tracker/CVE-2025-14524

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
[YC: cherry-picked from scarthgap commit 951113a6e8185969444b5e28292f23434dba1f6c]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-14524.patch            | 42 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 00000000000..0ab77ade9d5
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,42 @@
+From b3e2318ff3cbe4a9babe5b6875916a429bd584be Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use bearer
+
+Closes #19933
+
+CVE: CVE-2025-14524
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640]
+
+Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
+
+---
+ lib/curl_sasl.c | 8 ++++++--
+ 1 file changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 7e28c92..f0b0341 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -345,7 +345,9 @@ CURLcode Curl_sasl_start(struct SASL *sasl, struct Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref nullmsg;
+ 
+   Curl_bufref_init(&nullmsg);
+@@ -531,7 +533,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct Curl_easy *data,
+     data->set.str[STRING_SERVICE_NAME] :
+     sasl->params->service;
+ #endif
+-  const char *oauth_bearer = data->set.str[STRING_BEARER];
++  const char *oauth_bearer =
++    (!data->state.this_is_a_follow || data->set.allow_auth_to_other_hosts) ?
++    data->set.str[STRING_BEARER] : NULL;
+   struct bufref serverdata;
+ 
+   Curl_bufref_init(&serverdata);
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 72bd1a20881..b8fa8b5266a 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -70,6 +70,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-14017.patch \
            file://CVE-2025-15079.patch \
            file://CVE-2025-15224.patch \
+           file://CVE-2025-14524.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 

