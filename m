Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9D74C41535
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 13:47:06 +0000 (UTC)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
 by mx.groups.io with SMTP id smtpd.web11.13926.1699451220233449833
 for <openembedded-core@lists.openembedded.org>;
 Wed, 08 Nov 2023 05:47:00 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=0bqNzBTF;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.170, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1cc3216b2a1so56111825ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 05:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1699451219; x=1700056019; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Yy4U95czz44BluqTjiYvpNRegsPD3fHjoKD0ImcO+Mc=;
        b=0bqNzBTFkpzn/44N/XEnK9seTjS1bVAs34czVn4P9YmkkP7JMCeh5YVuFwgd9fDkG3
         ZvD9KmgTD/C8Y8nNp3KdOc+DAGv3FZVq3yl1dImdGmaVPoXGuejnl0GBgDtnTPa6ZraM
         IL0rLTTdO367CAOv7VY2dw4m+GD0x6BQ54W9QbVQFvgS1eXMJ3r6Uu/4QISw9CcOLyKK
         64Di0/oMCK/o0uln9Ua5h8fXUQgmHQZw+twC+ohWRLWvfO70jXytgSJEA209JCFJbpBD
         WDNcqOGRsp1/icn6QEA2WshRsFrRuOKYVIIIUk5Yt6GwVLjhF47nl+zPH8ZlajcwvStS
         E/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699451219; x=1700056019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yy4U95czz44BluqTjiYvpNRegsPD3fHjoKD0ImcO+Mc=;
        b=wotoTW7dh3YVZmlQnUiY0Y/Ru0RISuHttbtpNO/+n/Lu1lR8QpOOY6E1zqyeh3g5mb
         rC+w9XWuBPhNjYTqPS7QHX0CkC7pOqSGVf+EIzs1f5wjRP5qON8FuGmlrrD4nTQU4Qy0
         Ko65REdkQTDyB1Zc2VgDyFzINgeyNq99y51iMAYdfQlMOt/0ip3Vbjco9UVVJBtW+pkC
         c+9wNmTG0lwP1aly6BmtC4osLxnzuHFohPY6475oAz0XpSqe3J1kRqBoK113wYOADk1h
         5NcZpGF9pg0XBZn17/n9YT1i5/zcn7c+NNkFRwYx9XvSPfx2CONWqGARhFlLf9fU1yCg
         rldg==
X-Gm-Message-State: AOJu0YzGZLBdZC1pRPSVcM7GeV1gTT6bmeDjJwv8eJBlP0KnO4wZDlym
	MtkJ4kwThgKBMGNZEDNVa8x38r2bCCs2PWJq+rLzoA==
X-Google-Smtp-Source: AGHT+IHCXGo0aMKEanvEgNYn/YtPKEnaC37BdtfwLS+bdXYlgjqvTbYmydY97bCXdXmUHPFrt7CYMg==
X-Received: by 2002:a17:902:7c0d:b0:1cc:1490:e7bf with SMTP id x13-20020a1709027c0d00b001cc1490e7bfmr1689644pll.30.1699451218772;
        Wed, 08 Nov 2023 05:46:58 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id w12-20020a170902d3cc00b001b7cbc5871csm1781980plb.53.2023.11.08.05.46.57
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 05:46:58 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][mickledore 01/10] curl: Fix CVE-2023-38039
Date: Wed,  8 Nov 2023 03:46:42 -1000
Message-Id: <77a7921660e8da1cb618ba3634835790ae8adfdd.1699451066.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699451066.git.steve@sakoman.com>
References: <cover.1699451066.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 08 Nov 2023 13:47:06 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190327

From: Mingli Yu <mingli.yu@windriver.com>

Backport patch [1] to fix CVE-2023-38039 and reference [2] and [3] to fix
the build error.

