Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3561CCF2DA
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29873.1792398238096242586
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:23:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ibcphYJ1;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J4jG591555639
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=onL/3M68Fp+
	JK5R1t7ROOq2zGlNyDXsNkMnzNSISf2E=; b=ibcphYJ1PV1tYZNL9GwTcTZ1VZ8
	gNE3w2DDirpMdC7FZGHwyFa3kwLQa2saFEjitL6OsbxIX/rkudDYiul+G87JhODj
	cyXrLSeBxOFBSMpxYGbFn0W2H2Dg/qEQbnysU1xwhThCWgQ6cwQL6zrTCf0zxh5k
	ckMwVgBosJgW4DGSJ9szi/WbH7desBkVeoIWSpatwZAwwjWWP4qaUGWHkOksb9iD
	4srtErWxsnuBDl5WnBWVqKlTnqtbFnvu5+ExnvyLgT5LwEBjaVCHBB9zWDcwCrpV
	c7gHKjpmi081KEO8J27m5yvf22/y4O7M9Fg6Do9RyRmoIzDoMyw+pvRF01A==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hd5ur1sby-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8NrSb4111219;
	Mon, 19 Oct 2026 08:23:53 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69J8NrEu4111186
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:23:53 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 8EEA524341; Mon, 19 Oct 2026 16:23:52 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH 3/5] bluez5: Return correct error when SEP is inuse
Date: Mon, 19 Oct 2026 16:23:44 +0800
Message-Id: <20261019082346.3287363-4-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfXwc4C+v8bESiF
 hXRfRnfust4LWsp0pLgrQhIiOrmq5Wi1APMgEuaOq4W7AhPMGbMCNzrxGzUf8V5QP5ydsIOhAjq
 3OSbSBOiYIjNXLwA1x3cDZeYSSWbbpA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX+i5pIOPcj3MV
 v5CCxfzlAXaJ1q61AWvlePmeOn1aSiujLV2E+Fup/AWAPR7W594H02rtM8mTB+dOIrPTcRh2I2+
 xXUrqaFF8mZyoJ+aml80lqAzTVr7eqohXeA2x71J2m0JAotCCckQU/+gDUCNSQebmAu38vt963o
 BhGPnpFqraT/GyBF4GpCtwMcx3+pRqqEKKhAGN7cBgLwQhwz2ZA2ClOzBPnI0xh3HIEbIY5TFwF
 bb6HDAj2lDpfF1VHsHPOkTGw9X0Olwj0dH1FGgxednjHUaX0yn3rUwWzz2uBDCMNm0M67j06U4s
 iDkzdUDdQ2AG34mXEwvT6zovHdcjtuW/YHRqYbNPzlI1DevuIOozKo7s/KcpxcEVlIfn4OqAK0R
 NsiSR33oJMw1pQqDPz+ZtwNW6F+qVa9kw46Xd3xk9KGTdwERgjxm27yPQGKlHZgoGUhKigJx7fh
 OKc9qavFaokp7KfmVkg==
X-Proofpoint-ORIG-GUID: 3vjgaN88n0IaV6flAGhqLqRmLjnKtf3V
X-Proofpoint-GUID: 3vjgaN88n0IaV6flAGhqLqRmLjnKtf3V
X-Authority-Analysis: v=2.4 cv=CP6/zhrD c=1 sm=1 tr=0 ts=6ad5d39c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=IccVTasTp-42yIGwOJcA:9 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248146

Reject AVDTP_SET_CONFIGURATION with SEP_IN_USE when the SEID is
already bound to an active stream.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...turn-correct-error-when-SEP-is-inuse.patch | 33 +++++++++++++++++++
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 7e05bda4f1..de9835e5a7 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -78,6 +78,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
+           file://0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
new file mode 100644
index 0000000000..76121a7eb6
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Return-correct-error-when-SEP-is-inuse.patch
@@ -0,0 +1,33 @@
+From f1bbe63447bcc69beb546bc1e26a4e99c529d70e Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Tue, 9 Jun 2026 23:30:13 +0200
+Subject: [PATCH] avdtp: Return correct error when SEP is inuse
+
+This fixes AVDTP/SNK/ACP/SIG/SMG/BI-08-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/39ad431de60b896a03904887a0f1d0285b719edd]
+Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index 7cfc9a80d..b57ba609b 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1556,6 +1556,12 @@ static gboolean avdtp_setconf_cmd(struct avdtp *session, uint8_t transaction,
+ 		goto failed;
+ 	}
+ 
++	/* check if SEID is in use */
++	if (find_stream_by_lsep(session, sep)) {
++		err = AVDTP_SEP_IN_USE;
++		goto failed;
++	}
++
+ 	switch (sep->info.type) {
+ 	case AVDTP_SEP_TYPE_SOURCE:
+ 		service = btd_device_get_service(session->device,
+-- 
+2.34.1
+
-- 
2.34.1


