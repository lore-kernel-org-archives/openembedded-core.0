Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F76EC61DBD
	for <webhook@archiver.kernel.org>; Tue, 25 Aug 2026 10:07:23 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18284.1787652441085495023
 for <openembedded-core@lists.openembedded.org>;
 Tue, 25 Aug 2026 03:07:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=Y8wcFi8Y;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-482db627cd8so174776f8f.1
        for <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 03:07:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787652439; x=1788257239; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zbzCIWdwroEPHNGBRA7/XSSOoaYdbOzoMfGhi97ifq4=;
        b=Y8wcFi8YHPSMAHTT8cNR3mVOXEodSDWFVgb9T03xmFyLh+6+S+MXpmSeBiHxJtLpj4
         TQwhGj4OWhUwMUWjVp9ZVxE2lkPaCCFRlgIJbiVwPTRvc91MS3dOrP5KgdQE/gnBWrw1
         b0IkUpcbgHQrV4Yk0705XGLE5OWnO/eLjywgk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787652439; x=1788257239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zbzCIWdwroEPHNGBRA7/XSSOoaYdbOzoMfGhi97ifq4=;
        b=rc6db4LzzX5jY2sxmfJZwYkWnaBoHZY5ZN8ZY4+hHBTr1GlpaaxLxjJu6UvTFUJbE9
         qgzErqCxgOOMoiSFOIukouzkgzSpJ+A8bcyejdveI/db/UpCGu5iIz/SQTEsogcYttSD
         oiNy90ugahEbk3VzIm8ueEL3nFRJaQQ/CqXVcDX/B6rLepkpvGTAY1QHEtcCqC6rcYNd
         vQsyeltIkQlHz3sI4B3UVA3TuGAF36wejhMoHqTTEl7WDZe4FFB2VnwTE6z2wjvWxL0z
         4WoXR1ieahpkENb4eGMd0nZUYP12zKlRQHARY5Way0G9EErSRq1yciSjGtb2hMuSW1PG
         HBTA==
X-Gm-Message-State: AFuF++kQZ4+DDEMbmGJ1k7Vv5wbWjdpDT/yOUAYz+houe58VgEygb8Sj
	kJukCUWZCNE3gGsXvM3HagYXQeHkGNF00fZ3t8cBA8tee1zN9xyDr4MdbkBdL3H1BQHrZev6HxH
	lmBhTrO4=
X-Gm-Gg: AR+sD10+IPbNRVNX7/DRwHuKFAxRLKaTf+R66by1Diwo7Tkt3d8CzLquyqpnmgKSy6V
	Hmo3Vnd5t6+zugQFjYHPlhrMYqQRSpwJdvObGWeQWXfr+xhCPw2tLXQg5hzRSoX4MsbGya3VaMC
	LNtzUiTdGGrO4wpP/aruRDpW+i/F8mRPSHOKX4dkuLxyonbP2xnALF4+jjDkDhwXMRpKGF9Y6wD
	95r2gF+lFkUP5urbwDJ+7jSlzmgSIVlBECcXXGVaqSzJaRc5Yf5myGaNQ7MaHwR+jL/tmZHK5W5
	QEGOFmHZ37i9Wz/vYTFazd5JtnUhKdPeWUceMhmN52hGHWCMRdiQqRPna1vuBwyZOEmYhu26dk5
	AGxZNOr4vgwcv9aHGYfG0xuQTZFcTwkwHy8HZWz0wAL7kwRh7Rosdwve+v+HYbcB6TxAUDCUvtB
	xyin/v//N+txL5djxtzOSDUroFfUFEt3+r7pB9OKWGFfifAts8CfJrh8QUZPKQ227QDr3lcArDR
	46X0SgkSTi/lIpSoWPW+sAjBmAWMSQyHrw8LYOUWAl/05Ekf9kJWb4vNApx3TpKNrF/yYw=
X-Received: by 2002:a05:6000:461c:b0:47f:86d5:d1d7 with SMTP id ffacd0b85a97d-482c0b63396mr48770807f8f.6.1787652439168;
        Tue, 25 Aug 2026 03:07:19 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482c9bfd865sm10847901f8f.22.2026.08.25.03.07.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 03:07:18 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 08/11] curl: fix CVE-2025-10148 backport for websockets on 8.7.1
Date: Tue, 25 Aug 2026 12:06:46 +0200
Message-ID: <152c139de6b1ad00d904b5fd16b4abc9852459a4.1787652331.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787652331.git.yoann.congal@smile.fr>
References: <cover.1787652331.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 25 Aug 2026 10:07:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244222

From: Etienne Cordonnier <ecordonnier@snap.com>

The original backport applied upstream's CURLcode return path into
ssize_t ws_enc_write_head(), which uses an undeclared result and is
invalid for curl 8.7.1's API. Builds with --enable-websockets fail.

Adapt Curl_rand() error handling to set *err and return -1.

AI-Generated: Claude Sonnet 4.6
Signed-off-by: Etienne Cordonnier <ecordonnier@snap.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2025-10148.patch            | 24 +++++++++++--------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/curl/curl/CVE-2025-10148.patch b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
index d37497febe9..654f4151e99 100644
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

