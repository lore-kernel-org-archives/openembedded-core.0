Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64F39FF5126
	for <webhook@archiver.kernel.org>; Tue,  7 Apr 2026 16:16:35 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.85283.1775578589386580380
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Apr 2026 09:16:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=a4pDfmdb;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48896199cbaso47056055e9.1
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 09:16:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1775578587; x=1776183387; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mHQ/4LWJhGkDYCDuIEIGCpAaK6+07wKzkT6vBVw3cXE=;
        b=a4pDfmdbb79C0hQSXEj/3VCsjEzRqMLZJ6S0qJOJuVU36ymAeeugFI0DgDH8n7xfU9
         hDR019GqwzRNDBckrEzDS6BMl78FQPBDZMq/BY84TXPJuTBx4nqPR+Um4ze5dcD4VFdc
         LelU3cl2xnndsddpzRT8LTfdDAGpqi8jFwTjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578587; x=1776183387;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mHQ/4LWJhGkDYCDuIEIGCpAaK6+07wKzkT6vBVw3cXE=;
        b=efvUxYS4yVegyqgLD9gD6iku5ukofJFnDr37wzvztroyI+lKt7LaJayrSV6cpzNIw9
         Pv0FHiD2J4T+/IKKcVcErn89apGo70RzG07UWowfges+0UOqTX3RKuPGSsde70FzD44m
         xEaHwxbPeoBES/dz1e3tQfbMhKZ94CTYfCJ7+oiFfc3EGzK7/71HjhpRcHNq3TRLzIbd
         23/bJXAcJUgCI8qkarHrMwMTuEwluyJ3AL3l6m6EviDDI/qi4rtZVjAVd2lPbE0tZ+mL
         +S0WMk4eya7PuYh/NuoftmAeKaPOq6/E8oUYV1g1twZ3k1irAuwRnMnUbkTU145BtTBB
         eBEw==
X-Gm-Message-State: AOJu0YzcNoHwFJaeJDmzcWlCU54ubWLF4DPgfytldT+LQ/Hqp13Xl7fz
	vNEN4RFWZM5+CTfVPxEgcQ96V7//OKylpC79qPBnXgSY2ojjklNiF2cHyyxxe6UDSD90DVy8pQ3
	/qZUlASo=
X-Gm-Gg: AeBDiesvYOSzraJgQQWHIt3JxV0ev0SrV0z8w0ww90OZi2wZnBCP43D2BK21ArZTDZq
	bedhcKBmJfLBtaVckkDxKrXkk38Y8cEmjyselyLob9GgGc4QRk4aTpVPL4q2SeWL32WJjA9lAmH
	NPQZMC/Qmt2apDzlI+PizvTMupMCWnMm6O1AAYi2XguKfDc3W+c7OcmR088TsXbWWgM0tO2L5/w
	CRICtkFijUORf0HeRCTu6lBgoKQWQOxxv3th2+dRW7cTm3Y7KqgBdjnnYcQYXvg+T/AsU+z5yFW
	p5K42SwUpgRD81HRJAnrlZU+Axf6uWtxg9x2cbLSSV5wPH37NmmwXM+gHJUVihMjU7nsLegEtxW
	CR+9J6NTREYDISLc0UbzlIS7++gicQ5T317r3ClEgJjTxvzbhYnn4dSDbA6JGn2vowek0NR0njI
	iDRI2GDGj72C77IEHYnnEkH5FlCzxLP3DKdFYKTc3eZDFgOxW5j/XLRaRABrMtRxYfooSg+LZNm
	VAJZi51TROSUEOF3r4gJUMADR6B7NjhsjNh08A=
X-Received: by 2002:a05:600c:8b33:b0:485:3fa9:358c with SMTP id 5b1f17b1804b1-488997b2291mr275686795e9.17.1775578587453;
        Tue, 07 Apr 2026 09:16:27 -0700 (PDT)
Received: from FRSMI25-LASER.home (2a01cb001331aa003bbe8013556e3516.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:3bbe:8013:556e:3516])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488c4b57febsm1195665e9.4.2026.04.07.09.16.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 09:16:27 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone v3 16/19] curl: patch CVE-2026-3783
Date: Tue,  7 Apr 2026 18:15:53 +0200
Message-ID: <a904e52def0a789ce20f58bcbf2edd7b762c1c1e.1775578386.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775578386.git.yoann.congal@smile.fr>
References: <cover.1775578386.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Apr 2026 16:16:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234769

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
 

