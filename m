Return-Path: <dkelaiya@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3592CCF2E0
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 06:43:33 +0000 (UTC)
Received: from rcdn-iport-2.cisco.com (rcdn-iport-2.cisco.com [173.37.86.73])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.28815.1792392206077915467
 for <openembedded-core@lists.openembedded.org>;
 Sun, 18 Oct 2026 23:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=NyFOyyI7;
 spf=pass (domain: cisco.com, ip: 173.37.86.73, mailfrom: dkelaiya@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=10014; q=dns/txt;
  s=iport01; t=1792392206; x=1793601806;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yJx6o7wNE3RXqvNQ3zoewYC5vAvDOtREMXQ8KUG7hOg=;
  b=NyFOyyI7va1yGBqH1brJ9oyjKNRhoHajYefB5DQColX5GvBGllILTDez
   kqIGQK27yXyz1fDOp+0vvJt8XfmPyrYGkxqJ+5pUlR3+HkBWBQa2AdueU
   zoifyUz6DSi7duB0Oxfl3maNexQlmg31WxeBGukigATwKLTJzhSMqgffH
   fSU0LK/A0Pvs94k+YZUYLJ+IaKW4C6k1k2esxXd2B1i11ncryXKSKbHlw
   OK6sHothy0HlEMxbvQ+J9LHCr8A+s6mc/Yd5i/BN51aTeSppbTXAGtWQG
   Hb4Xz+DGcv7daHsGQye+BDApX1+nsu3ENaHKqVgCTZ4p7eWTrXdA+I+K9
   A==;
X-CSE-ConnectionGUID: dxIu3cLHQ1efBGcICHNEMA==
X-CSE-MsgGUID: nA8zVMs4Qy6CY/f577A4tg==
X-IPAS-Result: =?us-ascii?q?A0BHAgBsu9Vq/5T/Ja1aHgEBCxIMggULgld1YENJlkoDn?=
 =?us-ascii?q?hyBfg8BAQEPRA0EAQGFBQKOFQImNAkOAQIEAwIDAQEBAQEBAQEBAQEBCgEBB?=
 =?us-ascii?q?QEBAQIBBwWBDhOGTw2QEgECAQMnCwEYAS0QHAMBAi8rIwgZgwIBgnQDEQa9H?=
 =?us-ascii?q?Rs3gXkzgQGDKQE/AgJAAVDbMgELFAGBOIVAiCNdGAGEfCcbG4FyglCCLoEFg?=
 =?us-ascii?q?VwCAYFHhl0EgiJ6EoFaHmWUWkiBHgNZLAFVEw0KCwcFgWgDNRIqFW4yHYEjP?=
 =?us-ascii?q?heBBxsGBYEdgSCCFiMZNnqBCV6BKylgARAXgQmCBwKCVIIAAgFJQQ4HRVMJJ?=
 =?us-ascii?q?UMSRyYiCBIJARMaMAuBGzg8CShBFwxzDB0FcggCDQkHTRgNSBEsNxUZBD5uB?=
 =?us-ascii?q?5IqHoJlAWAtASkBAReBawIEHxYLFgijG4IhoQ8KKIN2jCKVOhozhASBV5JAk?=
 =?us-ascii?q?lQLmH2OCpVoG02EaYFoPIFZcBU7gmcJFjQZD44rDguBeIFohkDIGicyAgkyA?=
 =?us-ascii?q?QEHAgcOAwuBaJF+AQE?=
IronPort-Data: A9a23:1fzE3aiW6Fs+sfgXM6RTHAKIX161MREKZh0ujC45NGQN5FlHY01je
 htvCz2Fb/ffa2L9L98nbd/l90hVuMTSzd4xHQZlqH1nRiljpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+FHwdOCn8ikkvU2xbuKUIPbePSxsThNTRi4kiBZy88Y0mYcAbeKRW2thg
 vus5ZeAULOZ82QsaDxNs/vS8EoHUMna4Vv0gHRvPZing3eG/5UlJMp3Db28KXL+Xr5VEoaSL
 87fzKu093/u5BwkDNWoiN7TKiXmlZaLYGBiIlIPM0STqkAqSh4ai87XB9JAAatjsAhlqvgqo
 Dl7WTNcfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQqflO0q8iCAn3aMqUU6sdqWmpq1
 cVBJT4nQRuirMKQ7ZeSH7wEasQLdKEHPasFsX1miDWcBvE8TNWaGuPB5MRT23E7gcUm8fT2P
 pVCL2EwKk6dPlsWZgd/5JEWxI9EglHzcDBcoVOErII84nPYy0p6172F3N/9J4bQFJQNwhrAz
 o7A12LQUgMkEcfD8Cvb2UPriLKQwgqnRI1HQdVU8dYv2jV/3Fc7DwUbU1a+q/S1hkOyHtlYM
 UE8/is1sbN081SmSNT4VRC0rHOI+BkGVLJt//YS8gqBzO/Qpg2eHGVBF2cHY909v8hwTjsvv
 rOUo+7U6fVUmOX9YRqgGn289Fte5QB9wbc+WBI5
IronPort-HdrOrdr: A9a23:Q+Ko9a6gRPnx0BHFxAPXwOrXdLJyesId70hD6qm+c3Nom6uj5q
 eTdZsgtCMc5Ax9ZJhko6HjBEDiewK5yXcK2+ks1N6ZNWGM0ldAbrsSiLcKqAePJ8SRzIJgPN
 9bAstDIey1K0RmhsDn5wT9OdMhzN6btJ2Mv47lvhFQpcUAUdAZ0++/YTzra3FLeA==
X-Talos-CUID: =?us-ascii?q?9a23=3ADYGlzWkHHzOek+rSnD7UNKcATxvXOXHN7WqLKGu?=
 =?us-ascii?q?YMD9kRpe6Qn672IVJtuM7zg=3D=3D?=
X-Talos-MUID: 9a23:qg9AVQgFMbZ4DH9mKCgazcMpMu448ZqLExw0gMstio6KaHMvEmuBg2Hi
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.27,167,1787011200"; 
   d="scan'208";a="522990440"
Received: from rcdn-l-core-11.cisco.com ([173.37.255.148])
  by rcdn-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 19 Oct 2026 06:43:25 +0000
Received: from sjc-ads-5675.cisco.com (sjc-ads-5675.cisco.com [10.28.88.189])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-11.cisco.com (Postfix) with ESMTPS id E951A180002E7;
	Mon, 19 Oct 2026 06:43:24 +0000 (GMT)
Received: by sjc-ads-5675.cisco.com (Postfix, from userid 1887444)
	id 8A1FACBF203; Sun, 18 Oct 2026 23:43:24 -0700 (PDT)
From: "Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE LIMITED at Cisco)" <dkelaiya@cisco.com>
To: openembedded-core@lists.openembedded.org
Cc: Darsh Kelaiya <dkelaiya@cisco.com>
Subject: [OE-core][wrynose][PATCH 3/5] curl: fix CVE-2026-80255
Date: Sun, 18 Oct 2026 23:43:18 -0700
Message-Id: <20261019064320.3978613-4-dkelaiya@cisco.com>
X-Mailer: git-send-email 2.35.6
In-Reply-To: <20261019064320.3978613-1-dkelaiya@cisco.com>
References: <20261019064320.3978613-1-dkelaiya@cisco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-Client-TLS: ANONYMOUS;sjc-ads-5675.cisco.com [10.28.88.189];TLSv1.3;TLS_AES_256_GCM_SHA384;256
X-Outbound-SMTP-Client: 10.28.88.189, sjc-ads-5675.cisco.com
X-Outbound-Node: rcdn-l-core-11.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 06:43:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248134

From: Darsh Kelaiya <dkelaiya@cisco.com>

This patch applies the upstream fix as referenced in [2],
using the commit shown in [1].

Apply prerequisite [3] to reject TABs in cookie attribute values.
Retain test 1685 alongside the main fix and test 2885. Keep the
8.19.0 invalid_octets() adaptation that prevents test 1105 regressions.

[1] https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d350aa0a
[2] https://curl.se/docs/CVE-2026-80255.html
[3] https://github.com/curl/curl/commit/8e8bdd36048c146fe843d8948a912fbd398d1c5d

Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
---
 .../curl/curl/CVE-2026-80255-dependent.patch  | 139 ++++++++++++++++++
 .../curl/curl/CVE-2026-80255.patch            | 125 ++++++++++++++++
 meta/recipes-support/curl/curl_8.19.0.bb      |   2 +
 3 files changed, 266 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-80255.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch
new file mode 100644
index 0000000000..ca7737e5dd
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80255-dependent.patch
@@ -0,0 +1,139 @@
+From 8e8bdd36048c146fe843d8948a912fbd398d1c5d Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Wed, 1 Apr 2026 08:09:47 +0200
+Subject: [PATCH] cookie: fix rejection when tabs in value
+
+A previous refactor changed the TAB check so that the octet could be
+accepted in the 'path', which would cause an invalid line in the saved
+cookie file so not possible to read the cookie back. Not terrible
+because the path cannot contain a raw tab anyway so it would never match
+anyway.
+
+Add test 1685 to verify
+
+Reported-by: Izan on hackerone
+
+Closes #21185
+
+CVE: CVE-2026-80255
+Upstream-Status: Backport [https://github.com/curl/curl/commit/8e8bdd36048c146fe843d8948a912fbd398d1c5d]
+
+Backport Changes:
+- Registered test 1685 in the older curl 8.19.0 test-list row.
+
+(cherry picked from commit 8e8bdd36048c146fe843d8948a912fbd398d1c5d)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c           | 14 ++++++-------
+ tests/data/Makefile.am |  2 +-
+ tests/data/test1685    | 57 ++++++++++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 65 insertions(+), 8 deletions(-)
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 4d53cc4..cd95130 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -461,6 +461,13 @@ parse_cookie_header(struct Curl_easy *data,
+         sep = TRUE; /* a '=' was used */
+         if(!curlx_str_cspn(&ptr, &val, ";\r\n"))
+           curlx_str_trimblanks(&val);
++
++        /* Reject cookies with a TAB inside the value */
++        if(curlx_strlen(&val) &&
++           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
++          infof(data, "cookie contains TAB, dropping");
++          return CURLE_OK;
++        }
+       }
+       else
+         curlx_str_init(&val);
+@@ -489,13 +496,6 @@ parse_cookie_header(struct Curl_easy *data,
+           return CURLE_OK;
+         }
+ 
+-        /* Reject cookies with a TAB inside the value */
+-        if(curlx_strlen(&val) &&
+-           memchr(curlx_str(&val), '\t', curlx_strlen(&val))) {
+-          infof(data, "cookie contains TAB, dropping");
+-          return CURLE_OK;
+-        }
+-
+         /* Check if we have a reserved prefix set. */
+         if(!strncmp("__Secure-", curlx_str(&name), 9))
+           co->prefix_secure = TRUE;
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index ea700cd..5bb4f7e 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -226,7 +226,7 @@ test1660 test1661 test1662 test1663 test1664 test1665 \
+ \
+ test1670 test1671 \
+ \
+-test1680 test1681 test1682 test1683 \
++test1680 test1681 test1682 test1683 test1685 \
+ \
+ test1700 test1701 test1702 test1703 test1704 test1705 test1706 test1707 \
+ test1708 test1709 test1710 test1711 test1712 \
+diff --git a/tests/data/test1685 b/tests/data/test1685
+new file mode 100644
+index 0000000..b98dc20
+--- /dev/null
++++ b/tests/data/test1685
+@@ -0,0 +1,57 @@
++<?xml version="1.0" encoding="US-ASCII"?>
++<testcase>
++<info>
++<keywords>
++HTTP
++cookies
++</keywords>
++</info>
++
++# Server-side
++<reply>
++<data crlf="headers">
++HTTP/1.0 200 OK swsclose
++Date: Tue, 09 Nov 2010 14:49:00 GMT
++Content-Type: text/html
++Set-Cookie: name=content; path=/we%TABwant
++Set-Cookie: accept=this; path=/only/this
++
++boo
++</data>
++</reply>
++
++# Client-side
++<client>
++<server>
++http
++</server>
++<name>
++HTTP, reject cookie with tab in path
++</name>
++<command>
++http://%HOSTIP:%HTTPPORT/ -c %LOGDIR/jar%TESTNUMBER.txt
++</command>
++
++<features>
++cookies
++</features>
++</client>
++
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="headers">
++GET / HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<file name="%LOGDIR/jar%TESTNUMBER.txt" mode="text">
++# Netscape HTTP Cookie File
++# https://curl.se/docs/http-cookies.html
++# This file was generated by libcurl! Edit at your own risk.
++
++127.0.0.1%TABFALSE%TAB/only/this%TABFALSE%TAB0%TABaccept%TABthis
++</file>
++</verify>
++</testcase>
diff --git a/meta/recipes-support/curl/curl/CVE-2026-80255.patch b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
new file mode 100644
index 0000000000..50af08fc3c
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-80255.patch
@@ -0,0 +1,125 @@
+From 4f6aa41a0145e930e766775dbe860883d350aa0a Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Thu, 27 Aug 2026 08:33:30 +0200
+Subject: [PATCH] cookie: improve TAB handling
+
+For entries with a leading tab. Verified in test 2885.
+
+Reported-by: Stanislav Fort
+Closes #22699
+
+CVE: CVE-2026-80255
+Upstream-Status: Backport [https://github.com/curl/curl/commit/4f6aa41a0145e930e766775dbe860883d350aa0a]
+
+Backport Changes:
+- Made invalid_octets() reject TAB as required by the curl 8.19.0
+  parser; without this adaptation, upstream test 1105 regresses.
+- Registered test 2885 in the older test-list layout.
+
+(cherry picked from commit 4f6aa41a0145e930e766775dbe860883d350aa0a)
+Signed-off-by: Darsh Kelaiya <dkelaiya@cisco.com>
+---
+ lib/cookie.c           |  6 ++---
+ tests/data/Makefile.am |  2 +-
+ tests/data/test2885    | 52 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 56 insertions(+), 4 deletions(-)
+ create mode 100644 tests/data/test2885
+
+diff --git a/lib/cookie.c b/lib/cookie.c
+index 4d53cc4..c3adf1d 100644
+--- a/lib/cookie.c
++++ b/lib/cookie.c
+@@ -354,9 +354,9 @@ static bool bad_domain(const char *domain, size_t len)
+ static bool invalid_octets(const char *ptr, size_t len)
+ {
+   const unsigned char *p = (const unsigned char *)ptr;
+-  /* Reject all bytes \x01 - \x1f (*except* \x09, TAB) + \x7f */
++  /* Reject all bytes \x01 - \x1f + \x7f */
+   while(len && *p) {
+-    if(((*p != 9) && (*p < 0x20)) || (*p == 0x7f))
++    if((*p < 0x20) || (*p == 0x7f))
+       return TRUE;
+     p++;
+     len--;
+@@ -453,7 +453,7 @@ parse_cookie_header(struct Curl_easy *data,
+     struct Curl_str val;
+ 
+     /* we have a <name>=<value> pair or a stand-alone word here */
+-    if(!curlx_str_cspn(&ptr, &name, ";\t\r\n=")) {
++    if(!curlx_str_cspn(&ptr, &name, ";\r\n=")) {
+       bool sep = FALSE;
+       curlx_str_trimblanks(&name);
+ 
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index 13e47a3..18e7730 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -272,7 +272,7 @@ test2600 test2601 test2602 test2603 test2604 test2605 \
+ test2700 test2701 test2702 test2703 test2704 test2705 test2706 test2707 \
+ test2708 test2709 test2710 test2711 test2712 test2713 test2714 test2715 \
+ test2716 test2717 test2718 test2719 test2720 test2721 test2722 test2723 \
+-\
++test2885 \
+ test3000 test3001 test3002 test3003 test3004 test3005 test3006 test3007 \
+ test3008 test3009 test3010 test3011 test3012 test3013 test3014 test3015 \
+ test3016 test3017 test3018 test3019 test3020 test3021 test3022 test3023 \
+diff --git a/tests/data/test2885 b/tests/data/test2885
+new file mode 100644
+index 0000000..456224f
+--- /dev/null
++++ b/tests/data/test2885
+@@ -0,0 +1,52 @@
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
++<data crlf="headers">
++HTTP/1.1 200 OK
++Content-Length: 0
++Set-Cookie: thisis=SECRET;%TABSecure
++Set-Cookie: also=notab; Secure
++
++</data>
++</reply>
++
++<client>
++<features>
++cookies
++</features>
++<server>
++https
++</server>
++<name>
++Cookies with TAB before 'secure'
++</name>
++<command>
++https://cookie.example:%HTTPSPORT/%TESTNUMBER -c %LOGDIR/cookies.txt --resolve cookie.example:%HTTPSPORT:%HOSTIP --insecure
++</command>
++</client>
++
++<verify>
++<protocol crlf="headers">
++GET /%TESTNUMBER HTTP/1.1
++Host: cookie.example:%HTTPSPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<file name="%LOGDIR/cookies.txt" mode="text">
++# Netscape HTTP Cookie File
++# https://curl.se/docs/http-cookies.html
++# This file was generated by libcurl! Edit at your own risk.
++
++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABalso%TABnotab
++cookie.example%TABFALSE%TAB/%TABTRUE%TAB0%TABthisis%TABSECRET
++</file>
++</verify>
++</testcase>
+-- 
+2.35.6
diff --git a/meta/recipes-support/curl/curl_8.19.0.bb b/meta/recipes-support/curl/curl_8.19.0.bb
index 322304f47d..33954465f7 100644
--- a/meta/recipes-support/curl/curl_8.19.0.bb
+++ b/meta/recipes-support/curl/curl_8.19.0.bb
@@ -42,6 +42,8 @@ SRC_URI = "https://curl.se/download/${BP}.tar.xz \
            file://CVE-2026-8926_p1.patch \
            file://CVE-2026-8926_p2.patch \
            file://CVE-2026-11564.patch \
+           file://CVE-2026-80255-dependent.patch \
+           file://CVE-2026-80255.patch \
            file://CVE-2026-80230.patch \
            "
 
-- 
2.35.6


