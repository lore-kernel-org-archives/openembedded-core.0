Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDC3CCAC5B1
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:51 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.14])
 by mx.groups.io with SMTP id smtpd.web10.47301.1758531651826544688
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:52 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=SGKasbsF;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.70.14, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fy1iHIzMEo36gmOa3olpYtxnbZrTix9gnrU8pI7GUn3vRZPjQCvidoH937XBixu81Na7STT1EEx4azwF5bCUpgghpUCbI4dagfvL7qn5JCcEC4agSyicN1CbporL+qQaj5QDuzOAxheV5VT5V7LcHRVrYR5TOa3QmM0Ds5IAI2J6PaCaquo1kXdFCIztLnOhzqOYTvAd97pfdR5ubMS74V8zZJws9FwaYB+WaT93T1QVSLc3+t0nJqReWTjbQnDJ+m+ItL0MmWmT9ue2kGpPlnM6VM50+cVZotmWImMRiydnBHSdaB8batrtLaDtfkeDCW1Pv3uQ7CWiJvQTTOivfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AFTcbskdfhTh2zHfXbuiZ3JcDnhy5hRk604BBZ1IbIM=;
 b=pWc1sXfAFiT+uazQ9OtI5JHjaMEOXsGf7c/1aVCnx/ynAHwicsUQ+gC2D4gCoOu5IW0olKvhJdtT1Z+0CnbCPefe4KEIgISmchguwU+hgzUGJetEqfWFcbOutbB/sy/CFVvH1Y/wh1cCHSOZEFMub+orHNCEEBe2PYVMrqZrA9pVwdjgX4CMdQsCl2/tKG+HxBcn+8pFesGJV+N1nnQwEv3VpkP38t054Sac2ODtem7+aUSGgEZBEOikL5bj4YiKU+sdERL0cH4zmUC7/IREM3FQnBoj/vGMD2hfW7E6YmSUFSDlLv3gN2RxS3D5t6PhTRg5QNsAqRtsCg8U3knOmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AFTcbskdfhTh2zHfXbuiZ3JcDnhy5hRk604BBZ1IbIM=;
 b=SGKasbsF5O8xbdpfSboKHorf1mtBWVTsDXxVTfyun9caJ3Tfk7lbgSdU5zcntiWsUL7+GFhksoxMCztL8QTzxZZLNY8jdmJuIQuBfpqXHfZfurFZir7Mm0XlpSX9WOAnpkDYNIAxwkdf7Ao2+iit7Z3I25gLhKo40W8PNi3ogm8=
Received: from DUZPR01CA0003.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::15) by AM9PR06MB8083.eurprd06.prod.outlook.com
 (2603:10a6:20b:389::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.19; Mon, 22 Sep
 2025 09:00:47 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::9e) by DUZPR01CA0003.outlook.office365.com
 (2603:10a6:10:3c3::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 09:00:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:47 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 7/8] systemd.bbclass: support user units in postinst and prerm hooks
