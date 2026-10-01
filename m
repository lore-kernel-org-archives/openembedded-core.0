Return-Path: <benhur.tessele@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0860CA5FCB
	for <webhook@archiver.kernel.org>; Thu,  1 Oct 2026 12:57:19 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.35])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10617.1790859432453883189
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Oct 2026 05:57:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=WPUwP5C7;
 spf=pass (domain: est.tech, ip: 40.107.162.35, mailfrom: benhur.tessele@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vlu6IszsDuGxkmFEOCoZWVVu7yti9t6Hea9zWIMlkpDTZInvPqkITW3dR2MDtGmfDKAKPqIPNC35Da5LcE/2hnXec/TDDN31XArOQu7UlKpIQ6PfzbTg9THsVH6opHYtcENAI5QIkAp1WzBJWsEeXe5QDhjM80twe2zJNSl/bgPDlKRKRSJiQ/n4aquLq5Gu+hVRpyiDLvP3bF0wPprehq9AysmcCfCliEfPdBvFwmEfBUQQmFekNp8LJm7xF/pjAz3Lf+9EaEw/L5YTNKiCiNma4kcnMVeIrYr5erRHRZ4HSZABVbhGuGdhJtD/ytycCW3RnF4fTlAIu37dbji74A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BnAROK30OstL2ycAFB6lHj82g4ocrhxXNMVfZZ/pt+g=;
 b=Y1Qkg9B/FXXeF11OlwAV8nS6MGy/iPOEsDqeElhF0VeZ2HV8TIU1Mw9mvWEeEpgZHvgZuXSq1e2MUKoIqHj1OjIJBhuXe9yHW16yeGFXr2Sc2qhMLFJXN8D/cIX8Y/UUMImUv7G2soXPSkCRQeDQaSJLOTPQvd1O54noJi+ijWo/PFampe1ftJhwCfITta7grC8N8jwli6MdOLsdwQGLrTVH6cCZNXawE6xl9a3i0W9ulCLqRLdvZvF0GqN2ElbWQn3DuVjajgpPeWdFR5fDQgXF/VUtmqnagFg34HVERNC4XzBRw9xkOdtr0K824o2ch5Zp1+/hqDQX0P0fbMGs0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BnAROK30OstL2ycAFB6lHj82g4ocrhxXNMVfZZ/pt+g=;
 b=WPUwP5C72LbXQiSvGKNrCS8b6rwmUQEly9/WXB0scwO5XwEXZmkW1TyhbvhSFBBEulYE238j0MRlp55e+P9CYMpYcox2D4/FDdofDcC63ZBz6zuXOBZIN5VhSZwl3oBwhZnlSRpLjCh9ZtmbUhbTrIH5Z9UWBrizdKnSMyNPzyPMb/fnplVsJo0YtQshVbKnsApSFbasrVAqwEhHKDIlmBg/h4boblaax9FTlX+p+OBH+n4m7NAmhXc8oMnXjJpudZMfkCvf2ZtrPThuZ1h27ixGnh7X/TJ9+6jdVGRzqmVe7GW7d6e7SYqNAO+UtmFCbeaM5wQaPDXhIUAw+YZFpw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:35a::16)
 by GV4P189MB3559.EURP189.PROD.OUTLOOK.COM (2603:10a6:150:2bb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.18; Thu, 1 Oct
 2026 12:57:08 +0000
Received: from PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f]) by PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 ([fe80::5da2:7509:7be5:d74f%6]) with mapi id 15.21.0472.016; Thu, 1 Oct 2026
 12:57:08 +0000
From: Benhur Tessele <benhur.tessele@est.tech>
To: openembedded-core@lists.openembedded.org
CC: Randy MacLeod <Randy.MacLeod@windriver.com>,
	Benhur Tessele <benhur.tessele@est.tech>
