Return-Path: <devanshp@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84107C79F85
	for <webhook@archiver.kernel.org>; Fri,  4 Sep 2026 09:00:16 +0000 (UTC)
Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9554.1788512410066615658
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Sep 2026 02:00:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=DQGzhNlQ;
 spf=pass (domain: cisco.com, ip: 173.37.142.91, mailfrom: devanshp@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=14692; q=dns/txt;
  s=iport01; t=1788512410; x=1789722010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=tx0cPMAeUiKznjjT4tcnDJ8UutzrQTjLLLgIJGhYJB4=;
  b=DQGzhNlQAgLWxqkg3KDHDInGJ9eOQcQDbp/ABLTE5rJqjNqijGl25D4J
   RUILTNWQPpXD3V3WMz+BCJo7ItzUX6GmVyCCUnVts8fzsZrGLfP9o+8h2
   vlPDgAhvJHBljhEWaGZUEMnN8Rr66eYxJgkoNF7GKdpHa6rGKT12O2F5L
   H1FJj+oP7a5FseR0OjkuhrZF5+RtArO/6o8cin0F3Fy+g9BeFS/Weg+l0
   Fqth1lFdniicP2stgPCuwAiGbCe9dFktRDGS7J5B+gsjjhoOyAfLOEcIZ
   WZqpHbiwgMs80MMZKlU+Q+ir5sL/0Sdlox5xRIzT+FKDya9h2whHhsKWM
   w==;
X-CSE-ConnectionGUID: eprmqjjaRQS4s65gS2k0mw==
X-CSE-MsgGUID: jnj59r0ySt+YdiAiBb0m6A==
X-IPAS-Result: =?us-ascii?q?A0AaAABwh5pq/4wQJK1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBglZ0YENJjHKJWAOBE50IFIFqDwEBAQ9EDQQBAYFxASCCcwKOAgImN?=
 =?us-ascii?q?AkOAQIEAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDZAZAQIBAycLA?=
 =?us-ascii?q?RgBLRAcAwECLysjCBmDAgGCdAMRBsI4gXkzgQGDKAE/AgJAAVDbMQELFAEFg?=
 =?us-ascii?q?TMBhT6IIl0YAYNdgR8nGxuBcoEVgnN2gQWBXAIBAYEhAwEhhl0Egg0VgQyBW?=
 =?us-ascii?q?h5wgSWDRIwWSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EHGwYFgR2BJ?=
 =?us-ascii?q?4M/Ixk2eoEJXoErKWABEheBCYIIAoJUggMCAUlDDgdHUwknQQQLGA1IESw3F?=
 =?us-ascii?q?RkEPm4Hjl8fghg3ATEpBgEhAgoBExYBAQQrcTooAjcCDBUIkmgMJJADgiGBN?=
 =?us-ascii?q?Z9aCiiDdowilToaM4QEgVeSQJJSmQiOCpU0NBtNhGmBaDyBWXAVO4JnCQkNN?=
 =?us-ascii?q?BkPji4LC4NghUF/xXknMgIJMgEBBwIHDgMLgWiQAIF+AQE?=
IronPort-Data: A9a23:6CuyS68ZjCYVA+9urmN9DrUD1n+TJUtcMsCJ2f8bNWPcYEJGY0x3y
 2sYUW3QM6neamOkLtx+PIS+/E9T65LQnddjGVdppCBEQiMRo6IpJzg2wmQcns+2BpeeJK6yx
 5xGMrEsFOhtEDmE4EzrauS9xZVF/fngbqLmD+LZMTxGSwZhSSMw4TpugOdRbrRA2bBVOCvT/
 4mvyyHjEAX9gWAsYzpPs/7rRC5H5ZwehhtJ5jTSWtgT1LPuvyF9JI4SI6i3M0z5TuF8dsamR
 /zOxa2O5WjQ+REgELuNyt4XpWVTH9Y+lSDX4pZnc/DKbipq/0Te4Y5nXBYoUnq7vh3S9zxHJ
 HqhgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/wmWeG0YAzcmCA2k7JZcd4+R1CFt3z
 qADdm0CVUqA3+eplefTpulE3qzPLeHiOIcZ/3UlxjbDALN+GtbIQr7B4plT2zJYasJmRKmFI
 ZFHL2MxKk2cO3WjOX9PYH46tOulmHD5aD1AgFmUvqEwpWPUyWSd1ZC9a4KOIIXVHJQ9ckCwp
 GTEojXjWgAhKJ+uxTus81im3uqRtHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJZF+k8rQXIwa3O7kPBXS4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rBnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:U2Vjl6FndtqGd/wQpLqEMMeALOsnbusQ8zAXPo5KJiC9Ffbo8P
 xG88576faZslsssTQb6LK90cq7MBfhHOBOgbX5VI3KNGKNhILrFvAG0WKI+VPd8kPFmtK1/J
 0QFZSWcOeAbmRSvILd/BSyFcomzZ2s9aClgvqb8lJWJDsaEp2JK2xCe32m+oocfng/OaYE
X-Talos-CUID: 9a23:Z5S822yG8WkA0r5ONsJKBgUZAtoga3/fxU3pGBOjVztmc+eWEVqPrfY=
X-Talos-MUID: =?us-ascii?q?9a23=3AlQuYWAzpLIW7qnFp4XLP6Viu5pCaqKaoCh1ci80?=
 =?us-ascii?q?XgNXHBCBxEja3hmyyHKZyfw=3D=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.25,260,1779148800"; 
   d="scan'208";a="830321719"
Received: from alln-l-core-03.cisco.com ([173.36.16.140])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 04 Sep 2026 09:00:09 +0000
Received: from sjc-ads-5197.cisco.com (sjc-ads-5197.cisco.com [10.28.35.211])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "ciscoit-managed-infra-smtp-auth.cisco.com", Issuer "Internal Private TLS SubCA" (verified OK))
	by alln-l-core-03.cisco.com (Postfix) with ESMTPS id 6613918001262;
	Fri,  4 Sep 2026 09:00:08 +0000 (GMT)
