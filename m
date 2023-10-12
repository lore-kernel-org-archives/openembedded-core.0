Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BA5CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 13:33:42 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.11301.1697117613993234582
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Oct 2023 06:33:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=hDVf1+yy;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=86491d060b=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39C5b3J4014983
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 13:33:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=A/qWQ
	SQ1C1FxDhGWOV6lBLOj2dSxsX0k0+rsaoXJ4eI=; b=hDVf1+yyVIcx5Yvk7X/S0
	QP8YCPRsPXlYkPBDojoExJ4Ip8F92YTwrhPobf2vEe704Iy9VCCIZFJf/JAQ/w2H
	SlYpX/OLPTaldxmGgJbBuQUbDQV8A+TtFhlke1wzecHqIyP0NN4Lp0xv1Asks5Np
	z3cfWkmhPAINdAwROnEvEF9le7u0j1rn5thqd/0T4OiscTjq6UIMOPxvBjm8Sgs1
	Xu16ZYnVKjjuCn+oNoZjRDIFurce8hGpD3b1oy/ri5k/oVl76yrgCNqL2Fyb7/+V
	vvNsSN6tGjLULposmQ9pQNoEWAsVRwagcgtxFIOa2rLas4DJc4GfTd/bHT4FzGQ8
	A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3tnht89f1v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 13:33:33 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Thu, 12 Oct 2023 06:33:29 -0700
From: apolampa <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][mickledore][PATCH 1/2] curl: fix CVE-2023-38545
Date: Thu, 12 Oct 2023 13:33:16 +0000
Message-ID: <20231012133317.1092301-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (147.11.82.252) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: E0upGi3EfV9HSlEufdG8uHFmIohhLNKj
X-Proofpoint-ORIG-GUID: E0upGi3EfV9HSlEufdG8uHFmIohhLNKj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_05,2023-10-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2309180000 definitions=main-2310120111
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 12 Oct 2023 13:33:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/188998

From: Archana Polampalli <archana.polampalli@windriver.com>

This flaw makes curl overflow a heap based buffer in the SOCKS5 proxy handshake.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../curl/curl/CVE-2023-38545.patch            | 133 ++++++++++++++++++
 meta/recipes-support/curl/curl_8.0.1.bb       |   1 +
 2 files changed, 134 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2023-38545.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2023-38545.patch b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
