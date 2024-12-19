Return-Path: <tom.hochstein@oss.nxp.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDD7E7718A
	for <webhook@archiver.kernel.org>; Thu, 19 Dec 2024 22:22:07 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (EUR03-DBA-obe.outbound.protection.outlook.com [40.107.104.41])
 by mx.groups.io with SMTP id smtpd.web11.140245.1734646917684260218
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Dec 2024 14:21:59 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=NndXbOAT;
 spf=pass (domain: oss.nxp.com, ip: 40.107.104.41, mailfrom: tom.hochstein@oss.nxp.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9g5MBssnJLdqHpz2tejlrNKisXYpv5n2Ib5rmQH3UULQu58NV2qXcPYs6GV+87rANqO+kdy6gs/RIw/TDLJBtXb7hsRDIKuxsWuyWGErar8Hrd/GLRAFxlLL4Aet9PLUBnkzwsum7YcfmVy/44pb/uGsXbkGZpZjw3FQI56/e/ZhqkSOYzPZPlCi1k2oGKdDv0yy6mJkvOoFlSinZgJTICFB77uVNECAX58dCK3P3Ax/IEGyEe0M2xFKR7B93V3jhwNADlGR5dEqu844mGkdA+0JC0q/IyAHxNaKChsQps36DiXbsEfJdSpMwKE5w4iFWQWcef5kX3pLFykKMZ3cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=YuJiLOxROqDRvN0mkUo2R3f4WBUK0nf6TEHqtAoG//agACSDlBcLp1+xhrdoCFEg/0vziIYvxaR2kbo17vGK4xXyiQdPYIy8DiNxR7COmSt/xdrKo0ZFevHFmm1qINXedrR8BCUClmC7LyyJEoSKfhlcjjM4skjM5dHQTn8IhgRcuSDwflA3snOTkT1DGWg6tQiNNSG6fr+O5UtVbVG3YHhfomcbxefMJu+XZkeuqElWqiOt9LBLRKkyD3Xl78h1rcJJDXNwh5nHdBDvwgA7sbEMRHLcoclX0uvhpkahX8BBW6MfgQJS9xDDpIGoXj0ilh1KpaynraDMczT3mf40jA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2z+f8XLzADN83aWGHcgsvLSqfiI4ga/IaAZHU7+Oorg=;
 b=NndXbOATbt5qy9kAkftRNnvP05WwZFMrPFqsJeJdQ0NKN6JEFREF+qe9b9TToGt7WI0J4n2KFFf8rYZUGK7eqIFi8Ytjt1lPq3xxpdzEDXnYY8yTFLwy1nIUNMTdvk7q6D4UrDhDuCe0hYsdM/1P3xLm1U3z7ljvZYW1YpxjDGqogb5I+tA2lwNr71R42cyYTbisnjFD442/Z9wz3N+NyMve7OwAxM99Vo6f3OD6sbfBGh6eTpapK7xqwAFbJs55owIP9SiHV9W8X5YjY2R7E4kHH1Zm5SJjJZZHsfIzrlkTwpRK3z5kY7yD+AMqyXt01H/WZoL+ZWfxPdqW6qUdEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by GVXPR04MB9759.eurprd04.prod.outlook.com (2603:10a6:150:111::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Thu, 19 Dec
 2024 22:21:56 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 22:21:56 +0000
From: Tom Hochstein <tom.hochstein@oss.nxp.com>
To: openembedded-core@lists.openembedded.org
CC: Tom Hochstein <tom.hochstein@oss.nxp.com>
Subject: [PATCH 3/4] weston: Fix wayland-protocols dependency
Date: Thu, 19 Dec 2024 16:21:19 -0600
Message-ID: <20241219222120.1188742-3-tom.hochstein@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
References: <20241219222120.1188742-1-tom.hochstein@oss.nxp.com>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0066.namprd17.prod.outlook.com
 (2603:10b6:a03:167::43) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|GVXPR04MB9759:EE_
X-MS-Office365-Filtering-Correlation-Id: 02643cab-cd62-46ab-94d6-08dd207b8c2e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?b4n20RMIXpIgwWlp1DXFmS55iEDhopHjb5ZCeQlOfc8caz+sEY6x7Ze5jFDa?=
 =?us-ascii?Q?PRG4GR7iUvFIZIK0yKdi496mWqvd9J8pzPTlw1MOrih7YK1PEEjgnYH0t291?=
 =?us-ascii?Q?JCF6BsW9BFKVaRy2qkAs/7ItN0YFDps51+AwEG+QlfuOXpNHRy1LYzFFtYcb?=
 =?us-ascii?Q?6Lu3pLu0RCnXJTQbwWTTkAWF2XjAxqkDWfXo+/KwHGS9uxXgENN/1UTYeUOD?=
 =?us-ascii?Q?KBS+mwoKeOoLIqwaBhXw70v826A4BKteitSjlK8mEj7rJzEKI5bmlBlagyND?=
 =?us-ascii?Q?dC7aJUrmJLY4KkTKOhXdva9Z3gmm61kW0YaTCmiwG12394nz31fklTPBX+D6?=
 =?us-ascii?Q?STHMR0njCmeUhlTCQ7ziDiriOwRz5qxJsRvbo3wVrzpwKupvwkzX8b4XFx8t?=
 =?us-ascii?Q?1zc92a9ji0tDg4zEn+PUWEsjoDxDMJsppdV2eslYyLOrJCvg29d32HKprueQ?=
 =?us-ascii?Q?nyoAmtKLkCeVqwxcvqf+GTEkEE551A1v2VC7nGX83H02inLiOBLEq7i62HyE?=
 =?us-ascii?Q?Q8/alxyWFIrfV4FGocQ7o11oSueGcD5Uas24ii8T83T2O8KpMgW/FF48u9H8?=
 =?us-ascii?Q?hK+BnPToi23WpB0QWL/4UAuUH6BDOSCDIQi7yedNk4F2Gsr1QWnm8U2S/6aU?=
 =?us-ascii?Q?gH3548MCwebgQ3FijvFxECpRR2DU3uwaXN5sUPNGlP/L+yOw9r90O2oLAoJM?=
 =?us-ascii?Q?0NZ+ajqKxnwEiJU0lktvNpPn3jIH9EIqVBw49H5O7Xonvg57HD3J3LrMv0e/?=
 =?us-ascii?Q?s4fs8nsxLK2o9iHkhzDcKy2SHzp9DNbG3cVJEaRBBUs1o6h8KI5lx+u3C31s?=
 =?us-ascii?Q?ehPevUvvWOhdZXaotTrehfZ/VN0mj8QdscKvvLvcBVtznoG5RVSvAfuZTOag?=
 =?us-ascii?Q?8Jl3A8vSN/4eYnBe8ImzWYxTQsJdK43nEW2wo81rc7YwRx9yni6IC0LjFCY0?=
 =?us-ascii?Q?a5WgDNviDAsTyhwTJqMPg+ftVxlX/dMi5tl2wOT2SLKjDag2taR2aQrXn6rX?=
 =?us-ascii?Q?JCvIuk6Hg7FfU2w3xFiSsr7hXzxGP7byN0VqvT+3oJrQ6mdahLgAXjK/IadY?=
 =?us-ascii?Q?yEJCn1xJ8d7FGqA7aHEQCJVBRtaVtfEk9rEc56O8Hj8vcSkRlVDbveyu3uI5?=
 =?us-ascii?Q?4ZV1x0D+1pND36FWlIsYijKMnoiXnmuMR0squIOp6KE4usVkFi4iOXPz6Ek3?=
 =?us-ascii?Q?aLYmIM7QczGykVmYUjgpvHUapMZoboGqLvV+38Cn7t3QB+jKjzQ9qBVK3jM7?=
 =?us-ascii?Q?gpFsqoIfG1mHLVVTi6qwmHte+NFfoF/jPvYtx6LtUgHTVlBNUmdP6mAg3BOE?=
 =?us-ascii?Q?YI9xazMST7C1r1Orlx2H/l4CKXqimst/KwbBsMpChrG5QmKpsKiQWJGSHqPb?=
 =?us-ascii?Q?EdWKNnkUkGxkrBGnW0z20AprS99pk29mZmAtiIxUvh2W+1+vkKMm/Oxk65iK?=
 =?us-ascii?Q?FsEyINzdRpI1bLQEmxvUySo4bX7WbshF?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9448.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?idT0C+v9DMneuRtFYRvNFG/WlkuvirZl0nImUrp6sy4vKWD/sah1jt58oJBD?=
 =?us-ascii?Q?oaSVp06EP2Xl9EzLZu6WtV/o/LFYV4XV8I0tp+20oNS0HPSvE8Pn/ZFk4Taq?=
 =?us-ascii?Q?9yHVnEOZEL9ddHyeEs0ytjUymhsCqyhUON2JAT12TC0oESW5H3TVYGGZUqsr?=
 =?us-ascii?Q?2oiuLXWRLPtmxdXnKRAYwi/SiWQUMG1o37daAgVz84GAd1O+q07SK6a86Dev?=
 =?us-ascii?Q?rtbU62cAyx6ZuBcJUzGq5id8eOAMcXsrtqhwlObsmGMo/QJmo9WDzLy9s8cN?=
 =?us-ascii?Q?WjoZFKWL0AOa/FKaWO+T2vrjP6k3VK0PpFIPCHscPIdZNPz6k63PG91v497l?=
 =?us-ascii?Q?bj0pM5Mc32/29kaiuc/bfziSnpfpsWc+odEjAhVeMxYjXNVJiGqfstH6q7uu?=
 =?us-ascii?Q?gP/QcgyIWd3pJyubLuAlUurv03YLU2ruQmFd3uxNIHNiE+O1Qxohg6TB5d1/?=
 =?us-ascii?Q?kxe2JrvhVGIQG3+ovRwHOPBsrmAq+zXlLC60OYy4/26xexyb3GXACwq9eHXG?=
 =?us-ascii?Q?Z1YJJKWRHuDL6D7ICsqq0A2oZg7DlZIIK02ZKN+N5maa+AOo+PFWvgV1irub?=
 =?us-ascii?Q?sV39dRQPZIBX8/DGQXKl96BalbTvoDWu+il4rP1PnnhsP9FoiFdxEpgJnxFF?=
 =?us-ascii?Q?yRyIN/b8b6dHPMdpvGdlq4fAjVVMuFO83ii5gj32WE+UcsGG6FLmDIyWxFt2?=
 =?us-ascii?Q?vcO1mW6VuBWVJsKso3+4KOvm+s1r0e1Zp+ZCHFWSHZ+LkAqpQREC29qbu3Y+?=
 =?us-ascii?Q?pafxzoxOSuKnzgSoEXB4XN9+V5wMycSpKJy9bC39rNB4moOre0q03oITwZWf?=
 =?us-ascii?Q?8q0W5iFXEVYxDx0daToMgvlZxdQgoVa2Rz7TvEuQfGGgjmu/6jrIDrvC7ZuZ?=
 =?us-ascii?Q?JUUFY+ByUL35mfQ8hhFg5aXMyYtX4+8llcraTTtJmtP+f4PapDFEyEyP68xC?=
 =?us-ascii?Q?UIp5YgWHcwX6gtNUhVq6g4PFHmbzIvyXTTbhsajz1Nm+fvO+op8iSNuCCSr2?=
 =?us-ascii?Q?4yg7nrRLM8qh5tEKFWZvv0Es7ZhyJZZ3c1Or8FgRM6vgwWYiqcsUM93HWVnm?=
 =?us-ascii?Q?+NW5rmNEr/uudETaaAIl398iLvFBA0qBxjP6PA3iE8vUnvOjzcqWNWlH/syN?=
 =?us-ascii?Q?a9o0yDLSehO48UFSn7Exf4yNNZkreR1LhX8hSHRf9nTmRO3Ls0tmBzmm+etl?=
 =?us-ascii?Q?tFoo5PjEyjf1R4rPCCaD8ueCFOyb4+N02xc1zXG7FhhTdNb153nkk0VwKRTy?=
 =?us-ascii?Q?HtU2RxsGJ9BOpm9IClDDHewgi4xBQr/v3uB119ms59XHbeqKEnK13IuJNR1W?=
 =?us-ascii?Q?vVctbs4p30LmlbYf+R5KaTJnH030YY1a4SyWEMCmG5PfkLeIFocKPqEnStU6?=
 =?us-ascii?Q?CmVCRa+r1fUQKf2La4vcXDh5IrW0Klsm1N32khvbi5sooZZ2r/iOZzVz7iJh?=
 =?us-ascii?Q?D7cA2xZmnGiDRQlqzzAFySTzcJg8pwCJerhgA1qtD4BmuG5cbu3CHYNPUpvy?=
 =?us-ascii?Q?WSOZYgcBxEs/6JlDSnJawBlBcjlimcN76qzXrFXKGl7qzgxYaJ/QOKjCr5ky?=
 =?us-ascii?Q?b6fg3LDXYkT4G9f2ABK0S2KkVpOEcafW0YpdBigjgFErEgNvwKRRu5jTsflc?=
 =?us-ascii?Q?RQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02643cab-cd62-46ab-94d6-08dd207b8c2e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:21:56.4166
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnXXHKA2YDe4RnI+2WekdUDrpuqe4bOOEp5lJq6+3ccRiBdEgFCaq7cwcgaRAW4OLcTPUx09kIAYqXwsFDlFMA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB9759
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Dec 2024 22:22:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/208961

An SDK build of weston fails:
```
Run-time dependency wayland-protocols found: NO (tried pkgconfig and cmake)
```

The file wayland-protocols.pc is missing in the SDK. This is traced to
the upgrade of wayland-protocols to 1.38 [1], which re-enables the dev
package, which moves wayland-protocols.pc to wayland-protocols-dev.

[1] https://github.com/openembedded/openembedded-core/commit/5de187aee675a7=
8fe59620a3fb64a5da5ae662aa

Signed-off-by: Tom Hochstein <tom.hochstein@oss.nxp.com>
---
 meta/recipes-graphics/wayland/weston_14.0.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/wayland/weston_14.0.1.bb b/meta/recipes-=
graphics/wayland/weston_14.0.1.bb
index 50749d7d15..4cb0ca4d5f 100644
--- a/meta/recipes-graphics/wayland/weston_14.0.1.bb
+++ b/meta/recipes-graphics/wayland/weston_14.0.1.bb
@@ -137,7 +137,7 @@ RDEPENDS:${PN}-xwayland +=3D "xwayland"
=20
 RDEPENDS:${PN} +=3D "xkeyboard-config"
 RRECOMMENDS:${PN} =3D "weston-init liberation-fonts"
-RRECOMMENDS:${PN}-dev +=3D "wayland-protocols"
+RDEPENDS:${PN}-dev +=3D "wayland-protocols-dev"
=20
 USERADD_PACKAGES =3D "${PN}"
 GROUPADD_PARAM:${PN} =3D "--system weston-launch"
--=20
2.34.1


