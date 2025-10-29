Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61AC9CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 03:10:04 +0000 (UTC)
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
 by mx.groups.io with SMTP id smtpd.web11.197.1761707397926142440
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 20:09:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=O07kxHQG;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.166.238, mailfrom: prvs=3397cd56c3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59SMegLD4129150
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 20:09:57 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=JiCCGFTZbv7ZZ3689rl0
	RMRHL7imGZIOtCevATp+mrw=; b=O07kxHQGFFzuuMkNNA+69XRmIz4OyuT8OU09
	lSXzQeqbnNMm3rLejkC0hK/Nca7wheiowj87S4q81SRWDPHPlZrnziL4zYOD6bK5
	41gEe4/LwqT7jypxyMk0v11PA48rtVRD08IGUVUV2fVD8w05g0Hy4rfRfWjxMLYc
	7NvoAn25oAce6ojGMlrgny6x7YoD5y/U2T4fmnhVlQ8GDXtIymGCh2rQYEDMaRk9
	cp+B/fSKjF27G/mHQiWGf8QCbVxsIVeeQA808/asGtujMgClLlzOkFDt9s3BKtxH
	VhQzU0W0lv6PfU+V1V6ubjqp2NDQ6/aflaghhGRmjsFq9xOzgw==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a348a8cpk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Tue, 28 Oct 2025 20:09:57 -0700 (PDT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 20:09:56 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 20:09:56 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [walnascar][PATCH] u-boot: fix CVE-2024-42040
Date: Wed, 29 Oct 2025 11:09:55 +0800
Message-ID: <20251029030955.2684313-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: y3mMx9yqPwDdIbJQLv6Bi7t-dOa-cac0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAyNCBTYWx0ZWRfX2J76RPUMAtXj
 DuzHDG+zMGz+gP37GNZ7fym+9fwL4z0bcsPLh5ydfWbnH8lDw4ukVT+mTkJM6vrDx2Hij+tT5Y6
 C2f8XFEkNW4rrBctd969cKn2VD3yWgiZlEx3uyQgHo6uvc09FQ0+IvHw3HNHGj0mPTO6+QP/V/X
 5GZDJeKutU+C0IT1JPysp9PT3tshi+7DWFO0G9TRzQm3LCzpB2v0SBV6P7Zvd4wTs22YgyuXuxA
 ghTkqYX7wfmlWiI9RpFzMkdMb+sG6KSLB538F4wArQtjkky9FUGXWfTrH4b5drLZ5wqI7z+bWEU
 bE5cSMBz3kF/lVBr5EFt4xkztoAz99KqDRQLZepp6qFQMbB7WKfm3VipS2hhTDdToQaoqQuNac6
 BjKNpxfbmh5OlcYSaAzwsItSA/Kw8A==
X-Authority-Analysis: v=2.4 cv=aLj9aL9m c=1 sm=1 tr=0 ts=69018585 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=YfCOm-DyAAAA:8 a=PYnjg3YJAAAA:8
 a=t7CeM3EgAAAA:8 a=8xt6yXMlAAAA:8 a=xoHeRbk_Chj4lytq0XUA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=62aeB-Bz8chgfR-5iBum:22
X-Proofpoint-ORIG-GUID: y3mMx9yqPwDdIbJQLv6Bi7t-dOa-cac0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290024
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 03:10:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225427

Backport a patch [1] from upstrem to fix CVE-2024-42040 [2]

[1] https://source.denx.de/u-boot/u-boot/-/commit/81e5708cc2c865df606e49aed5415adb2a662171
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-42040

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-42040.patch         | 56 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  4 +-
 2 files changed, 59 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch

diff --git a/meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch b/meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch
new file mode 100644
index 0000000000..2d250e51b7
--- /dev/null
+++ b/meta/recipes-bsp/u-boot/files/CVE-2024-42040.patch
@@ -0,0 +1,56 @@
+From 1406fc918977bba4dac0af5e22e63a5553aa6aff Mon Sep 17 00:00:00 2001
+From: Paul HENRYS <paul.henrys_ext@softathome.com>
+Date: Thu, 9 Oct 2025 17:43:28 +0200
+Subject: [PATCH] net: bootp: Prevent buffer overflow to avoid leaking the RAM
+ content
+
+CVE-2024-42040 describes a possible buffer overflow when calling
+bootp_process_vendor() in bootp_handler() since the total length
+of the packet is passed to bootp_process_vendor() without being
+reduced to len-(offsetof(struct bootp_hdr,bp_vend)+4).
+
+The packet length is also checked against its minimum size to avoid
+reading data from struct bootp_hdr outside of the packet length.
+
+Signed-off-by: Paul HENRYS <paul.henrys_ext@softathome.com>
+Signed-off-by: Philippe Reynes <philippe.reynes@softathome.com>
+
+CVE: CVE-2024-42040
+Upstream-Status: Backport [https://source.denx.de/u-boot/u-boot/-/commit/81e5708cc2c865df606e49aed5415adb2a662171]
+Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
+---
+ net/bootp.c | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/net/bootp.c b/net/bootp.c
+index 68002909634..843180d296c 100644
+--- a/net/bootp.c
++++ b/net/bootp.c
+@@ -362,6 +362,14 @@ static void bootp_handler(uchar *pkt, unsigned dest, struct in_addr sip,
+ 	debug("got BOOTP packet (src=%d, dst=%d, len=%d want_len=%zu)\n",
+ 	      src, dest, len, sizeof(struct bootp_hdr));
+ 
++	/* Check the minimum size of a BOOTP packet is respected.
++	 * A BOOTP packet is between 300 bytes and 576 bytes big
++	 */
++	if (len < offsetof(struct bootp_hdr, bp_vend) + 64) {
++		printf("Error: got an invalid BOOTP packet (len=%u)\n", len);
++		return;
++	}
++
+ 	bp = (struct bootp_hdr *)pkt;
+ 
+ 	/* Filter out pkts we don't want */
+@@ -379,7 +387,8 @@ static void bootp_handler(uchar *pkt, unsigned dest, struct in_addr sip,
+ 
+ 	/* Retrieve extended information (we must parse the vendor area) */
+ 	if (net_read_u32((u32 *)&bp->bp_vend[0]) == htonl(BOOTP_VENDOR_MAGIC))
+-		bootp_process_vendor((uchar *)&bp->bp_vend[4], len);
++		bootp_process_vendor((uchar *)&bp->bp_vend[4], len -
++				     (offsetof(struct bootp_hdr, bp_vend) + 4));
+ 
+ 	net_set_timeout_handler(0, (thand_f *)0);
+ 	bootstage_mark_name(BOOTSTAGE_ID_BOOTP_STOP, "bootp_stop");
+-- 
+2.49.0
+
diff --git a/meta/recipes-bsp/u-boot/u-boot-common.inc b/meta/recipes-bsp/u-boot/u-boot-common.inc
index fc860248ed..58308576fc 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -14,7 +14,9 @@ PE = "1"
 # repo during parse
 SRCREV = "6d41f0a39d6423c8e57e92ebbe9f8c0333a63f72"
 
-SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master"
+SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
+           file://CVE-2024-42040.patch \
+"
 
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build"
-- 
2.34.1


