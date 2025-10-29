Return-Path: <hongxu.jia@eng.windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9349CCF9EA
	for <webhook@archiver.kernel.org>; Wed, 29 Oct 2025 02:38:03 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web10.29348.1761705474924811816
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Oct 2025 19:37:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@windriver.com header.s=PPS06212021 header.b=qAOrfAsH;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=3397cd56c3=hongxu.jia@windriver.com)
Received: from pps.filterd (m0250812.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59T0Kodl1477936
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:37:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PPS06212021; bh=bv+r2Y4R47nYYtn/Pp+G
	gaZx/hn9NXdE+fpgRbVrx6I=; b=qAOrfAsHya14DEgu2GKy7Utq1L6pCnBrVoad
	blsnHYJUebehNvKwUMmWiYgi3hoZrQMcE0UuB8V7DfOpCSyARU7AUzorOTke0NMu
	4/dpbTaHiuWAVWWzZAqgHSGioUzsQARDjieuJuDFjE+UGoEZKJ7Pv8iMpIKALtWA
	/lkf81JDqHe9NXG8NUh6TVG2TFJKsLEZvLbUvQaMhOCw4kcWGYvipYc0R9h9TtqA
	uHa+HQPHglWIpdGC5BudzIZyHCfVESmImfQJC9UT2vTyNlNGree75G2Xg5f9k3kp
	sAqrp80UBIDQsujJtENWHzZITO3Z446h8AMO7VVp7jp9NnEZZA==
Received: from ala-exchng01.corp.ad.wrs.com ([128.224.246.36])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4a348bga8k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:37:53 +0000 (GMT)
Received: from ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) by
 ala-exchng01.corp.ad.wrs.com (10.11.224.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.61; Tue, 28 Oct 2025 19:37:52 -0700
Received: from pek-lpg-core5.wrs.com (10.11.232.110) by
 ALA-EXCHNG02.corp.ad.wrs.com (10.11.224.122) with Microsoft SMTP Server id
 15.1.2507.61 via Frontend Transport; Tue, 28 Oct 2025 19:37:51 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH] u-boot: fix CVE-2024-42040
Date: Wed, 29 Oct 2025 10:37:51 +0800
Message-ID: <20251029023751.1891276-1-hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: kNkHZmYqCeoXRJ9taVykl8bYFLwBH0jz
X-Proofpoint-GUID: kNkHZmYqCeoXRJ9taVykl8bYFLwBH0jz
X-Authority-Analysis: v=2.4 cv=UrRu9uwB c=1 sm=1 tr=0 ts=69017e01 cx=c_pps
 a=AbJuCvi4Y3V6hpbCNWx0WA==:117 a=AbJuCvi4Y3V6hpbCNWx0WA==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=YfCOm-DyAAAA:8 a=PYnjg3YJAAAA:8
 a=t7CeM3EgAAAA:8 a=8xt6yXMlAAAA:8 a=xoHeRbk_Chj4lytq0XUA:9
 a=zQLMK8awuJ6_Hvp-_9Ux:22 a=FdTzh2GWekK77mhwV6Dw:22 a=62aeB-Bz8chgfR-5iBum:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI5MDAxOSBTYWx0ZWRfX7/3szj+p9AfE
 9I+MfjOoO0TPV9FYvtGhvB/Q4q2uIuEA5Wn97KO2hBIJx+6T7BE8pgmsNJW7ZNcqptdihhi3Ivq
 IXTzGeeDQtbtQao+P3cpyoOh8XU2KZugBK9/Pdd9xortGCnhuMyxxwSZH6M3lgUE5RFY8kSE4kt
 VOOUi0Qh7bDJ31RpMo8LEtrF1uh1EwzIVnbcW/I0CMUk2sj4lnc17yIPPAmLCMHfuQgM8UypiHB
 Y440aHAQ1sHxICnrD1I6AUkx9hHEzTbGOaer1MmQxI1ruuDfWqkV05I/PjtooGAmDNBgA5qBYWy
 312WeBhbNC35VPbIJZkv6ghJfDztCGBmqTwnUdJqmk1y+akcxB9HIvJsXSzaik3uF/3VSLMlynt
 0svQ2nw11tr0z1UVpoQET64ePOwrFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_01,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510290019
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 29 Oct 2025 02:38:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225421

Backport a patch [1] from upstrem to fix CVE-2024-42040 [2]

[1] https://source.denx.de/u-boot/u-boot/-/commit/81e5708cc2c865df606e49aed5415adb2a662171
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-42040

Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
---
 .../u-boot/files/CVE-2024-42040.patch         | 56 +++++++++++++++++++
 meta/recipes-bsp/u-boot/u-boot-common.inc     |  1 +
 2 files changed, 57 insertions(+)
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
index 3a48b63c42..da34e3d3e8 100644
--- a/meta/recipes-bsp/u-boot/u-boot-common.inc
+++ b/meta/recipes-bsp/u-boot/u-boot-common.inc
@@ -23,6 +23,7 @@ SRC_URI = "git://source.denx.de/u-boot/u-boot.git;protocol=https;branch=master \
            file://CVE-2024-57258-2.patch \
            file://CVE-2024-57258-3.patch \
            file://CVE-2024-57259.patch \
+           file://CVE-2024-42040.patch \
 "
 
 S = "${WORKDIR}/git"
-- 
2.34.1


