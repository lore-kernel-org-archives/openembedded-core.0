Return-Path: <wei.deng@oss.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CA1CD98C7
	for <webhook@archiver.kernel.org>; Wed, 10 Jun 2026 07:51:16 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.15138.1781077869384725054
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Jun 2026 00:51:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=ADCCyztb;
 dkim=pass header.i=@oss.qualcomm.com header.s=google header.b=FdpuddQB;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: oss.qualcomm.com, ip: 205.220.180.131, mailfrom: wei.deng@oss.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65A7i4CF991815
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yb/PuStZziN
	KfQgqTx/vW9cFyHQDfdoccw4rHzwRt5o=; b=ADCCyztbCUrYaEzTducKoXY7Al3
	xoLAyPcNj4bVm76oQkpngtwjJjveetD9iKeVCDtYoF+KLnTB+ciJitvvhSMfigcG
	IUhPcodOappKE8bBmEloIhgbqs6kvWxoMcEyhKaNETxC7Ldl9yXEOiwY9wy7vqOc
	kM5d+R4ueLFhQ0UtVOZPOnvCrtcQ/fxb48dav5uvDj4drIAQvh0sVVwM5XN4yR53
	3Y9O05e1sVD+fPM0zjqo9XCKC3out8wEKYHrqD6vqvq4eBXn2nCKasKq7UNVoLsK
	vo2+aZmpXSN8rcBVLMAAzMrkfqDEyevwujwHym/sesf5HCYgISk6U0JK7fg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eq1tg0gkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:51:07 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-304d7cde3f6so666764eec.0
        for <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 00:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781077867; x=1781682667; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yb/PuStZziNKfQgqTx/vW9cFyHQDfdoccw4rHzwRt5o=;
        b=FdpuddQBzb0D4p4R1/mpB9PiGmd8Zlv5Hs5/icmoZlYdjIgXOjkaTt0z3F2UnXCb7n
         Dy7E+L6gW+3Y8IyX16/PukEOZ2DBUqyf4wGGhKvYBpiKxpliN4LXapqFqmWT95n+m16T
         arqSMNTYNiybu8Alzvn2epkY530/9HceLvKoRRroXQeUgNrg6xsUeCuSUeddCJI5ikGv
         T5HePlFVUq+gmrWwkLNux0bm9ozZ7H63OWNWVCO8Itz3vz/CR7X4b6nn3PQLctlQXWlp
         KFC5kSuSzwsmJ0usVRP304t5CZDkKLH9HMnWKX6bYZO/ZIyx/DhvLdCQkLh/hZqYIs3p
         f2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781077867; x=1781682667;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yb/PuStZziNKfQgqTx/vW9cFyHQDfdoccw4rHzwRt5o=;
        b=d11WHxR9DZoq9F+WT+8GHn847LBl9pVlPEpRxAmg9mPAkRZDDHNutnmYKtcDXHE54j
         JrcvaMoEY9KaTGGjgroxAI3duty4XI6jbw3zz0GJSkuUBdpV2gIDQLuEBiHWmag+VRY+
         nwZt0t09lF84SSA6bysommo/mGVfwg2Wyda2p7N8i7xXMaICyGZFHDQ0Z16x+RmXU0j+
         4IGd7jomdrdX49IVlaebba+Iwv4E19lc3vVgygVlW103g1ew8V3Rv/vkuXF7szQK0pfO
         y+VtcpAwfm0uSitkOoUIF8Cp3EtITgIhvy6CwjM6EuxeM5rDKY/ZBOg/GH8JKSmHucRA
         LY8Q==
X-Gm-Message-State: AOJu0YwsR/pd57BSUf66QYLkKDLGqwuioNbQJAxFrwCKI9gLFB20fCzY
	KOPmhcO/MIMTQf73SPZbWt6wwj4v3tt/wuJCi0YdFaPg2cfvtfdsKURh3hdUoYxeMWglp6cRarx
	5jhGJAy7RU5VLpmsVu2h6Cg+KmIa6uUYFPJ02jXPa7kMm4SfETOErl6FR0WqSCBCGNMF69L8CHq
	4HOLbsKRim+FaSMk6dcA==
X-Gm-Gg: Acq92OE8U1BSzC4+uaLwRkmJhfkV6DhnzlW+WlFFGVhCMKGcwzBHriNvMdbUyi/kMRN
	wMjkiO7S4w5BOPxUa5u5hW6fKa4tZjMPo9Oeb1QdTXKzVN3auHEKHJYfGvpSIbhRe3Ws+vQ8lFc
	jWk3qxjEmCbx6/lQXV0PT4vttDzHgW3JEK6uqDF4qOGy4RngpJEhRdjSZjMox0pw9+bdLtpccfi
	BSmXRs3sgsapxR1oNs2MWKjtkyZv2769Nnscz9F6IvkbGucaF2nqgdKFSFCvhtVoBKwHESU7EaM
	7ZjHvC9a0aYQl6Qwu8EWEvQdnZ9pRtN9ktD2i/ik8wUn+ijef0vSIVAKjvUUHEpTTmYl2bTms2b
	Ov4jpvqyAx4P1h4qytDcxGueh7nV68EStC9jVSrL0d1aZZXaiKq5Mjr6mjVS0TPsDCZ2TJYqqaw
	CLtZP7fyY=