Received: by sjc-ads-5197.cisco.com (Postfix, from userid 1887503)
	id EF579CC12A8; Fri,  4 Sep 2026 02:00:07 -0700 (PDT)
From: "Devansh Patel -X (devanshp - E INFOCHIPS PRIVATE LIMITED at Cisco)" <devanshp@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: xe-linux-external@cisco.com
Subject: [OE-core][scarthgap][PATCH 3/6] curl: Fix CVE-2026-8927
Date: Fri,  4 Sep 2026 02:00:04 -0700
Message-Id: <20260904090007.27374-3-devanshp@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20260904090007.27374-1-devanshp@cisco.com>
References: <20260904090007.27374-1-devanshp@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Auto-Response-Suppress: DR, OOF, AutoReply
X-Outbound-Client-TLS: VERIFIED;sjc-ads-5197.cisco.com [10.28.35.211];TLSv1.3;TLS_AES_256_GCM_SHA384;256;ciscoit-managed-infra-smtp-auth.cisco.com
X-Outbound-SMTP-Client: 10.28.35.211, sjc-ads-5197.cisco.com
X-Outbound-Node: alln-l-core-03.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Sep 2026 09:00:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/245078

From: Devansh Patel <devanshp@cisco.com>

This patch applies the upstream fix as referenced in [2], using the
commit shown in [1]. The test-only prerequisite uses [3] to provide
positive digest-auth feature detection on curl 8.7.1.

[1] https://github.com/curl/curl/commit/5c225384b8d52c67ce8259c6e4203bc57aacb567
[2] https://curl.se/docs/CVE-2026-8927.html
[3] https://github.com/curl/curl/commit/1968b32afd8e41fbb87f8911d15c552c6b705385

Signed-off-by: Devansh Patel <devanshp@cisco.com>
---
 .../curl/curl/CVE-2026-8927-dependent.patch   |  41 ++
 .../curl/curl/CVE-2026-8927.patch             | 375 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   2 +
 3 files changed, 418 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-8927.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
new file mode 100644
index 0000000000..35ff6a9413
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8927-dependent.patch
@@ -0,0 +1,41 @@
+From 9c85f980c3350b59736e4844da34e7f4b726e9c5 Mon Sep 17 00:00:00 2001
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
+- curl 8.7.1 uses the older disabled helper rather than buildinfo. Initialize
+  digest-auth positively in runtests.pl and retain the existing disabled-list
+  pass to clear it when CURL_DISABLE_DIGEST_AUTH is configured.
+- Scope the backport to the digest-auth detection needed by tests 1647 and
+  1686; omit the buildinfo rename and unrelated feature-reporting changes.
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
index 0000000000..d2bb76e91e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-8927.patch
@@ -0,0 +1,375 @@
+From 66ff71c5c22eed2dfb9c5dbd925e83e37e0d732d Mon Sep 17 00:00:00 2001
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
+- curl 8.7.1 predates the curlx allocation aliases, so the new envproxy state
+  uses the equivalent free() and strdup() calls.
+- curl 8.7.1 frees the parsed proxy string earlier. Keep it alive until the
+  shared cleanup path so the new Digest-state comparison can use it safely.
+- Include vauth/vauth.h explicitly because the target's existing url.c
+  includes do not declare Curl_auth_digest_cleanup().
+- Register test1647 and lib1647 in the target-version Makefile.inc lists,
+  independently of lib1588 from CVE-2026-7168, and adapt the newer libtest
+  entry point to the 8.7.1 test harness.
+- Use the target harness feature names digest-auth and lowercase debug. The
+  preceding test-only dependency backports positive digest-auth detection
+  from curl commit 1968b32afd8e while retaining disabled-build detection.
+
+(cherry picked from commit 5c225384b8d52c67ce8259c6e4203bc57aacb567)
+Signed-off-by: Devansh Patel <devanshp@cisco.com>
+---
+ lib/url.c                  |  13 +++-
+ lib/urldata.h              |   1 +
+ tests/data/Makefile.inc    |   2 +
+ tests/data/test1647        | 103 ++++++++++++++++++++++++++++++
+ tests/libtest/Makefile.inc |   5 ++
+ tests/libtest/lib1647.c    | 124 +++++++++++++++++++++++++++++++++++++
+ 6 files changed, 247 insertions(+), 1 deletion(-)
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
+index 3ec7fa4e21..7452061ea9 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -210,6 +210,8 @@ test1620 test1621 test1629 \
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
+index 0000000000..ecd1cf01c7
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
++7
++</errorcode>
++</verify>
++</testcase>
+diff --git a/tests/libtest/Makefile.inc b/tests/libtest/Makefile.inc
+index 9d3356aaf5..639d010a00 100644
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
+index 0000000000..2cf4c30da9
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
++  int res = CURLE_OK;
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
++  return (CURLcode)res; /* failure */
++}
++
++static CURLcode run1647(CURL *curl, const char *url, const char *userpwd)
++{
++  CURLcode res = CURLE_OK;
++
++  res = init1647(curl, url, userpwd);
++  if(res)
++    return res;
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
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 6516c95030..f22e69fba4 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -43,6 +43,8 @@ SRC_URI = " \
     file://CVE-2026-4873.patch \
     file://CVE-2026-8286.patch \
     file://CVE-2026-8924.patch \
+    file://CVE-2026-8927-dependent.patch \
+    file://CVE-2026-8927.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.35.6


