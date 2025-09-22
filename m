Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10A4CAC5AA
	for <webhook@archiver.kernel.org>; Mon, 22 Sep 2025 17:54:51 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.10])
 by mx.groups.io with SMTP id smtpd.web11.47558.1758531650337198188
 for <openembedded-core@lists.openembedded.org>;
 Mon, 22 Sep 2025 02:00:50 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@leica-geosystems.com header.s=selector1 header.b=q4nt0Zmn;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: leica-geosystems.com, ip: 52.101.83.10, mailfrom: jie.gu@leica-geosystems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eOI2ChaQWFgSbM1JQSKX6bDBIJD4EgqAEsxELWAUCQnU4JNcAIqPHBz+a2lEMZ3orAUFJGO2KDDAGubeod20Gdxl4mp88CItsVb9+CUKPdgOER/3sUQ9Fpn1SowuJqY1xQEslUvmQv1Ewctb0Xu8cNoJG3GGhzTitZNqct9IKqTD5UH2PViuunD5wpsllpPlq5MI935wktXjmS1WVBbSuEfZjsAMqi3EAWBsDGSLxeJy5YQ6hqOxw++th+vVf078PQkPqJaqxnGTjFYWyYzV2XHv6CzDiJ2OqglRuwxKRBGXDrsZxkecXylCYgVNZokIMvXFo5tUtMgaDMa5WU2FZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBQ8+3DcU1CNkJas/uZ4vwbFb9c2p0UpqsbPII0YRP4=;
 b=MgejKU/YW2O0ncJ9rFgo3M1rnrrMHPJw7/MKg2fXgFRUxDA0uWnhY2/JN96/7oiBcls3PgFwYKQWq/SvSuIRDa+Pn1xowvqPTqCT01ed6R72TroRHGMU5Ss16TCAAF4T9R9inJakWBh5Xa6JVOPRi8lVCYFzi/DNuWiy6S9CftICLvgG6GFM4mHZFZ5W0MJ6NNxP2AHviZU03RQCWHIu1N/2G+r1ELwg7fJqPicqVuJ34fvS39/MJRQ7bXdru99dinubJ49ey+0XDcw/BxuQkSLua6czasslYWTqvNBPvWHuauzKCww/pfJ87Da3VnThxkTASMTMCJU1ymOgSWktMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBQ8+3DcU1CNkJas/uZ4vwbFb9c2p0UpqsbPII0YRP4=;
 b=q4nt0ZmnkJ36/lw1d78FmLvQGcfHP8O/eeH9g2/+mCRPHL1U1vKLpVVUkCVTreDFOLLZJv2D559lh5YuYsFXqBzsF6NMHkF6TP9rNO1Ck5tugvUYoethyNNtzpFmWpAW5AjnuW5gQ4xktOfJltG9ERoete9lG3om6BbhWhqih6k=
