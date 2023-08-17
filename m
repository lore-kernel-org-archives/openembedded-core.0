Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B56C2FC15
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 02:50:16 +0000 (UTC)
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
 by mx.groups.io with SMTP id smtpd.web10.178865.1692240609309693702
 for <openembedded-core@lists.openembedded.org>;
 Wed, 16 Aug 2023 19:50:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=YdzREfNp;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.181, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-6887059f121so1740694b3a.3
        for <openembedded-core@lists.openembedded.org>; Wed, 16 Aug 2023 19:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1692240608; x=1692845408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+XcN4KmwBf3b4p2BJ4cRFQ1LFu403AUAPxwX7n+cAc=;
        b=YdzREfNpobGJ9zcvg8PIiJ5SnSJ02Lk/LUxe/3MFaGpykImckDmNl6sJ9OoBDiX8Qj
         Rtn9yE8XaKyIQo9Qlgid6oddVdVn3JeIxRU0wq50IF0iT3sGGovoSh/ifSNo2xAmQrOP
         vLMz3UWOwKkO0HoabC/HC+iRCKDZXXNsPQSGPICpvCqmm2HgnreJIYUxiUBjyIOCCWBF
         VhkjhVFlg0NlbRm+nX/fSuGJEQ1UtOUEbU1BHKp2wVFvm79m5/Bb68qYC405c6cMWuay
         WHZVrZ4Ukp2jZZ18el/SwSZ18dU6xNWQUo/9oBErXOjgG4jEuzOMMM/pdnb+ioiD3Db3
         UNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692240608; x=1692845408;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+XcN4KmwBf3b4p2BJ4cRFQ1LFu403AUAPxwX7n+cAc=;
        b=djMfYGpP+25V5HHelwfER1UhFIxs42trj+gNttMksWDfDWXGsFriJaZ0Xj1CZtmaJB
         NAndL87o5Bo8/EwJgHLUXmw3N5vKDlbxbnY25r8erIo8I4GM6dlYjBbb6SLrVZfIeLic
         yy4U7WyrFBIDxxtRuC/c4zCgwNOWGoGDt6ozTOt+av3y1CN1PBdL6bVjtrD8Ub+rCszW
         QY6X2Lh8mQIH0P5JC9h3jADMPXv8Axehy3lDAfgVqculrUpS+/Fjbexb/bsqbpFZf7CL
         jx4CCo7iOwp2rXF4fN2rCvijEgNO0tlT0YSnXt3JZ7YN6m6L3DWTVRKvXke2Of73yEUU
         wLyg==
X-Gm-Message-State: AOJu0YzeaEiQFC8E/JznQy8vnX75jyjoFoBO20Tkz+ijtLFzRwYAYSxt
	Q83rSmcBKPiS/vA5VLXS7k+DhpWmPWHgb06PEy0=
X-Google-Smtp-Source: AGHT+IHif43H/grsRkN+yBCPOr7F7JZ0RhYKAEFD6YAGZdf/KeBUgWJuHdqJaImqOujZ/QNzGwpC+g==
X-Received: by 2002:a05:6a20:1011:b0:12f:fcbb:3e53 with SMTP id gs17-20020a056a20101100b0012ffcbb3e53mr3535350pzc.28.1692240608306;
        Wed, 16 Aug 2023 19:50:08 -0700 (PDT)
Received: from hexa.lan (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id o5-20020a170902d4c500b001bb9bc8d232sm13827594plg.61.2023.08.16.19.50.07
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 19:50:08 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 07/16] curl: Backport fix CVE-2023-32001
Date: Wed, 16 Aug 2023 16:49:39 -1000
Message-Id: <10df7553d1107438408f680ac28a2daf87d4163e.1692239433.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692239433.git.steve@sakoman.com>
References: <cover.1692239433.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 02:50:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186272

From: Ashish Sharma <asharma@mvista.com>

Signed-off-by: Ashish Sharma <asharma@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../curl/curl/CVE-2023-32001.patch            | 39 +++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-32001.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-32001.patch b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
new file mode 100644
index 0000000000..7ea3073755
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-32001.patch
@@ -0,0 +1,39 @@
+From 0c667188e0c6cda615a036b8a2b4125f2c404dde Mon Sep 17 00:00:00 2001
+From: SaltyMilk <soufiane.elmelcaoui@gmail.com>
+Date: Mon, 10 Jul 2023 21:43:28 +0200
+Subject: [PATCH] fopen: optimize
+
+Closes #11419
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0c667188e0c6cda615a036b8a2b4125f2c404dde]
+CVE: CVE-2023-32001
+Signed-off-by: Ashish Sharma <asharma@mvista.com>
+
+
+ lib/fopen.c | 12 ++++++------
+ 1 file changed, 6 insertions(+), 6 deletions(-)
+
+diff --git a/lib/fopen.c b/lib/fopen.c
+index c9c9e3d6e73a2..b6e3cadddef65 100644
+--- a/lib/fopen.c
++++ b/lib/fopen.c
+@@ -56,13 +56,13 @@ CURLcode Curl_fopen(struct Curl_easy *data, const char *filename,
+   int fd = -1;
+   *tempname = NULL;
+ 
+-  if(stat(filename, &sb) == -1 || !S_ISREG(sb.st_mode)) {
+-    /* a non-regular file, fallback to direct fopen() */
+-    *fh = fopen(filename, FOPEN_WRITETEXT);
+-    if(*fh)
+-      return CURLE_OK;
++  *fh = fopen(filename, FOPEN_WRITETEXT);
++  if(!*fh)
+     goto fail;
+-  }
++  if(fstat(fileno(*fh), &sb) == -1 || !S_ISREG(sb.st_mode))
++    return CURLE_OK;
++  fclose(*fh);
++  *fh = NULL;
+ 
+   result = Curl_rand_hex(data, randsuffix, sizeof(randsuffix));
+   if(result)
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 7f18ef7ee6..af52ecad13 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -51,6 +51,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-28321.patch \
            file://CVE-2023-28322-1.patch \
            file://CVE-2023-28322-2.patch \
+           file://CVE-2023-32001.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.34.1


