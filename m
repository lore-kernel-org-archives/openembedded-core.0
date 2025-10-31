Return-Path: <archana.polampalli@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEE6CCF9EB
	for <webhook@archiver.kernel.org>; Fri, 31 Oct 2025 05:28:15 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.8185.1761888490677292174
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Oct 2025 22:28:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=Y5qi0x0u;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3399d6ce27=archana.polampalli@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59V4tl563970663
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:28:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=9K+r2po6vmQR/AwChsVY
	pu8B7ww5d1F89i9e3I3FdW4=; b=Y5qi0x0uC01Y/RrAotHaQ0OnMobMuZwzlRB9
	Tdk0CvB7vyr1xnoqQk7nafJ48YPUcluPs66xttLFOfaW5Se73LlHsk59pBs35AAE
	ZvXhjpaiFHkkPqpAg2ySWQbmH3EvLAckF7uE+Y98xnLUTKHngvSLXs61+ujkbR3h
	NTME1hIIJbOFt1ijQqt9zr/C0+TDcC20VW1RvDqPn/1eq5cm5w3oIgCKTXxEuGhN
	R/Zw8NuooLKjF1l47SZhxntsUf7VUsJyKOM4Nxvi/rIIMPKRb5kGArWi26S3ESXi
	axKNjH3N5j76J4hWMj3TPzxQ2k/odh2OzINk8vLUTTLXmcs/Sg==
Received: from ala-exchng02.corp.ad.wrs.com ([128.224.246.37])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a3w9ghf0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:28:09 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Thu, 30 Oct 2025 22:28:08 -0700
Received: from blr-linux-engg1.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Thu, 30 Oct 2025 22:28:07 -0700
From: <archana.polampalli@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [oe-core][kirkstone][PATCH 1/1] openssh: fix CVE-2025-61985
Date: Fri, 31 Oct 2025 10:58:04 +0530
Message-ID: <20251031052804.209897-1-archana.polampalli@windriver.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMxMDA0NyBTYWx0ZWRfX/klHKwxJjxrt
 C3TmjFiDAIgIJ3waYqSu6pCc24Hi2S+grcqDd0xjTj590ei1+JfMEEKSFMUjkz2KZ14CGaknfK8
 vyd6JqyFQuBDRvXgmqakIB8mRV6M13JnoZCeTxUwsV7uy1cizA3EVcIBwG8N+STGqqnqoBFApkq
 yMn2+gVgWWVgh/CSifX7ABZa2t5ABrFehppO9io1jB7Dq0PnC67ciSKA0tzrMcCqlOBB7Y8MeXH
 PAYQ0PKLtOBOKFdOOpXoAeYpZHX0nCSyz2iv1I5estoVNR2hZ8SmiYVQKXC0BfRTI3nhnJg96j8
 WIUBiQtL/BX5TCXAZbYxxy/6iuQ5brQyCj3FYBrQD93ArhXjwt7Jbfi4Kfaqgd24Y0ppfS8ay1p
 NiQfH/ysXVPyxr4hbezY0IDx+LAfgQ==
X-Proofpoint-ORIG-GUID: 9N0gyeR8153HApjYxF3el9vzvpZMqMV8
X-Proofpoint-GUID: 9N0gyeR8153HApjYxF3el9vzvpZMqMV8
X-Authority-Analysis: v=2.4 cv=YqcChoYX c=1 sm=1 tr=0 ts=690448e9 cx=c_pps
 a=Lg6ja3A245NiLSnFpY5YKQ==:117 a=Lg6ja3A245NiLSnFpY5YKQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=3tcz3bTJAAAA:8
 a=t7CeM3EgAAAA:8 a=Rc0XK6UBnGErO2_imCQA:9 a=4EbjBm0RLgFgoQzmu6QD:22
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-31_01,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2510310047
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 31 Oct 2025 05:28:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225526

From: Archana Polampalli <archana.polampalli@windriver.com>

ssh in OpenSSH before 10.1 allows the '\0' character in an ssh:// URI, potentially
leading to code execution when a ProxyCommand is used.

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
---
 .../openssh/openssh/CVE-2025-61985.patch      | 35 +++++++++++++++++++
 .../openssh/openssh_8.9p1.bb                  |  1 +
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch

diff --git a/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
new file mode 100644
index 0000000000..7333d5aae8
--- /dev/null
+++ b/meta/recipes-connectivity/openssh/openssh/CVE-2025-61985.patch
@@ -0,0 +1,35 @@
+From 54928cb9eaa7143ff17f463efa7ed3109afdbf30 Mon Sep 17 00:00:00 2001
+From: "djm@openbsd.org" <djm@openbsd.org>
+Date: Thu, 4 Sep 2025 00:30:06 +0000
+Subject: [PATCH] upstream: don't allow \0 characters in url-encoded strings.
+ Suggested by David Leadbeater, ok deraadt@
+
+OpenBSD-Commit-ID: c92196cef0f970ceabc1e8007a80b01e9b7cd49c
+
+CVE: CVE-2025-61985
+
+Upstream-Status: Backport [https://github.com/openssh/openssh-portable/commit/43b3bff47bb029f2299bacb6a36057981b39fdb0]
+
+Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com>
+---
+ misc.c | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/misc.c b/misc.c
+index 6135b15..3d133b5 100644
+--- a/misc.c
++++ b/misc.c
+@@ -934,9 +934,10 @@ urldecode(const char *src)
+			*dst++ = ' ';
+			break;
+		case '%':
++			/* note: don't allow \0 characters */
+			if (!isxdigit((unsigned char)src[1]) ||
+			    !isxdigit((unsigned char)src[2]) ||
+-			    (ch = hexchar(src + 1)) == -1) {
++			    (ch = hexchar(src + 1)) == -1 || ch == 0) {
+				free(ret);
+				return NULL;
+			}
+--
+2.40.0
diff --git a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
index 345051c8dc..780ece8999 100644
--- a/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_8.9p1.bb
@@ -39,6 +39,7 @@ SRC_URI = "http://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar
            file://CVE-2024-6387.patch \
            file://CVE-2025-26465.patch \
            file://CVE-2025-32728.patch \
+           file://CVE-2025-61985.patch \
            "
 SRC_URI[sha256sum] = "fd497654b7ab1686dac672fb83dfb4ba4096e8b5ffcdaccd262380ae58bec5e7"
 
-- 
2.40.0


