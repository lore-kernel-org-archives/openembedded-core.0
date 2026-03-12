Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADDCE106ACF6
	for <webhook@archiver.kernel.org>; Thu, 12 Mar 2026 23:05:37 +0000 (UTC)
Received: from mta-64-228.siemens.flowmailer.net (mta-64-228.siemens.flowmailer.net [185.136.64.228])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3763.1773356734492500665
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Mar 2026 16:05:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=dqJ2f24x;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.228, mailfrom: fm-256628-202603122305303a42214b26000207d7-j7ers7@rts-flowmailer.siemens.com)
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202603122305303a42214b26000207d7
        for <openembedded-core@lists.openembedded.org>;
        Fri, 13 Mar 2026 00:05:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=P85pDBC+bvsQEEigxCcyFDUA+R2fFTz2cpzS8CX2Sks=;
 b=dqJ2f24xOb5PplshyeucS6ELTarqq2QmUtxJdsNokLtbdnAOEGqcamQdbmWh7xAMsh8cOW
 jAkW7Gv9mvQH0BxNHjiNAsAtGgJLFzNIFQtLkKWvudYy1XlWKk3j+5DR/MgPwdMzYZagMhuR
 cQIGsaSF+jsc3bquXgrsDNqJjosK0vlM+niu+a0rer3sv2K1Mm2xDf2gFQBlwZnexV9Kh8nW
 7OrcoelAru3UrNktXzsq0fgNZp7mACSjQFffksJ6x8/dtARHKDIAGpkwgsnBPSfr1PXjJ5cY
 sVnQeGLV8d0RHvT6QwkH0A+tUSeIj31VsLUcBOEo1qdA33Nbj2KKApYQ==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [OE-core][whinlatter][PATCH 2/4] curl: patch CVE-2026-3783
Date: Fri, 13 Mar 2026 00:05:02 +0100
Message-Id: <20260312230504.76461-2-peter.marko@siemens.com>
In-Reply-To: <20260312230504.76461-1-peter.marko@siemens.com>
References: <20260312230504.76461-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Mar 2026 23:05:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233008

From: Peter Marko <peter.marko@siemens.com>

Pick patch from [1].

[1] https://curl.se/docs/CVE-2026-3783.html

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../curl/curl/CVE-2026-3783.patch             | 148 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.17.0.bb      |   1 +
 2 files changed, 149 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 0000000000..11ffaa72de
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,148 @@
+From e3d7401a32a46516c9e5ee877e613e62ed35bddc Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 6 Mar 2026 23:13:07 +0100
+Subject: [PATCH] http: only send bearer if auth is allowed
+
+Verify with test 2006
+
+Closes #20843
+
+CVE: CVE-2026-3783
+Upstream-Status: Backport [https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877e613e62ed35bddc]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ lib/http.c             |  1 +
+ tests/data/Makefile.am |  2 +-
+ tests/data/test2006    | 98 ++++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2006
+
+diff --git a/lib/http.c b/lib/http.c
+index d2f85fc5bf..d61edbd0cd 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -729,6 +729,7 @@ output_auth_headers(struct Curl_easy *data,
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++        Curl_auth_allowed_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+diff --git a/tests/data/Makefile.am b/tests/data/Makefile.am
+index f39568d3b8..6c8be18b32 100644
+--- a/tests/data/Makefile.am
++++ b/tests/data/Makefile.am
+@@ -242,7 +242,7 @@ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 test1976 test1977 \
+ test1978 test1979 test1980 test1981 \
+ \
+-test2000 test2001 test2002 test2003 test2004 test2005 \
++test2000 test2001 test2002 test2003 test2004 test2005 test2006 \
+ \
+                                                                test2023 \
+ test2024 test2025 test2026 test2027 test2028 test2029 test2030 test2031 \
+diff --git a/tests/data/test2006 b/tests/data/test2006
+new file mode 100644
+index 0000000000..200d30a7ce
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
diff --git a/meta/recipes-support/curl/curl_8.17.0.bb b/meta/recipes-support/curl/curl_8.17.0.bb
index 06f4353134..31d34c5390 100644
--- a/meta/recipes-support/curl/curl_8.17.0.bb
+++ b/meta/recipes-support/curl/curl_8.17.0.bb
@@ -22,6 +22,7 @@ SRC_URI = " \
     file://CVE-2025-15224.patch \
     file://CVE-2026-1965-01.patch \
     file://CVE-2026-1965-02.patch \
+    file://CVE-2026-3783.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \

