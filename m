Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B06C9CD4F26
	for <webhook@archiver.kernel.org>; Fri, 26 Jun 2026 09:39:42 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.31546.1782466776582102482
 for <openembedded-core@lists.openembedded.org>;
 Fri, 26 Jun 2026 02:39:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=p5j3pZ65;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=hH0U3942;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65Q6VXxR587008
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=/SdhtEbBZag
	HnQALTdv7hkXdXK1IKBp8oJe3NodW3as=; b=p5j3pZ65l1da6Rpv9VjyqG8GDJr
	4aMCXQlnqf/l4xHZ/dQSC1CLjJEpG1KS1+EP4g5SuGIpGU9E+x8ro0hqXFAb/5O8
	dw3TCe+UuBLHVnLrSjye+nfmzMl95ghOo5J1wpp3ya/FrO9Js7+NAC63n5g5lei8
	3lJ7ZWnucal6RCMwEBJCOSXQYl/ImyS7t9fLRlTy4bOz6wUzHMBNTbdWUWiclvjI
	Bmuu9FeidoZ2NrnQvQD+h58oo/pBVGOicfHHP8CMuqQ1Aps0EihG35WQKbAppYEV
	+KTpkmjGQubOgr7yP6PdBp5VP7euiBWlZKnUAWtQ8DbEf5FzxBr9nf5CF6A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1eewa31f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:34 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30b7fe4d3f8so100189eec.2
        for <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782466774; x=1783071574; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/SdhtEbBZagHnQALTdv7hkXdXK1IKBp8oJe3NodW3as=;
        b=hH0U39427CMrjKmDw+dIFYTHQxu2Gfq/OV4oojmGkwKIoFL2pkj6JVRCSEftNTKXeD
         3WhOcvmmRdjoKqX12waz0JBd2p+gnlETtHUm78ULNIKc3ommeyog3pJMBN7e07RECNGe
         zXrOptDenRFZwm2+1aWA3BsxZMA1B9Tt4pArEn2kaxYYP3MxElS/O9mkFHQaBW8scvDC
         OrccgDVY2bUumL5uCj6DBSl9WP29HCNIhjuL+12PALI1LmOjW6Fv2yRhhLuKT2Y2mAZ0
         syhV2XLPiYA8ZBwgfQRx+Ohq86acnhadWpnCcFhRrEHT1U+mfOUHHuDUz0R3Oz1axYq+
         256g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782466774; x=1783071574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/SdhtEbBZagHnQALTdv7hkXdXK1IKBp8oJe3NodW3as=;
        b=TCwLFFmC4AtQbiJXyLxZ/J18aoooha9SE/wT7aEIrsiH4XSGfpnrU+/dK0cfXbOFRx
         iQep/cyCtGD/E3m0AqjaiPOnsc2fj+vspETB6Yp3yAg2yhyp/b4UwDeId1cGplljm7q8
         yLuJa6IOhgyYkgGfWr+zpYn6VnndepLaPNuz0MqO9mke3Nh3h/eTye038asgQbISH9TD
         k9FPJLsvS08K0SMp29jjFE/IgoyjtPm2A7UvfuX35bT515Ck95JfBk8Rdhh2Aty4qOIK
         YgSx76r/XAbtDYS7hhC37sXbGo58z+ozfRUsXAQzb5O16u1wOsMV2zPgBVA+zJ0QGIaN
         T+6g==
X-Gm-Message-State: AOJu0Yz1CqGA6woKuomkjXWluFDkh1MWHi3brHcElu2zXtKu3G7I++wA
	SIq5enduqa5vTK6H9qO9diFQNDw6ZVtIhO/davU0jpaAtVw2YvXQxZB+fFS0cCMSKlIcxiQjdVu
	eMfducyWTnoOKP6m3JkflFgNdyqjs2YEiscx5vVWkQGYRO0M4QsuXQt83gghQmjpfttIqBVQozE
	EIipeyJfDWjgLQr8ETrA==
