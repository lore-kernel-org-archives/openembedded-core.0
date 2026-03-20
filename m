Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70B7B1093186
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:56:21 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7529.1773993379153890674
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:56:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RpPKuGKj;
 spf=pass (domain: mvista.com, ip: 209.85.214.174, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b04b4974abso16105335ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773993378; x=1774598178; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AxDDNTvtGGFGB36Neyut/IaeqvMSJbfI8Az+EJjV0tA=;
        b=RpPKuGKjMR0sQDZhfzFoLxqPKvhnD6Kx1PYsH5hBHnpNGvTVjPFNamdkmN4l4YcCP7
         YNAAsCVTDZuzdJY/ZPTPy6yyAtSV6B2hsT1XO425wx7zxLUD7toZkgMOc4+NOVpRC1u0
         nZD+BtqM6rJR31aVl0psccFIOTuKzfBwNwhng=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773993378; x=1774598178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AxDDNTvtGGFGB36Neyut/IaeqvMSJbfI8Az+EJjV0tA=;
        b=KKAOkSwChGCjqg3Yp3RST14r6a+0oj/nSMyY+up/zEaMAkCBp9R9PEiTK6EZaFjU0g
         14uFT6fI+KcIhiDRUUqjwj6uvyIzVio3YcW5e+10FK0kOYU6hcMML5kvPjXg1KzSYvid
         dpDwdpBq+Aevlo0dpz8XEeeNglx/2EpaH75Iq1vQ9QsBCURxVWWgVbKT9G+ZOvuBSSmk
         43pvo86cMbPPToGnQvD3t3LRp1Er5+j6PcTKkEtW6NTaQfpTAG61G74j8SAzV+189ZRV
         JYGj+bXqczDMP6gbdVBEOte1F8BGuLHLW+8pWY/AwkxC3+AXY89SYpbbwFIP8HOKnv2Z
         y0pA==
X-Gm-Message-State: AOJu0YzAunqPOgVf4L0ZZBb8T4kIupER+AEomksdKV5T91mnFE7uIqLe
	8QIeMc08CTRg31yTFcKgLrx6sNp06s9DeSYHa5GSMmO3m74DOvupkkWlVhM5rCIXOsfXEiLW17Z
	Di8jIAGc=
X-Gm-Gg: ATEYQzzn5REd20UEqvQcmdbspPrTXPCA51fREt+2vbR1RiEmUXbUqTQQq8owFTpgIw4
	TuPXRsLkX2sPHuzZuV2S2Teu/oYZtTH9umF4+Kr3X/sZQubdaRrnAGxlJlAHhfFxxVtsEpbx/AY
	7r9cmxrmo3qlMxcb6LdBBw/v9MqQgGHNoQGLmSw/9HefmUQuFYZr6WtTyS7YAvXGoRUtS1EK4z5
	f0wXXF92E1N1MXHra7dZA3Jau4co5fRjrYUd4noswYLrDHVr/vWA/X99uQSV96ggUZwBxnitoh3
	z8KxANuKZF2uQR58x5d/Nk95jJg25tMYqsmu/9Lq+Zi3O8RT/W7iLbPgPM9XN0jUEa+gIA/1YOQ
	o+U4fKeDPgCLIpaPOq+9uXyf073s/0Ly4FzxnoeuOTDfUEAqg61KZkAYkx+ExmZKKKjfoX2IGRS
	H+UtnMd99OAMk1sf3Xqjo0lneht2r+PZduzGIp
X-Received: by 2002:a17:902:da83:b0:2b0:66bc:2282 with SMTP id d9443c01a7336-2b0826d6bb5mr19549625ad.6.1773993377059;
        Fri, 20 Mar 2026 00:56:17 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:8f5f:34a4:6ab0:7770])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm14770965ad.23.2026.03.20.00.56.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:56:16 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 1/4] curl: Fix CVE-2025-14524
Date: Fri, 20 Mar 2026 13:26:01 +0530
Message-Id: <20260320075604.551251-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:56:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233584

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2025-14524

Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
Upstream commit https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640]

Reference: https://curl.se/docs/CVE-2025-14524.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2025-14524.patch            | 33 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-14524.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-14524.patch b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
new file mode 100644
index 0000000000..20f20d8692
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-14524.patch
@@ -0,0 +1,33 @@
+From 1a822275d333dc6da6043497160fd04c8fa48640 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 10 Dec 2025 11:40:47 +0100
+Subject: [PATCH] curl_sasl: if redirected, require permission to use bearer
+
+Closes #19933
+
+Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
+Upstream commit https://github.com/curl/curl/commit/1a822275d333dc6da6043497160fd04c8fa48640]
+CVE: CVE-2025-14524
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/curl_sasl.c | 4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/lib/curl_sasl.c b/lib/curl_sasl.c
+index 7e28c92..ed9ca96 100644
+--- a/lib/curl_sasl.c
++++ b/lib/curl_sasl.c
+@@ -531,7 +531,9 @@ CURLcode Curl_sasl_continue(struct SASL *sasl, struct Curl_easy *data,
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
+-- 
+2.25.1
+
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


