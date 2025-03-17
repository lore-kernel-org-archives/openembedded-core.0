Return-Path: <niko.mauno@vaisala.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40D1CC35FF3
	for <webhook@archiver.kernel.org>; Mon, 17 Mar 2025 14:00:30 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.115])
 by mx.groups.io with SMTP id smtpd.web11.53256.1742220021152982247
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 07:00:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@vaisala.com header.s=selector1 header.b=z0JH0hmx;
 spf=permerror, err=parse error for token &{10 18 spf3.vaisala.com}: parse error for token &{10 18 _spf-dc57.sapsf.eu}: limit exceeded (domain: vaisala.com, ip: 40.107.104.115, mailfrom: niko.mauno@vaisala.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VfUUltokQrJQerC0MjEd1/vJDAfwr8Lg+J/pyQlQJzNMEuHr9ltiVK1a62YLbGiz9D3BmLKYKg5BOPdzNSxMgkR/E6bhawYD790krUuTlKWZdaEXS+N+g9otdcgHXl41ZvzytfVDuLKmgM+i1eXydYhfrLPPIj/V6wVs1eqNojm1awDreKBdxyLaYy2dYtQJjsyflbJ3mT7nxbGHfabeToPNdfz6xXZmuFKS1hTZU1Sk0Zb2hm6HNwtIEuHBhSHeuQ5699N7C9Wec9aoG0Plpm6nUDNeEca8+A590KF4CU1dDb1+LAcOAvEPkuiwkZpow6GH0alnD3B7xZ2TpMibsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zpSLCgpLWZgoLPm24xiHeTsRGq8ZpiWL5ua/y5Me9J4=;
 b=OrhuuW+620BG8VKwo6N9ByjoMxTLEfr76Yko4+2wQXsn9LwCqSePnEq+5IywcO9bTf644a0G6wqBOHLthR9tSV0QiU81fp2sa9r/MNPM1PcApKpIVpmiEVFAjKO0DhvT/SC8bsp5eCoNc223Ox5Zu7PXvNQ0vVpbWlr1VV1N8ppvFvyiH/DFvNL6YGxS+Jpbrv9yFMhyz7NrsrFxyMT+043PwVRrRRXTaqh6O7eNqIa7/O01Ct7WblofXDGvpX9XbE+EwJGPSI39SytLaw+L/+uOFSzIgpg1axP76uHDmw0OBFWl3xq5g09zkgJvQJUUtNXHLdj35TOxc/CmApgyAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vaisala.com; dmarc=pass action=none header.from=vaisala.com;
 dkim=pass header.d=vaisala.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vaisala.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zpSLCgpLWZgoLPm24xiHeTsRGq8ZpiWL5ua/y5Me9J4=;
 b=z0JH0hmxdXV/4ShOO9g/KPawIyMSkbw+dWNu3Ap3mgVDmTU3Khkl60CALCuuzzb8ENeL+28o0Jcuab1kQ2iLjsKvqKViCS3xV5b8wgiWLitUZT18foTmru2r/e01FYEKb733YZ0qukcDs4gfaYf93voXsSP0MnZDxlZB3a9cOQ/RhFwafpZxDQHU8rGlADKMbRVp9uFrD1oayrmdfL6UlKCL9metxkQG0pPh4JGx6/4qUsbg3ZJG3+JiXCB1gISKgncVn++sfyUAqEwvSSJyBm7QDVC+fgIqaj5W/Fb/ihIAF3dF1YVIXCDMFqyo8jCJ7jCk8HxWOsiwxfNPlpx27w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vaisala.com;
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com (2603:10a6:20b:4e2::11)
 by PA2PR06MB9162.eurprd06.prod.outlook.com (2603:10a6:102:408::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 14:00:18 +0000
Received: from AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc]) by AS4PR06MB8447.eurprd06.prod.outlook.com
 ([fe80::af93:b150:b886:b2bc%5]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 14:00:18 +0000
From: Niko Mauno <niko.mauno@vaisala.com>
To: openembedded-core@lists.openembedded.org
CC: Niko Mauno <niko.mauno@vaisala.com>
Subject: [PATCH 4/4] kbd: Avoid non-ASCII characters in DESCRIPTION
Date: Mon, 17 Mar 2025 14:00:04 +0000
Message-ID: <20250317140004.1808848-4-niko.mauno@vaisala.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250317140004.1808848-1-niko.mauno@vaisala.com>
References: <20250317140004.1808848-1-niko.mauno@vaisala.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: GV3PEPF00007A86.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::618) To AS4PR06MB8447.eurprd06.prod.outlook.com
 (2603:10a6:20b:4e2::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR06MB8447:EE_|PA2PR06MB9162:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a09707a-0cfd-4c65-7ca7-08dd655c0cc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|52116014|376014|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?BvHe+ybCr9WPC6dA4lZgLhluu5ygp4lcxcvwJsRQViMdEmT2q02eKU/ePkWf?=
 =?us-ascii?Q?M2+rVfBEka8P9bswX9EvGPq2C0uTllYhfuaOMVcxU9eOiFaBAD4xqrKh/t9g?=
 =?us-ascii?Q?2WxiIZs9/Si9wfZPXP4ZMQv8xHkRPCqxxUHQZ+lHp+k8q0+e8gRzvmZwbG0G?=
 =?us-ascii?Q?RzKWN2opJJrhBxxTsV3m5E1VwcoR/fT2j9xr/nL4M55n3mxC8BME2f/XuwEv?=
 =?us-ascii?Q?5OEW9UuFu2TKOYKvam25d2FV2Iol/ucEx+5cqtJTepsyKKFztol8465kOacy?=
 =?us-ascii?Q?TjZjVLiBlVq7v+V1R6CnsibyZQOD4MSgi59TZxiDqcGCt6jB0K0m82uG7i3b?=
 =?us-ascii?Q?G+Ewevl1qv+g3EDqVMGKCChPb9jnx7AHjEmKI71kFjr4HVVZGvFhfs9jXL3Z?=
 =?us-ascii?Q?3oOfbWCojJOSV0KAjDYNVRCNAU1cxGAVx++THsKpuWzY0993Vhj+pozwS+Aa?=
 =?us-ascii?Q?nFe7qGebWi58lIYoYXW4AnQ6uOYQTo1RPu5ub5J9C/+iwXYihLd7WOfmHI+Z?=
 =?us-ascii?Q?WW2UA6GHHAlb6wIlqLvInE+NHYxxKHdougHxL1I3P8XWqsTuTjMt0em0voki?=
 =?us-ascii?Q?2QjqSNwzRiqzxNdTMiNwwAIjWRWGlqIySRwqKKtX7I/ZltSjuGEc66Up2gfT?=
 =?us-ascii?Q?482atl49T2WtGdlTyIH+Jx0BYp7vvNa6/N+dMYiGn8YSZ7lZri5TXuITN/7R?=
 =?us-ascii?Q?wuqMZhQ5KGyMaH9ZpCnr78jNgeI4NI8Pkml3cqLkHs+IyzQkaGbikUi7TTl5?=
 =?us-ascii?Q?bElMWynYaFrxK6woFmVgDYxEWvecoEULGmdj2tfTe9g5sV+iA9sB3obnhj4y?=
 =?us-ascii?Q?O1gIAPqiADYgtQRWygUo4G8MTe5mMpxdvGVTB6Uv6WakDg9RBoLCKSy48Gco?=
 =?us-ascii?Q?0zqQcVdsBxfXKKbSg04U1J3yEZ67jLxaMUbUrsyA9fAi7yydn+CTvSziu2J2?=
 =?us-ascii?Q?DUKfV1ZGDo/GTW7PfhHwcOlEXTCwqeXm9OLAJcQ/BpvyvSBivsmDlqSr5HnW?=
 =?us-ascii?Q?gMPgj/vd769uxBworP3i5Jo+XZjv/8djn0dq/QsaxC0b44GEqWhda1wXEljy?=
 =?us-ascii?Q?rXFziEBjwxYETpPoPREQsgTglVp7GByh+k6gh2kOq8IUd+Yz9eSkODwH40yQ?=
 =?us-ascii?Q?Vtnw2h1MSsbILlaI+bXXL+Ao94jQ3pvnrFSJwurmTHfFgH5EXjx9jbGyEg6y?=
 =?us-ascii?Q?KblUdwtTJ4wPvPUGW1Tf/phUyIz9OCA5kOAhji0tu13jgxJnNCE5M5aK3tKR?=
 =?us-ascii?Q?w+SB8WF+q75cp+PXxu8Ggg9racqxLoa5NUlq87OxVxyAZCqQ0Lf6XAxi82Q9?=
 =?us-ascii?Q?6L/DxDsX7rnz2Z6GUT8PSTmMzDFzF3bQhfpNfb1N8VEO/XbA4sqt6I3UJOBo?=
 =?us-ascii?Q?bwZmhRRZSIAJJnI3KN0uXHnihlfB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR06MB8447.eurprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?dTsKkK7+tCNgRksc0qUSN8/dpLJpXFxJU2ynngFO+GBxpLCC+wqSCHKcS7mu?=
 =?us-ascii?Q?R5YfhhlplNiOm5FwPz5WYCaDEvpCJwpnoT6ageAX6twidydDYT+BOkbzD3af?=
 =?us-ascii?Q?KU6YVb/vCYtEUZbxpzEeqZuodos7i36w6mpfo26B4J+NzzVnjQMqR6Zkmfh0?=
 =?us-ascii?Q?GjT+H6Yzr5eRkHojkMdEdPxL72FJD8vR+ku7vgk9g/DgmlgI4npj2t7IWS7U?=
 =?us-ascii?Q?Ulm6DkT0q3XDdP7yuK7PEpQ3KR+4UxNH3/VzbNGPd9vBvutH4NExBpPzUl3A?=
 =?us-ascii?Q?GcmKDUKMUbXG+qXSm9e3JL+0ePMU2o+XTQnTrrJ+syEbMyNsCCm9wjn05Cxb?=
 =?us-ascii?Q?nSZZh5vW01zbcy0CApI/YHAXNnSmoc2/FfIRqfduCOALnrg/kr6hDHnwcqBE?=
 =?us-ascii?Q?W8VMpZPQYbkI+reStr0UxqZDfRde3Fd3vJZdlMJy5pFf+Q/r70EqIlLiiaw8?=
 =?us-ascii?Q?5yBNZgVGAHrtNIBt8F5pEdowXit1MI+BsJOfZw7/oPm6I24qfZo4SkuTvlzh?=
 =?us-ascii?Q?ZzVvSsWvy+cy2eN2Wy7wGB3QxXXDvUXFZKnJGMReRYH1w9oB8Rt5smFi5NoA?=
 =?us-ascii?Q?S3YdljxQdAq6zZakxm4dF7mACJ8RXlJk5L9ZyTRx4Yedcjv0pUqC/ndasGHO?=
 =?us-ascii?Q?Pc/+y8a3Xte3X7o67UWNt0RCWBPvOyfpTWvFqStT0e2cIa/lnxFkd3Yt8C/e?=
 =?us-ascii?Q?K7zWnCbypv87yy72nnM26f0y0dYa/HFY9X5+rQ26ut1QWs+q6+AsnqdDkPj0?=
 =?us-ascii?Q?u/ox+M7zFNUIp/QiypGWvTqrlHPCDCC6NX8lNR+8qCT1g8nNBV4BTCkx9AnI?=
 =?us-ascii?Q?9isRLtMRrunezzDlN5YP7LD23iUSIP9z9vlN5pqIQwTNPQ3Gb9IuCF/LOZoD?=
 =?us-ascii?Q?KMLWIkf4YCGjiCXKYRSgHuYTX+Pc2kNCiEi2xkuZ0vnTURyrtLhuKhjxFe02?=
 =?us-ascii?Q?KCBSdLmwqoHW87Jv4/un1zCPy/oBCuB8sL06MnFwgbZOuRqtpRbjGxyt99+L?=
 =?us-ascii?Q?EJZ/lVskdcscAoT1CYZBJehGENFVOk4oAwpizoVg6dXo3kwrNZL5N3RS/Ovf?=
 =?us-ascii?Q?TOyhpZMRR7wiSnvo4KSWU6+ph93i3jQ5zCEVCLx8Dqd7iOj7APGw69I+T3pg?=
 =?us-ascii?Q?w5nWqj13S7iHJwSr3Xx8PKsMumlyN/5u4xl2FjRFt98pvTO/1NMh9dvdSP9l?=
 =?us-ascii?Q?l3JfeNSVOogxIpIcGEQPm/QmUbShae0nkdhGOw/itJekR9mKxP3KS74/S15t?=
 =?us-ascii?Q?XwV6mxFPYN510bqAoNGeR+dohmgjr3+XI5PTE4DCLk+wm3YKeS9OPEa0YM+f?=
 =?us-ascii?Q?3p23N9qAuM4skBSz8ph0kV5J/otUD/MW3x0OiZEFqzz8rpW2VXP4lo0nT1/d?=
 =?us-ascii?Q?JIacbf1NqaUSC/z0siU6xDdZqRBNsLE1kWkgVQxQTHdQ+acuFTHnBpHiaQLh?=
 =?us-ascii?Q?3ZCnDo4g34jNhbqOQkpOvmC60i7ikLFHD7hk8KivnrG6oPiOxG7n+F3XJkto?=
 =?us-ascii?Q?6c7OywpuTdKXQ+mL5klCbVIlCA4Sys8+P/s5Vm0XWWHU3D5lwfN1HzTUf9g2?=
 =?us-ascii?Q?zgkgZDjjLEXYeyuCPQNXIYENMQirSf4ZW5DNe+Kj0/mrT3Yj20raVB4xrJbN?=
 =?us-ascii?Q?fQ=3D=3D?=
X-OriginatorOrg: vaisala.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a09707a-0cfd-4c65-7ca7-08dd655c0cc9
X-MS-Exchange-CrossTenant-AuthSource: AS4PR06MB8447.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 14:00:18.4624
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6d7393e0-41f5-4c2e-9b12-4c2be5da5c57
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 93iDIoAfUSunenD2wRhY+1ovprahRNoz7hEEUAiNnh/+iGOqnoFosTMMUeKS7ELRiyZeWljC8gxfVxK52UoEIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9162
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 14:00:30 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213103

Replace the UTF8 dash character with ASCII dash in DESCRIPTION
variable.

Signed-off-by: Niko Mauno <niko.mauno@vaisala.com>
---
 meta/recipes-core/kbd/kbd_2.7.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/kbd/kbd_2.7.1.bb b/meta/recipes-core/kbd/kbd=
_2.7.1.bb
index 9cff855b28..9b9066e7b0 100644
--- a/meta/recipes-core/kbd/kbd_2.7.1.bb
+++ b/meta/recipes-core/kbd/kbd_2.7.1.bb
@@ -1,6 +1,6 @@
 SUMMARY =3D "Keytable files and keyboard utilities"
 HOMEPAGE =3D "http://www.kbd-project.org/"
-DESCRIPTION =3D "The kbd project contains tools for managing Linux console=
 (Linux console, virtual terminals, keyboard, etc.) =E2=80=93 mainly, what =
they do is loading console fonts and keyboard maps."
+DESCRIPTION =3D "The kbd project contains tools for managing Linux console=
 (Linux console, virtual terminals, keyboard, etc.) - mainly, what they do =
is loading console fonts and keyboard maps."
=20
 # consolefonts and keymaps contain also some public domain and author noti=
ce licenses
 LICENSE =3D "GPL-2.0-or-later & LGPL-2.0-or-later & GPL-3.0-or-later"
--=20
2.39.5


