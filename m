Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 813A3C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 08:31:40 +0000 (UTC)
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
 by mx.groups.io with SMTP id smtpd.web10.96317.1680597096481726553
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Apr 2023 01:31:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=dOuWtQVY;
 spf=pass (domain: gmail.com, ip: 209.85.215.171, mailfrom: badganchipv@gmail.com)
Received: by mail-pg1-f171.google.com with SMTP id q191so1839526pgq.7
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 01:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680597096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=krVsCqb1r65+8ezEpugcJZJi4fuYHDh2gzmArWQW9i8=;
        b=dOuWtQVYJinWRvGBFW9P+KB6TS4OaPgkHuWSN1fUbIeRZFudpOMNXpaRURGXF+XEWo
         P/3RbbaZW9GImqLaqsjGl94rwpMKA8hBt/U/7KxFxp40SX5dEqfSKEemUOEUSE2KxsLH
         zPVOhb6Sm/APioPBKDZH7VDD8+O83NkB1teWR7udRZaw4ISHhhtdtoXPXRMgHjwO9r58
         vowBmKIMe/ALOKN43tabmU5bt2dQkd62AtaJ0n4MJ9gBdegAx+SxCrYTjjG2aC+Y3Ky4
         ZjmplUBCNgK6wDIHQu0kOVCXn1vPsgMEdFttiYP/JrwRvKtbGVcI9bghsTGF83P+bLN+
         hyGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680597096;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=krVsCqb1r65+8ezEpugcJZJi4fuYHDh2gzmArWQW9i8=;
        b=eYSbPsygQd85PD47skOhMbcPaT2XiljLwS2TyXFZqvnnfekufwtoLgur6fPeJOgQUl
         9GaN4rg6iNF4ngsOVvGb3EgkFGbxrjHu+Jz/gw0cTyDt3y6MlFvNThRs6VlUBpfuH42A
         esXCDp+io9ScPuIKNKGJYsmgtYBBebxiwmpe7M6h0kgg6mrCtA2iVIB5cUyaYXVS1PLh
         rWj9nzKV6fXmYfECNBYZsw5FKLsYa20PjTf7iOxR9igyDYAkc/S6vsiQ6tvXpoiwsPDM
         1ARu9IA0sADinv1dFQpil0qNRX5iYhFp85Oc1UU6T6CD4D6YJDVbwO5PJH4evFHSdn/5
         iIUA==
X-Gm-Message-State: AAQBX9cdT3G3k1HwxhhDMoluVXTTKL0vZA8oN6PAQnd9u0escU8GjPc9
	Fz0UEXLrED+1Ch0r7q5mHeKrf6Ncdbk=
X-Google-Smtp-Source: AKy350YMfZFQcXRb1JotmlwoViy3xM8XAlzTBj9W7woJvzzqbh9QFL2wySbFAX4KZIyiGm/uwWSqbQ==
X-Received: by 2002:a62:6585:0:b0:624:3061:7dbf with SMTP id z127-20020a626585000000b0062430617dbfmr1326621pfb.25.1680597095528;
        Tue, 04 Apr 2023 01:31:35 -0700 (PDT)
Received: from L-10146.. ([2401:4900:1c2d:7ffa:c1b9:1371:886d:ec10])
        by smtp.gmail.com with ESMTPSA id g21-20020aa78195000000b0062a54ce6b2bsm8199183pfi.108.2023.04.04.01.31.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 01:31:35 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [meta][kirkstone][PATCH] curl: Add fix for CVE-2023-23916
Date: Tue,  4 Apr 2023 14:01:13 +0530
Message-Id: <20230404083113.25604-1-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 08:31:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179676

Add below patch to fix CVE-2023-23916

CVE-2023-23916.patch

Link: https://curl.se/docs/CVE-2023-23916.html

Signed-off-by: pawan <badganchipv@gmail.com>
---
 .../curl/curl/CVE-2023-23916.patch            | 221 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 222 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
new file mode 100644
index 0000000000..fb1a791399
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
@@ -0,0 +1,221 @@
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


