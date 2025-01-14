Return-Path: <Yogita.Urade@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C0DEC02184
	for <webhook@archiver.kernel.org>; Tue, 14 Jan 2025 12:51:55 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.43831.1736859109860351931
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jan 2025 04:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3109dc8df7=yogita.urade@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EBQMGY021322
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:51:49 -0800
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.wrs.com [147.11.82.252])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 443s1pjm72-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 04:51:49 -0800 (PST)
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.43; Tue, 14 Jan 2025 04:51:45 -0800
From: yurade <yogita.urade@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [OE-core][PATCH 1/1] ofono: fix CVE-2024-7539
Date: Tue, 14 Jan 2025 12:51:27 +0000
Message-ID: <20250114125127.2002412-1-yogita.urade@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [147.11.136.210]
X-ClientProxiedBy: ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) To
 ala-exchng01.corp.ad.wrs.com (147.11.82.252)
X-Authority-Analysis: v=2.4 cv=DdLtqutW c=1 sm=1 tr=0 ts=67865de5 cx=c_pps a=/ZJR302f846pc/tyiSlYyQ==:117 a=/ZJR302f846pc/tyiSlYyQ==:17 a=HCiNrPZc1L8A:10 a=VdSt8ZQiCzkA:10 a=xNf9USuDAAAA:8 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8
 a=eYCCJDtN_mypVY28GlcA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-GUID: h-pxHqRf53Al8TdW2c--wqsNfZjdpiU4
X-Proofpoint-ORIG-GUID: h-pxHqRf53Al8TdW2c--wqsNfZjdpiU4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_03,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 classifier=spam authscore=0 adjust=0 reason=mlx
 scancount=1 engine=8.21.0-2411120000 definitions=main-2501140107
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jan 2025 12:51:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/209801

From: Yogita Urade <yogita.urade@windriver.com>

oFono CUSD Stack-based Buffer Overflow Code Execution Vulnerability.
This vulnerability allows local attackers to execute arbitrary code
on affected installations of oFono. An attacker must first obtain
the ability to execute code on the target modem in order to exploit
this vulnerability.

The specific flaw exists within the parsing of responses from AT+CUSD
commands. The issue results from the lack of proper validation of the
length of user-supplied data prior to copying it to a stack-based buffer.
An attacker can leverage this vulnerability to execute code in the
context of root. Was ZDI-CAN-23195.

Reference:
https://security-tracker.debian.org/tracker/CVE-2024-7539

Upstream patch:
https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc

Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
---
 .../ofono/ofono/CVE-2024-7539.patch           | 88 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_2.14.bb |  1 +
 2 files changed, 89 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
new file mode 100644
index 0000000000..e41596959b
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2024-7539.patch
@@ -0,0 +1,88 @@
+From 389e2344f86319265fb72ae590b470716e038fdc Mon Sep 17 00:00:00 2001
+From: Sicelo A. Mhlongo <absicsz@gmail.com>
+Date: Tue, 17 Dec 2024 11:31:29 +0200
+Subject: [PATCH] ussd: ensure ussd content fits in buffers
+
+Fixes: CVE-2024-7539
+
+CVE: CVE-2024-7539
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=389e2344f86319265fb72ae590b470716e038fdc]
+
+Signed-off-by: Yogita Urade <yogita.urade@windriver.com>
+---
+ drivers/atmodem/ussd.c      | 5 ++++-
+ drivers/huaweimodem/ussd.c  | 5 ++++-
+ drivers/speedupmodem/ussd.c | 5 ++++-
+ 3 files changed, 12 insertions(+), 3 deletions(-)
+
+diff --git a/drivers/atmodem/ussd.c b/drivers/atmodem/ussd.c
+index 32a9fe9..99da559 100644
+--- a/drivers/atmodem/ussd.c
++++ b/drivers/atmodem/ussd.c
+@@ -93,7 +93,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	const char *content;
+	int dcs;
+	enum sms_charset charset;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+	const unsigned char *msg_ptr = NULL;
+	long msg_len;
+
+@@ -113,6 +113,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	if (!g_at_result_iter_next_number(&iter, &dcs))
+		dcs = 0;
+
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+	if (!cbs_dcs_decode(dcs, NULL, NULL, &charset, NULL, NULL, NULL)) {
+		ofono_error("Unsupported USSD data coding scheme (%02x)", dcs);
+		status = 4; /* Not supported */
+diff --git a/drivers/huaweimodem/ussd.c b/drivers/huaweimodem/ussd.c
+index 5e1c907..3d165c8 100644
+--- a/drivers/huaweimodem/ussd.c
++++ b/drivers/huaweimodem/ussd.c
+@@ -38,7 +38,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	int status;
+	int dcs = 0;
+	const char *content;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+	const unsigned char *msg_ptr = NULL;
+	long msg_len;
+
+@@ -55,6 +55,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+
+	g_at_result_iter_next_number(&iter, &dcs);
+
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
+
+ out:
+diff --git a/drivers/speedupmodem/ussd.c b/drivers/speedupmodem/ussd.c
+index aafa4bc..a5efde0 100644
+--- a/drivers/speedupmodem/ussd.c
++++ b/drivers/speedupmodem/ussd.c
+@@ -37,7 +37,7 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+	int status;
+	int dcs = 0;
+	const char *content;
+-	unsigned char msg[160];
++	unsigned char msg[160] = {0};
+	const unsigned char *msg_ptr = NULL;
+	long msg_len;
+
+@@ -54,6 +54,9 @@ static void cusd_parse(GAtResult *result, struct ofono_ussd *ussd)
+
+	g_at_result_iter_next_number(&iter, &dcs);
+
++	if (strlen(content) > sizeof(msg) * 2)
++		goto out;
++
+	msg_ptr = decode_hex_own_buf(content, -1, &msg_len, 0, msg);
+
+ out:
+--
+2.40.0
diff --git a/meta/recipes-connectivity/ofono/ofono_2.14.bb b/meta/recipes-connectivity/ofono/ofono_2.14.bb
index 5d11d6cb45..34e919ef5a 100644
--- a/meta/recipes-connectivity/ofono/ofono_2.14.bb
+++ b/meta/recipes-connectivity/ofono/ofono_2.14.bb
@@ -11,6 +11,7 @@ SRC_URI = "\
     ${KERNELORG_MIRROR}/linux/network/${BPN}/${BP}.tar.xz \
     file://rmnet.patch \
     file://ofono \
+    file://CVE-2024-7539.patch \
 "
 SRC_URI[sha256sum] = "983cbfd5e1e1a410ba7ad2db7f50fadc91e50b29f1ede40cdc73f941da7ba95f"
 
-- 
2.40.0


