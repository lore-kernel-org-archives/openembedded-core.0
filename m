Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 101BDC77B6C
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 13:37:52 +0000 (UTC)
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
 by mx.groups.io with SMTP id smtpd.web10.101684.1680615464882750632
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 06:37:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Wp8VwrUm;
 spf=pass (domain: gmail.com, ip: 209.85.215.176, mailfrom: badganchipv@gmail.com)
Received: by mail-pg1-f176.google.com with SMTP id d8so19634180pgm.3
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 06:37:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680615464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Toq3PcSUTi9prpY0Kg5ekdWch+AI+/2J4Ywz3rrrbhw=;
        b=Wp8VwrUm+BHOF0omgBZRLPokkVYrnGQxBleertKqeUB9I5EoJVODW88eQoTM/tTXrK
         h34dFH68DeYc4gwahGH6mN5TetB3w/YAKH4imdpvhFeknpy7XQ/IYO6Xdme648k+i098
         AbJBAoCEPvl+8Uy+6VdN8NGz6WxZpK9LhoyTNj4MbPtlLnCbrhefuMIpmNO96YuGT4GO
         NzEcGI+6qCWq1LkK1Ju9o0TpDmlSyesQv1XNfDfRZE6K4VwwD+Zak8LfIWv8NlorxrNL
         eVOKdadYUrDesUOF55ulnMZik2mlf0jLE+n9iBjzL/sa5JnxuPl5P9SANCEZP4wWxXb1
         MGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680615464;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Toq3PcSUTi9prpY0Kg5ekdWch+AI+/2J4Ywz3rrrbhw=;
        b=LiMqvGR97Rq65tnBbrd8NvqJoGIvVGnAXD9MtN52pBHocdFYxYW+pTsxSI/g9mbTMk
         I/jM28kJKPpblez8xSCZdW9AVhc6rGK4WphAWJqDrpazh8U+zy4MWxQDTggkGmQaGDF1
         rxcSV9dY9yS4RqZSU6QCIGYLa1v3zPUhrm7x+epq75z817dgamRki9/MTodDOUCxq5yE
         TYDQN9mg2G+Rs8yCXYDab8wcToarJt6WSyQO6v2+lTbgTHr4mA+o4k2N7DjvOzsqADC3
         3b53veq1GYM9ctcFgatgPYuCiE0m8fG8qIn9pOR8yYfvLsIQaQZvR84F4DW+ANznRG7z
         nQYA==
X-Gm-Message-State: AAQBX9fXvBYgC23yVoU/8GfnogzLy5lVnRvNJ6nYoCj6PGBeh4btDfBC
	KZHQUe8zcrIjRZgE7w9CqLa5Hn9nACoL+Q==
X-Google-Smtp-Source: AKy350bvtjzTXDQpUR7jJ7At5i3G/23KhieKPIfnf34vf0wprZittNBUXReWztPlrgULI54ac+tj8w==
X-Received: by 2002:aa7:978a:0:b0:627:f9ac:8a31 with SMTP id o10-20020aa7978a000000b00627f9ac8a31mr2408127pfp.2.1680615463805;
        Tue, 04 Apr 2023 06:37:43 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c8e:1439:f8c9:e8a3:92d4:e44a])
        by smtp.gmail.com with ESMTPSA id d18-20020aa78692000000b0062a515874b4sm8906692pfo.32.2023.04.04.06.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 06:37:43 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta][kirkstone][PATCH] curl: Add fix for CVE-2023-23916
Date: Tue,  4 Apr 2023 19:07:18 +0530
Message-Id: <20230404133718.50343-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 13:37:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179689

Add below patch to fix CVE-2023-23916

CVE-2023-23916.patch

Link: https://curl.se/docs/CVE-2023-23916.html

Signed-off-by: pawan <badganchipv@gmail.com>
---
 .../curl/curl/CVE-2023-23916.patch            | 219 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 220 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
new file mode 100644
index 0000000000..a57d275902
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
@@ -0,0 +1,219 @@
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
+@@ -1037,7 +1037,6 @@ CURLcode Curl_build_unencoding_stack(str
+                                      const char *enclist, int maybechunked)
+ {
+   struct SingleRequest *k = &data->req;
+-  int counter = 0;
+ 
+   do {
+     const char *name;
+@@ -1072,9 +1071,9 @@ CURLcode Curl_build_unencoding_stack(str
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
+@@ -682,6 +682,7 @@ struct SingleRequest {
+   struct dohdata *doh; /* DoH specific data for this request */
+ #endif
+   unsigned char setcookies;
++  unsigned char writer_stack_depth; /* Unencoding stack depth. */
+   BIT(header);        /* incoming data has HTTP header */
+   BIT(content_range); /* set TRUE if Content-Range: was found */
+   BIT(upload_done);   /* set to TRUE when doing chunked transfer-encoding
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -69,6 +69,7 @@
+ \
+ test400 test401 test402 test403 test404 test405 test406 test407 test408 \
+ test409 test410 \
++test418 \
+ \
+ test430 test431 test432 test433 test434 test435 test436 \
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


