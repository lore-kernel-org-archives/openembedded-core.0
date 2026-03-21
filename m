Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 919701094466
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 09:47:45 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8226.1774086458168070007
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 02:47:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C8WBZSxd;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-35b97ed057cso813759a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 02:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774086457; x=1774691257; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uvvzdnxSsnOJ6uZUXXn4aDrGsvrO1e9Wg1h1jH6biOk=;
        b=C8WBZSxd1nJ6RwkQ9SoMbqh+ZWNPlH9qB8zyvcdfgNc8+edsgpIL5Fs8C+YkDslzlF
         704oJjXY1zTaMUSdNG8l1ZM6nmS7PlWXNDHNwFB69DPcHlPCRqUt+83hYUCG3wWb7Oz9
         DJxoPSvQs11DFVAJVDm4tpS0TNmI1QqiCsz1c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086457; x=1774691257;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uvvzdnxSsnOJ6uZUXXn4aDrGsvrO1e9Wg1h1jH6biOk=;
        b=Sfd03lLoh9JicPxV/YZ0sAg1VGTuT2My8MQH+qISrKI5nd7xfY1M9UVtkthAVE7/V3
         iyenbBAq/InheM/J+1TosxfhHoBXdpt1gFagKZZrRgayVqb1Zk3JTSwaxORFDwxEG0KR
         RsBRuklrwKtirJ0eeqBdL7w1TfXFuTSuRP3MUCJHQFe+mibFDYRs3K/9Gc8fdBO2IkTR
         F7Yoz3i+PbcWWoR8slRpaGU67xt6RJC6OTh/DbSu7etM95keOKnN7J8g493O6qPAQKxp
         XQ5PPUt2VBMwfsvNDWyVvbii0RMHQig73UfaI+C1SvwXqysRLm56kQR/nvz6ele9GaGc
         ZwgA==
X-Gm-Message-State: AOJu0YwTuZM+a7Pc19jvdOyj1NYq2QzdwmPRhcPHmKRgz0LNWrd2epAd
	dshOgxD7vD3ymdjehBYXGjNIrbIzopcQNwy8j1ecoMQE3XC0kG1FT+cxJkA8aCnFWpow2HmWJVe
	x74VFUgo=
X-Gm-Gg: ATEYQzxFJWfelX2avzmnPRnuZuzj4S0AqsSwBMu+vP4DAW6IgwdsHP/7WNubzolAYb9
	pQpyFuIQqtdkFvb/aqQNqopSIHvV+FDn5uwbN1XWFRCn/CEUQC5TahOALLHH/yficWWkRgnbT2y
	YvC3e+XT14votkcfP/7Wg/LDVDGu0NQzoUhkKCxaU4zOqbrvVsEE5dMVoYnq5v/yKYaoVqJAfkA
	7ViSJTd83ldS+pCAEuTN7KcvEJbv/vb9/a5NxXMQbu3nioBzmkOhdKi+sJbL698YltfkzXGzP7H
	BcpPyo78M7WCRj1WvJuPhZte0P2RCjFf7pvh0GWqNRN9xNACrXpfXIlk2vapo3apgSE5gm1vmiJ
	iPuplTMi92o7/OEg/H7dnnbL79d3MJRxMYWR2cf+aWg4lMN3bGbFSX8JycARdwk8eAmKd0wKlbY
	oFRS0I4saO9dBxf44qVofcc+s6KkEnrUXpj4sR
X-Received: by 2002:a17:90a:e70f:b0:35b:952c:43b9 with SMTP id 98e67ed59e1d1-35bd2bcd125mr4646271a91.10.1774086457037;
        Sat, 21 Mar 2026 02:47:37 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:e896:2af1:2e77:522f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm7489501a91.2.2026.03.21.02.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:47:36 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>,
	Amaury Couderc <amaury.couderc@est.tech>,
	Yoann Congal <yoann.congal@smile.fr>,
	Paul Barker <paul@pbarker.dev>
Subject: [OE-core][kirkstone][PATCH v2 1/4] curl: patch CVE-2025-14524
Date: Sat, 21 Mar 2026 15:17:20 +0530
Message-Id: <20260321094723.273058-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 09:47:45 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233652

From: Vijay Anusuri <vanusuri@mvista.com>

Pick commit per [1].

[1] https://curl.se/docs/CVE-2025-14524.html
[2] https://security-tracker.debian.org/tracker/CVE-2025-14524

(From OE-Core rev: 951113a6e8185969444b5e28292f23434dba1f6c)

Signed-off-by: Amaury Couderc <amaury.couderc@est.tech>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Signed-off-by: Paul Barker <paul@pbarker.dev>
Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2025-14524.patch            | 42 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 43 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 0000000000..0ab77ade9d
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
index 72bd1a2088..b8fa8b5266 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -70,6 +70,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-14017.patch \
            file://CVE-2025-15079.patch \
            file://CVE-2025-15224.patch \
+           file://CVE-2025-14524.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


