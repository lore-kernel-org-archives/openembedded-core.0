Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49BEDC4345F
	for <webhook@archiver.kernel.org>; Fri,  3 May 2024 11:43:38 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.10513.1714736612088930506
 for <openembedded-core@lists.openembedded.org>;
 Fri, 03 May 2024 04:43:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=GNweI9+4;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=5853a5d84a=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4436iqi7020605
	for <openembedded-core@lists.openembedded.org>; Fri, 3 May 2024 04:43:31 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=from:to:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PPS06212021; bh=0viAYusrooH7ExKRU61yFD3mEY0Ea/2MFrETr7rQPqU=; b=
	GNweI9+4kuZ0KX3nFPE6ut9AYIIbxDQswSoyUz8fmFmS8WA22ljJJ5DdGmLanpoL
	fW8px93ygw6S25ooI5SPGW5eKPeL2jXvl5MZVyqWodzGknkKM6Ma+rNsL1V2MuwP
	/k0NS2lX+ogmeQaodzt7KeT6+CSNNhxArlSc7pw61YSA5GHxiakA4JFSeK24lobg
	YAJZYdREB5/J0K1tRhiwdYT91qK78RC/7Sgh1PtG6YMzXH6rwcxKQuPnFkn2zK8N
	qjVMNNEMCbUsfnNC5LGEnfTMUG3rVbCfMAQii7GzCnESNsysag8whJHFJIbjMado
	qWokGjTLtQvNOb3Em+xP7A==
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3xrvn1e9fb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 04:43:31 -0700 (PDT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.37; Fri, 3 May 2024 04:43:29 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 2/4] ofono: fix CVE-2023-4233
Date: Fri, 3 May 2024 11:41:53 +0000
Message-ID: <20240503114155.449802-2-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20240503114155.449802-1-archana.polampalli@windriver.com>
References: <20240503114155.449802-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: -4PH2hxiTu1VuYqjTNjMjpMa1vWJFlkZ
X-Proofpoint-ORIG-GUID: -4PH2hxiTu1VuYqjTNjMjpMa1vWJFlkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-03_07,2024-05-03_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 spamscore=0 bulkscore=0 mlxscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405030084
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 03 May 2024 11:43:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198978

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the sms_decode_address_field() function during the SMS
PDU decoding. It is assumed that the attack scenario is accessible from a compromised
modem, a malicious base station, or just SMS.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ofono/ofono/CVE-2023-4233.patch           | 32 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch
new file mode 100644
index 0000000000..d047a0d87a
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4233.patch
@@ -0,0 +1,32 @@
+From 1a5fbefa59465bec80425add562bdb1d36ec8e23 Mon Sep 17 00:00:00 2001
+From: Denis Grigorev <d.grigorev@omp.ru>
+Date: Fri, 29 Dec 2023 13:30:04 +0300
+Subject: [PATCH] smsutil: Validate the length of the address field
+
+This addresses CVE-2023-4233.
+
+CVE: CVE-2023-4233
+
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=1a5fbefa59465bec]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 5a12708..8dd2126 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -626,6 +626,9 @@ gboolean sms_decode_address_field(const unsigned char *pdu, int len,
+
+	if (!next_octet(pdu, len, offset, &addr_len))
+		return FALSE;
++	/* According to 23.040 9.1.2.5 Address-Length must not exceed 20 */
++        if (addr_len > 20)
++                return FALSE;
+
+	if (sc && addr_len == 0) {
+		out->address[0] = '\0';
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 8aab312ff8..f4548b8a30 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -13,6 +13,7 @@ SRC_URI = "\
     file://0001-mbim-add-an-optional-TEMP_FAILURE_RETRY-macro-copy.patch \
     file://0002-mbim-Fix-build-with-ell-0.39-by-restoring-unlikely-m.patch \
     file://CVE-2023-4234.patch \
+    file://CVE-2023-4233.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.40.0


