Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4752BCD1283
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 07:28:20 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
 by mx.groups.io with SMTP id smtpd.web10.32573.1711956499346579430
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 00:28:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RLeqjJJc;
 spf=pass (domain: mvista.com, ip: 209.85.210.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-6eafbcc5392so1029087b3a.1
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 00:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711956498; x=1712561298; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i9FRr/PmGqCzczpZC2NH6ozl+5b3u+j60a/1A61YG3Q=;
        b=RLeqjJJcrZ3Y9dHVxblY3F/4QXt5kc2wWW4wMqbPVbqDP1bo4AXC0sVq2zfm1BQJtJ
         pEgI9Z8PZMBbBBU88p6t5UYgri+NUQA91cY25gajwBW5jZ+DYKdNcojZFnRYoKHGHWf7
         Fk2PZkHs3csUn8mMVjr9H2MWkAb4mwtfGUPiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711956498; x=1712561298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i9FRr/PmGqCzczpZC2NH6ozl+5b3u+j60a/1A61YG3Q=;
        b=m5sAZY9iMZU+IoDn7M6+nCnT3wHs53ItAeN7QaNj5qCO9FXMvo7s/fgV3LiINQ0Rp4
         HD0JDBEqItY/beg4r6hHFUYnNUFeQ75lHFhWCm9TKyyaejwfg8geP9wKJeSqwRV9XzYG
         biv8R3Jbp6Xmzy9haZIxb2RKWRW+FbZUXDPVZg0MQz9fB4a7QxdaUUSeQesi3/t/yYM6
         9KYenk17YMkyB7rRcRh7+p2qRsENNseljtFBDxX1Ddl3ZofkK8ZXWE4hEy8u2Ky65nGo
         6JRalwT1m4ksT43UYsCaTMMT9NygMre3kp94/0gT/+ujwX7ABqrTb74SWBYm6xPUkQvn
         EiRQ==
X-Gm-Message-State: AOJu0YyC0egYka9moUn9qH20HCDi2DVzTys5YiyD1C1PMBsMRX1VCvVx
	l2hymb1+sxo0hzU5JPYmq5xiMqO+fqrwmVrzKg9MM5FyZNq41O14NnCjfKNHvhLa5vf+4LWHoWE
	O
X-Google-Smtp-Source: AGHT+IH1psVB85ROajYY5v3OiL3vQO07Ls0ayiWOaP8rq86zQGsoa2CmMtsKwJgpe/zNEbJrL9SV6g==
X-Received: by 2002:a05:6a20:258a:b0:1a3:5f13:e43d with SMTP id k10-20020a056a20258a00b001a35f13e43dmr8155483pzd.25.1711956497784;
        Mon, 01 Apr 2024 00:28:17 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:b5b7:7a4c:9b25:3ce3:1b08])
        by smtp.gmail.com with ESMTPSA id s23-20020a170902b19700b001e0b5ef2bcbsm8154253plr.128.2024.04.01.00.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 00:28:17 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][dunfell][PATCH] curl: backport Debian patch for CVE-2024-2398
Date: Mon,  1 Apr 2024 12:58:01 +0530
Message-Id: <20240401072801.67459-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 07:28:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197674

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-2398

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/?h=ubuntu%2Ffocal-security
Upstream commit
https://github.com/curl/curl/commit/deca8039991886a559b67bcd6701db800a5cf764]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
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
2.25.1


