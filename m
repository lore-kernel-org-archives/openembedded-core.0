Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87796F36B84
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 23:11:40 +0000 (UTC)
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.145073.1775776290263508999
 for <openembedded-core@lists.openembedded.org>;
 Thu, 09 Apr 2026 16:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=AkSV4KoP;
 spf=pass (domain: smile.fr, ip: 209.85.128.66, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-4887fd35e60so9749795e9.2
        for <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 16:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775776288; x=1776381088; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHQ/4LWJhGkDYCDuIEIGCpAaK6+07wKzkT6vBVw3cXE=;
        b=AkSV4KoPWBlh82eunr/5TW+ufUuZKoYcZ/eWeWrRlCSbZIK/1/FSvx4FldNeITvwl6
         vNUlO466gRf2PHOjJjhTCoGEQdC0450mh0BRZh8cr7ro8gHVcburSg+pvK2BLPjejo4v
         5MK9+Q19ml0UN0gSdbnV8VzzLH10dLuS6I2tA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775776288; x=1776381088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHQ/4LWJhGkDYCDuIEIGCpAaK6+07wKzkT6vBVw3cXE=;
        b=IgFJiXmg4PzmH92M87lU7v1TWkqbA5TptbvzmEIaG6HuJ+EoXXVPMveaQV9gTVhQkm
         yVI0dI9uIx7RtOvsaRKrRruouN+d0KTHQo8bW+6l7KJ9hTMOALQBS5fJpVSpy3szXtBO
         SzJfGkjMJbKoT44nmAhl7NO19lZAj/S1F8Fm25N7lcJrXVvfKIQN9K/Bk1OsG1m3HLkD
         LskG+yf9n4Opa03lOwvpNFtWvM1SDW+BWEjH7+bzagRMjbnAdrthMGIWSWATVKSLUWZX
         J5nTxEBEavXrRyoSJ7YcsFy/usNsEMdsz7kLiihKftqbasDpY2IZxx/hpMtLc8O/HRec
         5FgA==
X-Gm-Message-State: AOJu0YzKjXxIiXfwEZqvwbsUFH437JW59cUCEjz5SqwmXxtunPQHj1AQ
	9mTfOOnQZ8QtGwICu1pLSNnD69v8XaOcBgRZ17DURgHcPKNz87VYz+S4B2zZnt3wo2QY8o36cfS
	hLDW5lUL9m+oU
X-Gm-Gg: AeBDiev/8QLbTYW7s6iYf9+GLRkob1hXdaM4IvBHefgdgd6oD06Piv8zkRrIEDj1h7K
	rVN6ex3tn70G3V3FBmJZrAePjCftNtmD0kqit9Z02k9iopLglE4Cqh3D/+Q6ribxqBm9GkMncwI
	1xk9JV8NCrxh53AehxmntAjewPHjYcl9RdeDzWZ9uqbzNvLJlzLLqzxvmKiua/XVZEru89YQzhi
	dRG7WFxyhfiy993zMUhncx2ypgteaTXnbKQXdO+O/rEuHto7DIpyRtH7QXb3Ax9Sf28AHHB1g9L
	gtrlC+1+Rg1YT3UxGQoTN75KO1dx3fanRHCbpYsGvvIOr8TLLVpuAEx+mVNuodiEbUgc/4rTjiv
	I0/qeGDMwkJSAs1ey1i2FJYNMF9bfgpdgxmGC4U7rqhnpehb7gOM7b0+Ib+4e31XrGTNulB0Q+G
	oWiWRIMBQaFWgsSNVRNHWhBnXTsxU7JOcxwrmL9f0zI3mt3TUABpbXGWxC0R1rUbEDQeYxr/wo9
	i8VA3V4d4TQjA64nyaX8Rh/GeoMaOyJ0D48fU0=
X-Received: by 2002:a05:600d:d:b0:488:9e43:9690 with SMTP id 5b1f17b1804b1-488d67dbf4amr7513785e9.10.1775776288385;
        Thu, 09 Apr 2026 16:11:28 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa00af4acfc73fc9518a.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:af4a:cfc7:3fc9:518a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488d67e685csm7708855e9.6.2026.04.09.16.11.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 16:11:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v4 16/30] curl: patch CVE-2026-3783
Date: Fri, 10 Apr 2026 01:10:16 +0200
Message-ID: <a904e52def0a789ce20f58bcbf2edd7b762c1c1e.1775775155.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775775154.git.yoann.congal@smile.fr>
References: <cover.1775775154.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 09 Apr 2026 23:11:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234975

From: Vijay Anusuri <vanusuri@mvista.com>

CVE-2026-3783-pre1.patch is dependency patch for CVE-2026-3783.patch

cherry picked from upstream commit:
https://github.com/curl/curl/commit/d7b970e46ba29a7e558e21d19f485977ffed6266
https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877

Reference: https://curl.se/docs/CVE-2026-3783.html

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-3783-pre1.patch        |  66 ++++++++
 .../curl/curl/CVE-2026-3783.patch             | 157 ++++++++++++++++++
 meta/recipes-support/curl/curl_7.82.0.bb      |   2 +
 3 files changed, 225 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch b/meta/recipes-support/curl/curl/CVE-2026-3783-pre1.patch
new file mode 100644
index 00000000000..746e5d9ab6c
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
index 00000000000..769198d6883
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
index 0e107f1e753..f50af1d4722 100644
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
 

