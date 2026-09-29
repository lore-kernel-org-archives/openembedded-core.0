Return-Path: <pratik.farkase@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C8DACA5FA5
	for <webhook@archiver.kernel.org>; Tue, 29 Sep 2026 13:35:18 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7970.1790688911348954450
 for <openembedded-core@lists.openembedded.org>;
 Tue, 29 Sep 2026 06:35:11 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@est.tech header.s=selector1 header.b=0Q6ERl9g;
 spf=pass (domain: est.tech, ip: 52.101.65.46, mailfrom: pratik.farkase@est.tech)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oxLoaRIdOdZxDytqGYtmYEWQm995ok1PXwUbxK494t1Ya+nvr70KtPrLyNfRlBI2+DGQluB/7NloLQ0RbFFFB8eJN2P7lqtWrBxduy1rln/RgC7mbuD2Vu18YuswYTvazUmqVHl0E+2k/stmUsLmGmEXVWvDC/owAmKAyg6qN9bTaAtx/5pl2BDuqd8IJyR4L33dH6S/dTAYJyAh21p/Flh0vzmQBMGqmhYeJZ9Mbqb0065+yhHKIW5Azy1H6ACb2nHCJXvjmNzYnlNYD4jJRv0ZpSIQCcMR0xyRszdHZtKHvUwK5RYVaBRTjj4BsM77LdJI3TE4yC5OgQ4AqvB75w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ogwH5MhUqrNgJI0Jj2+xDXU1V+SpuLC4zEGJKzmF+64=;
 b=u+MPgiLJlKe6pz+2ynRkkTK6cY2JYoZlJ85T6jeztmwydxZwkNSw03qyHPmRzehLJUqnv2ypMs6fGLEpslfVfAgU4LsZebR2zfLgYGryFlFExNNHOyvZSyRho/KCAEqFHwaolgQ96zdwfCKdD0hyzWh5bwmF+jSqJ99uPAJuEURnRs3io2ukUaXo/BGFeZX0q/nzGHiqxwwyYsnWWgBp0pJeSMkSRlY/ImYk1Bhq2Abo/RUyYdMKrle6OyeSzGC6x1gwOwoS7vcBt1BeFXo5mGw1ozcIzieJZq41cFFrPi9KobHf/VPv2OuICJhDmuSPYfafaQ20sd1TZohL7Pe/Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=est.tech; dmarc=pass action=none header.from=est.tech;
 dkim=pass header.d=est.tech; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=est.tech; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ogwH5MhUqrNgJI0Jj2+xDXU1V+SpuLC4zEGJKzmF+64=;
 b=0Q6ERl9gumkcpanpouYjRbF57Ng0+ikB2v0n3/I/sX8nKHHflTPnLeXx+uSmpmjiQQsOi/z7MPeo2VFV0HYtTcM42c/8YqgIe+QZB5rNAJaBOFpRAIgLRsMY9wZh4ukjG3WB2dNGCn8dctO52TBzihdg5/ZgqWgHbQyIdVP/JoWcGoi6KZEhltBUxlYndhpPrk4sBtB3AmBI7S69dWlT4PWvTOmN1Li08Tb1oyaJmQODoiZavM09ueHU3PWBKsK3CK2YYXLDjQhIZPv0kG41/s/4LCf9JH2MZKfqEoML/VrW+ADyxXhzw3NPpP2vOkWJgslO/TUUi9oyrClBKBc65Q==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=est.tech;
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM (2603:10a6:102:4d4::5)
 by DB8P189MB0952.EURP189.PROD.OUTLOOK.COM (2603:10a6:10:162::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.26; Tue, 29 Sep
 2026 13:35:07 +0000
Received: from PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91]) by PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 ([fe80::117b:a2e5:ceb1:7a91%6]) with mapi id 15.21.0451.022; Tue, 29 Sep 2026
 13:35:07 +0000
From: Pratik Farkase <pratik.farkase@est.tech>
To: openembedded-core@lists.openembedded.org
CC: yoann.congal@smile.fr,
	pratik.farkase@ericsson.com,
	Pratik Farkase <pratik.farkase@est.tech>
