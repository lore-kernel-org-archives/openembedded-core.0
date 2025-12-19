Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7A92D78771
	for <webhook@archiver.kernel.org>; Fri, 19 Dec 2025 13:18:49 +0000 (UTC)
Received: from AM0PR02CU008.outbound.protection.outlook.com (AM0PR02CU008.outbound.protection.outlook.com [52.101.72.57])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16261.1766149419943981157
 for <openembedded-core@lists.openembedded.org>;
 Fri, 19 Dec 2025 05:03:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@Philips.onmicrosoft.com header.s=selector2-Philips-onmicrosoft-com header.b=nXrBBMrL;
 spf=pass (domain: bbl.ms.philips.com, ip: 52.101.72.57, mailfrom: visgupta@bbl.ms.philips.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VtOKEyANNNC4keR74rOzfYCKkslLbyUyU/n+ZgmToucfd5d4Ql8NEEAXUdNF7S2DCsFG255AFO3QgkzbCGt9m7bgUeBISBEeBmMpwWDR0DjVtlcxpkKRu7Rz4Jl806Nt8qZGYOqUaBnjfho4dSIX0I4d1/2Zb/4oFty3zjDZ/O6DnWYf3bWBWA/MDFJZHatG56RwMdV8Y6KXHnTRiYIThx8kUwbA4DAGxKr0LNi/l/1RtHLgQr/Vz9puPLRKXorbcKfeAKcQwPCGzS73Hffc23DpVAgMsYEqDqUyq0qyzPAMVtN0Y3WsHfpXB/o1UhX2rG2HqfyC2rNE2lae2Qvxug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Plb3INlvqIp6Rg9ROx6cWa4aarJUZC9WUVBXceUCDVM=;
 b=ar1dtLm0Xh0ZOQEd2Zk9gaXxngsSDVXfkVuCS27JSRdHLHsYyjuCBJbAqha+4EvPfZgtvhzWTeWhDJ2jlTI0GC1HY2iO3La/tdepnFXwRGNuXdIhX3zY44wdRxmV9RZWXq88ymndpWKy4AFyWjCu3wIcY1l5w9mgEIAMLgG6KOUkG43gtUAS6UtpVX+Mcc00vD3C4318nNLqy4/Kx3d9/hisfoLuIBxOcGytjlUYgMUuVNxczWm5dk5miLN10ggOH2pqE57Ij0DpN0Tw2qbiidxWDNOs1xDNivzrAJB86Y7mS5nG5oPY6WEltDPWDviqiraRUMfpTfkVVbkdvVLK5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 3.248.88.141) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=bbl.ms.philips.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=bbl.philips.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Philips.onmicrosoft.com; s=selector2-Philips-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Plb3INlvqIp6Rg9ROx6cWa4aarJUZC9WUVBXceUCDVM=;
 b=nXrBBMrLt1zyW+Yc4btkEAQSdBf5/lcO/LmE9WgoFB8qQ+2UG3BtDSlKWLDS0q1grIuFjzfGbQpzuQ8iGRvrTSDnJI6lKQTmSsDzbbyhPpOtGKw7Q4uvnZAF1WpdKvqzKYO7dsPjlPSoqNpvqb0hPdT6vd5XlFTK4ym3wWbn7u0=
