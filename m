Return-Path: <jaipaul.cheernam@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73DADCA6004
	for <webhook@archiver.kernel.org>; Wed,  7 Oct 2026 05:58:35 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2034.1791352706928220788
 for <openembedded-core@lists.openembedded.org>;
 Tue, 06 Oct 2026 22:58:28 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=rbM7S/yo;
 spf=pass (domain: est.tech, ip: 52.101.83.50, mailfrom: jaipaul.cheernam@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DP6Hhil1+w/+8lHBIsJWERQ4CBZMJ0Kqds2FRDdXFMyFHcfIDaUkk9f9bsU7SuTi5e8gM4iXUxrNsSO0sivT8ecYMXUtBCXAsRfTBjj7O0nh+G/3ImPLkPGWotPE59oNGlZOamY7tGdr8gYGuW7P/MzTRWj4afzcgkyH1OFsrpKlLdARsalN52ISJ+SVpdYdxHpFBrkwvQbEPXgpmeqjGcaMVoCvxWkB1fr0OXiks7rpCQExs14f+r55OLTjzIpUt5baZWzSk2Sv763Y3gwU+OUGMgxmWMN+iPyUMob8tzX1E6j44uTy9eJJsr8a8eNtJS8tv6Dpnx5rVFo4nid5eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EST0aH9tOntFSjzSeuCNF0CLKzn3gB/mkVGoFUTD3vE=;
 b=UyX4gAiaWE2h26sLpjyGMpwVw8Gx7kT634o/qpxUbLbEvKgCjPAsCgu4nPHkQuq5cSIspmfPLB+7vbqKgFRuLPiINtKGhBePkzzMd85+1uCd8oxQRn5En/jlmsCo/8O90vkBOZP5bJZYVRLFvN33yWQGMphY+p8MBY+GCA6oLelPUKFm+k4ABhTsDSX4zqpHmm16r9HhVFKwtg3hfGZpNiJy7R7Ib+Jtniw2aEjNeIjHYzH2MaJOhBhgybVctS//zioCtwz+FQB9JbrGAzAJ6FJmoI7+hb2lcuWVjmN0T3qPpugyzoH2Wf5JGn+jhf6vkzmvekSUmK70YMKLrEmYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EST0aH9tOntFSjzSeuCNF0CLKzn3gB/mkVGoFUTD3vE=;
 b=rbM7S/yojvpX8+7+uB77bbyd5ooYrW0L+5HGxx7+OumxqCgLSCk2DohGXxV+ipzTns+IHxLc49Lsu28ghwt82wHtPal1gOJ/hQujQdpHF5MWY3Jmzl/Ypi8kePr8/dWLM8oFTvs28tU3d+Dg4hLgEXMm3S/5v7rCJXHBBCqJrs6lW30+LuTfdDR3GI1QNdUN3QmyolPET2zR73cokhsNS5VGOJSbd6s1IXN1yw+Nm9sXp1xRcD+ypET60aqsUXO1dlLmgacNMd1Z5Sv9Uf29bh45gu2sQQhu9oZEyE735VfbzLHWdgUxcN2l6W+g6X+69wHa1gWmmF0jsY3DYwFtlA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:6c0::19)
 by AM8P189MB1316.EURP189.PROD.OUTLOOK.COM (2603:10a6:20b:246::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Wed, 7 Oct
 2026 05:58:23 +0000
Received: from AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb]) by AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 ([fe80::bc97:3847:8f02:acb%6]) with mapi id 15.21.0496.010; Wed, 7 Oct 2026
 05:58:23 +0000
