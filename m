Return-Path: <ecordonnier@snap.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC9B3C5B572
	for <webhook@archiver.kernel.org>; Thu, 13 Aug 2026 16:38:05 +0000 (UTC)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.23577.1786639076933366332
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Aug 2026 09:37:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@snap.com header.s=google header.b=H66oTkVn;
 spf=pass (domain: snapchat.com, ip: 209.85.128.46, mailfrom: ecordonnier@snapchat.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-495437bb891so10737345e9.1
        for <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 09:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snap.com; s=google; t=1786639075; x=1787243875; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=m8oWcrZk5/efikdW3YF5tpUGxepqlRK08RHJVAwBP1g=;
        b=H66oTkVnZJAsRukVPbUFtZ6P3U3GLeHzXEYNkKLoBbUUWu2qVYiApHPzrf/2FAHNjs
         6CIGGjhazC4JonZRkqo6iZdL9Rm1u3rFtDIZNrzQR59Z/IX3fYilSiRccFfhoV69vf9G
         pPKF+KWc6YomAwM6waWpRipZaJfv8T5agDTZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786639075; x=1787243875;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m8oWcrZk5/efikdW3YF5tpUGxepqlRK08RHJVAwBP1g=;
        b=n656NwQz2VoQm5rBlzd/g51OWy9HH+EoxDit7D83m+Wc+o7UB/Zei0V46Dsm5iYnBL
         skr/pzwslMgaJZoUW+D4qFfv3jIQLE1IpsZP5kYrmxnTu1y0Wiqt4c/I7RpQMi6lyNCA
         Teq+Z3nWy3FTrt/eGwbtHqm0v0kZpB6VOuwaug3c649Gv+AvMISXSSHncKddi2XTL1Uy
         Rx5cLAleB6S0cej4AwdF8bWmLFpCHGmopo79RkUL5mHEjxCZRxaBKii61VkNnRZzYSMl
         r3nXycO8Bqs5esP6JZ2zv0JsXDE1AzjDiOloVZYop2rBMthDz+3a1BcIZRz6mXLeC7Cp
         G4qg==
X-Gm-Message-State: AOJu0YzOZcFl8ScwCq0r3XjVTK2V28i2uZBq8uysXAMp8sszVGN4kMjV
	9tgqJ7YJ8VKUDpVajZxeQzdNGz0SZU9HbCexYJa0YhUR2nrJ09v2GlMDghtdOOHJvPN8GB81p93
	U15iCMJM=
X-Gm-Gg: AR+sD12T8LfFWSEMC1MiVdH6SxLezP1wgntOiyY6jq+Q+xOGQI4i2pXV7Rz1IQmBUk0
	/XK5bvVUTzGkd0UPZ1Z3uztCgZvHTRwr4WDPd8rsOxr6aMwDM7yNXjmkOcN4NQsJzbMIIxQZbyY
	OqE0jmIClNHSRC3Y96rU27PykD4UzfZXrgnHhxS2Il+ha01muUqmnOMS1t1CzYTXHrZWzrmncQD
	r1wbEl+W9VwC5N9V6+czdcBPfjtU2SRhJyBBFFnn034DGVOMc4SotNFzmkx+rHDhK8c/chipxbd
	pbBkFI1ZfKM11ybJ8ZbeGhKcwrtbDPAay/q5ZUfsdhMTk+zS5SomV//tH31AqzPLoXl4Jc7bp0/
	lNUrULXLfFOZaIezKcskfmKk2Ba2WSv83Jfcq68k+HpbXl6V2ykRiHMYgrMmO55niiNPOvkK8hL
	TkkFKce1Fd/0AbizTcTGk57hry3CafRbiel09VnDw36uu0tA09Oncp7KIfwxblh6eZ+wlcnJebi
	/z8UVvfGRV0Kr26p0caBGwobOJEnxVy
X-Received: by 2002:a05:600c:1546:b0:499:5f80:83ac with SMTP id 5b1f17b1804b1-4998220bc5fmr68150985e9.7.1786639074968;
        Thu, 13 Aug 2026 09:37:54 -0700 (PDT)
Received: from lj8k2dq3.sc-core.net ([85.237.126.22])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49982131261sm126684955e9.8.2026.08.13.09.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 09:37:54 -0700 (PDT)
From: ecordonnier@snap.com
To: openembedded-core@lists.openembedded.org
Cc: Etienne Cordonnier <ecordonnier@snap.com>
Subject: [scarthgap][PATCH] curl: fix CVE-2025-10148 backport for websockets on 8.7.1
Date: Thu, 13 Aug 2026 18:37:46 +0200
Message-ID: <20260813163747.3020711-1-ecordonnier@snap.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 13 Aug 2026 16:38:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243377

From: Etienne Cordonnier <ecordonnier@snap.com>

The original backport applied upstream's CURLcode return path into
ssize_t ws_enc_write_head(), which uses an undeclared result and is
invalid for curl 8.7.1's API. Builds with --enable-websockets fail.

Adapt Curl_rand() error handling to set *err and return -1.

AI-Generated: Claude Sonnet 4.6
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
---
 .../curl/curl/CVE-2025-10148.patch            | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/curl/curl/CVE-2025-10148.patch b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
index d37497febe..654f4151e9 100644
--- a/meta/recipes-support/curl/curl/CVE-2025-10148.patch
+++ b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
@@ -9,23 +9,28 @@ Closes #18496
 CVE: CVE-2025-10148
 Upstream-Status: Backport [https://github.com/curl/curl/commit/84db7a9eae8468c0445b15aa806fa]
 Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
 ---
- lib/ws.c | 21 +++++++++++++--------
- 1 file changed, 13 insertions(+), 8 deletions(-)
+ lib/ws.c | 25 +++++++++++++++++--------
+ 1 file changed, 17 insertions(+), 8 deletions(-)
 
 diff --git a/lib/ws.c b/lib/ws.c
 index 5bc5ecc..02e0ef0 100644
 --- a/lib/ws.c
 +++ b/lib/ws.c
-@@ -614,6 +614,18 @@ static ssize_t ws_enc_write_head(struct Curl_easy *data,
+@@ -614,6 +614,22 @@ static ssize_t ws_enc_write_head(struct Curl_easy *data,
    enc->payload_remain = enc->payload_len = payload_len;
    ws_enc_info(enc, data, "sending");
  
-+    /* 4 bytes random */
-+
-+  result = Curl_rand(data, (unsigned char *)&enc->mask, sizeof(enc->mask));
-+  if(result)
-+    return result;
++  /* 4 bytes random */
++  {
++    CURLcode result = Curl_rand(data, (unsigned char *)&enc->mask,
++                                sizeof(enc->mask));
++    if(result) {
++      *err = result;
++      return -1;
++    }
++  }
 +
 +#ifdef DEBUGBUILD
 +  if(getenv("CURL_WS_FORCE_ZERO_MASK"))
@@ -36,7 +41,7 @@ index 5bc5ecc..02e0ef0 100644
    /* add 4 bytes mask */
    memcpy(&head[hlen], &enc->mask, 4);
    hlen += 4;
-@@ -802,14 +814,7 @@ CURLcode Curl_ws_accept(struct Curl_easy *data,
+@@ -802,14 +818,7 @@ CURLcode Curl_ws_accept(struct Curl_easy *data,
       subprotocol not requested by the client), the client MUST Fail
       the WebSocket Connection. */
  
@@ -54,4 +59,3 @@ index 5bc5ecc..02e0ef0 100644
    result = Curl_cwriter_create(&ws_dec_writer, data, &ws_cw_decode,
 -- 
 2.50.1
-
-- 
2.43.0


