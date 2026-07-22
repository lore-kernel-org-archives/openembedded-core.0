Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD33C531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 17:24:10 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.5467.1784741048077849641
 for <openembedded-core@lists.openembedded.org>;
 Wed, 22 Jul 2026 10:24:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=dPqzHvy9;
 spf=pass (domain: smile.fr, ip: 209.85.128.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-495635a85d2so27814975e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 10:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1784741046; x=1785345846; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=s5U72hCelqwwH0R1XRJ6k0zGPeqO/dneePdOID4oNlU=;
        b=dPqzHvy9GLYxXbvC7QscaJ1Oq0kD9nKQnmlK4YgKNsUbhCDRHE2hmEI84TlKfVFkAo
         zS1EqqPuorqTsA3C+R1PcMXxAhPvq+Ek1/mwKuvyWmMQ4/p68MpWSelV2F0iIf9b3m2o
         oAIFml1Py3zBSiVKkbq8Zx+Fl8Pxy/Dg4i2Mw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784741046; x=1785345846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=s5U72hCelqwwH0R1XRJ6k0zGPeqO/dneePdOID4oNlU=;
        b=LJGX+pSKxrTvUd7Zo/JMmJSDaRCtY0c3i+tRu0p7VwLAjlFJtuWu4WIlUchGH74EVf
         N/WPN3SD9ilI13hxTa2ZXLBk5edkXvEEHrmmU9QK44HPR4izXqchGgwn1bioEzrlVNcJ
         sx4RSDOHDEkZy3zKld9HXlkcLiDuYu5CbA2k5BjEhcDzjemypjn+TSjaDd60OHJNmIG6
         GIBEh8tfjc50T2S7Fk15INolNbDZeWTHW3xT5KXPpGpZJ27ETVgslIPIlEo02xlgkVpf
         ZHbkGAfxzeEa1YzDyxvM0EM14sHS2h+j2eDydU3vopekd7IkfzQ8HLiLAZ4Z7paDv+Aj
         UAuQ==
X-Gm-Message-State: AOJu0YzYuSgZZFRCtovsFJHYjFQak/0ihscOpoWiH6D+8z//4HIrWfbw
	K05NdSzVZvG1h2M4+dzjlecCNZJqf9q/M7VYuAhtIyFvW3sicZBwYTmjYwaTZEPwJuUw6yIFpi6
	RA8B7xD4=
X-Gm-Gg: AR+sD10rHbbC30VOxPY4zlnaO33PaC1eqZ6VhcECwC+7cpqwH+sI3bcPXRAwoBeUdz3
	pOhMz7o+/zVUGjOD/frzhBvsfTnzLnt0ERFRaKrPjFH5H7P8iP29U79piooq2nDWFbutZRbCQwC
	Rv9kPsur+zTMgylEoeM3ig4NT8KD6ASALJXQmpNI0pSaNKlCDn2w9qvl2vWNq/UvG2rkWkw+Gpq
	qPvMn0bJwVTw2p/W5A2oRSqciKTWJCpzK0PwHopGMpN70w7RXoq8LGz/b2YEYbZ7EOtyPTmjlfc
	JjoaNarAI2Rc6Kjne19R/55IBEIxuFLraphxkye/n+P+x+Glh84oCbz/oGgLH7Y/yznWPxPvofX
	H2gZGHaOUGRuFdbLvVC6T1v2yMNrA64W91d44KwMBsgTJeA8bTJ7mIYZTZQycDt7W3+yX4I2Zpz
	2lcyvz1JGgEMa4aWnPPX49dNEHzCpedfsSP9b4lkrZcaskmmOiEQ4ZW4iojdMPvClZsqeJ8YJ/J
	nU8mm9ZMkEALXLjAYh1b84=
X-Received: by 2002:a05:600c:b85:b0:495:5365:c0d1 with SMTP id 5b1f17b1804b1-49553d85ea0mr229285005e9.14.1784741046188;
        Wed, 22 Jul 2026 10:24:06 -0700 (PDT)
Received: from FRSMI25-LASER.idf.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-495653c8760sm148275275e9.14.2026.07.22.10.24.05
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 10:24:05 -0700 (PDT)
From: Yoann Congal <yoann.congal@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose 15/27] curl: fix CVE-2026-6253
Date: Wed, 22 Jul 2026 19:23:28 +0200
Message-ID: <31dac2d3108bf2b86ba7e349123351742ac6effb.1784740870.git.yoann.congal@smile.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1784740870.git.yoann.congal@smile.fr>
References: <cover.1784740870.git.yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 22 Jul 2026 17:24:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241725

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for the proxy credential leak on redirect
described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f
[2] https://curl.se/docs/CVE-2026-6253.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6253

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 .../curl/curl/CVE-2026-6253.patch             | 389 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 390 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6253.patch b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
new file mode 100644
index 00000000000..0e7dd72612a
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
@@ -0,0 +1,389 @@
+From 188c2f166a20fa97c2325b2da7d0e5cecc13725f Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 13 Apr 2026 17:17:23 +0200
+Subject: [PATCH] http: clear the proxy credentials as well on port or scheme
+ change
+
+Add tests 2009-2011 to verify switching between proxies with credentials
+when the switch is driven by a redirect
+
+Reported-by: Dwij Mehta
+
+Closes #21304
+
+CVE: CVE-2026-6253
+Upstream-Status: Backport [https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f]
+
+Backport Changes:
+- Adapted the redirect credential reset hunk to curl 8.19.0 Curl_http_follow() after the existing wrynose CVE-2026-6276 backport.
+- Adapted tests/data/Makefile.am placement for the wrynose test list.
+
+(cherry picked from commit 188c2f166a20fa97c2325b2da7d0e5cecc13725f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/http.c             | 12 +++++++
+ lib/transfer.c         | 51 +++++++++++++++++++++---------
+ lib/transfer.h         |  2 ++
+ tests/data/Makefile.am |  1 +
+ tests/data/test2009    | 70 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test2010    | 71 ++++++++++++++++++++++++++++++++++++++++++
+ tests/data/test2011    | 70 +++++++++++++++++++++++++++++++++++++++++
+ 7 files changed, 262 insertions(+), 15 deletions(-)
+ create mode 100644 tests/data/test2009
+ create mode 100644 tests/data/test2010
+ create mode 100644 tests/data/test2011
+
+diff --git a/lib/http.c b/lib/http.c
+index 7ebbdfa..b960d79 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1252,12 +1252,24 @@ CURLcode Curl_http_follow(struct Curl_easy *data, const char *newurl,
+         curlx_free(scheme);
+       }
+       if(clear) {
++        CURLcode result = Curl_reset_userpwd(data);
++        if(result) {
++          curlx_free(follow_url);
++          return result;
++        }
+         Curl_safefree(data->state.aptr.user);
+         Curl_safefree(data->state.aptr.passwd);
+       }
+     }
+   }
+   DEBUGASSERT(follow_url);
++  {
++    CURLcode result = Curl_reset_proxypwd(data);
++    if(result) {
++      curlx_free(follow_url);
++      return result;
++    }
++  }
+
+   if(type == FOLLOW_FAKE) {
+     /* we are only figuring out the new URL if we would have followed locations
+diff --git a/lib/transfer.c b/lib/transfer.c
+index 6dd2f52..af5bee2 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -439,6 +439,40 @@ void Curl_init_CONNECT(struct Curl_easy *data)
+   data->state.upload = (data->state.httpreq == HTTPREQ_PUT);
+ }
+
++/*
++ * Restore the user credentials to those set in options.
++ */
++CURLcode Curl_reset_userpwd(struct Curl_easy *data)
++{
++  CURLcode result;
++  if(data->set.str[STRING_USERNAME] || data->set.str[STRING_PASSWORD])
++    data->state.creds_from = CREDS_OPTION;
++  result = Curl_setstropt(&data->state.aptr.user,
++                          data->set.str[STRING_USERNAME]);
++  if(!result)
++    result = Curl_setstropt(&data->state.aptr.passwd,
++                            data->set.str[STRING_PASSWORD]);
++  return result;
++}
++
++/*
++ * Restore the proxy credentials to those set in options.
++ */
++CURLcode Curl_reset_proxypwd(struct Curl_easy *data)
++{
++#ifndef CURL_DISABLE_PROXY
++  CURLcode result = Curl_setstropt(&data->state.aptr.proxyuser,
++                                   data->set.str[STRING_PROXYUSERNAME]);
++  if(!result)
++    result = Curl_setstropt(&data->state.aptr.proxypasswd,
++                            data->set.str[STRING_PROXYPASSWORD]);
++  return result;
++#else
++  (void)data;
++  return CURLE_OK;
++#endif
++}
++
+ /*
+  * Curl_pretransfer() is called immediately before a transfer starts, and only
+  * once for one transfer no matter if it has redirects or do multi-pass
+@@ -584,23 +618,10 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+
+-  if(data->set.str[STRING_USERNAME] ||
+-     data->set.str[STRING_PASSWORD])
+-    data->state.creds_from = CREDS_OPTION;
+   if(!result)
+-    result = Curl_setstropt(&data->state.aptr.user,
+-                            data->set.str[STRING_USERNAME]);
++    result = Curl_reset_userpwd(data);
+   if(!result)
+-    result = Curl_setstropt(&data->state.aptr.passwd,
+-                            data->set.str[STRING_PASSWORD]);
+-#ifndef CURL_DISABLE_PROXY
+-  if(!result)
+-    result = Curl_setstropt(&data->state.aptr.proxyuser,
+-                            data->set.str[STRING_PROXYUSERNAME]);
+-  if(!result)
+-    result = Curl_setstropt(&data->state.aptr.proxypasswd,
+-                            data->set.str[STRING_PROXYPASSWORD]);
+-#endif
++    result = Curl_reset_proxypwd(data);
+
+   data->req.headerbytecount = 0;
+   Curl_headers_cleanup(data);
+diff --git a/lib/transfer.h b/lib/transfer.h
+index 05a5f89..131e31a 100644
+--- a/lib/transfer.h
++++ b/lib/transfer.h
+@@ -31,6 +31,8 @@ char *Curl_checkheaders(const struct Curl_easy *data,
+
+ void Curl_init_CONNECT(struct Curl_easy *data);
+
++CURLcode Curl_reset_userpwd(struct Curl_easy *data);
++CURLcode Curl_reset_proxypwd(struct Curl_easy *data);
+ CURLcode Curl_pretransfer(struct Curl_easy *data);
+
+ CURLcode Curl_sendrecv(struct Curl_easy *data);
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index da0f8f5..00a5221 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -244,6 +244,7 @@ test1970 test1971 test1972 test1973 test1974 test1975 test1976 test1977 \
+ test1978 test1979 test1980 test1981 \
+ \
+ test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
++test2009 test2010 test2011 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2009 b/tests/data/test2009
+new file mode 100644
+index 0000000..d2fd79e
+--- /dev/null
++++ b/tests/data/test2009
+@@ -0,0 +1,70 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++http_proxy
++</keywords>
++</info>
++# Server-side
++<reply>
++<connect>
++HTTP/1.1 407 Denied
++
++</connect>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 4
++Content-Type: text/html
++Location: https://another.example/%TESTNUMBER0002
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++https
++</server>
++<name>
++proxy credentials via env variables, redirect from http to https
++</name>
++
++<setenv>
++http_proxy=http://user:secret@%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPORT/
++</setenv>
++<command>
++http://somewhere.example/ --follow --proxy-insecure
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://somewhere.example/ HTTP/1.1
++Host: somewhere.example
++Proxy-Authorization: Basic %b64[user:secret]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++CONNECT another.example:443 HTTP/1.1
++Host: another.example:443
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</protocol>
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/data/test2010 b/tests/data/test2010
+new file mode 100644
+index 0000000..443ae9d
+--- /dev/null
++++ b/tests/data/test2010
+@@ -0,0 +1,71 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++http_proxy
++</keywords>
++</info>
++# Server-side
++<reply>
++<connect>
++HTTP/1.1 407 Denied
++
++</connect>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 4
++Content-Type: text/html
++Location: https://another.example/%TESTNUMBER0002
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++https
++</server>
++<name>
++proxy credentials via options for two proxies, redirect from http to https
++</name>
++
++<setenv>
++http_proxy=http://%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPORT/
++</setenv>
++<command>
++--proxy-user batman:robin http://somewhere.example/ --follow --proxy-insecure
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://somewhere.example/ HTTP/1.1
++Host: somewhere.example
++Proxy-Authorization: Basic %b64[batman:robin]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++CONNECT another.example:443 HTTP/1.1
++Host: another.example:443
++Proxy-Authorization: Basic %b64[batman:robin]b64%
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</protocol>
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/data/test2011 b/tests/data/test2011
+new file mode 100644
+index 0000000..dd4e534
+--- /dev/null
++++ b/tests/data/test2011
+@@ -0,0 +1,70 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP proxy
++http_proxy
++</keywords>
++</info>
++# Server-side
++<reply>
++<connect>
++HTTP/1.1 407 Denied
++
++</connect>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Server: test-server/fake
++Content-Length: 4
++Content-Type: text/html
++Location: https://another.example/%TESTNUMBER0002
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++https
++</server>
++<name>
++proxy creds via env, cross-scheme redirect, --location-trusted
++</name>
++
++<setenv>
++http_proxy=http://user:secret@%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPORT/
++</setenv>
++<command>
++http://somewhere.example/ --location-trusted --proxy-insecure
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://somewhere.example/ HTTP/1.1
++Host: somewhere.example
++Proxy-Authorization: Basic %b64[user:secret]b64%
++User-Agent: curl/%VERSION
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++CONNECT another.example:443 HTTP/1.1
++Host: another.example:443
++User-Agent: curl/%VERSION
++Proxy-Connection: Keep-Alive
++
++</protocol>
++<errorcode>
++7
++</errorcode>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 558a2d311e4..b1ee0f8b9ba 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2026-5773.patch \
     file://mbedtls.patch \
     file://CVE-2026-5545.patch \
+    file://CVE-2026-6253.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