[1] https://github.com/curl/curl/commit/3ee79c1674fd6f9
[2] https://github.com/curl/curl/commit/2cb0d346aaa
[3] https://github.com/curl/curl/commit/83319e027179

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-38039.patch            | 209 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 2 files changed, 210 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38039.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38039.patch b/meta/recipes-support/curl/curl/CVE-2023-38039.patch
new file mode 100644
index 0000000000..ef8b600413
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38039.patch
@@ -0,0 +1,209 @@
+From daa73dbfa9d4dbaf5415cc14dcbf31e45ed77468 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 2 Nov 2023 15:57:39 +0800
+Subject: [PATCH] http: return error when receiving too large header set
+
+To avoid abuse. The limit is set to 300 KB for the accumulated size of
+all received HTTP headers for a single response. Incomplete research
+suggests that Chrome uses a 256-300 KB limit, while Firefox allows up to
+1MB.
+
+Closes #11582
+
+CVE: CVE-2023-38039
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/3ee79c1674fd6f9]
+
+Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
+---
+ lib/c-hyper.c  | 12 +++++++-----
+ lib/http.c     | 39 +++++++++++++++++++++++++++++++++++----
+ lib/http.h     |  9 +++++++++
+ lib/pingpong.c |  2 +-
+ lib/urldata.h  | 18 ++++++++++--------
+ 5 files changed, 62 insertions(+), 18 deletions(-)
+
+diff --git a/lib/c-hyper.c b/lib/c-hyper.c
+index 9c7632d..28f64ef 100644
+--- a/lib/c-hyper.c
++++ b/lib/c-hyper.c
+@@ -174,8 +174,11 @@ static int hyper_each_header(void *userdata,
+     }
+   }
+ 
+-  data->info.header_size += (curl_off_t)len;
+-  data->req.headerbytecount += (curl_off_t)len;
++  result = Curl_bump_headersize(data, len, FALSE);
++  if(result) {
++    data->state.hresult = result;
++    return HYPER_ITER_BREAK;
++  }
+   return HYPER_ITER_CONTINUE;
+ }
+ 
+@@ -305,9 +308,8 @@ static CURLcode status_line(struct Curl_easy *data,
+     if(result)
+       return result;
+   }
+-  data->info.header_size += (curl_off_t)len;
+-  data->req.headerbytecount += (curl_off_t)len;
+-  return CURLE_OK;
++  result = Curl_bump_headersize(data, len, FALSE);
++  return result;
+ }
+ 
+ /*
+diff --git a/lib/http.c b/lib/http.c
+index 400d2b0..d3efd60 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -3760,6 +3760,34 @@ static CURLcode verify_header(struct Curl_easy *data)
+   return CURLE_OK;
+ }
+ 
++CURLcode Curl_bump_headersize(struct Curl_easy *data,
++                              size_t delta,
++                              bool connect_only)
++{
++  size_t bad = 0;
++  unsigned int max = MAX_HTTP_RESP_HEADER_SIZE;
++  if(delta < MAX_HTTP_RESP_HEADER_SIZE) {
++    data->info.header_size += (unsigned int)delta;
++    data->req.allheadercount += (unsigned int)delta;
++    if(!connect_only)
++      data->req.headerbytecount += (unsigned int)delta;
++    if(data->req.allheadercount > max)
++      bad = data->req.allheadercount;
++    else if(data->info.header_size > (max * 20)) {
++      bad = data->info.header_size;
++      max *= 20;
++    }
++  }
++  else
++    bad = data->req.allheadercount + delta;
++  if(bad) {
++    failf(data, "Too large response headers: %zu > %u", bad, max);
++    return CURLE_RECV_ERROR;
++  }
++  return CURLE_OK;
++}
++
++
+ /*
+  * Read any HTTP header lines from the server and pass them to the client app.
+  */
+@@ -4007,8 +4035,9 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
+       if(result)
+         return result;
+ 
+-      data->info.header_size += (long)headerlen;
+-      data->req.headerbytecount += (long)headerlen;
++      result = Curl_bump_headersize(data, headerlen, FALSE);
++      if(result)
++        return result;
+ 
+       /*
+        * When all the headers have been parsed, see if we should give
+@@ -4330,8 +4359,10 @@ CURLcode Curl_http_readwrite_headers(struct Curl_easy *data,
+     if(result)
+       return result;
+ 
+-    data->info.header_size += Curl_dyn_len(&data->state.headerb);
+-    data->req.headerbytecount += Curl_dyn_len(&data->state.headerb);
++    result = Curl_bump_headersize(data, Curl_dyn_len(&data->state.headerb),
++                                  FALSE);
++    if(result)
++      return result;
+ 
+     Curl_dyn_reset(&data->state.headerb);
+   }
+diff --git a/lib/http.h b/lib/http.h
+index 444abc0..ea3b37e 100644
+--- a/lib/http.h
++++ b/lib/http.h
+@@ -60,6 +60,10 @@ extern const struct Curl_handler Curl_handler_wss;
+ #endif
+ #endif /* websockets */
+ 
++CURLcode Curl_bump_headersize(struct Curl_easy *data,
++                              size_t delta,
++                              bool connect_only);
++
+ 
+ /* Header specific functions */
+ bool Curl_compareheader(const char *headerline,  /* line to check */
+@@ -176,6 +180,11 @@ CURLcode Curl_http_auth_act(struct Curl_easy *data);
+ #define EXPECT_100_THRESHOLD (1024*1024)
+ #endif
+ 
++/* MAX_HTTP_RESP_HEADER_SIZE is the maximum size of all response headers
++   combined that libcurl allows for a single HTTP response, any HTTP
++   version. This count includes CONNECT response headers. */
++#define MAX_HTTP_RESP_HEADER_SIZE (300*1024)
++
+ #endif /* CURL_DISABLE_HTTP */
+ 
+ #ifdef USE_NGHTTP3
+diff --git a/lib/pingpong.c b/lib/pingpong.c
+index 2f4aa1c..e53a506 100644
+--- a/lib/pingpong.c
++++ b/lib/pingpong.c
+@@ -341,7 +341,7 @@ CURLcode Curl_pp_readresp(struct Curl_easy *data,
+       ssize_t clipamount = 0;
+       bool restart = FALSE;
+ 
+-      data->req.headerbytecount += (long)gotbytes;
++      data->req.headerbytecount += (unsigned int)gotbytes;
+ 
+       pp->nread_resp += gotbytes;
+       for(i = 0; i < gotbytes; ptr++, i++) {
+diff --git a/lib/urldata.h b/lib/urldata.h
+index f3e782a..748660f 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -619,17 +619,19 @@ struct SingleRequest {
+   curl_off_t bytecount;         /* total number of bytes read */
+   curl_off_t writebytecount;    /* number of bytes written */
+ 
+-  curl_off_t headerbytecount;   /* only count received headers */
+-  curl_off_t deductheadercount; /* this amount of bytes doesn't count when we
+-                                   check if anything has been transferred at
+-                                   the end of a connection. We use this
+-                                   counter to make only a 100 reply (without a
+-                                   following second response code) result in a
+-                                   CURLE_GOT_NOTHING error code */
+ 
+   curl_off_t pendingheader;      /* this many bytes left to send is actually
+                                     header and not body */
+   struct curltime start;         /* transfer started at this time */
++  unsigned int headerbytecount;  /* received server headers (not CONNECT
++                                    headers) */
++  unsigned int allheadercount;   /* all received headers (server + CONNECT) */
++  unsigned int deductheadercount; /* this amount of bytes doesn't count when
++                                     we check if anything has been transferred
++                                     at the end of a connection. We use this
++                                     counter to make only a 100 reply (without
++                                     a following second response code) result
++                                     in a CURLE_GOT_NOTHING error code */
+   enum {
+     HEADER_NORMAL,              /* no bad header at all */
+     HEADER_PARTHEADER,          /* part of the chunk is a bad header, the rest
+@@ -1076,7 +1078,6 @@ struct PureInfo {
+   int httpversion; /* the http version number X.Y = X*10+Y */
+   time_t filetime; /* If requested, this is might get set. Set to -1 if the
+                       time was unretrievable. */
+-  curl_off_t header_size;  /* size of read header(s) in bytes */
+   curl_off_t request_size; /* the amount of bytes sent in the request(s) */
+   unsigned long proxyauthavail; /* what proxy auth types were announced */
+   unsigned long httpauthavail;  /* what host auth types were announced */
+@@ -1084,6 +1085,7 @@ struct PureInfo {
+   char *contenttype; /* the content type of the object */
+   char *wouldredirect; /* URL this would've been redirected to if asked to */
+   curl_off_t retry_after; /* info from Retry-After: header */
++  unsigned int header_size;  /* size of read header(s) in bytes */
+ 
+   /* PureInfo members 'conn_primary_ip', 'conn_primary_port', 'conn_local_ip'
+      and, 'conn_local_port' are copied over from the connectdata struct in
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index 375b4d2f93..04da092ee9 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -21,6 +21,7 @@ SRC_URI = " \
     file://CVE-2023-28320-fol1.patch \
     file://CVE-2023-38545.patch \
     file://CVE-2023-38546.patch \
+    file://CVE-2023-38039.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.34.1


