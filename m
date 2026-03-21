Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D8DD1094468
	for <webhook@archiver.kernel.org>; Sat, 21 Mar 2026 09:47:55 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8246.1774086469523872246
 for <openembedded-core@lists.openembedded.org>;
 Sat, 21 Mar 2026 02:47:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=kPXU0OH2;
 spf=pass (domain: mvista.com, ip: 209.85.216.42, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3590042fa8eso1797239a91.1
        for <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 02:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1774086468; x=1774691268; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oYINxzLNb5IMPG9JZq1m2jpUYrz2c260UJ71jXGgs1c=;
        b=kPXU0OH22TTU2NbtQ4RerdANljknxmEvc6KF+6wLAKGZN2KcT9WMy+XMr8UduG24cs
         PwRMkWVgC2thMeRLBen7H7OmkPlHXL2ipEhp0ovbI2EUo0nJXFI4VhPMcGHsyL6qfjrz
         sYgOyJ5iJPb1K+EwAJR9MyXHDea5yZaQDnvVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774086468; x=1774691268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oYINxzLNb5IMPG9JZq1m2jpUYrz2c260UJ71jXGgs1c=;
        b=KDIIQQtNt0rzKEZrPfmv9O4/5XcVoSjvLFKMG4rqL2gbJUWkXujRJHquY6mwOgnidT
         Cy5UeeBj+GNexGym5tMcMar3cN+0FprKwGSIhr5DMUURc4ZwFRn2zB/aFkHCpcIY91ce
         AAkZ8gJKseQMFiuHJppog2JUU1U9hso7YSA0JvEV6m5qO4fI2EWAguOEVb+hABIxyui7
         bzOwAkvhKSz8MmGUl/SC5Lis08urkYWLVfwEmrzvrsV9y4tmgBrxM3+06C60O1Nzr9kC
         PYICy6IYNr72fWVaA75i9hm2JvySbV1ZzvhOglIb2f6kQ49pN718mbeeK6VU7sCg44wZ
         0DGQ==
X-Gm-Message-State: AOJu0YwLushTiilNAHnG3bFl+oMl897q8W9R4iwsTWBupA9O+bfSt7P9
	CoyDD9nai/dsjjcfJaauVw701yeot/mnBis7wD74jT7vBGcO/MKgZ4i3s5kHznMC9/v/HKssA6P
	G7t23IRA=
X-Gm-Gg: ATEYQzx6+tuHoWb8vmbodJrrYp4i7yBhzxnbxh5NN3Va14+pJFnMFv6YkOkhfrPRqch
	TYbNZRDKVbmNNk2Ly4RkFPMFMwoKdqmjj2Ipwal7S0CqXPCyZOXwsz+2jFG50GNhSV5e0Jzig6o
	TOGUzKhYv4GgGGCkwH0MDYUGWTmWonIKaFnrA+IfHQ0zNJ3T2SIwz8ft8qXmZZgSaGofelz4s63
	EfpHmaD8H285WAnXzlvLn+1WEjxx+RNMSB0ZY8/cO9FrBkPsrdzamh1SlkSuJINKYBAYODXuXnu
	N/Q17knIUE/lGMuKsZ5rkBBKgsQ7HBLnaFzmvz0ka7nb2wQy90bt8BX4UUQNGpfcxdWzO7QpriZ
	4YWX3aDQcxcB1m9XlHD6rV12+9dT2yKi1Ev08dloLGUkrNULsECjvVL3fJbSnQSmPQjBpBcOA3A
	HP4ejyVUoGujnY6x2GYq1BZ5FOV6TI94U/4uP3B7ieDg+Q4ko=
X-Received: by 2002:a17:90b:4c4a:b0:35b:929f:7e8f with SMTP id 98e67ed59e1d1-35bd2bfdf2cmr5188134a91.13.1774086468407;
        Sat, 21 Mar 2026 02:47:48 -0700 (PDT)
Received: from localhost.localdomain ([2406:7400:54:2bec:e896:2af1:2e77:522f])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35bc5ff704bsm7489501a91.2.2026.03.21.02.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 02:47:47 -0700 (PDT)
From: vanusuri@mvista.com
To: openembedded-core@lists.openembedded.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [OE-core][kirkstone][PATCH v2 3/4] curl: patch CVE-2026-3783
Date: Sat, 21 Mar 2026 15:17:22 +0530
Message-Id: <20260321094723.273058-3-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260321094723.273058-1-vanusuri@mvista.com>
References: <20260321094723.273058-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 21 Mar 2026 09:47:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233654

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2026-3783-pre1.patch is dependency patch for CVE-2026-3783.patch

cherry picked from upstream commit:
https://github.com/curl/curl/commit/d7b970e46ba29a7e558e21d19f485977ffed6266
https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877

Reference: https://curl.se/docs/CVE-2026-3783.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++++++
 .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 3 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch b/meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
new file mode 100644
index 0000000000..746e5d9ab6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
@@ -0,0 +1,66 @@
+From d7b970e46ba29a7e558e21d19f485977ffed6266 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 29 Apr 2022 22:56:47 +0200
+Subject: [PATCH] http: move Curl_allow_auth_to_host()
+
+It was mistakenly put within the CURL_DISABLE_HTTP_AUTH #ifdef
+
+Reported-by: Michael Olbrich
+Fixes #8772
+Closes #8775
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/d7b970e46ba29a7e558e21d19f485977ffed6266]
+CVE: CVE-2026-3783 #Dependency Patch
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ lib/http.c | 30 +++++++++++++++---------------
+ 1 file changed, 15 insertions(+), 15 deletions(-)
+
+diff --git a/lib/http.c b/lib/http.c
+index 0d5c449bc72a..b215307dcaaa 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -651,6 +651,21 @@ CURLcode Curl_http_auth_act(struct Curl_easy *data)
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
+@@ -775,21 +790,6 @@ output_auth_headers(struct Curl_easy *data,
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
diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 0000000000..769198d688
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,157 @@
+From e3d7401a32a46516c9e5ee877e613e62ed35bddc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 6 Mar 2026 23:13:07 +0100
+Subject: [PATCH] http: only send bearer if auth is allowed
+
+Verify with test 2006
+
+Closes #20843
+
+Curl_auth_allowed_to_host() function got renamed from
+Curl_allow_auth_to_host() by the commit
+https://github.com/curl/curl/commit/72652c0613d37ce18e99cca17a42887f12ad43da
+
+Current curl version 7.82.0 has function Curl_allow_auth_to_host()
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877]
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
+index 691091b..6acd537 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -757,6 +757,7 @@ output_auth_headers(struct Curl_easy *data,
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++	Curl_allow_auth_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index ad41a5e..e641cb8 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -221,7 +221,7 @@ test1916 test1917 test1918 \
+ \
+ test1933 test1934 test1935 test1936 test1937 test1938 test1939 \
+ \
+-test2000 test2001 test2002 test2003 test2004 \
++test2000 test2001 test2002 test2003 test2004 test2006 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2006 b/tests/data/test2006
+new file mode 100644
+index 0000000..200d30a
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
++<data crlf="headers">
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
++<data2 crlf="headers">
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
++<datacheck crlf="headers">
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
++<protocol crlf="headers">
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
+2.25.1
+
diff --git a/meta/recipes-support/curl/curl_7.82.0.bb b/meta/recipes-support/curl/curl_7.82.0.bb
index 0e107f1e75..f50af1d472 100644
--- a/meta/recipes-support/curl/curl_7.82.0.bb
+++ b/meta/recipes-support/curl/curl_7.82.0.bb
@@ -73,6 +73,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2025-14524.patch \
            file://CVE-2026-1965-1.patch \
            file://CVE-2026-1965-2.patch \
+           file://CVE-2026-3783-pre1.patch \
+           file://CVE-2026-3783.patch \
            "
 SRC_URI[sha256sum] = "0aaa12d7bd04b0966254f2703ce80dd5c38dbbd76af0297d3d690cdce58a583c"
 
-- 
2.25.1


