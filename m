Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB7E5C4450C
	for <webhook@archiver.kernel.org>; Thu,  9 Jul 2026 10:07:17 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5890.1783591630584874983
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Jul 2026 03:07:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=DzSe4zi8;
 spf=pass (domain: smile.fr, ip: 209.85.128.52, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-493c59f740cso12803205e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 03:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1783591629; x=1784196429; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hIL8p06vZLHqC8YjWByb6MmkfUoBCYTz6iTY9D8Jye0=;
        b=DzSe4zi8rSdZvF54O5QLtk+QCisuNnnrbKIMTDV8eW8wPZiQrhqSklw3CHVZKaLpLb
         +Rl8p/gL1vwCN0IR6SgU8207j5wmywuAJezDKgVQvJ1k4y+r/O/I4hiYEsbdbdqD3CCd
         2zkJ+jdKx0lvYTlDuMGESRKI1BIPoMRORMIoU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591629; x=1784196429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=hIL8p06vZLHqC8YjWByb6MmkfUoBCYTz6iTY9D8Jye0=;
        b=ica9MSvuxVmSv7TWXZVMRTNPYCCtSx8bmLzYX7B6Z6tUu01z/ZbXtTwjo3fy6yoori
         3y/T0Yuc2eCtXqXkhawdtA9+vUMJoklcS1Qq96t73bjR3sqVViM5nFhCz2rFynCmDmGH
         5CPMEP9qCAnoIW95WXWMyLYqnTmAnWyNo+HOraDxkNhoe0TfQgvhiwWErZyD4lgi+e2k
         YHlKQM4NeFBkls6/qrnGlgM8xuEA4LxnCy85H14JP4a85qrJiE4y0JVnI3UBHFP2kHwp
         tleF+xfxg97k7/9L2283dyBbiF/xD2q0p/oO3J6/WGt6uUKLhnKea142X1jXehfRmDc0
         49CQ==
X-Gm-Message-State: AOJu0YwF0i3sj6M9YXUKdXQ/WLQYUHTu1l5BMctxvVj9ZqDU15BauCT0
	DzloTIcQJwIKDlxvPRaS7k8HTLqYiZqtgaPd8Th9ctymEn+0NNpiP+j7jd/lGuzp7evgy8QnTYN
	UO5IKTE0=
X-Gm-Gg: AfdE7cn6fu5ZjjdpPnQnSD9NrBgOcERyNGMqKvajXTCH2TKWZZ+LkZCvjYYCcixQM13
	PU35MdiYujb8x4ezGpTpPjSWkE4ZIWheB88ys+uHVNSPuCvjaQ2JIqe5aanqmpIzeasH6Ex4BkA
	Fe60fB6LAcrn1ADodd7QpPb5wXMobWSgwc9pQ8q51qA5c84MMwcLE3YxjFhNSQFZNdjsWgip6NX
	51O1VTftSltQd4tMdfJsbxF/6n6oHc05vnlQEfbmKiLufbwBYoU7UW5CfnzmVoHFyo418FNuq5H
	KB9BdvueZqkjWqb8lk69OtbreBKwdFZw/qVa9dq+tbeowo52A85qiNdwUOFIV+yTVei1qnUu7PP
	tqTNBE26eKasAznnDycqnhsnazSIs7VhNqBQpPPEfKPpRZYyy/MW7aCHbS32DH+B/n3zp7YcYuz
	LY9AG2IzoU18+Jg0wvCkxrJpeVtITmTl+xNc6RVgx2uL930CEWBALSxMTHFgkmhFc9aU0BEg8+0
	icpJMsV8YKxG4ogAMj18z5RVyjp
X-Received: by 2002:a05:600c:4e51:b0:493:e946:c0fb with SMTP id 5b1f17b1804b1-493e9bad6aamr30730125e9.0.1783591628735;
        Thu, 09 Jul 2026 03:07:08 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00fd88810a86c49142.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:fd88:810a:86c4:9142])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e5a5d174sm149687135e9.2.2026.07.09.03.07.08
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 03:07:08 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 15/25] curl: fix CVE-2026-6276
Date: Thu,  9 Jul 2026 12:06:31 +0200
Message-ID: <171bd9cd44cdad3c7239be860e28b11c5d7b4d30.1783590688.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1783590688.git.yoann.congal@smile.fr>
References: <cover.1783590688.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Jul 2026 10:07:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240562

From: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>

Backport patch to fix CVE-2026-6276.
https://nvd.nist.gov/vuln/detail/CVE-2026-6276

The upstream fix moves cookiehost from the connection-scoped aptr struct
to the per-request SingleRequest struct, preventing cookie data from
leaking across reused handles.

Adapted for curl 8.7.1:
- Use Curl_safefree (renamed to curlx_safefree in later versions)
- Use conn->host.name (changed to data->conn->host.name upstream)
- Keep existing header parsing structure (refactored upstream)
- Dropped tests

Upstream fix:
  https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c92db