Date: Mon, 22 Sep 2025 09:00:39 +0000
Message-ID: <20250922090040.2859103-8-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0978 (UTC) FILETIME=[604DD420:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|AM9PR06MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bd71236-5f1c-439c-6f0f-08ddf9b68576
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700013|61400799027|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?z7CHQJZA5V/L1F0y6d07cutaYRPjTknBBpbZhyYf4tY7hzf/P68qqHhAOhs8?=
 =?us-ascii?Q?xvz2JdajJFhNY3VCoUblJI5avXoNs9hlXqhE2S4pnwNSAg2AgP56vSWdeXv5?=
 =?us-ascii?Q?9iXtj4AW9rDntgfbrNHzjS9fttt9qbDVr/86FTLTiezshEkOz4Es7o0KhBHJ?=
 =?us-ascii?Q?OSgfpsl+1hhjGcagoLQReBatRMB3v5k7BLxeUp148zdoIKPor5fVEFbxw2yw?=
 =?us-ascii?Q?c9508iXc9eUiApsKUWT2CmESL1qo1FRIffvMpkTmZndgrCTHx+KuAUjBSbux?=
 =?us-ascii?Q?L5hfBipIE512OSAU34Sx2slhDvjcXdXJ6kYR4OsP/8RkmAIGXdY0ft8Blh4E?=
 =?us-ascii?Q?PnwDcVCnpxgEV6OhMp6ysKieXZ8M1xPA7mN5gE0iqY2GHJHeJ0ZBBuVJEim3?=
 =?us-ascii?Q?kd0UNjwWBCIJhdlIAwR/CvdhUVAC3rRrB1SZusYFRMQyVNQJY16R4+mnCSz8?=
 =?us-ascii?Q?XhMIIpJdHQQ3umGk8cYyb3ng1oWWtKr9RL8dSvjoaoEZKCB1aaet+qu6kJck?=
 =?us-ascii?Q?49HcnAwkO7W4G0BwyhC0nqqGxyH4Gw91IkVr+SbtkgW14ymmQglt0teJkGpZ?=
 =?us-ascii?Q?PnzOU/0opw4/936OaQx80ShGrHZq8UVKNNRILmFa3QI6sZuOtfnv282rTKsD?=
 =?us-ascii?Q?ItSLIhPIb+awc+NBXC00mpzXE2d4A1PKf+zhATxje+PKRGui3PnKDiKf/ci9?=
 =?us-ascii?Q?RtS+vs5c5YX2rpkPYKhMGmFrw3wpqVx0mJvWtpZOHOPc68U3hfYWEYhAiTHN?=
 =?us-ascii?Q?ZXj/1wmbeNK26/koS+kxH7P3nLAUPdHy2iBa+BvgjiiXgYmdi09ar3cvOn9D?=
 =?us-ascii?Q?qexq1xf2YPFNV6UHfAW0xb4No04gECamkNlQKurix16+9N8Lcvivd+89ltdu?=
 =?us-ascii?Q?ZjH2mCPVEulSIK1n1syl9AUEQTqqZrXs+RGg9NpzISGjo38pGsRW9JX40lMY?=
 =?us-ascii?Q?OUcy42Tm2BX1eLY3eMVtxGQJuljoy37MiBnAe9MBKwchaW7ETYwmtOVo3/Cy?=
 =?us-ascii?Q?z3UY1CtJTTC8yaCNDoIpNvzPLQ/hvME+g+xdCIJGkVXDkMN5EsUGyJooqp45?=
 =?us-ascii?Q?18I4+W1u3B+MbWJHJIyCz2U4azyjdRPKe1xojcDjTacGxPMYG9lYxNIyaYGY?=
 =?us-ascii?Q?WyUh9SeE01CwTB1pNDEkhiEvBojcz4YjQ+bEVKHRKEi+jm/DsT1NLxZCLQax?=
 =?us-ascii?Q?jeswVjmVnJxpp4uTFTGigp5Dv1loDkcvVUQFyFcKbjEjPr9h5arxEXIqccG2?=
 =?us-ascii?Q?fcRhz37rKJXk5XRwOpGq3fIPYmIT9Nu0j3YjJxzAi8GpWg7pJ+mcJ+ioh5hJ?=
 =?us-ascii?Q?WKhpyEgQf6vTrWRHXJgrwXk7kSbUV1QkQKjNhqCW3Ut5bTosM3jq9TwrKwuB?=
 =?us-ascii?Q?QaF1CT3TiNMX56ik7QerSz5W23w83vSmIx8v01x50GwKF/hnx19PLgxBe2Jj?=
 =?us-ascii?Q?tPK+n/uUWcund2rCbJ+H6CN5gd4QBjR0dq9/MCrfEDVpn4x+twfEl6TRFEgc?=
 =?us-ascii?Q?UsUpWUzRUmvfzB3dGOBX2Jm/C3cU/AJpFMSTx29ZVnyKBPL0BJEuos75jwBx?=
 =?us-ascii?Q?LWulLNiFUSLmIglOWf8=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700013)(61400799027)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:47.4338
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bd71236-5f1c-439c-6f0f-08ddf9b68576
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR06MB8083
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223854

From: Artur Kowalski <arturkow2000@gmail.com>

Handle user units in a manner similar to system units where possible.
Not everything is supported by systemd, but systemd limitations only
affect runtime package management - during update user services are not
reloaded/restart and each user must re-login or manually restart
services.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ce62b88d8f71368e356b6409ada46a34a6017ddf)
---
 meta/classes-recipe/systemd.bbclass | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index d827ec813c..a9ffc33c45 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -40,14 +40,24 @@ if systemctl >/dev/null 2>/dev/null; then
 		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", =
False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
+
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", =
True, d)}; do
+			systemctl --global ${OPTS} enable "$service"
+		done
 	fi
=20
 	if [ -z "$D" ]; then
+		# Reload only system service manager
+		# --global for daemon-reload is not supported: https://github.com/system=
d/systemd/issues/19284
 		systemctl daemon-reload
 		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)=
}" ] && \
 			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}=
", False, d)}
=20
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}=
" ] && \
+			systemctl --global preset ${@systemd_filter_services("${SYSTEMD_SERVICE=
_ESCAPED}", True, d)}
+
 		if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
+			# --global flag for restart is not supported by systemd (see above)
 			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d=
)}" ] && \
 				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SER=
VICE_ESCAPED}", False, d)}
 		fi
@@ -62,6 +72,10 @@ if systemctl >/dev/null 2>/dev/null; then
 			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
 			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}
 		fi
+
+		# same as above, --global flag is not supported for stop so do disable o=
nly
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", True, d)}=
" ] && \
+			systemctl --global disable ${@systemd_filter_services("${SYSTEMD_SERVIC=
E_ESCAPED}", True, d)}
 	fi
 fi
 }
--=20
2.43.0


