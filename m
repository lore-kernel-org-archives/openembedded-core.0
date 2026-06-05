Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DF54CD6E5D
	for <webhook@archiver.kernel.org>; Fri,  5 Jun 2026 05:42:19 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.147.1780627810130036010
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jun 2026 19:50:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=PDvPqNM4;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=Sg3KeC4G;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 654HOZCe944401
	for <openembedded-core@lists.openembedded.org>; Fri, 5 Jun 2026 02:43:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=BCt1Br881T2uXMcKXY9PnmpumyJW7TOgRh2
	iyBHVdFo=; b=PDvPqNM4nX2rfliLHvDG6iaq/WggKC3lonVs/xw7eCpWx1xvZZu
	VTfaCXFUUG+WHcR3VR8Tlzv0Dr2nEHa7Nvw/BYGhDBlxlAS6o5RZRO5fTcIbKXE/
	rkV5aOgQdE1BaYXJ55L4/bf9czH05x7e6AWaTPgbT3hLj1l3T/4ncPmvL9QbDu/t
	uBDH3/mXJPI7sCBZJipuBZZKnldfUFs9znIEsOfkYXAx0r3w+fCeOK92EF4y5aD1
	W1sM0AZYsKyf3vay5SUMU9e3jf12L8ELUtJKyh2aTSznPRUlky9O/9/EY7W6sP2A
	pZRbbBOtE80JrwQyMtuIH97hzP80qH2bROQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ek8d53sc3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 02:43:15 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304da0e350fso86149eec.3
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jun 2026 19:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780627395; x=1781232195; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BCt1Br881T2uXMcKXY9PnmpumyJW7TOgRh2iyBHVdFo=;
        b=Sg3KeC4GZsuFNSFji5FcZVKvIE9pY/7fYhCtjYez5wvlczp2ecpHpUPO/UGmLXjusv
         oRTELx5pBCOIjVVvOhTPEuWcP3VdycVlEdHnMPgic/KY36/I1Cm2Q0cpNiLtwMeIaSrg
         YjL/E4pWN3IL6aCI5fzSQTc7UN+5byGfSkqUsEAx5obFKXO8zVxaTMqphNDxyS5oBfPE
         kDgnRwuhlByd9Ae7gAhcUZ8XVZM18PSrLaKXho5jxe6quQ1CF+jXi6QDoInGTQi0BPlW
         olpekdCNC+l9OT8r9gx8XHpca75fxgUbRY8Mz0Ac2Nr54+e3t87Qd2ukZ7SjEgTQH8CI
         xIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780627395; x=1781232195;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCt1Br881T2uXMcKXY9PnmpumyJW7TOgRh2iyBHVdFo=;
        b=KZuuOmdqKl+BG7Vh0das3u0gAECA6NVKOjfm7FOUDu5RDReHkMhpNu2ouiKPW67JZj
         +rww7J0hOehYGMGle7O9NVbjXfl/S0jTftDEUBGuF1M7wyBXpCnhaLCNNruM/U3ETiOn
         kUK89pFTJKaggDGeAiou93GtNwBN4yCOgkdndbHjb3YFDLBnENNzSW1HGbRyy4mExh5d
         5P6QfYaExZr7ugDh3zPGfOFFu3IQKv5Bw0mMmrvKJPqDGqVC/cDKsxK/or/JyBDgpBAv
         G9f/CM0s9tVt+XGSUY792UG2cclqNfhc9kXPIR6bt2oZj722RqZ8x56DMRBMV8CFoxBk
         CF3w==
X-Gm-Message-State: AOJu0YxwAUN7gBIHseQR6MRd/K6f/wOx8DAYw+IflsywSebCXD+gnDPd
	lJ+WE0pRunu8Q0Kj21d1R8caqr6niGEsLVe3fX/EKm90ry+zDQeQwquCNJttryzI1uO5TM2GTkd
	DMNr8XOSJox9mPD2c6aT1wxtCSeI0UTt/cdVt4YTrGYR4QMIJRV25/zqTzhnYTn/WTkW8CUAdVM
	sw68VnMg/ZsqAfFxCkDA==