new file mode 100644
index 0000000000..b90677fa5f
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2023-38545.patch
@@ -0,0 +1,133 @@
+From fb4415d8aee6c1045be932a34fe6107c2f5ed147 Mon Sep 17 00:00:00 2001
+From: Jay Satiro <raysatiro@yahoo.com>
+Date: Wed, 11 Oct 2023 07:34:19 +0200
+Subject: [PATCH] socks: return error if hostname too long for remote resolve
+
+Prior to this change the state machine attempted to change the remote
+resolve to a local resolve if the hostname was longer than 255
+characters. Unfortunately that did not work as intended and caused a
+security issue.
+
+Bug: https://curl.se/docs/CVE-2023-38545.html
+
+Upstream-Status: Backport [https://github.com/curl/curl/commit/fb4415d8aee6c1045be932a34fe6107c2f5ed147]
+CVE: CVE-2023-38545
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ lib/socks.c             |  8 +++---
+ tests/data/Makefile.inc |  2 +-
+ tests/data/test722      | 64 +++++++++++++++++++++++++++++++++++++++++
+ 3 files changed, 69 insertions(+), 5 deletions(-)
+ create mode 100644 tests/data/test722
+
+diff --git a/lib/socks.c b/lib/socks.c
+index 95c2b00..8cf694d 100644
+--- a/lib/socks.c
++++ b/lib/socks.c
+@@ -588,9 +588,9 @@ static CURLproxycode do_SOCKS5(struct Curl_cfilter *cf,
+
+     /* RFC1928 chapter 5 specifies max 255 chars for domain name in packet */
+     if(!socks5_resolve_local && hostname_len > 255) {
+-      infof(data, "SOCKS5: server resolving disabled for hostnames of "
+-            "length > 255 [actual len=%zu]", hostname_len);
+-      socks5_resolve_local = TRUE;
++      failf(data, "SOCKS5: the destination hostname is too long to be "
++            "resolved remotely by the proxy.");
++      return CURLPX_LONG_HOSTNAME;
+     }
+
+     if(auth & ~(CURLAUTH_BASIC | CURLAUTH_GSSAPI))
+@@ -904,7 +904,7 @@ static CURLproxycode do_SOCKS5(struct Curl_cfilter *cf,
+       }
+       else {
+         socksreq[len++] = 3;
+-        socksreq[len++] = (char) hostname_len; /* one byte address length */
++        socksreq[len++] = (unsigned char) hostname_len; /* one byte length */
+         memcpy(&socksreq[len], sx->hostname, hostname_len); /* w/o NULL */
+         len += hostname_len;
+       }
+diff --git a/tests/data/Makefile.inc b/tests/data/Makefile.inc
+index 7ed03a2..643c9fe 100644
+--- a/tests/data/Makefile.inc
++++ b/tests/data/Makefile.inc
+@@ -100,7 +100,7 @@ test679 test680 test681 test682 test683 test684 test685 test686 \
+ \
+ test700 test701 test702 test703 test704 test705 test706 test707 test708 \
+ test709 test710 test711 test712 test713 test714 test715 test716 test717 \
+-test718 test719 test720 test721 \
++test718 test719 test720 test721 test722 \
+ \
+ test800 test801 test802 test803 test804 test805 test806 test807 test808 \
+ test809 test810 test811 test812 test813 test814 test815 test816 test817 \
+diff --git a/tests/data/test722 b/tests/data/test722
+new file mode 100644
+index 0000000..05bcf28
+--- /dev/null
++++ b/tests/data/test722
+@@ -0,0 +1,64 @@
++<testcase>
++<info>
++<keywords>
++HTTP
++HTTP GET
++SOCKS5
++SOCKS5h
++followlocation
++</keywords>
++</info>
++
++#
++# Server-side
++<reply>
++# The hostname in this redirect is 256 characters and too long (> 255) for
++# SOCKS5 remote resolve. curl must return error CURLE_PROXY in this case.
++<data>
++HTTP/1.1 301 Moved Permanently
++Location: http://AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA/
++Content-Length: 0
++Connection: close
++
++</data>
++</reply>
++
++#
++# Client-side
++<client>
++<features>
++proxy
++</features>
++<server>
++http
++socks5
++</server>
++ <name>
++SOCKS5h with HTTP redirect to hostname too long
++ </name>
++ <command>
++--no-progress-meter --location --proxy socks5h://%HOSTIP:%SOCKSPORT http://%HOSTIP:%HTTPPORT/%TESTNUMBER
++</command>
++</client>
++
++#
++# Verify data after the test has been "shot"
++<verify>
++<protocol crlf="yes">
++GET /%TESTNUMBER HTTP/1.1
++Host: %HOSTIP:%HTTPPORT
++User-Agent: curl/%VERSION
++Accept: */*
++
++</protocol>
++<errorcode>
++97
++</errorcode>
++# the error message is verified because error code CURLE_PROXY (97) may be
++# returned for any number of reasons and we need to make sure it is
++# specifically for the reason below so that we know the check is working.
++<stderr mode="text">
++curl: (97) SOCKS5: the destination hostname is too long to be resolved remotely by the proxy.
++</stderr>
++</verify>
++</testcase>
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.0.1.bb b/meta/recipes-support/curl/curl_8.0.1.bb
index 708f622fe1..bdffe7be34 100644
--- a/meta/recipes-support/curl/curl_8.0.1.bb
+++ b/meta/recipes-support/curl/curl_8.0.1.bb
@@ -19,6 +19,7 @@ SRC_URI = " \
     file://CVE-2023-28321.patch \
     file://CVE-2023-32001.patch \
     file://CVE-2023-28320-fol1.patch \
+    file://CVE-2023-38545.patch \
 "
 SRC_URI[sha256sum] = "0a381cd82f4d00a9a334438b8ca239afea5bfefcfa9a1025f2bf118e79e0b5f0"
 
-- 
2.40.0