From: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/6] harfbuzz: upgrade 14.5.1 -> 14.6.0
Date: Wed,  7 Oct 2026 07:58:16 +0200
Message-ID: <20261007055820.59633-2-jaipaul.cheernam@est.tech>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
References: <20261007055820.59633-1-jaipaul.cheernam@est.tech>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DUZPR01CA0049.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::9) To AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:20b:6c0::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6P189MB3107:EE_|AM8P189MB1316:EE_
X-MS-Office365-Filtering-Correlation-Id: 350f03a5-ba44-42bf-42cb-08df2437ff3a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|56012099006|11063799006|18002099003|10067099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info: 
	YpUlatVuSP04EkhTbNeCPMXYjFVfX4tzpZSEFZ2fl0pDg0oH+VLAeDf4WgQShy2t/fPCj7MgtOCliNRxRuB/d7S+IL4YvfLe/gHrIqTNAHQJoMJfRunLkD2Ic7AoxjA/D/U0epEy1VGD7I4zEWHjV9Clc7TcK5T1lSS4glNgEAIXtZloXBNx3+uWaWyhx05ze6h1qf6X+RXCd8QFzjsBi0tlRgbbkZl4xdcIMso7DJ2EraQB1gZ4FSvXEwbFyr1qs7me0902cjZF6r+ptvTvlgEZpGcA0h+8nkkYieZ2l+2RLUqdoCvo5HIbzF+OPHg8qNFcL8AhdwOi9XzLYc07LTdBIgc9v9tIFzwJqIbMNXy2A/JDe5ENIMSCledHv4K8NB31sf/nZI8KTlpZ3x+kLTzAVf19hDx9JVp6BchIvocba0ceIY+ajkFkjfLqBDCRvT/DEe6k58UK6iZ62CFu0zvgVRyqQ9jwhbopkBmVrthk/bzRAsQz351MogaBc6S0pjr0oPfNEVZEKCxYMr7rvT58jjxJmaxqfVGjB1ZQoz7vUXBwdQMATLxktOfvS+BGcEN1OyVOtOc1/iW5rIlvXdTlqjljJ153TxEu7OipzN01OlkGn/Ey1IgMgLzcE2J/tkDq/scIcBMAQIvL4T+1kdqdhjASoNX5GOKa3ZjlgXw=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6P189MB3107.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(56012099006)(11063799006)(18002099003)(10067099003)(22082099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?PByVAKlP01bovvu95R/trrr8vYxagd3td0DbBmxvupeZNtmswgGkRmhVn0jh?=
 =?us-ascii?Q?NJL4quT9MBV6/NQSShAHNV/PWWY7EZ+heSNmoktZrK21rREpnxcEDoPxaJiZ?=
 =?us-ascii?Q?euDgscLhULuSs4swp1XpL+2Pd13wRnp5+F8Gvq2n1W8+YIapDI1qggyYUgJx?=
 =?us-ascii?Q?gbr09DE/aRLhbgmmd/i2T2s8XjgN4p4VMMEAntlfgx+pXrLJxT7mSiUhVin+?=
 =?us-ascii?Q?YNzuWc5kMYBazkQz2y8kRAzfXBHHRymtFOz3Qwy4gtMQ99uMPkZCThs4uPrC?=
 =?us-ascii?Q?LDdIwwP9LspuAptgRMtgJDTWSM7oz/tqV1LP40fO1fn1Yeojn0OTqqVgYrYz?=
 =?us-ascii?Q?Ulgvwqq3LL/zDpj3+wD6/I+J5FNrJPoSTFISccYUq7tHKLb4de57ZV9rLRiU?=
 =?us-ascii?Q?7pdWNHaegsNnPRU2o34xivmXJl3MzCkmCgjKwiTP4fQ5KmugOUU0OcvIG8Ou?=
 =?us-ascii?Q?/S52mursVaPNxeldq/oTNy23MhNHNpkSc52OKRL/U0Aan76lV25/sBYswVUf?=
 =?us-ascii?Q?McDQ/abtf8VHYGj3pBxgx5NABP586yLZ5WsepEzxJ1GfJCpN6KgDthKzV5LY?=
 =?us-ascii?Q?R0ZzTgpKPyjeUS6aSF+S1WS1Uil5iSeS0GzOL5k/q8wQkgM7TKACONN5rnhY?=
 =?us-ascii?Q?fJYmKeIA1NDhPRlm9NRz7ZBXr8l3v0tBe63LaRs2EKn709bGenMOF6VtUsfB?=
 =?us-ascii?Q?YV0mjtZDxjOtNYtEjEdN2KSsaSfrTmDBbokBem98WVSz/V5DB/cQzFunMjLt?=
 =?us-ascii?Q?ny7dBN5PQ5J3D5tddGxQ9LxI04tr4DMCvKYStvRi/tjHNHgYXux4Aad3+Ok5?=
 =?us-ascii?Q?wybhQ1rnikj7vN12cZW+aRC1E8ayHR7u/giCwPCNyxh0lNcdLlv4yGim+JFa?=
 =?us-ascii?Q?OkfifHa3sl0kgut6H27QHZMiapDouxYkNgNUbYOBNnSJRvgGVneeT1hh608a?=
 =?us-ascii?Q?8wPE8ImEkHBELy6pv8awIVlP4t6YqvW2ymIhX9OHbfopOtBHXE6e+NdKZtso?=
 =?us-ascii?Q?iZorswlOoJ++/AmLhoqzV6cGsmmsspUU6zH9+Vr8dHinPGA4CapdkF+bfFGF?=
 =?us-ascii?Q?/t3gCIzE4rB39mfXEyy/rn4mkjJv4qcTYun71yORXGwQBGKuUh+k7hc1GZ5V?=
 =?us-ascii?Q?X+A8Hl+JtC3BEd0h00znJ0l+m7N6UeNjv3gy2ff8k6rENdce5oEP63wLnFSS?=
 =?us-ascii?Q?Nhck42qhky8Lh6jMYm361qTxaidIcYcmIuHvVGjzdNJpwYKJvYEWmFs3XF/x?=
 =?us-ascii?Q?P06GwR4aJBqU3azwhf+JuA5w+qe3f1QrLtSCUV0ur2xKwVQr9iegS+8b9aCA?=
 =?us-ascii?Q?htjDtEaESH3twfsIpFBSBFIE+za3uQbMkvcU/OmfnAjb9868tSyrcjK1bg2B?=
 =?us-ascii?Q?/jovQcQbVlQo6+ESopY7rNYSA7HTCepfNnd2+3IIoZTkIrQ4u4Td3a2VYsQU?=
 =?us-ascii?Q?lpxdEwyeMnC2osYoJcFvwjQItbDIQONfDx5RbJmxDbF++4jlNtQAZYzRrBhC?=
 =?us-ascii?Q?UJ7hh2lWMhZ9vpdD9Eh2rFMI4xwSOusy4bjJKOMZ6a/XSbDuZ0EeY9DQSpSk?=
 =?us-ascii?Q?qC7K0jICjkAYNVFFi93oK2pAR9VqVCqYywa6YNJLlATlI39VOuAGiY9MIUG0?=
 =?us-ascii?Q?7+u/ONcO8wBAsHdE7pz1+SGOtaKPnGx45OwwkB3LHbOHixf+KaSyqerOSfO7?=
 =?us-ascii?Q?2sMScSmlaCzXZE1Nw2/i0N5fQ9O9Evw0JIQam+d7b/BO26c9iTaatZk6QcBh?=
 =?us-ascii?Q?kpC7HVvxKkt3kcvkE6Y1yXeCcK6/S14=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 350f03a5-ba44-42bf-42cb-08df2437ff3a
X-MS-Exchange-CrossTenant-AuthSource: AM6P189MB3107.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 05:58:23.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhgAh4JFdJHvrM6+bLRy/dC0MCkKMBymmkZEmsRiIUxGnNuBc2M7mxwoH9euFOImWO8kywHw19C5pmOxUGs1M/vp940O2SstWkGg2eQml38=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8P189MB1316
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 07 Oct 2026 05:58:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/247370

Overview of changes leading to 14.6.0
Monday, October 5, 2026
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
- Fix shaping failures caused by out-of-range glyph IDs, a regression from
  11.4.0.
- Update experimental beyond-64k support to the final ISO Open Font Format
  5th edition. This support remains disabled by default.
- Add support for the `DMAP` table.
- Support `FeatureVariations` 1.1 lookup variations, including subsetting a=
nd
  instancing.
- Update `VARC` to the revised variation-store format. The new format is
  incompatible with the previous one.
- Various `VARC` fixes.
- Fix background color and stride handling in the experimental raster libra=
ry.
- Improve the experimental Rust shaper (HarfRust) and font functions
  (`fontations`), and update HarfRust to 0.14.
- Various subsetting fixes and improvements.
- Various fixes for malformed fonts.
- Various build and CI fixes.

Signed-off-by: Jaipaul Cheernam <jaipaul.cheernam@est.tech>
---
 .../harfbuzz/{harfbuzz_14.5.1.bb =3D> harfbuzz_14.6.0.bb}         | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-graphics/harfbuzz/{harfbuzz_14.5.1.bb =3D> harfbuzz_14=
.6.0.bb} (96%)

diff --git a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb b/meta/recip=
es-graphics/harfbuzz/harfbuzz_14.6.0.bb
similarity index 96%
rename from meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
rename to meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
index d10f1bfa01..7ef0897a18 100644
--- a/meta/recipes-graphics/harfbuzz/harfbuzz_14.5.1.bb
+++ b/meta/recipes-graphics/harfbuzz/harfbuzz_14.6.0.bb
@@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db98429b8e8e3c2a6=
7cfef01e99e4893d \
                     "
=20
 SRC_URI =3D "${GITHUB_BASE_URI}/download/${PV}/${BPN}-${PV}.tar.xz"
-SRC_URI[sha256sum] =3D "7e2fa4e8c7c98e8d8140671f5772542afaaa6acccfbd746506=
886b6d85f7f8d6"
+SRC_URI[sha256sum] =3D "d07a007327277708a2a73ae437887cdbaf282937f6d03ca546=
7723e9099af586"
=20
 inherit meson pkgconfig lib_package gtk-doc gobject-introspection github-r=
eleases
=20

