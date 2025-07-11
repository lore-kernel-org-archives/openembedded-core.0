Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E5AC83F22
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 11:33:27 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web10.11756.1752233604965805073
 for <openembedded-core@lists.openembedded.org>;
 Fri, 11 Jul 2025 04:33:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=9287d3c5d5=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56B5t2d1024001
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 04:33:24 -0700
Received: from ala-exchng02.corp.ad.wrs.com (ala-exchng02.wrs.com [147.11.82.254])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 47q3jn68qr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 04:33:24 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.57; Fri, 11 Jul 2025 04:33:22 -0700
Received: from blr-linux-engg1.wrs.com (147.11.136.210) by
 ALA-EXCHNG02.corp.ad.wrs.com (147.11.82.254) with Microsoft SMTP Server id
 15.1.2507.57 via Frontend Transport; Fri, 11 Jul 2025 04:33:21 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH  3/3] ofono: fix CVE-2023-4235
Date: Fri, 11 Jul 2025 17:03:13 +0530
Message-ID: <20250711113313.3009782-3-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20250711113313.3009782-1-archana.polampalli@windriver.com>
References: <20250711113313.3009782-1-archana.polampalli@windriver.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: 6ZPgJKpEFXsLPJLjdvmvFbwwrpy6mMgE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA4MDE5OCBTYWx0ZWRfX2L0kndZX1n+2 dUGT1LHKPqK+2j2UrkWzdRNKtyi8ReSCM93NSeMSV+TC3S4g1pAcMgzAe8dGCSBQva2NHPFuVQw JXsyL/aGRblL4mFl3O+5NmTG1yC3CBxFaTt2A5S/RKhdOzu4VM8zyppSXf3HMoZs6o2apiS+n3l
 frjzTnbvLjby1WiyGwRjzdhXz+MysUsBs9hRBxlicn77L5rHCaNC98BMKna2BwF5mHyJdQKia/X 1/B9y8T4Soko3w+zpF0VPNIQp22DJoSWY4CiEPuOwe1vpAiZzorzOy7KhJ3LSIRgDfHt7m6Em4v ZfTQiOkaA6cpx3QIFdywuuECv6mTz1qVhIdWhZLIoOsBXQ+zD5NEqhTqaouffaWmcWlktH2Q/9J bWMB5yXz
X-Proofpoint-ORIG-GUID: 6ZPgJKpEFXsLPJLjdvmvFbwwrpy6mMgE
X-Authority-Analysis: v=2.4 cv=fv3cZE4f c=1 sm=1 tr=0 ts=6870f684 cx=c_pps a=K4BcnWQioVPsTJd46EJO2w==:117 a=K4BcnWQioVPsTJd46EJO2w==:17 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=FXNONPSS1numF6Z2y4gA:9 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_03,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 phishscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.21.0-2505280000 definitions=main-2507080198
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 11 Jul 2025 11:33:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220143

From: Archana Polampalli <archana.polampalli@windriver.com>

A flaw was found in ofono, an Open Source Telephony on Linux. A stack overflow bug
is triggered within the decode_deliver_report() function during the SMS decoding.
It is assumed that the attack scenario is accessible from a compromised modem,
a malicious base station, or just SMS. There is a bound check for this memcpy
length in decode_submit(), but it was forgotten in decode_deliver_report().

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../ofono/ofono/CVE-2023-4235.patch           | 37 +++++++++++++++++++
 meta/recipes-connectivity/ofono/ofono_1.34.bb |  1 +
 2 files changed, 38 insertions(+)
 create mode 100644 meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch

diff --git a/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
new file mode 100644
index 0000000000..ce03bbd274
--- /dev/null
+++ b/meta/recipes-connectivity/ofono/ofono/CVE-2023-4235.patch
@@ -0,0 +1,37 @@
+From 02aa0f9bad3d9e47a152fc045d0f51874d901d7e Mon Sep 17 00:00:00 2001
+From: "Sicelo A. Mhlongo" <absicsz@gmail.com>
+Date: Wed, 4 Dec 2024 10:18:51 +0200
+Subject: [PATCH] smsutil: check deliver reports fit in buffer
+
+Fixes CVE-2023-4235
+
+CVE: CVE-2023-4235
+Upstream-Status: Backport [https://git.kernel.org/pub/scm/network/ofono/ofono.git/commit/?id=02aa0f9bad3d9e47a152fc045d0f51874d901d7e]
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ src/smsutil.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/smsutil.c b/src/smsutil.c
+index 484bfd0b..ac89f16c 100644
+--- a/src/smsutil.c
++++ b/src/smsutil.c
+@@ -1240,10 +1240,16 @@ static gboolean decode_deliver_report(const unsigned char *pdu, int len,
+			return FALSE;
+
+		if (out->type == SMS_TYPE_DELIVER_REPORT_ERROR) {
++			if (expected > (int) sizeof(out->deliver_err_report.ud))
++				return FALSE;
++
+			out->deliver_err_report.udl = udl;
+			memcpy(out->deliver_err_report.ud,
+					pdu + offset, expected);
+		} else {
++			if (expected > (int) sizeof(out->deliver_ack_report.ud))
++				return FALSE;
++
+			out->deliver_ack_report.udl = udl;
+			memcpy(out->deliver_ack_report.ud,
+					pdu + offset, expected);
+--
+2.30.2
diff --git a/meta/recipes-connectivity/ofono/ofono_1.34.bb b/meta/recipes-connectivity/ofono/ofono_1.34.bb
index 8a298bfade..a3edf4ab5d 100644
--- a/meta/recipes-connectivity/ofono/ofono_1.34.bb
+++ b/meta/recipes-connectivity/ofono/ofono_1.34.bb
@@ -27,6 +27,7 @@ SRC_URI = "\
     file://CVE-2024-7540_CVE-2024-7541_CVE-2024-7542.patch \
     file://CVE-2024-7537.patch \
     file://CVE-2023-4232.patch \
+    file://CVE-2023-4235.patch \
 "
 SRC_URI[sha256sum] = "c0b96d3013447ec2bcb74579bef90e4e59c68dbfa4b9c6fbce5d12401a43aac7"
 
-- 
2.40.0