Tested with ptest:
Before: PASSED: 857, FAILED: 0, SKIPPED: 0
After: PASSED: 857, FAILED: 0, SKIPPED: 0

Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
[YC: copy the backport info from commit message into the patch file itself]
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-6276.patch             | 135 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 136 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6276.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6276.patch b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
new file mode 100644
index 00000000000..8ac387159a4
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6276.patch
@@ -0,0 +1,135 @@
+From ee81b4f4b2f8e7d1a49c92d8a470294ef7088045 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Tue, 14 Apr 2026 08:51:44 +0200
+Subject: [PATCH] urldata: move cookiehost to struct SingleRequest
+
+To make it scoped for the single request appropriately.
+
+Reported-by: Muhamad Arga Reksapati
+
+Verify with libtest 2504: a custom Host *disabled* on reused handle
+
+Closes #21312
+
+CVE: CVE-2026-6276
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3a19987a87f393d9394fe5acc7643f6c263c92db]
+
+Backport changes: Adapted for curl 8.7.1:
+- Use Curl_safefree (renamed to curlx_safefree in later versions)
+- Use conn->host.name (changed to data->conn->host.name upstream)
+- Keep existing header parsing structure (refactored upstream)
+- Dropped tests
+
+Signed-off-by: Adarsh Jagadish Kamini <adarsh.jagadish.kamini@est.tech>
+---
+ lib/http.c    | 16 ++++++++++------
+ lib/request.c |  3 +++
+ lib/request.h |  3 +++
+ lib/url.c     |  4 +++-
+ lib/urldata.h |  1 -
+ 5 files changed, 19 insertions(+), 8 deletions(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index b80bebf..b1f6040 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1747,7 +1747,11 @@ CURLcode Curl_http_host(struct Curl_easy *data, struct connectdata *conn)
+     data->state.first_remote_port = conn->remote_port;
+     data->state.first_remote_protocol = conn->handler->protocol;
+   }
++
+   Curl_safefree(aptr->host);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+ 
+   ptr = Curl_checkheaders(data, STRCONST("Host"));
+   if(ptr && (!data->state.this_is_a_follow ||
+@@ -1782,8 +1786,8 @@ CURLcode Curl_http_host(struct Curl_easy *data, struct connectdata *conn)
+         if(colon)
+           *colon = 0; /* The host must not include an embedded port number */
+       }
+-      Curl_safefree(aptr->cookiehost);
+-      aptr->cookiehost = cookiehost;
++      Curl_safefree(data->req.cookiehost);
++      data->req.cookiehost = cookiehost;
+     }
+ #endif
+ 
+@@ -2302,8 +2306,8 @@ CURLcode Curl_http_cookies(struct Curl_easy *data,
+     int count = 0;
+ 
+     if(data->cookies && data->state.cookie_engine) {
+-      const char *host = data->state.aptr.cookiehost ?
+-        data->state.aptr.cookiehost : conn->host.name;
++      const char *host = data->req.cookiehost ?
++        data->req.cookiehost : conn->host.name;
+       const bool secure_context =
+         conn->handler->protocol&(CURLPROTO_HTTPS|CURLPROTO_WSS) ||
+         strcasecompare("localhost", host) ||
+@@ -3121,8 +3125,8 @@ CURLcode Curl_http_header(struct Curl_easy *data, struct connectdata *conn,
+     if(v) {
+       /* If there is a custom-set Host: name, use it here, or else use
+        * real peer host name. */
+-      const char *host = data->state.aptr.cookiehost?
+-        data->state.aptr.cookiehost:conn->host.name;
++      const char *host = data->req.cookiehost?
++        data->req.cookiehost:conn->host.name;
+       const bool secure_context =
+         conn->handler->protocol&(CURLPROTO_HTTPS|CURLPROTO_WSS) ||
+         strcasecompare("localhost", host) ||
+diff --git a/lib/request.c b/lib/request.c
+index b3b0582..9bede2e 100644
+--- a/lib/request.c
++++ b/lib/request.c
+@@ -111,6 +111,9 @@ void Curl_req_hard_reset(struct SingleRequest *req, struct Curl_easy *data)
+    * free this safely without leaks. */
+   Curl_safefree(req->p.http);
+   Curl_safefree(req->newurl);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(req->cookiehost);
++#endif
+   Curl_client_reset(data);
+   if(req->sendbuf_init)
+     Curl_bufq_reset(&req->sendbuf);
+diff --git a/lib/request.h b/lib/request.h
+index 488fbdd..17d50a3 100644
+--- a/lib/request.h
++++ b/lib/request.h
+@@ -118,6 +118,9 @@ struct SingleRequest {
+ #ifndef CURL_DISABLE_DOH
+   struct dohdata *doh; /* DoH specific data for this request */
+ #endif
++#ifndef CURL_DISABLE_COOKIES
++  char *cookiehost;
++#endif
+ #ifndef CURL_DISABLE_COOKIES
+   unsigned char setcookies;
+ #endif
+diff --git a/lib/url.c b/lib/url.c
+index 76360c8..30f215f 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -313,7 +313,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_safefree(data->state.aptr.rangeline);
+   Curl_safefree(data->state.aptr.ref);
+   Curl_safefree(data->state.aptr.host);
+-  Curl_safefree(data->state.aptr.cookiehost);
++#ifndef CURL_DISABLE_COOKIES
++  Curl_safefree(data->req.cookiehost);
++#endif
+   Curl_safefree(data->state.aptr.rtsp_transport);
+   Curl_safefree(data->state.aptr.user);
+   Curl_safefree(data->state.aptr.passwd);
+diff --git a/lib/urldata.h b/lib/urldata.h
+index b68d023..4fc595a 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1339,7 +1339,6 @@ struct UrlState {
+     char *rangeline;
+     char *ref;
+     char *host;
+-    char *cookiehost;
+     char *rtsp_transport;
+     char *te; /* TE: request header */
+ 
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index d0267317517..276526f01e5 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
     file://CVE-2026-5773.patch \
+    file://CVE-2026-6276.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