Received: from PA7P264CA0014.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:2d3::20)
 by AS5P122MB0309.EURP122.PROD.OUTLOOK.COM (2603:10a6:20b:68b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 12:49:29 +0000
Received: from AM4PEPF00025F98.EURPRD83.prod.outlook.com
 (2603:10a6:102:2d3:cafe::d6) by PA7P264CA0014.outlook.office365.com
 (2603:10a6:102:2d3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 12:49:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 3.248.88.141)
 smtp.mailfrom=bbl.ms.philips.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=bbl.philips.com;
Received-SPF: Pass (protection.outlook.com: domain of bbl.ms.philips.com
 designates 3.248.88.141 as permitted sender) receiver=protection.outlook.com;
 client-ip=3.248.88.141; helo=ext-eur1.smtp.philips.com; pr=C
Received: from ext-eur1.smtp.philips.com (3.248.88.141) by
 AM4PEPF00025F98.mail.protection.outlook.com (10.167.16.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Fri, 19 Dec 2025 12:49:28 +0000
Received: from smtprelay-eur1.philips.com ([130.138.84.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 256/256 bits)
	(Client did not present a certificate)
	by ext-eur1.smtp.philips.com with ESMTPS
	id WTmvvMaSLtKtZWZvEvD0ZU; Fri, 19 Dec 2025 13:49:28 +0100
Received: from mail.bbl.ms.philips.com ([130.143.87.230])
	by smtprelay-eur1.philips.com with ESMTP
	id WZvEvdVdOIHN7WZvEvunqP; Fri, 19 Dec 2025 13:49:28 +0100
X-CLAM-Verdict: legit
X-CLAM-Score: ??
X-CLAM-Description: ??
Received: from bbl2xvg1.bbl.ms.philips.com (bbl2xvg1.bbl.ms.philips.com [130.143.220.100])
	by mail.bbl.ms.philips.com (Postfix) with ESMTP id 262581847A7
	for <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:49:28 +0100 (CET)
Received: by bbl2xvg1.bbl.ms.philips.com (Postfix, from userid 2884)
	id 20DD6FE022B; Fri, 19 Dec 2025 13:49:28 +0100 (CET)
From: Vishal Gupta <vishal.gupta_1@bbl.philips.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/1] wpa-supplicant: fix sed expression
Date: Fri, 19 Dec 2025 13:49:28 +0100
Message-ID: <20251219124928.1474117-1-vishal.gupta_1@bbl.philips.com>
X-Mailer: git-send-email 2.43.0
Reply-To: Vishal Gupta <vishal.gupta_1@philips.com>
MIME-Version: 1.0
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM4PEPF00025F98:EE_|AS5P122MB0309:EE_
X-MS-Office365-Filtering-Correlation-Id: 7640ab4a-f285-4df6-00ac-08de3efd0c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|61400799027|376014|36860700013|48200799018|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9HhsxNkok15Wq/bdtgoxNPflE4cDkc7JLwCaBJstHw20Fa7bSKtCz8i6WW5q?=
 =?us-ascii?Q?7uipGhj1P7EbPc7Z7E4XTZssg2zuMVcFsPcRknzu94qI/2yFyvOpcnlJ6uez?=
 =?us-ascii?Q?9twSwWEUIL9Mcdq417WVT3/pLBzBym8T7e8f/2aSS/CdWvpeDCQT0ioLHMN/?=
 =?us-ascii?Q?o9TbRS46xdBKAMn4WrBGy3xYZOlcSKd3EdODeZBXawcEJTIwExOTIie5KuNd?=
 =?us-ascii?Q?qQbkWV/AWjb6mxjB+NN4yP+YfyCaQDL7/FmXVowJTqQeYC1FDQN6eHvYs9w+?=
 =?us-ascii?Q?ZN/7bPbEuP9GeoUwG1SSkUaz9apvDlN4Jf3M6dGL9xvV+GUlmRkWme3nOoS2?=
 =?us-ascii?Q?i6LwWby04NwPpyDxyRUSTaVHgIf2FMGHpGRsJlChs5m77MiuZXjNb7OThrBt?=
 =?us-ascii?Q?QOTrwklCYh2cG6gEE7iuzfSiSpPnhYtomfb4tBapZ5f6VPw85YS0KYuRM++1?=
 =?us-ascii?Q?OEgCIlDbsYqACJ2xyj08xNBjt4VxaxZ/eCqMt5E4KAiABfQUkeKXTazMtEiQ?=
 =?us-ascii?Q?1aus2jgFviDmMbYZQaqBAJJPFPPI3LCaD2DIASYJBvaNvgWxnEvieHpq+y41?=
 =?us-ascii?Q?J944pN6LEsV75rkaWJu5c98lKjHvRjGkAyRnDqQ3COX15LgHyyBPyREGhPe5?=
 =?us-ascii?Q?9CFHnt80p2TMi1sbNBuPY4Z4YORP/Lw0ihwgvhcz9W1Evfld6wiVWBFRH0sc?=
 =?us-ascii?Q?FLbY0l+7ulrESBtAwhjFRBykICTtyBOV4vlJXwh7yY2slyLXnCyF9OG7Vc9+?=
 =?us-ascii?Q?VyOCoCDQp1AFw8tnshTDIXythSSzmX/iKiqgcCrqiQ91OnAu5q+OJYEDYgJP?=
 =?us-ascii?Q?Wrmp35ZkSKwlSl45LQqMCetmf2D8d4P4XDffdeVnfM+ncu0/izO3k5UlJhLh?=
 =?us-ascii?Q?JKSNaWsNcXF8C3Z02Bz2ApE4m4hV/EjHnnOLo7ZAhc/LnCgzaCWrK3C8m5t/?=
 =?us-ascii?Q?st86FtAcHL8GMPeK2JL1FRs/YnB51sd76DtBOAQzL4xq0JFGQKNGHMPqcDri?=
 =?us-ascii?Q?dh//EX71lhZx3jLqM83fCqE3jKZSvsMb1ILXlp3enJvNGOI1IRXopfHSDSj/?=
 =?us-ascii?Q?i/hoW8a41FaPYVrRNAAa+rNQRfvx3A2MgdTO7Y9x/6DhIe2/0Hc18KXpPwlJ?=
 =?us-ascii?Q?2a+5DnAczaAF1/yWptiAphbkXDNrbKqScSgI/Ge6N6keHYjxH/ZIu7aJfj2i?=
 =?us-ascii?Q?1eA6SwAOnFot/XtjzpklqAqkGuv8gXATPFVkSHuNveyHEZSadkO06uXKAPSJ?=
 =?us-ascii?Q?dWxTlxoR+WYY3A/etjLsfTprvZHf0Hlp3R2W9VwnS3ubQwKAsOL2XudAsntE?=
 =?us-ascii?Q?kdk7F9Xi3lNUSXLR940p4oi//TWM4elHNknyo7aNZH/WJ9M3r1tETUJZulEG?=
 =?us-ascii?Q?YH9qMqSdcxO19Se70bLAtd/ylOpzzgiRnBlwAr9dAQZum4it07g/qnl7HOGt?=
 =?us-ascii?Q?fkqjRN1OCe5on7IDmONnaL6l3EgrzPNjlUjBbRC2eURK/E04bNxUEM5WgYll?=
 =?us-ascii?Q?ULoQliEonMzNRyKKC/EIwmg0h4BtZGI8ZRhKrXpQIs8BQ7Qbi3DOyt6n/mLa?=
 =?us-ascii?Q?/iov+wknrWFYGRLnjpo=3D?=
X-Forefront-Antispam-Report: 
	CIP:3.248.88.141;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ext-eur1.smtp.philips.com;PTR:ext-eur1.smtp.philips.com;CAT:NONE;SFS:(13230040)(61400799027)(376014)(36860700013)(48200799018)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: ms.philips.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 12:49:28.4167
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7640ab4a-f285-4df6-00ac-08de3efd0c28
X-MS-Exchange-CrossTenant-Id: 1a407a2d-7675-4d17-8692-b3ac285306e4
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1a407a2d-7675-4d17-8692-b3ac285306e4;Ip=[3.248.88.141];Helo=[ext-eur1.smtp.philips.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM4PEPF00025F98.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS5P122MB0309
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 19 Dec 2025 13:18:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228230

From: Vishal Gupta <vishal.gupta_1@philips.com>

The current expression does not remove CONFIG_TLS
because the line begins with '#'. Updated the
expression to make the leading '#' optional so
that CONFIG_TLS is deleted whether or not the
line starts with '#'.

Signed-off-by: Vishal Gupta <vishal.gupta_1@philips.com>
---
 meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.b=
b b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
index 6ba10a8ca9..e2a522dd85 100644
--- a/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
+++ b/meta/recipes-connectivity/wpa-supplicant/wpa-supplicant_2.11.bb
@@ -37,7 +37,7 @@ EXTRA_OEMAKE =3D "'LIBDIR=3D${libdir}' 'INCDIR=3D${includ=
edir}' 'BINDIR=3D${sbindir}'"
=20
 do_configure () {
 	${MAKE} -C wpa_supplicant clean
-	sed -e '/^CONFIG_TLS=3D/d' <wpa_supplicant/defconfig >wpa_supplicant/.con=
fig
+	sed -e '/^#\?CONFIG_TLS=3D/d' <wpa_supplicant/defconfig >wpa_supplicant/.=
config
=20
 	if ${@ bb.utils.contains('PACKAGECONFIG', 'openssl', 'true', 'false', d) =
}; then
 		echo 'CONFIG_TLS=3Dopenssl' >>wpa_supplicant/.config
--=20
2.43.0