Received: from DUZPR01CA0004.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c3::20) by VI0PR06MB9369.eurprd06.prod.outlook.com
 (2603:10a6:800:23e::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.16; Mon, 22 Sep
 2025 09:00:47 +0000
Received: from DU2PEPF00028D02.eurprd03.prod.outlook.com
 (2603:10a6:10:3c3:cafe::c5) by DUZPR01CA0004.outlook.office365.com
 (2603:10a6:10:3c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.19 via Frontend Transport; Mon,
 22 Sep 2025 09:00:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 193.8.40.99)
 smtp.mailfrom=leica-geosystems.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 DU2PEPF00028D02.mail.protection.outlook.com (10.167.242.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Mon, 22 Sep 2025 09:00:46 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Mon, 22 Sep 2025 11:00:42 +0200
From: jiegu <jie.gu@leica-geosystems.com>
To: openembedded-core@lists.openembedded.org
CC: jie.gu@leica-geosystems.com.cn,
	Artur Kowalski <arturkow2000@gmail.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [scarthgap][PATCH v2 6/8] systemd.bbclass: update postinst and prerm hooks
Date: Mon, 22 Sep 2025 09:00:38 +0000
Message-ID: <20250922090040.2859103-7-jie.gu@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
References: <20250922090040.2859103-1-jie.gu@leica-geosystems.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 22 Sep 2025 09:00:42.0947 (UTC) FILETIME=[60491930:01DC2B9F]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D02:EE_|VI0PR06MB9369:EE_
X-MS-Office365-Filtering-Correlation-Id: 7740bf41-3a3d-4a31-4533-08ddf9b68508
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|61400799027|376014|43062017;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?agJ9+wTBrLP8hDSymZsUuhespomUNy7ThXmV9XhGRdFpSM3rMiMeKnDUVGLH?=
 =?us-ascii?Q?k6Vpr7GqR4p+PdlvBIF7ciEk0YgPhhFbzEgcsccZO+xtg+Nva6vVfBQzO8Bf?=
 =?us-ascii?Q?/58Xl2xn3qVCx+2g/jPYWaM6vh79EE4BWOA2dp4GZXmFUxju4Wevbgcj6Or1?=
 =?us-ascii?Q?qthNJGXndWUnG4ecl4phGPc9DRwBM7PW8fTQD4CiiA200VYVRooyvB8+Ux/Z?=
 =?us-ascii?Q?AgD8Yt6TWSq0TPPu4iG5JZIUrZpo7lRSk3hCe2RJhoCUoE/Xk1Q7WwQ9O0UU?=
 =?us-ascii?Q?DGU0Y1Yl+SAFkII019Lhf7vzGifPqj1Xk7SoWGtlUtkbxoR3QcYpfe4XJKia?=
 =?us-ascii?Q?L7KPMl9i8QI7o9kgrAyo7V2gK1PAKnviQkehRMFzvpCduAQA6kq7aQjTobG6?=
 =?us-ascii?Q?GgXuubpNo86LumCtdhhi0aX5VfpCg7GTDaTV9JUes/AjgSx1mRvLhVlYL9Uv?=
 =?us-ascii?Q?e0eY7Lg6NZf1jdV5NHZLbSZGGODNbiCJYHF59AjnnrWxfmzLcclyYuhsGQBY?=
 =?us-ascii?Q?J0gzzlny0ZD/R9+EzIhK12Y9KclDkpsRTToAmqZeiNSsWDCia/tYiajEZp/L?=
 =?us-ascii?Q?eANPe1gdZSqPeyMYudWv14I/IDLnkTGgslKG4Eyc0mETmh2fME15qJ9xPg1N?=
 =?us-ascii?Q?nscQyEDLrnK8RlTYpgjNj/J6R0jZpBKU8YNuIBviS+tmp/GZ08DTZoiOYT0z?=
 =?us-ascii?Q?23T0YZd3VXjokJBluRQbiQCGgGCdozKcejenp6d6PD752k12Ho5qPdTDfiJ5?=
 =?us-ascii?Q?lRVYj07HBRNkf05XIH5lfvC6+KdHZnql3Zs4DxfYQBCYqhQo0W2B2Bn/yBql?=
 =?us-ascii?Q?CMlCswZ/jrXJAfjccdNvCyr95BTthw0GLDFNW4Vdi3DU+QDuGTWT+HyDsjo0?=
 =?us-ascii?Q?6XBK/6iDsxyyKVM1nwxwoBFDh9Ca81Kk4q7/m+EyQZeyGF6BsEzVFd47LWI3?=
 =?us-ascii?Q?cFcdzwM5lpzKv57jktkg75PmSh1XMe/AebKhRhil/qx0f4PxlXedb4UE5UzE?=
 =?us-ascii?Q?UZKkrf9sx8Xcz+ZmteKoPwnMb+9yUE2D7L/oP+jaIafp3YgiKaBj/X824va1?=
 =?us-ascii?Q?vVkMxk1QSImDjNflqj8ki4bA3GYzn3SbHBjm+bXUxQ1+/3eBDKqJSdxhdLsR?=
 =?us-ascii?Q?JWR2JsyOzQbZG1gl+NFAT9j3vB7UpawFfbAu8cNwDNVUU0Sg7fUZeo57uZ6I?=
 =?us-ascii?Q?y8neiBhBugVcbh7Sixtxr/11V/RnuLAoYImF57vuiaFfN6PKLrPbOady8IUj?=
 =?us-ascii?Q?9zVCHPiftWkXk8e2Btel7KZS0dzgPJH1xHOPf0otG+clhox1YR+7nSfe5y01?=
 =?us-ascii?Q?l+Ld2ZMISXZAhiDdFPzoc99dDwSlxymH1R1gAihNPo5QYoca4Cro5ZYlC/58?=
 =?us-ascii?Q?4IpnTCPW+/OLGqHN/cAAJxSdeuJLLdMKxNm3jfElZ3n4bLvxsRZyVlaHlo+i?=
 =?us-ascii?Q?VvLsiz5Mt5EywTln+XY2iFUC3icDRnJr81AAdspQPiM1cdrV0/dhp83c810+?=
 =?us-ascii?Q?U8NEQ8vU0POC3T0PSefuSh41Eu0taEyI3ol47GGNnG5Y3SgRTpQMu/q9FA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(61400799027)(376014)(43062017);DIR:OUT;SFP:1101;
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2025 09:00:46.7119
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7740bf41-3a3d-4a31-4533-08ddf9b68508
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	DU2PEPF00028D02.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR06MB9369
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 22 Sep 2025 17:54:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223851

From: Artur Kowalski <arturkow2000@gmail.com>

Since SYSTEMD_SERVICE_ESCAPED may contain both system and user services
we need to filter out user services in call to systemctl. Introduce
helper systemd_filter_services() which takes space-separated list of
services and returns services of requested type.

Signed-off-by: Artur Kowalski <arturkow2000@gmail.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit ec548b274d56b2c7a2663b70200df95a49e7452c)
---
 meta/classes-recipe/systemd.bbclass | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/meta/classes-recipe/systemd.bbclass b/meta/classes-recipe/syst=
emd.bbclass
index 3cffe95d04..d827ec813c 100644
--- a/meta/classes-recipe/systemd.bbclass
+++ b/meta/classes-recipe/systemd.bbclass
@@ -37,17 +37,19 @@ if systemctl >/dev/null 2>/dev/null; then
 	fi
=20
 	if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
-		for service in ${SYSTEMD_SERVICE_ESCAPED}; do
+		for service in ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", =
False, d)}; do
 			systemctl ${OPTS} enable "$service"
 		done
 	fi
