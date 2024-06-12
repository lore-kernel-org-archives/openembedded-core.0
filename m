Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD82C27C78
	for <webhook@archiver.kernel.org>; Wed, 12 Jun 2024 02:39:26 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.67])
 by mx.groups.io with SMTP id smtpd.web10.2113.1718159957306466974
 for <openembedded-core@lists.openembedded.org>;
 Tue, 11 Jun 2024 19:39:17 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@axis.com header.s=selector1 header.b=SqAoKLHb;
 spf=pass (domain: axis.com, ip: 40.107.22.67, mailfrom: peter.kjellerstedt@axis.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sa8kve2LBA3FZYJU/TC8lRrougRD0MM+mGCw91n+/9lZdckoHUEsFPLFqIy3WFeTmRdAh5Wi/8TBwApWz1ZFCHA2Hw8X79z27U+QGePPoWr222XaOZx8SQ8nay3JikGBAUH0GUBI0hTYd/5kIiOd3Fr2rfy+UMJF9vQGfUO/cFx8hBrB0nnrp0PnIGYLe6WLhxvO8kacNQltP4rK/nUB440C1bQBV3LNtHXToyI30h6D8FhaCn2JvjIoM14e0p3Y4LE91Vx8iFWffBluJs1FAeF5gOfbAlphsUuLb2pWqDB8U83J+h81hvGcT8g+xZdt3RF/dReoEt3GCVva2OKoiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uyCfHaax80EKggXn8VH/DeRd4Tjj5FNmZhuS490cpks=;
 b=F3mHnnKEqkzacCib6NYdDCHnzz1X6HZa9WkS1nXXlqn9NJG/U+3CE5t/MkAVqEBx44lqOx3kCIeREgyQigFZosdZC9FhPltyj9+iwrvFOsPD1nuP/HQWZc77iBkw6aymfvDqFDAXn4Z/Q1C4eogjEn11z/n10KRSLvOHcwtac/YREf2nbqei/mp1Am4LHuOXRH8CLtt2nUnyn3kki4oEOCslkuP05C8X0umPQiYjmFF0IRbJ5Cs8z/Iy7TCJDsa1gAr4tndwQHs0nOiNlSgSyfhMN46EnY+a/4u6rmMhq+EAdCTmKYsDSczuBWnm3yI7TbmxF00ykWJnCF8ah1RPZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 195.60.68.100) smtp.rcpttodomain=lists.openembedded.org
 smtp.mailfrom=axis.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=axis.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axis.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uyCfHaax80EKggXn8VH/DeRd4Tjj5FNmZhuS490cpks=;
 b=SqAoKLHbMLO0TwkUJO/yP6tz86R9cKsclrfjGfT25XVTMAgLp5KPyLWdcAGdkPXWo8Exl3uvuaYmxrfd8D4b6TR5DuoWj2C06Wv1IeXSPGsPR7V2xTuPt3qREa80O7D55PQ0w5zeOkAuxC8ObTMQjrTDLilt18kEpVG1UhIBWg4=