Subject: [PATCH 2/2] packagegroup-rust-cross-canadian: add rust-analyzer to the SDK
Date: Thu,  1 Oct 2026 14:56:30 +0200
Message-ID: <20261001125630.760962-3-benhur.tessele@est.tech>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261001125630.760962-1-benhur.tessele@est.tech>
References: <20261001125630.760962-1-benhur.tessele@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::13) To PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:35a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAWP189MB2572:EE_|GV4P189MB3559:EE_
X-MS-Office365-Filtering-Correlation-Id: 49b7b24c-cb31-4df5-d314-08df1fbb806f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10067099003|56012099006|6133799003|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 
	DUPXF7GbI8HFxfePvb69x8ZPNmuQbKbp7wr8/oVz7j6ZCT2dTO+jIvzBBGuwwBOQsWy3K+0BW6/2gkafm3LKDE4qROPI8kVZQiAw/01H+0DiNpa32n1yb4PEDa9ic3PMpCIy3+13yZZBXzxuw9BiJL9eI10EpSkd7XLqmFH0HP1xwZYuoJG6zphQs8FveBnSFJ/3GOX+kMyF1inj1GOraX0DDox5Az/RZx1OagJ4FcoWTVSFDMXDeNGquTJAWofy0B8asanR7NOAdXWAhGgGimCYvyyDA31nA5Dva1lYbEB3OhIVDI5gUBwI2vpS8PwIMXovgBPYP9zhb8pVebCUS065mhJB4WsxoAer16VpLmI1jjKfdNBT8fuSSHwj5VdK0l4cr4tBUwFrIfP3AvWnvxEVauJD7UqaxJeGj3wTAosieo7NZBU1n+R961C2nl9DOtvxwPJHXjFqKtJrtlgr9WSY/5Jsu7XmR04KRNMSi9e/NPNlkvXhD9ic3mivv/px4XIRBhDIPkKx/cGvoAK0s7+IZ2i83whSklKFJltDGAJvp9Pa9gpUI0/ZDUMlfb8BOrShgE0FQnmdk8HHhOzE0g6XALA+SJQuSXicfhL+DyHfnKo5dtxLehDe4WgwM+2ayvmh1jgOOk1VZpiryfsGkgU08s0xE/nFIFi610eHvj8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAWP189MB2572.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10067099003)(56012099006)(6133799003)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?IgXVzRTGQ1nLNwBbXKZTfQngOGxHkzeSUyjIAf33D3e5CV2jgjQicXnMMwjy?=
 =?us-ascii?Q?oFmspW9zr8ct2JV5vtfWM/NQuGv4133VkkwL2ZNDY4UX4DyCiWc0fpc2s7lu?=
 =?us-ascii?Q?hXrMwtsZH4DPHc+8irRrpkHN77zUD0IDVMIdAvAHa8YaW+XhgMPmJZFhdDXU?=
 =?us-ascii?Q?xICatzzcvPBJOnfSLreyRdUVxW3hz1LoAj4LVfPIBWPgr99oLZdKPHwfG0Yi?=
 =?us-ascii?Q?zSQFIIgyHJ7xSPEWu6+Np6IrqY9kFijQeX9eLZjYmPVaD7QmafVs2j23G5hq?=
 =?us-ascii?Q?ra/oC8hZwGYGVVWkE/oxTbTPMgUeftni4+23PATEks+wV2a0EWJ7h+agoN/F?=
 =?us-ascii?Q?WxMIv7I+mNZJK2hrczm4ABPoj8JH5xKhigKirzMZWj/+NqByhO/QzfjM55Fc?=
 =?us-ascii?Q?w42EZlLM+BJCKCcL+lkskCo0pOa72VqXvB10ywXDj9VY0/py71J6scnjeT1Q?=
 =?us-ascii?Q?Xnvc3etdobOxFz0JnEpoGsxcPGWaLVbwB+M1MI5DYkxhn78iW37MTc9sDhUn?=
 =?us-ascii?Q?HwQkNKTcQXBq+hCU0SrbQL9NVEsAQX5aaSeVejY8XOmkOH9Jj7q+9tWPfTtk?=
 =?us-ascii?Q?Eu5AwswczWsdlKU3XynDX5Mx2hgvhz2ofvjBkPCidAT4qHFC1hXrezAt6kuL?=
 =?us-ascii?Q?fs7izx4LHIlb9ZfoGHdU3F3A9lQXwVzJLlatW5Kc1QBOMaPXcjyxTKuh0aV/?=
 =?us-ascii?Q?9HHJ6+PDTNhckBtUQQe7eJTtxUwTMX7mX1bo3/lewhlvrYCuUe4tMqOAc0ja?=
 =?us-ascii?Q?NZgpli9fXrR6jGmbzB0q9faYQi73mUDJauAd7IxFY7sj7grEhSR38cuwaDur?=
 =?us-ascii?Q?z/jJGSqyyieLUY6FnztH20DaEl5IKFA8erB2gBxEH6m6WHHbR7i07OK7DB8d?=
 =?us-ascii?Q?DRgmJ4fxp2T4WqmCEXmfqu6+R1FS+aDcT2LBokxtVMpnA1nkOx73MJ8QQ8hM?=
 =?us-ascii?Q?vujUQhk8hzLXEWcvgT4p69mNttMmHLjjBgwgFAVGJwz9HiiO3LcV40bjCKO7?=
 =?us-ascii?Q?8rdWe2EuceIfhv1wPPD6VWAN6jQ7v27bdaJY0H9tunMf7uLlJV/MtbKTHSFI?=
 =?us-ascii?Q?Gb3PDCsG5g4hDteDOYzK7ny9JrMIvYDSZ/lXqDVtBspeUrFddDnVF0tGXGOj?=
 =?us-ascii?Q?2qGYHASjV7TbZs61n8SqhJtE7+u4g1BQLmuuacmvypgk8DGzVKtaUXP7lqKe?=
 =?us-ascii?Q?iDvwbrkJ9zEdNKLaHlHDjFnljak3mb7FJ8VtLuV9sZhksyuBuErSlG+ctPfi?=
 =?us-ascii?Q?brP65+5wXZh/FOgro/YE8gjH2zT1qEm0k5yap0xTJrS0+5uU37sO2rQtEuaw?=
 =?us-ascii?Q?4ZNvlyJAuCcNH/W0S9ApW+OjQ5AAqk97UpOxiwhCfI8BroDBKdQfJEBsEaN9?=
 =?us-ascii?Q?UpH1pOzesU9xHQgpaIr9MeZJZaglEcQEufq1sKOoou0wFpN6Nuo16iYbcuva?=
 =?us-ascii?Q?4QAK9QX5oAOxc1eyVcto4ekqcZojkCDMF8bDHov5apQVgTAvi+hjvLp5ass9?=
 =?us-ascii?Q?UwGdKBJ0mlxj7OX4Nfpe7g2cZgt329FIHgn2mP1Kz3fqvyucrdHaQd3F84Fh?=
 =?us-ascii?Q?999d13yCCOJ0U8M0lfW29Fn0wjCDswmF2sbzF+lW2iLQna7l9edGOdkZ+RLq?=
 =?us-ascii?Q?eGL8jWwSUOX9zMNgcEpiMJs4hztWfpcHSa9ZqaqEJnaZxmNZixG/ele6KfId?=
 =?us-ascii?Q?ckW8W3XzNK+TBr4jH4OOy5mp+7EB09Sn4laTEaHZBaVwwlXSTAMSBcHQ/fvQ?=
 =?us-ascii?Q?34jZJs52QQ=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 49b7b24c-cb31-4df5-d314-08df1fbb806f
