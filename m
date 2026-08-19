Return-Path: <fabien.thomas@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ABFEC5DF94
	for <webhook@archiver.kernel.org>; Wed, 19 Aug 2026 15:58:03 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10410.1787155072460576737
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Aug 2026 08:57:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=iJdbesxy;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: fabien.thomas@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4998590d392so11241835e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 08:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1787155071; x=1787759871; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=z6Ho0g60tTJwMWTe6sUvMgPnzSayI0FUmb1OwzRLBUk=;
        b=iJdbesxy4bhIaurPbP2ck7HeC8+H0rZh0bPcP9eM2EN+jqDOTVuhQvDHE+ga1SzAE4
         huIxgSe0M/1V54hGG3iPS2Mun2bAbIY59Qn909ACH2HBNpS7pWJznsNe4/SXiYUbxKAw
         HcsWd+HCX6n6MvGyaubSMwbBSBO3bT3bmBmgY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787155071; x=1787759871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=z6Ho0g60tTJwMWTe6sUvMgPnzSayI0FUmb1OwzRLBUk=;
        b=jhiS0ScchHirXz4IxPNbCTtueOvWy3IEh+zxtiCc420HqxdECYvWEoLmU9+Z4oStzm
         hZzDuWXYUv1WECvyvOWk2b3Msk7TM/DsKVd475lMDDv8+0D6XjTZ6z6znr1Rc15qUAFm
         engmxCANIIEr9uBQqAB4cDjfZlS1OcGsTjNRauOpiHthPc9sJpInZVDlq6qDWf/6iYu4
         qr/3OJJx4B6EST+fi8AolYlkif5pO9oz9kxUPHJRMpaDnzzY8gT1oTui4q2v6f9Mx8Vm
         l6Qfh3KYQqVq6gCYoBPcBXfXPt5uEbhlvZkfPdZB26dmNNlmyyj8HLlwBSSlT9/lNv92
         sVfw==
X-Gm-Message-State: AOJu0YwZP4Lz/ymi/RilugZO5n8sgC27EzGYFnrPhFto3enCSJ3xvWwk
	8kWCIXCkIdX12AVNLLKImTGnFIyUEuLceSaZ9pI+ucQiqaTySqBM39pzPHoS+lrzJSgZa55c7Gw
	+AGcFn1k=
X-Gm-Gg: AR+sD12iITIoP1gqikvJ9B6BXFja1PM39TVxfqimU4Inf+9GKUvB/sPNpuIeq/gkVSj
	K3RpXtD2qAJWufLYSYynFg2f12+RSWHxCfIEbKSY2bS8nH0X7+g1Xh45EDOl5YBE9vDX9rFwBif
	wyr62HeVOsWmGwW6AsRLVmGOTmnBHYDE4mHVHNaaAomqmmN4FPFojDOkXlWz32RajBr5zYTSeK6
	NcXQ13RKjFcmo3Ggqvn4yQZj1lAPfeQJTmTcX+/ofJqzPWkc8+QUOljrn96RInnpRTyn5E6CHnU
	9idL6d+UZGSV596jcXiLWIhXfx+/EE/Ajfbxe1arZi+miLrhvDPyN4aTzZC0y7QcWUbNr+IBnm6
	nYIVzOtepWeMXcFOOmnhuUDdX+Uw5CBi0xnt1ZmZJfz71FMcIRJGEDej3WgWhvAGs5PPowzfBqy
	mClDsUPAKbHVE5rZZBS0Ee6HryS7y+J3H8IaDTN3JmnKgL1v641aQWXdhr7NtJLIhdLuemu7jV2
	BoNceEfRxXB+VkqnUB66wgH97NkdUIJ+ejl8l9TwYqbwpl8zwzsV60rViGp5LFu1B+xE8R8Px26
	o/2dj2/kZGtK4282WgUfvmalIs8B3xN/GKgDaA1q
X-Received: by 2002:a05:600c:a412:b0:499:ae94:be05 with SMTP id 5b1f17b1804b1-499ae94be48mr64724575e9.0.1787155070710;
        Wed, 19 Aug 2026 08:57:50 -0700 (PDT)
Received: from FRSMI25-GIGUE (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14d05a6sm7215698f8f.35.2026.08.19.08.57.50
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 08:57:50 -0700 (PDT)
From: Fabien Thomas <fabien.thomas@smile.fr>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 21/37] curl: fix CVE-2026-6253
Date: Wed, 19 Aug 2026 17:56:52 +0200
Message-ID: <976f0097172ff5b04b4a72dc8488e6b75ff2ef9c.1787154074.git.fabien.thomas@smile.fr>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1787154074.git.fabien.thomas@smile.fr>
References: <cover.1787154074.git.fabien.thomas@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Aug 2026 15:58:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/243757

From: Deepak Rathore <deeratho@cisco.com>

This patch applies the upstream backport for CVE-2026-6253.
The upstream fix commit is referenced in [1], and the public
CVE advisory is referenced in [2].

[1] https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f
[2] https://curl.se/docs/CVE-2026-6253.html

(From OE-Core rev: 21a929291fddb4f7c874609f6d5293477fb74ad9)

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
Signed-off-by: Fabien Thomas <fabien.thomas@smile.fr>
---
 .../curl/curl/CVE-2026-6253.patch             | 392 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6253.patch b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
