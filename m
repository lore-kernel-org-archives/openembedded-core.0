Return-Path: <adongare@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0626C43327
	for <webhook@archiver.kernel.org>; Mon, 29 Jun 2026 13:15:04 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.37291.1782738901069608698
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Jun 2026 06:15:01 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=accCMa6f;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: adongare@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=11572; q=dns/txt;
  s=iport01; t=1782738901; x=1783948501;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yskv/rVZGF8WK4YZgeu/Ud0NdxOBUSzlux7+cKgiZbE=;
  b=accCMa6fA/6BqBQ7KUmf6c/mmfcjZXe35lusCDhkIGYG1U93rhnSRFGX
   FF2gR+WkSwd0fAprYLKXsQIcpVDPrPILGX++pBvN7tQGvHoJd2MRNJgVl
   qlRMaXIf1NW1cK2uhSL+73Z5Y/5jlumPsnS4OGUfFQLnBR7daDdL6wRdb
   53ar6oKjT60wH3hf9vnBlSWrWwHYLzA0VlAjXBXCghkamp7p6KSf1cRqU
   0uvNt+6+DSlE0cqlm3izSOk94v5M4HFB6Jr4+a5rUOLvkArmdt1OrH1+p
   uOxGB0/TpRqmUQHdJ20c5dTRBPBvmCuZvDWXyODrwa0YOnuJE5Bc07XIa
   Q==;
X-CSE-ConnectionGUID: 1Fsg8VE4ROGU2daWGnfw8A==
X-CSE-MsgGUID: t+sDI8nzSge0AmDDytizxA==
X-IPAS-Result: =?us-ascii?q?A0BIAgCnbkJq/5X/Ja1aHgEBCxIMggULgld0X0JJlksDn?=
 =?us-ascii?q?hsUgWoPAQEBD0QNBAEBhQYCjUsCJjQJDgECBAMCAwEBAQEBAQEBAQEBCwEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2GWgECAQMnCwEYAS0QHAMBAi8rIwgQCYMCAYJzAgERB?=
 =?us-ascii?q?rZ0gXkzgQGDKAExBQkCAkABUNssAQsUAQWBM4U/iB9bGAGEfCcbG4FyhH6BB?=
 =?us-ascii?q?YFcAQEBgUYBhl0EgiJ6EoFagj+McEiBHgNZLAFVEw0KCwcFgWYDNRIqFW4yH?=
 =?us-ascii?q?YEjPheBDBsHBYEdgWmBBIR9Ix8DOX+BMHVYZhUwNYECAREeCoFSJwMLGA1IE?=
 =?us-ascii?q?Sw3FBsEPm4HjF4XD4I8AWEkCQEHIgEBgSBiCTILHpJoMJADgiGBNZ9aCiiDd?=
 =?us-ascii?q?YwhlToaM4VbpRGZCI4KlWhohGiBaDyBRwsHcBU7gmcJFjQZD44tCwuBeIFog?=
 =?us-ascii?q?X+EQcFNJDUCCTIBAQcCBw4DC4FokX0BAQ?=
IronPort-Data: A9a23:P+RDnqnHYtdz+3HmEJVEV2vo5gzQJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xJLUW6Fa/iJYGH9cttyPY6y9B8B7JHXxtUwSQA+ris3EFtH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4E/raf658SUUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZG31GONgWYubDpKsfPb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05FdQ24eknP0wSz
 9s3FWoBZy+sgeypkJvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMmZBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTaz/7C7pm9AusrnDzdDtXoUiYjaE2+GPUigd21dABNfKJKoPaGJgEzx3wS
 mTu4yfiLjBKMs6kxjfd23eAqv7TnDHrcddHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM+e8CMUg4w2Lj66R6AGDCy1dFHhKaccts4k9QjlCO
 kK1ou4FzAdH6NW9IU9xPJ/Pxd9uEUD59VM/WBI=
IronPort-HdrOrdr: A9a23:uXN/f6tsSlqRmqDa4Mlc/dk87skDrtV00zEX/kB9WHVpmwKj+P
 xG+85rsiMc5wxxZJhNo7290ey7MBHhHP1OkO0s1NWZPDUO0VHAROoJ0WKh+UyEJ8SUzIBgPM
 lbH5SWIeeAa2SS9fyKgzWQIpIH3MSN9ryuiKP1yndgShwvVoRbhj0Jczpy1iZNNXJ77V1TLu
 vl2vZ6
X-Talos-CUID: 9a23:lcK6bW3M3O083TYNteWWirxfQ+4+fS3j4SvqBGCFU2pgd5KTR0DA0fYx
X-Talos-MUID: 9a23:aDKH3ArgVHN/P7uP+L4ezy0hL+tJs6K8M08AybwDl+WVKS1iKx7I2Q==
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.24,232,1774310400"; 
   d="scan'208";a="487855993"
Received: from rcdn-l-core-12.cisco.com ([173.37.255.149])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 29 Jun 2026 13:15:00 +0000
Received: from sjc-ads-3691.cisco.com (sjc-ads-3691.cisco.com [171.68.250.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-12.cisco.com (Postfix) with ESMTPS id 18442180001DF;
	Mon, 29 Jun 2026 13:15:00 +0000 (GMT)
Received: by sjc-ads-3691.cisco.com (Postfix, from userid 1870532)
	id B49FBCC12A9; Mon, 29 Jun 2026 06:14:59 -0700 (PDT)
From: "Anil Dongare -X (adongare - E INFOCHIPS PRIVATE LIMITED at Cisco)" <adongare@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com,
	Anil Dongare <adongare@cisco.com>
Subject: [OE-core] [wrynose] [PATCH 4/6] curl: fix CVE-2026-6253
Date: Mon, 29 Jun 2026 06:14:48 -0700
Message-ID: <20260629131453.1077612-4-adongare@cisco.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260629131453.1077612-1-adongare@cisco.com>
References: <20260629131453.1077612-1-adongare@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-3691.cisco.com [171.68.250.138];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 171.68.250.138, sjc-ads-3691.cisco.com
X-Outbound-Node: rcdn-l-core-12.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 29 Jun 2026 13:15:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239779

From: Anil Dongare <adongare@cisco.com>

Backport the upstream fix [1] for the proxy credential leak on redirect
described in [2] and tracked by [3].

[1] https://github.com/curl/curl/commit/188c2f166a20fa97c2325b2da7d0e5cecc13725f
[2] https://curl.se/docs/CVE-2026-6253.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-6253

Signed-off-by: Anil Dongare <adongare@cisco.com>
---
 .../curl/curl/CVE-2026-6253.patch             | 392 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   1 +
 2 files changed, 393 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6253.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6253.patch b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
new file mode 100644
index 0000000000..3923ba9372
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6253.patch
@@ -0,0 +1,392 @@
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
+Signed-off-by: Anil Dongare <adongare@cisco.com>
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
+-- 
+2.43.7
+
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 5580791ec8..09e93c8ce5 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -16,6 +16,7 @@ SRC_URI = " \
     file://no-test-timeout.patch \
     file://CVE-2026-6276.patch \
     file://CVE-2026-5545.patch \
+    file://CVE-2026-6253.patch \
     file://mbedtls.patch \
 "
 
-- 
2.51.0


