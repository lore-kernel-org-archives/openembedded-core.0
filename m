Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D25D6CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 06:42:58 +0000 (UTC)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29692.1782456170318795084
 for <openembedded-core@lists.openembedded.org>;
 Thu, 25 Jun 2026 23:42:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=iaoXznYY;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=RxrhMG1m;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.168.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VZEN4129694
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/SdhtEbBZag
	HnQALTdv7hkXdXK1IKBp8oJe3NodW3as=; b=iaoXznYY8Rvl8X7g1/my10ywI2U
	84r3SctSUKcmqymuY2++sBIxcDXxNFZ+17HPZxx+e6XwgzZeMtk5K/tsGQZEtPlp
	OxBPEFGi1WqJpluURP/W/WNLXGkxQm7xscOg+SENTn+ntozco1h7qt0n7Dl3JjmN
	NGtIiQr26RGBc1DhS9oSdN6HK2hJTis+6bexbR0VD1leUM4M9DFrMnbPZu+c4qhD
	8gbk3sN5uGk+ENZEY3iqUlFIjt8LW19PEEkJ6litsriOEb36hRf4toYQPnCbQDYd
	aCskSmlp5KxkVW9DKuc52hSll0pfuLt4OTGND4yQBtMrbXyi6eqEbCmZl9Q==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1j1ngnyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:49 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-139ab61b86aso21835c88.2
        for <openembedded-core@lists.openembedded.org>; Thu, 25 Jun 2026 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782456169; x=1783060969; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SdhtEbBZagHnQALTdv7hkXdXK1IKBp8oJe3NodW3as=;
        b=RxrhMG1m5EYLSDjLjllAY3WEa8pLUIWtryVTICrMlwke/YZwjjTuvotvmB2FAhdGDT
         W+doPWxpqaqLFEVJN0lgN8jd+dUBTLwhkFQVANa28TKt7F2A6zev8g6EBHkHlyvYX/bd
         rDtp1vgzat0UNX02Bx/lkn1on3v7cZjty+khDNDz6y9+p8URpd3os9Arqhxb49pin8sh
         9+R7s/m8G9hBXVBMq0d1Z3Xyi3JmREB7DeG8xDbTZ2E8A1RRPeBH3+gSlpHxdZwky/fc
         4YuVA6AB3yKgHox5k3JwzzHEYoDOOIJneJI5S+ZFYM9kls6tsXyBQbljcTyUv+oGghVq
         i12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782456169; x=1783060969;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SdhtEbBZagHnQALTdv7hkXdXK1IKBp8oJe3NodW3as=;
        b=kmv+tspoyDQBj0epUfRIm/6D55ZrI5KBML8zMZBUhpsrKqdaWXOaO7BcvkoJPyxWba
         AhbVzxFqFSM5Pv6jGab1FNS0h1gbfxZae++Ixdh/Wctkp44VVLshiF7pbvDirEQ1eyVO
         wkUzQ0fZp1C+gaUPkrfbVw4Zvu5yq9PnfEk18RvFc7dyKxyY/QOzB/HhBjnOi32eZgLL
         EfcknHvOg8dATtrUMD4ow4v4zcV2JnrbrOcPmA+ahRcld34WLmRhd9KW2UsmUZBxslat
         P9y0vFn2rd11g4jkujdBSGr9ipyRojR44tPBFNbVo2nVZPgQxqrxRlPOhVq1ygjTC+hF
         KtDw==
X-Gm-Message-State: AOJu0YzD7Udoif0d3nIrOBPtiI2U4jwAMqNlimQexbOZsknTrleXc8oJ
	b0481ZtkIEoaqh1QVVAv+8oxOG1/7Bjjq6OMsEhOZhxw9+7eo4tSgoAID6ZZ1+FS6nNguHmCZFF
	8B1EJuw/MucnYQ2XtQAMaJJRKnco4lZinu1/dh3xcapujINpts/pemghkar7dnldZb/MB64yA83
	NxFrT7UbFYk0DCDEMQUg==
