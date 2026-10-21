Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7238.1792573223513633483
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 02:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=GSrYR8iM;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: shuaz@qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5j65f793349
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=x+AjyaGfwGWmzGTlpibxCS4xDfyR/+1m3/a
	S+/Sw5nU=; b=GSrYR8iMEQmzO91OMYeLpmh+tu/ZsJL88huxEu1armTBraRD7RL
	/m+cCYc050AQO2imU6jSatAaxr+BoLcXoOg6WPxFi4A28r2pR/3GCVKpUb2MTn9g
	oO/aYVuHJ/R7wHhOJWQWvFQNFutO8NwpIyzyhKgMXfnuPgcJYb4PCfOyVqO1VdUc
	lXsgdA/MwismbaG1HHwi3NfHu7YoHFbcTj5lDq095q3mOlW0PLaTQyW/IdJvT7t2
	1HjdcGvIy65TAnrr4cyOGXKJ4KNR6uXetWvg59gma2iFMBVQHXKfBMUus9xFBSep
	BfGkviJtA4iYqQXoAoaR3eGYFboH7kuteBA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabk5kk-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:00:22 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69L90KDY3452049;
	Wed, 21 Oct 2026 09:00:20 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69L90K9a3451842
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 09:00:20 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 49AAC62D; Wed, 21 Oct 2026 17:00:19 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        chenhong.zhou@oss.qualcomm.com
Subject: [PATCH v2] [wrynose][backport] bluez5: Abort continuing response on fragmented CT replies
Date: Wed, 21 Oct 2026 17:00:17 +0800
Message-Id: <20261021090017.683390-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX02v6s/oN25oH
 ftwZx/IfosZWsCN6tCKrFVXUayD1g1/hFvGCFZLZiizYDgVrvKw6cyah3l7tdWdI10aBvh5sTdr
 6VUbMXWPCsFsD/dvo+/NbUTNLEnWGZI=
X-Proofpoint-ORIG-GUID: 8oGZITzTBVOP2nkRxUR58XmGYUZ-bVGr
X-Proofpoint-GUID: 8oGZITzTBVOP2nkRxUR58XmGYUZ-bVGr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzNSBTYWx0ZWRfX1gkjTJbK1dWI
 UslK9ih5ImtMCm7LqObGnUEBWgZpKVdMsBa5ccKRWRfSK9jj1L5fVJck+SQtNM9BEuxaurIPMAz
 YoJMrr44vNwl2H+LwTsY/N6Tq/Lle02UI41KZkIQR64ijEkG9ddxilCwazeXx9SMaGBU8Mdfxy9
 OfJPCzDZJKr6VGo6bwiZlrwf+iep/0TGETx0DmMhQ73jW5YAw/KK7gT0wwT8ZzdldEltoEWc4lP
 5FVEVtUOgGusLPojJ2cuBHgGChklAUFvn07khDhn643SPqQzJ82WVJrsP6MTxdWP9BklYqTvF5C
 FKSRaY8OjMeIzp7tcmOzYf+Be2Va7WHWl2Di8aT5EkDChuLIuYX1XEM9LILdTfucQmgmg85DpWe
 Kg1yEDrZ3d106EWmvVNcx92LBVs08esvxJtFXo23WhhDY5a3Fz1nBOMTMF7q1j+m6UxIxeu7blM
 dPASIjPKB41D+Hre/bQ==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad87f26 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=Q4-j1AaZAAAA:8 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8
 a=jIbkme_7AAAA:8 a=76Vs0sQ_QvFsS4K5clwA:9 a=9H3Qd4_ONW2Ztcrla5EB:22
 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210035
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 09:01:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248377
Content-Type: text/plain; charset="utf-8"

Send AbortContinuingResponse when a Get Element Attributes reply
arrives fragmented, as the CT side does not reassemble fragments.

Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
response on fragmented CT replies") to bluez 5.86.

Fixes PTS test AVRCP/CT/RCR/BV-03-C.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
Changes for v2:
- Fix subject prefix to [wrynose][backport]
- Drop Upstream-Status tag from the commit message
- Keep upstream Upstream-Status and both Signed-off-by lines in the recipe patch

Link to v1: https://lists.openembedded.org/g/openembedded-core/topic/patchtest_results_for/121863269
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...inuing-response-on-fragmented-CT-rep.patch | 63 +++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d857c23..2d0ee56 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -76,6 +76,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
+           file://0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
new file mode 100644
index 0000000..9b29ffa
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
@@ -0,0 +1,63 @@
+From 41a00c93baa48cbd63b182b853e93a946962cada Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Tue, 9 Jun 2026 23:26:56 +0200
+Subject: [PATCH] avrcp: Abort continuing response on fragmented CT replies
+
+Send AbortContinuingResponse when a Get Element Attributes reply
+arrives fragmented, as the CT side does not reassemble fragments.
+
+Fixes PTS test AVRCP/CT/RCR/BV-03-C
+
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/249e2bedfacf51fc6c89f43a0adb9a12d761c2b7]
+Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
+---
+ profiles/audio/avrcp.c | 25 +++++++++++++++++++++++++
+ 1 file changed, 25 insertions(+)
+
+diff --git a/profiles/audio/avrcp.c b/profiles/audio/avrcp.c
+index 326dfda..557ed97 100644
+--- a/profiles/audio/avrcp.c
++++ b/profiles/audio/avrcp.c
+@@ -2466,6 +2466,24 @@ static void avrcp_parse_attribute_list(struct avrcp_player *player,
+ 	}
+ }
+ 
++static void avrcp_abort_continuing(struct avrcp *session, uint8_t pdu_id)
++{
++	uint8_t buf[AVRCP_HEADER_LENGTH + 1];
++	struct avrcp_header *pdu = (void *) buf;
++
++	memset(buf, 0, sizeof(buf));
++
++	set_company_id(pdu->company_id, IEEEID_BTSIG);
++	pdu->pdu_id = AVRCP_ABORT_CONTINUING;
++	pdu->packet_type = AVRCP_PACKET_TYPE_SINGLE;
++	pdu->params_len = cpu_to_be16(1);
++	pdu->params[0] = pdu_id;
++
++	avctp_send_vendordep_req(session->conn, AVC_CTYPE_CONTROL,
++					AVC_SUBUNIT_PANEL, buf, sizeof(buf),
++					NULL, session);
++}
++
+ static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
+ 						uint8_t code, uint8_t subunit,
+ 						uint8_t transaction,
+@@ -2483,6 +2501,13 @@ static gboolean avrcp_get_element_attributes_rsp(struct avctp *conn,
+ 	if (code == AVC_CTYPE_REJECTED)
+ 		return FALSE;
+ 
++	/* Abort fragmented responses as reassembly is not supported */
++	if (pdu->packet_type == AVRCP_PACKET_TYPE_START ||
++			pdu->packet_type == AVRCP_PACKET_TYPE_CONTINUING) {
++		avrcp_abort_continuing(session, AVRCP_GET_ELEMENT_ATTRIBUTES);
++		return FALSE;
++	}
++
+ 	count = pdu->params[0];
+ 
+ 	if (be16_to_cpu(pdu->params_len) - 1 < count * 8) {
+-- 
+2.34.1
+
-- 
2.34.1

