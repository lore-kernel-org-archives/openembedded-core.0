Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A592CAC5AE
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 21:18:11 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web10.26003.1758748681180809013
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 14:18:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=awGYA+Lb;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-26a0a694ea8so2771095ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 14:18:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1758748680; x=1759353480; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/LVvTKf8NJO3sE8Kr4LhlHMeVbbffvvVOtU6hhNi4Vo=;
        b=awGYA+Lby/FDoVsaOHY2tR+HOfxoxMzl8rJJpS16mLTT8uXBhudSOS65K3BS/k5Rj5
         0xkhYd0oBNmRPaJ4jYd3Z76rzaJK3ZXXArk/JwmnIPcHpckTw7ejotv4opDkWKu1bXdm
         wuipBAMyGVAHqxDGORR60lo9D40ZwlatYmzuB2sRDm5DG+hmvUdeqX6OCDItHXmtCb4p
         vL3kFBxYKyfZDsGZIkMFXT+HKBb6sn1HKIH1bZthu2/6RY2fffryl2mkwQS0EEzfvB6W
         pKxG5VBNqt2BHbFYaA+doDTgFjkKiBAxbMmBIOew6L9fH8bXSzI+PNm083+wIZ0uwv85
         mwEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758748680; x=1759353480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/LVvTKf8NJO3sE8Kr4LhlHMeVbbffvvVOtU6hhNi4Vo=;
        b=tnpmTDiLs4bR9pF7JV244uJJqqtvN+HCSdN91A68IG4mlRzpkyIk3saE4RlFbZvAQS
         VdauWMN6ajmPQl2yrYPD96BYF0U8tpwxTZfv7kYhMqLNFdLfwqFAY61ypzrGHwm9DRZY
         OBT1bGbcnU/l8sY19kgEZu5xuGpLPC5OmNF2w0xRG1GS+EI3S8StAYV1schyEI3Vm9gt
         clEpGB50/zMRMqo8Hamkt02YQepR5NQqQvmIz3tKuHtA58uRsyBDxnuhibXk2TWFzcz6
         UqwkBBK7RUDGrLq5rMH6YFdjrRrDXYywhao5DfeOjqzwllcn+2PbGUA9+MFqglT02ZSZ
         VegA==
X-Gm-Message-State: AOJu0YyMhvynsqfK977bkW4FEyHMLCN8A1hSLANUcJMdkGQR4SFpzaaP
	Y0ZnV8coYP3ucnL9bIPlHWNdBY4w7RiKJkTzINaDBW1C9eA60VC7cYyt1TDm3TaKbDwZ8ocFm90
	A+A8frt0=
X-Gm-Gg: ASbGncvVvuS100NcNKtCoTZj5bJ5foAzcM6oC5xlEz5EbOyxCki2Cq7vWp1RwfF++hu
	wci3691VV73ozViBAvtrIMVpi9Cijsr8ZYYxbjT6JQWnQF1jwdUnv7ey/jn9U4zUbxiTiTgy76N
	OyzCO6IQThGbNVs5jXwUZI9jd/b7hQJGyqaWtm2Faupqu/Akl9JnXP7Sdybnh8LJS9Uzd6uujxt
	pq/wxVSsGbo751CDWLLtZafixbRiM/3adV7Nw8cZq17CX5RnZ0R1yTM4CzTiETybgZ6aVf4utCd
	fN1EpcTYDaIRWilGLAy1GYm0q5IlQYkTxAap8eKKiOQTT4v3QqU4gGlBG6M9Ke4EbTpQWzAwoDL
	A5U31KNBvGopM7g==
X-Google-Smtp-Source: AGHT+IF87Xh1Lj5pzYOeAUntEWZS1FUFaVgshOyTrQI+SyaNU4m5TA35iIWL6xDnPA2ob86vgSYcDA==
X-Received: by 2002:a17:902:f60f:b0:262:661d:eb1d with SMTP id d9443c01a7336-27ed49b301amr13064125ad.1.1758748680084;
        Wed, 24 Sep 2025 14:18:00 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:5e34:462b:e2f0:5898])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-27ed6702cf9sm2194555ad.38.2025.09.24.14.17.59
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 14:17:59 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][walnascar 2/3] curl: fix CVE-2025-10148
Date: Wed, 24 Sep 2025 14:17:49 -0700
Message-ID: <83420a408551688ebb298b88b16d2e384e9b7bfd.1758748538.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1758748538.git.steve@sakoman.com>
References: <cover.1758748538.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 21:18:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223991

From: Yogita Urade <yogita.urade@windriver.com>

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

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2025-10148.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.12.1.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-10148.patch b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
new file mode 100644
index 0000000000..7bc5d18396
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
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/ws.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/lib/ws.c b/lib/ws.c
+index 25d19c6..029172d 100644
+--- a/lib/ws.c
++++ b/lib/ws.c
+@@ -637,6 +637,18 @@ static ssize_t ws_enc_write_head(struct Curl_easy *data,
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
+@@ -819,14 +831,7 @@ CURLcode Curl_ws_accept(struct Curl_easy *data,
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
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index 0fb3719ac2..bfe0075af7 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-10148.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


