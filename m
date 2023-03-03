Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF97AC7EE2F
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 07:52:44 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.18509.1677829962713619560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Mar 2023 23:52:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=T5a6F8Hb;
 spf=pass (domain: gmail.com, ip: 209.85.216.41, mailfrom: badganchipv@gmail.com)
Received: by mail-pj1-f41.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so1482290pjp.2
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Mar 2023 23:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677829962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHhdhNZq3fygIqU7Cl/+gbNaEwP3wfBnjnsIZU1USAw=;
        b=T5a6F8HbUYqE655VmY/syBac4O4N00rfh6JhFmwZCD8+WyR0Suy4FiZwRRn3Dbxz9n
         THe44OQ0yoWO163SMcPJwVhmudE5Up113xTrHaovdsazUyf6AvyD7JvunMttHMZscKBV
         0KOF2Eq4oam/r9TBxnOXOI8ydXfADJt7v9NkJrghY3LtCFWlz/MygFDzXdNZaPmgDBDR
         zD7+rTgIyVoVO6st0rUOih7aJa8SVErlvchmsRZHLV+OlbXqUlj8IFm5YBzA+tM4rxGs
         fKWs9LkKXTg4idzxMDGXO12d8Uk7Y9p7PJqbMP4mC7HWZXyMmFnfE4wFUIAB6UvHm+/d
         kk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677829962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHhdhNZq3fygIqU7Cl/+gbNaEwP3wfBnjnsIZU1USAw=;
        b=1D1VsKVw/C8EzqoD1RuSUkrzkRpna+iCYvEzO14sYLuVfQSFXzrCbpI07ui39cAUYV
         Coqn2QWcYGBKpu+0/8oEeHUi+JjMm7dBhPZufT6jsqH3FNtcqq3Ovdyecm1ZOeZ2NfQ0
         1HNCWn1a3VO+biMOrox7aqQkPUWbfnMVN3dC+kqt3Op3pvg49GJFby82cZ90ojfvAAWJ
         oGGLrKBvpbKBM/Gt4CLnKJgiSdLVfljCQdoJgoWIgLIIs6nDMFuJPlCAeuh4EchIw/zq
         tVSHGvGPmyUj9cpKBO0Jg79/C/J/1g/ExSoHBhDOXf1rtrI16VtUrLMnSEYxDcBiu9xE
         T3CA==
X-Gm-Message-State: AO0yUKULb9cqdWUnXOKAZQi/rtDhAk7O6LTYG//OPd6U2/QBRcqiYJSk
	jlKY+lDZF3xK5+GAEuhUpecucHJ6/1EJEQ==
X-Google-Smtp-Source: AK7set9ylmaDPkZqfWpIJJmlMZbj5iIMB/Ln/bY1B14WXlqja4inCLMHGv4pE7Op1xEkIbLE01sPDQ==
X-Received: by 2002:a17:902:b612:b0:19e:6b56:7d8c with SMTP id b18-20020a170902b61200b0019e6b567d8cmr951879pls.9.1677829961958;
        Thu, 02 Mar 2023 23:52:41 -0800 (PST)
Received: from localhost.localdomain ([2401:4900:1c2d:6c0c:c9d2:a706:a735:ebb3])
        by smtp.gmail.com with ESMTPSA id h185-20020a636cc2000000b00503828cc73fsm890604pgc.13.2023.03.02.23.52.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 23:52:41 -0800 (PST)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
Date: Fri,  3 Mar 2023 13:20:27 +0530
Message-Id: <20230303075027.28236-2-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230303075027.28236-1-badganchipv@gmail.com>
References: <20230303075027.28236-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 Mar 2023 07:52:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/177978

From: Pawan Badganchi <Pawan.Badganchi@kpit.com>

Add below patch to fix CVE-2023-23916

CVE-2023-23916.patch

Link: https://launchpad.net/ubuntu/+source/curl/7.87.0-2ubuntu2/

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
---
 .../curl/curl/CVE-2023-23916.patch            | 223 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 224 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
new file mode 100644
index 0000000000..4839124d5c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
@@ -0,0 +1,223 @@
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
+Upstream-Status: Backport [http://launchpadlibrarian.net/652022114/curl_7.87.0-2ubuntu1_7.87.0-2ubuntu2.diff.gz]
+Comment: Refreshed hunk from content_encoding.c and Makefile.inc. Removed test387 from patch as
+it is not available in the source code.
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
+@@ -1035,7 +1035,6 @@
+                                      const char *enclist, int maybechunked)
+ {
+   struct SingleRequest *k = &data->req;
+-  int counter = 0;
+ 
+   do {
+     const char *name;
+@@ -1070,9 +1069,9 @@
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
+@@ -707,6 +707,7 @@ struct SingleRequest {
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
index af3c4a6ce4..4600f17feb 100644
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


