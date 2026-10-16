Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E66AFCCA462
	for <webhook@archiver.kernel.org>; Fri, 16 Oct 2026 13:04:41 +0000 (UTC)
Received: from rcdn-iport-5.cisco.com (rcdn-iport-5.cisco.com [173.37.86.76])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21096.1792155881003400347
 for <openembedded-core@lists.openembedded.org>;
 Fri, 16 Oct 2026 06:04:41 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=BT7dW1Rj;
 spf=pass (domain: cisco.com, ip: 173.37.86.76, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=15668; q=dns/txt;
  s=iport01; t=1792155881; x=1793365481;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=iawMOW2jEB0AhvvJWXTd0g3UyG86gNaXBL5AR7jTppw=;
  b=BT7dW1Rj/qp+TtGcT2oBIiTFdSpn1TMPltRamgYKyln38VqULOQxMhpQ
   bcuQphKh0uUGhuKHrfcczqtyOnke2jWYkTkaarGO0N9LBdbrBRQze8Kf2
   QdPYQB4vquF4lG/f1TvfobSBcF3iNoqSi9i9gZwAaLmRLa8HqLunWggYp
   NaV+zzKFumjXUxq4IwSd/Kjv35W4z5GWn1ckz24j5VRoZISi8N1IUXzHh
   noqz/GsgTd3mLL3sU4KkTeuwlMCVb+eBXmXHfmHSb++7hKIMmTqfrJs0g
   dZG98QUvm8iNr2yFdpbfmq4wTG+/OMYXHURD+KpUgFeszzaVAhHQm+Bkc
   g==;
X-CSE-ConnectionGUID: +wyRqnt2RHu6hKJTtjcqhQ==
X-CSE-MsgGUID: YKDiyzgwQgysqhjNz+atWw==
X-IPAS-Result: =?us-ascii?q?A0AnAAC2H9Jq/4//Ja1aHQEBAQEJARIBBQUBgXwIAQsBg?=
 =?us-ascii?q?lZ1YUJJjHKJWIEWkDeMUhSBag8BAQEPRA0EAQGBcQEggnOOFwImNAkOAQIEA?=
 =?us-ascii?q?wIDAQEBAQEBAQEBAQEBCgEBBQEBAQIBBwWBDhOGTw2QEgECASoLARgBLSwDA?=
 =?us-ascii?q?QIWRCMhgwIBgnQCAREGvXeBeTOBAYMpAT8CAkABUNsyAQsUAYE4AYU/iCNdG?=
 =?us-ascii?q?AGDXYEfJxsbgXKBFYJzdoEFgVwCAQGBFwoDIleGBgSCIoEMgVoegS+TekiBH?=
 =?us-ascii?q?gNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjPheBBxsGBYEdgSCCFiMZNnqBCV6BK?=
 =?us-ascii?q?ylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJUMSRyYiCBIJARMaMAuBGzg8CShBF?=
 =?us-ascii?q?wxzDB0FcggCDQkHKRgNSBEsNxUZBD5uB5IUHoItNwExKQYBGgcCCgETFgEBB?=
 =?us-ascii?q?CuBBTgWAQEPKgwVCBSSVAwJGx6PZIIhgTWfWgoog3aMIpU6GjOEBIFXkkCSV?=
 =?us-ascii?q?JkIjgqVMzQbTYRpgWg8gVlwFYMiCQkNNBkPji4LC4NghUEGecgaJDUCCTIBA?=
 =?us-ascii?q?QcCBw4DC4FohGGLIS2BTwEB?=
IronPort-Data: A9a23:Av6i7KlR0Hp4xdQG85yXaTDo5gzvJ0RdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXjjTPPjfYzP8fYslO4Ww/EsF6pPcndFlQVc/+CE3H1tH+JHPbTi7wugcHM8zwunrFh8PA
 xA2M4GYRCwMZiaC4Errav6+/SEUOZigHtLUEPTDNj16WThqQSIgjQMLs+Mii+aEu/Dha++2k
 Y20+ZK31GONgWYubDtMsvzb8XuDgdyr0N8mlg1mDRx0lAe2e0k9VPo3Oay3Jn3kdYhYdsbSb
 /rD1ryw4lTC9B4rDN6/+p6jGqHdauePVeQmoiM+t5mK2nCulARrukoIHKZ0hXNsttm8t4sZJ
 OOhGnCHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqHLWyOE/hlgMK05Fc4H69xuB30Uz
 9wFdjAuTCyfhemvwIvuH4GAhux7RCXqFJkUtnclyXTSCuwrBMidBa7L/tRfmjw3g6iiH96HO
 JFfMmUpNkmdJUQTYT/7C7pm9AusrnXybTRes1KNjaE2+GPUigd21dABNfKIIYLUGJ4EzxrwS
 mTuzkfVAwAIO8Omxiue63KuoP2MlD/ER9dHfFG/3rsw6LGJ/UQUEBAQWF6xrPW1h0L7UNVFJ
 mQQ+zEytu417EGtQ9z3UhG0rXLCuQQTM/JBFOQ87keGzazb6gKxHW0FSjMHZsZOiSMtbSYh2
 lnMm5biAiZi9eXLD3mc7byT6zi1PED5MFM/WMPNdiNdi/GLnW35pkunogpLeEJtsuDIJA==
IronPort-HdrOrdr: A9a23:3Kck+a91BT0E+L56NgVuk+DuI+orL9Y04lQ7vn2ZhyY7TiX+rb
 HKoB11737JYVoqNU3I+urwWpVoP0m9yXcd2+B4Vt2ftWLd1ldAQrsP0WKb+UyCJwTOsshAyK
 xnb69yTPf0DVR8kILGxTPQKadF/DFCm5rY49s3CBxWPGZXV50=
X-Talos-CUID: =?us-ascii?q?9a23=3A5nkQ72uc4HcXFaKIVPa/50ug6ItmbWzn1XHMeXW?=
 =?us-ascii?q?YFDhpa5+pVV2b4aNdxp8=3D?=
X-Talos-MUID: 9a23:R/ZYOwajF6TsPuBThhzAhSBwO9hR7LW1EUAPt4dFstW7Knkl
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,161,1787011200"; 
   d="scan'208";a="536653994"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by rcdn-iport-5.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 16 Oct 2026 13:04:39 +0000
Received: from sjc-ads-20746.cisco.com (sjc-ads-20746.cisco.com [171.70.189.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id B5E54180003B1;
	Fri, 16 Oct 2026 13:04:39 +0000 (GMT)
Received: by sjc-ads-20746.cisco.com (Postfix, from userid 1887503)
	id 5DA49CC1611; Fri, 16 Oct 2026 06:04:39 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr
Subject: [OE-core][scarthgap][PATCH v2 5/8] curl: fix CVE-2026-8927
Date: Fri, 16 Oct 2026 06:04:36 -0700
Message-Id: <20261016130439.603118-1-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-20746.cisco.com [171.70.189.245];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 171.70.189.245, sjc-ads-20746.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 16 Oct 2026 13:04:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248018

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [3], using the
commits shown in [1] and [2].

[1] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6b705385
[2] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567
[3] https://curl.se/docs/CVE-2026-8927.html

The test adaptations account for these earlier upstream changes:
[4] https://github.com/curl/curl/commit/6cf3d7b1b161bc45501d17b401225befe3c43943
[5] https://github.com/curl/curl/commit/a186ecf4bf0c8ebb3a9a826155b3392164ec257a

Validation: ptests passed (866 tests, no failures). The release build
skips test1647 because debug support is disabled. A native debug build
with stunnel passed test1647 with the test compatibility changes below.

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---

Changes in v2:
- Rebase onto stable/scarthgap-review
- Explain the test.h macro requirements in the backport changes.
- Adapt CONNECT normalization and the expected error for curl 8.7.1.
- Record target ptest and native debug validation.

 .../curl/curl/CVE-2026-8927-dependent.patch   |  39 ++
 .../curl/curl/CVE-2026-8927.patch             | 390 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 431 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
new file mode 100644
index 0000000..d05699d
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
@@ -0,0 +1,39 @@
+From a07fc9a9855848da48a4533b85153c681ae1b1a0 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 25 Apr 2025 08:16:13 +0200
+Subject: [PATCH] tests/buildinfo: former "disabled" now provides more info
+
+This tool now contains ON/OFF information about features in the build.
+This way, runtests gets both positive and negative feature presence with
+this. Allows for more flexibility and avoids having to duplicate the
+names.
+
+Closes #17180
+
+CVE: CVE-2026-8927
+Upstream-Status: Backport [https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6b705385]
+
+Backport Changes:
+- Add only the Digest feature flag needed by the tests. Keep the old
+  disabled helper, which clears this flag when Digest is disabled.
+  Leave out the buildinfo rename and other feature-reporting changes.
+
+(cherry picked from commit 1968b32afd8e41fbb87f8911d15c552c6b705385)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ tests/runtests.pl | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/tests/runtests.pl b/tests/runtests.pl
+index ddfab20e86..b40df554b2 100755
+--- a/tests/runtests.pl
++++ b/tests/runtests.pl
+@@ -637,6 +637,8 @@ sub checksystemfeatures {
+             $feature{"Kerberos"} = $feat =~ /Kerberos/i;
+             # SPNEGO enabled
+             $feature{"SPNEGO"} = $feat =~ /SPNEGO/i;
++            # Digest auth enabled unless disabled by build
++            $feature{"digest-auth"} = 1;
+             # CharConv enabled
+             $feature{"CharConv"} = $feat =~ /CharConv/i;
+             # TLS-SRP enabled
diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927.patch b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
new file mode 100644
index 0000000..0624d49
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
@@ -0,0 +1,390 @@
+From 5f9ea43cf1266112a388673ced1bce30b9a3767d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 18 May 2026 23:47:11 +0200
+Subject: [PATCH] url: detect proxy changes read from environment
+
+When a proxy is set from an environment variable, detect if that proxy
+is not the same as previously and flush state.
+
+Verified by test1647: verify changing proxy with env variables and make
+sure Digest state is flushed in the second use
+
+Closes #21666
+
+CVE: CVE-2026-8927
+Upstream-Status: Backport [https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567]
+
+Backport Changes:
+- Use free()/strdup() and include vauth/vauth.h for Digest cleanup.
+  Keep the proxy string alive until its Digest state is checked.
+- Register test1647 and lib1647 in the target Makefile.inc files.
+- Replace first.h and test_lib1647() with test.h and test(). The old
+  harness has no libtest_arg4, so use test_argv[4] and require five
+  argv entries before reading it.
+- The curl 8.7.1 test macros write to a variable named res. Use
+  CURLcode res in init1647() and int res in test(); retain upstream
+  CURLcode result in run1647(), which uses no harness macro.
+- Use the curl 8.7.1 feature names digest-auth and lowercase debug.
+  The dependency patch supplies positive digest-auth detection.
+- Add CONNECT newline handling from upstream 6cf3d7b1b161. Expect
+  error 56 for rejected CONNECT requests, as curl 8.7.1 returns.
+
+(cherry picked from commit 5c225384b8d52c67ce8259c6e4203bc57aacb567)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/url.c                  |   13 ++++-
+ lib/urldata.h              |    1 
+ tests/data/Makefile.inc    |    2 +
+ tests/data/test1647        |  103 +++++++++++++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |    5 ++
+ tests/libtest/lib1647.c    |  124 ++++++++++++++++++++++++++++++++++++++++++++
+ tests/testutil.pm          |    2 -
+ 7 files changed, 248 insertions(+), 2 deletions(-)
+ create mode 100644 tests/data/test1647
+ create mode 100644 tests/libtest/lib1647.c
+
+diff --git a/lib/url.c b/lib/url.c
+index 9e1ca0336c..fe7639713a 100644
+--- a/lib/url.c
++++ b/lib/url.c
+@@ -79,6 +79,7 @@
+ #include "share.h"
+ #include "content_encoding.h"
+ #include "http_digest.h"
++#include "vauth/vauth.h"
+ #include "http_negotiate.h"
+ #include "select.h"
+ #include "multiif.h"
+@@ -331,6 +332,9 @@ CURLcode Curl_close(struct Curl_easy **datap)
+   Curl_wildcard_dtor(&data->wildcard);
+   Curl_freeset(data);
+   Curl_headers_cleanup(data);
++#ifndef CURL_DISABLE_DIGEST_AUTH
++  free(data->state.envproxy);
++#endif
+   free(data);
+   return CURLE_OK;
+ }
+@@ -2535,7 +2539,6 @@ static CURLcode create_conn_helper_init_proxy(struct Curl_easy *data,
+     curl_proxytype ptype = (curl_proxytype)conn->http_proxy.proxytype;
+     if(proxy) {
+       result = parse_proxy(data, conn, proxy, ptype);
+-      Curl_safefree(proxy); /* parse_proxy copies the proxy string */
+       if(result)
+         goto out;
+     }
+@@ -2554,6 +2557,14 @@ static CURLcode create_conn_helper_init_proxy(struct Curl_easy *data,
+       result = CURLE_UNSUPPORTED_PROTOCOL;
+       goto out;
+ #else
++#ifndef CURL_DISABLE_DIGEST_AUTH
++      if(!Curl_safecmp(data->state.envproxy, proxy)) {
++        /* proxy changed */
++        Curl_auth_digest_cleanup(&data->state.proxydigest);
++        free(data->state.envproxy);
++        data->state.envproxy = strdup(proxy);
++      }
++#endif
+       /* force this connection's protocol to become HTTP if compatible */
+       if(!(conn->handler->protocol & PROTO_FAMILY_HTTP)) {
+         if((conn->handler->flags & PROTOPT_PROXY_AS_HTTP) &&
+diff --git a/lib/urldata.h b/lib/urldata.h
+index 4fc595a639..d2d9424197 100644
+--- a/lib/urldata.h
++++ b/lib/urldata.h
+@@ -1247,6 +1247,7 @@ struct UrlState {
+   void (*prev_signal)(int sig);
+ #endif
+ #ifndef CURL_DISABLE_DIGEST_AUTH
++  char *envproxy; /* last proxy string used for proxy-related state */
+   struct digestdata digest;      /* state data for host Digest auth */
+   struct digestdata proxydigest; /* state data for proxy Digest auth */
+ #endif
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index aafd309a9d..f420a8a4f5 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -210,6 +210,8 @@ test1620 test1621 \
+ \
+ test1630 test1631 test1632 test1633 test1634 test1635 \
+ \
++test1647 \
++\
+ test1650 test1651 test1652 test1653 test1654 test1655 test1656 \
+ test1660 test1661 test1662 \
+ \
+diff --git a/tests/data/test1647 b/tests/data/test1647
+new file mode 100644
+index 0000000000..76f8e2767f
+--- /dev/null
++++ b/tests/data/test1647
+@@ -0,0 +1,103 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++HTTP proxy
++HTTP proxy Digest auth
++multi
++</keywords>
++</info>
++
++# Server-side
++<reply>
++
++# this is returned first since we get no proxy-auth
++<data crlf="headers" nocheck="yes">
++HTTP/1.1 407 Authorization Required to proxy me my dear
++Proxy-Authenticate: Digest realm="weirdorealm", nonce="12345"
++Content-Length: 33
++
++And you should ignore this data.
++</data>
++
++# then this is returned when we get proxy-auth
++<data1000 crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 21
++Server: no
++
++Nice proxy auth sir!
++</data1000>
++
++<connect crlf="headers">
++HTTP/1.1 401 OK
++Content-Length: 21
++Server: no
++
++Denied access. Leave
++</connect>
++
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++https-proxy
++https
++</server>
++# tool is what to use instead of 'curl'
++<tool>
++lib%TESTNUMBER
++</tool>
++<features>
++!SSPI
++crypto
++proxy
++digest-auth
++debug
++</features>
++<setenv>
++http_proxy=%HOSTIP:%HTTPPORT
++https_proxy=https://%HOSTIP:%HTTPSPROXYPORT
++CURL_ENTROPY=99376
++</setenv>
++<name>
++HTTP proxy auth Digest, then change proxy with env var and do it again
++</name>
++<command>
++http://test.remote.example.com/path/%TESTNUMBER https://another.example.com:%HTTPSPORT/ daniel:monkey123 another:bump456
++</command>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET http://test.remote.example.com/path/%TESTNUMBER HTTP/1.1
++Host: test.remote.example.com
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++GET http://test.remote.example.com/path/%TESTNUMBER HTTP/1.1
++Host: test.remote.example.com
++Proxy-Authorization: Digest username="daniel", realm="weirdorealm", nonce="12345", uri="/path/%TESTNUMBER", response="7a1672891aff03248887b1a6674b8096"
++Accept: */*
++Proxy-Connection: Keep-Alive
++
++</protocol>
++
++<proxy crlf="headers">
++CONNECT another.example.com:%HTTPSPORT HTTP/1.1
++Host: another.example.com:%HTTPSPORT
++Proxy-Connection: Keep-Alive
++
++</proxy>
++
++# CONNECT fails
++<errorcode>
++56
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 9f7cec6027..78e16b0428 100644
+--- a/tests/libtest/Makefile.inc
++++ b/tests/libtest/Makefile.inc
+@@ -64,6 +64,8 @@ noinst_PROGRAMS = chkhostname libauthretry libntlmconnect libprereq      \
+  lib1558 lib1559 lib1560 lib1564 lib1565 lib1567 lib1568 lib1569 \
+  lib1591 lib1592 lib1593 lib1594 lib1596 lib1597 lib1598 \
+  \
++ lib1647 \
++ \
+  lib1662 \
+  \
+  lib1900 \
+@@ -540,6 +542,9 @@ lib1597_LDADD = $(TESTUTIL_LIBS)
+ lib1598_SOURCES = lib1598.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib1598_LDADD = $(TESTUTIL_LIBS)
+ 
++lib1647_SOURCES = lib1647.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
++lib1647_LDADD = $(TESTUTIL_LIBS)
++
+ lib1662_SOURCES = lib1662.c $(SUPPORTFILES) $(TESTUTIL) $(WARNLESS)
+ lib1662_LDADD = $(TESTUTIL_LIBS)
+ 
+diff --git a/tests/libtest/lib1647.c b/tests/libtest/lib1647.c
+new file mode 100644
+index 0000000000..16dc9d711c
+--- /dev/null
++++ b/tests/libtest/lib1647.c
+@@ -0,0 +1,124 @@
++/***************************************************************************
++ *                                  _   _ ____  _
++ *  Project                     ___| | | |  _ \| |
++ *                             / __| | | | |_) | |
++ *                            | (__| |_| |  _ <| |___
++ *                             \___|\___/|_| \_\_____|
++ *
++ * Copyright (C) Daniel Stenberg, <daniel@haxx.se>, et al.
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
++/*
++ * argv1 = the first URL
++ * argv2 = URL2
++ * argv3 = credentials 1
++ * argv4 = credentials 2
++ */
++
++#include "test.h"
++#include "testutil.h"
++
++/* this is meant to pick up the proxy from the environment variable */
++static CURLcode init1647(CURL *curl, const char *url, const char *userpwd)
++{
++  CURLcode res = CURLE_OK;
++
++  res_easy_setopt(curl, CURLOPT_URL, url);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYUSERPWD, userpwd);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXYAUTH, CURLAUTH_DIGEST);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY_SSL_VERIFYPEER, 0L);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_PROXY_SSL_VERIFYHOST, 0L);
++  if(res)
++    goto init_failed;
++
++  res_easy_setopt(curl, CURLOPT_VERBOSE, 1L);
++  if(res)
++    goto init_failed;
++
++  return CURLE_OK; /* success */
++
++init_failed:
++  return res; /* failure */
++}
++
++static CURLcode run1647(CURL *curl, const char *url, const char *userpwd)
++{
++  CURLcode result = CURLE_OK;
++
++  result = init1647(curl, url, userpwd);
++  if(result)
++    return result;
++
++  return curl_easy_perform(curl);
++}
++
++int test(char *URL)
++{
++  int res = CURLE_OK;
++  CURL *curl = NULL;
++
++  if(test_argc < 5)
++    return TEST_ERR_MAJOR_BAD;
++
++  res_global_init(CURL_GLOBAL_ALL);
++  if(res)
++    return res;
++
++  curl = curl_easy_init();
++  if(!curl) {
++    curl_mfprintf(stderr, "curl_easy_init() failed\n");
++    curl_global_cleanup();
++    return TEST_ERR_MAJOR_BAD;
++  }
++
++  start_test_timing();
++
++  curl_mprintf("--- First get '%s'\n", URL);
++  res = run1647(curl, URL, libtest_arg3);
++  if(res)
++    goto test_cleanup;
++
++  curl_mprintf("--- Then get '%s'\n", libtest_arg2);
++  res = run1647(curl, libtest_arg2, test_argv[4]);
++
++test_cleanup:
++
++  /* proper cleanup sequence - type PB */
++
++  curl_easy_cleanup(curl);
++  curl_global_cleanup();
++  return res;
++}
+diff --git a/tests/testutil.pm b/tests/testutil.pm
+index 1a44083e1b..e40bf74bae 100644
+--- a/tests/testutil.pm
++++ b/tests/testutil.pm
+@@ -153,7 +153,7 @@
+     # little quirk.
+ 
+     if(($$thing =~ /^HTTP\/(1.1|1.0|2|3) [1-5][^\x0d]*\z/) ||
+-       ($$thing =~ /^(GET|POST|PUT|DELETE) \S+ HTTP\/\d+(\.\d+)?/) ||
++       ($$thing =~ /^(GET|POST|PUT|DELETE|CONNECT) \S+ HTTP\/\d+(\.\d+)?/) ||
+        (($$thing =~ /^[a-z0-9_-]+: [^\x0d]*\z/i) &&
+         # skip curl error messages
+         ($$thing !~ /^curl: \(\d+\) /))) {
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e361e6d..9f26195 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -43,6 +43,8 @@ SRC_URI = " \
     file://CVE-2026-4873.patch \
     file://CVE-2026-13608.patch \
     file://CVE-2026-8286.patch \
+    file://CVE-2026-8927-dependent.patch \
+    file://CVE-2026-8927.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


