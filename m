Return-Path: <deeratho@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16B41C44520
	for <webhook@archiver.kernel.org>; Mon, 20 Jul 2026 10:57:48 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6485.1784545066487844347
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Jul 2026 03:57:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=gXitdHKA;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: deeratho@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14433; q=dns/txt;
  s=iport01; t=1784545066; x=1785754666;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6TPhTmaR8BRbRU+2So0Vmd6GFmhB/l2jhWNJxO6aUg4=;
  b=gXitdHKAbCZo3Azvl36RO3L5j6UrWKBuZX1f7OMlk5WM5/bE9p9w5JUG
   Jqgq0NCs+3d9p35ODTCo1e24zGEs7z3DXDUVfchpKWV8sXR9qn0VYy6R5
   T79l9iZNrmTN3DMi/DAeKR/DI4SQtlnT5hCvE9hNF3ahKP+mMGWQYtSvo
   kBLgEYNAEkmw6FnvMXz46AZ5RG2DZAU9gzMuD9HMNEqr0/fo2ChFDgQhS
   kc+qUEtgFONmNnW8FaCt0DGX84KiM8JDdp/k7WqAoe02Ikz8GGmpOffe6
   zOnJ7KUzumhLKmeOx9fnOx7CPnbeDYsfrjMyD12WDq+BaYtLJ0l7btH5u
   A==;
X-CSE-ConnectionGUID: elmRZ5GFSfWLG1CsgWrO5g==
X-CSE-MsgGUID: 6eOu9Op9SJeX4ltFgBV50Q==
X-IPAS-Result: =?us-ascii?q?A0AnAACp/V1q/43/Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ0X0JJjHKHN4IhA54bFIFqDwEBAQ9EDQQBAYFxASCCcwKNUwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLARgBPRwDA?=
 =?us-ascii?q?QIXAQEWKyMIEQiDAgGCdAMRBrw+gXkzgQGDKAExBQkCAkABUNsuAQsUAYE4A?=
 =?us-ascii?q?YU+iCBcGAGEfCcbG4FygRWDaYEFgVwBAQGBIiVgAgaFdQSCIoEMgVqBdYIHj?=
 =?us-ascii?q?BZIgR4DWSwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWBHYE6gQKEdyMfA?=
 =?us-ascii?q?zl/gTB1SnctahIXgSaDSwIHAwsYDUgRLDcUGQQ+bgeNPCOBTXEBATAvASEMA?=
 =?us-ascii?q?SgBAQEvVlUoAjkLHpJ0CgeQFoIegTifWgoog3WMIY4Nhy0aM4VbpRGZCI4Kl?=
 =?us-ascii?q?WhohGmBaDyBRwsHcBWDIgkWNBkPji0LC4F4gWiBf4RBxVY8NQIJMgEBBwIHD?=
 =?us-ascii?q?gMLgWiQAiSBWAEB?=
IronPort-Data: A9a23:FEE+jaIFq9wLEQ0KFE+RgJQlxSXFcZb7ZxGr2PjKsXjdYENS3zYFn
 TcXUWrTa6yPYTGmL9okYN7joRkEuceBx9BkGVYd+CA2RRqmiyZq6fd1j6vUF3nPRiEWZBs/t
 63yUvGZcoZsCCSa/kvxWlTYhSEU/bmSQbbhA/LzNCl0RAt1IA8skhsLd9QR2uaEuvDnRVnQ0
 T/Oi5eHYgH9hGQsajl8B5+r8XuDgtyj4Fv0gXRmDRx7lAe2v2UYCpsZOZawIxPQKqFIHvS3T
 vr017qw+GXU5X8FUrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRuukoPD8fwXG8M49m/c3+d/
 /0W3XC4YV9B0qQhA43xWTEAe811FfUuFLMqvRFTvOTLp3AqfUcAzN1jCEQMD9A31N15PkVhr
 NcDJw8XSU2M0rfeLLKTEoGAh+w5J8XteYdasXZ6wHSBUbAtQIvIROPB4towMDUY358VW62BI
 ZBENHw2ME2ojx5nYj/7DLoykeqyj2X/dBVTqUmeouw85G27IAlZjOm9bIWKJYXQLSlTthiVg
 X+X2HyoOTMXBICb1RSK2Ezx3taayEsXX6pXTtVU7MVCh0WewGEWAhAaWVa35PK+kEOWX9NEN
 1dS/TIjq6U3/kGnQtTxGRqirxa5UgU0QdFcFag+rQqK0KeRu1rfDWkfRTkHY9sj3CMreQEXO
 payt4uBLVRSXHe9EBpxKp/8QeuOBBUo
