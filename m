Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F00C8CAC5B2
	for <webhook@archiver.kernel.org>; Wed, 24 Sep 2025 08:27:34 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.7920.1758702447848281811
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Sep 2025 01:27:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Wq80AojJ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=1362f596f5=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 58O5qD3o387470
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=PPS06212021;
	 bh=1K0oAroBOtzvjC7/4UMuYWLOnPDFgep/n4DzPigMXnc=; b=Wq80AojJsfh1
	gC41VMZ9fDDC89c1omPgJFMqeOX8ECvUJ13cIJ0Ei03MvVBPjvbI36Vi2Fb6ZSkb
	12mmXqNaRjm3JXlu0dOIWw4e5wTN/I/CslVKlxqJdbUtUu3JAPDEp/n2/mY+rbna
	TI34F8nuVYfaGcvqS2opec2BqlpN/vzSU+vwGnUCzDeiY2V2dGMqGZBFxlRMHqRk
	4WT29f3V2l2tWxtorqz51v1/kd4tEqDCzWtU4ck+xek4SCZFd2nQgwJsncCUiLH2
	mSUgNAwZqY78fa/5ROCLY7GmZgADTyWyRWewPCXkX+HsSN6607YeGSN37LGJRsoS
	rJcmGt+IOA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 499hg1mj6c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:27:26 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.59; Wed, 24 Sep 2025 01:27:25 -0700
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][walnascar][PATCH 2/3] curl: fix CVE-2025-10148
Date: Wed, 24 Sep 2025 13:56:56 +0530
Message-ID: <20250924082657.3624748-2-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250924082657.3624748-1-yogita.urade@windriver.com>
References: <20250924082657.3624748-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.11.232.110]
X-ClientProxiedBy: ala-exchng01.corp.ad.wrs.com (10.11.224.121) To
 ala-exchng01.corp.ad.wrs.com (10.11.224.121)
X-Proofpoint-GUID: OeHsiOtmKEKhGN9oh7JmQXsdnl5yqqRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI0MDA3MCBTYWx0ZWRfX8mt03UIr1IXI
 wBLx6bO8u/zkjXnFFnUTllOXXcr1kZBYNDOA2o/n8IEUxb8skLRI42VPCQW9JalfKeVU4I9qMuC
 nIut5PP4mgD19JIwQP84TqkpLL4Ra9Yf8Toq5h49zGkLk0ixnwB9lYZ0qkqclw8RNienjSJpzzA
 qcbNVx5jgiLtUQYyXJKM2U59rxtwoHSQEJK3Wq8BmGLLrjM+U7PUerJxJAN+sZ11DbuBXlLK9KX
 Q8Dxv0fRkzPpz5l36NtsF9neEd4U84e9hUoK+eTw/1bJ2jjwFV8p2+YvXVzVMSMW1sB9i0ECgl9
 U6S3HcDgvH1deX/hZQhGJX4XYaBoYPe28m7SVWlmi7IMEl4f2J058eJwLIO/Sc=
X-Authority-Analysis: v=2.4 cv=Yfi95xRf c=1 sm=1 tr=0 ts=68d3ab6e cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=gmxlzscTznEA:10 a=yJojWOMRYYMA:10 a=PYnjg3YJAAAA:8 a=NEAV23lmAAAA:8
 a=t7CeM3EgAAAA:8 a=T1gC0KlOHmOShRfXnVIA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: OeHsiOtmKEKhGN9oh7JmQXsdnl5yqqRX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-24_02,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015 impostorscore=0
 spamscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2507300000 definitions=firstrun
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Sep 2025 08:27:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223951

From: Yogita Urade <yogita.urade@windriver.com>

curl's websocket code did not update the 32 bit mask pattern
for each new outgoing frame as the specification says. Instead
it used a fixed mask that persisted and was used throughout
the entire connection.