X-MS-Exchange-CrossTenant-AuthSource: PAWP189MB2572.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 12:57:08.4640
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XsD8DTK0gumSQVew2K7pcxahZd8aGIEjLXVaqxvApRCQzFlnVkJMyfEy/pH656qbCNBX60dCTiiWYoBUNJ+qEA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4P189MB3559
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Oct 2026 12:57:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247034

The Rust cross-canadian toolchain already ships clippy and rustfmt as
host tools. Now that rust-analyzer is packaged, add
nativesdk-rust-tools-analyzer so an SDK built with SDK_FEATURES =3D "rust"
provides rust-analyzer as well.

The standard library sources it needs are pulled in automatically via the
package's RDEPENDS on nativesdk-rust-src-lib.

Signed-off-by: Benhur Tessele <benhur.tessele@est.tech>
---
 .../packagegroups/packagegroup-rust-cross-canadian.bb            | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadi=
an.bb b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
index c73c8d3333..54b39189b4 100644
--- a/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-rust-cross-canadian.bb
@@ -17,5 +17,6 @@ RDEPENDS:${PN} =3D " \
     nativesdk-cargo \
     nativesdk-rust-tools-clippy \
     nativesdk-rust-tools-rustfmt \
+    nativesdk-rust-tools-analyzer \
 "
=20
--=20
2.43.0


