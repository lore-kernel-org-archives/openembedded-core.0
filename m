Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2E4BC61DC4
	for <webhook@archiver.kernel.org>; Fri, 28 Aug 2026 02:21:26 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.534.1787883679491505424
 for <openembedded-core@lists.openembedded.org>;
 Thu, 27 Aug 2026 19:21:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=am2sRz5G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67S21sWK1634626
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 02:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5vm6wZCnRsPIAusPiNSvxYniZNHXiIpPGEX
	QmKrpAVs=; b=am2sRz5GGXxFUHasdER4NswJx1uSks/8A4HO8XWxAQ9PKjjS1/3
	hMnBrMLJTrUdHh110x2Ood5gf18WPxBWeBPjZnzqjiqtr6RzsmFUbKwUF49MWFMU
	L8OG6cqoa+rr3usBYOwTB2+8NUSKIV3NbbZ4ANSZYCMJjqa9hS1Ewtm4LSyHEChn
	JIc0qj85H81VVEeenJKIwa80csrijcIEHLMsMBzIn0vYWm74M2nlHGwnx/CXW5Ag
	VMU4evOhIb4c9FikduaMRFg5TvssRSMBz3ILtAtPeKMNvmXBV6sObgbxizUgsWJI
	L1zcKtD+N9i29+dkamQEigPEiYxxtEB62oQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4garee2mnr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 02:21:18 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 67S2LGvU009147;
	Fri, 28 Aug 2026 02:21:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4g74ujvt9c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 02:21:16 +0000 (GMT)
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 67S2LGmU009141
	for <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 02:21:16 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 67S2LFrk009138
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 28 Aug 2026 02:21:16 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 10AEE23A33; Fri, 28 Aug 2026 10:21:15 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com
Subject: [PATCH] bluez5: fix ABORT response being discarded in gobex transfer
Date: Fri, 28 Aug 2026 10:21:10 +0800
Message-Id: <20260828022110.2804925-1-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDAxOCBTYWx0ZWRfX40rf1e6V64hg
 FXtLHd4B7OEPJcPcYtO9oCZpC5XtuZETEHvKBPugaJ3ZpTrHA/Ytxejr1aYWVQCYIpvHOY0i6fC
 6+NCdv9cgWo5xG8iPOHsnBi3v+sVvFWi1Q5o9N13y9v0G6up+rnaveiV4Watg9SP9OmxJitnEUi
 /c0FONUjbe0cePz2HqYKye9VNo/XrKB5eBfnzCRcrRJ/viV+y0gxELMuyqK+r6ffwBrCFZRMNR7
 dcnO2c9b5hNHEZC8EfqZnoAFuOBqVP1LonwzNfC2277RkgMm2Tsa85oW4YHAUnGE8uCCcinjNui
 5yvpEigxu17A6GownI5P7zt8QuqRG6GDV5E7NWYlJW+vlV9oCWPXrI/9mXF3MjXM2m8sS3grEt2
 2t8J8o+vX4WHKLRlleGypzwHgAWnUpMCadujEyovSFBJrxcn797FMNLSDy3VCgWP1KBvzfV8Fah
 AU9e5er9DkEEkAqglLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDAxOCBTYWx0ZWRfXyEyT0MfYjciQ
 ZFg6YYoZj7pYmTPmDgMU0RPMQjBzl7CcsiLfekIVDP0NzB650ZrlKYWfLDwfKufp7TXYGqt8p0i
 7a6YQeo5ni4+tFLF/fLZ6xw1te0IjfU=
X-Proofpoint-ORIG-GUID: wzzzqSilMKq2yGWwZB7EsrzEaEyyB0aI
X-Proofpoint-GUID: wzzzqSilMKq2yGWwZB7EsrzEaEyyB0aI
X-Authority-Analysis: v=2.4 cv=e8E2j6p/ c=1 sm=1 tr=0 ts=6a90f09e cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Sv0fKeRqtYgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=0qfcr09modeMxCrtvy8A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_01,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1011 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280018
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 28 Aug 2026 02:21:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/244506

g_obex_drop_tx_queue() in transfer_complete() clears any pending tx,
so the ABORT success response must be enqueued after transfer_complete().

Fixes PTS test cases OPP/SR/OPH/BV-27-I, FTP/SR/OTR/BV-02-C,
PBAP/PSE/PDF/BV-06-I and PBAP/PSE/PBF/BV-03-I.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 88d8568629..67bdb6017f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -67,6 +67,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://run-ptest \
            file://0001-tests-add-a-target-for-building-tests-without-runnin.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
+           file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
new file mode 100644
index 0000000000..74f83a01f5
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
@@ -0,0 +1,44 @@
+From 7302872e85bbb655018ed21f4c449a22cf047235 Mon Sep 17 00:00:00 2001
+From: Jinwang Li <jinwang.li@oss.qualcomm.com>
+Date: Thu, 27 Aug 2026 16:36:51 +0800
+Subject: [PATCH] gobex: Fix ABORT response being discarded
+
+g_obex_drop_tx_queue() in transfer_complete() clears any pending tx,
+so the ABORT success response should be enqueued after transfer_complete().
+
+Fixes the following PTS test cases:
+- OPP/SR/OPH/BV-27-I
+- FTP/SR/OTR/BV-02-C
+- PBAP/PSE/PDF/BV-06-I
+- PBAP/PSE/PBF/BV-03-I
+
+Fixes: 7a35c12a6ceb ("gobex: Fix segfault caused by interrupted transfer")
+Assisted-by: Claude:claude-sonnet-5
+Upstream-Status: Backport [commit d094be10ff0cc9d48714d35557e0fd297f36f907]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ gobex/gobex-transfer.c | 5 +++--
+ 1 file changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/gobex/gobex-transfer.c b/gobex/gobex-transfer.c
+index c94d018b2..e4c7c557d 100644
+--- a/gobex/gobex-transfer.c
++++ b/gobex/gobex-transfer.c
+@@ -314,11 +314,12 @@ static void transfer_abort_req(GObex *obex, GObexPacket *req, gpointer user_data
+ 
+ 	err = g_error_new(G_OBEX_ERROR, G_OBEX_ERROR_CANCELLED,
+ 						"Request was aborted");
+-	rsp = g_obex_packet_new(G_OBEX_RSP_SUCCESS, TRUE, G_OBEX_HDR_INVALID);
+-	g_obex_send(obex, rsp, NULL);
+ 
+ 	transfer_complete(transfer, err);
+ 	g_error_free(err);
++
++	rsp = g_obex_packet_new(G_OBEX_RSP_SUCCESS, TRUE, G_OBEX_HDR_INVALID);
++	g_obex_send(obex, rsp, NULL);
+ }
+ 
+ static guint8 put_get_bytes(struct transfer *transfer, GObexPacket *req)
+-- 
+2.34.1
+
-- 
2.34.1