X-Received: by 2002:a05:7300:6c21:b0:307:39c8:b26 with SMTP id 5a478bee46e88-3077b3c145cmr6267329eec.5.1781077866654;
        Wed, 10 Jun 2026 00:51:06 -0700 (PDT)
X-Received: by 2002:a05:7300:6c21:b0:307:39c8:b26 with SMTP id 5a478bee46e88-3077b3c145cmr6267311eec.5.1781077865959;
        Wed, 10 Jun 2026 00:51:05 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074deaab1asm24775311eec.17.2026.06.10.00.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 00:51:05 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: openembedded-core@lists.openembedded.org
Cc: richard.purdie@linuxfoundation.org, cheng.jiang@oss.qualcomm.com,
        quic_chezhou@quicinc.com, shuai.zhang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, jinwang.li@oss.qualcomm.com,
        xiuzhuo.shang@oss.qualcomm.com
Subject: [PATCH v2] bluez5: set L2CAP IMTU for OBEX profile listeners
Date: Wed, 10 Jun 2026 13:21:00 +0530
Message-Id: <20260610075101.1748658-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605030041.232943-1-wei.deng@oss.qualcomm.com>
References: <20260605030041.232943-1-wei.deng@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 1vtsKH0sV01c5idh3cJqmVE_5e5XPww_
X-Authority-Analysis: v=2.4 cv=dLmWXuZb c=1 sm=1 tr=0 ts=6a29176b cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=dOK3wYaXzV_A1W3SHmkA:9 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDA3MSBTYWx0ZWRfXxLnNXB00jBD5
 GtQ9TNGSAvwMvJgZPxcSNuJUBbFH4xcZyE+bL+NE2OJN/2A2Dtnve8C4lxjqCXdik78QcipNBay
 cZBz2oirss06BJzDaKFekyxBrLtM7gqkp7Xc4vJvz+jfuQK9YH3D/rAZp7+u7IEezSCHYUsHab3
 5/TBB644jS3L/q1Vk+jf1q6xTwiU2lf62hk5Gmj1+8Ezb7m0Tt1YNVGmVA4N6YxVssDlSVPpHnG
 ws0GrRracAu9fmcMwo9sab42HksNkTIHDJMS3yFvPv0+pt+Fp1zGFR5zPKvlzHZmR2+RaOUvL1Z
 N6sR5ucTM0wLm+9AhSm+Nkuo2QI7bhC5QJMzUvMy0/Y14al3wc3i28dNJLkVCjarnKjTlVzNlxs
 H1qWiQlpEA1BW/n6d9eLu2SdPgTafDzSrpKs3damz5XZcc8hbWbHQKEd+3UGyf2s4/UQRsvSxiz
 jBfCT80j4d1aFTjLEbg==
X-Proofpoint-ORIG-GUID: 1vtsKH0sV01c5idh3cJqmVE_5e5XPww_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_02,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 adultscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100071
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Jun 2026 07:51:16 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238319

Backport upstream fix that adds an imtu field to default_settings for
OBEX profiles (OPP, FTP, PBAP, MAS, MNS) and applies it to the L2CAP
listening socket via bt_io_set(). Without this, the listening socket
advertises the L2CAP minimum of 672 bytes in L2CAP_CONFIGURATION_RSP,
limiting the peer's outgoing PDU size and degrading Rx throughput.

Upstream-Status: Backport [bluez/bluez@646014a]
Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
---
v2:
- Rebased on current OE-core master.

 meta/recipes-connectivity/bluez5/bluez5.inc   |   1 +
 ...2CAP-IMTU-for-OBEX-profile-listeners.patch | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch

diff --git a/meta/recipes-connectivity/bluez5/bluez5.inc b/meta/recipes-connectivity/bluez5/bluez5.inc
index dfd368ef3f..c19afcaf5b 100644
--- a/meta/recipes-connectivity/bluez5/bluez5.inc
+++ b/meta/recipes-connectivity/bluez5/bluez5.inc
@@ -73,6 +73,7 @@ SRC_URI = "${KERNELORG_MIRROR}/linux/bluetooth/bluez-${PV}.tar.xz \
            file://0001-gatt-client-Fix-use-after-free-caused-by-reentrant-c.patch \
            file://0001-transport-Fix-set-volume-failure-with-invalid-device.patch \
            file://0001-advertising-Fix-sending-extra-bytes-with-MGMT_OP_ADD.patch \
+           file://0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch \
            "
 S = "${UNPACKDIR}/bluez-${PV}"
 
diff --git a/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch b/meta/recipes-connectivity/bluez5/bluez5/0001-profile-Set-L2CAP-IMTU-for-OBEX-profile-listeners.patch
new file mode 100644
index 0000000000..fc1332fb4a
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
+Upstream-Status: Backport [https://github.com/bluez/bluez/commit/646014a6a246fe99df27da12d2de7bcd2e04d0df]
+Signed-off-by: Wei Deng <wei.deng@oss.qualcomm.com>
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


