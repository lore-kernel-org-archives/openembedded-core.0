Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83263C02185
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:03:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.40308.1736841830048165845
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:03:50 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3109dc8df7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E6OW7n000578
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:03:49 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443fm8ar6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:03:49 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 14 Jan 2025 00:03:46 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 4/6] ofono: fix CVE-2024-7545
Date: Tue, 14 Jan 2025 08:03:20 +0000
Message-ID: <20250114080322.3571990-4-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250114080322.3571990-1-yogita.urade@windriver.com>
References: <20250114080322.3571990-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=Mtmo63ae c=1 sm=1 tr=0 ts=67861a65 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=xNf9USuDAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=-5Q0eFtxmzE3yrJQt80A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: NARnsJLU-YfkSGRy26PgTbXTFr1PsR7H
X-Proofpoint-GUID: NARnsJLU-YfkSGRy26PgTbXTFr1PsR7H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 mlxscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501140066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209779

From: Yogita Urade <yogita.urade@windriver.com>

oFono SimToolKit Heap-based Buffer Overflow Privilege Escalation
Vulnerability. This vulnerability allows local attackers to execute
arbitrary code on affected installations of oFono. An attacker must
first obtain the ability to execute code on the target modem in
order to exploit this vulnerability.

The specific flaw exists within the parsing of STK command PDUs.
The issue results from the lack of proper validation of the length
of user-supplied data prior to copying it to a heap-based buffer.
An attacker can leverage this vulnerability to execute code in the
context of the service account. Was ZDI-CAN-23458.

Reeference:
https://security-tracker.debian.org/tracker/CVE-2024-7545

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ofono/ofono/CVE-2024-7545.patch           | 32 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
new file mode 100644
index 0000000000..80dc3c9ab0
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7545.patch
@@ -0,0 +1,32 @@
+From 556e14548c38c2b96d85881542046ee7ed750bb5 Mon Sep 17 00:00:00 2001
+From: Sicelo A. Mhlongo <absicsz@gmail.com>
+Date: Wed, Dec 4 12:07:34 2024 +0200
+Subject: [PATCH] stkutil: ensure data fits in buffer
+
+Fixes CVE-2024-7545
+
+CVE: CVE-2024-7545
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=556e14548c38c2b96d85881542046ee7ed750bb5]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index 475caaa..e1fd75c 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1938,6 +1938,10 @@ static bool parse_dataobj_mms_content_id(
+
+	data = comprehension_tlv_iter_get_data(iter);
+	mci->len = len;
++
++	if (len > sizeof(mci->id))
++		return false;
++
+	memcpy(mci->id, data, len);
+
+	return true;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 54710aa9fd..0597caff3c 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -21,6 +21,7 @@ SRC_URI = "\
     file://CVE-2024-7539.patch \
     file://CVE-2024-7543.patch \
     file://CVE-2024-7544.patch \
+    file://CVE-2024-7545.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.40.0


