Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1725C761A6
	for <webhook@archiver.kernel.org>; Tue,  4 Apr 2023 02:39:38 +0000 (UTC)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
 by mx.groups.io with SMTP id smtpd.web11.92067.1680575970709666840
 for <openembedded-core@lists.openembedded.org>;
 Mon, 03 Apr 2023 19:39:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=eqN59vxU;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.174, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f174.google.com with SMTP id l14so20487706pfc.11
        for <openembedded-core@lists.openembedded.org>; Mon, 03 Apr 2023 19:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1680575970; x=1683167970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z7t+S/HzzpUEyfsR/xqV35P341C4RUocRfeOWJ6cDI4=;
        b=eqN59vxUCpjcJZdOKAk+GOvANSzRDiavM/7+jyX0mKK8MkYS/juulxbb4hgGhGD9Cb
         Dr/2cf/VUMfVabfejT+zDzwv2x4psQoKP1+kQcW61Ep2MKYz/2RkWv5yav3DTNfG4mZr
         mFMDYWw+VSjMTtxJZ32kq3ElmakYYCfhdAzd5+TmAfqocE/s2OembAPpARmgdxuEav9Q
         ZE4dPZLgUKPvRhJvfTguOCYRUSK3lyBaY1QSOTtewKSOaOR6l6PmsaM4iEmAPakQViur
         hyb1HFRFs5ifarqwf/sYvFK9GJ7gS2K8o8OffEoSKYJ7tRpNZKgYAnJm80PUC/Q98FRb
         NH3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680575970; x=1683167970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Z7t+S/HzzpUEyfsR/xqV35P341C4RUocRfeOWJ6cDI4=;
        b=hxcwSX3+J/EXu3nUv4nhFvOfPYwET+2OO0O6bYqUNzvoDL5hJrMXNzA+Xwiszj7VYO
         uGDNBCQIEAkQUz/Yn6myA2W/sbgLnmCgOzLTl+EEZv4JjnCvphCggGHbXa31lHsIPYj2
         d9hYKbODP9DLq51i9swF+uRj3uNPBh0f6JDvVtZwdGkFll6L+polTIv9ikzm7F5Ju6am
         ylTAmp0puLzseNaR2LY3nUUYoRkhJt3g71iUq26FnyJ8MxGGQQySQwuL24Qxe9JhWmEY
         wmjvj0msF4TvC1o2YLFBAb4wRtkfsYYWeyBhAGP5683n0HJ7N8PtjPaBVLZ3XdCy6u6o
         lm0w==
X-Gm-Message-State: AAQBX9fmmtnn/AI4c03Gg5LD86ThrGalWduiQrUanq0/8scaGaWrkq0q
	w2/gP+WKPUYpd95wV4E/bHFMCDm/lnSPz3xRbSY=
X-Google-Smtp-Source: AKy350ayEuvzxnTRBFuwEzHjHI+EZDHZUAlebcFQPEE5fqqsDctQej/EFRN77EtrmbR70tgdysbrzA==
X-Received: by 2002:aa7:9697:0:b0:625:5d2c:e729 with SMTP id f23-20020aa79697000000b006255d2ce729mr583677pfk.33.1680575969730;
        Mon, 03 Apr 2023 19:39:29 -0700 (PDT)
Received: from hexa.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id a14-20020aa7864e000000b0062deace7c0csm6850569pfo.190.2023.04.03.19.39.28
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 19:39:29 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 1/7] curl: CVE-2023-23916 HTTP multi-header compression denial of service
Date: Mon,  3 Apr 2023 16:39:10 -1000
Message-Id: <b121b59cf6f642f46c97c96f3c4cf4cd84ff2af5.1680575792.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1680575792.git.steve@sakoman.com>
References: <cover.1680575792.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Apr 2023 02:39:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179660

From: Hitendra Prajapati <hprajapati@mvista.com>

Upstream-Status: Backport from https://github.com/curl/curl/commit/119fb187192a9ea13dc90d9d20c215fc82799ab9

Signed-off-by: Hitendra Prajapati <hprajapati@mvista.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.34.1


