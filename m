Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C142106F31A
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 10:16:10 +0000 (UTC)
Received: from alln-iport-2.cisco.com (alln-iport-2.cisco.com [173.37.142.89])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.44098.1774520166639519599
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Mar 2026 03:16:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=aIW9QH+Q;
 spf=pass (domain: cisco.com, ip: 173.37.142.89, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5878; q=dns/txt;
  s=iport01; t=1774520166; x=1775729766;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=6DS2YmiTqpktkftkwA87b346DIJeOrkmfEHK6p98qV0=;
  b=aIW9QH+Qh+97E0K9BeemvKsz7dDyJuAWJomGHIMUlcedjPtFSHyZbN7h
   Qwg7kW158b1ny5N1UwSMeuSQeKPnEeEkWR/VnMhPfstoLatsPPLyJ8hJc
   Gou16o6bIdlnmWlkpr8S4Km6EW3RM3Dzck787gpED5M6j7wuUJ3i/gcJk
   P8CKP8OEy5atmrD68palvPFhNbTaYvqi6qcvnC46/is4ZoFdTLih6dv+f
   ksOZS39IPPknwkJx1jUzCIbFL6AaXpUvJYl1nkrx/lEllzjUWfmb9Z+D8
   YMLsAiXRa0xqyAkGjDAHhKUjmZ9M+QPOmjW8eGWaSlWqJdomYZmpkkn3w
   A==;
X-CSE-ConnectionGUID: 370TOJqXS66eDvf9FUeD4A==
X-CSE-MsgGUID: H6/wOy7DSMCC3emx+pd9XA==
X-IPAS-Result: =?us-ascii?q?A0BvAADQBsVp/4v/Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBgkcPcV5DSYxzhzeCIQOeGoF/DwEBAQ9EDQQBAYUHAo0jAiY0CQ4BA?=
 =?us-ascii?q?gQBAQEBAwIDAQEBAQEBAQEBAQELAQEFAQEBAgEHBYEOE4ZPDYZaAQIBAycLA?=
 =?us-ascii?q?RgBPRwDAQIXAQEWKyMIGYMCAYJzAxEGsnSBeTOBAYMoATEFCQICQAFP2yYBC?=
 =?us-ascii?q?xQBgTgBhTuIG1sYAYR6JxsbgXKEB3aBBYFcAQEBAYElIWACBoV0BIIigQ6BY?=
 =?us-ascii?q?YNXBowdSIEeA1ksAVUTDQoLBwWBZgM1EioVbjIdgSM+F4EMGwcFgWAPiG10b?=
 =?us-ascii?q?YEThBEoAwsYDUgRLDcUGwQ+bgeMSTGCNGEkCQEHIgEBggIwCwsekxiQAYIho?=
 =?us-ascii?q?Q4KKIN0jB6ODYctGjOFW6UQmQaOCYddgRyMb2iEaIFoPIFHCwdwFYMiCRYzG?=
 =?us-ascii?q?Q+OKg4LgXaBaIF/hEHCRiYyAgkyAQEHAgcNAwuBaJAAAiQCgVUBAQ?=
IronPort-Data: A9a23:NGxytays20vmCm4kKjJ6t+dmxyrEfRIJ4+MujC+fZmUNrF6WrkVWn
 2FNWW+EaPaLMWv9fNEgaN62pklX7ZDVmNNhTQptqVhgHilAwSbn6Xt1DatR0we6dJCroJdPt
 p1GAjX4BJlqCCea/VH1buSJQUBUjcmgXqD7BPPPJhd/TAplTDZJoR94kobVuKYw6TSCK13L4
 4iaT/H3Ygf/hWYvaD9MscpvlTs21BjMkGJA1rABTagjUG/2zxE9EJ8ZLKetGHr0KqE8NvK6X
 evK0Iai9Wrf+Ro3Yvv9+losWhRXKlJ6FVHmZkt+A8BOsDAbzsAB+vpT2M4nVKtio27hc+adZ
 zl6ncfYpQ8BZsUgkQmGOvVSO3kW0aZuoNcrLZUj2CCe5xWuTpfi/xlhJBppZbE/2P9HOj8Q+
 NAGJmEjUx2v28vjldpXSsE07igiBNPgMIVavjRryivUSK58B5vCWK7No9Rf2V/chOgXQq2YP
 JVfM2cyKk2bMnWjOX9PYH46tPy1imT6eT1RgFmUvqEwpWPUyWSd1ZCzYYqMJIfbGpk9ckCwh
 jyB4EPoXT0hEfe0kjeA4jG0ir7/tHauMG4VPPjinhJwu3WU3mEVBRgcWFe3rPX8gUmkVvpbK
 lcI4WwptaU0+UmhQ9XxUhH+p2SL1iPwQPJKGOE8rQXIwa3O7kPBXC4PTyVKb5ots8peqSEW6
 2JlVujBXVRH2IB5g1rCnltIhVte4RQoEFI=
IronPort-HdrOrdr: A9a23:Cm57FqMilnrw7cBcTsCjsMiBIKoaSvp037BN7TEUdfU7SKKlfq
 yV8cjzkCWE6wr5O0tQ/OxoWpPgfZq0z/cciuMs1PWZLWvbUQCTQ72Kg7GP/9SZIU3DHio379
 YHT0C4Y+eAamRHsQ==
X-Talos-CUID: 9a23:q4yHc2HUQXbVoy1AqmI8qxYoPeI8QkaDknr8PUHpJ1tkZOG8HAo=
X-Talos-MUID: 9a23:ppDOvgv2UtA2aJdIw82npG8lK+B5vIiVLWsmypgDq4qcOX1AEmLI
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,141,1770595200"; 
   d="scan'208";a="698163974"
Received: from rcdn-l-core-02.cisco.com ([173.37.255.139])
  by alln-iport-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Mar 2026 10:15:59 +0000
Received: from sjc-ads-7443.cisco.com (sjc-ads-7443.cisco.com [10.30.220.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-02.cisco.com (Postfix) with ESMTPS id DA68B18000204
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:15:58 +0000 (GMT)
Received: by sjc-ads-7443.cisco.com (Postfix, from userid 1840713)
	id 82074CCC16B; Thu, 26 Mar 2026 03:15:58 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH v2 2/3] curl: fix CVE-2026-3783
Date: Thu, 26 Mar 2026 03:14:29 -0700
Message-ID: <20260326101429.2634961-2-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
In-Reply-To: <564384.1774517543010119221@lists.openembedded.org>
References: <564384.1774517543010119221@lists.openembedded.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.228, sjc-ads-7443.cisco.com
X-Outbound-Node: rcdn-l-core-02.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 10:16:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233961

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] as referenced in [2]
which is mentioned in [3]:

[1] https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877e613e62ed35bddc
[2] https://curl.se/docs/CVE-2026-3783.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-3783

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
Changes from v1 -> v2:
- Updated with the correct patch series numbering

 .../curl/curl/CVE-2026-3783.patch             | 159 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 160 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2026-3783.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2026-3783.patch b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
new file mode 100644
index 0000000000..02c2d51eb6
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2026-3783.patch
@@ -0,0 +1,159 @@
+From 11c36846187d96ef72abc6aeb5784c002cb212fe Mon Sep 17 00:00:00 2001
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
+
+Backport Changes:
+- in tests/data/Makefile.inc: added test2006 to TESTCASES, adjusted for
+  this version.
+  The TESTCASES in tests/data/Makefile.am was introduced curl-8_10_0 by
+  this commit;
+  https://github.com/curl/curl/commit/f5b826532f2c564ef240df0ba2f3287d521df711
+
+(cherry picked from commit e3d7401a32a46516c9e5ee877e613e62ed35bddc)
+Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
+---
+ lib/http.c              |  1 +
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test2006     | 98 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 100 insertions(+), 1 deletion(-)
+ create mode 100644 tests/data/test2006
+
+diff --git a/lib/http.c b/lib/http.c
+index a764d3c440..3ab6d21b0f 100644
+--- a/lib/http.c
++++ b/lib/http.c
+@@ -673,6 +673,7 @@ output_auth_headers(struct Curl_easy *data,
+   if(authstatus->picked == CURLAUTH_BEARER) {
+     /* Bearer */
+     if((!proxy && data->set.str[STRING_BEARER] &&
++       Curl_auth_allowed_to_host(data) &&
+         !Curl_checkheaders(data, STRCONST("Authorization")))) {
+       auth = "Bearer";
+       result = http_output_bearer(data);
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 4c2cd52999..9fb92742ee 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -230,7 +230,7 @@ test1941 test1942 test1943 test1944 test1945 test1946 test1947 test1948 \
+ test1955 test1956 test1957 test1958 test1959 test1960 test1964 \
+ test1970 test1971 test1972 test1973 test1974 test1975 \
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
+--
+2.44.1
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index e2f6f8472f..07e532721f 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -34,6 +34,7 @@ SRC_URI = " \
     file://CVE-2025-15224.patch \
     file://CVE-2026-1965_p1.patch \
     file://CVE-2026-1965_p2.patch \
+    file://CVE-2026-3783.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.44.4


