Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71646CF6BE4
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 04:53:12 +0000 (UTC)
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8684.1767761589863358570
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Jan 2026 20:53:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=C5IPSUCD;
 spf=pass (domain: mvista.com, ip: 209.85.215.178, mailfrom: hprajapati@mvista.com)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c13771b2cf9so1251035a12.1
        for <openembedded-core@lists.openembedded.org>; Tue, 06 Jan 2026 20:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1767761589; x=1768366389; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q4qFMMX3ABLuKIrXmdSkbgvA8oOa0CSs0ImDsmMY/NE=;
        b=C5IPSUCDqtHEnNsg0rm/7OUJG1lAPU5/XIf4kJyz9ZFjsdxwYDORxF/gmjzjmokSS1
         2lrxLC9kxnUYLsMrZzEwo6qIX1DhLxJEuSWarj+EH8WJVO+nay70I3j0br99Mk0Ycscw
         gMRVkFAHOqR5GY6ejAFTgbFExSVnSLJwZwZfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767761589; x=1768366389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q4qFMMX3ABLuKIrXmdSkbgvA8oOa0CSs0ImDsmMY/NE=;
        b=rpGFcVmD3+9AymPR+7fojZwxzGvj3lVW/L+/hfrflwf9244sWYmvCS033mJJD8NQs8
         VsuOwIhYkvahSLVhSudeHCJzT6SdH7jbf7+P4cOnWffodQMVP+vUAYBm04yHt0cpezD9
         9lBYOGGgQlKo52xi3iMPzi8hPa9IBGb2HImQO6bxycIbMq4V2cJGAQwEXfFgH50SIVa/
         Ev0buJpci8DdE9A8pXeLiT9wZZkNZd/35J6YYuwSUaji1vNHi0I38R8MUkzlHBK41zTp
         Sv/4qD7le9mppV1Y8XQeRbowPwU8DiNdbH8LUi4yt938QTtAxaCY4QkSeZ6/9xeDF83y
         plRQ==
X-Gm-Message-State: AOJu0YxiVRFSLCLlahDfZp6X5rV+duazQLTYKIeP/wVbwCUFSDL1NyzI
	W13nCV4/5J/o13WfxdnT9thjZ/FfiVqy9xOIQPDE2S7wLuBkfmi8WLu1xS9LPqwN0nE4y8u4+ZJ
	eeSdYHa8=
X-Gm-Gg: AY/fxX5AEN6JusjRxsX3uWx4YHjMed3dOiQsdoELdAoGobx0ie6DJwGtZ91qPbOSxYR
	Ro6hMCrOqed90uKBpjiG/6s5p1tMf6JqaukHVedUxM4QhG36p1YKRaFQUgdkiMV5w82VglPby+5
	AlJa3TbGHvePmbZnGqo8y9zXHYC1Fv5EaXR+VJHYoDx85ubbbr5pL6a5ZTURD5UOLNj3JTiTc2K
	8Ab/82dE/T7JvlqdbWgz6ngqypxUa156BqHxMcJjniQ2VBbg2k15Op9juSIHyJm5gZld/ike4jW
	eQjFONJvx7UayD2iDp6N0aM2NYiNYM+91KLYQhn/Q2qCPkRaN8pl5gjsEJbVNrCmg0UO4Dw3I3O
	k/mk94dT/RVL012vScWyfRfEoo9nanWAzPLh7JUVhE1ZCL6ubZkYLBqXkldpXeY30Qu/u2MBIk2
	U2xLu6oBYvKlM0O4Kyx9ltn6E=
X-Google-Smtp-Source: AGHT+IEp/0NRkx/l4TiY68JIminvaZRLr9E1Yh9jtc1zQPb8tUyYSdXt7QXtVzVr9Z1hoGeXjwZwbg==
X-Received: by 2002:a05:6a20:7352:b0:366:14ac:e1ea with SMTP id adf61e73a8af0-3898fa09be1mr1082912637.80.1767761588947;
        Tue, 06 Jan 2026 20:53:08 -0800 (PST)
Received: from MVIN00013.mvista.com ([27.121.101.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc96ca828sm3876853a12.28.2026.01.06.20.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 20:53:08 -0800 (PST)
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [scarthgap][PATCH] curl: fix CVE-2025-10148
Date: Wed,  7 Jan 2026 10:22:40 +0530
Message-ID: <20260107045240.170121-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Jan 2026 04:53:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228944

curl's websocket code did not update the 32 bit mask pattern
for each new outgoing frame as the specification says. Instead
it used a fixed mask that persisted and was used throughout
the entire connection.

A predictable mask pattern allows for a malicious server to induce
traffic between the two communicating parties that could be
interpreted by an involved proxy (configured or transparent) as
genuine, real, HTTP traffic with content and thereby poison its
cache. That cached poisoned content could then be served to all
users of that proxy.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-10148

Upstream patch:
https://github.com/curl/curl/commit/84db7a9eae8468c0445b15aa806fa

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2025-10148.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-10148.patch b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
new file mode 100644
index 0000000000..d37497febe
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
@@ -0,0 +1,57 @@
+From 84db7a9eae8468c0445b15aa806fa7fa806fa0f2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 8 Sep 2025 14:14:15 +0200
+Subject: [PATCH] ws: get a new mask for each new outgoing frame
+
+Reported-by: Calvin Ruocco
+Closes #18496
+
+CVE: CVE-2025-10148
+Upstream-Status: Backport [https://github.com/curl/curl/commit/84db7a9eae8468c0445b15aa806fa]
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/ws.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/lib/ws.c b/lib/ws.c
+index 5bc5ecc..02e0ef0 100644
+--- a/lib/ws.c
++++ b/lib/ws.c
+@@ -614,6 +614,18 @@ static ssize_t ws_enc_write_head(struct Curl_easy *data,
+   enc->payload_remain = enc->payload_len = payload_len;
+   ws_enc_info(enc, data, "sending");
+ 
++    /* 4 bytes random */
++
++  result = Curl_rand(data, (unsigned char *)&enc->mask, sizeof(enc->mask));
++  if(result)
++    return result;
++
++#ifdef DEBUGBUILD
++  if(getenv("CURL_WS_FORCE_ZERO_MASK"))
++    /* force the bit mask to 0x00000000, effectively disabling masking */
++    memset(&enc->mask, 0, sizeof(enc->mask));
++#endif
++
+   /* add 4 bytes mask */
+   memcpy(&head[hlen], &enc->mask, 4);
+   hlen += 4;
+@@ -802,14 +814,7 @@ CURLcode Curl_ws_accept(struct Curl_easy *data,
+      subprotocol not requested by the client), the client MUST Fail
+      the WebSocket Connection. */
+ 
+-  /* 4 bytes random */
+-
+-  result = Curl_rand(data, (unsigned char *)&ws->enc.mask,
+-                     sizeof(ws->enc.mask));
+-  if(result)
+-    return result;
+-  infof(data, "Received 101, switch to WebSocket; mask %02x%02x%02x%02x",
+-        ws->enc.mask[0], ws->enc.mask[1], ws->enc.mask[2], ws->enc.mask[3]);
++  infof(data, "Received 101, switch to WebSocket");
+ 
+   /* Install our client writer that decodes WS frames payload */
+   result = Curl_cwriter_create(&ws_dec_writer, data, &ws_cw_decode,
+-- 
+2.50.1
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 0af6a41399..81e7e3ea8e 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-10148.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.50.1