X-Gm-Gg: Acq92OGqVfc0wVfxFr/Rj25BmII51LjhZoN4QiAuFlw6tVA7+4TZVnw1TzHZHISxJeW
	Yc888a4gj1MCZPhnvBlTzI+afXixaQjwFXNwBK1SXdoDocXfNdis9zrkrapqDa4n8v+FrYGJ9l5
	ogum9kzk0GBZ2YpFarpeZRdbgCszSr8ChyU1mqhS+sCJSloVD77fK3bAvi1pH5MMuygfJl4BaZv
	IEXYIsqv2T91EPPjkK7wU853rhOhlGgDH40ItYe+fXcuFjFyC29LLGWeh6oEq4sMxLfHu3wtPhP
	CxPpL0j2s0UdTb4NnxYT7HQ3gY7s9w/Zz66wnCHOf44VsSqTvK2PkipuV3Xh3wN4i/jKFOc+jo3
	oc18OpHYYeWKgC2IbHTjmrI56Y59lzpFHtiqQVyWbvDLcqknGl/o/VpYDL6CXphRWEl/+AwCj1C
	y8jADTBPM=
X-Received: by 2002:a05:7022:45a6:b0:130:a479:79a8 with SMTP id a92af1059eb24-138066c64e9mr290428c88.2.1780627394457;
        Thu, 04 Jun 2026 19:43:14 -0700 (PDT)
X-Received: by 2002:a05:7022:45a6:b0:130:a479:79a8 with SMTP id a92af1059eb24-138066c64e9mr290414c88.2.1780627393772;
        Thu, 04 Jun 2026 19:43:13 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f716017esm7201681c88.15.2026.06.04.19.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 19:43:13 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Fri,  5 Jun 2026 08:13:08 +0530
Message-Id: <20260605024308.222721-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Proofpoint-ORIG-GUID: 1PS7JR0prgstcxfuJo7fAEum8Fkh75hG
X-Authority-Analysis: v=2.4 cv=IZG3n2qa c=1 sm=1 tr=0 ts=6a2237c3 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=dOK3wYaXzV_A1W3SHmkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDAyNCBTYWx0ZWRfX3+UA68HO2NhC
 V8S3tjPKOV5bWFz8ZTXpqTUHiP+mDyBfzXCnx2HGAB0i5yq9MaLAH0VX5O2FSNsT79gtkhrLvrE
 9zFkPmZFHsVo3yI3F6l8eoJpsx5YrB/GJosA4BKmC+ra5QPMg8Vv1nd701HPLIj063LQkm/7FQ5
 hbDfQTOBBkBTqd6pu+fIpJ/zWzX0UOcxvUCce4N6HX8mBZsaQpWCSh3YqfGRZdkISI+rqGJRBX5
 3oAO8YDUz+tSXo30SCMD9QqYY4JjzcS4vDFqCc0bvlgz3AHVDqEDLJrJWAQAtCdV8/wyblDAwhI
 EWKIcwI2yknC68LR+oQ3ErkupXaoS0b1NAHMJXdFupTIBT7ShmHh1LAC7m/w7HIBo+1WpQ25CWP
 UzljWzvIw48TKHyjnk6S0twsHAi02WDQaJmNcV9HSXiKd7qwRTrT3XOPsJLfGmi/q1Be94qdR6W
 z+r2lJnZ/ncimQr/F7Q==
X-Proofpoint-GUID: 1PS7JR0prgstcxfuJo7fAEum8Fkh75hG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-04_07,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050024
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 05 Jun 2026 05:42:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238138

Backport upstream fix that adds an imtu field to default_settings for
OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP
listening socket via bt_io_set(). Without this, the listening socket
advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
limiting the peer's outgoing PDU size and degrading Rx throughput.