X-Gm-Gg: AfdE7cnVRApDfV4UNU57fruhTEi9mPu5s1imd6tVchm3FQwzlaPSmK0wxqV1dhQJ1X7
	kNvUkHNB0WFn6COJg3+7UFz+77G/MTOUN++05j/w5NxuOA9S4clM4bJp/ZdZgf23r/RKto98EPr
	BJTJEalHTO04wVVVK6jqtb/sNkrptgB9p7honcqE0wKyVxKStYs5GQcTJe+IHVlhmPYZDyE4UDP
	PD076wKAbxW7a2e+53R9p7qNNFOnL5InRXw+GB9EpbgkX6W6+JqIp294XMm4PhkoFz+NpttAL0d
	+lZFlcqvY/LdfpPzIYOhws1TrTaLhTXsZ7pfDVWZIOvQX1HXbn4r2hWioNv9IB1N5L8ZkUPrI+o
	I1hI0/MfEHEW6WJ362qIUd3s775VtBrvS6pLNXbzdLqVSJyOpZREjYx/JpnwIGw==
X-Received: by 2002:a05:7300:cb86:b0:2da:b05a:5a7d with SMTP id 5a478bee46e88-30c8488c109mr3367957eec.0.1782456168726;
        Thu, 25 Jun 2026 23:42:48 -0700 (PDT)
X-Received: by 2002:a05:7300:cb86:b0:2da:b05a:5a7d with SMTP id 5a478bee46e88-30c8488c109mr3367931eec.0.1782456168150;
        Thu, 25 Jun 2026 23:42:48 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7cac87dcsm16628270eec.31.2026.06.25.23.42.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 23:42:47 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, cheng.jiang@oss.qualcomm.com,
        shuai.zhang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH 4/4] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Fri, 26 Jun 2026 12:12:33 +0530
Message-Id: <20260626064233.704350-5-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
References: <20260626064233.704350-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: gSZRuRnYsCtlwfFzSNlbr9sW8YTHRs_w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX05gAf0eEGb0B
 ysKcbok51YGLG9Xd0pKPCwhticHhrbZoUZf/tx2fFO61gEpYFih7AmPCV27pnZuVH60oQsUyGq0
 eWNd6GxkIJyE6T5VckkyIkPAGqhvPGDAAxBexBdt15NEEtbVxe+oIM8HPHaRs8P4zmW5ATJf2Ll
 +eholnb5BHjxhFeBJpPYIFmyP5HlB17OSca+8fBA27wYba8ZVe1gjrjMvIlNoqfWgSngMck9Vf7
 dge4zBqMs5QfXs0NCWxJI0J9Vi90Q0x6RaTWbSSdWXxLhpr4w52Uy+8OL+gCZAI2Q+6LX8VbsVL
 wZzdOF3kLtM5dPLbLlgXihx0d6WUC1kmQVhFlF5PlibsIptjzYKl8/d00H0Cmo4ay+uDFET1Ib8
 QJaEc3lgulfvrPSBd2lYJG6BtPDkPJ5ecGAStjbni8O6+1wNZxYN6Z5pmJfeIwl5aK9GKE/Xelv
 VkNyTA15fTE0Y6A/Arw==
X-Authority-Analysis: v=2.4 cv=W+cIkxWk c=1 sm=1 tr=0 ts=6a3e1f69 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=dOK3wYaXzV_A1W3SHmkA:9 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA1MCBTYWx0ZWRfX0FCR2P2d/BLY
 QxijUtyPZtOBJeDh2/9WFslBVfTl3X9DsAuostXfxZiir2u3PqM7J21uFIKAkV+UkS8du/YmDJ7
 KXqdE78eugb4JAOQtUqykS+Z2kKlwkM=
X-Proofpoint-ORIG-GUID: gSZRuRnYsCtlwfFzSNlbr9sW8YTHRs_w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260050
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 06:42:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239607

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
index 4e51cc9a213..ad07e0d3c4f 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -74,6 +74,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
            file://0001-src-device-Fix-stored-gatt-cache-DB-Hash-value-no.patch    \
+           file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
new file mode 100644
index 00000000000..332b11464eb
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