Subject: [OE-core][PATCH] util-linux: update flock test patch Upstream-Status to Backport
Date: Tue, 29 Sep 2026 15:34:54 +0200
Message-ID: <20260929133454.107421-1-pratik.farkase@est.tech>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-ClientProxiedBy: DU7P189CA0009.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:10:552::24) To PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
 (2603:10a6:102:4d4::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3P189MB3239:EE_|DB8P189MB0952:EE_
X-MS-Office365-Filtering-Correlation-Id: 564ed359-3dd1-4564-5619-08df1e2e79dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10067099003|56012099006|11063799006|18002099003;
X-Microsoft-Antispam-Message-Info: 
	lGgHLAbkzasPyww1cd50IcCEOp1jQP5opmtpokmbD+77ZQmagyoj21ZALaOZvsTehI56WBWdGetj5c9MjYWNJzjZAHXhPS/7SgYW1WY5wC8RvdGfVEyi9VyJrC27g4Y6ko0zrC2sei0D5bfBP7r2dpa4as7NvhNSSn8CQgPCSNI5CyNPTl3mo3MAxPMjAEXjUsY44tnLBH3tS0FupCHgSAHF67LBOam0PWYatOLK7pVxCQz8S2tnoLKukhEqsyespsVvq2x4ArKrVT26pzSTyUDlZvqaQ9Z3vy2vVQSzdb/CEaL+6xaIirQ5YZiTXtBsnx/uIdvKB3+Dr/bS6x/wJmS6DKw3VUabSdaJcQy5RSlDsTsxj01az8jZcrQzZ+KDSsRWnlQY4QhQBpyaLbIYQ9Om4XV3W4kdQ9833SRXFOmpH/47JeKVvc510lF66wqDRHXbKZdKkZqNfjU4hY5nnfSbZx2uV2fADyCVMmsGuaG6IqHu5Y0kWyLJCsZqiDRvdmtJ/WFikoPRf051PbF/SH2flr9AtuViExsW0s3jrMfJy7vXx21h7rqndA4wZ1/ii+35zeT8FuGFcl0pviVRMTw6vJn78wFzd5Gj9o5t086Tg2V44kitLI1cA8JdgOyeVRH4ulzn4y3wQF73j4TQvKPRdg7aDUY3Whbfk8vFxFU=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3P189MB3239.EURP189.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10067099003)(56012099006)(11063799006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?OXHNB2yBk0M4cuGlyPu8e6et6CM2B2W20bvdZxeO35bX1G/eXjo1XMe6R0Gf?=
 =?us-ascii?Q?3LB3TJ76M7ZBY2zXglgoWN1f4380qPttdCFZ1mvNXDeX9TBZyICkLlP6WPqG?=
 =?us-ascii?Q?pGIgcsA329lHd3KhOPf/4PvZGm5oyp3hO03ZCPdb8Z/nnUz1vNNgI1ZlTRcB?=
 =?us-ascii?Q?gSVoyHN2SxdZ8RuDkVu8pT8sS8+NIUSEvea5iNf7sTnUBfVcQjrbZndsQV3K?=
 =?us-ascii?Q?gGZhAsMSyCJlBSbj80RWOd6cD+aNMOhmjocSthD9enHcPJ2cVAP+DA0Zt52k?=
 =?us-ascii?Q?L92mB+x++sDBw00gLAlaWJ8vlEkRy/q/nbosyMhPS1hTur6Ikk7QXFQUuHEH?=
 =?us-ascii?Q?ZZ4D2NKKGqFjXsYegMwY8sVy6YUXBIa4OpchNOEMKj6cMOpMd383JqBvXbPs?=
 =?us-ascii?Q?PUSFdSojEPPZSz7Q9wEdfK9i6Fag2UnlSwFnMwLdrU1qB0Hu8aiG0s6iOpjO?=
 =?us-ascii?Q?R+b20j0DylxLKC5zp4sEQuk1TYXy08ypY4Krp7O7cgNmmqWBUykXWMnkhDfu?=
 =?us-ascii?Q?KOVgDe3GUWXO6arVrNcbV7GITfPy7JS0O4f/womlVNhqoHmTXkEmyIMsUPk7?=
 =?us-ascii?Q?2+2T3Xey03xhjhO5W+rb6dKjjdbDRPmOhZNYViB0xLF/l+4rs3dkDCEkcVxL?=
 =?us-ascii?Q?8caMesOc72dcXMDFtC9bhvWv1AFGI8HP1LnTvYWWAnJpfRFlAjmCFynUA9n8?=
 =?us-ascii?Q?2dLWiMavyx/jETeyX32UnOrIrMDXLFb63f4xUO4j+Iazc/GDw1VXna+B2m9m?=
 =?us-ascii?Q?q7Cvttztx7K7qWVSw8HswWKsRWgdOWcJuEzHc+mD3Btf3JYmG1pXPJNramj5?=
 =?us-ascii?Q?bTmyFLL3mUjKnmQ0ZxoLHCvz+Jl2wsTwe+jAE6JhNFCU79Ur69Bu7BDdfOWB?=
 =?us-ascii?Q?VaNqC2pBmaq40zKHYXz78vXY6r2Ti3yh5HTWmZOhMp78V8JQVmVSlCD1TKKl?=
 =?us-ascii?Q?vGfQkP5lNBoLAtjclh6i9uLPq2n3ea91U2uGZf8pf6mcEeQ+gdQQoUWOda8g?=
 =?us-ascii?Q?3J3hkPIVgEVXominHep6u0vEzg0ulEOeEOegoTZkDJiPAM0Lf/wk9VZeNOkj?=
 =?us-ascii?Q?nYvJd2lXVu/TD4G8q8ZRtN0C6ghGuhVPDjfKSpf5WWJ3Kc42ZTRuT1sl0XaG?=
 =?us-ascii?Q?mCvOvsZp5ag8Cu9pj46fK59Io1yMS5kw/XYyKTh9wnxAZ0xqEKZZgkdxxKxH?=
 =?us-ascii?Q?HzbclJcLx0DvphxALYW52nzOJoxxDyWFq96u2gE/GQZausUqPspwSLfnzihb?=
 =?us-ascii?Q?IimSqQhO7P9FyFGD9gvygJx4L0ZRlmAI9E2SR4zXeVY4AyFidrmfU0kbJOHB?=
 =?us-ascii?Q?PLWADVT8G+LlLs6nD04AXZlN11LPgWywrUVyqACRUpEDUGXJwuEyNeviGLvt?=
 =?us-ascii?Q?8j1w70Y3nK/y6QTKqjwkrdq3RSLxAgij3iBuHLHunyfEAji3/WOlYbJN2wxY?=
 =?us-ascii?Q?g6Cle8IcTdYGHi2maUiD7Jr+N8VKe2w7iV6Ph4H4PN7G2eg2U0pWtupod47i?=
 =?us-ascii?Q?M8gsZ7fRYwQ/aqAaF42M/NLjfsi/hoib8f7I5RqDMhoAeoSN7ZkZ/PJXnOEz?=
 =?us-ascii?Q?Qn+OC3ItblAWngANEBE0vIFriDKDZgiY67Rvn5qGFiakF39TSOy1t/EoPMbi?=
 =?us-ascii?Q?ZXrXPLU4ZHk3tJ8enj2cqZi3bbpiH/jKIq4TywVDMNn4IMHfXi24CVzDjv5g?=
 =?us-ascii?Q?D6XbfVzgkRjDrglaONM2dxTfjnhCdAMYRjuEr95REZxaGgyzbQnPEm7VolVW?=
 =?us-ascii?Q?TMty34cTfA=3D=3D?=
X-OriginatorOrg: est.tech
X-MS-Exchange-CrossTenant-Network-Message-Id: 564ed359-3dd1-4564-5619-08df1e2e79dc
X-MS-Exchange-CrossTenant-AuthSource: PA3P189MB3239.EURP189.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 13:35:07.2973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: d2585e63-66b9-44b6-a76e-4f4b217d97fd
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8DAILPwklGOY3GKaifONOJM533tKGKTkMlQemLw/I1QniYLgmVnRCWP/QOPLZToPK4kbMzzLO3M54JkO/KUsxw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8P189MB0952
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 29 Sep 2026 13:35:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/246869

The "wait for flock child" timeout fix has been merged upstream, so update
its Upstream-Status from Submitted to Backport and point it at the upstream
commit.

Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
---
 ...0001-tests-flock-increase-wait-for-flock-child-timeout.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-incre=
ase-wait-for-flock-child-timeout.patch b/meta/recipes-core/util-linux/util-=
linux/0001-tests-flock-increase-wait-for-flock-child-timeout.patch
index 7213b00786..30fc0641f1 100644
--- a/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wai=
t-for-flock-child-timeout.patch
+++ b/meta/recipes-core/util-linux/util-linux/0001-tests-flock-increase-wai=
t-for-flock-child-timeout.patch
@@ -15,7 +15,7 @@ Increase the timeout to 30s. The loop exits as soon as th=
e child
 appears, so this does not slow down fast hosts; it only adds headroom on
 slow/emulated targets.
=20
-Upstream-Status: Submitted [https://github.com/util-linux/util-linux/pull/=
4639]
+Upstream-Status: Backport [https://github.com/util-linux/util-linux/commit=
/ab519f323c620a32b21a0861285f1a4a5591d3dc]
=20
 Signed-off-by: Pratik Farkase <pratik.farkase@est.tech>
 ---
--=20
2.43.0


