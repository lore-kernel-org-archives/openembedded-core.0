Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E8DACD1294
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:12:13 +0000 (UTC)
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
 by mx.groups.io with SMTP id smtpd.web10.2732.1712113926122121465
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:12:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=XBYj0czD;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.172, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ea9a605ca7so392617b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712113925; x=1712718725; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PKRzdBVs3X8RT5czHnrwHFXxylw07W+lr/AI5Tu73Ao=;
        b=XBYj0czDUlBbRrXZhyvMC+KSu7WGDnkq8xEY7qjFxJtitHRSZtfLO5oBBqwZDYPOs/
         NEcuMrpXGh7XP/5g4KHTTn4Rls012Y32fwj3nNBj11hafo3+fv9kOlNO1OUdhm33FTeP
         r3hGxR73Szs9MJCweQkxeRmzVg8VATVQ+f//8q7ScaJY449G/GK0oUyxwB4COrBtf0yl
         QQ+F88ikl3ytg3CPNYphHrDbIFfN8EPjbtO7xBatI+Cdn7/xgWBm0q0bD5l3kMhmCQch
         9dk/MwHrrMS0JZjSdGn7O+wyjdOMGUNwRWm8YtkmO0CZn17jpAoYlTTLbPl3ulIszyNa
         cnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712113925; x=1712718725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PKRzdBVs3X8RT5czHnrwHFXxylw07W+lr/AI5Tu73Ao=;
        b=HbD5qPma6YFv9ayCzr4x3L+75mWRO653lLu+Bl5DfvcZgmnjtRRGveEt7tO4qv5tXQ
         o2VNs/VsZkJ4mtLtygWzXXMW639RzmCMUQoTIJtioii/rfxx8lVoHeaTo/nwK1TLCy2b
         ew3kUMc0EhKBSYB5HgOESlDh+DDNSzGa5PGE/w5V75L21DEomxHN8TAUDRRS8BjhKNre
         iabBRVcziLqwZ5BYLw/n+OgiJ02QsZtdvMr/EGoa/LmRuskDzqviyk+Wk1jnqpvxoZWr
         n1Tdn+45oZlf7K8Gb1DhC9yGhlMJI8yUcgcovwpPbXFfs1bfextQIoT8Jeck6swhoH9p
         K3Nw==
X-Gm-Message-State: AOJu0Yyx66Cpy3joAydsPMpcOwvfQi0YVSD6JlrDeKoGIoUqCEQUtA2E
	hXI7s58EpTkH8QY6mcp6fjlKE3BYnZpsM8wPWzjux/CETPjSnK2K8QZk49GuNjtOvvT5IarQLUW
	nUKk=
X-Google-Smtp-Source: AGHT+IH9GV2j4kpuFJ+GbHhb+VAVCUEQEGLX1Q4Y3Tcqw4iWZt2zoccAWXxBLz9UlkmNefipkr/Yeg==
X-Received: by 2002:a05:6a20:c91b:b0:1a5:6b4e:37fb with SMTP id gx27-20020a056a20c91b00b001a56b4e37fbmr1369734pzb.9.1712113925408;
        Tue, 02 Apr 2024 20:12:05 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id x15-20020a63170f000000b005dc87f5dfcfsm10371743pgl.78.2024.04.02.20.12.04
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:12:05 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 4/7] curl: backport Debian patch for CVE-2024-2398
Date: Tue,  2 Apr 2024 17:11:49 -1000
Message-Id: <ce65f86c55ecf2c0e52564488e0237ba24429c45.1712113689.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712113689.git.steve@sakoman.com>
References: <cover.1712113689.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:12:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197889

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-2398

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/?h=ubuntu%2Ffocal-security
Upstream commit
https://github.com/curl/curl/commit/deca8039991886a559b67bcd6701db800a5cf764]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2024-2398.patch             | 88 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-2398.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-2398.patch b/meta/recipes-support/curl/curl/CVE-2024-2398.patch
new file mode 100644
index 0000000000..a3840336f0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-2398.patch
@@ -0,0 +1,88 @@
+Backport of:
+
+From deca8039991886a559b67bcd6701db800a5cf764 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 6 Mar 2024 09:36:08 +0100
+Subject: [PATCH] http2: push headers better cleanup
+
+- provide common cleanup method for push headers
+
+Closes #13054
+
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2024-2398.patch?h=ubuntu/focal-security
+Upstream commit https://github.com/curl/curl/commit/deca8039991886a559b67bcd6701db800a5cf764]
+CVE: CVE-2024-2398
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/http2.c | 34 +++++++++++++++-------------------
+ 1 file changed, 15 insertions(+), 19 deletions(-)
+
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -515,6 +515,15 @@ static struct Curl_easy *duphandle(struc
+ }
+ 
+ 
++static void free_push_headers(struct HTTP *stream)
++{
++  size_t i;
++  for(i = 0; i<stream->push_headers_used; i++)
++    free(stream->push_headers[i]);
++  Curl_safefree(stream->push_headers);
++  stream->push_headers_used = 0;
++}
++
+ static int push_promise(struct Curl_easy *data,
+                         struct connectdata *conn,
+                         const nghttp2_push_promise *frame)
+@@ -528,7 +537,6 @@ static int push_promise(struct Curl_easy
+     struct curl_pushheaders heads;
+     CURLMcode rc;
+     struct http_conn *httpc;
+-    size_t i;
+     /* clone the parent */
+     struct Curl_easy *newhandle = duphandle(data);
+     if(!newhandle) {
+@@ -557,11 +565,7 @@ static int push_promise(struct Curl_easy
+     Curl_set_in_callback(data, false);
+ 
+     /* free the headers again */
+-    for(i = 0; i<stream->push_headers_used; i++)
+-      free(stream->push_headers[i]);
+-    free(stream->push_headers);
+-    stream->push_headers = NULL;
+-    stream->push_headers_used = 0;
++    free_push_headers(stream);
+ 
+     if(rv) {
+       /* denied, kill off the new handle again */
+@@ -995,10 +999,10 @@ static int on_header(nghttp2_session *se
+             stream->push_headers_alloc) {
+       char **headp;
+       stream->push_headers_alloc *= 2;
+-      headp = Curl_saferealloc(stream->push_headers,
+-                               stream->push_headers_alloc * sizeof(char *));
++      headp = realloc(stream->push_headers,
++                      stream->push_headers_alloc * sizeof(char *));
+       if(!headp) {
+-        stream->push_headers = NULL;
++        free_push_headers(stream);
+         return NGHTTP2_ERR_TEMPORAL_CALLBACK_FAILURE;
+       }
+       stream->push_headers = headp;
+@@ -1179,14 +1183,7 @@ void Curl_http2_done(struct Curl_easy *d
+   if(http->header_recvbuf) {
+     Curl_add_buffer_free(&http->header_recvbuf);
+     Curl_add_buffer_free(&http->trailer_recvbuf);
+-    if(http->push_headers) {
+-      /* if they weren't used and then freed before */
+-      for(; http->push_headers_used > 0; --http->push_headers_used) {
+-        free(http->push_headers[http->push_headers_used - 1]);
+-      }
+-      free(http->push_headers);
+-      http->push_headers = NULL;
+-    }
++    free_push_headers(http);
+   }
+ 
+   if(!httpc->h2) /* not HTTP/2 ? */
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 980b4224a8..2f351d585a 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -58,6 +58,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322.patch \
            file://CVE-2023-46218.patch \
+           file://CVE-2024-2398.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.34.1


