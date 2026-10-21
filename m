Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8080.1792577316772348172
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=SJlYyScQ;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5k4d1391613;
	Wed, 21 Oct 2026 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=mUtpxK75LQD
	nV5sNdiwj3MOfGz+3kOY6Z/aFvR2USxM=; b=SJlYyScQXrPEnUFvgsaCzHD2D/B
	anUzoKrcTkqmq0WzzBZE04x2CKTo5ox4iLt20f40FKqYkNpyAOzpP9NQMazY1GUO
	ZRPocS85I0CVqnGYWTwH7p9xH66uhQRjn5XSarQTOHo3xw378R1HKk/plYZRK5Z0
	HA4nL105eCrahqc9mbb9nM849P1NaegWwCGbQKFzms8P8kU+YdLuk+5yHM/RonKb
	NidJ7yIRSKjTexpcWr6FLI19UfQUlJo/xs3BDiFCIndwUXbBM8L+t01RIXLhIyob
	EwVlfaMBJQKaLUbfAiD1sC0FXUMbM47oTyq0i36XvNfAHuwHdJ9VLpAPDpg==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hedabke26-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:36 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA8Xw53533784;
	Wed, 21 Oct 2026 10:08:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69LA8XMj3533741
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:33 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 84C5E23A64; Wed, 21 Oct 2026 18:08:32 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH v2 2/5] bluez5: Fix GET_CONFIGURATION cmd
Date: Wed, 21 Oct 2026 18:08:26 +0800
Message-Id: <20261021100829.2460593-3-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
References: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX4AWlEuAQsSSZ
 fuI6AZ97M5hM+lsL/1DCHGUyWE0z5EoKOil29e7nrOG1hdgFfUHKOSFzRbL9sbn0Jc8bk4yrU7l
 B18JXVfIEdHsNPc1w4WzhxuwtN2WwN4=
X-Proofpoint-ORIG-GUID: FSdgqd7-EgsiORLyeiWJ_CmwqrspZlDm
X-Proofpoint-GUID: FSdgqd7-EgsiORLyeiWJ_CmwqrspZlDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX9ENbFyNjoNvF
 RnVIuSaYW9d4YTNPtUjEkIBrmH094Ci523dQgFljcaLmQvCc2o0G7KwUD6qHiBSFp2QCIczF8Zo
 L4lN6ZAvW6+sTxra9OpVk5YyiDPzv5SRoEmQoPrFysXG5h8DiXDEv6UJ4waQ2V4YlwxV2LGDXXK
 4yQo0qsyc4F6ejPF3h/vcbyNWi4glUokYAQd+wpjkjASwVYEpDaeyZUf0V3SgD3x6BRXGNdghCx
 JgYf58M8XjkGYS/gRIv//m0YXH5OfnPsQhxqKlpEzph4//p3KgzKnYoFyOTWWkeyPc16iHw8L1/
 2YVH3FXZf1DhkmNpYAujrmCa3E1NkdPzJyofQmmXY0jrfa2/Et0G1EowtGaSMxOevTmoHYy6hj8
 P3TDKZPZ241QegV0RS51n2jNSNPUa3c9y5vD2RtWYNC8oW9DlLv7l7aXOar6UkiEhaEaFsNvEwm
 malPqwYcil3pDUe5hKg==
X-Authority-Analysis: v=2.4 cv=NLpAaE6g c=1 sm=1 tr=0 ts=6ad88f24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=4HOn1LdvDNRzZusI_zYA:9 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 phishscore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:08:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248383
Content-Type: text/plain; charset="utf-8"

Check the resolved stream instead of an always-NULL sep pointer
when testing for BAD_ACP_SEID.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch | 36 +++++++++++++++++++
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index 169269d377..7e05bda4f1 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -77,6 +77,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
            file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
+           file://0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
new file mode 100644
index 0000000000..3226ba39be
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-GET_CONFIGURATION-cmd.patch
@@ -0,0 +1,36 @@
+From 8e5ca68aeee22970e3ccf3bbb30c050938ba09a2 Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Mon, 8 Jun 2026 13:29:22 +0200
+Subject: [PATCH] avdtp: Fix GET_CONFIGURATION cmd
+
+This fixes AVDTP/SNK/ACP/SIG/SMG/BV-12-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/60437c06560e46d211aaf99620cc9510dfd8081f]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index d475a545e..7cfc9a80d 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1641,7 +1641,6 @@ static gboolean avdtp_getconf_cmd(struct avdtp *session, uint8_t transaction,
+ 					struct seid_req *req, int size)
+ {
+ 	GSList *l;
+-	struct avdtp_local_sep *sep = NULL;
+ 	struct avdtp_stream *stream;
+ 	int rsp_size;
+ 	uint8_t err;
+@@ -1656,7 +1655,7 @@ static gboolean avdtp_getconf_cmd(struct avdtp *session, uint8_t transaction,
+ 	memset(buf, 0, sizeof(buf));
+ 
+ 	stream = find_stream_by_lseid(session, req->acp_seid);
+-	if (!sep) {
++	if (!stream) {
+ 		err = AVDTP_BAD_ACP_SEID;
+ 		goto failed;
+ 	}
+-- 
+2.34.1
+
-- 
2.34.1