X-Gm-Gg: AfdE7ckM1yVbGwFMVk7v27/ihbhhXhsDr+FEEs+Es2QEM23etmzvetQsRQK/4/fEpTk
	HtZR7Oq3O6faqAtIOMetITgD3Q2diL8RgoTyf3naIPfa8/yaEf4U0A+4+eO7bDKBF94dOXGTbdq
	m1tnFFQyd4y5lqyEjvanWn1zCiFdQxRoyR13luy3aOjPls/SnN6m61eTH7nc8ps0lkT9uuMfFRk
	iu2rgDvwDBL7HzJC9EzDN8kwtVskwTgY/hFlQZDvG+LApH423NYe+5nK8//dvfweFoj9raNbjbd
	h2j4/QVAp5rVrO2KywsKWPkW/r42oB+eDe86KxAXSZi9SLTKM1ZscBnDa9jpa1zKoVZchWojMCD
	KAX/Itn9TGS28alTAdYUsLS2y+5GhuwzgetldHYJCsTmKTqfQrjG0TgFHEUno7Q==
X-Received: by 2002:a05:7301:5f02:b0:304:4f23:4823 with SMTP id 5a478bee46e88-30c84e49c6fmr2778368eec.7.1782466773763;
        Fri, 26 Jun 2026 02:39:33 -0700 (PDT)
X-Received: by 2002:a05:7301:5f02:b0:304:4f23:4823 with SMTP id 5a478bee46e88-30c84e49c6fmr2778349eec.7.1782466773207;
        Fri, 26 Jun 2026 02:39:33 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9e9214sm16908725eec.20.2026.06.26.02.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:39:32 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com, mengshi.wu@oss.qualcomm.com,
        cheng.jiang@oss.qualcomm.com, quic_chezhou@quicinc.com,
        shuai.zhang@oss.qualcomm.com
Subject: [wrynose][PATCH 4/4] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Fri, 26 Jun 2026 15:09:20 +0530
Message-Id: <20260626093920.1079859-4-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
References: <20260626093920.1079859-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfX2rGEznL5WRMI
 N5FGgZ7LX12Fa8ZnXStdf77S2SPkLP+lP0uqfPyuQgFMDdNCmMpw5Xhr8AOZxNXATMrok4x+7o8
 ysSYQDtXmfkEh5T8TXwY1mO//VeAU2w=
X-Proofpoint-GUID: XXFyUz5WDM6L6pnRGAaNxOgDM1XPGSUw
X-Proofpoint-ORIG-GUID: XXFyUz5WDM6L6pnRGAaNxOgDM1XPGSUw
X-Authority-Analysis: v=2.4 cv=P7UKQCAu c=1 sm=1 tr=0 ts=6a3e48d7 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=dOK3wYaXzV_A1W3SHmkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDA3NyBTYWx0ZWRfXyDKx8/XwL8A8
 XnkfvcaNAcNjkivDP62QE/uEdnAPLo5mG/jnTi1tl3gNFZatWdHNKGlqE2zs/sKmhVvyehr0IQO
 7AG5jo1wdvFqhuU33pKsYn0dYIbWqHrJw2dF3XbEECzAcnCBzB9HIqOhvpQrj97CqmBKfcezplJ
 CxPoXq5gRWSYov9epKcLRMM7IcGNn0kyeT7/houBsjfu/NlblqjW+49TjQ0v8X6oJthZcvlBlYv
 GKF1XYiB+fZTdwR6Gu9LZMpmi6ducDOj6RxiRsxVrvPffXDd3//ILrcmS2vll8b6aOCHQ6YPH4R
 iOzswuO8GzpKcWXDlwWFAcljwGlS3fP25Fba0VCBP933JHVE1p9Qw0+p/r0MYJCRQRP1FK+6TBJ
 IZLsBSnVBLhWnQ9f1HtmhjAIg7ObtlnfJSlcST7NtXrnp+IgGS2bPWvGG+zC7NbF4fOiJkiML4k
 cKuwhpSeXZ16r8+DRQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606260077
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 26 Jun 2026 09:39:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/239622

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


