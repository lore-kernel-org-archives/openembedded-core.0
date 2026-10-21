Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5868.1792566494442232688
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 00:08:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ocrWP9rC;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: shuaz@qualcomm.com)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jhT43573923
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:51:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/mCyaciXD53lRRB7kdJglCwQLiZIYIm56jc
	oM00jMPE=; b=ocrWP9rCXgHK6IF5KZN3H9FOaU6pzgzZ2ZJiKRqDObDjzJNEqsT
	IA3TBrJeWKQISnEJOmBBfxWt7BAbIQDAoUPKfRv+KysY26Tu7X1U9jcYyXSKr4Aq
	TvIYPXkvHNk+dVw9KLtLovG7RXAZU4ECo54Rp30455ODzKb/PR7vvOinuWD+4A/5
	+2Njj6xTMggIKmV5jT9FxwTaC+klY+cRzKUdabwC0gQFc5kD+Bm2xNX5a2+3POi5
	KAvTUI+FygWgMrCBLTAF8Le9WGHEruyjB+F8Pb8oHjuBaG/jPkocx47ekL5w6kon
	OMmodMETUVUaA018LLph7hDdo2SzeF1OvFQ==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hed9htdxd-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 06:51:32 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69L6pSqL3295266;
	Wed, 21 Oct 2026 06:51:28 GMT
Received: from shuaz-gv.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69L6pS6r3295254
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 06:51:28 +0000 (GMT)
Received: by shuaz-gv.ap.qualcomm.com (Postfix, from userid 4467449)
	id 93E84682; Wed, 21 Oct 2026 14:51:27 +0800 (CST)
From: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, wei.deng@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        chenhong.zhou@oss.qualcomm.com
Subject: [wrynose][backport][PATCH v1] bluez5: Abort continuing response on fragmented CT replies
Date: Wed, 21 Oct 2026 14:51:14 +0800
Message-Id: <20261021065114.169649-1-shuai.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=YuKa1IYX c=1 sm=1 tr=0 ts=6ad860f4 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=-_jkgwSULlq1YfkXaOcA:9 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAyNyBTYWx0ZWRfXz+GhbGekCaaF
 hMXcRR9nKpfqtOqSpnWCZE2t7qTH8F2AowZRz7AQ2MxgAAe0z3NEIE2DxMsCrSaH3Nx/H8LaM/Q
 YDPnHzuXBYMB7M5liYqtqJdIiTSf1a8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAyNyBTYWx0ZWRfX5zdAkqZICopa
 X+WKGYA50RL+OCucRjdwPSRjS2CwAABLzWn7ExfHrzvaDVa1/Ah+wGjy+PeBwiH3brjEHxFou7X
 6zsPIZwTxzF0hSvMa45uK6IWM3x57VoeYoGK3JrsdzH0YQcHYrwSuZ1e3LHmXq8pkV+FO74OfKq
 RvUZdp0wOri400mTlZIfxwZVieGNDvsEBpyJ+Vf/Ee0V5GGMHMX0Uswpvjed8cM7sxTFQLMEsf2
 guN0rMNt8mPy2tMUwzwjiitCcQmm/3yXS6CqFo4c+tAi1QF2mDnGs9H6mlxeTzrQr+mb2MsuLqZ
 JvRPHXdeyArURw9E/axEzl6XUyK2xDv/QSQkHp9LW8wiwgD7lftM/L4HV2tXDCCALtI80lXAE7L
 hIpTv98dAaHvwaKHGdzUf90AHvAa7rSGJPka1VD2iWWsbB+Td9/Lh9QOEjAhwVy5prsiaw3oWh1
 1UugwvMD9vPH9AK9Z9Q==
X-Proofpoint-GUID: YfSQS1_0kwSBJMwnQZju-lIUqL79THtO
X-Proofpoint-ORIG-GUID: YfSQS1_0kwSBJMwnQZju-lIUqL79THtO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1011
 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210027
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 07:10:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248367
Content-Type: text/plain; charset="utf-8"

Backport upstream bluez commit 249e2bedf ("avrcp: Abort continuing
response on fragmented CT replies") to bluez 5.86.

Fixes PTS test AVRCP/CT/RCR/BV-03-C.

Signed-off-by: Shuai Zhang <shuai.zhang@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...inuing-response-on-fragmented-CT-rep.patch | 59 +++++++++++++++++++
 2 files changed, 60 insertions(+)
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
index 0000000..b0cc3b0
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avrcp-Abort-continuing-response-on-fragmented-CT-rep.patch
@@ -0,0 +1,59 @@
+From 53bbb4577bc61a24459100ee86da287fdfbf856c Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Tue, 9 Jun 2026 23:26:56 +0200
+Subject: [PATCH] avrcp: Abort continuing response on fragmented CT replies
+
+Send AbortContinuingResponse when a Get Element Attributes reply
+arrives fragmented, as the CT side does not reassemble fragments.
+
+Fixes PTS test AVRCP/CT/RCR/BV-03-C
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

