Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C502FE78D7C
	for <webhook@archiver.kernel.org>; Mon,  9 Feb 2026 09:29:26 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.43982.1770629360266159200
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Feb 2026 01:29:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=JLhTOYsr;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-436263e31abso2870749f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 01:29:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1770629358; x=1771234158; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5dXwVEJ8eVGN97NyV+4n2vlnLsAw0puXKzcrydqoY2U=;
        b=JLhTOYsrHswrfmrpl3W0WUV/SSUyOFbLRUQh0pkhN/06mcs5U1KqEAWZiuxKMSwGQi
         pcXJ2cyeXX7SpLZeeckNefCmvVj5zgwIr/0bPCZVfIQ+LNRy8OzUfJaq1MaP5QmFRXwT
         cBica7zACyUmbH/jVnevdnCJ1XnKSL2qPVlPA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770629358; x=1771234158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5dXwVEJ8eVGN97NyV+4n2vlnLsAw0puXKzcrydqoY2U=;
        b=qOk5XhUg57MzQR+mODUct7CUGuAV3v4qHaZiinuYbq6plyjnzgYo9a5Q52SaqalVtD
         llEtSiH5gaHgOLF2nSTdVFvZes0ijWh86yavm54gX+CB3pJ3CicmPIZBAuz5l1XefoOI
         zp8jkfryY0vZsErhk9p4P7q+trc0JukW8JR4ue2HLQV8nLtQDERC0uSoIpEI837kjwNo
         0JZJqqxOte52pqN319E+JVcwi3UVzcdlQsb9DPT/GW3f1q4W+3vITshfMTtOVQR6A8cL
         fIVydtnzbiD/TSCzL/SeJW3VK6WbcWvr5a0owDFAE/9onsgDwUDE8qnq1RJfdkFiJUuS
         URgg==
X-Gm-Message-State: AOJu0YyFZFXN2HlnpuyYgH1/oR4wJyjGW0eRtN6LGZdCeSnGEcrRGGRQ
	l+ij42hbCKwbH5OZLv464gx3E+c7I5tXNQU6aIN/ZFaO+MxjdSdqow0JSVVYyadgvIjCdNX1P5d
	QtWx/4TU=
X-Gm-Gg: AZuq6aItmDXCr7MW0Eu7M+EZlZZojjrkGQAKsRX5dXY9HYGBD3pgSSZG8Agc+1u0PuC
	RM9p/q0gcRGT8ixDAVzLxHIIqMGn3bu/kyuRH46gW4KmTT8XddndBr3yikIxI3iEM/gCWwcnQ18
	DmWcuESC7ABCozxP9PDRVFTg5y9gn53h6SnkjmxKUcnybyA3MWlDBXIQgfa/Wgq4MA3qr9gG1Rj
	72slIyHC8XSC+/AqyDUWzHWSwyc1xJcOFVKH08TFXqwrVcTf6I67QrVubaZRK2+pagpbzXYEF9t
	avqmI+n2dUstcSLR2lg2Hh4uiXQB8KBE/BNEGolG1cJIScNxtZoZHQEto9gbL677JqULeE2DM3D
	E9lW3KwXyr+ySJ3TcY3Qgw0r6CMmwvLvG/kfiYoKqW5rCM6TEkhcXnspPv7xEQkP0+jfIXviGFH
	vIZAl1vE+9mCX8punt1FoT+4qblSzD7Zba2/o7yoTvpxbFF72rqc7ZFdDXd5XSIzBWIL05H15Xc
	wzJyh9/zeL9S4E=
X-Received: by 2002:a05:6000:24c6:b0:431:c73:48a8 with SMTP id ffacd0b85a97d-4362938b112mr16231636f8f.29.1770629358197;
        Mon, 09 Feb 2026 01:29:18 -0800 (PST)
Received: from FRSMI25-LASER.home (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376a78d796sm9575656f8f.20.2026.02.09.01.29.17
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 01:29:17 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 01/25] curl: fix CVE-2025-10148
Date: Mon,  9 Feb 2026 10:28:44 +0100
Message-ID: <c413412072b466c95100d0ff0adddf4eba11f084.1770626074.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770626074.git.yoann.congal@smile.fr>
References: <cover.1770626074.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 09 Feb 2026 09:29:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230752

From: Hitendra Prajapati <hprajapati@mvista.com>

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
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2025-10148.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-10148.patch b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
new file mode 100644
index 00000000000..d37497febe9
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
index ecda13a04e1..0d7aea0978b 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -25,6 +25,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0003.patch \
     file://CVE-2025-0167.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-10148.patch \
     file://CVE-2025-14017.patch \
     file://0001-build-enable-Wcast-qual-fix-or-silence-compiler-warn.patch \
     file://CVE-2025-14819.patch \

