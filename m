Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DD36C25B5F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 11:43:38 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.10402.1714736611342424582
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 04:43:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=p+kH21Iw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=5853a5d84a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 443BA3pb018268
	for <openembedded-core@lists.openembedded.org>; Fri, 3 May 2024 11:43:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=PPS06212021; bh=9x2AA
	a7dLK8hHrPMvRF66PZaiEIt+qgdbw4Vte4Nfz4=; b=p+kH21Iw5mSwCLuYqs+nY
	+uioxRlyofZWpR/jsplDhHB1Z6RDeFWVD1Sv+ZTWeIvsbcbdsY1hYdV42LYNMg6E
	rqdOsNAD5T7y9hAiuMqhGqlQuWd4oD1Mr1KytomwxcDeWRefe+4fKJQFAw8zV3MP
	sqFH0S5eqkcqq7zqzvWBtU3ARXm+PmYEXjtbMPGdkpE4JUO2F+/ziXCvijioQnzx
	FtHNfEYy+riQiY1/UVC2BGFUk8mgqgOj+eZqG6FLJFnhYHx+1dAT6BHy47V9XyDe
	wWIm9kJ7zO6H060eGPhLhBU1x5rk5tz/gXm+jMuTNJ6tyXWdZw2F2WyXU2gxHAkZ
	w==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrpjxejq8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 11:43:30 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 3 May 2024 04:43:27 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/4] ofono: fix CVE-2023-4234
Date: Fri, 3 May 2024 11:41:52 +0000
Message-ID: <20240503114155.449802-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-ORIG-GUID: nFhbs-9cl6TUHlJ4NHQMbRuhkdp3IBr7
X-Proofpoint-GUID: nFhbs-9cl6TUHlJ4NHQMbRuhkdp3IBr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_07,2024-05-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 clxscore=1011 mlxscore=0 spamscore=0 impostorscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 11:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198977

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the decode_submit_report() function during the SMS decoding.
It is assumed that the attack scenario is accessible from a compromised modem,
a malicious base station, or just SMS. There is a bound check for this memcpy
length in decode_submit(), but it was forgotten in decode_submit_report().

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ofono/ofono/CVE-2023-4234.patch           | 39 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 40 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch
new file mode 100644
index 0000000000..9d7b56c1ae
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4234.patch
@@ -0,0 +1,39 @@
+From 8d74bc66146ea78620d140640a0a57af86fc8936 Mon Sep 17 00:00:00 2001
+From: Denis Grigorev <d.grigorev@omp.ru>
+Date: Thu, 21 Dec 2023 17:16:38 +0300
+Subject: [PATCH] smsutil: Check that submit report fits in memory
+
+This addresses CVE-2023-4234.
+
+CVE: CVE-2023-4234.
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=8d74bc66146ea786]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 8e57a06..5a12708 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -938,10 +938,16 @@ static gboolean decode_submit_report(const unsigned char *pdu, int len,
+			return FALSE;
+
+		if (out->type == SMS_TYPE_SUBMIT_REPORT_ERROR) {
++			if (expected > (int) sizeof(out->submit_err_report.ud))
++                                return FALSE;
++
+			out->submit_err_report.udl = udl;
+			memcpy(out->submit_err_report.ud,
+					pdu + offset, expected);
+		} else {
++			if (expected > (int) sizeof(out->submit_ack_report.ud))
++                                return FALSE;
++
+			out->submit_ack_report.udl = udl;
+			memcpy(out->submit_ack_report.ud,
+					pdu + offset, expected);
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 23631747a7..8aab312ff8 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -12,6 +12,7 @@ SRC_URI = "\
     file://ofono \
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
+    file://CVE-2023-4234.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.40.0


