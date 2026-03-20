Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D3A1093189
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 07:56:31 +0000 (UTC)
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7531.1773993385922085616
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Mar 2026 00:56:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PRTDkdg4;
 spf=pass (domain: mvista.com, ip: 209.85.214.180, mailfrom: vanusuri@mvista.com)
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a7a9b8ed69so22069535ad.2
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 00:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1773993385; x=1774598185; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JWo3X6St0+AIhwHCL6ARIuk0x9rQWVino7H+bnmVY7k=;
        b=PRTDkdg46ik8U4R0UTSZeS8ievf0K+OYWfr1y4A4FvddYpZr8H98sgweTtxchyIVBf
         YO5h33BpM40aIV2zOzEEPhT7wQT3mMY3XCgt7bG6w7HHhGy6HrSYcudYT21dAYpSfClf
         3COCiLWgmm+OEE45yH7IdHLXUHi6+aprU2xkE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773993385; x=1774598185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JWo3X6St0+AIhwHCL6ARIuk0x9rQWVino7H+bnmVY7k=;
        b=gfWxtyU17guYbr0V5t/4aMHifOwPA+IJrJPQLXkMjq4JheTfli028FoG5M4fvYEvNm
         1WE76oMo1dPxTPOGOT6tZz4o/rQbLcp/7fwJMs8guljd1cEW8pns2KYwpbWZfDn0WPVx
         XeIw6M5WmojtWjTGc/MVKLWgiewuaMUAvq95c8fAWV+8TO4MUfdx4zYPptFap57453uW
         sxZ5/Zc8KabcA3GOeN+1/FkvtVetFLM0u/+V26TO4Q6HcY44R5U2bp55xmRw0JNMMeVo
         CBV8qgnmIteoY3HXX11SCaTXZB/HZM/utcKc4ehrJmPnvnhdmgYpQYqK5xmA40CqyUg5
         M/qw==
X-Gm-Message-State: AOJu0YysOblqRi/QsjKexElQIhHUhOxdSPfNURP/4VnigA8JjJfWdrgD
	Hj5qryWgMoG/nagQNx1ykGtG3Knbnx3zO5KsBstMXpzmsFZQIMvfT7FaBjaKKNog4wFAhC092X3
	l1iomXGU=
X-Gm-Gg: ATEYQzwqGU7Aq5iuTX5O6dwQn80fKgEpd9d4Tc7KSs8FWi+UQaaXZaCWSDzklPK7Qnb
	itCccKXE8LfRQQeLZCxuCoCqZwet31kFuhXIt63RRiaSGum6HcYmXDCF2oSB4N5q26whcu3Z2ZR
	+Hs9IExeczmV/x6FfVZI9Rx3sry9cdo0kvNF5eOOd9FjFJLK6jczdrbzHx931FmADmH74FpwWVA
	J4VXlYGhiYVME7UvT59rlYIZ12UoSCsXgc80KxWQTjl3OsCFh81aMKT1Vb38Y6PGOt3+Gxmy31+
	k0d5YDv/CreVDAn3ocLRZEMsA9GTj0kRVxYLsnStTt+2tyZMqfIkFygtSkIKrDBD7VSkw0UQAI4
	m0Sx4Tk+/T01WCrarwBtYHFld/Wy53c1SkA5PhtuhAkqBLK7y1VYYPgQDBgyLMf3LRfTpLEb6UF
	+tQuWP1ELoVnFSLx6WbgG4S7tEF1GK8yxBfrUU
X-Received: by 2002:a17:902:e885:b0:2ae:5776:45f8 with SMTP id d9443c01a7336-2b0826d73dcmr21675585ad.3.1773993384887;
        Fri, 20 Mar 2026 00:56:24 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:8f5f:34a4:6ab0:7770])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08352ae70sm14770965ad.23.2026.03.20.00.56.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2026 00:56:24 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH 3/4] curl: Fix for CVE-2026-3783
Date: Fri, 20 Mar 2026 13:26:03 +0530
Message-Id: <20260320075604.551251-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260320075604.551251-1-vanusuri@mvista.com>
References: <20260320075604.551251-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 20 Mar 2026 07:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233586

From: Vijay Anusuri <vanusuri@mvista.com>

import patch from ubuntu to fix
 CVE-2026-3783

Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
Upstream commit https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877]

Reference: https://curl.se/docs/CVE-2026-3783.html
           https://ubuntu.com/security/CVE-2026-3783

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-3783.patch             | 188 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   1 +
 2 files changed, 189 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 0000000000..577af6479c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,188 @@
+Backport of:
+
+From e3d7401a32a46516c9e5ee877e613e62ed35bddc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 6 Mar 2026 23:13:07 +0100
+Subject: [PATCH] http: only send bearer if auth is allowed
+
+Verify with test 2006
+
+Closes #20843
+
+Upstream-Status: Backport [import from ubuntu curl_7.81.0-1ubuntu1.23.debian.tar.xz
+Upstream commit https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877]
+CVE: CVE-2026-3783
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/http.c             |  1 +
+ tests/data/Makefile.am |  2 +-
+ tests/data/test2006    | 98 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2006
+
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -652,6 +652,21 @@ CURLcode Curl_http_auth_act(struct Curl_
+   return result;
+ }
+ 
++/*
++ * Curl_allow_auth_to_host() tells if authentication, cookies or other
++ * "sensitive data" can (still) be sent to this host.
++ */
++bool Curl_allow_auth_to_host(struct Curl_easy *data)
++{
++  struct connectdata *conn = data->conn;
++  return (!data->state.this_is_a_follow ||
++          data->set.allow_auth_to_other_hosts ||
++          (data->state.first_host &&
++           strcasecompare(data->state.first_host, conn->host.name) &&
++           (data->state.first_remote_port == conn->remote_port) &&
++           (data->state.first_remote_protocol == conn->handler->protocol)));
++}
++
+ #ifndef CURL_DISABLE_HTTP_AUTH
+ /*
+  * Output the correct authentication header depending on the auth type
+@@ -742,6 +757,7 @@ output_auth_headers(struct Curl_easy *da
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++        Curl_allow_auth_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+@@ -775,21 +791,6 @@ output_auth_headers(struct Curl_easy *da
+   return CURLE_OK;
+ }
+ 
+-/*
+- * Curl_allow_auth_to_host() tells if authentication, cookies or other
+- * "sensitive data" can (still) be sent to this host.
+- */
+-bool Curl_allow_auth_to_host(struct Curl_easy *data)
+-{
+-  struct connectdata *conn = data->conn;
+-  return (!data->state.this_is_a_follow ||
+-          data->set.allow_auth_to_other_hosts ||
+-          (data->state.first_host &&
+-           strcasecompare(data->state.first_host, conn->host.name) &&
+-           (data->state.first_remote_port == conn->remote_port) &&
+-           (data->state.first_remote_protocol == conn->handler->protocol)));
+-}
+-
+ /**
+  * Curl_http_output_auth() setups the authentication headers for the
+  * host/proxy and the correct authentication
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
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -218,7 +218,7 @@ test1916 test1917 test1918 \
+ \
+ test1933 test1934 test1935 test1936 test1937 test1938 test1939 \
+ \
+-test2000 test2001 test2002 test2003 test2004 \
++test2000 test2001 test2002 test2003 test2004 test2006 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 0e107f1e75..8fdd954c7e 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -73,6 +73,7 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-14524.patch \
            file://CVE-2026-1965-1.patch \
            file://CVE-2026-1965-2.patch \
+           file://CVE-2026-3783.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


