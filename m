Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A855C76196
	for <webhook@archiver.kernel.org>; Tue, 28 Mar 2023 05:26:04 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.59301.1679981154874918631
 for <openembedded-core@lists.openembedded.org>;
 Mon, 27 Mar 2023 22:25:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RgFKeY5e;
 spf=pass (domain: mvista.com, ip: 209.85.216.50, mailfrom: hprajapati@mvista.com)
Received: by mail-pj1-f50.google.com with SMTP id l9-20020a17090a3f0900b0023d32684e7fso653384pjc.1
        for <openembedded-core@lists.openembedded.org>; Mon, 27 Mar 2023 22:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1679981154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/jwLzgKAyBWwzgX9zcLUW7x/B2kkfmDlE0dGzkunI0Y=;
        b=RgFKeY5ekIgROPyAurGWUOMzSoDmB61s2XCr95PlvYAPyYYYqh86gNY/sOZPOGpCsJ
         OxYOU5nfwi1QpPMWxcDmJeNqlfUdIDabZ4TS4DCDan5T1FSrRh89e+M6nW20PNMa7BuN
         2P4G2Kfc53uD9+AB/38vLGfzHbBAmQpQnZexM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679981154;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/jwLzgKAyBWwzgX9zcLUW7x/B2kkfmDlE0dGzkunI0Y=;
        b=se6p0V0txTvzXUeTtcKLbMR4hmmqcMdHLCvf1N3SRZUqpNfZt9q8FDfE8EmFbrYxZw
         G2no6lU3QWRuo/YCyBm4NpylJ1XV7qLy1cObo1oe5jZLa2XLvUeXfxU3M8LEemFHgbI5
         TSDhQsMJbyj5TIartHWCTXJjf7nHD2wUkDWrVFi2mX+OQEE91iBhc2UMgUosk8pRTXEj
         a3X90v5L9lLWU+vdmp2uoH4iCUr4Dw93qhyZ6x9WBKZE7Ebb/R139nJcEHOTepvKpy10
         oJ3Suxhofe+Tw6BdmUKj1O2HLA452VKVUG7Md10vw8jUVS7kaASVUZw7fJ6zEMao+OyH
         dG9A==
X-Gm-Message-State: AO0yUKWBSSbwfxEh2lDOFK+/GCNuZ11LkCR63bWP/VPV8VZQtqgB8Hi1
	r+rDSwFVd2JWr2OSOtPcS2YON2Ib85E3z86Y0aI=
X-Google-Smtp-Source: AK7set+kdo/rfbeCYu8B93P4ufBLlyuuLNMsArJ0R3aKk+BBGFfCEuwkmyeXIybgsTDT0S4p5OW8dQ==
X-Received: by 2002:a05:6a20:891d:b0:d5:2a56:15b1 with SMTP id i29-20020a056a20891d00b000d52a5615b1mr12487483pzg.5.1679981153846;
        Mon, 27 Mar 2023 22:25:53 -0700 (PDT)
Received: from MVIN00024 ([103.250.136.200])
        by smtp.gmail.com with ESMTPSA id e27-20020a63545b000000b00513092bdca1sm8695658pgm.73.2023.03.27.22.25.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 22:25:53 -0700 (PDT)
Received: by MVIN00024 (sSMTP sendmail emulation); Tue, 28 Mar 2023 10:55:47 +0530
From: Hitendra Prajapati <hprajapati@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Hitendra Prajapati <hprajapati@mvista.com>
Subject: [dunfell][PATCH] curl: CVE-2023-23916 HTTP multi-header compression denial of service
Date: Tue, 28 Mar 2023 10:55:45 +0530
Message-Id: <20230328052545.47850-1-hprajapati@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 28 Mar 2023 05:26:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179199

Upstream-Status: Backport from https://github.com/curl/curl/commit/119fb187192a9ea13dc90d9d20c215fc82799ab9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
---
 .../curl/curl/CVE-2023-23916.patch            | 231 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.69.1.bb      |   1 +
 2 files changed, 232 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
new file mode 100644
index 0000000000..054615963e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
@@ -0,0 +1,231 @@
+From 119fb187192a9ea13dc90d9d20c215fc82799ab9 Mon Sep 17 00:00:00 2001
+From: Patrick Monnerat <patrick@monnerat.net>
+Date: Mon, 13 Feb 2023 08:33:09 +0100
+Subject: [PATCH] content_encoding: do not reset stage counter for each header
+
+Test 418 verifies
+
+Closes #10492
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/119fb187192a9ea13dc90d9d20c215fc82799ab9]
+CVE: CVE-2023-23916
+Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
+---
+ lib/content_encoding.c  |   7 +-
+ lib/urldata.h           |   1 +
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test418      | 152 ++++++++++++++++++++++++++++++++++++++++
+ 4 files changed, 157 insertions(+), 5 deletions(-)
+ create mode 100644 tests/data/test418
+
+diff --git a/lib/content_encoding.c b/lib/content_encoding.c
+index 91e621f..7e098a5 100644
+--- a/lib/content_encoding.c
++++ b/lib/content_encoding.c
+@@ -944,7 +944,6 @@ CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
+ {
+   struct Curl_easy *data = conn->data;
+   struct SingleRequest *k = &data->req;
+-  int counter = 0;
+ 
+   do {
+     const char *name;
+@@ -979,9 +978,9 @@ CURLcode Curl_build_unencoding_stack(struct connectdata *conn,
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
+diff --git a/lib/urldata.h b/lib/urldata.h
+index ad0ef8f..168f874 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -648,6 +648,7 @@ struct SingleRequest {
+ #ifndef CURL_DISABLE_DOH
+   struct dohdata doh; /* DoH specific data for this request */
+ #endif
++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
+   BIT(header);       /* incoming data has HTTP header */
+   BIT(content_range); /* set TRUE if Content-Range: was found */
+   BIT(upload_done);  /* set to TRUE when doing chunked transfer-encoding
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 60e8176..40de8bc 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -63,7 +63,7 @@ test350 test351 test352 test353 test354 test355 test356 test357 \
+ test393 test394 test395 \
+ \
+ test400 test401 test402 test403 test404 test405 test406 test407 test408 \
+-test409 \
++test409 test418 \
+ \
+ test490 test491 test492 \
+ \
+diff --git a/tests/data/test418 b/tests/data/test418
+new file mode 100644
+index 0000000..50e974e
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
+-- 
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
index 899daf8eac..64e4fb5809 100644
--- a/meta/recipes-support/curl/curl_7.69.1.bb
+++ b/meta/recipes-support/curl/curl_7.69.1.bb
@@ -42,6 +42,7 @@ SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
            file://CVE-2022-32221.patch \
            file://CVE-2022-35260.patch \
            file://CVE-2022-43552.patch \
+           file://CVE-2023-23916.patch \
 "
 
 SRC_URI[md5sum] = "ec5fc263f898a3dfef08e805f1ecca42"
-- 
2.25.1


