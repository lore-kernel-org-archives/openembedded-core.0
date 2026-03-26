Return-Path: <sudumbha@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B499109E54D
	for <webhook@archiver.kernel.org>; Thu, 26 Mar 2026 05:00:19 +0000 (UTC)
Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41402.1774501210925647554
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Mar 2026 22:00:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport01 header.b=bcIlCYo+;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: sudumbha@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=5801; q=dns/txt;
  s=iport01; t=1774501210; x=1775710810;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=vKQb13xP/jsupjN1wzEEK5fRhDDuuT3Vsk/5r/aa2no=;
  b=bcIlCYo+1pe70KJSxK67mwI0LJ6/w36NuhsKACQKkPkkWulogOY5tsH0
   717VyGT1K2UJaoJajy4ETW0V61woJi2LZiAII4d4Aj7kc52qCiY0hKNgi
   pCr0WriJZUJzdrrX6yWM9J0WwOtZ8WXuCFLN5R2OYYPGsX/rjSWucKAbU
   YoGAk+HCTWS4KlVQuBAcksqO7KJvOVaYrZgfEfhSBIpudr+V+nCmOdqA8
   MPPGQXOsesEQVNb0l40yMSKfO4jnL3+03+9aum0TVE3PR5pU00sR/kIIA
   tbDvzMxYWU0mQrhjOUjKomWnqiDECx4b6jeaRHi9Ilzk6K4P9eIZcD8zB
   w==;
X-CSE-ConnectionGUID: KBP55jo2QrSHLFqF1Jfr4g==
X-CSE-MsgGUID: 58pj7zC/Q6KbtB1MXVqz6w==
X-IPAS-Result: =?us-ascii?q?A0B8AAD3u8Rp/4//Ja1aHAEBAQEBAQcBARIBAQQEAQGBf?=
 =?us-ascii?q?AcBAQsBgkcPcV5DSYxzhzeCIZ4dgX8PAQEBD0QNBAEBkiwCJjQJDgECBAEBA?=
 =?us-ascii?q?QEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4Thk8NhloBLQsBGAFZAwECF?=
 =?us-ascii?q?wEBQSMhgwIBgnMDEQaxIoF5M4EBgygBMQUJAgJAAU/bJgELFAGBOAGFO4gbW?=
 =?us-ascii?q?xgBhHonGxuBcoQHdoEFgVwBAQEBgSUhYAIGhXQEgiKBDoFhg3sGjCBIgR4DW?=
 =?us-ascii?q?SwBVRMNCgsHBYFmAzUSKhVuMh2BIz4XgQwbBwWCBA+IbXRtgROEFigDCxgNS?=
 =?us-ascii?q?BEsNxQbBD5uB4xeM4I0YSQJAQciAQGCAjALCx6TGJABgiGhDgoog3SMHo4Nh?=
 =?us-ascii?q?y0aM4VbpRCZBo4Jh12BHIxvaIRogWg8gUcLB3AVgyIJFjMZD44qDguBdoFog?=
 =?us-ascii?q?X+EQcMJJjICCTIBAQcCBw0DC4FokAACJAKBVQEB?=
IronPort-Data: A9a23:+PwUEqPnDfINpJHvrR30lsFynXyQoLVcMsEvi/4bfWQNrUp30WFWz
 2UWWG3TM/mMYmGjeIojYY3joU5QuJKEyYNnHnM5pCpnJ55oRWUpJjg4wmPYZX76whjrFRo/h
 ykmQoCeaphyFTmE+kvF3oHJ9RFUzbuPSqf3FNnKMyVwQR4MYCo6gHqPocZh6mJTqYb/WVjlV
 e/a+ZWFZgf+gWMsaAr41orawP9RlKWq0N8nlgRWicBj5Df2i3QTBZQDEqC9R1OQapVUBOOzW
 9HYx7i/+G7Dlz91Yj9yuu+mGqGiaue60Tmm0hK6aYD76vRxjnBaPpIACRYpQRw/ZwNlMDxG4
 I4lWZSYEW/FN0BX8QgXe0Ew/ypWZcWq9FJbSJSymZT78qHIT5fj69ZENBxrP4pCw/xMIUVg7
 NJBCj4XMh/W0opawJrjIgVtrt4oIM+uOMYUvWttiGmHS/0nWpvEBa7N4Le03h9p2ZsIRqmYP
 ZdEL2MzN3wsYDUXUrsTIIkjkPqtjHn2WzZZs1mS46Ew5gA/ySQuiOWyYYGLJoXiqcN9wxaAp
 D3U1CPAXDIQKPbG7Aq762Dymbqa9c/8cMdIfFGizdZtmFCVy2kZBREaWFf+qv6jh2a6WslDM
 AoT4icooK04+UCnQ9W7WAe3yENopTYGUNZWVul/4waXx++MvUCSB3MPSXhKb9lOWNIKeAHGH
 2Shx7vBbQGDepXMIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:oLoQmKH5S0ZieFtQpLqE/ceALOsnbusQ8zAXPidKOH5om6Oj+f
 xG8M536faWskdzZJhDo7G90cC7KBu2n6KdirN/AV7NZmXbUROTTL2LKeDZslnd8+qUzJ856Z
 td
X-Talos-CUID: 9a23:jqpz+2A2r/BFDw36EwpNzBNJGMd/S2fm7FP+OmHhK2hzFLLAHA==
X-Talos-MUID: 9a23:BpNmdgTInYsto45LRXSx1Clga9VDpJ3wK0oRu8wji/edJ3JvbmI=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="6.23,141,1770595200"; 
   d="scan'208";a="705793641"
Received: from rcdn-l-core-06.cisco.com ([173.37.255.143])
  by alln-iport-1.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 26 Mar 2026 05:00:09 +0000
Received: from sjc-ads-7443.cisco.com (sjc-ads-7443.cisco.com [10.30.220.228])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by rcdn-l-core-06.cisco.com (Postfix) with ESMTPS id C36B21800024A
	for <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:00:09 +0000 (GMT)
Received: by sjc-ads-7443.cisco.com (Postfix, from userid 1840713)
	id 66B48CCD9B4; Wed, 25 Mar 2026 22:00:09 -0700 (PDT)
From: "Sudhir Dumbhare -X (sudumbha - E INFOCHIPS PRIVATE LIMITED at Cisco)" <sudumbha@cisco.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap][PATCH 1/2][PATCH] curl: fix CVE-2026-3783
Date: Wed, 25 Mar 2026 21:48:11 -0700
Message-ID: <20260326044809.2004530-4-sudumbha@cisco.com>
X-Mailer: git-send-email 2.44.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.220.228, sjc-ads-7443.cisco.com
X-Outbound-Node: rcdn-l-core-06.cisco.com
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 26 Mar 2026 05:00:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/233949

From: Sudhir Dumbhare <sudumbha@cisco.com>

This patch applies the upstream fix [1] as referenced in [2]
which is mentioned in [3]:

[1] https://github.com/curl/curl/commit/e3d7401a32a46516c9e5ee877e613e62ed35bddc
[2] https://curl.se/docs/CVE-2026-3783.html
[3] https://nvd.nist.gov/vuln/detail/CVE-2026-3783

Signed-off-by: Sudhir Dumbhare <sudumbha@cisco.com>
---
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