A predictable mask pattern allows for a malicious server to induce
traffic between the two communicating parties that could be
interpreted by an involved proxy (configured or transparent) as
genuine, real, HTTP traffic with content and thereby poison its
cache. That cached poisoned content could then be served to all
users of that proxy.

Reference:
https://nvd.nist.gov/vuln/detail/CVE-2025-10148

Upstream patch:
https://github.com/curl/curl/commit/84db7a9eae8468c0445b15aa806fa

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../curl/curl/CVE-2025-10148.patch            | 57 +++++++++++++++++++
 meta/recipes-support/curl/curl_8.12.1.bb      |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-support/curl/curl/CVE-2025-10148.patch

diff --git a/meta/recipes-support/curl/curl/CVE-2025-10148.patch b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
new file mode 100644
index 0000000000..7bc5d18396
--- /dev/null
+++ b/meta/recipes-support/curl/curl/CVE-2025-10148.patch
@@ -0,0 +1,57 @@
+From 84db7a9eae8468c0445b15aa806fa7fa806fa0f2 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Mon, 8 Sep 2025 14:14:15 +0200
+Subject: [PATCH] ws: get a new mask for each new outgoing frame
+
+Reported-by: Calvin Ruocco
+Closes #18496
+
+CVE: CVE-2025-10148
+Upstream-Status: Backport [https://github.com/curl/curl/commit/84db7a9eae8468c0445b15aa806fa]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ lib/ws.c | 21 +++++++++++++--------
+ 1 file changed, 13 insertions(+), 8 deletions(-)
+
+diff --git a/lib/ws.c b/lib/ws.c
+index 25d19c6..029172d 100644
+--- a/lib/ws.c
++++ b/lib/ws.c
+@@ -637,6 +637,18 @@ static ssize_t ws_enc_write_head(struct Curl_easy *data,
+   enc->payload_remain = enc->payload_len = payload_len;
+   ws_enc_info(enc, data, "sending");
+
++    /* 4 bytes random */
++
++  result = Curl_rand(data, (unsigned char *)&enc->mask, sizeof(enc->mask));
++  if(result)
++    return result;
++
++#ifdef DEBUGBUILD
++  if(getenv("CURL_WS_FORCE_ZERO_MASK"))
++    /* force the bit mask to 0x00000000, effectively disabling masking */
++    memset(&enc->mask, 0, sizeof(enc->mask));
++#endif
++
+   /* add 4 bytes mask */
+   memcpy(&head[hlen], &enc->mask, 4);
+   hlen += 4;
+@@ -819,14 +831,7 @@ CURLcode Curl_ws_accept(struct Curl_easy *data,
+      subprotocol not requested by the client), the client MUST Fail
+      the WebSocket Connection. */
+
+-  /* 4 bytes random */
+-
+-  result = Curl_rand(data, (unsigned char *)&ws->enc.mask,
+-                     sizeof(ws->enc.mask));
+-  if(result)
+-    return result;
+-  infof(data, "Received 101, switch to WebSocket; mask %02x%02x%02x%02x",
+-        ws->enc.mask[0], ws->enc.mask[1], ws->enc.mask[2], ws->enc.mask[3]);
++  infof(data, "Received 101, switch to WebSocket");
+
+   /* Install our client writer that decodes WS frames payload */
+   result = Curl_cwriter_create(&ws_dec_writer, data, &ws_cw_decode,
+--
+2.40.0
diff --git a/meta/recipes-support/curl/curl_8.12.1.bb b/meta/recipes-support/curl/curl_8.12.1.bb
index 0fb3719ac2..bfe0075af7 100644
--- a/meta/recipes-support/curl/curl_8.12.1.bb
+++ b/meta/recipes-support/curl/curl_8.12.1.bb
@@ -15,6 +15,7 @@ SRC_URI = " \
     file://disable-tests \
     file://no-test-timeout.patch \
     file://CVE-2025-9086.patch \
+    file://CVE-2025-10148.patch \
 "
 
 SRC_URI:append:class-nativesdk = " \
-- 
2.40.0


