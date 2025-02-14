Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27562C021A7
	for <webhook@archiver.kernel.org>; Fri, 14 Feb 2025 05:01:07 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.14450.1739509261275864689
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 Feb 2025 21:01:01 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=4140961d8f=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E4VxVm000428
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 05:01:00 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 44rnpbjg0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 05:01:00 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Thu, 13 Feb 2025 21:00:57 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][scarthgap][PATCH 2/3] curl: fix CVE-2025-0167
Date: Fri, 14 Feb 2025 05:00:34 +0000
Message-ID: <20250214050035.1049565-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250214050035.1049565-1-yogita.urade@windriver.com>
References: <20250214050035.1049565-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=B4lD0PtM c=1 sm=1 tr=0 ts=67aece0c cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=T2h4t0Lz3GQA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8 a=yEquWHxyAAAA:8 a=HnMHPIp3AAAA:8 a=t7CeM3EgAAAA:8
 a=tMPonpZVP2yUWZ3PHVcA:9 a=r-HJ9bD__24A:10 a=Wpz8ju6o9T4A:10 a=s5zKW874KtQA:10 a=Ea3xMBwKpvXIEc3eveN9:22 a=_j3XSMEICZ-j_p4bQif0:22 a=j7VXw0cNxiiRp7-5Gr1y:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: 3LDPZX3lGKXp-zmN9GXCXsskNl4wpZdl
X-Proofpoint-GUID: 3LDPZX3lGKXp-zmN9GXCXsskNl4wpZdl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_01,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.21.0-2501170000
 definitions=main-2502140034
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 14 Feb 2025 05:01:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211373

From: Yogita Urade <yogita.urade@windriver.com>

When asked to use a `.netrc` file for credentials *and* to
follow HTTP redirects, curl could leak the password used
for the first host to the followed-to host under certain
circumstances.

This flaw only manifests itself if the netrc file has a
`default` entry that omits both login and password. A
rare circumstance.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-0167

Upstream patch:
https://github.com/curl/curl/commit/0e120c5b925e8ca75d5319e

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../curl/curl/CVE-2025-0167.patch             | 174 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.7.1.bb       |   1 +
 2 files changed, 175 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-0167.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-0167.patch b/meta/recipes-support/curl/curl/CVE-2025-0167.patch
new file mode 100644
index 0000000000..d343fef15e
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-0167.patch
@@ -0,0 +1,174 @@
+From 0e120c5b925e8ca75d5319e319e5ce4b8080d8eb Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 3 Jan 2025 16:22:27 +0100
+Subject: [PATCH] netrc: 'default' with no credentials is not a match
+
+Test 486 verifies.
+
+Reported-by: Yihang Zhou
+
+Closes #15908
+
+CVE: CVE-2025-0167
+Upstream-Status: Backport [https://github.com/curl/curl/commit/0e120c5b925e8ca75d5319e]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/netrc.c             |  15 ++++--
+ tests/data/Makefile.inc |   2 +-
+ tests/data/test486      | 105 ++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 116 insertions(+), 6 deletions(-)
+ create mode 100644 tests/data/test486
+
+diff --git a/lib/netrc.c b/lib/netrc.c
+index 8b0192a..18587f6 100644
+--- a/lib/netrc.c
++++ b/lib/netrc.c
+@@ -308,11 +308,16 @@ static int parsenetrc(struct store_netrc *store,
+
+ out:
+   Curl_dyn_free(&token);
+-  if(!retcode && !password && our_login) {
+-    /* success without a password, set a blank one */
+-    password = strdup("");
+-    if(!password)
+-      retcode = 1; /* out of memory */
++  if(!retcode) {
++    if(!password && our_login) {
++      /* success without a password, set a blank one */
++      password = strdup("");
++      if(!password)
++        retcode = 1; /* out of memory */
++    }
++    else if(!login && !password)
++      /* a default with no credentials */
++      retcode = NETRC_FILE_MISSING;
+   }
+   if(!retcode) {
+     /* success */
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 7a6b153..9dce33c 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -73,7 +73,7 @@ test426 test427 test428 test429 test430 test431 test432 test433 test434 \
+ test435 test436 test437 test438 test439 test440 test441 test442 test443 \
+ test444 test445 test446 test447 test448 test449 test450 test451 test452 \
+ test453 test454 test455 test456 test457 test458 test459 test460 test461 \
+-test462 test463 test467 test468 test478 test479 test480 \
++test462 test463 test467 test468 test478 test479 test480 test486 \
+ \
+ test490 test491 test492 test493 test494 test495 test496 test497 test498 \
+ test499 test500 test501 test502 test503 test504 test505 test506 test507 \
+diff --git a/tests/data/test486 b/tests/data/test486
+new file mode 100644
+index 0000000..d0d6d67
+--- /dev/null
++++ b/tests/data/test486
+@@ -0,0 +1,105 @@
++<testcase>
++<info>
++<keywords>
++netrc
++HTTP
++</keywords>
++</info>
++#
++# Server-side
++<reply>
++<data crlf="yes">
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
++<data2 crlf="yes">
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
++<datacheck crlf="yes">
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
++#
++# Client-side
++<client>
++<server>
++http
++</server>
++<features>
++proxy
++</features>
++<name>
++.netrc with redirect and "default" with no password or login
++</name>
++<command>
++--netrc --netrc-file %LOGDIR/netrc%TESTNUMBER -L -x http://%HOSTIP:%HTTPPORT/ http://a.com/
++</command>
++<file name="%LOGDIR/netrc%TESTNUMBER" >
++
++machine a.com
++  login alice
++  password alicespassword
++
++default
++
++</file>
++</client>
++
++<verify>
++<protocol>
++GET http://a.com/ HTTP/1.1
++Host: a.com
++Authorization: Basic %b64[alice:alicespassword]b64%
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
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.7.1.bb b/meta/recipes-support/curl/curl_8.7.1.bb
index 81243d1873..86e307cfd6 100644
--- a/meta/recipes-support/curl/curl_8.7.1.bb
+++ b/meta/recipes-support/curl/curl_8.7.1.bb
@@ -23,6 +23,7 @@ SRC_URI = " \
     file://CVE-2024-11053-0001.patch \
     file://CVE-2024-11053-0002.patch \
     file://CVE-2024-11053-0003.patch \
+    file://CVE-2025-0167.patch \
 "
 SRC_URI[sha256sum] = "6fea2aac6a4610fbd0400afb0bcddbe7258a64c63f1f68e5855ebc0c659710cd"
 
-- 
2.40.0


