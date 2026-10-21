Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8081.1792577316877263233
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=Lqpc7Pdw;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5n9P3620521;
	Wed, 21 Oct 2026 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FGt3NZ4kIQA
	7Fv6FZ2ollMFSh0kpDfgU8FaBwhC1WNc=; b=Lqpc7PdwzEq62XNvQPVXIhQ0JI0
	KCsfkc4Ukyu1cfKsRn7txClpoeTZ5D7nRRKIaULgxaVoUW9aLffzAjnD7vkclRbx
	nlLXAomvTh9BbEF43owgCIkYqOowwbKTrAzXZXtxgkfTyj76SGqySDjvb8Y/v8CD
	LoWt1mPQZf6gGcgXuZ0Aquxh8D2ruEnkYbTT/7DEA2yYinAhpyHNJoV8Q6kFYwjd
	AxX6CN7fZ8IfO/521hL9D5t6bxQmYvbuQHqeIeb/CjrTOB0NXx0kb/D+tqwr5DQR
	gLRFUN3KnYfGj1PjSuNmT65T35aIkKTh6Cv9wdMJzKiaPHvMK8ZpctZqiFw==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hebyd3t5d-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:36 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA8XrI3533788;
	Wed, 21 Oct 2026 10:08:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69LA8X253533742
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:33 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 8EA0123C5F; Wed, 21 Oct 2026 18:08:32 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH v2 4/5] bluez5: Fix ABORT response being discarded
Date: Wed, 21 Oct 2026 18:08:28 +0800
Message-Id: <20261021100829.2460593-5-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
References: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX8Fv+DQ+S8RTq
 o98nG+/c+6yWgd9REe7eqIRxDarLWn9szboFHLUJ5WZwIdKrjPrItj6wbIZnxdNS4kZBVjh7fs0
 WTcrSZYreEgFkYZhiTuR8o3IO9Rtr8JxDKh07g9G4/OydiWxNIPgpqrbugWORDKI/jRDlPBB8HJ
 1Yi6/XjVQWGChSEqiqFDDSEQkputLrW4jDKS/rWAhaTm4SRuCy2SszZANyFLOFJCHgHZjLeIz2Z
 gw4VvMmnckbNIMtJ7iI1AgiVp4+kODQnTWUb34MXRsQDaJdtvNvxF3I0Ix/VcLQ6CExYjO/BCYx
 k6HEjV4KU/mrht935OK143rnUIpUhnoLJPaKiw65JE6eeeITPUyHHmTboCr6pBXXYQbTwtaKeS0
 +le5+MGJKHABM8KM+uDdtJlz88mn7nX+dAhVkuwBwOS2+Kf5Gvo8hv5+dgzpDA1rF0KfKfqS54c
 CDJGe/d2FySr8bbkDBA==
X-Authority-Analysis: v=2.4 cv=TdsDJhQh c=1 sm=1 tr=0 ts=6ad88f24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=GEOtgntP3vMpD6wtaq8A:9
X-Proofpoint-ORIG-GUID: KNfH4dlhxxkeTmHny2rscpgUyYP3Fmt4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9inKr6eLzCm8
 09BMKbgyCxeTeeKDXd1fWSZyUg3G3D0HbAtL/XmhVS+e+3FtHtLxUpmsxNaGNLgtkKPaWy7DOs3
 pUGQ8dzCikIxxZh5f2N2vuO20Ktx3Nc=
X-Proofpoint-GUID: KNfH4dlhxxkeTmHny2rscpgUyYP3Fmt4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248384
Content-Type: text/plain; charset="utf-8"

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

