Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 747DCF36B82
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:30 +0000 (UTC)
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.144835.1775776288028432542
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=zIV1qBXg;
 spf=pass (domain: smile.fr, ip: 209.85.128.68, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-488afb0427eso18339805e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776286; x=1776381086; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=zIV1qBXgKwQ4Z+WMQDwPzMhbU21stLNCkKDYDAvgxENORPRPefSriOHoWk/rUq6zAX
         W0z4cPECFbcY8T66QulU9niYqtSX3KslP690g3/TQmTIB6f3azXqlEvwf1eArVZf04/z
         ezrPTyhgmedSMk2/rEBoPoI7/yo/OtgXi+Ql0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776286; x=1776381086;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DnPfSxuNmlH81fbdPnvc6ltVJQ+styhsyLQRmmXMXrU=;
        b=QOYcfp/k76elT6BqB+SwMFn5yk/7pNUgyUaJlx7cQG1pPYCwi1OUz5RqBgxH3TBagw
         WY1D+lulANntAQuQAEbtQUrbaSHKPLI/zDy7YplHCLu91rXB8+p+jok9lAFLmooe/qbH
         PSLiv+aUN8VI/EAAM9csA2dtfjk/RXd8CCi79VjpsyyTDDb2FGr50pfb5GeDwAuFdMS/
         oz8n1WdkjgNwP59sLHKk9aTKMq+KIJCydcsbSeyiLunyZzIltUg8IUyUTuhhAeaoe8y1
         dQyTcbL3xECQiJF8wXth+BM4BeqjsG00/uQyz1ARNeX14oTxjuVhdLRBIpc0HnZ5FRbX
         VHlw==
X-Gm-Message-State: AOJu0YzInwfl9IT85AZqtxAxpjdOihn7dSicb4bFqr9QrbrUz2//LH22
	XU3LQS3ksQ9BjzKhbBY7lMkGVYsxP31n7dxa7yn6wEfcNZ/hlABORpS7OFrQt/6rcMtQmh69ubT
	Z2jD+7vPfBwFu
X-Gm-Gg: AeBDietlYhktQI5E5F9UVwaKs4VmF6LPCYAjJS8syg31+TfXAAZRSxC8TntcfeFKl8J
	81NlOVAFgfzoO+O5dvWdgoO+ZWKtcmxlWbINB4QZDZ4R+MUurcs+pLP+P+AMzAl+ojwc3zR8P4q
	AMx9UiidKbNztWemPpbZfN0BOmWbAdG4kdboabKBmRb0EggMwkatIq52Gk1X3XovsvOWnFhF55X
	r7HHa+1mDzxA9hCtq8guvJ4A28TOOUwCaCVRW8FH4uHqnsIOdM72rfnHuDtIvjTYfQLMfbM8Mi+
	EPnQ7+A0Xf/t5iNuxAg0ztfBIwIAlDDEqSp1mvol96Gg7wh8KabEORVwbgaVPpmXRJq9lOOWZQc
	e+AnHtTfu0QVD5+xX+HCCMAcHAXKiHbc5iVYpoWh6hvCv8BJpJGUPxqZQCgk2LnxT1kn3xFNfAu
	jN6TottasCcQkq9EvKtOI3JpExlhCJOFfoQw2LZ+9eleQ5l8VnpOYcZBIx6ARt5wj1L5qZfLBar
	aBarhjXyyqyjSr+6/Cx2msTKdhy
X-Received: by 2002:a05:600c:c16d:b0:488:be21:54ae with SMTP id 5b1f17b1804b1-488d66504bfmr9309295e9.0.1775776286170;
        Thu, 09 Apr 2026 16:11:26 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.25
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:25 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 14/30] curl: patch CVE-2025-14524
Date: Fri, 10 Apr 2026 01:10:14 +0200
Message-ID: <69b98b1f2bd0717b0ab7adcb5d8aa9b84ae2f48b.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234973

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
 

