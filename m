Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8050.1792577316663013516
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Oct 2026 03:08:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=j7+f7ZBK;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.168.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA5YZs335128;
	Wed, 21 Oct 2026 10:08:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+33BbLM8g66
	NbumOE5aKlvtWSXKDKSRWDDLzkVmOsiY=; b=j7+f7ZBKosEvYnnx/DYMc+w/da1
	R3Xdx8ngykMHjYaac5e8larsrGSYj3llJqqWlBSVtxPRrlK9q2btmW3LB7YgukC9
	3ONG0hz1QHyAEbuWDmeeVT/fiLFuc3FinmZMBTHoe8ATNAHMg2YMfjQtqnvsaJyQ
	yqE7bqgw3KkjqmTo5KEhDMbipXuDdhpQbGwZtfX/gJkMKRNRJPm+4saVNUTxTxqo
	P+4mjG4yB6I5b/4I/aER9TABEiwOVUUmhMU6kYW/4Y3jOCCduafhw2nbjzgughh2
	H3p6I4EhRx7+eNrlVb3ZPAoCx6fY8yC7nBRnCcL/VPq97Rm+eUfN7Mde4JA==
Received: from aptaippmta02.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hetj486yb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:35 +0000 (GMT)
Received: from pps.filterd (aptaippmta02.qualcomm.com [127.0.0.1])
	by APTAIPPMTA02.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69LA8XFX3533787;
	Wed, 21 Oct 2026 10:08:33 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA02.qualcomm.com (PPS) with ESMTPS id 69LA8Xwk3533743
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 21 Oct 2026 10:08:33 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 7F83E235D5; Wed, 21 Oct 2026 18:08:32 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org, yoann.congal@smile.fr
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH v2 1/5] bluez5: Fix error handling for AVDTP_OPEN cmd
Date: Wed, 21 Oct 2026 18:08:25 +0800
Message-Id: <20261021100829.2460593-2-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
References: <20261021100829.2460593-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-ORIG-GUID: G3fPIaiyZSZT6w4x0XpA1orJYR4wggYP
X-Proofpoint-GUID: G3fPIaiyZSZT6w4x0XpA1orJYR4wggYP
X-Authority-Analysis: v=2.4 cv=N768hG9B c=1 sm=1 tr=0 ts=6ad88f24 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=mlo28EofXKx8c11XVc4A:9 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX83YAzklM/VZU
 FDxsEsQmmxg9CBQ0F+FgpH64iSDzRAw9IZ60z6w4Jfj4NfWxyps4xfXroSNUaEYiKS+b5izF+nA
 wlC3UkpVwNFsKO36qfsow8QC6mK/dXd5Bhi9veNEZRbmsrJHWAjCUZSzbSCzQwgf+Z0sMOi410Y
 /710tveJammYP5klNnt9Eo0cpqxiRdIkBfZ0JvILos8op9TchEamUGXzsCRKu3Y+Kifm4eMnK+u
 P/uh/tapq3A/dTGB0wMuIPF5E0joJBy5lbdIUWpkhOXlqQe9gmS3nLAu3/TwUSwh9MEAaEBQdbv
 tdhdAqsj3QS54uztLAKaN67zXcJ0Qlm9wczj4B9zBL9tCDBze621imKtYSaKf+SHrGl6+y+Cfq/
 nqh2CXftgRkGUq7OuhPvIy/nmrGsnwM/jEHfSw9SVVCe5t3RkQVoV1QE/INVh3gdTOsrRRDZQgy
 Emk8pVe3h99wr+/zuYQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA0MCBTYWx0ZWRfX36wflrP8Ryad
 lkT/hWVYO2c75wUwBllZJrBOffyatfrxBRAvfj6Np2+YcU72BTbv4TCIfh4HEVrQU2bftvFvXXw
 Q4gT9ycv7EDdLwFS+FWtfEp43pcorJA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_03,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210040
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 10:08:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248382
Content-Type: text/plain; charset="utf-8"

Return BAD_STATE instead of BAD_ACP_SEID when the SEID maps to a
valid local SEP.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 48 +++++++++++++++++++
 2 files changed, 49 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index d857c23a57..169269d377 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -76,6 +76,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
            file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            file://0001-adapter-restrict-delta-0-RSSI-to-proximity-filters.patch \
+           file://0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
new file mode 100644
index 0000000000..ba77d1e046
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
@@ -0,0 +1,48 @@
+From 4e0aba5a8ebd969b68cd3442e9f8066a4b15a366 Mon Sep 17 00:00:00 2001
+From: Simon Mikuda <simon.mikuda@streamunlimited.com>
+Date: Mon, 8 Jun 2026 13:29:23 +0200
+Subject: [PATCH] avdtp: Fix error handling for AVDTP_OPEN cmd
+
+We have to return BAD_STATE when local SEP is available instead of
+BAD_ACP_SEID.
+
+This fixes: AVDTP/SNK/ACP/SIG/SMG/BI-26-C
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/7c1c90f7b6d0f653c581878a039e2d02362f33f5]
+Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
+---
+ profiles/audio/avdtp.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/profiles/audio/avdtp.c b/profiles/audio/avdtp.c
+index b57ba609b..56d27b973 100644
+--- a/profiles/audio/avdtp.c
++++ b/profiles/audio/avdtp.c
+@@ -1777,13 +1777,14 @@ static gboolean avdtp_open_cmd(struct avdtp *session, uint8_t transaction,
+ 		return FALSE;
+ 	}
+ 
+-	stream = find_stream_by_lseid(session, req->acp_seid);
+-	if (!stream) {
++	sep = find_local_sep_by_seid(session, req->acp_seid);
++	if (!sep) {
+ 		err = AVDTP_BAD_ACP_SEID;
+ 		goto failed;
+ 	}
+ 
+-	if (stream->state != AVDTP_STATE_CONFIGURED) {
++	stream = find_stream_by_lsep(session, sep);
++	if (!stream || stream->state != AVDTP_STATE_CONFIGURED) {
+ 		err = AVDTP_BAD_STATE;
+ 		goto failed;
+ 	}
+@@ -1796,7 +1797,6 @@ static gboolean avdtp_open_cmd(struct avdtp *session, uint8_t transaction,
+ 							AVDTP_OPEN, NULL, 0);
+ 	}
+ 
+-	sep = stream->lsep;
+ 	if (sep->ind && sep->ind->open && !session->pending_open) {
+ 		if (!sep->ind->open(session, sep, stream, &err,
+ 					sep->user_data))
+-- 
+2.34.1
+
-- 
2.34.1

