Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FDD0C02183
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 08:03:52 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.39782.1736841828371260709
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 00:03:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3109dc8df7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E7MJTR014360
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:03:47 GMT
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443dv12tj5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:03:47 +0000 (GMT)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 14 Jan 2025 00:03:44 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][kirkstone][PATCH 3/6] ofono: fix CVE-2024-7544
Date: Tue, 14 Jan 2025 08:03:19 +0000
Message-ID: <20250114080322.3571990-3-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250114080322.3571990-1-yogita.urade@windriver.com>
References: <20250114080322.3571990-1-yogita.urade@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Proofpoint-GUID: G6CZ6hQB2NsWJaDbq-s7oAG3KXw7DoLl
X-Authority-Analysis: v=2.4 cv=N5zTF39B c=1 sm=1 tr=0 ts=67861a63 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=xNf9USuDAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=-5Q0eFtxmzE3yrJQt80A:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: G6CZ6hQB2NsWJaDbq-s7oAG3KXw7DoLl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_01,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999 clxscore=1015
 suspectscore=0 bulkscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 classifier=spam authscore=0 adjust=0
 reason=mlx scancount=1 engine=8.21.0-2411120000
 definitions=main-2501140066
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 08:03:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209778

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
context of the service account. Was ZDI-CAN-23457.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7544

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ofono/ofono/CVE-2024-7544.patch           | 30 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
new file mode 100644
index 0000000000..ebbf809030
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7544.patch
@@ -0,0 +1,30 @@
+From a240705a0d5d41eca6de4125ab2349ecde4c873a Mon Sep 17 00:00:00 2001
+From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
+Date: Tue, 3 Dec 2024 21:43:49 +0200
+Subject: [PATCH] stkutil: Fix CVE-2024-7544
+
+CVE: CVE-2024-7544
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=a240705a0d5d41eca6de4125ab2349ecde4c873a]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ src/stkutil.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/src/stkutil.c b/src/stkutil.c
+index fdd11ad..475caaa 100644
+--- a/src/stkutil.c
++++ b/src/stkutil.c
+@@ -1898,6 +1898,10 @@ static bool parse_dataobj_mms_id(struct comprehension_tlv_iter *iter,
+
+	data = comprehension_tlv_iter_get_data(iter);
+	mi->len = len;
++
++	if (len > sizeof(mi->id))
++		return false;
++
+	memcpy(mi->id, data, len);
+
+	return true;
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 731b186b12..54710aa9fd 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -20,6 +20,7 @@ SRC_URI = "\
     file://CVE-2023-2794-0004.patch \
     file://CVE-2024-7539.patch \
     file://CVE-2024-7543.patch \
+    file://CVE-2024-7544.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.40.0


