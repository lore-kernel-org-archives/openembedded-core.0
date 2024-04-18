Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C405DC4345F
	for <webhook@archiver.kernel.org>; Thu, 18 Apr 2024 10:47:12 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.9837.1713437228747109986
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Apr 2024 03:47:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=AkVPTant;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.43, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-418e06c0ef4so5790945e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 03:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1713437226; x=1714042026; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=onykI0f7foNmqmeWYRi5MNv40snNQUrVfJBOKXwaqzw=;
        b=AkVPTantoxUsnTFyE/iL6iJL8nkisZhHFXuMcrkWUcoJC9cymFzz2A6Te6jTH7vBdE
         uEKSiBp89ZzKVVMHT79qo/EaAopqUFq0OBIzr5mw7+pdoW1GMr31c+SJOY/7yH7mF+eQ
         52s9xAO7/QOZPOczNcnOASeh4C33bQBwFBEe8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713437226; x=1714042026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onykI0f7foNmqmeWYRi5MNv40snNQUrVfJBOKXwaqzw=;
        b=AyGYMY5pQhGabrfj6/bOJI0l5kcqtTOz/oapD5r6VnKXlLpGxvSVVSJ+cYhdignKkY
         0MvCgTHx6m77mTwupMZcIrgHyTUmrPlnENW3jJyzfo0iXFkAAsBZY8GrSv4U8i2yxBhD
         fYeYwSIyXQNf5jRtngmCZaJ7w2Y8NBRkXanCDWJRREHLaIryR0MFP5w3kuo+r1X1esH+
         AiRwfb4zAVCMI3jfWdt+CZXwx+xO/wR2f4aExBTP9irp79peI+UJ4+H4soc8WAkWtDkU
         nUfx145vCxuojGxMq5Pf75t4ibS+lNyRJv0qaT+Q5SWsJ5YYQHzXQCllMFTmJxk3+CEx
         jUTw==
X-Gm-Message-State: AOJu0YzP6z4Ci5tLt4KkwrOAnLMpnYEM5ux+VHzoGI+dleqNonesBjDV
	K80E0Fym5nwVFagQJF40UDbj5UNR0lAFonjctbIykaQy2k/9i2lUwKATTfcxkhBm4CebzszYcEa
	Q2OQ=
X-Google-Smtp-Source: AGHT+IGn8cfG/YO/SKX4p5GYzYEGsYzUQHgR7TPwd3T02tRFNC/VWBeLxfeUY7KlBmg13Joctgflaw==
X-Received: by 2002:a05:600c:3147:b0:418:f308:7fa2 with SMTP id h7-20020a05600c314700b00418f3087fa2mr412421wmo.14.1713437226287;
        Thu, 18 Apr 2024 03:47:06 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:3bc0:7b8b:7b80:40cd])
        by smtp.gmail.com with ESMTPSA id t13-20020a05600c198d00b00417da22df18sm6089236wmq.9.2024.04.18.03.47.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Apr 2024 03:47:05 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] curl: Backport patch to fix buildtools issues
Date: Thu, 18 Apr 2024 11:47:05 +0100
Message-Id: <20240418104705.3201312-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Apr 2024 10:47:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198505

bitbake-selftest was failing on a github url on hosts using buildtools.
The issue was tracked down to the curl upgrade 8.6.0 -> 8.7.1. Whilst there
is a fix in upstream git to workaround the issue in this version, backport
the fix from curl upstream to ensure there are no other related issues to
the bug.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...41aadf4adf4f6aeb3f4c0ab489bb89610c36.patch | 64 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |  1 +
 2 files changed, 65 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch

diff --git a/meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch b/meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch
new file mode 100644
index 00000000000..98f7db93e87
--- /dev/null
+++ b/meta/recipes-support/curl/curl/721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch
@@ -0,0 +1,64 @@
+From 721941aadf4adf4f6aeb3f4c0ab489bb89610c36 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Mon, 1 Apr 2024 15:41:18 +0200
+Subject: [PATCH] http: with chunked POST forced, disable length check on read
+ callback
+
+- when an application forces HTTP/1.1 chunked transfer encoding
+  by setting the corresponding header and instructs curl to use
+  the CURLOPT_READFUNCTION, disregard any POST length information.
+- this establishes backward compatibility with previous curl versions
+
+Applications are encouraged to not force "chunked", but rather
+set length information for a POST. By setting -1, curl will
+auto-select chunked on HTTP/1.1 and work properly on other HTTP
+versions.
+
+Reported-by: Jeff King
+Fixes #13229
+Closes #13257
+Upstream-Status: Backport
+---
+ lib/http.c | 22 ++++++++++++++++++++--
+ 1 file changed, 20 insertions(+), 2 deletions(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index 92c04e69cd8373..a764d3c4403c39 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -2046,8 +2046,19 @@ static CURLcode set_reader(struct Curl_easy *data, Curl_HttpReq httpreq)
+       else
+         result = Curl_creader_set_null(data);
+     }
+-    else { /* we read the bytes from the callback */
+-      result = Curl_creader_set_fread(data, postsize);
++    else {
++      /* we read the bytes from the callback. In case "chunked" encoding
++       * is forced by the application, we disregard `postsize`. This is
++       * a backward compatibility decision to earlier versions where
++       * chunking disregarded this. See issue #13229. */
++      bool chunked = FALSE;
++      char *ptr = Curl_checkheaders(data, STRCONST("Transfer-Encoding"));
++      if(ptr) {
++        /* Some kind of TE is requested, check if 'chunked' is chosen */
++        chunked = Curl_compareheader(ptr, STRCONST("Transfer-Encoding:"),
++                                     STRCONST("chunked"));
++      }
++      result = Curl_creader_set_fread(data, chunked? -1 : postsize);
+     }
+     return result;
+ 
+@@ -2115,6 +2126,13 @@ CURLcode Curl_http_req_set_reader(struct Curl_easy *data,
+     data->req.upload_chunky =
+       Curl_compareheader(ptr,
+                          STRCONST("Transfer-Encoding:"), STRCONST("chunked"));
++    if(data->req.upload_chunky &&
++       Curl_use_http_1_1plus(data, data->conn) &&
++       (data->conn->httpversion >= 20)) {
++       infof(data, "suppressing chunked transfer encoding on connection "
++             "using HTTP version 2 or higher");
++       data->req.upload_chunky = FALSE;
++    }
+   }
+   else {
+     curl_off_t req_clen = Curl_creader_total_length(data);
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index c6654bbad6d..c74416d7e9d 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -11,6 +11,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=eed2e5088e1ac619c9a1c747da291d75"
 
 SRC_URI = " \
     https://curl.se/download/${BP}.tar.xz \
+    file://721941aadf4adf4f6aeb3f4c0ab489bb89610c36.patch \
     file://run-ptest \
     file://disable-tests \
     file://no-test-timeout.patch \
-- 
2.40.1