IronPort-HdrOrdr: A9a23:V+zrK6jTkGj1W11lt6UakyLHN3BQXvYji2hC6mlwRA09TyX+rb
 HLoB1173HJYVoqNU3I3OrwW5VoIkmskKKdn7NxAV7KZmCP0wGVxcNZnOnfKlbbdBEWmNQw6U
 4ZSchDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhBQpcUAUdAY0++/YTzrdHFLeA==
X-Talos-CUID: 9a23:mayjPWE6gSxRc679qmJq8EsuKJ0KXEbT81P/emSjBllzb+CaHAo=
X-Talos-MUID: 9a23:L8NAJwgEejMG4wTfok1f+MMpaspP/vWJEBE2s5g2582YGyNaBWrFtWHi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,174,1779148800"; 
   d="scan'208";a="498477712"
Received: from rcdn-l-core-04.cisco.com ([173.37.255.141])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 20 Jul 2026 10:57:45 +0000
Received: from bgl-ads-3413.cisco.com (bgl-ads-3413.cisco.com [173.39.60.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by rcdn-l-core-04.cisco.com (Postfix) with ESMTPS id B8E3318000181
	for <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:44 +0000 (GMT)
Received: by bgl-ads-3413.cisco.com (Postfix, from userid 1795984)
	id DB3BACC037D; Mon, 20 Jul 2026 16:27:42 +0530 (IST)
From: "Deepak Rathore -X (deeratho - E INFOCHIPS PRIVATE LIMITED at Cisco)" <deeratho@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][wrynose][PATCH 4/5] curl: fix CVE-2026-6429
Date: Mon, 20 Jul 2026 16:26:46 +0530
Message-Id: <20260720105647.2451180-4-deeratho@cisco.com>
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
 <openembedded-core@lists.openembedded.org>; Mon, 20 Jul 2026 10:57:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241356

From: Deepak Rathore <deeratho@cisco.com>

Backport the upstream fix [1] and the required dependent change [2] to
address the netrc credential leak across redirects, as mentioned in [3] and
tracked by [4].

[1] https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
[2] https://github.com/curl/curl/commit/32a513e180ce83d5e9b708211306045407074134
[3] https://curl.se/docs/CVE-2026-6429.html
[4] https://nvd.nist.gov/vuln/detail/CVE-2026-6429

Signed-off-by: Deepak Rathore <deeratho@cisco.com>
---
 .../curl/curl/CVE-2026-6429-dependent.patch   |  81 +++++
 .../curl/curl/CVE-2026-6429.patch             | 325 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 408 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-6429.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429-dependent.patch b/meta/recipes-support/curl/curl/CVE-2026-6429-dependent.patch
new file mode 100644
index 0000000000..a3f68ae539
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429-dependent.patch
@@ -0,0 +1,81 @@
+From 6b1769c54659f1e6d6323891cb45c682c22182b7 Mon Sep 17 00:00:00 2001
+From: Stefan Eissing <stefan@eissing.org>
+Date: Wed, 15 Apr 2026 10:43:12 +0200
+Subject: [PATCH] urlapi: same origin tests
+
+Add new internal `curl_url_same_origin()` to check if a href has the
+same origin as a base URL. Add test cases in test1675 and use this in
+http2 push handling.
+
+Closes #21328
+
+CVE: CVE-2026-6429
+Upstream-Status: Backport [https://github.com/curl/curl/commit/32a513e180ce83d5e9b708211306045407074134]
+
+Backport Changes:
+- curl 8.19.0 does not provide Curl_url_same_origin(), but the CVE-2026-6429
+  fix from https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306
+  uses it in lib/http.c.
+- kept only the helper declaration and implementation of
+  lib/urlapi-int.h and lib/urlapi.c.
+- Excluded unrelated upstream test and HTTP/2 changes from that commit.
+
+(cherry picked from commit 32a513e180ce83d5e9b708211306045407074134)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/urlapi-int.h |  2 ++
+ lib/urlapi.c     | 33 +++++++++++++++++++++++++++++++++
+ 2 files changed, 35 insertions(+)
+
+diff --git a/lib/urlapi-int.h b/lib/urlapi-int.h
+index 29d4fe5f39..591062035b 100644
+--- a/lib/urlapi-int.h
++++ b/lib/urlapi-int.h
+@@ -40,4 +40,6 @@ UNITTEST CURLUcode Curl_parse_port(struct Curl_URL *u, struct dynbuf *host,
+ #define U_CURLU_URLDECODE (unsigned int)CURLU_URLDECODE
+ #define U_CURLU_PATH_AS_IS (unsigned int)CURLU_PATH_AS_IS
+
++bool Curl_url_same_origin(CURLU *base, CURLU *href);
++
+ #endif /* HEADER_CURL_URLAPI_INT_H */
+diff --git a/lib/urlapi.c b/lib/urlapi.c
+index a4b82f31bd..20c6585b55 100644
+--- a/lib/urlapi.c
++++ b/lib/urlapi.c
+@@ -1996,3 +1996,36 @@ nomem:
+   }
+   return CURLUE_OK;
+ }
++
++bool Curl_url_same_origin(CURLU *base, CURLU *href)
++{
++  const struct Curl_scheme *s = NULL;
++
++  /* base must be an absolute URL */
++  if(!base->scheme || !base->host)
++    return FALSE;
++  if(href->scheme && !curl_strequal(base->scheme, href->scheme))
++    return FALSE;
++  if(href->host) {
++    if(!curl_strequal(base->host, href->host))
++      return FALSE;
++    if(!curl_strequal(base->port, href->port)) {
++      /* This may still match if only one has an explicit port
++       * and it is the default for the scheme. */
++      if(base->port && href->port)
++        return FALSE;
++
++      s = Curl_get_scheme(base->scheme);
++      if(!s) /* Cannot match default port for unknown scheme */
++        return FALSE;
++
++      /* The port which is set must be the default one */
++      if((base->port && (base->portnum != s->defport)) ||
++         (href->port && (href->portnum != s->defport)))
++        return FALSE;
++    }
++  }
++  else if(href->port) /* no host in href, then there must be no port */
++    return FALSE;
++  return TRUE;
++}
diff --git a/meta/recipes-support/curl/curl/CVE-2026-6429.patch b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
new file mode 100644
index 0000000000..76711aafc0
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-6429.patch
@@ -0,0 +1,325 @@
+From 1d36681ca0e453faf199f44c483077d929899906 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 16 Apr 2026 14:26:20 +0200
+Subject: [PATCH] http: clear credentials better on redirect
+
+Verify with test 2506: netrc with redirect using proxy
+
+Updated test 998 which was wrong.
+
+Reported-by: Muhamad Arga Reksapati
+
+Closes #21345
+
+CVE: CVE-2026-6429
+Upstream-Status: Backport [https://github.com/curl/curl/commit/b4024bf808bd558026fdc6096e8457f199ace306]
+
+Backport Changes:
+- Aligned with curl 8.19.0 by using the existing
+  Curl_safefree() instead of the curlx_safefree() macro.
+- The curlx_safefree() macro was introduced in curl 8.20.0 by:
+  https://github.com/curl/curl/commit/0df6c01db398f5e25d00a062aae56f2a89d8ff55
+
+(cherry picked from commit b4024bf808bd558026fdc6096e8457f199ace306)
+Signed-off-by: Deepak Rathore <deeratho@cisco.com>
+---
+ lib/http.c                 | 84 ++++++++++++--------------------------
+ tests/data/Makefile.am     |  2 +-
+ tests/data/test2506        | 64 +++++++++++++++++++++++++++++
+ tests/data/test998         |  1 -
+ tests/libtest/Makefile.inc |  2 +-
+ tests/libtest/lib2506.c    | 71 ++++++++++++++++++++++++++++++++
+ 6 files changed, 162 insertions(+), 62 deletions(-)
+ create mode 100644 tests/data/test2506
+ create mode 100644 tests/libtest/lib2506.c
+
+diff --git a/lib/http.c b/lib/http.c
+index b960d790a4..2596b4b3a2 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -1201,75 +1201,41 @@ CURLcode Curl_http_follow(struct Curl_easy *data, const char *newurl,
+       return CURLE_OUT_OF_MEMORY;
+   }
+   else {
+-    uc = curl_url_get(data->state.uh, CURLUPART_URL, &follow_url, 0);
+-    if(uc)
++    bool same_origin;
++    CURLcode result;
++    CURLU *u = curl_url();
++    if(!u)
++      return CURLE_OUT_OF_MEMORY;
++    uc = curl_url_set(u, CURLUPART_URL,
++                      Curl_bufref_ptr(&data->state.url),
++                      CURLU_URLENCODE | CURLU_ALLOW_SPACE);
++    if(!uc)
++      uc = curl_url_get(data->state.uh, CURLUPART_URL, &follow_url, 0);
++    if(uc) {
++      curl_url_cleanup(u);
+       return Curl_uc_to_curlcode(uc);
++    }
+
+-    /* Clear auth if this redirects to a different port number or protocol,
+-       unless permitted */
+-    if(!data->set.allow_auth_to_other_hosts && (type != FOLLOW_FAKE)) {
+-      int port;
+-      bool clear = FALSE;
+-
+-      if(data->set.use_port && data->state.allow_port)
+-        /* a custom port is used */
+-        port = (int)data->set.use_port;
+-      else {
+-        curl_off_t value;
+-        char *portnum;
+-        const char *p;
+-        uc = curl_url_get(data->state.uh, CURLUPART_PORT, &portnum,
+-                          CURLU_DEFAULT_PORT);
+-        if(uc) {
+-          curlx_free(follow_url);
+-          return Curl_uc_to_curlcode(uc);
+-        }
+-        p = portnum;
+-        curlx_str_number(&p, &value, 0xffff);
+-        port = (int)value;
+-        curlx_free(portnum);
+-      }
+-      if(port != data->info.conn_remote_port) {
+-        infof(data, "Clear auth, redirects to port from %u to %u",
+-              data->info.conn_remote_port, port);
+-        clear = TRUE;
+-      }
+-      else {
+-        char *scheme;
+-        const struct Curl_scheme *p;
+-        uc = curl_url_get(data->state.uh, CURLUPART_SCHEME, &scheme, 0);
+-        if(uc) {
+-          curlx_free(follow_url);
+-          return Curl_uc_to_curlcode(uc);
+-        }
++    same_origin = Curl_url_same_origin(u, data->state.uh);
++    curl_url_cleanup(u);
+
+-        p = Curl_get_scheme(scheme);
+-        if(p && (p->protocol != data->info.conn_protocol)) {
+-          infof(data, "Clear auth, redirects scheme from %s to %s",
+-                data->info.conn_scheme, scheme);
+-          clear = TRUE;
+-        }
+-        curlx_free(scheme);
+-      }
+-      if(clear) {
+-        CURLcode result = Curl_reset_userpwd(data);
+-        if(result) {
+-          curlx_free(follow_url);
+-          return result;
+-        }
+-        Curl_safefree(data->state.aptr.user);
+-        Curl_safefree(data->state.aptr.passwd);
++    if((!same_origin && !data->set.allow_auth_to_other_hosts) ||
++       !data->set.str[STRING_USERNAME]) {
++      result = Curl_reset_userpwd(data);
++      if(result) {
++        curlx_free(follow_url);
++        return result;
+       }
++      Curl_safefree(data->state.aptr.user);
++      Curl_safefree(data->state.aptr.passwd);
+     }
+-  }
+-  DEBUGASSERT(follow_url);
+-  {
+-    CURLcode result = Curl_reset_proxypwd(data);
++    result = Curl_reset_proxypwd(data);
+     if(result) {
+       curlx_free(follow_url);
+       return result;
+     }
+   }
++  DEBUGASSERT(follow_url);
+
+   if(type == FOLLOW_FAKE) {
+     /* we are only figuring out the new URL if we would have followed locations
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 00a5221d1f..1b76b01a8c 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -265,7 +265,7 @@ test2309 \
+ \
+ test2400 test2401 test2402 test2403 test2404 test2405 test2406 test2407 \
+ \
+-test2500 test2501 test2502 test2503 test2504 \
++test2500 test2501 test2502 test2503 test2504 test2506 \
+ \
+ test2600 test2601 test2602 test2603 test2604 test2605 \
+ \
+diff --git a/tests/data/test2506 b/tests/data/test2506
+new file mode 100644
+index 0000000000..9c65002496
+--- /dev/null
++++ b/tests/data/test2506
+@@ -0,0 +1,64 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++<reply>
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 301 redirect
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 3
++Location: http://numbertwo.example/%TESTNUMBER0002
++
++ok
++</data>
++<data2 crlf="headers" nocheck="yes">
++HTTP/1.1 200 OK
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Length: 4
++
++yes
++</data2>
++</reply>
++
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<tool>
++lib%TESTNUMBER
++</tool>
++<name>
++netrc with redirect using proxy
++</name>
++<file name="%LOGDIR/netrc2506">
++machine site.example login batman password robin
++</file>
++<command>
++http://%HOSTIP:%HTTPPORT http://site.example/ %LOGDIR/netrc2506
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET http://site.example/ HTTP/1.1
++Host: site.example
++Authorization: Basic %b64[batman:robin]b64%
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://numbertwo.example/25060002 HTTP/1.1
++Host: numbertwo.example
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++</verify>
++</testcase>
+diff --git a/tests/data/test998 b/tests/data/test998
+index 24d1d3dd4e..56dbc0c891 100644
+--- a/tests/data/test998
++++ b/tests/data/test998
+@@ -77,7 +77,6 @@ Proxy-Connection: Keep-Alive
+
+ GET http://somewhere.else.example/a/path/9980002 HTTP/1.1
+ Host: somewhere.else.example
+-Authorization: Basic %b64[alberto:einstein]b64%
+ User-Agent: curl/%VERSION
+ Accept: */*
+ Proxy-Connection: Keep-Alive
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 2319bafe72..2f77c16975 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -113,7 +113,7 @@ TESTS_C = \
+   lib2023.c lib2032.c lib2082.c \
+   lib2301.c lib2302.c lib2304.c           lib2306.c lib2308.c lib2309.c \
+   lib2402.c           lib2404.c lib2405.c \
+-  lib2502.c lib2504.c \
++  lib2502.c lib2504.c lib2506.c \
+   lib2700.c \
+   lib3010.c lib3025.c lib3026.c lib3027.c lib3033.c lib3034.c \
+   lib3100.c lib3101.c lib3102.c lib3103.c lib3104.c lib3105.c \
+diff --git a/tests/libtest/lib2506.c b/tests/libtest/lib2506.c
+new file mode 100644
+index 0000000000..8b3b3429f9
+--- /dev/null
++++ b/tests/libtest/lib2506.c
+@@ -0,0 +1,71 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Linus Nielsen Feltzing <linus@haxx.se>
++ *
++ * This software is licensed as described in the file COPYING, which
++ * you should have received as part of this distribution. The terms
++ * are also available at https://curl.se/docs/copyright.html.
++ *
++ * You may opt to use, copy, modify, merge, publish, distribute and/or sell
++ * copies of the Software, and permit persons to whom the Software is
++ * furnished to do so, under the terms of the COPYING file.
++ *
++ * This software is distributed on an "AS IS" basis, WITHOUT WARRANTY OF ANY
++ * KIND, either express or implied.
++ *
++ * SPDX-License-Identifier: curl
++ *
++ ***************************************************************************/
++#include "first.h"
++
++#include "testtrace.h"
++
++static size_t sink2506(char *ptr, size_t size, size_t nmemb, void *ud)
++{
++  (void)ptr;
++  (void)ud;
++  return size * nmemb;
++}
++
++static CURLcode test_lib2506(const char *URL)
++{
++  CURL *curl;
++  CURLcode result = CURLE_OUT_OF_MEMORY;
++
++  if(curl_global_init(CURL_GLOBAL_ALL) != CURLE_OK) {
++    curl_mfprintf(stderr, "curl_global_init() failed\n");
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  curl = curl_easy_init();
++  if(!curl) {
++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
++    curl_global_cleanup();
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  test_setopt(curl, CURLOPT_WRITEFUNCTION, sink2506);
++  test_setopt(curl, CURLOPT_PROXY, URL);
++  test_setopt(curl, CURLOPT_URL, libtest_arg2);
++  test_setopt(curl, CURLOPT_NETRC, CURL_NETRC_OPTIONAL);
++  test_setopt(curl, CURLOPT_NETRC_FILE, libtest_arg3);
++  test_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);
++  test_setopt(curl, CURLOPT_VERBOSE, 1L);
++
++  /* CURLOPT_UNRESTRICTED_AUTH should not make a difference because the
++     credentials come from netrc */
++  test_setopt(curl, CURLOPT_UNRESTRICTED_AUTH, 1L);
++
++  result = curl_easy_perform(curl);
++
++test_cleanup:
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++
++  return result;
++}
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index b1ee0f8b9b..683163bfa6 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -19,6 +19,8 @@ SRC_URI = " \
     file://mbedtls.patch \
     file://CVE-2026-5545.patch \
     file://CVE-2026-6253.patch \
+    file://CVE-2026-6429-dependent.patch \
+    file://CVE-2026-6429.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