Upstream-Status: Backport [bluez/bluez@646014a]
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index e827d0a6d7..71bceddb21 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -72,6 +72,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-tools-Work-around-broken-stdin-handling-in-home-made.patch \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
+           file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
new file mode 100644
index 0000000000..332b11464e
--- /dev/null
+++ b/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
@@ -0,0 +1,118 @@
+From 646014a6a246fe99df27da12d2de7bcd2e04d0df Mon Sep 17 00:00:00 2001
+From: Wei Deng <wei.deng@oss.qualcomm.com>
+Date: Thu, 4 Jun 2026 15:00:24 +0530
+Subject: [PATCH] profile: Set L2CAP IMTU for OBEX profile listeners
+
+The default_settings entries for OBEX profiles (OPP, FTP, PBAP, MAS,
+MNS) have no imtu field, so ext_start_servers() creates the L2CAP
+listening socket without an explicit IMTU. This causes the socket to
+advertise the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
+limiting the peer's outgoing PDU size and degrading Rx throughput.
+
+Add an imtu field to default_settings and set it to 32767 for all
+OBEX profiles that use L2CAP. Copy the value in ext_set_defaults()
+and apply it to the listening socket via bt_io_set() after
+bt_io_listen() succeeds.
+
+Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/646014a6a246fe99df27da12d2de7bcd2e04d0df]
+---
+ src/profile.c | 19 +++++++++++++++++--
+ 1 file changed, 17 insertions(+), 2 deletions(-)
+
+diff --git a/src/profile.c b/src/profile.c
+index dfc5f7161..65df0f7a0 100644
+--- a/src/profile.c
++++ b/src/profile.c
+@@ -55,6 +55,8 @@
+ #define MAS_DEFAULT_CHANNEL	16
+ #define MNS_DEFAULT_CHANNEL	17
+ 
++#define BT_RX_MTU		32767
++
+ #define BTD_PROFILE_PSM_AUTO	-1
+ #define BTD_PROFILE_CHAN_AUTO	-1
+ 
+@@ -678,6 +680,7 @@ struct ext_profile {
+ 
+ 	uint16_t version;
+ 	uint16_t features;
++	uint16_t imtu;
+ 
+ 	GSList *records;
+ 	GSList *servers;
+@@ -1423,6 +1426,9 @@ static uint32_t ext_start_servers(struct ext_profile *ext,
+ 			if (psm == 0)
+ 				bt_io_get(io, NULL, BT_IO_OPT_PSM, &psm,
+ 							BT_IO_OPT_INVALID);
++			if (ext->imtu)
++				bt_io_set(io, NULL, BT_IO_OPT_IMTU, ext->imtu,
++							BT_IO_OPT_INVALID);
+ 			l2cap->io = io;
+ 			l2cap->proto = BTPROTO_L2CAP;
+ 			l2cap->psm = psm;
+@@ -2075,6 +2081,7 @@ static struct default_settings {
+ 					struct ext_io *rfcomm);
+ 	uint16_t	version;
+ 	uint16_t	features;
++	uint16_t	imtu;
+ } defaults[] = {
+ 	{
+ 		.uuid		= SPP_UUID,
+@@ -2142,6 +2149,7 @@ static struct default_settings {
+ 		.authorize	= false,
+ 		.get_record	= get_opp_record,
+ 		.version	= 0x0102,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_FTP_UUID,
+ 		.name		= "File Transfer",
+@@ -2151,6 +2159,7 @@ static struct default_settings {
+ 		.authorize	= true,
+ 		.get_record	= get_ftp_record,
+ 		.version	= 0x0103,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_SYNC_UUID,
+ 		.name		= "Synchronization",
+@@ -2167,6 +2176,7 @@ static struct default_settings {
+ 		.authorize	= true,
+ 		.get_record	= get_pse_record,
+ 		.version	= 0x0101,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_PCE_UUID,
+ 		.name		= "Phone Book Access Client",
+@@ -2182,7 +2192,8 @@ static struct default_settings {
+ 		.mode		= BT_IO_MODE_ERTM,
+ 		.authorize	= true,
+ 		.get_record	= get_mas_record,
+-		.version	= 0x0100
++		.version	= 0x0100,
++		.imtu		= BT_RX_MTU,
+ 	}, {
+ 		.uuid		= OBEX_MNS_UUID,
+ 		.name		= "Message Notification",
+@@ -2191,7 +2202,8 @@ static struct default_settings {
+ 		.mode		= BT_IO_MODE_ERTM,
+ 		.authorize	= true,
+ 		.get_record	= get_mns_record,
+-		.version	= 0x0104
++		.version	= 0x0104,
++		.imtu		= BT_RX_MTU,
+ 	},
+ };
+ 
+@@ -2249,6 +2261,9 @@ static void ext_set_defaults(struct ext_profile *ext)
+ 		if (settings->features)
+ 			ext->features = settings->features;
+ 
++		if (settings->imtu)
++			ext->imtu = settings->imtu;
++
+ 		if (settings->name)
+ 			ext->name = g_strdup(settings->name);
+ 	}
+-- 
+2.34.1
+
-- 
2.34.1


