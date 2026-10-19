Return-Path: <jinwang.li@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F356FCCF2E0
	for <webhook@archiver.kernel.org>; Mon, 19 Oct 2026 08:24:04 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29872.1792398237546518446
 for <openembedded-core@lists.openembedded.org>;
 Mon, 19 Oct 2026 01:23:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PnYid0Ih;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qualcomm.com, ip: 205.220.180.131, mailfrom: jinwli@qualcomm.com)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J7n7ZA1089230
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=AposdZkazPx
	lKr/rfbl4wQfuhry0aK4wdjdwby8lBNw=; b=PnYid0IhFxzYKehsE+sSFl/yQ/I
	cGilP6D1JD2+fBZGeu3YiuLUH+ut4VNV7K3Rs8VATmf9DGeHKZyHCp0SVH4tckY2
	ODXY4nYaVsNN3Y+a3UDZG5bDJWGPMqYW7yvSAbS56O7CNRAo2G2WzE9B8ja2/irp
	hQRKLtLjZVesNpOY9v+Sqr7hjrdveURgAG8/MzTSamxMS2henxRDzlyoiGMYwkdb
	MWKzFEVWW71tLhR2z817uMAd81h6LmpXxqoITOH9x8XG9mR5Tbei9SN2/iLsLBs5
	GneLp6s7gR7IABHPG+RPKwSerz9LE7+2AMTS/+yg9NgLarvW8U59I1WiX9Q==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf5c8491-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:23:56 +0000 (GMT)
Received: from pps.filterd (aptaippmta01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8NrYd4111236;
	Mon, 19 Oct 2026 08:23:53 GMT
Received: from bt-iot-sh02-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 69J8Nrax4111188
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 19 Oct 2026 08:23:53 +0000 (GMT)
Received: by bt-iot-sh02-lnx.ap.qualcomm.com (Postfix, from userid 4467392)
	id 8667C23C36; Mon, 19 Oct 2026 16:23:52 +0800 (CST)
From: Jinwang Li <jinwang.li@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        wei.deng@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [wrynose][PATCH 1/5] bluez5: Fix error handling for AVDTP_OPEN cmd
Date: Mon, 19 Oct 2026 16:23:42 +0800
Message-Id: <20261019082346.3287363-2-jinwang.li@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
References: <20261019082346.3287363-1-jinwang.li@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Reinject: loops=2 maxloops=12
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfX4kdvmJi9D0Af
 Lr015XsExDHokfFRmx+WCqrqRwTZWemIAyf0PMIbER6hSXBETpaDOBVMRspxU+ArQ/NQ+TD8qTb
 ebmYc8DR+RH9Ev39Ht5sxVW8056+Tlg=
X-Proofpoint-ORIG-GUID: CEnPOjOJ2l6MDAwaY1D1gffzM94eKaaE
X-Proofpoint-GUID: CEnPOjOJ2l6MDAwaY1D1gffzM94eKaaE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzMyBTYWx0ZWRfXwQUe8N59Il1s
 xqoxNCicvDIGnE8SXIH60eVfcVLm5HaWgvr47lFkLaOh5SYqlON9kTuXJYNDR6FA6C/sbmTf/gj
 dQf2KWDruftJ7SuxXum3dYZSQUJvUcc+12kZ/lCJY/ATmW35FqLa7/wyTe8Sf4zrvCVYdFtby0O
 pAjABFYI2tZVo8uvrMrLKtIVy69mhcqHA/4EFQXqrqtTMtykpHQybqT0ZGN7Yrc5L0I0T+PxLou
 fh7n8/XL9f8g+SKfKOW3oscgSZ6jQ+4ygB8R5RQJD9RZ+RmK6cH61csIzeilTsd2RNCYkbi8/VD
 gfx+3JXOhEoXUB+AAbLPlNmBMhVWspnQ12hLE6j1KQDLo8gVSG0l4BHppNjLz3xJuY91Vd8luJG
 dMXoxoAZwuwR4nSwr4ovLyc6CznIdPEu1uli2+JwcWxNtjYGO/IeljsrCPmxv0i5gmtXS0FZfXJ
 X4TWF4Adoq41IrXV+UA==
X-Authority-Analysis: v=2.4 cv=K6O3jCWI c=1 sm=1 tr=0 ts=6ad5d39c cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=jIbkme_7AAAA:8
 a=mlo28EofXKx8c11XVc4A:9 a=4Z6V1Uo88S3JekNeKaJk:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_02,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190033
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 19 Oct 2026 08:24:04 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248144

Return BAD_STATE instead of BAD_ACP_SEID when the SEID maps to a
valid local SEP.

Signed-off-by: Jinwang Li <jinwang.li@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |  1 +
 ...ix-error-handling-for-AVDTP_OPEN-cmd.patch | 49 +++++++++++++++++++
 2 files changed, 50 insertions(+)
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
index 0000000000..0d346a2258
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-avdtp-Fix-error-handling-for-AVDTP_OPEN-cmd.patch
@@ -0,0 +1,49 @@
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
+Signed-off-by: Simon Mikuda <simon.mikuda@streamunlimited.com>
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


