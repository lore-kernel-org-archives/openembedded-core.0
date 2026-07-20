Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19AAFC4452B
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 10:57:18 +0000 (UTC)
Received: from rcdn-iport-3.cisco.com (rcdn-iport-3.cisco.com [173.37.86.74])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6477.1784545028153998101
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 03:57:08 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=F4z7mXpi;
 spf=pass (domain: cisco.com, ip: 173.37.86.74, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11567; q=dns/txt;
  s=iport01; t=1784545028; x=1785754628;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=vYbshUytWtokkh1wTlagWMJFNXydc0W3WAIpTAHzY1E=;
  b=F4z7mXpiLetxsiHVa1BIJ6k7XrZdvEVOUZPQnuJJn1Vj8XBLs+uJJKrG
   MqqoM9dO1kA2yrPVUkCjotm9dZxcg1vNfpDcMk5fsoCDB/AGaVYuQpVlT
   hH9FGpkmg2TIx0eC2MGJG5L9tkRKEI2U/Kj9hdfD0V3ujBhWGLpaLIZss
   V5n7Z1PkhhR/B47hHI8wK5/GzQKezbvODqp9q5wGINrIkrhijmRMJOi/K
   pVyjMfPXyaL8QgT9fY5n0A/ewxJyhhFz+EE9/jFY2alnuJfD20XVSmkU5
   SmEhiX1Kr85X/yApcN1tEMDLXsfAlP+ksf1topwLjXtEgqbvAHB1dUc5X
   Q==;
X-CSE-ConnectionGUID: Cn8uVKnVRiC0bUl1QWQuAA==
X-CSE-MsgGUID: uZUcLC3QQ5yREDLP9fQxdg==
X-IPAS-Result: =?us-ascii?q?A0BIAgBG/l1q/43/Ja1aHgEBCxIMggULgld0X0JJlCmCI?=
 =?us-ascii?q?QOeGxSBag8BAQEPRA0EAQGFBQKNUwImNAkOAQIEAwIDAQEBAQEBAQEBAQELA?=
 =?us-ascii?q?QEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBPRwDAQIvKyMIEAEIgwIBgnQDE?=
 =?us-ascii?q?Qa8PoF5M4EBgygBMQUJAgJAAVDbLgELFAGBOIU/iCBcGAGEfCcbG4FyhH6BB?=
 =?us-ascii?q?YFcAQEBgUYBhl0EgiKBDIFaghuNd0iBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgTqBAoR3Ix8DOX+BMHVKdy1qEheBJoNLAgcDCxgNSBEsN?=
 =?us-ascii?q?xQZBD5uB408I4I+AWEkCQEHIgEBgSBiCTILHpJoMJADgh6BOJ9aCiiDdYwhl?=
 =?us-ascii?q?ToaM4VbpRGZCI4KlWhohGmBaDyBRwsHcBU7gmcJFjQZD44tCwuBeIFogX+EQ?=
 =?us-ascii?q?cVWPDUCCTIBAQcCBw4DC4FokX4BAQ?=
IronPort-Data: A9a23:ecfJja5DJT+czqeCug8MRAxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jcWUWmPOvqOMWagKth2advjoB8C6JDWy9BmHQVo/ykwZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/qUzBHf/g2Qqaj1Os/rfwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eFotI59hUB1909
 NdAIg0JNym8vv+f6efuIgVsrpxLwMjDJogTvDRkiDreF/tjGcyFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkEWUrsUIMpWcOOAinTyaTREqFW9rqss6G+Vxwt0uFToGIeMIYbSGZgOwy50o
 ErbzVnyJjpBDeXC2ACo3laU1+H2jS/0Ddd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBYCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:Vay5da7m2dPeCzbLWgPXwOTXdLJyesId70hD6qkXc20wTiX2ra
 6TdZgguCMczQxhO03I+urwXZVoP0m8yXcd2+B4Vt2ftUvdyQmVxepZgrcKrQeNJ8SHzI5g/J
 YlVbRiA9vtClU/p8P77A6kV+sE+rC8gceVbSO09QYVcemsAJsQiTtENg==
X-Talos-CUID: =?us-ascii?q?9a23=3AM/ON7ms7mMdZ3IhmeIP4L61+6IsOdC3A8lTWHXW?=
 =?us-ascii?q?5Ij5jdbnMcGCp5YpNxp8=3D?=
X-Talos-MUID: =?us-ascii?q?9a23=3A9ejFyQzkpO0gK/mI3EHxsNVa4UyaqLmcNUspus4?=
 =?us-ascii?q?/gpSVDwFcHw/Mgg2nToByfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="513204535"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 10:57:07 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id C0E9D18000193
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:06 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id E0DEACC037D; Mon, 20 Jul 2026 16:27:04 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 3/5] curl: fix CVE-2026-6253
Date: Mon, 20 Jul 2026 16:26:45 +0530
Message-Id: <20260720105647.2451180-3-deeratho@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260720105647.2451180-1-deeratho@cisco.com>
References: <20260720105647.2451180-1-deeratho@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: VERIFIED;bgl-ads-3413.cisco.com [173.39.60.50];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 173.39.60.50, bgl-ads-3413.cisco.com
X-Outbound-Node: rcdn-l-core-04.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241355

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] for the proxy credential leak on redirect
described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f
[2] https://curl.se/docs/CVE-2026-6253.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6253

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-6253.patch             | 389 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 390 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6253.patch b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
new file mode 100644
index 0000000000..0e7dd72612
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
index 558a2d311e..b1ee0f8b9b 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -18,6 +18,7 @@ SRC_URI = " \
     file://CVE-2026-5773.patch \
     file://mbedtls.patch \
     file://CVE-2026-5545.patch \
+    file://CVE-2026-6253.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