Received: from AM9P192CA0002.EURP192.PROD.OUTLOOK.COM (2603:10a6:20b:21d::7)
 by PA6PR02MB10828.eurprd02.prod.outlook.com (2603:10a6:102:3cb::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Wed, 12 Jun
 2024 02:39:10 +0000
Received: from AMS1EPF0000004C.eurprd04.prod.outlook.com
 (2603:10a6:20b:21d:cafe::98) by AM9P192CA0002.outlook.office365.com
 (2603:10a6:20b:21d::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.17 via Frontend
 Transport; Wed, 12 Jun 2024 02:39:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 195.60.68.100)
 smtp.mailfrom=axis.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=axis.com;
Received-SPF: Pass (protection.outlook.com: domain of axis.com designates
 195.60.68.100 as permitted sender) receiver=protection.outlook.com;
 client-ip=195.60.68.100; helo=mail.axis.com; pr=C
Received: from mail.axis.com (195.60.68.100) by
 AMS1EPF0000004C.mail.protection.outlook.com (10.167.16.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7677.15 via Frontend Transport; Wed, 12 Jun 2024 02:39:14 +0000
Received: from SE-MAIL21W.axis.com (10.20.40.16) by se-mail02w.axis.com
 (10.20.40.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 12 Jun
 2024 04:39:13 +0200
Received: from se-mail01w.axis.com (10.20.40.7) by SE-MAIL21W.axis.com
 (10.20.40.16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.6; Wed, 12 Jun
 2024 04:39:13 +0200
Received: from se-intmail01x.se.axis.com (10.0.5.60) by se-mail01w.axis.com
 (10.20.40.7) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 12 Jun 2024 04:39:13 +0200
Received: from saur.se.axis.com (saur.se.axis.com [10.92.3.10])
	by se-intmail01x.se.axis.com (Postfix) with ESMTP id 221B9107
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:39:13 +0200 (CEST)
Received: from saur.se.axis.com (localhost [127.0.0.1])
	by saur.se.axis.com (8.17.1/8.15.2) with ESMTPS id 45C2dCQV1493320
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 04:39:13 +0200
Received: (from pkj@localhost)
	by saur.se.axis.com (8.17.1/8.17.1/Submit) id 45C2dCKu1493319
	for openembedded-core@lists.openembedded.org; Wed, 12 Jun 2024 04:39:12 +0200
From: Peter Kjellerstedt <pkj@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [scarthgap][PATCH 3/3] base-files: profile: fix error sh: 1: unknown operand
Date: Wed, 12 Jun 2024 04:39:09 +0200
Message-ID: <20240612023909.1493286-3-pkj@axis.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240612023909.1493286-1-pkj@axis.com>
References: <20240612023909.1493286-1-pkj@axis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS1EPF0000004C:EE_|PA6PR02MB10828:EE_
X-MS-Office365-Filtering-Correlation-Id: 817ccbbb-917a-43ec-19b4-08dc8a88d957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230032|82310400018|36860700005|376006|1800799016;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?x/TDM1yAdrKEfqjASDDCsBVVZIjiqjqwxtFCkDDVDDK+QmuToDyT8Mlv7eHr?=
 =?us-ascii?Q?Lx2sd+QhMZOsOSP/2Co5L38xquZ5gsDwLU2Otp3mFcFYFNV/QU6bik45dI8n?=
 =?us-ascii?Q?x7gFjhbNJq+wjLnQIDMbJw9JEF2B6hpYZXMLFqieKxLTCEyK7Goke8HTnSZb?=
 =?us-ascii?Q?aysvES422J+TKK57kDQ9SUkI7UCZru8K4IpWMMIQB1KZYNiA/MY+Vi9J2WAi?=
 =?us-ascii?Q?7JJE7xNzmok8pjSj6w4U41y4VHTuF3vAXBPpxXgARwTO+qkD0lI+/6f6h0M/?=
 =?us-ascii?Q?MjY+W4TNQRm1og02pW/YK5yLnoe+dclu/BlaaU9QS57+7K/sIFjvNMS4EIW5?=
 =?us-ascii?Q?Hv3tZoQih00Vv37MhdxjSfleMO8z5TA5r2FzZ1pXXqKlsyw9M+ski5FLKonl?=
 =?us-ascii?Q?ZPUV94XNHYS0ggI9RQ/UX/Kjf1HbSFO76CLVn3zlB9ouX2WdSo2Q5IofKQ2Z?=
 =?us-ascii?Q?MNOZ/eUBBw8ACjHUp6eg3uk9ycOybgSa45z56FRBx48yF6P+Pen0+V6kH+i/?=
 =?us-ascii?Q?AArYAaAH+lotBo8WvzTJWrKPsNYHMCTiYoOG1OzvB7t1uSzzN38GIOQbhmSy?=
 =?us-ascii?Q?LUgNDW35AibubyN8Ux7LK8L2LSDSjRDdNHhfXKqzH2il4sJ37p8IPHT1y736?=
 =?us-ascii?Q?rcgau6ND71wyG37d1Knf0LaLyDvFG3B5ugv0DvW1MBDTpDNsEUWV/ESoP+0Y?=
 =?us-ascii?Q?XZvexuRsoHpPCfm5i5BQqsuuF+dKQEvy9Y7Ud9qqg+EgOAEbeObZnsEmN5tt?=
 =?us-ascii?Q?DQ0v4mmcH7oa9X0eSsvWIaZssCUBJdD7ytPeyOr8hxoBzh9FPWc/YpCPqT1Z?=
 =?us-ascii?Q?rv06KL0lN8EdykZyvMXcK3gj1qoQ1VfpllanyezqqJzA0rhJ8UHfXoC8kFd0?=
 =?us-ascii?Q?CX2o1SV7r/AA6BXou2aAFifzfKjRru8KjQCW/BZ+RqSAmoI444b0UZhSCmO8?=
 =?us-ascii?Q?dR3Ak+GjSuTqH+Pjk47S8loxySuMhtWN4jRU8iCC/asjJBIJUK073mYHZErk?=
 =?us-ascii?Q?pYYQaAkqohmljuYGIVOcT0CY2niFaN1FajN7K5oBKGZAx4aYh2Tg2Bi+0Az0?=
 =?us-ascii?Q?7TxrSf9E4k4k+BA8guB4Gz5gU2WiH2KvOcW56QVWmSjoATd79uRN1fIUT7xo?=
 =?us-ascii?Q?hY8hI8uvv7DwKwoagIB6EMiTz3zu6dXreroL8G1n3HFb3vfrGPqCnUbVljHP?=
 =?us-ascii?Q?gs7MjbnSkJy2l9XEDLOgZVrHxCVv+9I0iSKP1cOjoOZT/9gIyugjbN7AuS0x?=
 =?us-ascii?Q?lYxBWAqWG8+hSEHj76uePtHuGqlCrMTnROkzkmsEyIlYzFPmbBo8IeU/cHFo?=
 =?us-ascii?Q?xN9DcqilQJGxclTsq+nUOKetl2e9rdFoIrhp1rksdfeMtk9IXx7BbWIjMF5F?=
 =?us-ascii?Q?SOrkFiwSj8RBoLtI9npq2d6INTa7Jf5GVVMbELVRZ1Wb3KEx8w=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:195.60.68.100;CTRY:SE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.axis.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230032)(82310400018)(36860700005)(376006)(1800799016);DIR:OUT;SFP:1101;
X-OriginatorOrg: axis.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2024 02:39:14.6004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 817ccbbb-917a-43ec-19b4-08dc8a88d957
X-MS-Exchange-CrossTenant-Id: 78703d3c-b907-432f-b066-88f7af9ca3af
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=78703d3c-b907-432f-b066-88f7af9ca3af;Ip=[195.60.68.100];Helo=[mail.axis.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AMS1EPF0000004C.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA6PR02MB10828
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Jun 2024 02:39:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/200554

From: Felix Nilsson <felixn@axis.com>

Handle errors when SHLVL isn't set.

Signed-off-by: Felix Nilsson <felixn@axis.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5df53fcfe3b70a5312fced3fcc1ba6290f2ee794)
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-core/base-files/base-files/profile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/base-files/base-files/profile b/meta/recipes=
-core/base-files/base-files/profile
index bded3757cc..5e8393c91c 100644
--- a/meta/recipes-core/base-files/base-files/profile
+++ b/meta/recipes-core/base-files/base-files/profile
@@ -58,7 +58,7 @@ resize() {
 	fi
 	# only do this for /dev/tty[A-z] which are typically
 	# serial ports
-	if [ $FIRSTTIMESETUP -eq 1 -a $SHLVL -eq 1 ] ; then
+	if [ $FIRSTTIMESETUP -eq 1 -a ${SHLVL:-1} -eq 1 ] ; then
 		case $(tty 2>/dev/null) in
 			/dev/tty[A-z]*) resize >/dev/null;;
 		esac

