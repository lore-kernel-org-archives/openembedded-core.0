Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BA1C43458
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 10:48:22 +0000 (UTC)
Received: from rcdn-iport-9.cisco.com (rcdn-iport-9.cisco.com [173.37.86.80])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.89497.1782730094892112337
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 03:48:15 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=LSzS80bD;
 spf=pass (domain: cisco.com, ip: 173.37.86.80, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11651; q=dns/txt;
  s=iport01; t=1782730094; x=1783939694;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HYL3pQuMtc1hP9tn7jAhBo+HiYuXH8xer4LAviyfHD4=;
  b=LSzS80bDysACim+X5xej1UTBL3MIhiZWX66d2Rgy+GV/5SRMWDLPwPFJ
   S2eQjOvMsF4VxGaZE6AsHA1IJeISZVlv7P5AdXdGUoQnew3WfzjfgWgsZ
   SzIRqBlvnuinqRTOSaptC/vgqsu7R1DIL4xR3g/Jb9HsATN5XvfEfdeHf
   dGyJOxUcgI7M+lLaSZT/C0C5zFl7f6LZdTiBThMmlcDl1sLutdxcNyFos
   ISVKPDLgKUtN8gjl8XPfqnJ/iQBsI0w7hidPBw7lU3H7fkYyUZpZQsh8A
   ixZ1iqEIaiHGDnwx2RUPjnOaJG2u89CMdJGj0JT5jjZCUdFX7JG1fvTt8
   g==;
X-CSE-ConnectionGUID: fKp4De3zSWuECPZzc494Ag==
X-CSE-MsgGUID: yVtaTDOURvue9PeVf9vn7Q==
X-IPAS-Result: =?us-ascii?q?A0BJAgC7TEJq/5H/Ja1aglmCV3RfQkmWSwOeGxSBag8BA?=
 =?us-ascii?q?QEPRA0EAQGFBgKNSwImNAkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHB?=
 =?us-ascii?q?YEOE4ZPDYZaAQIBAycLARgBGxIQHAMBAi8rIwgQCYMCAYJzAgERBrYYgXkzg?=
 =?us-ascii?q?QGDKAExBQkCAkABUNssAQsUAQWBM4U/iB9bGAGEfCcbG4FyhH6BBYFcAQEBg?=
 =?us-ascii?q?UYBhl0EgiKBDIFagj+McEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yHYEjPheBD?=
 =?us-ascii?q?BsHBYEdgWmBBIR9Ix8DOX+BMHVYZhUwNYECAREeCoFSJwMLGA1IESw3FBsEP?=
 =?us-ascii?q?m4HjF4XD4I8AWEkCQEHDBYBAYEgYgkyCx6SaBUBGpADgiGBNZ9aCiiDdYwhl?=
 =?us-ascii?q?ToaM4VbpRGZCI4KlWhohGiBaDyBRwsHcBU7gmcJFjQZD44tCwuBeIFogX+EQ?=
 =?us-ascii?q?cIQJDUCCTIBAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:wKTnF65iX5J8b+eQJUabjwxRtGnGchMFZxGqfqrLsTDasY5as4F+v
 jFMWTuGbPqIM2enfdwkOtvlp0lQvpeGzIBiSFNtrC8wZn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyGa/lH2dOC98RGQ7InQLpLkEunIJyttcgFtTSYlmHpLlvUw6mJSqYDR7zil5
 5Wo/6UzBHf/g2QqajxOu/rZwP9SlK2aVA0w7wRWic9j5Dcyp1FNZLoDKKe4KWfPQ4U8NoaSW
 +bZwbilyXjS9hErB8nNuu6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTaJLwXXxqZwChxLid/
 jniWauYEm/FNoWU8AgUvoIx/ytWZcWq85efSZSzXFD6I0DuKxPRL/tS4E4eM64Apsp6WnN1y
 uE1Awg/fBvf1r6fz+fuIgVsrpxLwMjDJogTvDRkiDreF/tjGcCFSKTR7tge1zA17ixMNa+BP
 IxCNnw1MUmGOkESUrsUIMpWcOOAj3X4dTJRsl+9rqss6G+Vxwt0uFToGIeNI4XQFJ4EwS50o
 ErXwXjwPj09CeaB1DfUyn+SiL7Rm3zCDdd6+LqQs6QCbEeo7msLBRsbUFG2rfW0hgu1XMhSA
 0gV4TY1668q+UqmS9PwUxG1rDiDpBF0ZjZLO/cx5AfIzu/f5ByUQzBUCDVAc9ch8sQxQFTGy
 2O0oj8gPhQ32JX9dJ5X3u78Qe+aUcTNEVI/WA==
IronPort-HdrOrdr: A9a23:hNWm1qF689hqj/j1pLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHPxOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:bL+5d2FW66QdsurpqmJp11ZINs1+YEbi0Vr7G32qAjo4FJSaHAo=
X-Talos-MUID: =?us-ascii?q?9a23=3Az0IDwQ4aQvBXkMfGYPxCPDhqxox53binNGwqrK8?=
 =?us-ascii?q?YpsTVDSFONWaDimuOF9o=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,231,1774310400"; 
   d="scan'208";a="501129397"
Received: from rcdn-l-core-08.cisco.com ([173.37.255.145])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 10:48:11 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-08.cisco.com (Postfix) with ESMTPS id A891918000455;
	Mon, 29 Jun 2026 10:48:11 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id 4F4ABCC12A8; Mon, 29 Jun 2026 03:48:11 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [scarthgap] [PATCH 4/7] curl: fix CVE-2026-6253
Date: Mon, 29 Jun 2026 03:47:54 -0700
Message-ID: <20260629104801.972184-4-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629104801.972184-1-adongare@cisco.com>
References: <20260629104801.972184-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-08.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 10:48:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239752

From: Anil Dongare <adongare@cisco.com>

Backport the upstream fix [1] for the proxy credential leak on redirect
described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f
[2] https://curl.se/docs/CVE-2026-6253.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6253

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../curl/curl/CVE-2026-6253.patch             | 391 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 392 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6253.patch b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
new file mode 100644
index 0000000000..3ad6186fef
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
@@ -0,0 +1,391 @@
+From c33bf4f354de43890aa6fd9dc52872a9f799068c Mon Sep 17 00:00:00 2001
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
+- curl-8.7.1 carries the redirect logic in lib/transfer.c via Curl_follow(),
+  so the credential reset changes were adapted there.
+- The upstream Curl_reset_proxypwd() helper also includes a
+  CURL_DISABLE_PROXY fallback hunk; that hunk is not carried in this 8.7.1
+  backport.
+- curl-8.7.1 uses tests/data/Makefile.inc instead of the upstream
+  tests/data/Makefile.am list.
+
+(cherry picked from commit 188c2f166a20fa97c2325b2da7d0e5cecc13725f)
+Signed-off-by: Anil Dongare <adongare@cisco.com>
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
+index ccd042b..a734629 100644
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
+index e65b2b1..f1a791f 100644
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
+index 9fb9274..aafd309 100644
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
+--
+2.43.7
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 705b00351f..cead7fe6d4 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -37,6 +37,7 @@ SRC_URI = " \
     file://CVE-2026-3783.patch \
     file://CVE-2026-3784.patch \
     file://CVE-2026-5545.patch \
+    file://CVE-2026-6253.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.51.0


