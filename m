Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E0CFCD1292
	for <webhook@archiver.kernel.org>; Mon,  1 Apr 2024 11:34:21 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web11.35182.1711971260582109151
 for <openembedded-core@lists.openembedded.org>;
 Mon, 01 Apr 2024 04:34:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=J+wB43C5;
 spf=pass (domain: mvista.com, ip: 209.85.161.53, mailfrom: vanusuri@mvista.com)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-5a7bbafb946so279064eaf.2
        for <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 04:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1711971259; x=1712576059; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FMb24XfZZQseA6ktcRyMuS1COLF4WXOEMRR00du30n0=;
        b=J+wB43C50OxflHK5Joh3STP2Ihw7X25rTWL9E6O6pMGxNKPmwzwb1vKubSkeCkfGni
         el5g3Vm0qDzVVo7e0cfc4OgNhToErS4VFdk3B/UQ4eJOE9AyPUKqAmayypJemwiKj/6A
         0qTKopKJorJTK5x7/+LwwDgR4PTjcZhCS2dsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711971259; x=1712576059;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FMb24XfZZQseA6ktcRyMuS1COLF4WXOEMRR00du30n0=;
        b=S+LeXTp0I/A2QGERdMnIvwNqsp3NADmFRYoadeam+AeYTmGB3v/Cl8DDGaRoueDnFC
         KSeyTqvTOZSJm3u/iaKiBpAB+IeTgXs+hza1JH96zlpVS+YeR6dyu2Vgn7sA1KCrUHOu
         +Ewhmi5fCYMAlRBiJI99GmW2L4NAN44HRtiuWVSscjnJkgY5DpPMSe+MVhBRPHtlvDNc
         VWOgjOK8nglDBfbFIzxKvq0rQ6DTy7C/bfRwgun+5fr430OOiuzVP+OnvQ3Vsulqu6AM
         VU5sPInAit/nRhBRYuyx2uHDakbe3mnVd+rhvSkFdnp4wv9YMoGO8UwBAiDtjpg0jtrw
         /Mlg==
X-Gm-Message-State: AOJu0YxMzdc4YdWl/VrlDvFECpSp1yEgkUOIslLwAKrt5h8GOwlQ61CX
	Vl75HSFs3IUifYEukET6meEzOVUGq2FscbFisxUx7YUO6Qha/hkM1DjIUc0QNnu86ReYtn64FyP
	c
X-Google-Smtp-Source: AGHT+IGAmE/HsP2EteQ2hdOEkveQ/ws6QgX9GuwnNTVw9iVDHI/JUcOEjZ16V0ueUV6yjg5RXTOFaQ==
X-Received: by 2002:a05:6358:579e:b0:183:66a7:b23e with SMTP id m30-20020a056358579e00b0018366a7b23emr6207655rwf.28.1711971259063;
        Mon, 01 Apr 2024 04:34:19 -0700 (PDT)
Received: from MVIN00020.mvista.com ([2401:4900:1cb1:b5b7:e92f:4f7b:210f:b45])
        by smtp.gmail.com with ESMTPSA id c192-20020a6335c9000000b005dab535fac2sm7458772pga.90.2024.04.01.04.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Apr 2024 04:34:18 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH] curl: backport Debian patch for CVE-2024-2398
Date: Mon,  1 Apr 2024 17:04:01 +0530
Message-Id: <20240401113401.489921-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 01 Apr 2024 11:34:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197684

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-2398

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/?h=ubuntu%2Fjammy-security
Upstream commit https://github.com/curl/curl/commit/deca8039991886a559b67bcd6701db800a5cf764]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2024-2398.patch             | 89 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 90 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2024-2398.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2024-2398.patch b/meta/recipes-support/curl/curl/CVE-2024-2398.patch
new file mode 100644
index 0000000000..ea55117f4d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2024-2398.patch
@@ -0,0 +1,89 @@
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
+Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/CVE-2024-2398.patch?h=ubuntu/jammy-security
+Upstream commit https://github.com/curl/curl/commit/deca8039991886a559b67bcd6701db800a5cf764]
+CVE: CVE-2024-2398
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/http2.c | 34 +++++++++++++++-------------------
+ 1 file changed, 15 insertions(+), 19 deletions(-)
+
+--- a/lib/http2.c
++++ b/lib/http2.c
+@@ -555,6 +555,15 @@ static int set_transfer_url(struct Curl_
+   return 0;
+ }
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
+@@ -568,7 +577,6 @@ static int push_promise(struct Curl_easy
+     struct curl_pushheaders heads;
+     CURLMcode rc;
+     struct http_conn *httpc;
+-    size_t i;
+     /* clone the parent */
+     struct Curl_easy *newhandle = duphandle(data);
+     if(!newhandle) {
+@@ -604,11 +612,7 @@ static int push_promise(struct Curl_easy
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
+       DEBUGASSERT((rv > CURL_PUSH_OK) && (rv <= CURL_PUSH_ERROROUT));
+@@ -1045,10 +1049,10 @@ static int on_header(nghttp2_session *se
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
+@@ -1214,15 +1218,7 @@ void Curl_http2_done(struct Curl_easy *d
+      setup */
+   Curl_dyn_free(&http->header_recvbuf);
+   Curl_dyn_free(&http->trailer_recvbuf);
+-  if(http->push_headers) {
+-    /* if they weren't used and then freed before */
+-    for(; http->push_headers_used > 0; --http->push_headers_used) {
+-      free(http->push_headers[http->push_headers_used - 1]);
+-    }
+-    free(http->push_headers);
+-    http->push_headers = NULL;
+-  }
+-
++  free_push_headers(http);
+   if(!(data->conn->handler->protocol&PROTO_FAMILY_HTTP) ||
+      !httpc->h2) /* not HTTP/2 ? */
+     return;
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 383cf415d9..72d8544e08 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -57,6 +57,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-46219-0001.patch \
            file://CVE-2023-46219-0002.patch \
            file://CVE-2023-46219-0003.patch \
+           file://CVE-2024-2398.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


