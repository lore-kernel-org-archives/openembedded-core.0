Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAC55C6FD1F
	for <webhook@archiver.kernel.org>; Wed,  3 Apr 2024 03:47:23 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.3080.1712116035923211560
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Apr 2024 20:47:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=wC6l6bLe;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.175, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-1e28be94d32so4782685ad.0
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Apr 2024 20:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1712116035; x=1712720835; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gu+lrcjhJOsV7w38XKhqvtdUtzYjui1rQ3W75hcG/rs=;
        b=wC6l6bLe0aVMOQfc/SeZyGF+LUPmpfv2Nhe6pWYtRetKtsCPwbi0AMcG68nOQqLlrw
         iBWmpWHpEhIsdCdGXvzyyE1EBMY6Rd0o+Zi3s8+I+ckZpnmxNoWFZyv64H5jFNzmx2/m
         nHMaCcouC9A/CiCX6cynzLSq9y72PgFYTvQYRrnZd42Z93kWUNSSKFm7zTeMFY1wTRvK
         UMzQb4V9Zi7aRPGnoNzwWccXqH380/sR/cjUvKj025q5nJy2yW77Y6GliWf6aBzjnFln
         Gn5o7sN942eLMDET0962fRNM42vffZgch/QigypFnZAGF/8hw1yhL7bfcmfqYkSGRirD
         F1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712116035; x=1712720835;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gu+lrcjhJOsV7w38XKhqvtdUtzYjui1rQ3W75hcG/rs=;
        b=hLvnxsKrrXngpoy1AJbjHM2/rviGwyFiZPCCYgHR3Lk+cmg/HndWmJqmvtsw/gqm1Q
         PS4ejRBoby9dfM+GKecmapnAr1QefWw1DosyNuKdruOkC/ebdDGNn+wsYSNY/wUjAXHt
         rZHYJY6OyK+EXbKFL98L0duh0SOSUD/VLuOdK6ZWOgc/RK6z9f/B6PkEcbGWUEy6yA5U
         A7O6XdSBRNWfz/rHPieTvIXwj91L14TigPkJJF+4/a74Gp9GtYK5HoWO5c1GEkpQl2Yk
         QdI8Fx2ZFFwNpAvvEg8wzEV/2bczHYXp7affhHLsa5vV8h2kRpa9kXMV1JQAynwpxis+
         mGIg==
X-Gm-Message-State: AOJu0YxPbNBS5kE8fwGM0ZYSJdc5RfjLoIgyzVh+EKlqP76hHGgnyCQ5
	U8ZVudLPqm1WSzHkPOKGCFwnGUzV7goKML5UOYD+R65evZTTMtFpRpstxSLDI+mqQ/7eTBQeuaL
	tD2E=
X-Google-Smtp-Source: AGHT+IENpwg3X49bmzxL/aamm/w13zUAwC1F50gsByXaa0obkCQsIf1rIZJERFI943m8/88Twljstw==
X-Received: by 2002:a17:902:e74e:b0:1e2:86f5:9d00 with SMTP id p14-20020a170902e74e00b001e286f59d00mr2889250plf.25.1712116035266;
        Tue, 02 Apr 2024 20:47:15 -0700 (PDT)
Received: from xps13.. (067-053-223-136.biz.spectrum.com. [67.53.223.136])
        by smtp.gmail.com with ESMTPSA id m11-20020a170902c44b00b001e278fb17c5sm2326128plm.150.2024.04.02.20.47.14
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 20:47:15 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 4/9] curl: backport Debian patch for CVE-2024-2398
Date: Tue,  2 Apr 2024 17:46:57 -1000
Message-Id: <67026cbb62e166b6a9f5509708531ebe0f36c36d.1712115855.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1712115855.git.steve@sakoman.com>
References: <cover.1712115855.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Apr 2024 03:47:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/197897

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2024-2398

Upstream-Status: Backport [import from ubuntu https://git.launchpad.net/ubuntu/+source/curl/tree/debian/patches/?h=ubuntu%2Fjammy-security
Upstream commit https://github.com/curl/curl/commit/deca8039991886a559b67bcd6701db800a5cf764]

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


