Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66884C6FD1C
	for <webhook@archiver.kernel.org>; Fri, 24 Mar 2023 07:56:05 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.95426.1679644558902178260
 for <openembedded-core@lists.openembedded.org>;
 Fri, 24 Mar 2023 00:55:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=IfP3SS5x;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: badganchipv@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id o11so1154865ple.1
        for <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 00:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679644558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtATnrG3YKFY+FA/HWoLL3hemG5WfkIpk1r6+QyaxqY=;
        b=IfP3SS5xZyqvu9i6078jbvNnrDb1SzGInEuetpyp9ISJqX8Ryk100tIWdMA0LeMClL
         Q345z7vNTlycCaLhKs97wcUOlQRzkuS9oI1umCnh4An2DdN1ME73i0QXO68YSfOMA9TN
         818cZTqMK5FkgINaUvwvhm+wqMyAVywWaSQVZ6RBt+UyviGZOy64ceA7x7wxcyi/FqGj
         7Tk6tVSyqV79qZoGNinwaFViVrAs5/6LUWHlatcv4acjw9DeIfisL65B1abKdf5yhLhX
         wshEuAg+kNYul+yoz8SK5N7lenpkj3HeTzsYL8CsDJPkG/kSFL/NowRTD9yg03iYnvju
         ZYxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679644558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qtATnrG3YKFY+FA/HWoLL3hemG5WfkIpk1r6+QyaxqY=;
        b=acuZMlEieAMWywvASc3utG4LAsGbZje6i2bGOGaW33xVhjqpUuKMesyMSgrwy1CLd7
         2GlAATJXTJIi0YU9m6qZwoKJmrszwMju/m5WPq2rmLj9ukArtry2VUag3TTSxk1VZBQ2
         yJrmYA2GFP0/YqIO30/XIXBScxTJfFsDJYGre0A1RgOEwprMyCh4gaSLaiFSvuyFdbnP
         hRXJIscIJNVI0Gq9nXcw7O52IRV2tQc1aLvrNHEI2ISGG7Ul5Azdf6Ll9elCK+MOH42z
         ErxqDsFAu7y5TnG5aVAUfTxqbDWmpsLeB1OPqQyPYaC0XEBvknMDM+9khegxUAEJj+em
         FJBA==
X-Gm-Message-State: AAQBX9cL2moTkNTrawyfQvqrvJX6ZCs9WquLhzZUJbU+4z0ZnyDbmGYX
	EtbvRXqJBGGIr2vDw+aFpevGIYJDIKyA9w==
X-Google-Smtp-Source: AKy350ZmoPDtHMbINNrm95nMapAVctUVTr5Moua1KFGxr7MhEMeJIagX3loitk6ADZcpP2rchV64mg==
X-Received: by 2002:a17:902:ce92:b0:1a2:1042:cadc with SMTP id f18-20020a170902ce9200b001a21042cadcmr2050979plg.18.1679644558229;
        Fri, 24 Mar 2023 00:55:58 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c2d:88f2:caf9:9f6f:1951:761a])
        by smtp.gmail.com with ESMTPSA id p5-20020a1709026b8500b001a1aeb3a7a9sm12276860plk.137.2023.03.24.00.55.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 00:55:58 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [meta][dunfell][PATCH 2/2] curl: Add fix for CVE-2023-23916
Date: Fri, 24 Mar 2023 13:25:26 +0530
Message-Id: <20230324075526.22055-2-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230324075526.22055-1-badganchipv@gmail.com>
References: <20230324075526.22055-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 24 Mar 2023 07:56:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179014

From: Pawan Badganchi <badganchipv@gmail.com>

Add below patch to fix CVE-2023-23916

CVE-2023-23916.patch

Link: https://curl.se/docs/CVE-2023-23916.html

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: Pawan Badganchi <badganchipv@gmail.com>
---
 .../curl/curl/CVE-2023-23916.patch            | 222 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
new file mode 100644
index 0000000000..6a1be173cd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
@@ -0,0 +1,222 @@
+Backport of:
+
+From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Mon, 13 Feb 2023 08:33:09 +0100
+Subject: [PATCH] content_encoding: do not reset stage counter for each header
+
+Test 418 verifies
+
+Closes #10492
+
+CVE: CVE-2023-23916
+Upstream-Status: Backport [https://github.com/curl/curl/commit/119fb187192a9ea13dc.patch]
+Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
+---
+ lib/content_encoding.c  |   7 +-
+ lib/urldata.h           |   1 +
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test387      |   2 +-
+ tests/data/test418      | 152 ++++++++++++++++++++++++++++++++++++++++
+ 5 files changed, 158 insertions(+), 6 deletions(-)
+ create mode 100644 tests/data/test418
+
+--- a/lib/content_encoding.c
++++ b/lib/content_encoding.c
+@@ -1035,7 +1035,6 @@ CURLcode Curl_build_unencoding_stack(str
+                                      const char *enclist, int maybechunked)
+ {
+   struct SingleRequest *k = &data->req;
+-  int counter = 0;
+ 
+   do {
+     const char *name;
+@@ -1070,9 +1069,9 @@ CURLcode Curl_build_unencoding_stack(str
+       if(!encoding)
+         encoding = &error_encoding;  /* Defer error at stack use. */
+ 
+-      if(++counter >= MAX_ENCODE_STACK) {
+-        failf(data, "Reject response due to %u content encodings",
+-              counter);
++      if(k->writer_stack_depth++ >= MAX_ENCODE_STACK) {
++        failf(data, "Reject response due to more than %u content encodings",
++              MAX_ENCODE_STACK);
+         return CURLE_BAD_CONTENT_ENCODING;
+       }
+       /* Stack the unencoding stage. */
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -708,6 +708,7 @@ struct SingleRequest {
+   struct dohdata *doh; /* DoH specific data for this request */
+ #endif
+   unsigned char setcookies;
++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
+   BIT(header);        /* incoming data has HTTP header */
+   BIT(content_range); /* set TRUE if Content-Range: was found */
+   BIT(upload_done);   /* set to TRUE when doing chunked transfer-encoding
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -66,7 +66,7 @@ test370 test371 \
+ test392 test393 test394 test395 test396 test397 \
+ \
+ test400 test401 test402 test403 test404 test405 test406 test407 test408 \
+-test409 test410 \
++test409 test410 test418 \
+ \
+ test430 test431 test432 test433 test434 test435 test446 \
+ \
+--- /dev/null
++++ b/tests/data/test418
+@@ -0,0 +1,152 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++gzip
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++<data nocheck="yes">
++HTTP/1.1 200 OK
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++Transfer-Encoding: gzip
++
++-foo-
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++ <name>
++Response with multiple Transfer-Encoding headers
++ </name>
++ <command>
++http://%HOSTIP:%HTTPPORT/%TESTNUMBER -sS
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="yes">
++GET /%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++
++# CURLE_BAD_CONTENT_ENCODING is 61
++<errorcode>
++61
++</errorcode>
++<stderr mode="text">
++curl: (61) Reject response due to more than 5 content encodings
++</stderr>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index b583060889..945745cdde 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -39,6 +39,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2023-23914_5-3.patch \
            file://CVE-2023-23914_5-4.patch \
            file://CVE-2023-23914_5-5.patch \
+           file://CVE-2023-23916.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.38.1


