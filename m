Return-Path: <badganchipv@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DB8C6FD1D
	for <webhook@archiver.kernel.org>; Wed, 15 Mar 2023 09:36:29 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.3764.1678872987625486056
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Mar 2023 02:36:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=MNwjKrzm;
 spf=pass (domain: gmail.com, ip: 209.85.210.174, mailfrom: badganchipv@gmail.com)
Received: by mail-pf1-f174.google.com with SMTP id q14so5365420pfu.7
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678872987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=chnFyFesQYaXYYEYdc7Ff+8fHEVnliLJPhGSSqabZ1o=;
        b=MNwjKrzmdS1hq6cUF6RRjJIzy5wfRJ3eZgXfyQO74ypO+/Zb+WjTTkzfMncMYkSoWb
         Yf6MoffjR5Pn/GWwB5FTxUPFqEzUHt+Pa8tJGV+cALY8OxZX0WfEj5lqZx7jDIMrELor
         NxZ9GpTkL2+3khk3JLfdmsmks/l+Jzb5FbgKlcsNWG18V5iCrCLucr3GWS4yA5wNUJdg
         I7l1tORkQ3bdTkAPSQM+wNr1PR/FclvajbSMiIHM48p2v+bGh8xq8xyAsDMbWB/IDvME
         KQL47WK3FkCsw1B9cEFzJtXSRVhDoUcQl306O5QG0sYxR3n82IjhHFbrvuTRexWpIZix
         xDjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678872987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=chnFyFesQYaXYYEYdc7Ff+8fHEVnliLJPhGSSqabZ1o=;
        b=B5bpkORwLelmfMzg/4Aa5Cn6Uz60vH/J91CYzlfqEmPVjdOw0bxG8GhWBI3GIBtAty
         YGmKIRUtS28OW5A85vYEh8+mWc+jxLHMg+7yFVBubUAB4QVutv4G24TDpEuwPntzpmgD
         q2aGUHs1zmQyY78/5Vxh8aedwRT3t6E0x8Ry5O82gK5DFpP6X4e155AkSVIlNfok+Xnl
         V2D45oJ5o5vpZ3Nu02D8SzIyxCDsuvqk7Sukii/8NlJ8YJlBC6nLggYpSlImr3aXONMF
         rVLYiuD3X/y7LfeU8spgeeBhLt9SkQFPy365Sk4jGmI7IfTcF65HVxgyRs6O09Be9DW6
         J6/A==
X-Gm-Message-State: AO0yUKVdi4vcESXG3gFPSAmAIfWRoyRDbU26WYWHfKoniq09HTF2hbb/
	AT+L/lcEbRKDmBIPuufyaQyzQgUL9yh8ow==
X-Google-Smtp-Source: AK7set/sdVXLegCeoTLuP3E9k0Cm+svO4s0LML/LgrTP4NgrYdIQ8iLROUQG3BdhYHBeHsGh3kH19A==
X-Received: by 2002:a62:1d09:0:b0:622:749a:b9df with SMTP id d9-20020a621d09000000b00622749ab9dfmr11337508pfd.3.1678872986898;
        Wed, 15 Mar 2023 02:36:26 -0700 (PDT)
Received: from localhost.localdomain ([2401:4900:1c9a:ae99:3d3b:8aa8:c88:79ca])
        by smtp.gmail.com with ESMTPSA id 14-20020aa7914e000000b00622e01989cbsm3168554pfi.176.2023.03.15.02.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Mar 2023 02:36:26 -0700 (PDT)
From: pawan <badganchipv@gmail.com>
To: openembedded-core@lists.openembedded.org,
	badganchipv@gmail.com
Cc: ranjitsinh.rathod@kpit.com,
	Pawan Badganchi <Pawan.Badganchi@kpit.com>
Subject: [meta][kirkstone][PATCH 2/2] curl: Add fix for CVE-2023-23916
Date: Wed, 15 Mar 2023 15:05:06 +0530
Message-Id: <20230315093506.41960-2-badganchipv@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315093506.41960-1-badganchipv@gmail.com>
References: <20230315093506.41960-1-badganchipv@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Mar 2023 09:36:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178530

From: Pawan Badganchi <Pawan.Badganchi@kpit.com>

Add below patch to fix CVE-2023-23916

CVE-2023-23916.patch

Link: https://packages.ubuntu.com/source/jammy/curl

Signed-off-by: Pawan Badganchi <Pawan.Badganchi@kpit.com>
Signed-off-by: pawan <badganchipv@gmail.com>
---
 .../curl/curl/CVE-2023-23916.patch            | 222 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 223 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-23916.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-23916.patch b/meta/recipes-support/curl/curl/CVE-2023-23916.patch
new file mode 100644
index 0000000000..d014a2b879
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
+Upstream-Status: Backport [http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_7.81.0-1ubuntu1.8.debian.tar.xz]
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