=20
 	if [ -z "$D" ]; then
 		systemctl daemon-reload
-		systemctl preset ${SYSTEMD_SERVICE_ESCAPED}
+		[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d)=
}" ] && \
+			systemctl preset ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}=
", False, d)}
=20
 		if [ "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
-			systemctl --no-block restart ${SYSTEMD_SERVICE_ESCAPED}
+			[ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False, d=
)}" ] && \
+				systemctl --no-block restart ${@systemd_filter_services("${SYSTEMD_SER=
VICE_ESCAPED}", False, d)}
 		fi
 	fi
 fi
@@ -56,9 +58,10 @@ fi
 systemd_prerm() {
 if systemctl >/dev/null 2>/dev/null; then
 	if [ -z "$D" ]; then
-		systemctl stop ${SYSTEMD_SERVICE_ESCAPED}
-
-		systemctl disable ${SYSTEMD_SERVICE_ESCAPED}
+		if [ -n "${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}", False,=
 d)}" ]; then
+			systemctl stop ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED}",=
 False, d)}
+			systemctl disable ${@systemd_filter_services("${SYSTEMD_SERVICE_ESCAPED=
}", False, d)}
+		fi
 	fi
 fi
 }
@@ -108,6 +111,9 @@ def systemd_service_exists(service, user, d):
=20
     return path !=3D ''
=20
+def systemd_filter_services(services, user, d):
+    return ' '.join(service for service in services.split() if systemd_ser=
vice_exists(service, user, d))
+
 python systemd_populate_packages() {
     import re
     import shlex
--=20
2.43.0