new file mode 100644
index 00000000000..956beac27bb
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
@@ -0,0 +1,392 @@
+From eb175878ffa07392d6654127f3d4637d4d335c78 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 5 Jun 2026 01:18:43 -0700
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
+- The upstream lib/http.c hunk adds the credential resets to
+  Curl_http_follow(). curl-8.7.1 predates that protocol-specific redirect
+  handler and carries the equivalent logic in lib/transfer.c via
+  Curl_follow(), so the full upstream lib/http.c hunk was adapted there.
+- The upstream Curl_reset_proxypwd() helper includes a CURL_DISABLE_PROXY
+  fallback. In curl-8.7.1, the proxy credential fields and string slots are
+  unconditional and the pre-existing code accesses them without that guard,
+  so this backport retains the target-version behavior instead.
+- curl-8.7.1 uses tests/data/Makefile.inc instead of the upstream
+  tests/data/Makefile.am list.
+
+(cherry picked from commit 188c2f166a20fa97c2325b2da7d0e5cecc13725f)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/transfer.c          | 56 ++++++++++++++++++++++++--------
+ lib/transfer.h          |  2 ++
+ tests/data/Makefile.inc |  1 +
+ tests/data/test2009     | 70 ++++++++++++++++++++++++++++++++++++++++
+ tests/data/test2010     | 71 +++++++++++++++++++++++++++++++++++++++++
+ tests/data/test2011     | 70 ++++++++++++++++++++++++++++++++++++++++
+ 6 files changed, 257 insertions(+), 13 deletions(-)
+ create mode 100644 tests/data/test2009
+ create mode 100644 tests/data/test2010
+ create mode 100644 tests/data/test2011
+
+diff --git a/lib/transfer.c b/lib/transfer.c
+index ccd042b80d..a73462928d 100644
+--- a/lib/transfer.c
++++ b/lib/transfer.c
+@@ -553,6 +553,35 @@ void Curl_init_CONNECT(struct Curl_easy *data)
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
++  CURLcode result = Curl_setstropt(&data->state.aptr.proxyuser,
++                                   data->set.str[STRING_PROXYUSERNAME]);
++  if(!result)
++    result = Curl_setstropt(&data->state.aptr.proxypasswd,
++                            data->set.str[STRING_PROXYPASSWORD]);
++  return result;
++}
++
+ /*
+  * Curl_pretransfer() is called immediately before a transfer starts, and only
+  * once for one transfer no matter if it has redirects or do multi-pass
+@@ -700,21 +729,10 @@ CURLcode Curl_pretransfer(struct Curl_easy *data)
+       return CURLE_OUT_OF_MEMORY;
+   }
+
+-  if(data->set.str[STRING_USERNAME] ||
+-     data->set.str[STRING_PASSWORD])
+-    data->state.creds_from = CREDS_OPTION;
+-  if(!result)
+-    result = Curl_setstropt(&data->state.aptr.user,
+-                            data->set.str[STRING_USERNAME]);
+-  if(!result)
+-    result = Curl_setstropt(&data->state.aptr.passwd,
+-                            data->set.str[STRING_PASSWORD]);
+   if(!result)
+-    result = Curl_setstropt(&data->state.aptr.proxyuser,
+-                            data->set.str[STRING_PROXYUSERNAME]);
++    result = Curl_reset_userpwd(data);
+   if(!result)
+-    result = Curl_setstropt(&data->state.aptr.proxypasswd,
+-                            data->set.str[STRING_PROXYPASSWORD]);
++    result = Curl_reset_proxypwd(data);
+
+   data->req.headerbytecount = 0;
+   Curl_headers_cleanup(data);
+@@ -759,6 +777,7 @@ CURLcode Curl_follow(struct Curl_easy *data,
+   bool disallowport = FALSE;
+   bool reachedmax = FALSE;
+   CURLUcode uc;
++  CURLcode result;
+
+   DEBUGASSERT(type != FOLLOW_NONE);
+
+@@ -889,12 +908,23 @@ CURLcode Curl_follow(struct Curl_easy *data,
+         free(scheme);
+       }
+       if(clear) {
++        result = Curl_reset_userpwd(data);
++        if(result) {
++          free(newurl);
++          return result;
++        }
+         Curl_safefree(data->state.aptr.user);
+         Curl_safefree(data->state.aptr.passwd);
+       }
+     }
+   }
+
++  result = Curl_reset_proxypwd(data);
++  if(result) {
++    free(newurl);
++    return result;
++  }
++
+   if(type == FOLLOW_FAKE) {
+     /* we're only figuring out the new url if we would've followed locations
+        but now we're done so we can get out! */
+diff --git a/lib/transfer.h b/lib/transfer.h
+index e65b2b1472..f1a791f1cf 100644
+--- a/lib/transfer.h
++++ b/lib/transfer.h
+@@ -31,6 +31,8 @@ char *Curl_checkheaders(const struct Curl_easy *data,
+
+ void Curl_init_CONNECT(struct Curl_easy *data);
+
++CURLcode Curl_reset_userpwd(struct Curl_easy *data);
++CURLcode Curl_reset_proxypwd(struct Curl_easy *data);
+ CURLcode Curl_pretransfer(struct Curl_easy *data);
+ CURLcode Curl_posttransfer(struct Curl_easy *data);
+
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 9fb92742ee..aafd309a9d 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -231,6 +231,7 @@ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 \
+ \
+ test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
++test2009 test2010 test2011 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2009 b/tests/data/test2009
+new file mode 100644
+index 0000000000..d2fd79e0d6
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
+index 0000000000..443ae9d2f9
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
+index 0000000000..dd4e534248
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
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 7ea5723de07..2b988654c41 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -39,6 +39,7 @@ SRC_URI = " \
     file://CVE-2026-5773.patch \
     file://CVE-2026-6276.patch \
     file://CVE-2026-5545.patch \
+    file://CVE-2026-6253.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

