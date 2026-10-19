Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BE82CCF2DF
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.30012.1792398237653906394
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=aXqS0993;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4iu551405347
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FGt3NZ4kIQA
	7Fv6FZ2ollMFSh0kpDfgU8FaBwhC1WNc=; b=aXqS0993d45RV7Tcru0wec0TCBM
	6I8XmdGxGaQs4rIoH4G8pZNrChxB32AxgoXq9DlthkzUR6ijF6KEry0t6GPVMtFT
	GXF/rq9PhoqL5DeLU00X6kQMlElNyqfe3fnDYEfbVnv9tN8+v3b+pxgEZ1ehHYSn
	27TK3ERL2oWwbV6kxceBh0MXyM1RG75MXnIYg08sB1XYbJ91F5jY7THosNKq++dG
	EInBPuSrt4hPxXyK8Q5ploNUq1kS3RnwsZN+wcQfPHfsY0KMKMDmxFGtwqOguAfk
	z5iB3hO8tTz+oYHgFay82JKpeotyWX3M0hd+pANVJ+9MtkKrmj0VDNRGtmQ==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdbvr8xc4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8Nrtu4111220;
	Mon, 19 Oct 2026 08:23:53 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69J8Nror4111187
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:23:53 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 9392924342; Mon, 19 Oct 2026 16:23:52 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH 4/5] bluez5: Fix ABORT response being discarded
Date: Mon, 19 Oct 2026 16:23:45 +0800
Message-Id: <20261019082346.3287363-5-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfXxDIM99Ywy2Lr
 5JAPf8sMdbngt13d6n8oOisUCMurDohEiywtsOJyb7Z87XyboTYi2BSIrrxf757TNO4CXwGZdtw
 tzJPx29plwAj1uHTykqZ5PzopYP28HeU0E7vGANRM1IVsej+w+T7PBY3DsQEVUVY9TpCjgYTOLD
 yXozpshxRSyotLyztYVArbOz2y3Z0RSfDbPgO+uXnl060dHmiQzMsN4SdkIiyycmxuqe66DQS1W
 vT3NsIkKY4sNS/bbRcPz9/SkZM89Xugcg2LjVt++FJdVELaNllr4U9R0xmqW4390PMao9JDN5TH
 Xk4mq9aN0WE9gRUT6amz9pOvoH3/J7/5yDgBbwJK5SeBXCAHtXffj26mXbCbYRbV6xr0XemCeG5
 ky2beReNBI0cwhLjYu2iRbhbnwFDfqo1foI78Cd7147k8b6e/NtSVIddy9qQ6cTTLWHeuWRpZju
 acKCeuhOclM8QO64fFg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX1wDOdzKbXnib
 C2wSwglJBLZ5ZxTDic47qCzD5i4ZMRp1u/Ch9VK79yUw8QlRBeSGvVNT33jDo6kit7fawrAOUD+
 qSd8NdGjjz4XWrWjvpNq/CPFBlJGlVc=
X-Proofpoint-GUID: xpmH9Gx5znuzr1aqskFeNe3Dej2fHync
X-Authority-Analysis: v=2.4 cv=K/+3jCWI c=1 sm=1 tr=0 ts=6ad5d39c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=GEOtgntP3vMpD6wtaq8A:9
X-Proofpoint-ORIG-GUID: xpmH9Gx5znuzr1aqskFeNe3Dej2fHync
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248145

Send the ABORT response after transfer_complete(), since it clears
the pending tx queue and was discarding the response first.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...x-Fix-ABORT-response-being-discarded.patch | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index de9835e5a7..db650acdd0 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -79,6 +79,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
+           file://0001-gobex-Fix-ABORT-response-being-discarded.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
new file mode 100644
index 0000000000..5c0d7414ee
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-gobex-Fix-ABORT-response-being-discarded.patch
@@ -0,0 +1,44 @@
+From 38a88cc433e0bc3cccb6dab126e484fc06ccd8bb Mon Sep 17 00:00:00 2001
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
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/d094be10ff0cc9d48714d35557e0fd297f36f907]
+Assisted-by: Claude:claude-sonnet-5
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


