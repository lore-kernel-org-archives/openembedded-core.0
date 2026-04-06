Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2930E9D836
	for <webhook@archiver.kernel.org>; Mon,  6 Apr 2026 13:21:56 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.54806.1775481709240622005
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Apr 2026 06:21:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=M2SRWOxY;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d8e548a05so4374355a91.1
        for <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 06:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1775481708; x=1776086508; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eWYeXKuo0OXGZQsyf7T/AYaJVTmxSmI33mySe0ynpc4=;
        b=M2SRWOxYIM31NkXzjmnkvnJaw3hf0jNjGb0nnuqN8tjjH89kIJ7gd8hBrEd7WmhpLQ
         dIddKCdCrz5A86LFyKKAdBYmrxAzxt2U5WvDj0HuM1zhsFISW+tdQvSjofTzdGLfcpQ4
         KMm3eMmixG+bmfc9aRQCgkg7I5grYrV85GP2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775481708; x=1776086508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eWYeXKuo0OXGZQsyf7T/AYaJVTmxSmI33mySe0ynpc4=;
        b=o13Hy8s7kbcIrSerU92i0dM8Ikh3qIadcCUFrqMGXRtqR9xVKY9lZ/uHkVJr2AnQaz
         V6JWUDVQSN+SF/2f6eu4xdTatjKToii8xJsZ/SzzKJt+Oli0XktfzE4TIXexg8myxTfp
         VJUncDav6t56wgfHOZNynrpyE+E0fAm+iC0u1TrhjLeqBaBlyFQRIWf2Ao8sa2qLTgNf
         8BqI9UStXltBE7L9c5rwTWE0j/f9fNxTGoSfBExgoLRO7ayvCFOJ2B3Xmpsj0vPw9xEu
         1LytyRXfFGNw5ZuXdxxc8rpEIvym/G2UdWEMAk/V2xQAk28QRM8//dE2vzmFbG/qZ4zH
         JWWQ==
X-Gm-Message-State: AOJu0YwfGNLUJL5OUx+RnOUNwfV+liQa0S/zyEQoYBrMxgkQWAOwK+ra
	f1kKgOmm3c623W5Qaubgb5aTyqY+tAnjKacZoP0V7G3JkAjyTH4yjZaqPjsNww3OnfAyJ1O64vi
	hSPplcwc=
X-Gm-Gg: AeBDieuu6fMKy+INpIqakhK+r1Me7wpJZE2B2lOEvTW6zu7eb7sFe8qS8lFvCc/+SnX
	Tr77kXmTJy+G63ptexAFIZTAZX4WxwT06yLR/WkphE+7SwesKlOJpzERBBB5mZY4N92qNNxsUHH
	SZqmNf4NpBSZc3f5Qw052EoGFk36yOSP6H25JZ9eZdEmmyTZQHc/1w//6QaLor1Y9CLTibFsOaK
	6u/Yf3nf7Sxjh33lUXbfNlA3uUUIgXNbnmGjrM98uWknf+GOLHDIApFtrsStj6pcIh+8yI+X+7n
	X1HLP9uXqkapYrXebjZ+rHuWadP0QR4aniO+2GMxSqMhzd0IL3AAoQ3watFllGvJ9QUqikfit2Q
	cFteXX5zrfLPA41Vhy2hcsyauj4AwWSHfM1+hhNe5m/TKZWBfoF05B2z7xkcyo7M+EqusiE0CO8
	tvPlOY8kyHpOmdZQLJxivIjpZo0ZCuj5E1/QFBbs8=
X-Received: by 2002:a17:90b:38ce:b0:35d:a557:e44 with SMTP id 98e67ed59e1d1-35de678fc34mr11742564a91.6.1775481708065;
        Mon, 06 Apr 2026 06:21:48 -0700 (PDT)
Received: from MVIN00352.mvista.com ([2401:4900:1f28:2171:fb10:85f3:b262:eebf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f50e9sm13848829a91.6.2026.04.06.06.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 06:21:47 -0700 (PDT)
From: Vijay Anusuri <vanusuri@mvista.com>
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][scarthgap][patch 2/3] curl: patch CVE-2026-3783
Date: Mon,  6 Apr 2026 18:51:28 +0530
Message-ID: <20260406132129.440817-2-vanusuri@mvista.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260406132129.440817-1-vanusuri@mvista.com>
References: <20260406132129.440817-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Apr 2026 13:21:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234680

pick patches from ubuntu per [1]

[1] http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
[2] https://ubuntu.com/security/CVE-2026-3783
[3] https://curl.se/docs/CVE-2026-3783.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-3783.patch             | 153 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 154 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 0000000000..609b519ddb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,153 @@
+From e3d7401a32a46516c9e5ee877e613e62ed35bddc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 6 Mar 2026 23:13:07 +0100
+Subject: [PATCH] http: only send bearer if auth is allowed
+
+Verify with test 2006
+
+Closes #20843
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877]
+Backported by Ubuntu team http://archive.ubuntu.com/ubuntu/pool/main/c/curl/curl_8.5.0-2ubuntu10.8.debian.tar.xz
+
+CVE: CVE-2026-3783
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/http.c              |  1 +
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test2006     | 98 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2006
+
+diff --git a/lib/http.c b/lib/http.c
+index a764d3c..b80bebf 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -673,6 +673,7 @@ output_auth_headers(struct Curl_easy *data,
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++	Curl_auth_allowed_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 4c2cd52..9fb9274 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -230,7 +230,7 @@ test1941 test1942 test1943 test1944 test1945 test1946 test1947 test1948 \
+ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 \
+ \
+-test2000 test2001 test2002 test2003 test2004 test2005 \
++test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2006 b/tests/data/test2006
+new file mode 100644
+index 0000000..4b8b269
+--- /dev/null
++++ b/tests/data/test2006
+@@ -0,0 +1,98 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++# Server-side
++<reply>
++<data crlf="yes">
++HTTP/1.1 301 Follow this you fool
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Location: http://b.com/%TESTNUMBER0002
++
++-foo-
++</data>
++
++<data2 crlf="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 7
++Connection: close
++
++target
++</data2>
++
++<datacheck crlf="yes">
++HTTP/1.1 301 Follow this you fool
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 6
++Connection: close
++Location: http://b.com/%TESTNUMBER0002
++
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Last-Modified: Tue, 13 Jun 2000 12:10:00 GMT
++ETag: "21025-dc7-39462498"
++Accept-Ranges: bytes
++Content-Length: 7
++Connection: close
++
++target
++</datacheck>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc default with redirect plus oauth2-bearer
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER --oauth2-bearer SECRET_TOKEN -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++default login testuser password testpass
++</file>
++</client>
++
++<verify>
++<protocol crlf="yes">
++GET http://a.com/ HTTP/1.1
++Host: a.com
++Authorization: Bearer SECRET_TOKEN
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://b.com/%TESTNUMBER0002 HTTP/1.1
++Host: b.com
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+-- 
+2.43.0
+
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 0b4c93ec66..ff4524e1bd 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2025-15224.patch \
     file://CVE-2026-1965-1.patch \
     file://CVE-2026-1965-2.patch \
+    file://CVE-2026-3783.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.43.0


